Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F537CD6E78
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFD211A181;
	Thu,  4 Jun 2026 16:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GasvBGDI";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8638011A167
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589220;
 bh=TZ19PZyskbrSUomeBeeHhC9KmqR4i0GC7EdO0pFbs1s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GasvBGDIKtbOGgzUIa6xfDXsZASgaNB4Yyio6Sn5Og1SPWZjonEPUN0HCjINFx2Go
 bREb8stclbs/QCmZjNHL93W/rkSzmhpL7+1U5NsEmuFhW6+fNJ6MI9GGkhoOwOHDSF
 YHSCX2GTUB36hTP8sDOAiWKnSHKniiItNh+nXbmTBFghX48lCx6MymHnBti+VA5Dk6
 OzcvaBmZhzVJymbJvPhWdDdB105bkBG25Ir9Q7dvcj6TSn8UrTWG7Oqbx137dQCSAg
 mPjJgC/8hNWTDM+KfbqSqtXGzrqq/fpqbgg8bbwc5M57SkXeggrftxKQDVFIZsVInB
 qlp3eKWj5neEg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 10/24] drm/xe: Update GuC submission backend to run PT jobs
Date: Thu,  4 Jun 2026 18:06:39 +0200
Message-ID: <20260604160655.50036-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index 3db537e071e9b..965c829229d28 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -36,8 +36,10 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
 #include "xe_pm.h"
+#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
@@ -1202,6 +1204,20 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -1227,14 +1243,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
index b6316cb6a9398..9098fc36cda22 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1800,7 +1800,18 @@ struct migrate_test_params {
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
index 1aec7bf944d59..1e45c739883d7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -24,6 +24,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
@@ -161,6 +162,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
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
2.53.0

