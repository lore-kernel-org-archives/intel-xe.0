Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FDC3ABD8
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 12:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519A910E10F;
	Mon, 19 May 2025 12:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqpCqjWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65510E0E5
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747658206; x=1779194206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ot8QZlA+PZNgBEMm6J+2xCXVHH2757n5KRY2aFXQZ+k=;
 b=KqpCqjWtc2wAJAg/EFOveZtz9qgyLdcAEB+oJqGr3KcDbkETLINNKUlp
 ZVWZQDIl6zplWs+ZxJTciq+up6NN2x9BhkDH9jGSpCVS2/0MjivRRQ3Ja
 ydLvl/0ssArVuYBEO1gvHqYjJ8giaO+fknjQcCfbmuPzTyveERrbLlxYZ
 /CyxsCJlUwnvbaJrGWJdjuxcS6L8c4AEIBwcoTsKIJkOWQHj/RoZFoPph
 d29ahMwKZiCS6+EOp69Px1GHeV07Kou6bZD4iHtJeEvmfLsuvELMPz583
 FFRwjch0ZHbX22N2iKLXBKMmhKfUxeevHiWOfuCEa4fQIyM70BC9vp3H/ w==;
X-CSE-ConnectionGUID: VMyAhnnzT4WTNiacjRr1bg==
X-CSE-MsgGUID: lJUtjnMgTlGvi1K+Pondfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52188133"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="52188133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:36:46 -0700
X-CSE-ConnectionGUID: AOBhmo2OSeq8rBlw+6IjVw==
X-CSE-MsgGUID: tqmqVwNHSpq10ckFclryWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139870580"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 19 May 2025 05:36:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC 2/3] drm/xe/vf: Attach and detach CCS copy commands with BO.
Date: Mon, 19 May 2025 18:22:56 +0530
Message-ID: <20250519125257.10070-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
References: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
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

Attach CCS read/write copy commands to BO for old and new mem types as
NULL -> tt or system -> tt.
Detach the CCS read/write copy commands from BO while deleting ttm bo
from xe_ttm_bo_delete_mem_notify().

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c           |  33 ++++++
 drivers/gpu/drm/xe/xe_bb.h           |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  14 +++
 drivers/gpu/drm/xe/xe_bo_types.h     |   3 +
 drivers/gpu/drm/xe/xe_migrate.c      | 159 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |   8 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  73 ++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |   3 +
 8 files changed, 294 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 9570672fce33..bb10151c68a3 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,6 +60,39 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx_id)
+{
+	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+	int err;
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * We need to allocate space for the requested number of dwords,
+	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
+	 * space to accommodate the platform-specific hardware prefetch
+	 * requirements.
+	 */
+	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));
+
+	if (IS_ERR(bb->bo)) {
+		err = PTR_ERR(bb->bo);
+		goto err;
+	}
+
+	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
+	bb->len = 0;
+
+	return bb;
+err:
+	kfree(bb);
+	return ERR_PTR(err);
+}
+
 static struct xe_sched_job *
 __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index fafacd73dcc3..55d5c458d42a 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -15,6 +15,7 @@ struct xe_exec_queue;
 struct xe_sched_job;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords, bool ctx);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..3c40450dfcb2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -31,6 +31,7 @@
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -964,6 +965,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_pm_runtime_put(xe);
 
 out:
+	if (((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
+	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
+	    handle_system_ccs)
+		ret = xe_sriov_vf_ccs_attach_bo(bo);
+
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
 	    ttm_bo->ttm) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
@@ -973,6 +979,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
+		if (bo->bb_ccs[0])
+			xe_sriov_vf_ccs_detach_bo(bo);
+
 		xe_tt_unmap_sg(ttm_bo->ttm);
 	}
 
@@ -1478,9 +1487,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
+	if (bo->bb_ccs[0])
+		xe_sriov_vf_ccs_detach_bo(bo);
+
 	/*
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index eb5e83c5f233..481b8e0d8ab1 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -78,6 +78,9 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
+	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
+	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..43de220b3109 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,6 +940,165 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
+/**
+ * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
+ * @m: The migration context.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @dst_bo: If copying between resources created for the same bo, set this to
+ * the same value as @src_bo. If copying between buffer objects, set it to
+ * the buffer object @dst is currently bound to.
+ * @src: The source TTM resource.
+ * @dst: The dst TTM resource.
+ * @copy_only_ccs: If true copy only CCS metadata
+ * @read_write : Creates BB commands for CCS read/write.
+ *
+ * Creates batch buffer instructions to copy CCS metadata from CCS pool to
+ * memory and vice versa.
+ *
+ * This function should only be called for IGPU.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ */
+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   struct xe_bo *dst_bo,
+			   struct ttm_resource *src,
+			   struct ttm_resource *dst,
+			   bool copy_only_ccs,
+			   bool read_write)
+
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 size = src_bo->size;
+	struct xe_res_cursor src_it, dst_it, ccs_it;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u32 src_L0_pt, dst_L0_pt;
+	u64 src_L0, dst_L0;
+	int err;
+	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
+	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
+	bool src_is_vram = mem_type_is_vram(src->mem_type);
+	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
+	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
+	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
+		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
+	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
+		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
+
+	/* Copying CCS between two different BOs is not supported yet. */
+	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
+		return -EINVAL;
+
+	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
+		return -EINVAL;
+
+	if (!src_is_vram)
+		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
+	else
+		xe_res_first(src, 0, size, &src_it);
+	if (!dst_is_vram)
+		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
+	else
+		xe_res_first(dst, 0, size, &dst_it);
+
+	if (copy_system_ccs)
+		xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
+				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
+				&ccs_it);
+
+	while (size) {
+		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
+		struct xe_bb *bb;
+		u32 flush_flags = 0;
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+		u32 pte_flags;
+
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		src_L0 = xe_migrate_res_sizes(m, &src_it);
+		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
+
+		src_L0 = min(src_L0, dst_L0);
+
+		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
+					      &src_L0_ofs, &src_L0_pt, 0, 0,
+					      avail_pts);
+
+		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
+					      &dst_L0_ofs, &dst_L0_pt, 0,
+					      avail_pts, avail_pts);
+
+		if (copy_system_ccs) {
+			xe_assert(xe, type_device);
+			ccs_size = xe_device_ccs_bytes(xe, src_L0);
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
+						      &ccs_ofs, &ccs_pt, 0,
+						      2 * avail_pts,
+						      avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		}
+
+		/* Add copy commands size here */
+		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
+
+		bb = xe_bb_ccs_new(gt, batch_size, read_write);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_ret;
+		}
+
+		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
+			xe_res_next(&src_it, src_L0);
+		else
+			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
+				 &src_it, src_L0, src);
+
+		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
+			xe_res_next(&dst_it, src_L0);
+		else
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
+				 &dst_it, src_L0, dst);
+
+		if (copy_system_ccs)
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+					MI_FLUSH_IMM_DW;
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		if (!copy_only_ccs)
+			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
+
+		if (needs_ccs_emit)
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
+							  dst_L0_ofs,
+							  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
+							  src_L0, ccs_ofs, copy_ccs);
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+					MI_FLUSH_IMM_DW | flush_flags;
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		size -= src_L0;
+
+		src_bo->bb_ccs[read_write] = bb;
+	}
+	return 0;
+
+err_ret:
+	return err;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..2a2f6c4690fb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   struct xe_bo *dst_bo,
+			   struct ttm_resource *src,
+			   struct ttm_resource *dst,
+			   bool copy_only_ccs,
+			   bool read_write);
+
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 7cd79d25a398..d808dbba71e6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -4,6 +4,7 @@
  */
 
 #include "instructions/xe_mi_commands.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_migrate.h"
@@ -156,3 +157,75 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 err_ret:
 	return err;
 }
+
+/**
+ * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
+ * @bo: the &buffer object to which batch buffer commands will be added.
+ *
+ * This function shall be called only by VF. It inserts the PTEs and copy
+ * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
+ * function.
+ *
+ * Returns: 0 if successful, negative error code on failure.
+ */
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_migrate *migrate;
+	bool copy_only_ccs = 1;
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+	struct xe_bb *bb;
+	int err = 0;
+
+	if (!IS_SRIOV_VF(xe) || IS_DGFX(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo->bb_ccs[ctx_id];
+			if (bb)
+				xe_sriov_err(xe, "Probable memory leak\n");
+
+			migrate = tile->sriov.vf.ccs_rw_ctx[ctx_id].migrate;
+			err = xe_migrate_ccs_rw_copy(migrate, bo, bo,
+						     bo->ttm.resource,
+						     bo->ttm.resource,
+						     copy_only_ccs, ctx_id);
+		}
+	}
+	return err;
+}
+
+/**
+ * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
+ * @bo: the &buffer object from which batch buffer commands will be removed.
+ *
+ * This function shall be called only by VF. It removes the PTEs and copy
+ * command instructions from the BO. Make sure to update the BB with MI_NOOP
+ * before freeing.
+ *
+ * Returns: 0 if successful, negative error code on failure.
+ */
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+	struct xe_bb *bb;
+
+	if (!IS_SRIOV_VF(xe) || IS_DGFX(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo->bb_ccs[ctx_id];
+			if (!bb)
+				continue;
+
+			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
+			xe_bb_free(bb, NULL);
+		}
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 5df9ba028d14..5d5e4bd25904 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -7,7 +7,10 @@
 #define _XE_SRIOV_VF_CCS_H_
 
 struct xe_device;
+struct xe_bo;
 
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 
 #endif
-- 
2.43.0

