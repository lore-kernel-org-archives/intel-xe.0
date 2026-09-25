Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844DDC98331
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D852C10FC38;
	Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKp9W2Xf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB810FC38
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367333; x=1821903333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1jnmku8FBLn9u2EEDqt2LX3m8o6VxNYqzp/2Aw8iA0=;
 b=dKp9W2XfNvXgeRKdIv0+C3uJs38u0Ln00KzeYi4vtxvP0zoVQSYAlj+6
 LCfKseqNEXGJFvkE3Jqw2UYxTzwJnbOE4/IoP4q8aFrQvxzUigN/z6lkP
 f+Kjds13BdPzA2fZkybmXi/q4uRhboeKrn2sqjlOdy6voepjk2bYgT3EK
 Xfg+rESF8DEhjstaiNDDwhTCuEAR9Wf6jipnIlr/wgOA/a1Yz+HcLaHzU
 0IGeXlSnxr66F6k8tJexdbu859PQ2CG7gbDv6E4ULOv+wHKt7S3uWcQtO
 YATFGd8w+tliL7wfnZ+mZOGkd3jc15sV0z2IbzbrWkyXCnXbIAs+Pt6n/ g==;
X-CSE-ConnectionGUID: PectONbAQx2hqmRcrC4eEQ==
X-CSE-MsgGUID: Yl61swFQTYiFStkUUFDEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377952"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: m1FZiViaSTCWgToyM4x6wg==
X-CSE-MsgGUID: fYSPyWXGRaypbIotKdJWFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509865"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 10/24] drm/xe: Update GuC submission backend to run PT jobs
Date: Fri, 25 Sep 2026 13:15:12 -0700
Message-Id: <20260925201526.1355279-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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

PT jobs bypass GPU execution for the final step of a bind job, using the
CPU to program the required page tables. Teach the GuC submission backend
how to execute these jobs.

PT job submission is implemented in the GuC backend for simplicity. A
follow-up patch could introduce a dedicated backend for PT jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.c    | 20 +++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.h    |  7 +++++++
 3 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4bd1ead57efa..9faddb7c6407 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -39,9 +39,11 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
 #include "xe_module.h"
 #include "xe_pm.h"
+#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
@@ -1238,21 +1240,44 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return job->is_pt_job;
+}
+
+static void run_pt_job(struct xe_sched_job *job, bool force_clear)
+{
+	xe_migrate_update_pgtables_cpu_execute(job->pt_update[0].vm,
+					       job->pt_update[0].tile,
+					       job->pt_update[0].ops,
+					       job->pt_update[0].pt_job_ops->ops,
+					       job->pt_update[0].pt_job_ops->current_op,
+					       force_clear);
+}
+
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	bool killed_or_banned_or_wedged =
-		exec_queue_killed_or_banned_or_wedged(q);
+	bool killed_or_banned_or_wedged_or_error  =
+		exec_queue_killed_or_banned_or_wedged(q) ||
+		xe_sched_job_is_error(job);
 
 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		     exec_queue_banned(q) || exec_queue_suspended(q));
 
 	trace_xe_sched_job_run(job);
 
-	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
+	if (is_pt_job(job)) {
+		xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
+		run_pt_job(job, killed_or_banned_or_wedged_or_error);
+		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
+		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
+
+		return NULL;
+	} else if (!killed_or_banned_or_wedged_or_error) {
 		if (xe_exec_queue_is_multi_queue_secondary(q)) {
 			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d7f35aa91c1c..3007fe0b8535 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1819,11 +1819,23 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
-static void
+/**
+ * xe_migrate_update_pgtables_cpu_execute() - Update a VM's PTEs via the CPU
+ * @vm: The VM being updated
+ * @tile: The tile being updated
+ * @ops: The migrate PT update ops
+ * @pt_ops: The VM PT update ops
+ * @num_ops: The number of The VM PT update ops
+ * @force_clear: Force clear
+ *
+ * Execute the VM PT update ops array which results in a VM's PTEs being updated
+ * via the CPU.
+ */
+void
 xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 				       const struct xe_migrate_pt_update_ops *ops,
 				       struct xe_vm_pgtable_update_op *pt_op,
-				       u32 num_ops)
+				       u32 num_ops, bool force_clear)
 {
 	u32 j, i;
 
@@ -1834,7 +1846,7 @@ xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 
 			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
 
-			if (pt_op->bind)
+			if (pt_op->bind && !force_clear)
 				ops->populate(tile, &update->pt_bo->vmap,
 					      NULL, update->ofs, update->qwords,
 					      update);
@@ -1874,7 +1886,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 
 	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
 					       pt_update_ops->pt_job_ops->ops,
-					       pt_update_ops->num_ops);
+					       pt_update_ops->num_ops, false);
 
 	return dma_fence_get_stub();
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2ec9de896dfe..c41f6e3ca2c6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -24,6 +24,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
@@ -163,6 +164,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
+void
+xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
+				       const struct xe_migrate_pt_update_ops *ops,
+				       struct xe_vm_pgtable_update_op *pt_op,
+				       u32 num_ops, bool force_clear);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
-- 
2.34.1

