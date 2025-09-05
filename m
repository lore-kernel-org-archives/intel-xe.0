Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8836CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8010EC48;
	Fri,  5 Sep 2025 21:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEjr0RFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932B510EC48
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757107378; x=1788643378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E35QJYvjvvcxSGUPrk9FmsQd0dzFFkRrAWSezjIX9Ng=;
 b=lEjr0RFDc4t4/2mrsTM6DsZH/9XIQFtBDpy9myh6rTo1rSFGRz2fsXAO
 ForO/eOHlH+AFk4IiqHiOzU5aKLwQ91p/qmFSWt4CZeoZPNgb33n8tJXV
 z5Es9ZMPvq4YCr7XZ+7ybj2C9wpW/qjihZQZa8KuAU8WqLFPXE1ZIOc6B
 FLOdzE7/JD4lzXVBhJhu5muMmDc3kJ7EuMSC/2N6cDU6HINcIwbXRLdPE
 I1d/kvu9nmVfM/86alCsZDCNoNGFvZA8U0erJpELROPLIP2G88lRQ2B/+
 7tQYzU41A+bBfWwsXjzBbtopIbZXB3g6RaNCgl46iqEXWc6/CNOGnJD2u g==;
X-CSE-ConnectionGUID: wNEQk389QwW67ftB4mYU6g==
X-CSE-MsgGUID: zF5xcvNETZeOoD9Li1rijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70841705"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70841705"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:22:58 -0700
X-CSE-ConnectionGUID: 9JKt4G4TQnq2XcQLKWpHAg==
X-CSE-MsgGUID: VT3hQTJVTg+WT0VlRnazqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172143138"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:22:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe: Rename exec_queue ops.fini to ops.destroy
Date: Fri,  5 Sep 2025 14:22:49 -0700
Message-ID: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
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

The existing .fini backend function does not just cleanup what was done
by the .init, and it instead performs extra queue destruction operations.
Since we do require a function that just undoes the .init to fix a bug
(fix coming in the next patch), it is cleaner to use the .fini name for
that new function, which means we need to rename the existing one to
something different. Since the function pointer is currently called from
exec_queue_destroy, the .destroy name has been chosen.

Note that this patch is meant to be squashed with the next one before
merge, so that the fix can be applied as a single commit and
backported more easily. It is being kept separate for ease of review.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c           |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  4 +--
 drivers/gpu/drm/xe/xe_execlist.c             | 12 ++++-----
 drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c           | 28 ++++++++++----------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..b6c63845dbab 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -331,7 +331,7 @@ void xe_exec_queue_destroy(struct kref *ref)
 			xe_exec_queue_put(eq);
 	}
 
-	q->ops->fini(q);
+	q->ops->destroy(q);
 }
 
 void xe_exec_queue_fini(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ba443a497b38..d1dfd3eb19e2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -181,8 +181,8 @@ struct xe_exec_queue_ops {
 	int (*init)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
-	/** @fini: Fini exec queue for submission backend */
-	void (*fini)(struct xe_exec_queue *q);
+	/** @destroy: Destroy exec queue for submission backend */
+	void (*destroy)(struct xe_exec_queue *q);
 	/** @set_priority: Set priority for exec queue */
 	int (*set_priority)(struct xe_exec_queue *q,
 			    enum xe_exec_queue_priority priority);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..9115e2b13b8d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -385,10 +385,10 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
-static void execlist_exec_queue_fini_async(struct work_struct *w)
+static void execlist_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_execlist_exec_queue *ee =
-		container_of(w, struct xe_execlist_exec_queue, fini_async);
+		container_of(w, struct xe_execlist_exec_queue, destroy_async);
 	struct xe_exec_queue *q = ee->q;
 	struct xe_execlist_exec_queue *exl = q->execlist;
 	struct xe_device *xe = gt_to_xe(q->gt);
@@ -413,10 +413,10 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 	/* NIY */
 }
 
-static void execlist_exec_queue_fini(struct xe_exec_queue *q)
+static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
 {
-	INIT_WORK(&q->execlist->fini_async, execlist_exec_queue_fini_async);
-	queue_work(system_unbound_wq, &q->execlist->fini_async);
+	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
+	queue_work(system_unbound_wq, &q->execlist->destroy_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
@@ -466,7 +466,7 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
-	.fini = execlist_exec_queue_fini,
+	.destroy = execlist_exec_queue_destroy,
 	.set_priority = execlist_exec_queue_set_priority,
 	.set_timeslice = execlist_exec_queue_set_timeslice,
 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
index 415140936f11..92c4ba52db0c 100644
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
@@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
 
 	bool has_run;
 
-	struct work_struct fini_async;
+	struct work_struct destroy_async;
 
 	enum xe_exec_queue_priority active_priority;
 	struct list_head active_link;
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3f421e2adc0..c30c0e3ccbbb 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
-	/** @fini_async: do final fini async from this worker */
-	struct work_struct fini_async;
+	/** @destroy_async: do final destroy async from this worker */
+	struct work_struct destroy_async;
 	/** @resume_time: time of last resume */
 	u64 resume_time;
 	/** @state: GuC specific state for this xe_exec_queue */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 860c07da598a..faed952bac81 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1418,10 +1418,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-static void __guc_exec_queue_fini_async(struct work_struct *w)
+static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, fini_async);
+		container_of(w, struct xe_guc_exec_queue, destroy_async);
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
@@ -1445,21 +1445,21 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
-static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
+static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
-	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
+	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-		__guc_exec_queue_fini_async(&q->guc->fini_async);
+		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
 	else
-		queue_work(xe->destroy_wq, &q->guc->fini_async);
+		queue_work(xe->destroy_wq, &q->guc->destroy_async);
 }
 
-static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
+static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	/*
 	 * Might be done from within the GPU scheduler, need to do async as we
@@ -1468,7 +1468,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * this we and don't really care when everything is fini'd, just that it
 	 * is.
 	 */
-	guc_exec_queue_fini_async(q);
+	guc_exec_queue_destroy_async(q);
 }
 
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
@@ -1482,7 +1482,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	if (exec_queue_registered(q))
 		disable_scheduling_deregister(guc, q);
 	else
-		__guc_exec_queue_fini(guc, q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
@@ -1715,14 +1715,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_CLEANUP	0
 #define STATIC_MSG_SUSPEND	1
 #define STATIC_MSG_RESUME	2
-static void guc_exec_queue_fini(struct xe_exec_queue *q)
+static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
-		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
+		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
@@ -1851,7 +1851,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
-	.fini = guc_exec_queue_fini,
+	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
@@ -1873,7 +1873,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
-			__guc_exec_queue_fini(guc, q);
+			__guc_exec_queue_destroy(guc, q);
 	}
 	if (q->guc->suspend_pending) {
 		set_exec_queue_suspended(q);
@@ -2202,7 +2202,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
-		__guc_exec_queue_fini(guc, q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
-- 
2.43.0

