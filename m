Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07AFC47077
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 19:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3310E697;
	Fri,  5 Jan 2024 19:04:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112C10E6A4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704481481; x=1736017481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uOAVSlFQzjYXDb1OFFTF3rbHUMsZ3OanH63+6BboU34=;
 b=Mu59NPVlHf6hzXcnJX8nbazCXJzCV0oM0FktsSkobwjh3ablBVHkqZSx
 OXhZn06hHNOjwJtfS6RoKOVQpZTRE71xMvR/pQsJOxbL9FI5ML5Whufzy
 tGv25SOOSICWsW325H5UqO814GWw7uKj71x2ef5du4CIL42QeS++U9i9f
 HbVHtvaCL+kw03SQcZrc3lILhvbUr9fjGXO0iDwvBJ5frOOC3RT6OXUXY
 yk42dL535W/yceNKKSPlUOMOr8+1Agk8EgoY7UDVieV+iJD9oSLpaNio0
 ggH7aj26VTSxk2VC//F3QqcF7JfSMyxWOp+oXkmyoa6rKd2DklcoEcCjD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="388013237"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="388013237"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815025357"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="815025357"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Fix modifying exec_queue priority in
 xe_migrate_init
Date: Fri,  5 Jan 2024 11:04:40 -0800
Message-ID: <20240105190440.9908-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105190440.9908-1-brian.welty@intel.com>
References: <20240105190440.9908-1-brian.welty@intel.com>
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

After exec_queue has been created, we cannot simply modify q->priority.
This needs to be done by the backend via q->ops.  However in this case,
it would be more efficient to simply pass a flag when creating the
exec_queue and set the desired priority upfront during queue creation.

To that end: new flag EXEC_QUEUE_FLAG_HIGH_PRIORITY is introduced.
The priority field is moved to be with other scheduling properties and
is now exec_queue.sched_props.priority. This is no longer set to initial
value by the backend, but is now set within __xe_exec_queue_create().

Fixes: b4eecedc75c1 ("drm/xe: Fix potential deadlock handling page faults")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 6 ++++--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
 drivers/gpu/drm/xe/xe_migrate.c          | 5 ++---
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 44fe8097b7cd..bcfc4127c7c5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -67,6 +67,11 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
 				hwe->eclass->sched_props.preempt_timeout_us;
+	if (q->flags & EXEC_QUEUE_FLAG_KERNEL &&
+	    q->flags & EXEC_QUEUE_FLAG_HIGH_PRIORITY)
+		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
+	else
+		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3d7e704ec3d9..8d4b7feb8c30 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -52,8 +52,6 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
-	/** @priority: priority of this exec queue */
-	enum xe_exec_queue_priority priority;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
@@ -84,6 +82,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
+/* kernel exec_queue only, set priority to highest level */
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -142,6 +142,8 @@ struct xe_exec_queue {
 		u32 timeslice_us;
 		/** @preempt_timeout_us: preemption timeout in micro-seconds */
 		u32 preempt_timeout_us;
+		/** @priority: priority of this exec queue */
+		enum xe_exec_queue_priority priority;
 	} sched_props;
 
 	/** @compute: compute exec queue state */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5de3ac47c462..54ffcfcdd41f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -421,7 +421,7 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum xe_exec_queue_priority prio = q->priority;
+	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
@@ -1231,7 +1231,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
-	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
@@ -1301,14 +1300,14 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->priority == priority || exec_queue_killed_or_banned(q))
+	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	q->priority = priority;
+	q->sched_props.priority = priority;
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index adf1dab5eba2..02fca8f9adc2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -344,7 +344,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
-					    EXEC_QUEUE_FLAG_PERMANENT);
+					    EXEC_QUEUE_FLAG_PERMANENT |
+					    EXEC_QUEUE_FLAG_HIGH_PRIORITY);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
@@ -355,8 +356,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
-	if (xe->info.has_usm)
-		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
-- 
2.43.0

