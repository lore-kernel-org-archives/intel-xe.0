Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A584BC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7149E10E004;
	Thu,  7 Aug 2025 11:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSoaft7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8572510E004
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754565053; x=1786101053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bIimQOaBBeE8ByCPJiJ5riitYiuTj6g4Rjh2XkHGS3A=;
 b=gSoaft7iLNQbXvRxMsKGpjcv1NFN9Rpym9jL7jANU/4bH5w9CpjGqIhC
 jSlwotkpFfAA6vAFX8w7i2nki3CKGJ15vn5Q3Vdw+1ZI1/g7VXBoyyONH
 opRDsg9Cc0Ld0tZCRkeFOGyKsBmIc/Q6e6nunDsFMt7n0V8sJge7lyZ3R
 P6Vftekoj+xkOt9DF9skF2tjb+c3zl8m6nJrZTUyToQCMLDQarBVEgfES
 7sOAB+Ut9d3m16kG5Rbl9crEewqaMMCO5epbYByNZLGWZLwhuaDG3pFGv
 vzFrUYUk/EBLtCMb/VLoM5YpMnkZuetqnBp1o4JmYb475kRno5sGzoxt7 w==;
X-CSE-ConnectionGUID: dBgy3XC/SdWFcf93lCkEtA==
X-CSE-MsgGUID: jx7r8UWGSa+RLBwrc3mi7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67593188"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67593188"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:10:53 -0700
X-CSE-ConnectionGUID: aBm5FxlMTfWLyTZAnemBtw==
X-CSE-MsgGUID: /b/MbsuKQca5LTaul+27fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165396951"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 04:10:51 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v4 1/1] drm/xe/vf: Refactor CCS save/restore to use default
 migration context
Date: Thu,  7 Aug 2025 16:57:40 +0530
Message-ID: <20250807112740.2421-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807112740.2421-1-satyanarayana.k.v.p@intel.com>
References: <20250807112740.2421-1-satyanarayana.k.v.p@intel.com>
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

Previously, CCS save/restore operations created separate migration
contexts with new VM memory allocations, resulting in significant
overhead.

This commit eliminates redundant context creation reusing the default
migration context by registering new execution queues for CCS save and
restore on the existing migrate VM.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>

---
V3 -> V4:
- Created a new helper function to get lrc from queu (John Harrison)
- Rename q to mig_q in xe_tile_vf_ccs  structure (John Harrison)
- Corrected error handling in xe_sriov_vf_ccs_init() when
devm_add_action_or_reset() returns error.

V2 -> V3:
- Fixed review comments (Matthew Brost).

V1 -> V2:
- Fixed kernel-doc issues reported by patchworks.
---
 drivers/gpu/drm/xe/xe_exec_queue.c         | 11 +++++
 drivers/gpu/drm/xe/xe_exec_queue.h         |  1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 21 +++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 51 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
 7 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6c176183ed58..bf593e0d37c5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -789,6 +789,17 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * xe_exec_queue_lrc() - Get the LRC from exec queue.
+ * @q: The exec_queue.
+ *
+ * Return: Pointer to LRC on success, error on failure
+ */
+struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
+{
+	return q->lrc[0];
+}
+
 /**
  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
  * @q: The exec_queue
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 4d416f23001c..15ec852e7f7e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -94,4 +94,5 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
 
+struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0f9636a06083..183787782a6f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -951,7 +951,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 }
 
 /**
- * xe_get_migrate_lrc() - Get the LRC from migrate context.
+ * xe_migrate_lrc() - Get the LRC from migrate context.
  * @migrate: Migrate context.
  *
  * Return: Pointer to LRC on success, error on failure
@@ -961,14 +961,15 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate->q->lrc[0];
 }
 
-static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
+static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
 				 u32 flags)
 {
+	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
 		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
+	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
 		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
+	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
 	dw[i++] = MI_NOOP;
 	dw[i++] = MI_NOOP;
 
@@ -977,7 +978,8 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
 
 /**
  * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
- * @m: The migration context.
+ * @tile: Tile whose migration context to be used.
+ * @q : Execution to be used along with migration context.
  * @src_bo: The buffer object @src is currently bound to.
  * @read_write : Creates BB commands for CCS read/write.
  *
@@ -988,7 +990,7 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
  *
  * Return: 0 if successful, negative error code on failure.
  */
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
 
@@ -996,7 +998,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
 	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
 	struct ttm_resource *src = src_bo->ttm.resource;
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct xe_gt *gt = tile->primary_gt;
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
@@ -1079,11 +1082,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 
 		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
 		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
 						  src_L0_ofs, dst_is_pltt,
 						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
 
 		size -= src_L0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index a3f3fa281e04..8978d2cc1a75 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -125,7 +125,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44aaf154ddf7..5e8126ca8e27 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_ccs_register_context(xe);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index f0ca2a9b2bb7..4872e43eb440 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -8,6 +8,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_guc_submit.h"
 #include "xe_lrc.h"
@@ -168,8 +169,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 
 static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
 {
-	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
 	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
+	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 	u32 dw[10], i = 0;
 
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
@@ -183,13 +184,12 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
 	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 }
 
-static int register_save_restore_context(struct xe_migrate *m,
-					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
 {
 	int err = -EINVAL;
 	int ctx_type;
 
-	switch (ctx_id) {
+	switch (ctx->ctx_id) {
 	case XE_SRIOV_VF_CCS_READ_CTX:
 		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
 		break;
@@ -200,7 +200,7 @@ static int register_save_restore_context(struct xe_migrate *m,
 		return err;
 	}
 
-	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
+	xe_guc_register_exec_queue(ctx->mig_q, ctx_type);
 	return 0;
 }
 
@@ -225,7 +225,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 
 	for_each_ccs_rw_ctx(ctx_id) {
 		ctx = &tile->sriov.vf.ccs[ctx_id];
-		err = register_save_restore_context(ctx->migrate, ctx_id);
+		err = register_save_restore_context(ctx);
 		if (err)
 			return err;
 	}
@@ -236,13 +236,14 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_tile_vf_ccs *ctx = arg;
-	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
+	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 
 	/*
 	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
 	 * submits this context to HW on VF pause after unbinding device.
 	 */
 	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
+	xe_exec_queue_put(ctx->mig_q);
 }
 
 /**
@@ -258,8 +259,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_migrate *migrate;
 	struct xe_tile_vf_ccs *ctx;
+	struct xe_exec_queue *q;
+	u32 flags;
 	int err;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
@@ -270,37 +272,40 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
 
-		migrate = xe_migrate_alloc(tile);
-		if (!migrate) {
-			err = -ENOMEM;
+		flags = EXEC_QUEUE_FLAG_KERNEL |
+			EXEC_QUEUE_FLAG_PERMANENT |
+			EXEC_QUEUE_FLAG_MIGRATE;
+		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
 			goto err_ret;
 		}
-
-		err = xe_migrate_init(migrate);
-		if (err)
-			goto err_ret;
-
-		ctx->migrate = migrate;
+		ctx->mig_q = q;
 
 		err = alloc_bb_pool(tile, ctx);
 		if (err)
-			goto err_ret;
+			goto err_free_queue;
 
 		ccs_rw_update_ring(ctx);
 
-		err = register_save_restore_context(ctx->migrate, ctx_id);
+		err = register_save_restore_context(ctx);
 		if (err)
-			goto err_ret;
+			goto err_free_queue;
 
 		err = devm_add_action_or_reset(xe->drm.dev,
 					       xe_sriov_vf_ccs_fini,
 					       ctx);
+		if (err)
+			goto err_ret;
 	}
 
 	xe->sriov.vf.ccs.initialized = 1;
 
 	return 0;
 
+err_free_queue:
+	xe_exec_queue_put(q);
+
 err_ret:
 	return err;
 }
@@ -319,7 +324,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_migrate *migrate;
+	struct xe_tile_vf_ccs *ctx;
 	struct xe_tile *tile;
 	struct xe_bb *bb;
 	int err = 0;
@@ -334,8 +339,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 		/* bb should be NULL here. Assert if not NULL */
 		xe_assert(xe, !bb);
 
-		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
-		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
+		ctx = &tile->sriov.vf.ccs[ctx_id];
+		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, ctx_id);
 	}
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index e240f3fd18af..93435a6f4cb6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -41,11 +41,11 @@ struct xe_sa_manager;
 struct xe_tile_vf_ccs {
 	/** @id: Id to which context it belongs to */
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	/** @migrate: Migration helper for save/restore of CCS data */
-	struct xe_migrate *migrate;
+	/** @mig_q: exec queues used for migration */
+	struct xe_exec_queue *mig_q;
 
 	struct {
-		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
+		/** @ccs_bb_pool: Pool from which batch buffers are allocated. */
 		struct xe_sa_manager *ccs_bb_pool;
 	} mem;
 };
-- 
2.43.0

