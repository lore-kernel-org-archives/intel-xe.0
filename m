Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993C0D767F6
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6CB10E90C;
	Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F34zPRqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2CE10E90D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398225; x=1761934225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7v3Ky94xOb1AXbp2h2GE4PRONHaeg3J2llHUg9I8oAQ=;
 b=F34zPRqQ/Zx9lIRDoI9imfP2NlpduwjtTJ/ZwBZLgs8rFeVgE0VvddEu
 J8bnCl/42FYmUV959j7ZdrxWO1leEIRk1MX+WxcaZBR0DNE7czGAm/vsq
 gPllkzpFrdOxg8ND+GjpWgmyPhjwbSh2COg3yfTWhp1SSFQZoxjhNdDad
 aH5jjoo7XpK9W3R7AJAoF0GwMqqd1alultCK1PaEhoZj2GiwadsL+CQQ9
 3xGcwO2i9zkH9Z3/m8KWRDGLxV6PfgiqGjhkZsTmzhqOaLYkM5Ik7S6km
 ko6ELjrCjVa7LIgZlgKraWSsgNAK6Cl0vh3Vgjp0eUxrCnFSBzhft5gW9 w==;
X-CSE-ConnectionGUID: a6DeQqH5SK6JLvhUtFLdkg==
X-CSE-MsgGUID: EeeP/P86RpCTDHHsvFAACw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255874"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255874"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:23 -0700
X-CSE-ConnectionGUID: PAXjHkqZTrqgYGSHRWzwDA==
X-CSE-MsgGUID: W661uv0XRJO34PsyN2eftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637587"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 8/8] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
Date: Thu, 31 Oct 2024 11:10:48 -0700
Message-Id: <20241031181048.2948948-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
unless we are certain the BO is contiguous.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0cb014aba699..e1cbe1d5acef 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -162,6 +162,15 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 	}
 }
 
+static bool force_contiguous(u32 bo_flags)
+{
+	/*
+	 * For eviction / restore on suspend / resume objects pinned in VRAM
+	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
+	 */
+	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -175,12 +184,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	xe_assert(xe, vram && vram->usable_size);
 	io_size = vram->io_size;
 
-	/*
-	 * For eviction / restore on suspend / resume objects
-	 * pinned in VRAM must be contiguous
-	 */
-	if (bo_flags & (XE_BO_FLAG_PINNED |
-			XE_BO_FLAG_GGTT))
+	if (force_contiguous(bo_flags))
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (io_size < vram->usable_size) {
@@ -212,8 +216,7 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
-			.flags = bo_flags & (XE_BO_FLAG_PINNED |
-					     XE_BO_FLAG_GGTT) ?
+			.flags = force_contiguous(bo_flags) ?
 				TTM_PL_FLAG_CONTIGUOUS : 0,
 		};
 		*c += 1;
@@ -2026,13 +2029,15 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 
 int xe_bo_vmap(struct xe_bo *bo)
 {
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	void *virtual;
 	bool is_iomem;
 	int ret;
 
 	xe_bo_assert_held(bo);
 
-	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
+	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) ||
+			!force_contiguous(bo->flags)))
 		return -EINVAL;
 
 	if (!iosys_map_is_null(&bo->vmap))
-- 
2.34.1

