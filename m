Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B344DC4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E5710E631;
	Wed, 10 Jan 2024 17:33:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BEA10E623
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704907975; x=1736443975;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=beSCHZrNNzNcAJExO7gm0J3caDiQjSrHj2xYXarobgE=;
 b=lMAV04y+chtOJry4bqV2JAhJOe/nt8HPR5QCL6uAUNaAy3iilnFcd+rp
 EHykE7kZPKTw3GWgB3M+XyY6dPzRtE0Tx1KMNw8fgfw2NniPJZIkj4gOp
 MpL9nRB913euW4+yZhNWPBQgXuQ2eqG5ePg3/Z0lSudINcwUWKzONgHvo
 PaH8UF/OEHKuxlR3dvMocWJgwM1vw+Qpq44qmJLn7rlu1iPsDO9/mtWQd
 PjrnOAMOWP42Yg+F0rT/2f0mG4JUMMkjZ9/6TV2CPuUKnBV+JaxIlVrCl
 9cD6pEp/QhlpTVSxhvOzoZNzVfMluTlOkVXMexj/uMm1jV25ncjnSy2BQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389026826"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389026826"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955435676"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955435676"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:53 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/xe: Finish refactoring of exec_queue_create
Date: Wed, 10 Jan 2024 09:32:51 -0800
Message-ID: <20240110173252.16707-4-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110173252.16707-1-brian.welty@intel.com>
References: <20240110173252.16707-1-brian.welty@intel.com>
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

Setting of exec_queue user extensions is moved from the end of the ioctl
function earlier, into __xe_exec_queue_alloc().
This fixes bug in that the USM attributes for access counters were being
applied too late, and effectively were ignored.

However, in order to apply user extensions this early, we can no longer
call q->ops functions.  Instead, make it more efficient. The user extension
functions can simply update the q->sched_props values and they will be
applied by the backend during q->ops->init().

v2: minor changes for readability (Matt)

Signed-off-by: Brian Welty <brian.welty@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 74 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_exec_queue.h |  3 +-
 drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 +-
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 5 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4ff7e50112ca..c0b7434e78f1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -30,14 +30,18 @@ enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
 };
 
+static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
+				      u64 extensions, int ext_number, bool create);
+
 static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 						   struct xe_vm *vm,
 						   u32 logical_mask,
 						   u16 width, struct xe_hw_engine *hwe,
-						   u32 flags)
+						   u32 flags, u64 extensions)
 {
 	struct xe_exec_queue *q;
 	struct xe_gt *gt = hwe->gt;
+	int err;
 
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
@@ -50,8 +54,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->flags = flags;
 	q->hwe = hwe;
 	q->gt = gt;
-	if (vm)
-		q->vm = xe_vm_get(vm);
 	q->class = hwe->class;
 	q->width = width;
 	q->logical_mask = logical_mask;
@@ -73,6 +75,21 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	if (extensions) {
+		/*
+		 * may set q->usm, must come before xe_lrc_init(),
+		 * may overwrite q->sched_props, must come before q->ops->init()
+		 */
+		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
+		if (err) {
+			kfree(q);
+			return ERR_PTR(err);
+		}
+	}
+
+	if (vm)
+		q->vm = xe_vm_get(vm);
+
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
 		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
@@ -128,12 +145,14 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
-					   struct xe_hw_engine *hwe, u32 flags)
+					   struct xe_hw_engine *hwe, u32 flags,
+					   u64 extensions)
 {
 	struct xe_exec_queue *q;
 	int err;
 
-	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
+	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
+				  extensions);
 	if (IS_ERR(q))
 		return q;
 
@@ -178,7 +197,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 	if (!logical_mask)
 		return ERR_PTR(-ENODEV);
 
-	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags);
+	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
 }
 
 void xe_exec_queue_destroy(struct kref *ref)
@@ -262,7 +281,11 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
 	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
 		return -EPERM;
 
-	return q->ops->set_priority(q, value);
+	if (!create)
+		return q->ops->set_priority(q, value);
+
+	q->sched_props.priority = value;
+	return 0;
 }
 
 static bool xe_exec_queue_enforce_schedule_limit(void)
@@ -329,7 +352,11 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_timeslice(q, value);
+	if (!create)
+		return q->ops->set_timeslice(q, value);
+
+	q->sched_props.timeslice_us = value;
+	return 0;
 }
 
 static int exec_queue_set_preemption_timeout(struct xe_device *xe,
@@ -345,7 +372,11 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_preempt_timeout(q, value);
+	if (!create)
+		return q->ops->set_preempt_timeout(q, value);
+
+	q->sched_props.preempt_timeout_us = value;
+	return 0;
 }
 
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
@@ -380,7 +411,9 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_job_timeout(q, value);
+	q->sched_props.job_timeout_ms = value;
+
+	return 0;
 }
 
 static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
@@ -655,6 +688,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_exec_queue *new;
+			u32 flags;
 
 			if (xe_gt_is_media_type(gt))
 				continue;
@@ -673,14 +707,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			/* The migration vm doesn't hold rpm ref */
 			xe_device_mem_access_get(xe);
 
+			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
+				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
+
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe,
-						   EXEC_QUEUE_FLAG_PERSISTENT |
-						   EXEC_QUEUE_FLAG_VM |
-						   (id ?
-						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
-						    0));
+						   args->width, hwe, flags,
+						   args->extensions);
 
 			xe_device_mem_access_put(xe); /* now held by engine */
 
@@ -728,7 +761,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		q = xe_exec_queue_create(xe, vm, logical_mask,
 					 args->width, hwe,
 					 xe_vm_in_lr_mode(vm) ? 0 :
-					 EXEC_QUEUE_FLAG_PERSISTENT);
+					 EXEC_QUEUE_FLAG_PERSISTENT,
+					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
 		if (IS_ERR(q))
@@ -744,12 +778,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	if (args->extensions) {
-		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
-		if (XE_IOCTL_DBG(xe, err))
-			goto kill_exec_queue;
-	}
-
 	q->persistent.xef = xef;
 
 	mutex_lock(&xef->exec_queue.lock);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index d959cc4a1a82..02ce8d204622 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -16,7 +16,8 @@ struct xe_file;
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
-					   struct xe_hw_engine *hw_engine, u32 flags);
+					   struct xe_hw_engine *hw_engine, u32 flags,
+					   u64 extensions);
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
 						 struct xe_vm *vm,
 						 enum xe_engine_class class, u32 flags);
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index a8a895cf4b44..5b84fc9ab8ad 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -356,7 +356,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	q = xe_exec_queue_create(xe, NULL,
 				 BIT(hwe->logical_instance), 1, hwe,
 				 EXEC_QUEUE_FLAG_KERNEL |
-				 EXEC_QUEUE_FLAG_PERMANENT);
+				 EXEC_QUEUE_FLAG_PERMANENT, 0);
 	if (IS_ERR(q)) {
 		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
 		err = PTR_ERR(q);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..0f2258dc4a00 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -235,7 +235,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 			return -ENOMEM;
 
 		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
-					 hwe, EXEC_QUEUE_FLAG_KERNEL);
+					 hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
 		if (IS_ERR(q)) {
 			err = PTR_ERR(q);
 			xe_gt_err(gt, "hwe %s: xe_exec_queue_create failed (%pe)\n",
@@ -252,7 +252,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		}
 
 		nop_q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance),
-					     1, hwe, EXEC_QUEUE_FLAG_KERNEL);
+					     1, hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
 		if (IS_ERR(nop_q)) {
 			err = PTR_ERR(nop_q);
 			xe_gt_err(gt, "hwe %s: nop xe_exec_queue_create failed (%pe)\n",
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 02fca8f9adc2..83fa92d2a35a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -345,7 +345,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
-					    EXEC_QUEUE_FLAG_HIGH_PRIORITY);
+					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
-- 
2.43.0

