Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C64C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 13:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FB410EBAB;
	Tue, 11 Aug 2026 13:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RH+dREYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0110EB96
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786453221; x=1817989221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHiTsn2+3FCqKlGPTUnpUDg+799WdG1NXC1IqX7YTgQ=;
 b=RH+dREYSgHy4+da3Xyg/ERd78FXZN547jUsJev9m13DCjeHCNlZs1ZFl
 XNEZVSmx1F+3SPZzGDb5KMUHFWDaJf20d9w2Slc/lT+u2ASq5kMK5kJid
 xE0b/lDcWcqpORHPxdSZGpjjfefjnYgJL7YPhsxqAQTqODpEVpq0ffcQ4
 RcL2huvgj4APPgUbFYXtRNSHDBAiy2SjrnTCNCrAH8Qn8Ed991d9QGlAg
 cB9rHVeZnJTY042cziOHKrt6mwS325Mf+vdPuEJysE2pgHyhYhAiAX07u
 sUwA0Mxk8wBivCJ+iw83PE6LwTn1vRP/VdD1IWch6PTLqN9H3cIdWLhYk Q==;
X-CSE-ConnectionGUID: 5v2rd9o2Q5yp9E3/QyXzCg==
X-CSE-MsgGUID: /pT2dfJ/R7SYnkaVYKSBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87006958"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87006958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:00:21 -0700
X-CSE-ConnectionGUID: hKDk5HMXSnSOu9q5SOezBg==
X-CSE-MsgGUID: ZjxuDwT5TYCLrHYCHsndeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266819265"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 11 Aug 2026 06:00:19 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug handling
Date: Tue, 11 Aug 2026 19:07:55 +0530
Message-ID: <20260811133753.1742666-5-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811133753.1742666-4-nitin.r.gote@intel.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
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

The core_hotunplug "with-load" subtests trigger a "Missing outer runtime
PM protection" warning when an exec queue is torn down from a deferred fd
close after the device has been hot-unplugged:

  guc_exec_queue_add_msg
  guc_exec_queue_destroy
  xe_exec_queue_destroy
  xe_file_close

The reference is not actually missing. On unplug the PCI core disables
runtime PM (device_del() -> __pm_runtime_disable()) while the old
drm_device is kept alive by the still-open fd. Once runtime PM is
disabled pm_runtime_get_if_in_use() returns -EINVAL regardless of the
usage count, so xe_pm_runtime_get_noresume() can no longer observe the
held reference and warns.

drm_dev_unplug() always runs before runtime PM is disabled, so gate the
message submission layer on the bound state instead of the PM reference:

 - guc_exec_queue_add_msg(): only take the noresume PM reference while
   drm_dev_enter() succeeds and record it in the message (MSG_PM_REF), so
   the put in guc_exec_queue_process_msg() stays balanced.

 - guc_exec_queue_process_msg(): re-check the bound state and skip each
   handler's HW access once the device is gone.

 - guc_exec_queue_destroy(): always post the CLEANUP message; the cleanup
   handler issues the deregister H2G only while bound, registered, fw
   running and not wedged, otherwise it tears down on the driver side.

Also document the post-unplug PM-reference hazard in
xe_pm_runtime_get_noresume().

Observed with new IGT core_hotunplug subtests:
  igt@core_hotunplug@hotreplug-with-load
  igt@core_hotunplug@hotunplug-rescan-with-load

v2:
 - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
   and instead exclude hot-unplug from the WARN in
   xe_pm_runtime_get_noresume().

v3:
 - Rework the fix in the message-submission layer instead of touching the
   WARN; gate PM/HW work on drm_dev_enter() and route all queues through
   the CLEANUP message. (Matthew Brost)
 - Prove the root cause (runtime PM disabled on unplug, not a zero
   refcount) and record it in the commit message. (Matt B, Raag)
 - Also remove EXEC_QUEUE_FLAG_PERMANENT flag in
   separate patch (Matthew Brost)

Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 98 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pm.c         |  5 ++
 2 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..80b69f7d0dc9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1812,32 +1812,15 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
-
-	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-		guc_exec_queue_do_destroy(q);
-	else
-		xe_destroy_wq_queue(&q->guc->destroy_async);
-}
-
-static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	/*
-	 * Might be done from within the GPU scheduler, need to do async as we
-	 * fini the scheduler when the engine is fini'd, the scheduler can't
-	 * complete fini within itself (circular dependency). Async resolves
-	 * this we and don't really care when everything is fini'd, just that it
-	 * is.
-	 */
-	guc_exec_queue_destroy_async(q);
+	xe_destroy_wq_queue(&q->guc->destroy_async);
 }
 
-static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg,
+						 bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
 	/*
@@ -1850,10 +1833,12 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
 	 *   will not process further requests and all resources must be cleaned up locally.
 	 */
-	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
+	/* A wedged GuC won't answer the H2G, so tear down on the driver side. */
+	if (bound && !exec_queue_wedged(q) && exec_queue_registered(q) &&
+	    xe_uc_fw_is_running(&guc->fw))
 		disable_scheduling_deregister(guc, q);
 	else
-		__guc_exec_queue_destroy(guc, q);
+		guc_exec_queue_destroy_async(q);
 }
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
@@ -1861,12 +1846,13 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
 }
 
-static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg,
+							 bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	if (guc_exec_queue_allowed_to_change_state(q))
+	if (guc_exec_queue_allowed_to_change_state(q) && bound)
 		init_policies(guc, q);
 	kfree(msg);
 }
@@ -1904,13 +1890,14 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	__suspend_fence_signal(q);
 }
 
-static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg,
+						 bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
-	    exec_queue_enabled(q)) {
+	    exec_queue_enabled(q) && bound) {
 		wait_event(guc->ct.wq, vf_recovery(guc) ||
 			   ((q->guc->resume_time != RESUME_PENDING ||
 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
@@ -1934,11 +1921,12 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 	}
 }
 
-static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg,
+						bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 
-	if (guc_exec_queue_allowed_to_change_state(q)) {
+	if (guc_exec_queue_allowed_to_change_state(q) && bound) {
 		clear_exec_queue_suspended(q);
 		if (!exec_queue_enabled(q)) {
 			q->guc->resume_time = RESUME_PENDING;
@@ -1950,17 +1938,19 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	}
 }
 
-static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg,
+								  bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 
-	if (guc_exec_queue_allowed_to_change_state(q))
+	if (guc_exec_queue_allowed_to_change_state(q) && bound)
 		guc_exec_queue_send_cgp_sync(q, 0);
 
 	kfree(msg);
 }
 
-static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
+						  bool bound)
 {
 	struct xe_exec_queue *q = msg->private_data;
 
@@ -1969,7 +1959,7 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
 	 * CGP update + CGP_SYNC (re-applies the current priority from
 	 * q->multi_queue.priority).
 	 */
-	if (guc_exec_queue_allowed_to_change_state(q))
+	if (guc_exec_queue_allowed_to_change_state(q) && bound)
 		guc_exec_queue_send_cgp_sync(q, 0);
 }
 
@@ -1982,37 +1972,45 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
+#define MSG_PM_REF	BIT(10)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
+	int idx;
+	bool pm_ref = !!(msg->opcode & MSG_PM_REF);
+	bool bound = drm_dev_enter(&xe->drm, &idx);
 
 	trace_xe_sched_msg_recv(msg);
 
-	switch (msg->opcode) {
+	switch (msg->opcode & OPCODE_MASK) {
 	case CLEANUP:
-		__guc_exec_queue_process_msg_cleanup(msg);
+		__guc_exec_queue_process_msg_cleanup(msg, bound);
 		break;
 	case SET_SCHED_PROPS:
-		__guc_exec_queue_process_msg_set_sched_props(msg);
+		__guc_exec_queue_process_msg_set_sched_props(msg, bound);
 		break;
 	case SUSPEND:
-		__guc_exec_queue_process_msg_suspend(msg);
+		__guc_exec_queue_process_msg_suspend(msg, bound);
 		break;
 	case RESUME:
-		__guc_exec_queue_process_msg_resume(msg);
+		__guc_exec_queue_process_msg_resume(msg, bound);
 		break;
 	case SET_MULTI_QUEUE_PRIORITY:
-		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
+		__guc_exec_queue_process_msg_set_multi_queue_priority(msg, bound);
 		break;
 	case CGP_SYNC_MSG:
-		__guc_exec_queue_process_msg_cgp_sync(msg);
+		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
 
-	xe_pm_runtime_put(xe);
+	if (pm_ref)
+		xe_pm_runtime_put(xe);
+
+	if (bound)
+		drm_dev_exit(idx);
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
@@ -2137,10 +2135,16 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
-	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
+	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
+	int idx;
+	bool bound = drm_dev_enter(&xe->drm, &idx);
 
 	INIT_LIST_HEAD(&msg->link);
 	msg->opcode = opcode & OPCODE_MASK;
+	if (bound) {
+		xe_pm_runtime_get_noresume(xe);
+		msg->opcode |= MSG_PM_REF;
+	}
 	msg->private_data = q;
 
 	trace_xe_sched_msg_add(msg);
@@ -2150,6 +2154,9 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
 		xe_sched_add_msg_locked(&q->guc->sched, msg);
 	else
 		xe_sched_add_msg(&q->guc->sched, msg);
+
+	if (bound)
+		drm_dev_exit(idx);
 }
 
 static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
@@ -2182,10 +2189,7 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
-		guc_exec_queue_add_msg(q, msg, CLEANUP);
-	else
-		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
+	guc_exec_queue_add_msg(q, msg, CLEANUP);
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
@@ -2650,7 +2654,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 
 	if (do_destroy)
-		__guc_exec_queue_destroy(guc, q);
+		guc_exec_queue_destroy_async(q);
 }
 
 static int guc_submit_reset_prepare(struct xe_guc *guc)
@@ -3296,7 +3300,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_deregister_done(q);
 
 	clear_exec_queue_registered(q);
-	__guc_exec_queue_destroy(guc, q);
+	guc_exec_queue_destroy_async(q);
 }
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a5289a9df8d2..f517bf453b54 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -905,6 +905,11 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
  * break scope-based handling, or when the lifetime of the runtime PM reference
  * does not match a specific scope (e.g., runtime PM obtained in one function
  * and released in a different one).
+ *
+ * This helper assumes the caller already holds a runtime PM reference and
+ * only warns when it cannot see one. After hot-unplug runtime PM is disabled
+ * and the check fails even when a reference is held, so callers that may run
+ * after unplug must guard it with drm_dev_enter()/drm_dev_exit() instead.
  */
 void xe_pm_runtime_get_noresume(struct xe_device *xe)
 {
-- 
2.50.1

