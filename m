Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EC9C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 13:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132E10E877;
	Tue, 27 Feb 2024 13:12:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47E210E90E
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 13:12:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 2/3] drm/xe: Add infrastructure for delayed LRC capture
Date: Tue, 27 Feb 2024 14:12:46 +0100
Message-ID: <20240227131248.92910-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
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

Add a xe_guc_exec_queue_snapshot_capture_delayed and
xe_lrc_snapshot_capture_delayed function to capture
the contents of LRC in the next patch.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  7 +++----
 drivers/gpu/drm/xe/xe_guc_submit.c  | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h  |  2 ++
 drivers/gpu/drm/xe/xe_lrc.c         |  8 ++++++++
 drivers/gpu/drm/xe/xe_lrc.h         |  1 +
 drivers/gpu/drm/xe/xe_vm.c          |  3 +++
 6 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68d3d623a05b..0fcd30680323 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -65,8 +65,8 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 
 	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (ss->vm)
-		xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 }
 
@@ -196,8 +196,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
-	if (ss->vm)
-		queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_unbound_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7348689ec5ae..d681672721a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1859,6 +1859,25 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 	return snapshot;
 }
 
+
+/**
+ * xe_guc_exec_queue_snapshot_capture_delayed - Take delayed part of snapshot of the GuC Engine.
+ * @snapshot: Previously captured snapshot of job.
+ *
+ * This captures some data that requires taking some locks, so it cannot be done in signaling path.
+ */
+void
+xe_guc_exec_queue_snapshot_capture_delayed(struct xe_guc_submit_exec_queue_snapshot *snapshot)
+{
+	int i;
+
+	if (!snapshot || !snapshot->lrc)
+		return;
+
+	for (i = 0; i < snapshot->width; ++i)
+		xe_lrc_snapshot_capture_delayed(snapshot->lrc[i]);
+}
+
 /**
  * xe_guc_exec_queue_snapshot_print - Print out a given GuC Engine snapshot.
  * @snapshot: GuC Submit Engine snapshot object.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 723dc2bd8df9..2f14dfd04722 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -29,6 +29,8 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job);
 void
+xe_guc_exec_queue_snapshot_capture_delayed(struct xe_guc_submit_exec_queue_snapshot *snapshot);
+void
 xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snapshot,
 				 struct drm_printer *p);
 void
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8233d4512fc6..993739a3efcc 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1328,6 +1328,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	return snapshot;
 }
 
+void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	/* TODO: Copy status page */
+}
+
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
 {
 	if (!snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d6dd4045d6d7..d32fa31faa2c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -56,6 +56,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
 void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
 
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
+void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index db3f049a47dc..2c30f6cc2380 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3340,6 +3340,9 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 {
+	if (!snap)
+		return;
+
 	for (int i = 0; i < snap->num_snaps; i++) {
 		struct xe_bo *bo = snap->snap[i].bo;
 		struct iosys_map src;
-- 
2.43.0

