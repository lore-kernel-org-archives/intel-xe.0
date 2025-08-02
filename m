Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17741C87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 03:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C940B10E3D4;
	Sat,  2 Aug 2025 03:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTgTrS5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13F410E8F5
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754104240; x=1785640240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64i4SujMUoANNhR/DcaadRUMyWvr+46ttj9FBFn0TcA=;
 b=iTgTrS5ZsSHekJA3UdmfwVqFxogeQCOEn1o+m1eEhVAgi/ePH3Fr4PP7
 Cam5rGC+efxDM/yuMbB/dgBQXn7mhGa+78i9dzjmiknX9o0UD+p5wAW6o
 nad+bVfi0YNBl6ar5BKZIUPKgOxxMvvY6LTo/riZ4txpjCwCd8ZRCduQx
 q5dcx/JPjIYeAeHQSp5u0GMuEJVhXZUI4b9wwr9kfOI854khFsux3dNOf
 3ayUmpJa2nwk2o+seD1AeTEWIJZUdb7b6/MVKtCJ1k2tOtV5Pa2f2VMpr
 eWXALxpVei4SZ8YOGEapyFrxqGMpRYBAN9M2jBkrwkPL6bet6kuU3b+Je g==;
X-CSE-ConnectionGUID: ousyPwlWRAOZs58g9Jug7A==
X-CSE-MsgGUID: vW3Z76BSQaWfsLscJQKFMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73910613"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73910613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 20:10:40 -0700
X-CSE-ConnectionGUID: IQ/i8/z0TyeJ3ISwBJPAXg==
X-CSE-MsgGUID: cBgEg7/CQVOmIXL+SpyGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169093903"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 20:10:38 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v9 7/8] drm/xe/vf: Refresh utilization buffer during migration
 recovery
Date: Sat,  2 Aug 2025 05:10:44 +0200
Message-Id: <20250802031045.1127138-8-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250802031045.1127138-1-tomasz.lis@intel.com>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
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

The WA buffer we use to capture context utilization contains GGTT
references. This means its instructions have to be either fixed or
re-emitted during VF post-migration recovery.

This patch adds re-emitting content of the utilization WA BB during
the recovery.

The way we write to vram requires scratch buffer to be used before
the whole block is memcopied. We are re-using a scratch buffer
introduced in earlier part of the recovery. This is not a performance
optimization, but a necessity to avoid creating dependencies between
locks.

v2: Notable rebase after "Prepare WA BB setup for more users" patch
v3: Added error propagation

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 10 +++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c        | 39 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.h        |  4 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 15 ++++++------
 7 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 05a1bd6b55bf..6c176183ed58 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1082,15 +1082,23 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
  * within all LRCs of a queue.
  * @q: the &xe_exec_queue struct instance containing target LRCs
  * @scratch: scratch buffer to be used as temporary storage
+ *
+ * Returns: zero on success, negative error code on failure
  */
-void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
+int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 {
 	int i;
+	int err = 0;
 
 	for (i = 0; i < q->width; ++i) {
 		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
+		if (err)
+			break;
 	}
+
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0ffc0cb03aa6..4d416f23001c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -90,7 +90,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
-void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
+int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f32ddd9bf48b..2414e8308f97 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2529,14 +2529,22 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
  * exec queues registered to given GuC.
  * @guc: the &xe_guc struct instance
  * @scratch: scratch buffer to be used as temporary storage
+ *
+ * Returns: zero on success, negative error code on failure.
  */
-void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
+int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
+	int err = 0;
 
 	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
+		if (err)
+			break;
+	}
 	mutex_unlock(&guc->submission_state.lock);
+
+	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 92a6f0ade615..6b5df5d0956b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -48,6 +48,6 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
-void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
+int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9a67f4ae235a..8760c4c2ca38 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -41,7 +41,6 @@
 #define LRC_PPHWSP_SIZE				SZ_4K
 #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
-#define LRC_WA_BB_SIZE				SZ_4K
 
 /*
  * Layout of the LRC and associated data allocated as
@@ -1149,13 +1148,11 @@ static int setup_bo(struct bo_setup_state *state)
 	ssize_t remain;
 
 	if (state->lrc->bo->vmap.is_iomem) {
-		state->buffer = kmalloc(state->max_size, GFP_KERNEL);
 		if (!state->buffer)
 			return -ENOMEM;
 		state->ptr = state->buffer;
 	} else {
 		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
-		state->buffer = NULL;
 	}
 
 	remain = state->max_size / sizeof(u32);
@@ -1180,7 +1177,6 @@ static int setup_bo(struct bo_setup_state *state)
 	return 0;
 
 fail:
-	kfree(state->buffer);
 	return -ENOSPC;
 }
 
@@ -1192,10 +1188,16 @@ static void finish_bo(struct bo_setup_state *state)
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
 			 state->offset, state->buffer,
 			 state->written * sizeof(u32));
-	kfree(state->buffer);
 }
 
-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+/**
+ * xe_lrc_setup_wa_bb_with_scratch - Execute all wa bb setup callbacks.
+ * @lrc: the &xe_lrc struct instance
+ * @hwe: the &xe_hw_engine struct instance
+ * @scratch: preallocated scratch buffer for temporary storage
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *scratch)
 {
 	static const struct bo_setup funcs[] = {
 		{ .setup = setup_timestamp_wa },
@@ -1206,6 +1208,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		.lrc = lrc,
 		.hwe = hwe,
 		.max_size = LRC_WA_BB_SIZE,
+		.buffer = scratch,
 		.reserve_dw = 1,
 		.offset = __xe_lrc_wa_bb_offset(lrc),
 		.funcs = funcs,
@@ -1228,6 +1231,21 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 }
 
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	u32 *buf = NULL;
+	int ret;
+
+	if (lrc->bo->vmap.is_iomem)
+		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
+
+	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
+
+	kfree(buf);
+
+	return ret;
+}
+
 static int
 setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
@@ -1238,6 +1256,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		.lrc = lrc,
 		.hwe = hwe,
 		.max_size = (63 * 64) /* max 63 cachelines */,
+		.buffer = NULL,
 		.offset = __xe_lrc_indirect_ctx_offset(lrc),
 	};
 	int ret;
@@ -1254,9 +1273,14 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
 		return 0;
 
+	if (lrc->bo->vmap.is_iomem)
+		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
+
 	ret = setup_bo(&state);
-	if (ret)
+	if (ret) {
+		kfree(state.buffer);
 		return ret;
+	}
 
 	/*
 	 * Align to 64B cacheline so there's no garbage at the end for CS to
@@ -1268,6 +1292,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	}
 
 	finish_bo(&state);
+	kfree(state.buffer);
 
 	xe_lrc_write_ctx_reg(lrc,
 			     CTX_CS_INDIRECT_CTX,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eceeeee6c021..188565465779 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,6 +42,8 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
 #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
+#define LRC_WA_BB_SIZE SZ_4K
+
 #define XE_LRC_CREATE_RUNALONE 0x1
 #define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
@@ -129,6 +131,8 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
 u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+				    u32 *scratch);
 
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index a219395c15de..5de81f213d83 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -247,7 +247,7 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
 {
-	return xe_lrc_reg_size(xe);
+	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
 }
 
 /**
@@ -274,22 +274,23 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 		return -ENOMEM;
 
 	err = xe_gt_sriov_vf_query_config(gt);
-	if (err) {
-		kfree(buf);
-		return err;
-	}
+	if (err)
+		goto out;
 
 	shift = xe_gt_sriov_vf_ggtt_shift(gt);
 	if (shift) {
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
+		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
+		if (err)
+			goto out;
 		xe_guc_jobs_ring_rebase(&gt->uc.guc);
 		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
 
+out:
 	kfree(buf);
-	return 0;
+	return err;
 }
 
 static void vf_post_migration_recovery(struct xe_device *xe)
-- 
2.25.1

