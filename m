Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE28AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 20:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8610EAEE;
	Mon, 13 Jul 2026 20:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBoPvohh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C0310EAFC
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 20:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783974208; x=1815510208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcudF4vfjaX0HarOe93kYPEC5ATM+awVGB33RsMFxIA=;
 b=NBoPvohhOIZxic1MdMaK90LNZ34UFWoPCv8r9jeqMOI0NP8N7EnjYFs/
 VPpSrYEep0QraSOEbNaEuxB63HqJgPXTsDKLLAOJbirSuo0SQlwWuIsB8
 BkjN9Z9UVTlkANtoMq4ygedQHMUhDNfLajBC4Vk9kR46n8Yg8SBliDXyX
 x+mfeoSnhAgZ3X4XXt4Nyf0zrELULLKi9nd5VZHxZKakRB2wL8ROvRMFF
 LaH1grVLGukBQRgNAPyV9q25ZOZjtiIjecxWbDzm8yGtr4ckgvwkXXV9O
 nNelBbC3beRkFM3UGdXUXET7Uh9fxVL0zuvT2igAIWWlXfqkAEwhAfKhK g==;
X-CSE-ConnectionGUID: IFgT50xNSCmqD+RE5Mr21Q==
X-CSE-MsgGUID: oZe6nmP2TPq3p1tPQZ3D5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110136871"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="110136871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:23:28 -0700
X-CSE-ConnectionGUID: dUy57wAlSTyh5oLD8K3/Cg==
X-CSE-MsgGUID: 3++5IgTcTTKrnoEiA1DKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253914161"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:23:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 6/6] drm/xe/multi_queue: preempt primary on queue group
 suspend
Date: Mon, 13 Jul 2026 13:23:21 -0700
Message-ID: <20260713202317.2187787-14-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713202317.2187787-8-niranjana.vishwanathapura@intel.com>
References: <20260713202317.2187787-8-niranjana.vishwanathapura@intel.com>
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

In a multi-queue group only the group's primary queue interfaces with
GuC for scheduling; suspend/resume of secondary queues is handled
internally and is not forwarded to GuC. As a result, suspending a
secondary queue alone (e.g. on its preempt fence signalling) does not
disable the primary's GuC context, so in-flight GPU work of the group
is not actually preempted.

Make a secondary queue suspend/resume like any other queue, driven by
its own xe_guc_exec_queue.suspend_count, and additionally forward the
suspend/resume to the primary so the GPU is actually preempted. The
forward is gated on the secondary's own 0->1 / 1->0 suspend_count
transition, so each group member contributes exactly one suspend
reference to the primary: the primary keeps its GuC context disabled
until every member that suspended it has resumed, including across the
resume-all-queues-each-rebind-cycle behavior. group->suspend_lock makes
the secondary transition and the primary forward atomic, and a member
leaving while still suspended (queue teardown) drops its reference on
the primary.

v2: Add comment about suspend_wait() in drop_suspend()
v3: Do not suspend a secondary if primary is killed,
    wait for primay suspend to complete before drop_suspend()

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 176 ++++++++++++++++++++---
 3 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cfd2a4e6d4c7..f4b297a19218 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -839,6 +839,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	spin_lock_init(&group->suspend_lock);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 0aa0823cbdaa..53b6c0bf4849 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -62,6 +62,12 @@ struct xe_exec_queue_group {
 	struct list_head list;
 	/** @list_lock: Secondary queue list lock */
 	struct mutex list_lock;
+	/**
+	 * @suspend_lock: Makes a secondary's suspend/resume and its forwarding
+	 * to the primary atomic. Nested outside of the queue's message lock
+	 * (@xe_guc_exec_queue.sched.msg_lock).
+	 */
+	spinlock_t suspend_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 	/** @banned: Group banned */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5a30f17f5c28..c70c77141a74 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1704,11 +1704,36 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
+static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q);
+
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	/*
+	 * A secondary can leave the group while still preempt suspended (e.g.
+	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
+	 * which suspends it). It holds one forwarded suspend reference on the
+	 * primary, so drop it and resume the primary if it was the last member
+	 * that had it suspended. Primaries forward to nobody, so they don't need
+	 * this.
+	 *
+	 * First make sure the primary's forwarded suspend has completed. If the
+	 * secondary was killed/reset before its preempt fence worker ran, that
+	 * worker skips suspend_wait() (see preempt_fence_work_func()), leaving
+	 * the primary's suspend possibly in flight. drop_suspend() runs under a
+	 * spinlock and cannot wait, so drain it here with the uninterruptible
+	 * blocking wait; otherwise resuming the primary in drop_suspend() could
+	 * trip the !suspend_pending assert.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		if (READ_ONCE(q->guc->suspend_count))
+			guc_exec_queue_suspend_wait_blocking(q);
+		guc_exec_queue_multi_queue_drop_suspend(q);
+	}
+
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
 
@@ -2186,17 +2211,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 	return 0;
 }
 
-static int guc_exec_queue_suspend(struct xe_exec_queue *q)
+/*
+ * Core suspend: take a suspend reference on @q and, on the first reference,
+ * disable its GuC context so the GPU is actually preempted. Caller must have
+ * ensured @q is not killed/banned/wedged. Returns true if this was the first
+ * suspend reference (the 0->1 transition).
+ */
+static bool __guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_gpu_scheduler *sched = &ge->sched;
 	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
-
-	if (exec_queue_killed_or_banned_or_wedged(q))
-		return -EINVAL;
+	bool first;
 
 	xe_sched_msg_lock(sched);
-	if (++ge->suspend_count == 1) {
+	first = (++ge->suspend_count == 1);
+	if (first) {
 		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
 
 		/* slot must be free at 0->1 */
@@ -2205,6 +2235,80 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	}
 	xe_sched_msg_unlock(sched);
 
+	return first;
+}
+
+/*
+ * Core resume: drop a suspend reference on @q and, on the last reference,
+ * re-enable its GuC context. Returns true if this dropped the last suspend
+ * reference (the 1->0 transition).
+ */
+static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
+{
+	struct xe_guc_exec_queue *ge = q->guc;
+	struct xe_gpu_scheduler *sched = &ge->sched;
+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	bool last;
+
+	xe_sched_msg_lock(sched);
+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
+	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
+	last = (--ge->suspend_count == 0);
+	if (last) {
+		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
+
+		/* slot must be free at 1->0 */
+		xe_gt_assert(guc_to_gt(guc), added);
+	}
+	xe_sched_msg_unlock(sched);
+
+	return last;
+}
+
+static int guc_exec_queue_suspend(struct xe_exec_queue *q)
+{
+	if (exec_queue_killed_or_banned_or_wedged(q))
+		return -EINVAL;
+
+	/*
+	 * Non-multi-queue queues and multi-queue primaries suspend themselves
+	 * directly: their own msg_lock makes the suspend_count 0->1 transition
+	 * and the suspend_pending update atomic, so no group level serialization
+	 * is needed.
+	 */
+	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
+		__guc_exec_queue_suspend(q);
+		return 0;
+	}
+
+	/*
+	 * A secondary's suspend is meaningless once the primary - which owns the
+	 * group's GuC context - is gone, so fail it too. This keeps the
+	 * secondary's effective state consistent with guc_exec_queue_reset_status(),
+	 * which already reports the primary's killed/banned/wedged state for
+	 * secondaries. A primary killed *after* this check is still handled at
+	 * message-processing time, where the SUSPEND is a no-op for a killed
+	 * context; this only covers an already-dead primary.
+	 */
+	if (exec_queue_killed_or_banned_or_wedged(xe_exec_queue_multi_queue_primary(q)))
+		return -EINVAL;
+
+	/*
+	 * A secondary doesn't interface with GuC: suspend it like any other
+	 * queue (its own suspend_count drives its internally handled scheduler
+	 * state) and, only on its own 0->1 transition, forward the suspend to the
+	 * primary so the GPU is actually preempted. Hold @suspend_lock so that
+	 * observing the secondary's transition and forwarding it to the primary
+	 * happen atomically; this keeps the primary's refcount paired with member
+	 * transitions even if the same secondary is suspended and resumed
+	 * concurrently across rebind cycles.
+	 */
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		if (__guc_exec_queue_suspend(q))
+			__guc_exec_queue_suspend(xe_exec_queue_multi_queue_primary(q));
+	}
+
 	return 0;
 }
 
@@ -2336,21 +2440,59 @@ static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
-	struct xe_guc_exec_queue *ge = q->guc;
-	struct xe_gpu_scheduler *sched = &ge->sched;
-	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
-	struct xe_guc *guc = exec_queue_to_guc(q);
+	/*
+	 * Non-multi-queue queues and multi-queue primaries resume themselves
+	 * directly; their own msg_lock is sufficient.
+	 */
+	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
+		__guc_exec_queue_resume(q);
+		return;
+	}
 
-	xe_sched_msg_lock(sched);
-	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
-	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
-	if (--ge->suspend_count == 0) {
-		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
+	/*
+	 * Mirror of guc_exec_queue_suspend(): resume the secondary like any
+	 * other queue and, only on its own 1->0 transition, forward the resume
+	 * to the primary so the primary's GuC context is re-enabled once the
+	 * last member that suspended it resumes. @suspend_lock keeps the
+	 * secondary transition and the primary forward atomic.
+	 */
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		if (__guc_exec_queue_resume(q))
+			__guc_exec_queue_resume(xe_exec_queue_multi_queue_primary(q));
+	}
+}
 
-		/* slot must be free at 1->0 */
-		xe_gt_assert(guc_to_gt(guc), added);
+/*
+ * Drop a leaving secondary's forwarded suspend reference on the primary and
+ * resume the primary if this was the last member that had it suspended.
+ * See guc_exec_queue_fini().
+ */
+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
+{
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+		/*
+		 * A suspended secondary holds exactly one suspend reference on the
+		 * primary (forwarded on its 0->1 transition). If it leaves while
+		 * still suspended, release that reference so the primary is not
+		 * kept disabled forever.
+		 */
+		if (!READ_ONCE(q->guc->suspend_count))
+			break;
+
+		if (exec_queue_killed_or_banned_or_wedged(primary))
+			break;
+
+		/*
+		 * No suspend_wait() here (and we can't - suspend_lock is a
+		 * spinlock). guc_exec_queue_fini() has already drained the
+		 * primary's forwarded suspend with the blocking wait, so its
+		 * suspend has completed (suspend_pending cleared) by the time we
+		 * resume it here. __guc_exec_queue_resume() asserts this.
+		 */
+		__guc_exec_queue_resume(primary);
 	}
-	xe_sched_msg_unlock(sched);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
-- 
2.43.0

