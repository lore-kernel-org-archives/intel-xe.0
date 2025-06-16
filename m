Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A95C71155
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 14:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E8110E3CB;
	Mon, 16 Jun 2025 14:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiZatB5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849B10E3C8
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750085507; x=1781621507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVsLK8xX4tdIS6vtOXtYd6V2/O53R1sMj0S+iu9yGFE=;
 b=MiZatB5StzTt1J6jp5W6l195AHQ1164w154eojuMZjovAfOJm3QkPI5b
 uvPUBErQtPtpq7jE0AiugylONKQEJE4yZ7s1YDfLp91RDpycRqbLIjmPy
 Be0mDw8FsmlhhojgwQjD2+lKOqLS9KEu5aFgl3czrxv5Ox01AaoZ4LCs6
 pXcwE22lgc5rNig+aNvE6cvSbWAc5A2haoirprHn3WK/M8VGrbpwAvNSz
 J4m5xDbkEsSXa/uOS9L94DlqyeCYoIlFZQZDuu19e42SxopLfzVmhrDTf
 j/NVVD9Li5Q4CHz6xDwg3rZNrZnYmA9gd1433QGogF4CNtAmR1/Frd3He Q==;
X-CSE-ConnectionGUID: U8ejYdzeTWu5MW0qWbcgHA==
X-CSE-MsgGUID: tLLhV9pfTW2E/CAgxJlaEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77628119"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="77628119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:51:46 -0700
X-CSE-ConnectionGUID: IM/xWSp2Rq+oy2RfETLGKQ==
X-CSE-MsgGUID: q+xr71pfSHicNeRGq9C8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153248269"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 16 Jun 2025 07:51:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v7 2/3] drm/xe/vf: Attach and detach CCS copy commands with BO
Date: Mon, 16 Jun 2025 20:38:04 +0530
Message-ID: <20250616150805.26780-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
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
---
Cc: Tomasz Lis <tomasz.lis@intel.com>

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
 drivers/gpu/drm/xe/xe_bb.c                 | 54 ++++++++++++
 drivers/gpu/drm/xe/xe_bb.h                 |  6 ++
 drivers/gpu/drm/xe/xe_bo.c                 | 23 ++++++
 drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
 drivers/gpu/drm/xe/xe_migrate.c            | 95 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |  6 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 72 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
 9 files changed, 270 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 9570672fce33..9a9c33c7362a 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,6 +60,60 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
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
+struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
+				u32 dwords,
+				enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+{
+	struct xe_bb *new_bb;
+
+	if (!bb)
+		return xe_bb_ccs_new(gt, dwords, ctx_id);
+
+	new_bb = xe_bb_ccs_new(gt, dwords, ctx_id);
+	if (IS_ERR(new_bb))
+		return new_bb;
+
+	memcpy(new_bb->cs, bb->cs, bb->len * sizeof(u32));
+	new_bb->len = bb->len;
+	xe_bb_free(bb, NULL);
+
+	return new_bb;
+}
+
 static struct xe_sched_job *
 __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index fafacd73dcc3..7dfe9422dfab 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,8 +13,14 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
+enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
+				u32 dwords,
+				enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..beaf8544bf08 100644
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
@@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
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
@@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
+		if (IS_VF_CCS_BB_VALID(xe, bo))
+			xe_sriov_vf_ccs_detach_bo(bo);
+
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
 	}
 
@@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
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
index eb5e83c5f233..642e519fcfd1 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -78,6 +78,9 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
+	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
+	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..6c30b106b817 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,6 +940,101 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
+	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
+	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
+	struct ttm_resource *src = src_bo->ttm.resource;
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_res_cursor src_it, ccs_it;
+	u64 size = src_bo->size;
+	struct xe_bb *bb = NULL;
+	u64 src_L0, src_L0_ofs;
+	u32 batch_size;
+	u32 src_L0_pt;
+	int err;
+
+	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
+
+	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
+			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
+			&ccs_it);
+
+	batch_size = 0;
+	while (size) {
+		batch_size += 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
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
+		bb = xe_bb_ccs_realloc(bb, gt, batch_size, read_write);
+		if (IS_ERR(bb)) {
+			drm_err(&xe->drm, "BB allocation failed.\n");
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
+		src_bo->bb_ccs[read_write] = bb;
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
index fb9839c1bae0..96b0449e7edb 100644
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
@@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
index ff5ad472eb96..3e37cb95ff32 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -5,6 +5,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gpu_commands.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_migrate.h"
@@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
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
+	int tile_id;
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
+ * Returns: 0 if successful.
+ */
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_bb *bb;
+	struct xe_tile *tile;
+	int tile_id;
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

