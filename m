Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4846C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEEE10E49E;
	Wed, 26 Jul 2023 16:10:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD1B10E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcis0BjcWkVPQce2xwNipfT3Hoy+v9kKmV1A6glREVw=;
 b=NJq7zUcxl/InY0Z2fMY7qBVt7PkPc+C27RZLwb2tQ+mjHm43QpSiaYwa
 /JLCK74KHFSX3ruD9lG/fsk6hl6zrl/nWdklOgV4ck88IlGFpDIunPomq
 +l4cGdsvYVsMQP1XpsoWcG4ZtiZTS2/tNXaIIsjS/eQE3D4ILIHCNkii+
 bnkuVVmMryYdYA/PCe0wnInexumNO54wwr63iJHC2ndYXHbhSK/wEFV9s
 GJ7aRL9odOfXAMFefzxFqUN54MVXPQ9evgz4z/s77GCkBHBVq/athGbQR
 ZVQriQuOWbz4ysQBtvp3PV4rf53XTwQFmdnvxvjT+3qcZa9NN6uMnZ+EZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994899"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994899"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279365"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279365"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:03 -0700
Message-Id: <20230726160708.3967790-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/10] drm/xe: Decouple vram check from
 xe_bo_addr()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The output arg is_vram in xe_bo_addr() is unused by several callers.
It's also not what the function is mainly doing. Remove the argument and
let the interested callers to call xe_bo_is_vram().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c |  4 +---
 drivers/gpu/drm/xe/xe_bo.c                 | 15 +++++----------
 drivers/gpu/drm/xe/xe_bo.h                 | 10 +++-------
 drivers/gpu/drm/xe/xe_ggtt.c               |  5 ++---
 drivers/gpu/drm/xe/xe_migrate.c            | 16 ++++------------
 drivers/gpu/drm/xe/xe_pt.c                 | 10 +++-------
 drivers/gpu/drm/xe/xe_vm.c                 | 10 ++++++----
 7 files changed, 24 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index a4f30773e314..f38d5c114a9d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -369,14 +369,12 @@ static int intelfb_create(struct drm_fb_helper *helper,
 
 #else
 	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
-		bool lmem;
-
 		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
 			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6a96cb0689c4..29813271cc4c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1516,12 +1516,11 @@ int xe_bo_pin(struct xe_bo *bo)
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
-		bool vram;
 
 		if (mem_type_is_vram(place->mem_type)) {
 			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
-			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
+			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 
@@ -1646,8 +1645,7 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
  * address, such as printing debug information, but not in cases where memory is
  * written based on this result.
  */
-dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
-		      size_t page_size, bool *is_vram)
+dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 {
 	struct xe_res_cursor cur;
 	u64 page;
@@ -1656,9 +1654,7 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
 	page = offset >> PAGE_SHIFT;
 	offset &= (PAGE_SIZE - 1);
 
-	*is_vram = xe_bo_is_vram(bo);
-
-	if (!*is_vram && !xe_bo_is_stolen(bo)) {
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
 		XE_BUG_ON(!bo->ttm.ttm);
 
 		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
@@ -1673,12 +1669,11 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
 	}
 }
 
-dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
-		      size_t page_size, bool *is_vram)
+dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 {
 	if (!READ_ONCE(bo->ttm.pin_count))
 		xe_bo_assert_held(bo);
-	return __xe_bo_addr(bo, offset, page_size, is_vram);
+	return __xe_bo_addr(bo, offset, page_size);
 }
 
 int xe_bo_vmap(struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 3fed3e18c223..894ea0deb34b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -207,17 +207,13 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 }
 
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
-dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
-		      size_t page_size, bool *is_vram);
-dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
-		      size_t page_size, bool *is_vram);
+dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
+dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 
 static inline dma_addr_t
 xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 {
-	bool is_vram;
-
-	return xe_bo_addr(bo, 0, page_size, &is_vram);
+	return xe_bo_addr(bo, 0, page_size);
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e1b84bc25375..f57dd8703d93 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -31,12 +31,11 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
-	bool is_vram;
 
-	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
+	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT;
 
-	if (is_vram)
+	if (xe_bo_is_vram(bo))
 		pte |= XE_GGTT_PTE_LM;
 
 	/* FIXME: vfunc + pass in caching rules */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3c7d5cfd30bc..2a4b22c3a024 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -132,7 +132,6 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 	struct xe_device *xe = vm->xe;
 	size_t cleared_size;
 	u64 vram_addr;
-	bool is_vram;
 
 	if (!xe_device_has_flat_ccs(xe))
 		return 0;
@@ -147,8 +146,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 		return PTR_ERR(m->cleared_bo);
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
-	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
-	XE_BUG_ON(!is_vram);
+	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
 	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
 
 	return 0;
@@ -221,15 +219,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			level++;
 		}
 	} else {
-		bool is_vram;
-		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE, &is_vram);
+		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
 
 		if (xe->info.supports_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
-			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
-						&is_vram);
+			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
 		}
 	}
@@ -1000,12 +996,8 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 */
 	XE_BUG_ON(update->qwords > 0x1ff);
 	if (!ppgtt_ofs) {
-		bool is_vram;
-
 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE,
-							   &is_vram));
-		XE_BUG_ON(!is_vram);
+							   XE_PAGE_SIZE));
 	}
 
 	do {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ac01bc42e54f..38ccc96c4584 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -61,13 +61,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 		  const enum xe_cache_level level)
 {
 	u64 pde;
-	bool is_vram;
 
-	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
+	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
-	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
-
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
 
 	if (level != XE_CACHE_NONE)
@@ -128,10 +125,9 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 		  u32 pt_level)
 {
 	u64 pte;
-	bool is_vram;
 
-	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
-	if (is_vram)
+	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+	if (xe_bo_is_vram(bo))
 		pte |= XE_PPGTT_PTE_LM;
 
 	return __pte_encode(pte, cache, NULL, pt_level);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6429d6e5113d..87f32cfc475a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3497,9 +3497,10 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		return 0;
 	}
 	if (vm->pt_root[gt_id]) {
-		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE,
-				  &is_vram);
-		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
+		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
+		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
+		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
+			   is_vram ? "VRAM" : "SYS");
 	}
 
 	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
@@ -3520,7 +3521,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 				addr = 0;
 			}
 		} else {
-			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
+			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
+			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
 			   xe_vma_start(vma), xe_vma_end(vma) - 1,
-- 
2.40.1

