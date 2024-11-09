Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE63D6409C
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4874210E33E;
	Sat,  9 Nov 2024 01:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKn9Vzua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB810E339
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=76Ka9DGL9ZK84r7rflRddyQZCXWz1/0b5YHHD02QwGs=;
 b=KKn9VzuaFR/tlGdy4I7Z34TlBak7FpHzIl2Ewt6/6MJxVHkmc6MG7Tdn
 MU+OSgCNC+f3GBVYs/L9gxOEtINx0s6royjaAad3GKQHK9d+ruKXy5erR
 J304Zot+0320cUL/x76tGBlQXZ2MZb43VAABP8MRGR+zw+a8i2mZyVBBk
 5SYYi/622BZcE3CMJ5l5d+a0BZn9a9DraguIpO/fpV49txJnY+gQqWJuT
 8yoDbseUzipkeA7S+ipc02HV2Mg7Fsbok31pzMAz73yCOYbdmqdGfY/HN
 oOEW143Zss7kWvbF2d5iWiRFH4ui2QhhP3Z5PRzaenZtPjdS4NDQ5Nr0+ Q==;
X-CSE-ConnectionGUID: grn8pm6pQ3y6m0l31243Vw==
X-CSE-MsgGUID: g3tZ0OI9SFqwTEYVJE75TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799510"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: EsWib9U9SnKMTS8dSnM6eg==
X-CSE-MsgGUID: 7sXNdzLnSPy5XR20dynS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369005"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 1/5] drm/xe/devcoredump: Support coredumps without jobs
Date: Fri,  8 Nov 2024 17:59:30 -0800
Message-ID: <20241109015934.2203462-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

A devcoredump is an extremely useful debug feature. So allow it to be
used for issues where there is no DRM scheduler job available.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 155 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_devcoredump.h |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  |   2 +-
 3 files changed, 137 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d3570d3d573c..f0fcc898b3ae 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -237,8 +237,8 @@ static void xe_devcoredump_free(void *data)
 		 "Xe device coredump has been deleted.\n");
 }
 
-static void devcoredump_snapshot(struct xe_devcoredump *coredump,
-				 struct xe_sched_job *job)
+static void devcoredump_snapshot_job(struct xe_devcoredump *coredump,
+				     struct xe_sched_job *job)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_exec_queue *q = job->q;
@@ -246,23 +246,16 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
-
 	unsigned int fw_ref;
-	bool cookie;
 	int i;
 
-	ss->snapshot_time = ktime_get_real();
-	ss->boot_time = ktime_get_boottime();
-
 	if (q->vm && q->vm->xef)
 		process_name = q->vm->xef->process_name;
 	strscpy(ss->process_name, process_name);
 
 	ss->gt = q->gt;
 	coredump->job = job;
-	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
-	cookie = dma_fence_begin_signalling();
 	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
 		if (adj_logical_mask & BIT(i)) {
 			adj_logical_mask |= width_mask << i;
@@ -283,32 +276,109 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_job(job);
 
+	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
+}
+
+static void devcoredump_snapshot_gt(struct xe_devcoredump *coredump, struct xe_gt *gt)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = &gt->uc.guc;
+	unsigned int fw_ref;
+
+	strscpy(ss->process_name, "no proccess");
+
+	ss->gt = gt;
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+}
+
+static void devcoredump_snapshot_xe(struct xe_devcoredump *coredump, struct xe_device *xe)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+
+	strscpy(ss->process_name, "no proccess");
+
+	/* No implemented yet - need to keep a list of GTs in the snapshot */
+#if 0
+	struct xe_gt *gt;
+	int i;
+
+	for_each_gt(gt, xe, i) {
+		struct xe_gt_snapshot *ss_gt;
+		struct xe_guc *guc = &gt->uc.guc;
+		unsigned int fw_ref;
+
+		ss_gt = kzalloc(sizeof(*ss_gt), GFP_ATOMIC);
+		if (!ss_gt)
+			continue;
+
+		ss_gt->gt = gt;
+
+		/* keep going if fw fails as we still want to save the memory and SW data */
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+		ss_gt->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+		ss_gt->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+		list_add(&ss_gt->link, &ss->gt_list);
+	}
+#endif
+}
+
+static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
+					   struct xe_gt *gt, struct xe_sched_job *job)
+{
+	struct xe_devcoredump_snapshot *ss;
+	struct xe_device *xe;
+	bool cookie;
+
+	xe = coredump_to_xe(coredump);
+
+	xe_assert(xe, !coredump->captured);
+	coredump->captured = true;
+
+	ss = &coredump->snapshot;
+	ss->snapshot_time = ktime_get_real();
+	ss->boot_time = ktime_get_boottime();
+
+	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
+
+	cookie = dma_fence_begin_signalling();
+
+	if (job)
+		devcoredump_snapshot_job(coredump, job);
+	else if (gt)
+		devcoredump_snapshot_gt(coredump, gt);
+	else
+		devcoredump_snapshot_xe(coredump, xe);
+
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-/**
- * xe_devcoredump - Take the required snapshots and initialize coredump device.
- * @job: The faulty xe_sched_job, where the issue was detected.
- *
- * This function should be called at the crash time within the serialized
- * gt_reset. It is skipped if we still have the core dump device available
- * with the information of the 'first' snapshot.
- */
-void xe_devcoredump(struct xe_sched_job *job)
+static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt, struct xe_sched_job *job)
 {
-	struct xe_device *xe = gt_to_xe(job->q->gt);
-	struct xe_devcoredump *coredump = &xe->devcoredump;
+	struct xe_devcoredump *coredump;
+	struct xe_device *xe;
+
+	xe = _xe ? _xe : gt_to_xe(gt ? gt : job->q->gt);
+	coredump = &xe->devcoredump;
 
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
 		return;
 	}
 
-	coredump->captured = true;
-	devcoredump_snapshot(coredump, job);
+	devcoredump_snapshot_for_thing(coredump, gt, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
@@ -319,6 +389,45 @@ void xe_devcoredump(struct xe_sched_job *job)
 			      XE_COREDUMP_TIMEOUT_JIFFIES);
 }
 
+/**
+ * xe_devcoredump_for_job - Take the required snapshots and initialize coredump device.
+ * @job: The faulty xe_sched_job, where the issue was detected.
+ *
+ * This function should be called at the crash time within the serialized gt_reset.
+ * The capture is skipped if a prior device core dump snapshot is still available with
+ * information about the 'first' error.
+ */
+void xe_devcoredump_for_job(struct xe_sched_job *job)
+{
+	devcoredump_for_thing(NULL, NULL, job);
+}
+
+/**
+ * xe_devcoredump_for_gt - Take the required snapshots and initialize coredump device.
+ * @gt: The faulty GT.
+ *
+ * This function should be called when an error occurs but without access to a
+ * scheduler job. The capture is skipped if a prior device core dump snapshot is
+ * still available with information about the 'first' error.
+ */
+void xe_devcoredump_for_gt(struct xe_gt *gt)
+{
+	devcoredump_for_thing(NULL, gt, NULL);
+}
+
+/**
+ * xe_devcoredump_for_xe - Take the required snapshots and initialize coredump device.
+ * @xe: The faulty device.
+ *
+ * This function should be called when an error occurs but without access to either a
+ * scheduler job or even a GT. The capture is skipped if a prior device core dump
+ * snapshot is still available with information about the 'first' error.
+ */
+void xe_devcoredump_for_xe(struct xe_device *xe)
+{
+	devcoredump_for_thing(xe, NULL, NULL);
+}
+
 static void xe_driver_devcoredump_fini(void *arg)
 {
 	struct drm_device *drm = arg;
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index a4eebc285fc8..a83c93d0e82c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -10,10 +10,13 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_gt;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_sched_job *job);
+void xe_devcoredump_for_job(struct xe_sched_job *job);
+void xe_devcoredump_for_gt(struct xe_gt *gt);
+void xe_devcoredump_for_xe(struct xe_device *xe);
 int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_sched_job *job)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5bd40e94eeba..293a1cbc2486 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1159,7 +1159,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(job);
+		xe_devcoredump_for_job(job);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
-- 
2.47.0

