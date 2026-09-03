Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7B9C79F88
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE7E10F7F6;
	Thu,  3 Sep 2026 23:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxhWAMOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F91910E198
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479930; x=1820015930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3h/2JTWv10YjsegIriyN+uyrzq+FkqiTseHVOhdKUyw=;
 b=BxhWAMOTnzAzX04uFz6cSmykmH36ffPYBjDrAcnw6rSylTXvzCWpl3c4
 coBqJfsuBd42pQraCJFkYA/IqQUYfrDVxkGKW4g8scrzrIcXjjyYOFypJ
 vX8jLi5tMjcHb4Hjr1JWfw8PgBGVDNQwrZTXyQdQ34SKEP8QH5asI4AVW
 i//ziXk/9I2+9RCuOcDyOluA5IAp0EynJiOuxnZ9W0hG2p+BNaBcqnu8v
 uOVUqld4MnGDXYfEJc6Bn1yvHCfY5I+rwh/28FlawCLmnNoVm+z61Pexh
 LUMuWtCLcOxElzuq2+bQ82aKQOsJEGAZFPPvBcznA8t7rYV+kesLxm3dh w==;
X-CSE-ConnectionGUID: RjZewZkwSNCnJCefSCjHWg==
X-CSE-MsgGUID: 66AOss5dSX2QOy/yxZL43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637810"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: 3izTuBRsQxGEZLTg6EGmeg==
X-CSE-MsgGUID: JZuvliZbQ8W9keXuxJz8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029049"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 10/25] drm/xe: Update GuC submission backend to run PT jobs
Date: Thu,  3 Sep 2026 16:58:27 -0700
Message-Id: <20260903235842.3401722-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_migrate.h    |  8 +++++++
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cf306568ef30..528869928c1d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -37,9 +37,11 @@
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
@@ -1236,6 +1238,20 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -1261,14 +1277,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
index 92e378a45e53..160045f08cb8 100644
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
index 2ec9de896dfe..84403c242feb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -24,6 +24,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
@@ -163,6 +164,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
+
+void
+xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
+				       const struct xe_migrate_pt_update_ops *ops,
+				       struct xe_vm_pgtable_update_op *pt_op,
+				       int num_ops);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
-- 
2.34.1

