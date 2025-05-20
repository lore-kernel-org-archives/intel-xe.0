Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8244DC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 14:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AFB10E61A;
	Tue, 20 May 2025 14:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA7HmrWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEF110E61A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747752819; x=1779288819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZTvlDOAW4GhuLuhA4I5v1KR2EgCP4fJHcqA5IB7LS24=;
 b=JA7HmrWpMp2k/JJXeBkt6Vsyr1CqE5VmwuUCnfSYekA72nZG3DdI3JDj
 ZDW5A3VraqQ0jkWYKrzqOG6WZszc6QaXQ/vwVG+Wss1QGrux1/JNh9U9D
 rraC+sli68mznzyYxkE4QTltz9tnvv4Uic1LY06FrlQnFmQhzU985yO3h
 kBerf2HeA5uolTqVb/0m+PyEIOTseCICgTUkYrcKUULH2yI0qNCvNcnLw
 lSXA+9NDGVCTEJJYBQM6Ze2tMX03JEHY42sTngc59MsUDHMJVY5KST39/
 sDIGnKJxM7UjNWNDMSVsN7W5arnLTJq/2RdTOXlB9SKwjvwLw65ZgCpmf w==;
X-CSE-ConnectionGUID: MXoGbuojQouXPvmGj6XvfA==
X-CSE-MsgGUID: ckxM5axOSY+nWIVx/DAcMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48945626"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48945626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:53:38 -0700
X-CSE-ConnectionGUID: asEMGgCcQLG8IDBxxLGmzQ==
X-CSE-MsgGUID: /BhpsxD6QDS1GcTbODtkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140724474"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2025 07:53:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [RFC v3 3/3] drm/xe/vf: Register CCS read/write contexts with Guc
Date: Tue, 20 May 2025 20:39:45 +0530
Message-ID: <20250520150946.4034-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520150946.4034-1-satyanarayana.k.v.p@intel.com>
References: <20250520150946.4034-1-satyanarayana.k.v.p@intel.com>
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
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

V2 -> V3:
- Made xe_migrate structure private as per review comments.
- Created new xe_migrate functions to get lrc and exec_queue.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 37 +++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
 drivers/gpu/drm/xe/xe_migrate.c      | 32 ++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |  3 +
 drivers/gpu/drm/xe/xe_pm.c           |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 169 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb..71a5208d0316 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -45,6 +45,11 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
+#define GUC_CONTEXT_NORMAL			0
+#define GUC_CONTEXT_COMPRESSION_SAVE		1
+#define GUC_CONTEXT_COMPRESSION_RESTORE	2
+#define GUC_CONTEXT_MAX_TYPES			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
+
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80f748baad3f..fc50f354dba9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -531,7 +531,7 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_exec_queue(struct xe_exec_queue *q)
+static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -548,6 +548,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
+	if (ctx_type != GUC_CONTEXT_NORMAL)
+		info.flags |= BIT(ctx_type);
+
 	if (xe_exec_queue_is_parallel(q)) {
 		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
@@ -750,7 +753,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_exec_queue(q);
+			register_exec_queue(q, GUC_CONTEXT_NORMAL);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
@@ -2347,6 +2350,36 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 	xe_guc_exec_queue_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_register_exec_queue - Register exec queue for a given context type.
+ * @q - Execution queue
+ * @ctx_type - Type of the context
+ *
+ * This function registers the execution queue with the guc. Special context
+ * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
+ * are only applicable for IGPU and in the VF.
+ * Submits the execution queue to GUC after registering it.
+ *
+ * Returns - Success or error
+ */
+int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	if (ctx_type != GUC_CONTEXT_NORMAL) {
+		xe_assert(xe, IS_SRIOV_VF(xe));
+		if (IS_DGFX(xe) || (ctx_type < GUC_CONTEXT_COMPRESSION_SAVE &&
+				    ctx_type >= GUC_CONTEXT_MAX_TYPES))
+			return -EPERM;
+	}
+
+	register_exec_queue(q, ctx_type);
+	enable_scheduling(q);
+
+	return 0;
+}
+
 /**
  * xe_guc_submit_print - GuC Submit Print.
  * @guc: GuC.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 9b71a986c6ca..f1a26d498339 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 43de220b3109..4461af935409 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1099,6 +1099,38 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 	return err;
 }
 
+/**
+ * xe_get_migrate_lrc() - Get the LRC from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to LRC on success, -EINVAL on failure
+ */
+struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate)
+{
+	int err = -EINVAL;
+
+	if (!migrate)
+		return ERR_PTR(err);
+
+	return migrate->q->lrc[0];
+}
+
+/**
+ * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to execution queue on success, -EINVAL on failure
+ */
+struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate)
+{
+	int err = -EINVAL;
+
+	if (!migrate)
+		return ERR_PTR(err);
+
+	return migrate->q;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2a2f6c4690fb..0867e79b6817 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -120,6 +120,9 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 			   bool copy_only_ccs,
 			   bool read_write);
 
+struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate);
+struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate);
+
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f64ebd7b854a..7ebec680749c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -22,6 +22,7 @@
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -546,6 +547,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_sriov_vf_ccs_register_context(xe);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 0c7e27fc3808..96f8bbd08583 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -7,6 +7,9 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_guc_submit.h"
+#include "xe_lrc.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_sriov_printk.h"
@@ -115,6 +118,82 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 	return 0;
 }
 
+static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
+	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
+	u32 dw[10], i = 0;
+
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
+	dw[i++] = addr;
+	dw[i++] = 0;
+	dw[i++] = MI_NOOP;
+
+	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
+}
+
+static int register_save_restore_context(struct xe_migrate *m, int ctx_id)
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
+	err = xe_guc_register_exec_queue(xe_migrate_get_exec_queue(m), ctx_type);
+	return err;
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
+	struct xe_tile_vf_ccs *ctx;
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+	int err;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			ctx = &tile->sriov.vf.ccs[ctx_id];
+			err = register_save_restore_context(ctx->migrate, ctx_id);
+		}
+	}
+
+	return err;
+}
+
+static void xe_sriov_vf_ccs_fini(void *arg)
+{
+	struct xe_tile_vf_ccs *ctx = arg;
+	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
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
@@ -148,6 +227,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 			err = alloc_bb_pool(tile, ctx);
 			if (err)
 				goto err_ret;
+
+			ccs_rw_update_ring(ctx);
+
+			err = register_save_restore_context(migrate, ctx_id);
+			if (err)
+				goto err_ret;
+
+			err = devm_add_action_or_reset(xe->drm.dev,
+						       xe_sriov_vf_ccs_fini,
+						       ctx);
 		}
 	}
 
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
-- 
2.43.0

