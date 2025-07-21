Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5385BC83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 16:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B27C10E56E;
	Mon, 21 Jul 2025 16:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIMzzr+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEEF10E56E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113648; x=1784649648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ELD1N+MaTNMT0V6IvwPU7mSeKpK2TlEv171aqizuzA=;
 b=SIMzzr+c7avh4ZE+sBV6y6cX3oStY05aV4BdqYDhsmhj/ymROEXJbDAf
 64SlhmEa+959xckn4ntWKpGDIUHU6YFLY1mPbkUzZAFpT5/4/A+xNP1Rw
 gR0nPzu9amuQz0QEo6KkHMdKyojyV0r7jy1cr2Xi0vPN3qVutSaGGwW4e
 jpnr5K8ejOX84laMLWqQWHlWuOvllCO/gzXptaXJbPts2gj468s7Kf/bY
 LCEbJRFCMKIShNLFMZpLxFlcZGDFBTFoxgn8al0JwNRi7zd73pmv1zblb
 3nTWOJAW9ZjfqwgmZQVcO7z5eFzL+d/gOaxOh8fscgyYsnFk4WjGGTLb+ Q==;
X-CSE-ConnectionGUID: mQ8Uj5YqQp2Mu9iHt6xU+g==
X-CSE-MsgGUID: looVNPFIRPqPdjiidK8eNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="77874050"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="77874050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:00:44 -0700
X-CSE-ConnectionGUID: tOYxkBSCTPWh2w76dP43sg==
X-CSE-MsgGUID: Enn8KvmfSNqDcr8vM2c7pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159422004"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 09:00:41 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v11 2/3] drm/xe/vf: Attach and detach CCS copy commands with BO
Date: Mon, 21 Jul 2025 21:47:23 +0530
Message-ID: <20250721161724.26879-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721161724.26879-1-satyanarayana.k.v.p@intel.com>
References: <20250721161724.26879-1-satyanarayana.k.v.p@intel.com>
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
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
Cc: Tomasz Lis <tomasz.lis@intel.com>

V10 -> V11:
- Rebased and fixed conflicts.
- Fixed issue with TLB flush.

V9 -> V10:
- None.

V8 -> V9:
- Removed MI_INVALIDATE_TLB after emitting PTEs (Matthew Brost).
- Fixed review comments (Matthew Brost)

V7 -> V8:
- Removed xe_bb_ccs_realloc() and created a single BB by calculating the
BB size first and then emitting the commands. (Matthew Brost)
- Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().

V6 -> V7:
- Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
a list. (Matthew Brost)

V5 -> V6:
- Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)

V4 -> V5:
- Create a list of BBs for the given BO and fixed memory leak while
detaching BOs. (Matthew Brost).
- Fixed review comments (Matthew Brost & Matthew Auld).
- Yet to cleanup xe_migrate_ccs_rw_copy() function.

V3 -> V4:
- Fixed issues reported by patchworks.

V2 -> V3:
- Attach and detach functions check for IS_VF_CCS_READY().

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
 drivers/gpu/drm/xe/xe_bb.h                 |   3 +
 drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_migrate.c            | 137 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |   6 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  67 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
 9 files changed, 285 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 5ce0e26822f2..feb6e013dc38 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+{
+	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+	int err;
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+	/*
+	 * We need to allocate space for the requested number of dwords &
+	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
+	 * is submitted to HW, we need to make sure that the last instruction
+	 * is not over written when the last chunk of SA is allocated for BB.
+	 * So, this extra DW acts as a guard here.
+	 */
+
+	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
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
index b5cc65506696..2a8adc9a6dee 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,8 +13,11 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
+enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 00ce067d5fd3..ffca1cea5585 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -33,6 +33,7 @@
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -965,6 +966,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	dma_fence_put(fence);
 	xe_pm_runtime_put(xe);
 
+	/*
+	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
+	 * BBs from BO as it is no longer needed.
+	 */
+	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
+	    new_mem->mem_type == XE_PL_SYSTEM)
+		xe_sriov_vf_ccs_detach_bo(bo);
+
+	if (IS_SRIOV_VF(xe) &&
+	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
+	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
+	    handle_system_ccs)
+		ret = xe_sriov_vf_ccs_attach_bo(bo);
+
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
 	    ttm_bo->ttm) {
@@ -975,6 +990,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
+		if (IS_VF_CCS_BB_VALID(xe, bo))
+			xe_sriov_vf_ccs_detach_bo(bo);
+
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
 	}
 
@@ -1502,9 +1520,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
+	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
+		xe_sriov_vf_ccs_detach_bo(bo);
+
 	/*
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 57d34698139e..cf604adc13a3 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -77,6 +77,9 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
+	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
+	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6a80ae6104dd..30474d92a9b9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -30,6 +30,7 @@
 #include "xe_mocs.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
+#include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
@@ -954,6 +955,142 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
+/**
+ * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
+ * @m: The migration context.
+ * @src_bo: The buffer object @src is currently bound to.
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
+			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
+
+{
+	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
+	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
+	struct ttm_resource *src = src_bo->ttm.resource;
+	struct xe_gt *gt = m->tile->primary_gt;
+	u32 batch_size, batch_size_allocated;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_res_cursor src_it, ccs_it;
+	u64 size = xe_bo_size(src_bo);
+	struct xe_bb *bb = NULL;
+	u64 src_L0, src_L0_ofs;
+	u32 src_L0_pt;
+	int err;
+
+	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
+
+	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
+			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
+			&ccs_it);
+
+	/* Calculate Batch buffer size */
+	batch_size = 0;
+	while (size) {
+		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
+
+		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
+					      &src_L0_ofs, &src_L0_pt, 0, 0,
+					      avail_pts);
+
+		ccs_size = xe_device_ccs_bytes(xe, src_L0);
+		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+					      &ccs_pt, 0, avail_pts, avail_pts);
+		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+
+		/* Add copy commands size here */
+		batch_size += EMIT_COPY_CCS_DW;
+
+		size -= src_L0;
+	}
+
+	bb = xe_bb_ccs_new(gt, batch_size, read_write);
+	if (IS_ERR(bb)) {
+		drm_err(&xe->drm, "BB allocation failed.\n");
+		err = PTR_ERR(bb);
+		goto err_ret;
+	}
+
+	batch_size_allocated = batch_size;
+	size = xe_bo_size(src_bo);
+	batch_size = 0;
+
+	/*
+	 * Emit PTE and copy commands here.
+	 * The CCS copy command can only support limited size. If the size to be
+	 * copied is more than the limit, divide copy into chunks. So, calculate
+	 * sizes here again before copy command is emitted.
+	 */
+	while (size) {
+		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+		u32 flush_flags = 0;
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		src_L0 = xe_migrate_res_sizes(m, &src_it);
+
+		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
+					      &src_L0_ofs, &src_L0_pt, 0, 0,
+					      avail_pts);
+
+		ccs_size = xe_device_ccs_bytes(xe, src_L0);
+		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+					      &ccs_pt, 0, avail_pts, avail_pts);
+		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		batch_size += EMIT_COPY_CCS_DW;
+
+		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
+
+		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+				    MI_FLUSH_IMM_DW;
+		bb->cs[bb->len++] = lower_32_bits(xe_sa_bo_gpu_addr(bb->bo)) |
+				    MI_FLUSH_DW_USE_GTT;
+		bb->cs[bb->len++] = upper_32_bits(xe_sa_bo_gpu_addr(bb->bo));
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+						  src_L0_ofs, dst_is_pltt,
+						  src_L0, ccs_ofs, true);
+
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+				    MI_FLUSH_IMM_DW | flush_flags;
+		bb->cs[bb->len++] = lower_32_bits(xe_sa_bo_gpu_addr(bb->bo)) |
+				    MI_FLUSH_DW_USE_GTT;
+		bb->cs[bb->len++] = upper_32_bits(xe_sa_bo_gpu_addr(bb->bo));
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		size -= src_L0;
+	}
+
+	xe_assert(xe, (batch_size_allocated == bb->len));
+	src_bo->bb_ccs[read_write] = bb;
+
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
index 74c60f55004a..a1f4e91b25db 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -24,6 +24,8 @@ struct xe_vm;
 struct xe_vm_pgtable_update;
 struct xe_vma;
 
+enum xe_sriov_vf_ccs_rw_ctxs;
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -113,6 +115,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
+
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 697eea46659a..6ddeb016b892 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -5,6 +5,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gpu_commands.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_migrate.h"
@@ -206,3 +207,69 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
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
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_migrate *migrate;
+	struct xe_tile *tile;
+	struct xe_bb *bb;
+	int err = 0;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	tile = xe_device_get_root_tile(xe);
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		bb = bo->bb_ccs[ctx_id];
+		/* bb should be NULL here. Assert if not NULL */
+		xe_assert(xe, !bb);
+
+		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
+		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
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
+ * Returns: 0 if successful.
+ */
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_bb *bb;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		bb = bo->bb_ccs[ctx_id];
+		if (!bb)
+			continue;
+
+		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
+		xe_bb_free(bb, NULL);
+		bo->bb_ccs[ctx_id] = NULL;
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
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 6dc279d206ec..e240f3fd18af 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_CTX_COUNT
 };
 
+#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
+		struct xe_device *___xe = (xe); \
+		struct xe_bo *___bo = (bo); \
+		IS_SRIOV_VF(___xe) && \
+		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
+		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
+		})
+
 struct xe_migrate;
 struct xe_sa_manager;
 
-- 
2.43.0

