Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9E1C44503
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8B10E74D;
	Wed, 21 Jan 2026 11:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao0lJYF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9110E74D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768994191; x=1800530191;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MG9XxH5ZBJrul0ukz4XSN9n7PwzKvXnuCGNiYLZ0a3Q=;
 b=Ao0lJYF401uGB4y+SZjBiWcNBo6bIy2ki4vGPQl/cBN/tQ8rqgdfRhu+
 AWncURjD9B4Cz0O37ioGw3K1XPC9QEV1XLt/EwvHnOw5ozBdXLr3EVi9Z
 SkxNTcfukya5Og/wdMW132E0wcZuzMJB0JP4lVoeEUgZyIcJ4d6JDKca4
 xHt3A26q4BJQ59vvLxE1qbUoYC2LxEahuBgxxY2xBkgdlw+z4CAGCTlay
 B0s/90YbX3RwJpuMzzQTzlf/6FctT0eq9y+LNuI+7FPNs/HNAoI0rshe0
 4d/wAQ8THFeFEys3HYyzLk+rpxuG6j0aDfMrzXFHLH1yKAFevbhG1KzbL A==;
X-CSE-ConnectionGUID: lv26157GT0SL6/CPW9+5dQ==
X-CSE-MsgGUID: prwdbYhASkStvwa60Sjf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70312019"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70312019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:16:31 -0800
X-CSE-ConnectionGUID: rMkcAtX+RUaGd9ipZD8LNw==
X-CSE-MsgGUID: IXLm2bK/Saymo/1g1hlBQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206236583"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:16:30 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous
 allocations
Date: Wed, 21 Jan 2026 16:44:17 +0530
Message-ID: <20260121111416.3104399-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

The VRAM/stolen memory managers do not currently set
DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
this flag activates the buddy allocator's try_harder path, which helps
handle fragmented memory scenarios.

This enables the __alloc_contig_try_harder fallback in the buddy
allocator, allowing contiguous allocation requests to succeed even when
memory is fragmented by combining allocations from both(RHS and LHS)
sides of a large free block.

v2: (Matt B)
- Remove redundant logic for rounding allocation size and trimming when
  TTM_PL_FLAG_CONTIGUOUS is set, since drm_buddy now handles this when
  DRM_BUDDY_CONTIGUOUS_ALLOCATION is enabled

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 6553a19f7cf2..d6aa61e55f4d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -81,6 +81,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
@@ -110,25 +113,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
-	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		size = roundup_pow_of_two(size);
-		min_page_size = size;
-
-		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
-	}
-
 	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
 				     (u64)lpfn << PAGE_SHIFT, size,
 				     min_page_size, &vres->blocks, vres->flags);
 	if (err)
 		goto error_unlock;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
-			size = vres->base.size;
-	}
-
 	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
 		vres->used_visible_size = size;
 	} else {
-- 
2.52.0

