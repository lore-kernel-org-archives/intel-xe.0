Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE32C7618D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 08:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790010E73F;
	Tue, 14 Mar 2023 08:59:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318510E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678784353; x=1710320353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Voee69Gkdq9yN2BXRFOoR30IHaFCkRgvYPjHbOWSqPY=;
 b=H+KMiVGXOxhJHOXLO5L9WK8kpQ2xIh8AjnYwqTFrhMIFdwvknObBCY0f
 Joira63BNU0N8PmyVFuRs/IfMxXCEK9zYVo1eCzTwOjvzzSmBOwPQSia1
 Uvnu20SN7J8pfUHz2b1GyVSrazcPALTRgEkNOy3DzgX5LQYGhF0uyRCxs
 limO+YliD44xirsVkRcKCQPVY3q5tWGBlOM8VcP8RuOZSfOpGsJysNBKP
 Tw1Lhzvz932434/kQXI0gk0AGL1rvUYcn9FD2z2tK2QgAeR4OPDUpHZCI
 YwDeCdUF6bGsxRxxL4CyWTKWMBs9EYh0y9T+oVLhjIDqSjmFfsJ1IFQnK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317756245"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317756245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747922707"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="747922707"
Received: from tlambe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.230])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 08:58:41 +0000
Message-Id: <20230314085842.134239-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314085842.134239-1-matthew.auld@intel.com>
References: <20230314085842.134239-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/6] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace the allocation code with the i915 version. This simplifies the
code a little, and importantly we get the accounting at the mgr level,
which is useful for debug (and maybe userspace), plus per resource
tracking so we can easily check if a resource is using one or pages in
the mappable part of vram (useful for eviction), or if the resource is
completely within the mappable portion (useful for checking if the
resource can be safely CPU mapped).

v2: Fix missing PAGE_SHIFT

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 201 ++++++++++-----------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
 4 files changed, 118 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 8759c13acd9b..de7dcb5fa577 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -135,7 +135,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
 	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	u64 stolen_size, pgsize;
+	u64 stolen_size, io_size, pgsize;
 	int err;
 
 	if (IS_DGFX(xe))
@@ -154,7 +154,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	if (pgsize < PAGE_SIZE)
 		pgsize = PAGE_SIZE;
 
-	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
+	/*
+	 * We don't try to attempt partial visible support for stolen vram,
+	 * since stolen is always at the end of vram, and the BAR size is pretty
+	 * much always 256M, with small-bar.
+	 */
+	io_size = 0;
+	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
+		io_size = stolen_size;
+
+	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
+				     io_size, pgsize);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
 		return;
@@ -163,8 +173,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
 		    stolen_size);
 
-	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
-		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
+	if (io_size)
+		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
 }
 
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index bafcadaed6b0..a110cf1a15e2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -49,45 +49,26 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	u64 max_bytes, cur_size, min_block_size;
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
-	u64 size, remaining_size, lpfn, fpfn;
 	struct drm_buddy *mm = &mgr->mm;
-	unsigned long pages_per_block;
-	int r;
-
-	lpfn = (u64)place->lpfn << PAGE_SHIFT;
-	if (!lpfn || lpfn > man->size)
-		lpfn = man->size;
-
-	fpfn = (u64)place->fpfn << PAGE_SHIFT;
+	u64 size, remaining_size, min_page_size;
+	unsigned long lpfn;
+	int err;
 
-	max_bytes = mgr->manager.size;
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		pages_per_block = ~0ul;
-	} else {
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		pages_per_block = HPAGE_PMD_NR;
-#else
-		/* default to 2MB */
-		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
-#endif
-
-		pages_per_block = max_t(uint32_t, pages_per_block,
-					tbo->page_alignment);
-	}
+	lpfn = place->lpfn;
+	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
+		lpfn = man->size >> PAGE_SHIFT;
 
 	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
 	if (!vres)
 		return -ENOMEM;
 
 	ttm_resource_init(tbo, place, &vres->base);
-	remaining_size = vres->base.size;
 
 	/* bail out quickly if there's likely not enough VRAM for this BO */
-	if (ttm_resource_manager_usage(man) > max_bytes) {
-		r = -ENOSPC;
+	if (ttm_resource_manager_usage(man) > man->size) {
+		err = -ENOSPC;
 		goto error_fini;
 	}
 
@@ -96,95 +77,91 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
-	if (fpfn || lpfn != man->size)
-		/* Allocate blocks in desired range */
+	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-	mutex_lock(&mgr->lock);
-	while (remaining_size) {
-		if (tbo->page_alignment)
-			min_block_size = tbo->page_alignment << PAGE_SHIFT;
-		else
-			min_block_size = mgr->default_page_size;
-
-		XE_BUG_ON(min_block_size < mm->chunk_size);
-
-		/* Limit maximum size to 2GiB due to SG table limitations */
-		size = min(remaining_size, 2ULL << 30);
-
-		if (size >= pages_per_block << PAGE_SHIFT)
-			min_block_size = pages_per_block << PAGE_SHIFT;
-
-		cur_size = size;
-
-		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
-			/*
-			 * Except for actual range allocation, modify the size and
-			 * min_block_size conforming to continuous flag enablement
-			 */
-			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-				size = roundup_pow_of_two(size);
-				min_block_size = size;
-			/*
-			 * Modify the size value if size is not
-			 * aligned with min_block_size
-			 */
-			} else if (!IS_ALIGNED(size, min_block_size)) {
-				size = round_up(size, min_block_size);
-			}
-		}
+	XE_BUG_ON(!vres->base.size);
+	size = vres->base.size;
 
-		r = drm_buddy_alloc_blocks(mm, fpfn,
-					   lpfn,
-					   size,
-					   min_block_size,
-					   &vres->blocks,
-					   vres->flags);
-		if (unlikely(r))
-			goto error_free_blocks;
+	min_page_size = mgr->default_page_size;
+	if (tbo->page_alignment)
+		min_page_size = tbo->page_alignment << PAGE_SHIFT;
 
-		if (size > remaining_size)
-			remaining_size = 0;
-		else
-			remaining_size -= size;
+	XE_BUG_ON(min_page_size < mm->chunk_size);
+	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
+	XE_BUG_ON(size > SZ_2G &&
+		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
+	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
+
+	if (place->fpfn + (vres->base.size >> PAGE_SHIFT) != place->lpfn &&
+	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		unsigned long pages;
+
+		size = roundup_pow_of_two(size);
+		min_page_size = size;
+
+		pages = size >> ilog2(mm->chunk_size);
+		if (pages > lpfn)
+			lpfn = pages;
 	}
-	mutex_unlock(&mgr->lock);
 
-	if (cur_size != size) {
-		struct drm_buddy_block *block;
-		struct list_head *trim_list;
-		u64 original_size;
-		LIST_HEAD(temp);
+	if (size > lpfn << PAGE_SHIFT) {
+		err = -E2BIG; /* don't trigger eviction */
+		goto error_fini;
+	}
 
-		trim_list = &vres->blocks;
-		original_size = vres->base.size;
+	mutex_lock(&mgr->lock);
+	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
+		mutex_unlock(&mgr->lock);
+		err = -ENOSPC;
+		goto error_fini;
+	}
 
+	remaining_size = size;
+	do {
 		/*
-		 * If size value is rounded up to min_block_size, trim the last
-		 * block to the required size
+		 * Limit maximum size to 2GiB due to SG table limitations.
+		 * FIXME: Should maybe be handled as part of sg construction.
 		 */
-		if (!list_is_singular(&vres->blocks)) {
-			block = list_last_entry(&vres->blocks, typeof(*block), link);
-			list_move_tail(&block->link, &temp);
-			trim_list = &temp;
-			/*
-			 * Compute the original_size value by subtracting the
-			 * last block size with (aligned size - original size)
-			 */
-			original_size = drm_buddy_block_size(mm, block) -
-				(size - cur_size);
-		}
+		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
+
+		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
+					     (u64)lpfn << PAGE_SHIFT,
+					     alloc_size,
+					     min_page_size,
+					     &vres->blocks,
+					     vres->flags);
+		if (err)
+			goto error_free_blocks;
 
-		mutex_lock(&mgr->lock);
-		drm_buddy_block_trim(mm,
-				     original_size,
-				     trim_list);
-		mutex_unlock(&mgr->lock);
+		remaining_size -= alloc_size;
+	} while (remaining_size);
 
-		if (!list_empty(&temp))
-			list_splice_tail(trim_list, &vres->blocks);
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
+			size = vres->base.size;
 	}
 
+	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
+		vres->used_visible_size = size;
+	} else {
+		struct drm_buddy_block *block;
+
+		list_for_each_entry(block, &vres->blocks, link) {
+			u64 start = drm_buddy_block_offset(block);
+
+			if (start < mgr->visible_size) {
+				u64 end = start + drm_buddy_block_size(mm, block);
+
+				vres->used_visible_size +=
+					min(end, mgr->visible_size) - start;
+			}
+		}
+	}
+
+	mgr->visible_avail -= vres->used_visible_size;
+	mutex_unlock(&mgr->lock);
+
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
 	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
 		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
@@ -213,7 +190,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	ttm_resource_fini(man, &vres->base);
 	kfree(vres);
 
-	return r;
+	return err;
 }
 
 static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
@@ -226,6 +203,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 
 	mutex_lock(&mgr->lock);
 	drm_buddy_free_list(mm, &vres->blocks);
+	mgr->visible_avail += vres->used_visible_size;
 	mutex_unlock(&mgr->lock);
 
 	ttm_resource_fini(man, res);
@@ -240,6 +218,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 	struct drm_buddy *mm = &mgr->mm;
 
 	mutex_lock(&mgr->lock);
+	drm_printf(printer, "default_page_size: %lluKiB\n",
+		   mgr->default_page_size >> 10);
+	drm_printf(printer, "visible_avail: %lluMiB\n",
+		   (u64)mgr->visible_avail >> 20);
+	drm_printf(printer, "visible_size: %lluMiB\n",
+		   (u64)mgr->visible_size >> 20);
+
 	drm_buddy_print(mm, printer);
 	mutex_unlock(&mgr->lock);
 	drm_printf(printer, "man size:%llu\n", man->size);
@@ -262,6 +247,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
+
 	drm_buddy_fini(&mgr->mm);
 
 	ttm_resource_manager_cleanup(&mgr->manager);
@@ -270,7 +257,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 }
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 default_page_size)
+			   u32 mem_type, u64 size, u64 io_size,
+			   u64 default_page_size)
 {
 	struct ttm_resource_manager *man = &mgr->manager;
 	int err;
@@ -279,6 +267,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	mgr->mem_type = mem_type;
 	mutex_init(&mgr->lock);
 	mgr->default_page_size = default_page_size;
+	mgr->visible_size = io_size;
+	mgr->visible_avail = io_size;
 
 	ttm_resource_manager_init(man, &xe->ttm, size);
 	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
@@ -298,7 +288,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
 	mgr->gt = gt;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
-				      gt->mem.vram.size, PAGE_SIZE);
+				      gt->mem.vram.size, gt->mem.vram.io_size,
+				      PAGE_SIZE);
 }
 
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 78f332d26224..35e5367a79fb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -13,7 +13,8 @@ struct xe_device;
 struct xe_gt;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 default_page_size);
+			   u32 mem_type, u64 size, u64 io_size,
+			   u64 default_page_size);
 int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 39aa2ec1b968..3d9417ff7434 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
+	/** @visible_size: Proped size of the CPU visible portion */
+	u64 visible_size;
+	/** @visible_avail: CPU visible portion still unallocated */
+	u64 visible_avail;
 	/** @default_page_size: default page size */
 	u64 default_page_size;
 	/** @lock: protects allocations of VRAM */
@@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
 	struct ttm_resource base;
 	/** @blocks: list of DRM buddy blocks */
 	struct list_head blocks;
+	/** @used_visible_size: How many CPU visible bytes this resource is using */
+	u64 used_visible_size;
 	/** @flags: flags associated with the resource */
 	unsigned long flags;
 };
-- 
2.39.2

