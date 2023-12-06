Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E33C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379810E774;
	Wed,  6 Dec 2023 17:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410F710E117
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701882865; x=1733418865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/F/VV2mgOIqp8ZiD7BVl+rRqzvch9KRxoL5y2m+lyI=;
 b=FhVmzo9/9QwE2qgDB2KGktjQ7UiFnPFtPW0dnuZ7HGiHcNhwT8e611xe
 boDP4O6fMo5tdLKNh0JHMtvrwgNl0GOmXssCb+4LfkbN58u9xsdTpciLY
 t9xJOjk5jVYYCyJXy5dhzc2TfZ/UPn9YUxnPLNRSIF8DjTDSVtiw7Br5P
 3GBX4VtYR10JpWD4RnifVB8t9OWdwsDrzNbUuOdjuBbRJJTqw0LuqFpU1
 6l/hkIZ5sf+ykHTCeJPF9BrGgaVoehc66VHpNpmpoHdUJWPEazCxjEuVB
 ij/EaEmOFmxud7A5Tb2D8Ngzh15LctE2gkxS+5wbOBoswOkj1OxT+bO7r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391262424"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="391262424"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018632063"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018632063"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 09:12:48 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 22:50:22 +0530
Message-Id: <20231206172027.1184366-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
References: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 4/9] drm/xe/xe_migrate: Use NULL 1G PTE mapped
 at 255GiB VA for ccs clear
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

Get rid of the cleared bo, instead use null 1G PTE mapped at 255GiB
offset, this can be used for both dgfx and igfx.

v2:
 - Remove xe_migrate::cleared_bo.
 - Add a comment for NULL mapping.(Thomas)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 65 ++++++---------------------------
 1 file changed, 11 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7ef068451b59..b4dd1b6d78f0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -46,16 +46,12 @@ struct xe_migrate {
 	struct mutex job_mutex;
 	/** @pt_bo: Page-table buffer object. */
 	struct xe_bo *pt_bo;
-	/**
-	 * @cleared_bo: Zeroed out bo used as a source for CCS metadata clears
-	 */
-	struct xe_bo *cleared_bo;
 	/** @batch_base_ofs: VM offset of the migration batch buffer */
 	u64 batch_base_ofs;
 	/** @usm_batch_base_ofs: VM offset of the usm batch buffer */
 	u64 usm_batch_base_ofs;
-	/** @cleared_vram_ofs: VM offset of @cleared_bo. */
-	u64 cleared_vram_ofs;
+	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
+	u64 cleared_mem_ofs;
 	/**
 	 * @fence: dma-fence representing the last migration job batch.
 	 * Protected by @job_mutex.
@@ -93,13 +89,9 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 
 	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
-	if (m->cleared_bo)
-		xe_bo_unpin(m->cleared_bo);
 	xe_vm_unlock(m->q->vm);
 
 	dma_fence_put(m->fence);
-	if (m->cleared_bo)
-		xe_bo_put(m->cleared_bo);
 	xe_bo_put(m->pt_bo);
 	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
@@ -125,41 +117,6 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
-/*
- * For flat CCS clearing we need a cleared chunk of memory to copy from,
- * since the CCS clearing mode of XY_FAST_COLOR_BLT appears to be buggy
- * (it clears on only 14 bytes in each chunk of 16).
- * If clearing the main surface one can use the part of the main surface
- * already cleared, but for clearing as part of copying non-compressed
- * data out of system memory, we don't readily have a cleared part of
- * VRAM to copy from, so create one to use for that case.
- */
-static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
-{
-	struct xe_tile *tile = m->tile;
-	struct xe_device *xe = vm->xe;
-	size_t cleared_size;
-	u64 vram_addr;
-
-	if (!xe_device_has_flat_ccs(xe))
-		return 0;
-
-	cleared_size = xe_device_ccs_bytes(xe, MAX_PREEMPTDISABLE_TRANSFER);
-	cleared_size = PAGE_ALIGN(cleared_size);
-	m->cleared_bo = xe_bo_create_pin_map(xe, tile, vm, cleared_size,
-					     ttm_bo_type_kernel,
-					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					     XE_BO_CREATE_PINNED_BIT);
-	if (IS_ERR(m->cleared_bo))
-		return PTR_ERR(m->cleared_bo);
-
-	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
-	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
-	m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
-
-	return 0;
-}
-
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm)
 {
@@ -170,7 +127,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
 	u64 entry;
-	int ret;
 
 	/* Can't bump NUM_PT_SLOTS too high */
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
@@ -190,12 +146,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	ret = xe_migrate_create_cleared_bo(m, vm);
-	if (ret) {
-		xe_bo_put(bo);
-		return ret;
-	}
-
 	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
@@ -265,6 +215,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			  (i + 1) * 8, u64, entry);
 	}
 
+	/* Set up a 1GiB NULL mapping at 255GiB offset. */
+	level = 2;
+	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
+		  vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0)
+		  | XE_PTE_NULL);
+	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
+
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pos, ofs, flags;
@@ -618,7 +575,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * Otherwise if the bo doesn't have any CCS metadata attached,
 		 * we still need to clear it for security reasons.
 		 */
-		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
+		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
 
 		emit_copy_ccs(gt, bb,
 			      dst_ofs, true,
@@ -1006,7 +963,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 			   clear_vram);
 		if (xe_device_has_flat_ccs(xe) && clear_vram) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
-				      m->cleared_vram_ofs, false, clear_L0);
+				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
 		}
 
-- 
2.25.1

