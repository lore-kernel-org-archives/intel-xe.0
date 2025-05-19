Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06837C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 12:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C245410E12A;
	Mon, 19 May 2025 12:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaemLOJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBC310E12A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747658209; x=1779194209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bVhlYOHds0lOJDUJnTDfsWI6NSjv6dK3ypUZDd6ZZQY=;
 b=jaemLOJ3dJzOV0Ch2wVAOIv0YE/S+PISlUh/EcNTmzLg4PW9tPYTYlkc
 ESHiiZQNkEWvj5/FnZ3OnhumUeEQwTbzbhURB7HJVn5hhSfQWudkT7kTA
 j4pD/5/GnwYbTHhie8kvRruXFLz9OdBMPyu+stbnFWyasfMpPo8+KKwmi
 QIIINJIO1fHZQQnejtLF9vvNbSctUea9HPk4KHQlCotLArc0OXKzzwb2r
 6cKSdW8ulNt/77sint3O+YsUjlT/DlxPY3b41tYI0Ob5/4jYaPi4FRcwx
 JmoIhoSRGsnhhtsJx00B9MIAMxhPIUBnOMoBxTWyKAYydKzjtjsE8waXd Q==;
X-CSE-ConnectionGUID: e8nAxGYiS164A7HgGANsoQ==
X-CSE-MsgGUID: Ze0tueJBTW64+6zXVuKpfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52188137"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="52188137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:36:48 -0700
X-CSE-ConnectionGUID: eQ8XKc2TTZeqIov5LFvEEg==
X-CSE-MsgGUID: oXc8kkrJRXGGfUEnZmeNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139870587"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 19 May 2025 05:36:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC 3/3] drm/xe/vf: Register CCS read/write contexts with Guc
Date: Mon, 19 May 2025 18:22:57 +0530
Message-ID: <20250519125257.10070-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
References: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 37 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
 drivers/gpu/drm/xe/xe_migrate.c      | 33 +---------
 drivers/gpu/drm/xe/xe_migrate.h      | 36 ++++++++++-
 drivers/gpu/drm/xe/xe_pm.c           |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 91 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 171 insertions(+), 36 deletions(-)

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
index 43de220b3109..7b3e8e062f88 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -27,6 +27,7 @@
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -35,38 +36,6 @@
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
-/**
- * struct xe_migrate - migrate context.
- */
-struct xe_migrate {
-	/** @q: Default exec queue used for migration */
-	struct xe_exec_queue *q;
-	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
-	struct xe_tile *tile;
-	/** @job_mutex: Timeline mutex for @eng. */
-	struct mutex job_mutex;
-	/** @pt_bo: Page-table buffer object. */
-	struct xe_bo *pt_bo;
-	/** @batch_base_ofs: VM offset of the migration batch buffer */
-	u64 batch_base_ofs;
-	/** @usm_batch_base_ofs: VM offset of the usm batch buffer */
-	u64 usm_batch_base_ofs;
-	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
-	u64 cleared_mem_ofs;
-	/**
-	 * @fence: dma-fence representing the last migration job batch.
-	 * Protected by @job_mutex.
-	 */
-	struct dma_fence *fence;
-	/**
-	 * @vm_update_sa: For integrated, used to suballocate page-tables
-	 * out of the pt_bo.
-	 */
-	struct drm_suballoc_manager vm_update_sa;
-	/** @min_chunk_size: For dgfx, Minimum chunk size */
-	u64 min_chunk_size;
-};
-
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
 #define NUM_KERNEL_PDE 15
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2a2f6c4690fb..991c77ba523f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -8,6 +8,9 @@
 
 #include <linux/types.h>
 
+#include "xe_bo.h"
+#include "xe_sched_job.h"
+
 struct dma_fence;
 struct iosys_map;
 struct ttm_resource;
@@ -15,7 +18,6 @@ struct ttm_resource;
 struct xe_bo;
 struct xe_gt;
 struct xe_exec_queue;
-struct xe_migrate;
 struct xe_migrate_pt_update;
 struct xe_sync_entry;
 struct xe_pt;
@@ -24,6 +26,38 @@ struct xe_vm;
 struct xe_vm_pgtable_update;
 struct xe_vma;
 
+/**
+ * struct xe_migrate - migrate context.
+ */
+struct xe_migrate {
+	/** @q: Default exec queue used for migration */
+	struct xe_exec_queue *q;
+	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
+	struct xe_tile *tile;
+	/** @job_mutex: Timeline mutex for @eng. */
+	struct mutex job_mutex;
+	/** @pt_bo: Page-table buffer object. */
+	struct xe_bo *pt_bo;
+	/** @batch_base_ofs: VM offset of the migration batch buffer */
+	u64 batch_base_ofs;
+	/** @usm_batch_base_ofs: VM offset of the usm batch buffer */
+	u64 usm_batch_base_ofs;
+	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
+	u64 cleared_mem_ofs;
+	/**
+	 * @fence: dma-fence representing the last migration job batch.
+	 * Protected by @job_mutex.
+	 */
+	struct dma_fence *fence;
+	/**
+	 * @vm_update_sa: For integrated, used to suballocate page-tables
+	 * out of the pt_bo.
+	 */
+	struct drm_suballoc_manager vm_update_sa;
+	/** @min_chunk_size: For dgfx, Minimum chunk size */
+	u64 min_chunk_size;
+};
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
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
index d808dbba71e6..8cfbc889d865 100644
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
@@ -118,6 +121,82 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 	return 0;
 }
 
+static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_lrc *lrc = ctx->migrate->q->lrc[0];
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
+	err = xe_guc_register_exec_queue(m->q, ctx_type);
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
+	if (!IS_SRIOV_VF(xe) || IS_DGFX(xe))
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
+	struct xe_lrc *lrc = ctx->migrate->q->lrc[0];
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
@@ -150,6 +229,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
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
 	return 0;
@@ -187,7 +276,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 			if(bb)
 				xe_sriov_err(xe, "Probable memory leak\n");
 
-			migrate = tile->sriov.vf.ccs_rw_ctx[ctx_id].migrate;
+			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
 			err = xe_migrate_ccs_rw_copy(migrate, bo, bo,
 						     bo->ttm.resource,
 						     bo->ttm.resource,
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

