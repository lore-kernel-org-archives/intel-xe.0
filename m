Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4149C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 18:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5310EC39;
	Tue, 18 Aug 2026 18:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxmP4EbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5870B10EC39
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787078334; x=1818614334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SGuuQ2qJcUNCy4rxGtRoHTTEcIiTWrung1gtQGRRa/U=;
 b=dxmP4EbY+1u/EeUji/oEAUf+DhNlYEkFppQEfUzK76cIm4xfh2KGN491
 6rDmYixL2ZQ35nA932kN46/2vQVVkOcGvReMNdf1u8/8L8Xi+fNPqq4Ta
 PImv+t5UcGGX/6kkJuhD4KizwTXFELtfYF5E6E/2xglWdgtbHy2MwdVIe
 vJ+LF7BNvUNuVXHhdIXg6vfojBYIiBWob2v84aYhQEWyIR4Xa18tIeIi5
 FA865HG4XOu2KY19XWRH9jfqz1KFYSRNIBxAcq2hjM/Jpk4YVcoCAV0di
 MCnQebQ24K3HdgaDwkjxKekOj2sdkFX9ZpmIE3lvPOQDqIapQr6QAPULO A==;
X-CSE-ConnectionGUID: 9KVsjYaVSYeaGTon6HvMHQ==
X-CSE-MsgGUID: q/psy0kTQrCIlxhf/zToEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98173796"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98173796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:38:54 -0700
X-CSE-ConnectionGUID: WDQOAIf5RRyXUekjQtjMww==
X-CSE-MsgGUID: omSpqC4lRa+e0IMZLX10yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="290119731"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:38:52 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending access
Date: Wed, 19 Aug 2026 02:38:39 +0800
Message-ID: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

q->guc->suspend_pending is accessed without any common lock.
__suspend_fence_signal(), called from guc_exec_queue_kill() and the
suspend-timeout ban path, clears the flag asynchronously. Meanwhile
handle_sched_done(), guc_exec_queue_stop() and
__guc_exec_queue_process_msg_suspend() check the flag and then call
suspend_fence_signal(), which asserts that it is still set.

As the check and suspend_fence_signal() are not atomic, the clear can
land in between and trip the xe_gt_assert(q->guc->suspend_pending).

The flag is already set and read under the per-queue msg_lock
(xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
lock to the clear paths (kill and ban) and to the three check-then-act
sites so the check and the signal are atomic with respect to the clear.
In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
wrapped, since the other branch waits. In handle_sched_done() the flag is
snapshotted under the lock and deregister_exec_queue() is kept outside it.

v2: Document that sched->msg_lock also protects
    guc->suspend_pending, which indicates a suspend message is in
    flight, in addition to the sched->msgs list (Niranjana)

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 63d9bf92583c..78ef2e8ded4f 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
 	struct list_head			msgs;
-	/** @msg_lock: Message lock */
+	/**
+	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
+	 * suspend message is in flight) of exec queues on this scheduler.
+	 */
 	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index d27826b36649..74b711abe257 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
 	u16 id;
 	/** @suspend_wait: wait queue used to wait on pending suspends */
 	wait_queue_head_t suspend_wait;
-	/** @suspend_pending: a suspend of the exec_queue is pending */
+	/**
+	 * @suspend_pending: a suspend of the exec_queue is pending.
+	 * Protected by @sched.msg_lock.
+	 */
 	bool suspend_pending;
 	/**
 	 * @suspend_count: Reference count of active suspend requests. The
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..c565c1d32d3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 			set_exec_queue_suspended(q);
 			disable_scheduling(q, false);
 		}
-	} else if (q->guc->suspend_pending) {
-		set_exec_queue_suspended(q);
-		suspend_fence_signal(q);
+	} else {
+		xe_sched_msg_lock(&q->guc->sched);
+		if (q->guc->suspend_pending) {
+			set_exec_queue_suspended(q);
+			suspend_fence_signal(q);
+		}
+		xe_sched_msg_unlock(&q->guc->sched);
 	}
 }
 
@@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
+	xe_sched_msg_lock(&q->guc->sched);
 	__suspend_fence_signal(q);
+	xe_sched_msg_unlock(&q->guc->sched);
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
 	 */
 	if (xe_exec_queue_is_multi_queue(q)) {
 		set_exec_queue_group_banned(q);
+		xe_sched_msg_lock(&q->guc->sched);
 		__suspend_fence_signal(q);
+		xe_sched_msg_unlock(&q->guc->sched);
 		xe_guc_exec_queue_group_trigger_cleanup(q);
 	} else {
 		set_exec_queue_banned(q);
+		xe_sched_msg_lock(&q->guc->sched);
 		__suspend_fence_signal(q);
+		xe_sched_msg_unlock(&q->guc->sched);
 		xe_guc_exec_queue_trigger_cleanup(q);
 	}
 }
@@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (exec_queue_destroyed(q))
 			do_destroy = true;
 	}
+	xe_sched_msg_lock(sched);
 	if (q->guc->suspend_pending) {
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
+	xe_sched_msg_unlock(sched);
 	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
 		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
 		   EXEC_QUEUE_STATE_SUSPENDED,
@@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
+		bool was_pending;
+
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
-		if (q->guc->suspend_pending) {
+		xe_sched_msg_lock(&q->guc->sched);
+		was_pending = q->guc->suspend_pending;
+		if (was_pending) {
 			clear_exec_queue_pending_disable(q);
 			suspend_fence_signal(q);
-		} else {
+		}
+		xe_sched_msg_unlock(&q->guc->sched);
+
+		if (!was_pending) {
 			if (exec_queue_banned(q)) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
-- 
2.53.0

