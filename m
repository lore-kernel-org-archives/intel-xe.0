Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BFBC79F8E
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C4F10E580;
	Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh0+PBUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CEE10E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NF1NDiwFtYoLssp0ONaZdmfifMSHe4PKvBAWW5k6TVE=;
 b=Qh0+PBUq+BeO5whhICv1AJOM9imieIIToDfzJpAldFE5Ye+qEjRA7hfO
 HxKNP8lmxuP0f5VwQumUltSuhRfvkAk9dW7dlPdH6gyvQCzbaiNWraxTK
 gbeGJZWJ0FMDpS6STJLgZ7IIZE9ZMnMzlgxAtB2yZbl3zFXMN+gYAlfn9
 cfs271MmFjtTxtmkpYfy8hFkKrSztAdlcy/nIQR3As5bm4XEH7btalRHR
 4i1Tq46/aY+OUefnGaOEWuSRtXPZptUS/DnINWvhbO5QfOtY6mcDURk2c
 et4l9/vYT6J8ZaqzP4QIvUVo5ALKw/CxulGyJD4PbMzAPycl5hEZEEe7E Q==;
X-CSE-ConnectionGUID: f+paYjxDS2mJSrP2H83npg==
X-CSE-MsgGUID: LhdLl/eNR5SixCWdUYHFTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096807"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096807"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: 6HPmxoOISMyO8A7t7CrT6w==
X-CSE-MsgGUID: SdXt9b22TFW2XOGLTpm1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563428"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 10/24] drm/xe: Update GuC submission backend to run PT jobs
Date: Fri,  4 Sep 2026 14:15:59 -0700
Message-Id: <20260904211613.3934307-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 37 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.c    | 13 ++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h    |  7 ++++++
 3 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8b8673f4e037..b7ec96650405 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -38,9 +38,11 @@
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
@@ -1237,6 +1239,20 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return job->is_pt_job;
+}
+
+static void run_pt_job(struct xe_sched_job *job)
+{
+	xe_migrate_update_pgtables_cpu_execute(job->pt_update[0].vm,
+					       job->pt_update[0].tile,
+					       job->pt_update[0].ops,
+					       job->pt_update[0].pt_job_ops->ops,
+					       job->pt_update[0].pt_job_ops->current_op);
+}
+
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -1262,14 +1278,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
 		}
 
-		if (!exec_queue_registered(q))
-			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		if (!job->restore_replay)
-			q->ring_ops->emit_job(job);
-		submit_exec_queue(q, job);
+		if (is_pt_job(job)) {
+			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
+			run_pt_job(job);
+		} else {
+			if (!exec_queue_registered(q))
+				register_exec_queue(q, GUC_CONTEXT_NORMAL);
+			if (!job->restore_replay)
+				q->ring_ops->emit_job(job);
+			submit_exec_queue(q, job);
+		}
 		job->restore_replay = false;
 	}
 
+	if (is_pt_job(job)) {
+		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
+		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
+		return NULL;
+	}
+
 run_job_out:
 
 	return job->fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 217e526526e0..53160c2c35a6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1819,7 +1819,18 @@ struct migrate_test_params {
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
+ *
+ * Execute the VM PT update ops array which results in a VM's PTEs being updated
+ * via the CPU.
+ */
+void
 xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
 				       const struct xe_migrate_pt_update_ops *ops,
 				       struct xe_vm_pgtable_update_op *pt_op,
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2ec9de896dfe..04ef20692b6a 100644
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
+				       u32 num_ops);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
-- 
2.34.1

