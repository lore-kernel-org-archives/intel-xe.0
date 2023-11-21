Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1287FC54FB9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 09:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC7210E463;
	Tue, 21 Nov 2023 09:54:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F4710E461
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560440; x=1732096440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xThbU7i3ybWcTRdpYfyBdGLSkQ/0SKQCn4vCu4+hLUw=;
 b=C9jI86Gqx/q5dXnoQ7CU5yOkwA/HOeh0NRtGsvQ6v+R/HQrAqXwkxa5F
 cX0lS+PkU8225lgHBMnUHDzAinjOMAJbu3mnYsfU86Ktp95veXJ2waWUT
 RUfrgU7cMnkvnYVaa+GGUHkAejErRw0EIHiTj24oPT7OGEaFzJ/XPDc3A
 tO+kNHxULgc1f7KdWM8P8joHEcupzFFEb9tUJs5bz5E+WGEBRYybU3FaX
 LiKErLlsfnkyCttYZE23j9pJkIMuXw7QRTIMK9JtHl04cWrQ2IQBCf6r7
 OR6CWGD23Q6fe81Bj4DhvPUJWEJeikZyjSfXR1onLpeMQpqqhfYu0Eo9W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376841013"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="376841013"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766586344"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="766586344"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 01:53:58 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:31:16 +0530
Message-Id: <20231121100117.3584066-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
References: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 5/6] drm/xe/xe_migrate.c: Use NULL 1G PTE mapped at
 255GiB VA for ccs clear.
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 56 ++++++---------------------------
 1 file changed, 10 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 06706fad67aa..bdcb20f23531 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -54,8 +54,8 @@ struct xe_migrate {
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
@@ -125,41 +125,6 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
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
@@ -170,7 +135,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
 	u64 entry;
-	int ret;
 
 	/* Can't bump NUM_PT_SLOTS too high */
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
@@ -190,12 +154,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
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
 
@@ -262,6 +220,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			  (i + 1) * 8, u64, entry);
 	}
 
+	level = 2;
+	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
+		  vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0)
+		  | XE_PTE_NULL);
+	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
+
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pos, ofs, flags;
@@ -616,7 +580,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * Otherwise if the bo doesn't have any CCS metadata attached,
 		 * we still need to clear it for security reasons.
 		 */
-		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
+		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
 
 		emit_copy_ccs(gt, bb,
 			      dst_ofs, true,
@@ -1005,7 +969,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		if (xe_device_has_flat_ccs(xe) && clear_vram) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
-				      m->cleared_vram_ofs, false, clear_L0);
+				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
 		}
 
-- 
2.25.1

