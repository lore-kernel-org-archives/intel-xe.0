Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472D3C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 20:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E587110E045;
	Wed,  2 Sep 2026 20:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6EfGbB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4D10E045
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788379956; x=1819915956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMVEuSUFcFl7FBT7p4O46pXbEwJ97vpwQ74fu1+4in4=;
 b=a6EfGbB1uWISnUowLSqZBZxNUY4vZ4BgGjS+coddiRqaT9sPw9KrGiua
 E3E81pXXpJjBRmKZa5kzvaHUIkGTA26dM3aTEIgZjfOY29tjU5VGtxt/4
 5NTgcqOOWR1zCY6i7O+dG28M6nTwUY+IYICX+flWPNn22dl8rzdofqs8p
 53ChbacDaYTL66eMlReQopPTWzfp2CDROu9UQVyYCuUuzWfWRBhIGv/wV
 NkSjWfFzAkNtKw9P8xXvs8AOBL/b6vcJbkVNdD7cCN+q6x6d9QUjJ6xMu
 eiEF7f/S0jF1ejc4ZQke9bDm531VHAed2d5qKEAJ+2qBC3VCpvZG+AYHq Q==;
X-CSE-ConnectionGUID: g0K+ug+4SmC+AM1k7LV6Mg==
X-CSE-MsgGUID: 0mpd3oSIQv61mRgNqCRObg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87991771"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87991771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 13:12:36 -0700
X-CSE-ConnectionGUID: l1fAaJXsTueoW63AifJjIw==
X-CSE-MsgGUID: f4FKMRnzS4mwsOX3pIHQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="274787980"
Received: from unknown (HELO DUT2031NVLP.iind.intel.com) ([10.190.232.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 13:12:34 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH, v3] drm/xe/guc: Fix race around q->guc->suspend_pending access
Date: Wed,  2 Sep 2026 20:12:22 +0000
Message-ID: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Rather than serializing those clears, drop them. Signalling the suspend
fence from kill or from the suspend-timeout ban completes a suspend while
the queue may still be executing on the hardware, so neither is a valid
place to do it. Split the wake up out of __suspend_fence_signal() into
suspend_wait_wake() and use that in guc_exec_queue_kill(), so a waiter
still observes the killed state immediately rather than waiting out the
full timeout - guc_exec_queue_wait_suspend_done() already breaks on
exec_queue_killed(). The suspend-timeout ban needs no wake at all, as the
waiter that timed out is its caller.

suspend_pending now stays set on a killed or banned queue until it is
torn down, so relax the !suspend_pending assert in
__guc_exec_queue_resume() to permit that state.

handle_sched_done() and guc_exec_queue_stop() can still race with each
other, so take the per-queue msg_lock, which already covers the set on
the suspend path, across their check-then-act. In handle_sched_done() the
flag is snapshotted under the lock and deregister_exec_queue() is kept
outside it. __guc_exec_queue_process_msg_suspend() is left unlocked: it
runs on the scheduler message worker, which guc_exec_queue_stop() parks
via xe_sched_submission_stop() before touching the flag.

v2: Document that sched->msg_lock also protects
    guc->suspend_pending, which indicates a suspend message is in
    flight, in addition to the sched->msgs list (Niranjana)

v3: Drop __suspend_fence_signal() from guc_exec_queue_kill() and
    guc_exec_queue_suspend_timeout_ban() rather than serializing them
    with msg_lock, keeping only the wake up in kill and guarding the
    !suspend_pending assert in resume (Matthew, Niranjana)

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 58 ++++++++++++++------
 3 files changed, 49 insertions(+), 19 deletions(-)

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
index 99d8c807ff05..1420f5ebd72f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1863,16 +1863,11 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 	kfree(msg);
 }
 
-static void __suspend_fence_signal(struct xe_exec_queue *q)
+static void suspend_wait_wake(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (!q->guc->suspend_pending)
-		return;
-
-	WRITE_ONCE(q->guc->suspend_pending, false);
-
 	/*
 	 * We use a GuC shared wait queue for VFs because the VF resfix start
 	 * interrupt must be able to wake all instances of suspend_wait. This
@@ -1885,6 +1880,15 @@ static void __suspend_fence_signal(struct xe_exec_queue *q)
 		wake_up(&q->guc->suspend_wait);
 }
 
+static void __suspend_fence_signal(struct xe_exec_queue *q)
+{
+	if (!q->guc->suspend_pending)
+		return;
+
+	WRITE_ONCE(q->guc->suspend_pending, false);
+	suspend_wait_wake(q);
+}
+
 static void suspend_fence_signal(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -2134,7 +2138,13 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
-	__suspend_fence_signal(q);
+	/*
+	 * Do not signal the suspend fence here, the queue may still be running
+	 * on the hardware. Only wake any suspend waiter so it observes the
+	 * killed state instead of waiting out the full timeout, suspend_pending
+	 * stays set until the queue is torn down.
+	 */
+	suspend_wait_wake(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -2323,7 +2333,12 @@ static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
 	bool last;
 
 	xe_sched_msg_lock(sched);
-	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
+	/*
+	 * A killed, banned or wedged queue keeps suspend_pending set until it
+	 * is torn down, so only assert the flag is clear otherwise.
+	 */
+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending ||
+		     exec_queue_killed_or_banned_or_wedged(q));
 	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
 	last = (--ge->suspend_count == 0);
 	if (last) {
@@ -2393,8 +2408,10 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
 	/*
 	 * The GuC failed to respond to the suspend within the timeout. This is
 	 * not recoverable for this context, so ban it and tear it down via
-	 * cleanup rather than leave it suspended forever. __suspend_fence_signal
-	 * clears suspend_pending and wakes any waiter.
+	 * cleanup rather than leave it suspended forever. The suspend fence is
+	 * not signalled here, the queue may still be running on the hardware,
+	 * so suspend_pending stays set until teardown. The waiter that timed
+	 * out is the caller, so no wake up is needed either.
 	 *
 	 * @q is the primary here; it owns the group's GuC context, so a failure
 	 * to suspend it wedges the whole group. Ban and tear down the entire
@@ -2402,11 +2419,9 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
 	 */
 	if (xe_exec_queue_is_multi_queue(q)) {
 		set_exec_queue_group_banned(q);
-		__suspend_fence_signal(q);
 		xe_guc_exec_queue_group_trigger_cleanup(q);
 	} else {
 		set_exec_queue_banned(q);
-		__suspend_fence_signal(q);
 		xe_guc_exec_queue_trigger_cleanup(q);
 	}
 }
@@ -2429,9 +2444,9 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 	int ret;
 
 	/*
-	 * Likely don't need to check exec_queue_killed() as we clear
-	 * suspend_pending upon kill but to be paranoid but races in which
-	 * suspend_pending is set after kill also check kill here.
+	 * A kill does not clear suspend_pending, the queue may still be running
+	 * on the hardware, so exec_queue_killed() is what ends the wait in that
+	 * case and the queue is torn down asynchronously.
 	 */
 #define WAIT_COND \
 	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
@@ -2624,10 +2639,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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
@@ -3232,13 +3249,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
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
2.43.0

