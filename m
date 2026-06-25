Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24295CDE006
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 02:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9D710E153;
	Thu, 25 Jun 2026 02:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSRNSS5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CDE10E149
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782356035; x=1813892035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RA0GGOCuemm0mB9y7f8DS5g9zBZwnUJ0nAA61sFsxU=;
 b=SSRNSS5eI4oN0rb1Eq79RDkqRFpCtdyAwA+LI4rbMoKfBMoeuiV2Ewi5
 TK3M822N9o4+iXLhWXT+qtcPVzCscNIRIeR0nyhk3M7FwJ7mxjsJl/lum
 b+5xCnbPugdBiqwuR24BSAJ5ym56fLYp0taKxSL9cFLU232E+rSq8vb4W
 ZHe7JoWx0aPYDgoZWLxCmhO6p2OthLdR5dgmKn7VWYszhQT2wr+8ESyUz
 PRAXiTEUupdd2XAVO5lCHFLpvd9Ch7SauRN2BEDLUVMrcoJ2Vij1z7jmJ
 +LEk1rh0k9dI7y+CjPb8cx0RrBHga+Z3jIJF7PMnUjS8B/fdvOmzwYIZ4 w==;
X-CSE-ConnectionGUID: 4DRJrypvQ/6x6RuEkPKO7w==
X-CSE-MsgGUID: UbDJFwh0R9CVM6KSC3gTZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93781083"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93781083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
X-CSE-ConnectionGUID: w93AnBFdTQyiHr2PWeIrAg==
X-CSE-MsgGUID: QYtNGLiVQaOsX2I6l7vkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254118546"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 5/5] drm/xe/multi_queue: preempt primary on queue group suspend
Date: Wed, 24 Jun 2026 19:53:54 -0700
Message-ID: <20260625025348.1620469-12-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 158 ++++++++++++++++++++---
 3 files changed, 148 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..df95855a3d61 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	spin_lock_init(&group->suspend_lock);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index dbb2ee8eb5de..bf76a879aedc 100644
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
index fa5d85b19df9..f830aaa38cb6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1681,11 +1681,24 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
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
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		guc_exec_queue_multi_queue_drop_suspend(q);
+
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
 
@@ -2163,17 +2176,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
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
@@ -2182,6 +2200,68 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
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
 
@@ -2191,6 +2271,19 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	/*
+	 * In multi-queue mode the primary owns the GuC scheduling context for
+	 * the whole group, so wait on the primary's suspend to complete. All
+	 * group members share the same GuC/device, so guc, xe and timeout above
+	 * are computed from @q directly.
+	 *
+	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
+	 * its SUSPEND message precedes the primary's on the shared FIFO
+	 * submit_wq, completes before the primary's. So waiting on the primary
+	 * is sufficient.
+	 */
+	q = xe_exec_queue_multi_queue_primary(q);
+
 	/*
 	 * Likely don't need to check exec_queue_killed() as we clear
 	 * suspend_pending upon kill but to be paranoid but races in which
@@ -2249,21 +2342,52 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
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
+		__guc_exec_queue_resume(primary);
 	}
-	xe_sched_msg_unlock(sched);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
-- 
2.43.0

