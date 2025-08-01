Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C61C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40A10E848;
	Fri,  1 Aug 2025 13:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agfc7qWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473A110E848
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754053674; x=1785589674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7v1b1qOLmzC/lJxjohwCeRouDL4v3vRNsvuH7JFrmro=;
 b=agfc7qWTiUKA9MYCdXDhpQ6JuyNZSrrhS1kzaqO23gWe+9NFMVX/7BLB
 AFs66JrLNW6ZGd00PNZpwGUZv7Hz8IR9al3VEPB90vPGfPCpB+55W7/LJ
 Pey4XE/eMFM8IVptCkWZN31g6yO03yvt1FmVW0lKb240HmA+2c0na691c
 Am3guJfl9fC4UShOUTxsgTm18+ZiJxe/4QaKb2RhcbxBRPsh8WRGwy5eb
 1FQk0fINGnJW1ChBoftg8e9dugrSelM1ztB4jjjT1BxY357fywwsfzjE6
 1YCWyfNADqL9tKEMS8gj3yIZHD2l2fU60dECMsdrkKs13N1U8jyHUfBMv w==;
X-CSE-ConnectionGUID: xNIzyxp8T0608G5jflQ7Gw==
X-CSE-MsgGUID: 8Gb3KgLyR76dztcY3LabRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67762903"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67762903"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 06:07:54 -0700
X-CSE-ConnectionGUID: joOT1b//SvK4kOMgPCw85g==
X-CSE-MsgGUID: h0xvLKQ/TPujXTfJ06JFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167743900"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 06:07:52 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/2] drm/xe/vf: Refactor CCS save/restore to use default
 migration context
Date: Fri,  1 Aug 2025 18:54:40 +0530
Message-ID: <20250801132441.25463-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
References: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
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

---
V1 -> V2:
- Fix kernel-doc issues reported by patchworks.
---
 drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3a276e2348a2..7d3c7c4e2185 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -960,14 +960,14 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate->q->lrc[0];
 }
 
-static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
+static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
 				 u32 flags)
 {
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
 		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
+	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0])) |
 		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
+	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0]));
 	dw[i++] = MI_NOOP;
 	dw[i++] = MI_NOOP;
 
@@ -976,7 +976,8 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
 
 /**
  * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
- * @m: The migration context.
+ * @tile: Tile whose migration context to be used.
+ * @q : Execution to be used along with migration context.
  * @src_bo: The buffer object @src is currently bound to.
  * @read_write : Creates BB commands for CCS read/write.
  *
@@ -987,7 +988,7 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
  *
  * Return: 0 if successful, negative error code on failure.
  */
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
 
@@ -995,7 +996,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
 	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
 	struct ttm_resource *src = src_bo->ttm.resource;
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct xe_gt *gt = tile->primary_gt;
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
@@ -1078,11 +1080,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 
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
index e81ea6b27fb5..9e20da6d58c2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -124,7 +124,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
-int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index bf9fa1238462..616fd57794a6 100644
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
@@ -168,7 +169,7 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 
 static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
 {
-	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
+	struct xe_lrc *lrc = ctx->q[ctx->ctx_id]->lrc[0];
 	u64 addr = ctx->mem.ccs_bb_pool->gpu_addr;
 	u32 dw[10], i = 0;
 
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
+	xe_guc_register_exec_queue(ctx->q[ctx->ctx_id], ctx_type);
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
+	struct xe_lrc *lrc = ctx->q[ctx->ctx_id]->lrc[0];
 
 	/*
 	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
 	 * submits this context to HW on VF pause after unbinding device.
 	 */
 	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
+	xe_exec_queue_put(ctx->q[ctx->ctx_id]);
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
@@ -270,27 +272,25 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
 
-		migrate = xe_migrate_alloc(tile);
-		if (IS_ERR(migrate)) {
-			err = PTR_ERR(migrate);
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
+		ctx->q[ctx_id] = q;
 
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
@@ -301,6 +301,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 
 	return 0;
 
+err_free_queue:
+	xe_exec_queue_put(q);
+
 err_ret:
 	return err;
 }
@@ -319,7 +322,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_migrate *migrate;
+	struct xe_tile_vf_ccs *ctx;
 	struct xe_tile *tile;
 	struct xe_bb *bb;
 	int err = 0;
@@ -334,8 +337,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 		/* bb should be NULL here. Assert if not NULL */
 		xe_assert(xe, !bb);
 
-		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
-		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
+		ctx = &tile->sriov.vf.ccs[ctx_id];
+		err = xe_migrate_ccs_rw_copy(tile, ctx->q[ctx_id], bo, ctx_id);
 	}
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index e240f3fd18af..465db42f2e66 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -43,6 +43,8 @@ struct xe_tile_vf_ccs {
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	/** @migrate: Migration helper for save/restore of CCS data */
 	struct xe_migrate *migrate;
+	/** @q: exec queues used for migration */
+	struct xe_exec_queue *q[XE_SRIOV_VF_CCS_CTX_COUNT];
 
 	struct {
 		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
-- 
2.43.0

