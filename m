Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E991CA101C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD06B10EC5C;
	Fri,  5 Sep 2025 21:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOeu1p/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2D910EC48
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757107380; x=1788643380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2c0V+LunICzYQxAe61CWaotySqGuutCKTfWtHqH+4ek=;
 b=HOeu1p/oIWHQ5o5bcjeZcKetB3smrjJcZB1qIihuohrd3PsXJVojSsU1
 Kko6pLTI7hVXtZMGbKXWc3TdJoxomd2s3J6b6AqHWxckUX4ALlHKPi43G
 WYqwnmDKF2Vbm7O2r4JNPKsRPcucfVjjzBbFbW6+pwKFQKsT+o9rYnetw
 oLWEan+N4fjPgo/NvYMNr+j4NmCuRVDnO7zAexlOV5RtZTUma/oJFOFWG
 SUsE6+aofoL6Pp6QyjXOgdEgyyZC22kyYWXgb0paR9tfDyxZUQOIp25jp
 CWkLwBSyBIVdwTVy1bOz4OaTkKE6RM/Gar4T9mnUSy+HXz/r60YZc2lP4 A==;
X-CSE-ConnectionGUID: ABESo3mGSXSBOf53H8cvxg==
X-CSE-MsgGUID: aTxt0FoxSWqAUtGvrF5mug==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70841706"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70841706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:23:00 -0700
X-CSE-ConnectionGUID: jkqFoCnORPGP824rtXPLdQ==
X-CSE-MsgGUID: JfLxPN1bSX+38tYNgEG66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172143153"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:23:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe: Fix error handling if PXP fails to start
Date: Fri,  5 Sep 2025 14:22:50 -0700
Message-ID: <20250905212248.3312537-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
References: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
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
so we need to introduce an opposite for that.

Note that this patch is meant to be squashed with the previous one
before merge, so that the fix can be applied as a single commit and
backported more easily. It is being kept separate for ease of review.

Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 22 ++++++++++++++------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  8 +++++++-
 drivers/gpu/drm/xe/xe_execlist.c         | 15 ++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.c       | 26 ++++++++++++++++--------
 4 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b6c63845dbab..3aad3d10560d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
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
+
+	return;
+}
+
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags,
@@ -229,11 +241,13 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
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
@@ -336,8 +350,6 @@ void xe_exec_queue_destroy(struct kref *ref)
 
 void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
-	int i;
-
 	/*
 	 * Before releasing our ref to lrc and xef, accumulate our run ticks
 	 * and wakeup any waiters.
@@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
 		wake_up_var(&q->xef->exec_queue.pending_removal);
 
-	for (i = 0; i < q->width; ++i)
-		xe_lrc_put(q->lrc[i]);
-
+	__xe_exec_queue_fini(q);
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index d1dfd3eb19e2..27b76cf9da89 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -181,7 +181,13 @@ struct xe_exec_queue_ops {
 	int (*init)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
-	/** @destroy: Destroy exec queue for submission backend */
+	/** @fini: Undoes the init() for submission backend */
+	void (*fini)(struct xe_exec_queue *q);
+	/**
+	 * @destroy: Destroy exec queue for submission backend. The backend
+	 * function must call xe_exec_queue_fini() (which will in turn call the
+	 * fini() backend function) to ensure the queue is properly cleaned up.
+	 */
 	void (*destroy)(struct xe_exec_queue *q);
 	/** @set_priority: Set priority for exec queue */
 	int (*set_priority)(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9115e2b13b8d..f83d421ac9d3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -385,6 +385,16 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
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
 static void execlist_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_execlist_exec_queue *ee =
@@ -401,10 +411,6 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
 		list_del(&exl->active_link);
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
-	drm_sched_entity_fini(&exl->entity);
-	drm_sched_fini(&exl->sched);
-	kfree(exl);
-
 	xe_exec_queue_fini(q);
 }
 
@@ -466,6 +472,7 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
+	.fini = execlist_exec_queue_fini,
 	.destroy = execlist_exec_queue_destroy,
 	.set_priority = execlist_exec_queue_set_priority,
 	.set_timeslice = execlist_exec_queue_set_timeslice,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index faed952bac81..75208ea4d408 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1418,6 +1418,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
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
 static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
@@ -1428,20 +1444,13 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
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
 
@@ -1851,6 +1860,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
+	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
-- 
2.43.0

