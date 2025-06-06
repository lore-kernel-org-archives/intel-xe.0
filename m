Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C703C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 12:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADBF10EA95;
	Fri,  6 Jun 2025 12:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmbX05FT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8410EA95
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749212983; x=1780748983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jj+kUwWQDr7zE7Yl1mC2UaF55/uVgTF1qCjV3oueYqE=;
 b=EmbX05FTDtIkTw1bKpVbqe0kEy9CXYJor/uPTEeQqQnjQMX21nAo4hRi
 QCvVJqQduIzZ3wF1NtWmyuE0LeDrsB2jHZjHgy/ZGCSxXo/8BRd9/lLq7
 +knGXKKdtdeCPrbzRLxp6Vdw5/JJA91032NKY0GIr6+Svfanv0YbZMFLG
 LYMG6l6Lyci1EWOqoSaj6wdOlR5PHaALl/s4MSTjAQtEcfDonh/Ht11DU
 5oikpVrfUxYn8KO/gdKQb0QqHRIcR67vF2kVopDR8EBrhiu8LEjIO20iX
 EiVVuN6YNqCIeA7tVkTexYbZGnKYaxeIqmAX08v8HCobTlE7L7X6dhO9i A==;
X-CSE-ConnectionGUID: WrfVSpjyQMiMmSORxNTfDQ==
X-CSE-MsgGUID: 0YcKZMQmTgWpv3xpu+l2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51063971"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51063971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 05:29:43 -0700
X-CSE-ConnectionGUID: 76h+vNcKTZSg/56I5LEvVQ==
X-CSE-MsgGUID: z8IgBIIxQ2aS4No3/PH3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146167514"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 05:29:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v6 2/3] drm/xe/vf: Attach and detach CCS copy commands with BO
Date: Fri,  6 Jun 2025 18:15:57 +0530
Message-ID: <20250606124558.30966-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_bb.c                 | 34 ++++++++
 drivers/gpu/drm/xe/xe_bb.h                 |  3 +
 drivers/gpu/drm/xe/xe_bb_types.h           |  1 +
 drivers/gpu/drm/xe/xe_bo.c                 | 23 +++++
 drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
 drivers/gpu/drm/xe/xe_migrate.c            | 98 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |  4 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 77 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
 10 files changed, 254 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 9570672fce33..ee31556e00bc 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,6 +60,40 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
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
index fafacd73dcc3..32c9c4c5d2be 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,8 +13,11 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
+enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_bb_types.h b/drivers/gpu/drm/xe/xe_bb_types.h
index b7d30308cf90..b2358cc051ff 100644
--- a/drivers/gpu/drm/xe/xe_bb_types.h
+++ b/drivers/gpu/drm/xe/xe_bb_types.h
@@ -12,6 +12,7 @@ struct drm_suballoc;
 
 struct xe_bb {
 	struct drm_suballoc *bo;
+	struct list_head list;
 
 	u32 *cs;
 	u32 len; /* in dwords */
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61d208c85281..b2ed5a36ab3d 100644
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
@@ -948,6 +949,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
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
@@ -958,6 +973,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
+		if (IS_VF_CCS_BB_VALID(xe, bo))
+			xe_sriov_vf_ccs_detach_bo(bo);
+
 		xe_tt_unmap_sg(ttm_bo->ttm);
 	}
 
@@ -1482,9 +1500,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
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
index 8f8e9fdfb2a8..d7f3009260ee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,6 +940,104 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
+			   int read_write)
+
+{
+	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
+	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
+	struct ttm_resource *src = src_bo->ttm.resource;
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_res_cursor src_it, ccs_it;
+	u64 size = src_bo->size;
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
+	while (size) {
+		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
+		struct xe_bb *bb;
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
+
+		/* Add copy commands size here */
+		batch_size += EMIT_COPY_CCS_DW;
+
+		bb = xe_bb_ccs_new(gt, batch_size, read_write);
+		if (IS_ERR(bb)) {
+			drm_dbg(&xe->drm, "BB allocation failed.\n");
+			err = PTR_ERR(bb);
+			goto err_ret;
+		}
+
+		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
+
+		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+					MI_FLUSH_IMM_DW;
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+						  src_L0_ofs, dst_is_pltt,
+						  src_L0, ccs_ofs, true);
+
+		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
+					MI_FLUSH_IMM_DW | flush_flags;
+		bb->cs[bb->len++] = MI_NOOP;
+		bb->cs[bb->len++] = MI_NOOP;
+
+		if (size == src_bo->size) {
+			src_bo->bb_ccs[read_write] = bb;
+			INIT_LIST_HEAD(&src_bo->bb_ccs[read_write]->list);
+		} else {
+			list_add(&bb->list, &src_bo->bb_ccs[read_write]->list);
+		}
+
+		size -= src_L0;
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
index fb9839c1bae0..ab5ebb44d2c9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   int read_write);
+
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 41fe1f59e0e9..4b5cfc0d421b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -5,6 +5,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gpu_commands.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_migrate.h"
@@ -184,3 +185,79 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
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
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+	struct xe_bb *bb;
+	int err = 0;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo->bb_ccs[ctx_id];
+			if (bb)
+				xe_sriov_err(xe, "Probable memory leak\n");
+
+			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
+			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
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
+	struct xe_bb *bb, *pos, *temp;
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo->bb_ccs[ctx_id];
+			if (!bb)
+				continue;
+
+			list_for_each_entry_safe(pos, temp, &bb->list, list) {
+				list_del(&pos->list);
+				memset(pos->cs, MI_NOOP, pos->len * sizeof(u32));
+				xe_bb_free(pos, NULL);
+			}
+
+			/* Free-up head BB */
+			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
+			xe_bb_free(bb, NULL);
+			bo->bb_ccs[ctx_id] = NULL;
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
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index f67f002c7a96..9545c5cfc2b1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -28,6 +28,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_RW_MAX_CTXS
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

