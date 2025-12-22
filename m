Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F1E6748D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 06:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56310E0D5;
	Mon, 22 Dec 2025 06:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUUp8duj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329D10E0D5;
 Mon, 22 Dec 2025 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766386570; x=1797922570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LGHstNW54ahZU4fQFa6p0E4h5sTWTOZs9QUffMMaT6A=;
 b=OUUp8duj5avvOjsUCXQqG3bPud25RflOjjUfgf/sZQ1cKaEqJhAofXrH
 fE7gg4uPYl/UyQlCgWOoY8e0et/GqtL0jnrG389YGCmCkgzFQfXasFFdi
 j3wpEESrMTpm5+d65Thw8EHbdx/nJExaz/WI5rhpx73y8ya/jFTAmEjhj
 UdvWDBvZZMBSr1UW8BUX8yYhXU4MBTGh8c+gxOzdN5WoGuQk2NPtqLkz0
 34ibaWkV3VySlWpa4/afWDPvpFwpGePpgjh+YWJqeiFFijvoIPjyrjf+r
 d/TkP9ONLOXyMeIXw47ZgrALhmrWZsaRtxJwf+b3EUd1jh01IVP2wamsI g==;
X-CSE-ConnectionGUID: TgS6UgM8SfaBkPyJxOm+Kg==
X-CSE-MsgGUID: dkEO31xTTbWWiM3CM3LDCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55814291"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="55814291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:09 -0800
X-CSE-ConnectionGUID: +rOCopBVTEies29m9RfbDg==
X-CSE-MsgGUID: qSzMvZVlS4uZlcHnyBkAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="198688075"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:08 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] drm/buddy: Fix BUG_ON from oversized rounded allocations
Date: Mon, 22 Dec 2025 12:22:39 +0530
Message-ID: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series addresses a crash in drm_buddy allocator when allocation
requests exceed mm->max_order after rounding operations. This can occur
with non-power-of-two VRAM sizes (e.g., 10G = 8G + 2G roots) where
mm->max_order represents the largest block (8G).

The issue manifests in two scenarios:

1. CONTIGUOUS allocations: roundup_pow_of_two(9G) = 16G > 10G
2. Large min_block_size: round_up(9G, 8G) = 16G > 10G

Both cases trigger BUG_ON(order > mm->max_order) deep in the allocation
path, crashing the system on invalid user input.

The fix validates the rounded size early and handles it appropriately:
- For CONTIGUOUS-only allocations, use the existing try_harder fallback
- For other cases (non-contiguous, or contiguous+range), return -EINVAL

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Prevent BUG_ON by validating rounded allocation
  drm/tests/drm_buddy: Add tests for allocations exceeding max_order

 drivers/gpu/drm/drm_buddy.c            |  9 +++++++
 drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.52.0

