Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B38606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bFcSaC8S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9C410FAAB;
	Wed, 18 Nov 2026 10:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7480E10FAA6
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794996963; x=1826532963;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vwCq/lreyiOp+z3vV/Lk6g/y7MvCw2mHp+HhGZ0H1vw=;
 b=bFcSaC8SMbvgTjJ1kKcGQA9cx0rVsCEIPF+dHmks38vUe49KMZv+IaoI
 saSaeH3YjZF47AWhozzYmEpejLMSjLiVGr3WRhXfIxj+cMGPT2ayL8xNw
 +bCWGLfLdR4WXGWWsGwmCXzBUmMRvBHLOWDXsVS4hnIVFOZrE0bM528+0
 t0hJQ6TeQnSu3OzodC45TT3KiXxJFYZj4FY/pUtiiS/QCYDc4XDFo6dj5
 tFSqpJn6c6Tp0kei5w0qrRwYQrEBPPwBHgts9dPbpyp7k4A48UWpBzt1n
 1SbZZ/pjefMMDJyCP33Xolfk2FzoG2OqwKAuEt0XYIEE6gOv68T16DD9Y w==;
X-CSE-ConnectionGUID: WHkUhegMQwqEamGzV8W1MA==
X-CSE-MsgGUID: BUpGdKBETyGg56tqchFJlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3879984"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3879984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:16:03 -0800
X-CSE-ConnectionGUID: U+c+Iul9Tq6IpJynLO0KTA==
X-CSE-MsgGUID: 1CL2Ql54Q/m2HcULUysKJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10249695"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:16:02 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] CI_ONLY: Defer TDR execution while submission is suspended
Date: Wed, 18 Nov 2026 15:45:43 +0530
Message-ID: <20261118101543.2210570-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CI ONLY...
guc_exec_queue_stop() can ban a queue with an incomplete job and request
immediate TDR cleanup. During suspend this runs from the PM thread,
while the timeout worker runs on gt->ordered_wq. The timeout worker can
therefore capture engine registers and restart scheduler submission
while GuC submission is being stopped and the device is powering down.

Disable each queue's timeout work before stopping submission. Do this
from gt->ordered_wq so any running drm_sched_job_timedout() has finished,
including the pending-list updates outside the Xe timeout callback.
Keep the GuC stop and suspend operations on the PM caller's thread.

Keep timeout work disabled until all queues have been restarted. Also
disable timeout work on queues created while submission is suspended.
Re-enable it on suspend failure and teardown abort paths so the new
disable count cannot prevent cleanup indefinitely.

Leave the scheduler timeout value unchanged. An immediate cleanup
request made while timeout work is disabled still sets it to zero,
so restarting submission re-arms that cleanup without an extra delay.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Link: https://sashiko.dev/#/bug/linux-449968a5-0b4a-4c5d-acd3-7ced29f0129b
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c               |  7 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 71 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h           |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h            |  2 +
 drivers/gpu/drm/xe/xe_uc.c                   | 26 ++++++-
 6 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6911c2ac39f8..2de67e411953 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1509,8 +1509,13 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_resume(gt);
-		if (err)
+		if (err) {
+			/* GuC boot failed before submission could restart. */
+			if (!flr && err == -ENOEXEC)
+				xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND |
+						 DRM_WEDGE_RECOVERY_BUS_RESET);
 			break;
+		}
 	}
 
 	if (flr) {
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 74b711abe257..6f033c4984b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -40,6 +40,8 @@ struct xe_guc_exec_queue {
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
+	/** @tdr_suspended: work_tdr disabled, protected by submission_state.lock */
+	bool tdr_suspended;
 	/** @resume_time: time of last resume */
 	u64 resume_time;
 	/** @state: GuC specific state for this xe_exec_queue */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d76f125f9c3a..e9bc43753a82 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2120,6 +2120,18 @@ static const struct xe_sched_backend_ops xe_sched_ops = {
 	.process_msg = guc_exec_queue_process_msg,
 };
 
+static void guc_exec_queue_suspend_tdr(struct xe_exec_queue *q)
+{
+	lockdep_assert_held(&exec_queue_to_guc(q)->submission_state.lock);
+
+	if (q->guc->tdr_suspended)
+		return;
+
+	/* Caller runs on the TDR workqueue, or the queue is not published yet. */
+	disable_delayed_work(&q->guc->sched.base.work_tdr);
+	q->guc->tdr_suspended = true;
+}
+
 static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
@@ -2189,6 +2201,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	mutex_lock(&guc->submission_state.lock);
 	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
+	if (guc->submission_state.tdr_suspended)
+		guc_exec_queue_suspend_tdr(q);
 	publish_guc_id(guc, q);
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -3119,6 +3133,59 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	xe_sched_submission_resume_tdr(sched);
 }
 
+/**
+ * xe_guc_submit_suspend_tdr - Disable queue timeout work before suspend
+ * @guc: GuC submission being suspended
+ *
+ * Must run on the GT ordered workqueue, after reset preparation. This
+ * serializes against the whole DRM timeout worker, including pending-list
+ * removal and reinsertion outside the Xe timeout callback.
+ */
+void xe_guc_submit_suspend_tdr(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	guard(mutex)(&guc->submission_state.lock);
+	guc->submission_state.tdr_suspended = true;
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (q->guc->id != index)
+			continue;
+		guc_exec_queue_suspend_tdr(q);
+	}
+}
+
+static void guc_submit_resume_tdr(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	lockdep_assert_held(&guc->submission_state.lock);
+	if (!guc->submission_state.tdr_suspended)
+		return;
+
+	guc->submission_state.tdr_suspended = false;
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (q->guc->id != index || !q->guc->tdr_suspended)
+			continue;
+
+		q->guc->tdr_suspended = false;
+		enable_delayed_work(&q->guc->sched.base.work_tdr);
+		/* Cleanup requests made while disabled leave base.timeout at zero. */
+		xe_sched_submission_resume_tdr(&q->guc->sched);
+	}
+}
+
+/**
+ * xe_guc_submit_resume_tdr - Re-enable queue timeout work after suspend abort
+ * @guc: GuC submission whose timeout work was disabled
+ */
+void xe_guc_submit_resume_tdr(struct xe_guc *guc)
+{
+	guard(mutex)(&guc->submission_state.lock);
+	guc_submit_resume_tdr(guc);
+}
+
 int xe_guc_submit_start(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
@@ -3135,6 +3202,8 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 		guc_exec_queue_start(q);
 	}
+	/* All queues must be restarted before any deferred TDR can run. */
+	guc_submit_resume_tdr(guc);
 	mutex_unlock(&guc->submission_state.lock);
 
 	wake_up_all(&guc->ct.wq);
@@ -3313,6 +3382,8 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 		xe_sched_submission_start(sched);
 		guc_exec_queue_kill(q);
 	}
+	/* Abort can tear down a device whose submission will never restart. */
+	guc_submit_resume_tdr(guc);
 	mutex_unlock(&guc->submission_state.lock);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 7a81d0aa19bb..a0108b2bc166 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,8 @@ void xe_guc_submit_disable(struct xe_guc *guc);
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
+void xe_guc_submit_suspend_tdr(struct xe_guc *guc);
+void xe_guc_submit_resume_tdr(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 6da43691e54c..e80d3f228aa1 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -93,6 +93,8 @@ struct xe_guc {
 		atomic_t reset_blocked;
 		/** @submission_state.lock: protects submission state */
 		struct mutex lock;
+		/** @submission_state.tdr_suspended: disable TDR for existing and new queues */
+		bool tdr_suspended;
 		/** @submission_state.enabled: submission is enabled */
 		bool enabled;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index b32ba504041c..aa154800a881 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -362,17 +362,41 @@ void xe_uc_suspend_prepare(struct xe_uc *uc)
 	xe_guc_stop_prepare(&uc->guc);
 }
 
+struct xe_uc_suspend_work {
+	struct work_struct work;
+	struct xe_uc *uc;
+};
+
+static void uc_suspend_work(struct work_struct *w)
+{
+	struct xe_uc_suspend_work *suspend =
+		container_of(w, struct xe_uc_suspend_work, work);
+	xe_guc_submit_suspend_tdr(&suspend->uc->guc);
+}
+
 int xe_uc_suspend(struct xe_uc *uc)
 {
+	struct xe_uc_suspend_work suspend = { .uc = uc };
+	int err;
+
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	uc_reset_wait(uc);
 
+	/* Drain the complete timeout worker before examining queue state. */
+	INIT_WORK_ONSTACK(&suspend.work, uc_suspend_work);
+	queue_work(uc_to_gt(uc)->ordered_wq, &suspend.work);
+	flush_work(&suspend.work);
+	destroy_work_on_stack(&suspend.work);
+
 	xe_uc_stop(uc);
+	err = xe_guc_suspend(&uc->guc);
+	if (err)
+		xe_guc_submit_resume_tdr(&uc->guc);
 
-	return xe_guc_suspend(&uc->guc);
+	return err;
 }
 
 /**
-- 
2.43.0

