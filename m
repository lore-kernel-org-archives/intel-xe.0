Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71637CAC582
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 22:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C5810E80D;
	Tue,  9 Sep 2025 22:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OryMVhP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5258010E80D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 22:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757455969; x=1788991969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7aPS1a1IM3U+fG/jTMecNSrOhlNVbr6ZtgtJIOfy9Lg=;
 b=OryMVhP0UMHnAEMNv5pkzPwBWar3fCvbooyRK/uql9ok2vhCyIdd+Dwe
 No/VrvWijkUekJP8clEpTPfTQn9azsDNa2jTsjqY1/qSQyUeTvIhSvZYY
 NtUtKiInkEwDmJ5qHZeY0fqgOeZU9vvzAyP3wT3P3iTjgp3iuOrGAsle8
 MVTisERiYOqfbO81qD+c3Qde88LaEiAEVV+f/XTOLHUMv2Ymq1T7jlHkD
 wLTe0tAcrwiDpr5xKxyjhSDYVOiVi2fpThWnWUEjJngdOaPxmxrf57IB0
 eZe2cO/YLZZ+tA67ti28p/Yfpr3eFpI/9Uu8EnPWb4MuU+0s4OJqw6RtW g==;
X-CSE-ConnectionGUID: uqswN/crRLeIsv/X4ACJrA==
X-CSE-MsgGUID: 7UJnkepnSuKhFzAJE0AxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71135504"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="71135504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:12:49 -0700
X-CSE-ConnectionGUID: c/HxubE1Q5KjhoP3xL1QTA==
X-CSE-MsgGUID: yZtAtwbWQ8Op8k+mZLfj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="210349016"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:12:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 1/2] drm/xe: Fix error handling if PXP fails to start
Date: Tue,  9 Sep 2025 15:12:40 -0700
Message-ID: <20250909221240.3711023-3-daniele.ceraolospurio@intel.com>
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

Since the PXP start comes after __xe_exec_queue_init() has completed,
we need to cleanup what was done in that function in case of a PXP
start error.
__xe_exec_queue_init calls the submission backend init() function,
so we need to introduce an opposite for that. Unfortunately, while
we already have a fini() function pointer, it performs other
operations in addition to cleaning up what was done by the init().
Therefore, for clarity, the existing fini() has been renamed to
destroy(), while a new fini() has been added to only clean up what was
done by the init(), with the latter being called by the former (via
xe_exec_queue_fini).

Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c           | 22 ++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  8 ++-
 drivers/gpu/drm/xe/xe_execlist.c             | 25 ++++++----
 drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 52 ++++++++++++--------
 6 files changed, 72 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..37b2b93b73d6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -199,6 +199,16 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static void __xe_exec_queue_fini(struct xe_exec_queue *q)
+{
+	int i;
+
+	q->ops->fini(q);
+
+	for (i = 0; i < q->width; ++i)
+		xe_lrc_put(q->lrc[i]);
+}
+
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags,
@@ -229,11 +239,13 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (xe_exec_queue_uses_pxp(q)) {
 		err = xe_pxp_exec_queue_add(xe->pxp, q);
 		if (err)
-			goto err_post_alloc;
+			goto err_post_init;
 	}
 
 	return q;
 
+err_post_init:
+	__xe_exec_queue_fini(q);
 err_post_alloc:
 	__xe_exec_queue_free(q);
 	return ERR_PTR(err);
@@ -331,13 +343,11 @@ void xe_exec_queue_destroy(struct kref *ref)
 			xe_exec_queue_put(eq);
 	}
 
-	q->ops->fini(q);
+	q->ops->destroy(q);
 }
 
 void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
-	int i;
-
 	/*
 	 * Before releasing our ref to lrc and xef, accumulate our run ticks
 	 * and wakeup any waiters.
@@ -346,9 +356,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
 		wake_up_var(&q->xef->exec_queue.pending_removal);
 
-	for (i = 0; i < q->width; ++i)
-		xe_lrc_put(q->lrc[i]);
-
+	__xe_exec_queue_fini(q);
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ba443a497b38..27b76cf9da89 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -181,8 +181,14 @@ struct xe_exec_queue_ops {
 	int (*init)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
-	/** @fini: Fini exec queue for submission backend */
+	/** @fini: Undoes the init() for submission backend */
 	void (*fini)(struct xe_exec_queue *q);
+	/**
+	 * @destroy: Destroy exec queue for submission backend. The backend
+	 * function must call xe_exec_queue_fini() (which will in turn call the
+	 * fini() backend function) to ensure the queue is properly cleaned up.
+	 */
+	void (*destroy)(struct xe_exec_queue *q);
 	/** @set_priority: Set priority for exec queue */
 	int (*set_priority)(struct xe_exec_queue *q,
 			    enum xe_exec_queue_priority priority);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..f83d421ac9d3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -385,10 +385,20 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
-static void execlist_exec_queue_fini_async(struct work_struct *w)
+static void execlist_exec_queue_fini(struct xe_exec_queue *q)
+{
+	struct xe_execlist_exec_queue *exl = q->execlist;
+
+	drm_sched_entity_fini(&exl->entity);
+	drm_sched_fini(&exl->sched);
+
+	kfree(exl);
+}
+
+static void execlist_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_execlist_exec_queue *ee =
-		container_of(w, struct xe_execlist_exec_queue, fini_async);
+		container_of(w, struct xe_execlist_exec_queue, destroy_async);
 	struct xe_exec_queue *q = ee->q;
 	struct xe_execlist_exec_queue *exl = q->execlist;
 	struct xe_device *xe = gt_to_xe(q->gt);
@@ -401,10 +411,6 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
 		list_del(&exl->active_link);
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
-	drm_sched_entity_fini(&exl->entity);
-	drm_sched_fini(&exl->sched);
-	kfree(exl);
-
 	xe_exec_queue_fini(q);
 }
 
@@ -413,10 +419,10 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
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
@@ -467,6 +473,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
 	.fini = execlist_exec_queue_fini,
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
index a465594b61dc..311656a01469 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1419,48 +1419,57 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-static void __guc_exec_queue_fini_async(struct work_struct *w)
+static void guc_exec_queue_fini(struct xe_exec_queue *q)
+{
+	struct xe_guc_exec_queue *ge = q->guc;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	release_guc_id(guc, q);
+	xe_sched_entity_fini(&ge->entity);
+	xe_sched_fini(&ge->sched);
+
+	/*
+	 * RCU free due sched being exported via DRM scheduler fences
+	 * (timeline name).
+	 */
+	kfree_rcu(ge, rcu);
+}
+
+static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, fini_async);
+		container_of(w, struct xe_guc_exec_queue, destroy_async);
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
 	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
-	release_guc_id(guc, q);
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
-	xe_sched_entity_fini(&ge->entity);
-	xe_sched_fini(&ge->sched);
 
-	/*
-	 * RCU free due sched being exported via DRM scheduler fences
-	 * (timeline name).
-	 */
-	kfree_rcu(ge, rcu);
 	xe_exec_queue_fini(q);
+
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
@@ -1469,7 +1478,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * this we and don't really care when everything is fini'd, just that it
 	 * is.
 	 */
-	guc_exec_queue_fini_async(q);
+	guc_exec_queue_destroy_async(q);
 }
 
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
@@ -1483,7 +1492,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	if (exec_queue_registered(q))
 		disable_scheduling_deregister(guc, q);
 	else
-		__guc_exec_queue_fini(guc, q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
@@ -1716,14 +1725,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
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
@@ -1853,6 +1862,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
+	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
@@ -1874,7 +1884,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
-			__guc_exec_queue_fini(guc, q);
+			__guc_exec_queue_destroy(guc, q);
 	}
 	if (q->guc->suspend_pending) {
 		set_exec_queue_suspended(q);
@@ -2203,7 +2213,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
-		__guc_exec_queue_fini(guc, q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
-- 
2.43.0

