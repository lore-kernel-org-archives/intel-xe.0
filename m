Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E17FC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F6310E4B4;
	Mon, 28 Jul 2025 09:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tim5k9NO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2F10E3E9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753695963; x=1785231963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGswcOUez4QYbj0aU272AAHmL8oTvuVZUR0LZXNu6X8=;
 b=Tim5k9NO+J0naK8L30ptnpmZJyg416hzX1DYN/CONdZec4OreS/jzTHS
 rZgbabRnaqmQKxLzVaKQFvDC33ysOtPleurHi3InOE6/ccQS+v6dteOCb
 ZzXpN4hcmKEtViveXJq+3yGC+3dvDg/7UMEmHb0wJ13LHkSKU497J/yuZ
 LIxO5xU/w/oQOYQvnSgEX3Bp3bOey9Y29ftfwAKmuJsJZMzfuU6zGe+Rc
 EHwI6kmosHVzDFBxXMLoR4XkIrXbKqNi72GhhvxoEE9kc25p5Dago7e1W
 M03TzSIHGTzW9QgRMrHp0QxtT969J1mIVFuCAVOhEZJ/0bDsyEA9LVot+ g==;
X-CSE-ConnectionGUID: vhWP1/q7T7yJK89nM3VX4Q==
X-CSE-MsgGUID: 3jneb86xTCeQxQeE6WJVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66207731"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66207731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:46:03 -0700
X-CSE-ConnectionGUID: tKUT6/8GTNOuTgFqKNnRaQ==
X-CSE-MsgGUID: o5/Hq5ybRSef2lkpZGjFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167706224"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2025 02:46:01 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 1/3] Revert "drm/xe/vf: Register CCS read/write contexts with
 Guc"
Date: Mon, 28 Jul 2025 15:32:46 +0530
Message-ID: <20250728100248.3333-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728100248.3333-1-satyanarayana.k.v.p@intel.com>
References: <20250728100248.3333-1-satyanarayana.k.v.p@intel.com>
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

This reverts commit 916ee4704a8653910f10c65c2b5d6699dfac5df8.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 --
 drivers/gpu/drm/xe/xe_guc_submit.c   | 34 +---------
 drivers/gpu/drm/xe/xe_guc_submit.h   |  1 -
 drivers/gpu/drm/xe/xe_migrate.c      | 24 ++++----
 drivers/gpu/drm/xe/xe_migrate.h      |  4 +-
 drivers/gpu/drm/xe/xe_pm.c           |  4 --
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 92 ----------------------------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 -
 drivers/gpu/drm/xe/xe_vm.c           |  6 +-
 9 files changed, 20 insertions(+), 151 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index ca9f999d38d1..6f57578b07cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -45,11 +45,6 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
-#define GUC_CONTEXT_NORMAL			0
-#define GUC_CONTEXT_COMPRESSION_SAVE		1
-#define GUC_CONTEXT_COMPRESSION_RESTORE	2
-#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
-
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 751da5cd1d44..cafb47711e9b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -542,7 +542,7 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
+static void register_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -550,7 +550,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	struct guc_ctxt_registration_info info;
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
@@ -560,9 +559,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
-	if (ctx_type != GUC_CONTEXT_NORMAL)
-		info.flags |= BIT(ctx_type);
-
 	if (xe_exec_queue_is_parallel(q)) {
 		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
@@ -765,7 +761,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_exec_queue(q, GUC_CONTEXT_NORMAL);
+			register_exec_queue(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
@@ -2381,32 +2377,6 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 	xe_guc_exec_queue_snapshot_free(snapshot);
 }
 
-/**
- * xe_guc_register_exec_queue - Register exec queue for a given context type.
- * @q: Execution queue
- * @ctx_type: Type of the context
- *
- * This function registers the execution queue with the guc. Special context
- * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
- * are only applicable for IGPU and in the VF.
- * Submits the execution queue to GUC after registering it.
- *
- * Returns - None.
- */
-void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-
-	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, !IS_DGFX(xe));
-	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
-		       ctx_type < GUC_CONTEXT_COUNT));
-
-	register_exec_queue(q, ctx_type);
-	enable_scheduling(q);
-}
-
 /**
  * xe_guc_submit_print - GuC Submit Print.
  * @guc: GuC.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8f64e799283b..9b71a986c6ca 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -39,6 +39,5 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
-void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 90065d7d29ff..8d95543c7c35 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -86,6 +86,19 @@ struct xe_migrate {
  */
 #define MAX_PTE_PER_SDI 0x1FEU
 
+/**
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
+ * @tile: The tile.
+ *
+ * Returns the default migrate exec queue of this tile.
+ *
+ * Return: The default migrate exec queue
+ */
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
+{
+	return tile->migrate->q;
+}
+
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
@@ -1091,17 +1104,6 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 	return err;
 }
 
-/**
- * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
- * @migrate: Migrate context.
- *
- * Return: Pointer to execution queue on success, error on failure
- */
-struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
-{
-	return migrate->q;
-}
-
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 3758f9615484..81f647b2052d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -129,7 +129,6 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
-struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
@@ -151,7 +150,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44aaf154ddf7..073849182ed8 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -23,7 +23,6 @@
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
-#include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -555,9 +554,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
-	if (IS_SRIOV_VF(xe))
-		xe_sriov_vf_ccs_register_context(xe);
-
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index af43e04179aa..6ddeb016b892 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -8,9 +8,6 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_exec_queue_types.h"
-#include "xe_guc_submit.h"
-#include "xe_lrc.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_sriov_printk.h"
@@ -166,85 +163,6 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 	return 0;
 }
 
-static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
-{
-	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
-	u64 addr = ctx->mem.ccs_bb_pool->gpu_addr;
-	u32 dw[10], i = 0;
-
-	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
-	dw[i++] = lower_32_bits(addr);
-	dw[i++] = upper_32_bits(addr);
-	dw[i++] = MI_NOOP;
-	dw[i++] = MI_NOOP;
-
-	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
-	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
-}
-
-static int register_save_restore_context(struct xe_migrate *m,
-					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
-{
-	int err = -EINVAL;
-	int ctx_type;
-
-	switch (ctx_id) {
-	case XE_SRIOV_VF_CCS_READ_CTX:
-		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
-		break;
-	case XE_SRIOV_VF_CCS_WRITE_CTX:
-		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
-		break;
-	default:
-		return err;
-	}
-
-	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
-	return 0;
-}
-
-/**
- * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
- * @xe: the &xe_device to register contexts on.
- *
- * This function registers read and write contexts with Guc. Re-registration
- * is needed whenever resuming from pm runtime suspend.
- *
- * Return: 0 on success. Negative error code on failure.
- */
-int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
-{
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_tile_vf_ccs *ctx;
-	int err;
-
-	if (!IS_VF_CCS_READY(xe))
-		return 0;
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		ctx = &tile->sriov.vf.ccs[ctx_id];
-		err = register_save_restore_context(ctx->migrate, ctx_id);
-		if (err)
-			return err;
-	}
-
-	return err;
-}
-
-static void xe_sriov_vf_ccs_fini(void *arg)
-{
-	struct xe_tile_vf_ccs *ctx = arg;
-	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
-
-	/*
-	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
-	 * submits this context to HW on VF pause after unbinding device.
-	 */
-	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
-}
-
 /**
  * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
  * @xe: the &xe_device to start recovery on
@@ -280,16 +198,6 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		err = alloc_bb_pool(tile, ctx);
 		if (err)
 			goto err_ret;
-
-		ccs_rw_update_ring(ctx);
-
-		err = register_save_restore_context(ctx->migrate, ctx_id);
-		if (err)
-			goto err_ret;
-
-		err = devm_add_action_or_reset(xe->drm.dev,
-					       xe_sriov_vf_ccs_fini,
-					       ctx);
 	}
 
 	xe->sriov.vf.ccs.initialized = 1;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 1f1baf685fec..5d5e4bd25904 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -12,6 +12,5 @@ struct xe_bo;
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
-int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..2035604121e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -953,7 +953,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_tile_migrate_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
@@ -1043,7 +1043,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_tile_migrate_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
@@ -1126,7 +1126,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_tile_migrate_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
-- 
2.43.0

