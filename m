Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C1E95375
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 10:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5258310E1A0;
	Wed,  4 Feb 2026 10:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCV7qkOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAA610E066;
 Wed,  4 Feb 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202026; x=1801738026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7m3lL/Su6HWD8RUaWgftAo9PDPnTw4uPSEQc4VBhyl4=;
 b=RCV7qkOUUh088RRbWBNZLfmt5hlGZQ3JWEbUs7SEWPCfPRazzN8fBTEY
 oAp1C0geGpRuTr/pmNNeHiS7BRpciF5yRKYOod3iO69Vy3l3t8Qx6BR1+
 K7YsEo16OxY+TVSSQ02a6DbQ6FBsnbA8NeL8EV/XJaQFLv337vXYKQDvQ
 XwpyaOhTg1V1IvQd6Op3YMSf8OlNPsPTp9o64e4Cy8zacLhkP310AYLJQ
 Vwi/GmCX8n0mf4MONM9dShCVKDO/8IULHYDpiRX7YjK1TibfCjW1tARqU
 sD3inHuLTyxE1Dq5S957pEULsYGLDQIATtjjjw+hD8puCAHMwsI1SeCUr w==;
X-CSE-ConnectionGUID: 7BWPNsrFS2+NToamL6RtzQ==
X-CSE-MsgGUID: rIfoombbTWirYkUDbCDAnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94039255"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="94039255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:06 -0800
X-CSE-ConnectionGUID: c2TuS9iqSQ66vBjEBsC3hA==
X-CSE-MsgGUID: MSXPW6GdRO6mqhketIzuPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209926621"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:04 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] drm/buddy: Documentation and internal helper cleanup
Date: Wed,  4 Feb 2026 16:13:44 +0530
Message-ID: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
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

This series improves the DRM buddy allocator by adding missing
documentation and cleaning up internal helpers.

It adds kernel-doc for the allocator structures and flags, covering
drm_buddy, drm_buddy_block, and the allocation flags (RANGE, TOPDOWN,
CONTIGUOUS, CLEAR, TRIM_DISABLE) to make the allocator’s design and usage
clearer for readers and contributors.

It also reduces the header surface by moving internal helpers from
drm_buddy.h into drm_buddy.c as static functions, since they have no
external users, and removes drm_get_buddy(), an unused exported wrapper
around the internal __get_buddy() helper. This clarifies the intended API
and avoids exporting unused symbols.

No functional changes.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Move internal helpers to drm_buddy.c
  drm/buddy: Add kernel-doc for allocator structures and flags

 drivers/gpu/drm/drm_buddy.c |  41 ++++++----
 include/drm/drm_buddy.h     | 149 ++++++++++++++++++++++++------------
 2 files changed, 126 insertions(+), 64 deletions(-)

-- 
2.52.0

