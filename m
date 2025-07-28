Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C738C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA2510E0F9;
	Mon, 28 Jul 2025 09:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBFznltZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7686E10E004
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753694288; x=1785230288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3jsHgTOSdUQxCfFxvDZdd6AGeAX/AZPlppWFstg0MQ=;
 b=SBFznltZd0QT3EyZXsa8E0ky962+qykeN0pKLT1mxxsyNKw+Nyo+fS7x
 NSSbUD3ykC2t0s/I7N7H8lRR6jdWBP78n70xm7SHGeYFb7AMR9/mrVa8G
 R0ibJ+sd6kHHxyzZdX/XLDBKvp/fmFxFZ/+NpIZ58HvFnwsS3Yr3CRNT+
 x7Vm0eWeittuqCBto9TZt1Cslsx4q39zYJjOV9exVoqUL4cQ1mJyqFkm1
 bBS028B8b3BG2lALDt8sjpqy3OdnfIhnIUCb1JNHgxR5qp97yu0vTEUcA
 GcLaH8WAVtnlTAzjP4lhKLBTu+VeRjRffb3kSTZqnCuu4rL2TgHHFBh21 Q==;
X-CSE-ConnectionGUID: Qoe+dyN+SYSHof7NXYUh/A==
X-CSE-MsgGUID: B+JGaLVpRFOXjnvgw/4RAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59756203"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59756203"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:18:08 -0700
X-CSE-ConnectionGUID: dhLuc1cCTnm2smhYCGPZVw==
X-CSE-MsgGUID: 19AT19xAS66uuDLrfxhobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162241363"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 02:18:05 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 2/3] Revert "drm/xe/vf: Attach and detach CCS copy commands
 with BO"
Date: Mon, 28 Jul 2025 15:04:46 +0530
Message-ID: <20250728093447.27961-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728093447.27961-1-satyanarayana.k.v.p@intel.com>
References: <20250728093447.27961-1-satyanarayana.k.v.p@intel.com>
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

This reverts commit 864690cf4dd62482b6dd049d82c509886c904303.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c                 |  35 -----
 drivers/gpu/drm/xe/xe_bb.h                 |   3 -
 drivers/gpu/drm/xe/xe_bo.c                 |  23 ----
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 -
 drivers/gpu/drm/xe/xe_migrate.c            | 148 ---------------------
 drivers/gpu/drm/xe/xe_migrate.h            |   7 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  67 ----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 --
 9 files changed, 297 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index feb6e013dc38..5ce0e26822f2 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,41 +60,6 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
-{
-	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_sa_manager *bb_pool;
-	int err;
-
-	if (!bb)
-		return ERR_PTR(-ENOMEM);
-	/*
-	 * We need to allocate space for the requested number of dwords &
-	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
-	 * is submitted to HW, we need to make sure that the last instruction
-	 * is not over written when the last chunk of SA is allocated for BB.
-	 * So, this extra DW acts as a guard here.
-	 */
-
-	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
-	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
-
-	if (IS_ERR(bb->bo)) {
-		err = PTR_ERR(bb->bo);
-		goto err;
-	}
-
-	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
-	bb->len = 0;
-
-	return bb;
-err:
-	kfree(bb);
-	return ERR_PTR(err);
-}
-
 static struct xe_sched_job *
 __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 2a8adc9a6dee..b5cc65506696 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,11 +13,8 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
-enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..00ce067d5fd3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -33,7 +33,6 @@
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
-#include "xe_sriov_vf_ccs.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -966,20 +965,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	dma_fence_put(fence);
 	xe_pm_runtime_put(xe);
 
-	/*
-	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
-	 * BBs from BO as it is no longer needed.
-	 */
-	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
-	    new_mem->mem_type == XE_PL_SYSTEM)
-		xe_sriov_vf_ccs_detach_bo(bo);
-
-	if (IS_SRIOV_VF(xe) &&
-	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
-	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
-	    handle_system_ccs)
-		ret = xe_sriov_vf_ccs_attach_bo(bo);
-
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
 	    ttm_bo->ttm) {
@@ -990,9 +975,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
-		if (IS_VF_CCS_BB_VALID(xe, bo))
-			xe_sriov_vf_ccs_detach_bo(bo);
-
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
 	}
 
@@ -1520,14 +1502,9 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
-	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
-
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
-	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
-		xe_sriov_vf_ccs_detach_bo(bo);
-
 	/*
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -77,9 +77,6 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
-	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
-	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
-
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8d95543c7c35..d2b9c42ac5bc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -30,7 +30,6 @@
 #include "xe_mocs.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
-#include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
@@ -957,153 +956,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
-/**
- * xe_get_migrate_lrc() - Get the LRC from migrate context.
- * @migrate: Migrate context.
- *
- * Return: Pointer to LRC on success, error on failure
- */
-struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
-{
-	return migrate->q->lrc[0];
-}
-
-static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
-				 u32 flags)
-{
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
-		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
-	dw[i++] = MI_NOOP;
-	dw[i++] = MI_NOOP;
-
-	return i;
-}
-
-/**
- * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
- * @m: The migration context.
- * @src_bo: The buffer object @src is currently bound to.
- * @read_write : Creates BB commands for CCS read/write.
- *
- * Creates batch buffer instructions to copy CCS metadata from CCS pool to
- * memory and vice versa.
- *
- * This function should only be called for IGPU.
- *
- * Return: 0 if successful, negative error code on failure.
- */
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
-			   struct xe_bo *src_bo,
-			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
-
-{
-	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
-	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
-	struct ttm_resource *src = src_bo->ttm.resource;
-	struct xe_gt *gt = m->tile->primary_gt;
-	u32 batch_size, batch_size_allocated;
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_res_cursor src_it, ccs_it;
-	u64 size = xe_bo_size(src_bo);
-	struct xe_bb *bb = NULL;
-	u64 src_L0, src_L0_ofs;
-	u32 src_L0_pt;
-	int err;
-
-	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
-
-	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
-			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
-			&ccs_it);
-
-	/* Calculate Batch buffer size */
-	batch_size = 0;
-	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
-		u64 ccs_ofs, ccs_size;
-		u32 ccs_pt;
-
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
-
-		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
-
-		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
-					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      avail_pts);
-
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
-					      &ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-
-		/* Add copy commands size here */
-		batch_size += EMIT_COPY_CCS_DW;
-
-		size -= src_L0;
-	}
-
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
-	if (IS_ERR(bb)) {
-		drm_err(&xe->drm, "BB allocation failed.\n");
-		err = PTR_ERR(bb);
-		goto err_ret;
-	}
-
-	batch_size_allocated = batch_size;
-	size = xe_bo_size(src_bo);
-	batch_size = 0;
-
-	/*
-	 * Emit PTE and copy commands here.
-	 * The CCS copy command can only support limited size. If the size to be
-	 * copied is more than the limit, divide copy into chunks. So, calculate
-	 * sizes here again before copy command is emitted.
-	 */
-	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
-		u32 flush_flags = 0;
-		u64 ccs_ofs, ccs_size;
-		u32 ccs_pt;
-
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
-
-		src_L0 = xe_migrate_res_sizes(m, &src_it);
-
-		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
-					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      avail_pts);
-
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
-					      &ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-		batch_size += EMIT_COPY_CCS_DW;
-
-		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
-
-		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
-
-		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
-						  src_L0_ofs, dst_is_pltt,
-						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
-
-		size -= src_L0;
-	}
-
-	xe_assert(xe, (batch_size_allocated == bb->len));
-	src_bo->bb_ccs[read_write] = bb;
-
-	return 0;
-
-err_ret:
-	return err;
-}
-
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index a856fe963373..1d84021e57ac 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -25,8 +25,6 @@ struct xe_vm;
 struct xe_vm_pgtable_update;
 struct xe_vma;
 
-enum xe_sriov_vf_ccs_rw_ctxs;
-
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -124,11 +122,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
-			   struct xe_bo *src_bo,
-			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
-
-struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 6ddeb016b892..697eea46659a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -5,7 +5,6 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gpu_commands.h"
-#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_migrate.h"
@@ -207,69 +206,3 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 err_ret:
 	return err;
 }
-
-/**
- * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
- * @bo: the &buffer object to which batch buffer commands will be added.
- *
- * This function shall be called only by VF. It inserts the PTEs and copy
- * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
- * function.
- *
- * Returns: 0 if successful, negative error code on failure.
- */
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
-{
-	struct xe_device *xe = xe_bo_device(bo);
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_migrate *migrate;
-	struct xe_tile *tile;
-	struct xe_bb *bb;
-	int err = 0;
-
-	if (!IS_VF_CCS_READY(xe))
-		return 0;
-
-	tile = xe_device_get_root_tile(xe);
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		bb = bo->bb_ccs[ctx_id];
-		/* bb should be NULL here. Assert if not NULL */
-		xe_assert(xe, !bb);
-
-		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
-		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
-	}
-	return err;
-}
-
-/**
- * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
- * @bo: the &buffer object from which batch buffer commands will be removed.
- *
- * This function shall be called only by VF. It removes the PTEs and copy
- * command instructions from the BO. Make sure to update the BB with MI_NOOP
- * before freeing.
- *
- * Returns: 0 if successful.
- */
-int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
-{
-	struct xe_device *xe = xe_bo_device(bo);
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_bb *bb;
-
-	if (!IS_VF_CCS_READY(xe))
-		return 0;
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		bb = bo->bb_ccs[ctx_id];
-		if (!bb)
-			continue;
-
-		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
-		xe_bb_free(bb, NULL);
-		bo->bb_ccs[ctx_id] = NULL;
-	}
-	return 0;
-}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 5d5e4bd25904..5df9ba028d14 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -7,10 +7,7 @@
 #define _XE_SRIOV_VF_CCS_H_
 
 struct xe_device;
-struct xe_bo;
 
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
-int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index e240f3fd18af..6dc279d206ec 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -27,14 +27,6 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_CTX_COUNT
 };
 
-#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
-		struct xe_device *___xe = (xe); \
-		struct xe_bo *___bo = (bo); \
-		IS_SRIOV_VF(___xe) && \
-		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
-		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
-		})
-
 struct xe_migrate;
 struct xe_sa_manager;
 
-- 
2.43.0

