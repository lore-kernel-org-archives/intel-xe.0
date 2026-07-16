Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF07BC44510
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 04:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DB10E2AE;
	Thu, 16 Jul 2026 04:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9GJrxCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682110E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 04:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784177901; x=1815713901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t1Pus1qgLbCvwwPpPKuBw/qJ0qZQhCoXXE/UXHxP2DA=;
 b=K9GJrxCBVwg/iHtPKKnGzSgH4x1CgQAm65KocAub50eDXKWqN84l5Xo+
 dCt3ftthbQx8CmztXqce+x0J81F4uX4/9Gklcdq2RnZBfb9RiHHFJgbH8
 dqVO6VOV+l2G/U5DQl4M+gKox2jTy9oNCKVACAcQ+23gRdzs69Sznk7aj
 IOEAu+XBcnAtGZFfhBMx9OurjaYkIlSEf66pixlooi0dx2gGlQn/zEAbX
 wbJFWv88MG6kYm/DmCQQKS+x0z9RgE5SDzU1PU8CnbClNXQKmh02e39hg
 cRmo+lTpYFyldqjV2oficp5A4Z1Gfl76WlAfkqaN60Czj7mBsQnFhtf3w g==;
X-CSE-ConnectionGUID: xIBjSH9VSh6ES6MJHiGwYA==
X-CSE-MsgGUID: bAyCMBbZSpObQc0tOuhO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110374817"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="110374817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 21:58:20 -0700
X-CSE-ConnectionGUID: I+2+ELFaRL6yHEDFhx488A==
X-CSE-MsgGUID: Jn7uLsFNRnOVgIra1EPIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="252418076"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 21:58:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2] drm/xe/multi_queue: wait for secondary's own suspend in
 suspend_wait
Date: Wed, 15 Jul 2026 21:58:16 -0700
Message-ID: <20260716045815.2315470-2-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

