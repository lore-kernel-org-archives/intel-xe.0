Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783D4C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 16:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383D210E56F;
	Mon, 21 Jul 2025 16:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVSUpO8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C50F10E56F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113648; x=1784649648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkoE3pBC31qbyuT106/4vyk9QaYvRtLb+MLb9MFaB3k=;
 b=VVSUpO8GsI086YnK1M6V0nJfMHpYanXz6MxP8gqh5gl4Gtb+NgJG9zaX
 N9kfwDDd7vYHqM2xgTVa8kmqJwTT0/RksCLRQuceMhjPXXHxXgZ1CJnFM
 2GZZetAzWEYrU4aMto+6GZ7TIRflqDBPNyVTED/ttlMD2Rn5ZkaY0CbON
 4TWs9X6sBPe6i7fL3MFjiKy2a2Jh+HG2gidLZ0uuOX77Qeyea2O9rViD5
 XjH/UJBaDOWcR084rlYmF4H6oFI+8vl1/Z6iOW6QzDuDygOm4gn7pLXdt
 gWJVPQHsRfdFAPjH/9griRmXAkYjgECvQUlpTasAyMbbj1qRcJXSb4Dty A==;
X-CSE-ConnectionGUID: VkD73yHCRz+LEnCyxM9PQw==
X-CSE-MsgGUID: TwZlrMiZTSiwBHmBczqcbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="77874051"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="77874051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:00:47 -0700
X-CSE-ConnectionGUID: YS0tNBcnQsaStvQi2Bh1mg==
X-CSE-MsgGUID: rg4rGxkKQAyiGHSNUpyv6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159422023"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 09:00:44 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v11 3/3] drm/xe/vf: Register CCS read/write contexts with Guc
Date: Mon, 21 Jul 2025 21:47:24 +0530
Message-ID: <20250721161724.26879-4-satyanarayana.k.v.p@intel.com>
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

Register read write contexts with newly added flags with GUC and
enable the context immediately after registration.
Re-register the context with Guc when resuming from runtime suspend as
soft reset is applied to Guc during xe_pm_runtime_resume().
Make Ring head=tail while unbinding device to avoid issues with VF pause
after device is unbinded.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

V10 -> V11:
- Fixed issue with updating read/write lrc to Guc.
- Fixed kernel-doc issues reported by patchworks.

V9 -> V10:
- None

V8 -> V9:
- Fixed review comments (Matthew Brost).

V7 -> V8:
-None.

V6 -> V7:
- Fixed review comments (Matthew Brost).
- Replaced xe_tile_migrate_exec_queue() with xe_migrate_exec_queue() as per
review comments (Matthew Brost).

V5 -> V6:
- None

V4 -> V5:
- Fixed review comments (Matthew Brost).

V3 -> V4:
- Fixed issues reported by patchworks.

V2 -> V3:
- Made xe_migrate structure private as per review comments.
- Created new xe_migrate functions to get lrc and exec_queue.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 34 +++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
 drivers/gpu/drm/xe/xe_migrate.c      | 35 +++++++----
 drivers/gpu/drm/xe/xe_migrate.h      |  4 +-
 drivers/gpu/drm/xe/xe_pm.c           |  4 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 92 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c           |  6 +-
 9 files changed, 162 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb..ca9f999d38d1 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -45,6 +45,11 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
+#define GUC_CONTEXT_NORMAL			0
+#define GUC_CONTEXT_COMPRESSION_SAVE		1
+#define GUC_CONTEXT_COMPRESSION_RESTORE	2
+#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
+
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cafb47711e9b..751da5cd1d44 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -542,7 +542,7 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_exec_queue(struct xe_exec_queue *q)
+static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -550,6 +550,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
 	struct guc_ctxt_registration_info info;
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
@@ -559,6 +560,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
+	if (ctx_type != GUC_CONTEXT_NORMAL)
+		info.flags |= BIT(ctx_type);
+
 	if (xe_exec_queue_is_parallel(q)) {
 		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
@@ -761,7 +765,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_exec_queue(q);
+			register_exec_queue(q, GUC_CONTEXT_NORMAL);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
@@ -2377,6 +2381,32 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 	xe_guc_exec_queue_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_register_exec_queue - Register exec queue for a given context type.
+ * @q: Execution queue
+ * @ctx_type: Type of the context
+ *
+ * This function registers the execution queue with the guc. Special context
+ * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
+ * are only applicable for IGPU and in the VF.
+ * Submits the execution queue to GUC after registering it.
+ *
+ * Returns - None.
+ */
+void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	xe_assert(xe, !IS_DGFX(xe));
+	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
+		       ctx_type < GUC_CONTEXT_COUNT));
+
+	register_exec_queue(q, ctx_type);
+	enable_scheduling(q);
+}
+
 /**
  * xe_guc_submit_print - GuC Submit Print.
  * @guc: GuC.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 9b71a986c6ca..8f64e799283b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 30474d92a9b9..5a0ace9f128a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -86,19 +86,6 @@ struct xe_migrate {
  */
 #define MAX_PTE_PER_SDI 0x1FEU
 
-/**
- * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
- * @tile: The tile.
- *
- * Returns the default migrate exec queue of this tile.
- *
- * Return: The default migrate exec queue
- */
-struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
-{
-	return tile->migrate->q;
-}
-
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
@@ -1091,6 +1078,28 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 	return err;
 }
 
+/**
+ * xe_get_migrate_lrc() - Get the LRC from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to LRC on success, error on failure
+ */
+struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
+{
+	return migrate->q->lrc[0];
+}
+
+/**
+ * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to execution queue on success, error on failure
+ */
+struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
+{
+	return migrate->q;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index a1f4e91b25db..f4dac270dba3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -119,6 +119,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
+struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
+struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
@@ -139,6 +141,4 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
 
 void xe_migrate_wait(struct xe_migrate *m);
-
-struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 073849182ed8..44aaf154ddf7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -23,6 +23,7 @@
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -554,6 +555,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_ccs_register_context(xe);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 6ddeb016b892..af43e04179aa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -8,6 +8,9 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_guc_submit.h"
+#include "xe_lrc.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_sriov_printk.h"
@@ -163,6 +166,85 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 	return 0;
 }
 
+static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
+	u64 addr = ctx->mem.ccs_bb_pool->gpu_addr;
+	u32 dw[10], i = 0;
+
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
+	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
+	dw[i++] = lower_32_bits(addr);
+	dw[i++] = upper_32_bits(addr);
+	dw[i++] = MI_NOOP;
+	dw[i++] = MI_NOOP;
+
+	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
+	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+}
+
+static int register_save_restore_context(struct xe_migrate *m,
+					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+{
+	int err = -EINVAL;
+	int ctx_type;
+
+	switch (ctx_id) {
+	case XE_SRIOV_VF_CCS_READ_CTX:
+		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
+		break;
+	case XE_SRIOV_VF_CCS_WRITE_CTX:
+		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
+		break;
+	default:
+		return err;
+	}
+
+	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
+	return 0;
+}
+
+/**
+ * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
+ * @xe: the &xe_device to register contexts on.
+ *
+ * This function registers read and write contexts with Guc. Re-registration
+ * is needed whenever resuming from pm runtime suspend.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_tile_vf_ccs *ctx;
+	int err;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		ctx = &tile->sriov.vf.ccs[ctx_id];
+		err = register_save_restore_context(ctx->migrate, ctx_id);
+		if (err)
+			return err;
+	}
+
+	return err;
+}
+
+static void xe_sriov_vf_ccs_fini(void *arg)
+{
+	struct xe_tile_vf_ccs *ctx = arg;
+	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
+
+	/*
+	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
+	 * submits this context to HW on VF pause after unbinding device.
+	 */
+	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
+}
+
 /**
  * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
  * @xe: the &xe_device to start recovery on
@@ -198,6 +280,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		err = alloc_bb_pool(tile, ctx);
 		if (err)
 			goto err_ret;
+
+		ccs_rw_update_ring(ctx);
+
+		err = register_save_restore_context(ctx->migrate, ctx_id);
+		if (err)
+			goto err_ret;
+
+		err = devm_add_action_or_reset(xe->drm.dev,
+					       xe_sriov_vf_ccs_fini,
+					       ctx);
 	}
 
 	xe->sriov.vf.ccs.initialized = 1;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 5d5e4bd25904..1f1baf685fec 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -12,5 +12,6 @@ struct xe_bo;
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
+int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2035604121e6..432ea325677d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -953,7 +953,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_migrate_exec_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
@@ -1043,7 +1043,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_migrate_exec_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
@@ -1126,7 +1126,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_migrate_exec_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
-- 
2.43.0

