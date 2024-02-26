Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB95FC54E4A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 15:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952F10E453;
	Mon, 26 Feb 2024 15:59:26 +0000 (UTC)
Received: from mblankhorst.nl (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429C910E453
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 15:59:23 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: Move LRC snapshot capture to HW engine.
Date: Mon, 26 Feb 2024 16:59:12 +0100
Message-ID: <20240226155913.77158-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226155913.77158-1-dev@lankhorst.se>
References: <20240226155913.77158-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

We want to start dumping status pages. Since we created some functions
to dump LRC, I think it makes sense to move it to HW engine section.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

--
XXX: I've used a linear mapping for HW Engine to LRC.
LRC[0] belonging to lowest HW engine instance, etc..
Is this correct for parallel submissions?
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 19 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 21 ---------------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h  |  3 ---
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68d3d623a05b..7002e3b698f2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_lrc.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -113,10 +114,20 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
 
 	drm_printf(&p, "\n**** HW Engines ****\n");
-	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++) {
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
+	}
+
+	drm_puts(&p, "\n**** LRC ****\n");
+	for (i = 0; i < ARRAY_SIZE(coredump->snapshot.lrc); i++) {
+		if (!coredump->snapshot.lrc[i])
+			continue;
+		drm_printf(&p, "LRC %i\n", i);
+		xe_lrc_snapshot_print(coredump->snapshot.lrc[i], &p);
+	}
+
 	if (coredump->snapshot.vm) {
 		drm_printf(&p, "\n**** VM state ****\n");
 		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
@@ -139,9 +150,11 @@ static void xe_devcoredump_free(void *data)
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
 	xe_sched_job_snapshot_free(coredump->snapshot.job);
-	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++) {
+		xe_lrc_snapshot_free(coredump->snapshot.lrc[i]);
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
+	}
 	xe_vm_snapshot_free(coredump->snapshot.vm);
 
 	/* To prevent stale data on next snapshot, clear everything */
@@ -195,6 +208,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		}
 		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
+	for (i = 0; i < q->width; i++)
+		coredump->snapshot.lrc[i] = xe_lrc_snapshot_capture(&q->lrc[i]);
 
 	if (ss->vm)
 		queue_work(system_unbound_wq, &ss->work);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 6f654b63c7f1..d56ac20e2ca9 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -14,6 +14,8 @@
 struct xe_device;
 struct xe_gt;
 
+struct xe_lrc_snapshot;
+
 /**
  * struct xe_devcoredump_snapshot - Crash snapshot
  *
@@ -40,6 +42,10 @@ struct xe_devcoredump_snapshot {
 
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
+
+	/** @lrc: Snapshot of each LRC */
+	struct xe_lrc_snapshot *lrc[XE_NUM_HW_ENGINES];
+
 	/** @job: Snapshot of job state */
 	struct xe_sched_job_snapshot *job;
 	/** @vm: Snapshot of VM state */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7348689ec5ae..66dc561336df 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1814,17 +1814,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
 
-	snapshot->lrc = kmalloc_array(q->width, sizeof(struct xe_lrc_snapshot *),
-				      GFP_ATOMIC);
-
-	if (snapshot->lrc) {
-		for (i = 0; i < q->width; ++i) {
-			struct xe_lrc *lrc = q->lrc + i;
-
-			snapshot->lrc[i] = xe_lrc_snapshot_capture(lrc);
-		}
-	}
-
 	snapshot->schedule_state = atomic_read(&q->guc->state);
 	snapshot->exec_queue_flags = q->flags;
 
@@ -1886,10 +1875,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 		   snapshot->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
 		   snapshot->sched_props.preempt_timeout_us);
-
-	for (i = 0; snapshot->lrc && i < snapshot->width; ++i)
-		xe_lrc_snapshot_print(snapshot->lrc[i], p);
-
 	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
 	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->exec_queue_flags);
 
@@ -1914,15 +1899,9 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
  */
 void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
 {
-	int i;
 	if (!snapshot)
 		return;
 
-	if (snapshot->lrc) {
-		for (i = 0; i < snapshot->width; i++)
-			xe_lrc_snapshot_free(snapshot->lrc[i]);
-		kfree(snapshot->lrc);
-	}
 	kfree(snapshot->pending_list);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..92a7b7bcb899 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -97,9 +97,6 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 preempt_timeout_us;
 	} sched_props;
 
-	/** @lrc: LRC Snapshot */
-	struct xe_lrc_snapshot **lrc;
-
 	/** @schedule_state: Schedule State at the moment of Crash */
 	u32 schedule_state;
 	/** @exec_queue_flags: Flags of the faulty exec_queue */
-- 
2.43.0

