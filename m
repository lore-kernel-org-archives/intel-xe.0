Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E937EB5967
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 05:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A60810E17A;
	Wed, 11 Feb 2026 05:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYnQ0FR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE43E10E093;
 Wed, 11 Feb 2026 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788115; x=1802324115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bh0NlbbVnKZb4a5UTsDOvuqt8Wo0Ooal+RmJgx3HKY0=;
 b=cYnQ0FR1sKLsgZqiPaMN/jT1MonzCm+Ly7F7ZWyB4uQV1ZlEZr5qa9HB
 AZAZLtnKV7VtNheYG6iMmzOmmqTFmk1bWga/ONhIaEnPOUj0j7nCPMjnw
 hz0ID0rvffTUHanpC2thkNSnG3esxmRR9vj32qk96/j8s/hDbmu5yzNfD
 9CfKy3krBhFyMp5zTSyTRgPMpI2tMxjHrdOcikx+wl9sZCs4kNi13lWM0
 N6rWDASoTQLL4Q1S3Mk+tplLRR00c2ioDWyHguWpLGHXMz1274DtysBWm
 O1G13ScfZ8y+9ZTCvnffZOezwYOoT9vqvRTC1mH8lMVTsPP9giqxG3yGM A==;
X-CSE-ConnectionGUID: MS8tDMbsQ3CjfQpF3zu0Hg==
X-CSE-MsgGUID: aBcYwpqvS0SEjGE0j0kBAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82248050"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82248050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:14 -0800
X-CSE-ConnectionGUID: Q1Rdjzh9Q2K7YprVqMEk3g==
X-CSE-MsgGUID: e8GQjo+kSOygk2rdMMvX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211464601"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:11 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] drm/buddy: Documentation and internal helper cleanup
Date: Wed, 11 Feb 2026 11:01:24 +0530
Message-ID: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
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

This series improves the GPU buddy allocator by adding missing
documentation and cleaning up internal helpers.

It adds kernel-doc for the allocator structures and flags, covering
gpu_buddy, gpu_buddy_block, and the allocation flags (RANGE, TOPDOWN,
CONTIGUOUS, CLEAR, TRIM_DISABLE) to make the allocator’s design and usage
clearer for readers and contributors.

It also reduces the header surface by moving internal helpers from
gpu_buddy.h into buddy.c as static functions, since they have no
external users, and removes gpu_get_buddy(), an unused exported wrapper
around the internal __get_buddy() helper. This clarifies the intended API
and avoids exporting unused symbols.

No functional changes.

v2:
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Keep gpu_buddy_block_is_free() in header since it's now
  used by drm_buddy.c
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
- Updated commit message and cover letter to reflect changes

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Add kernel-doc for allocator structures and flags
  drm/buddy: Move internal helpers to buddy.c

 drivers/gpu/buddy.c       |  35 ++++-----
 include/linux/gpu_buddy.h | 147 +++++++++++++++++++++++++++-----------
 2 files changed, 122 insertions(+), 60 deletions(-)

-- 
2.52.0

