Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA882C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 05:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B3B10E00A;
	Tue, 14 Jul 2026 05:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laojwuuW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0537810E00A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 05:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784006796; x=1815542796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gNx7nkb7SQ8xnoxF/xpHpW/oSWymJvdlwYGqsyaEBuk=;
 b=laojwuuWTocRTMeSo2oXzbJ+L8esgIw0xd9m7KIz2XBhlvyPS8RMDc1A
 PMmO9OUAAs9ZUoOjar5UoF95lswJL96PhfePfaWl28mvNWMv33CE1sAGR
 4H2ED/BvZF9OtD8bLhHHOC6BJYh3kM6/TMKdzpv3U6cQbswIJcu4v9Gd5
 FPmtJEQPSWx0fR9opcZ+0GXLl1JkoOgGOdvG6DlBTbtCILaQsasC6Ltyh
 r9hg9DXXXmk39AdbYGFEDnAyQG9G/Llsch9hvdulfACnhnS7dxtU28NTE
 7CiRYAllixfY40G16xsTWTWyNSQpTWXL0mzEVsigSx0nY62zMRICInP+9 Q==;
X-CSE-ConnectionGUID: dtDnP311Sd+kAjZn4/f5Hw==
X-CSE-MsgGUID: HRfSVFx3Qma9NAM1kzLCsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84716192"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84716192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 22:26:35 -0700
X-CSE-ConnectionGUID: hc1IkQOeTR6tt32KzAadXw==
X-CSE-MsgGUID: /6HWryAGSwiixImPg0DpUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255252995"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 22:26:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH] drm/xe/multi_queue: wait for secondary's own suspend in
 suspend_wait
Date: Mon, 13 Jul 2026 22:26:28 -0700
Message-ID: <20260714052627.2241302-2-niranjana.vishwanathapura@intel.com>
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

For a multi-queue group secondary, guc_exec_queue_suspend_wait() (and its
blocking variant) only waited on the primary's suspend, on the assumption
that the secondary's suspend is synchronous. It is not: the secondary's
suspend rides the sched-message worker (short-circuited, no GuC round-trip)
and completes asynchronously. When the primary was already suspended the
forward is a refcount-only transition that queues no new primary SUSPEND
and leaves the primary's suspend_pending clear, so the wait returned
immediately while the secondary's own suspend was still in flight. A
subsequent resume() then tripped the secondary's !suspend_pending assert.

Wait for the secondary's own suspend to complete before waiting on the
primary. On a timeout, ban the queue (which tears down the group) rather
than leave it with suspend_pending set - otherwise the preempt-fence and
hw-engine-group resume paths would resume it and hit the assert.

Factor the per-queue wait into guc_exec_queue_wait_suspend_done() and share
the orchestration between suspend_wait() and suspend_wait_blocking() via
guc_exec_queue_suspend_wait_common().

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 126 ++++++++++++++++-------------
 1 file changed, 70 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c70c77141a74..352f101b221f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2340,25 +2340,23 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
 	}
 }
 
-static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+/*
+ * Wait for @q's own suspend to complete: suspend_pending cleared, or the queue
+ * killed / GuC stopped. With @blocking, wait uninterruptibly and do not handle
+ * VF recovery (for callers that must complete on behalf of a possibly
+ * cross-process queue); otherwise wait interruptibly.
+ *
+ * Returns 0 on completion or -ETIME on timeout. Interruptible waits may also
+ * return -EAGAIN (VF recovery in progress, retry) or -ERESTARTSYS (aborted by a
+ * signal; suspend_pending may still be set, so callers must not resume()
+ * without re-confirming the suspend).
+ */
+static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocking)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
-	/*
-	 * In multi-queue mode the primary owns the GuC scheduling context for
-	 * the whole group, so wait on the primary's suspend to complete. All
-	 * group members share the same GuC/device, so guc, xe and timeout above
-	 * are computed from @q directly.
-	 *
-	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
-	 * its SUSPEND message precedes the primary's on the shared FIFO
-	 * submit_wq, completes before the primary's. So waiting on the primary
-	 * is sufficient.
-	 */
-	q = xe_exec_queue_multi_queue_primary(q);
-
 	/*
 	 * Likely don't need to check exec_queue_killed() as we clear
 	 * suspend_pending upon kill but to be paranoid but races in which
@@ -2369,73 +2367,89 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 xe_guc_read_stopped(guc))
 
 retry:
-	if (IS_SRIOV_VF(xe))
+	if (blocking) {
+		if (IS_SRIOV_VF(xe))
+			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
+		else
+			ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
+						 HZ * 5);
+	} else if (IS_SRIOV_VF(xe)) {
 		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
-						       vf_recovery(guc),
-						       HZ * 5);
-	else
+						       vf_recovery(guc), HZ * 5);
+	} else {
 		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
 						       WAIT_COND, HZ * 5);
+	}
 
-	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
+	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
 		return -EAGAIN;
 
-	if (!ret) {
-		guc_exec_queue_suspend_timeout_ban(q);
+	if (!ret)
 		return -ETIME;
-	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
+	else if (!blocking && IS_SRIOV_VF(xe) && !WAIT_COND)
 		/* Corner case on RESFIX DONE where vf_recovery() changes */
 		goto retry;
-	}
 
 #undef WAIT_COND
 
-	/*
-	 * ret < 0 (-ERESTARTSYS): the interruptible wait was aborted by a
-	 * signal. The queue is not banned - the failure is in the waiter, not
-	 * the queue. The suspend is not confirmed complete, so suspend_pending
-	 * may still be set; callers must not resume() on this error without
-	 * re-confirming the suspend.
-	 */
 	return ret < 0 ? ret : 0;
 }
 
-static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
+static int guc_exec_queue_suspend_wait_common(struct xe_exec_queue *q, bool blocking)
 {
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
 	/*
-	 * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers
-	 * that must complete the wait on behalf of a queue possibly owned by a
-	 * different process (e.g. cleanup/undo paths). An interruptible wait
-	 * could return -ERESTARTSYS if the calling task is signalled, leaving
-	 * that queue suspended forever (cross-process DoS).
+	 * A secondary's suspend rides the sched-message worker (short-circuited,
+	 * no GuC round-trip) and so is not synchronous with
+	 * guc_exec_queue_suspend(): its own suspend_pending may still be set
+	 * here. Waiting on the primary alone is not sufficient - if the primary
+	 * was already suspended, the forward is a refcount-only transition that
+	 * queues no new primary SUSPEND and leaves the primary's suspend_pending
+	 * clear, so the primary wait would return immediately while the
+	 * secondary's suspend is still in flight, and a later resume() would trip
+	 * the secondary's !suspend_pending assert. So first wait for the
+	 * secondary's own suspend to complete, then wait on the primary.
 	 *
-	 * A timeout is still a real per-queue fault, so it bans and cleans up
-	 * like suspend_wait(). VF recovery is deliberately not handled (no
-	 * -EAGAIN) since a blocking caller cannot retry.
+	 * A timeout on either bans the queue (being multi-queue, that tears down
+	 * the whole group). A secondary suspend has no real GuC round-trip, so
+	 * its timeout is a software scheduler stall rather than a GuC fault, but
+	 * banning is still the safe recovery: otherwise the queue is left with
+	 * suspend_pending set and a subsequent resume() trips the !suspend_pending
+	 * assert.
 	 */
-	q = xe_exec_queue_multi_queue_primary(q);
-
-#define WAIT_COND \
-	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
-	 xe_guc_read_stopped(guc))
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		ret = guc_exec_queue_wait_suspend_done(q, blocking);
+		if (ret == -ETIME)
+			guc_exec_queue_suspend_timeout_ban(q);
+		if (ret)
+			return ret;
+	}
 
-	if (IS_SRIOV_VF(xe))
-		ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
-	else
-		ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND, HZ * 5);
+	q = xe_exec_queue_multi_queue_primary(q);
+	ret = guc_exec_queue_wait_suspend_done(q, blocking);
+	if (ret == -ETIME)
+		guc_exec_queue_suspend_timeout_ban(q);
 
-#undef WAIT_COND
+	return ret;
+}
 
-	if (!ret) {
-		guc_exec_queue_suspend_timeout_ban(q);
-		return -ETIME;
-	}
+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+{
+	return guc_exec_queue_suspend_wait_common(q, false);
+}
 
-	return 0;
+/*
+ * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers that
+ * must complete the wait on behalf of a queue possibly owned by a different
+ * process (e.g. cleanup/undo paths). An interruptible wait could return
+ * -ERESTARTSYS if the calling task is signalled, leaving that queue suspended
+ * forever (cross-process DoS). VF recovery is deliberately not handled (no
+ * -EAGAIN) since a blocking caller cannot retry.
+ */
+static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
+{
+	return guc_exec_queue_suspend_wait_common(q, true);
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
-- 
2.43.0

