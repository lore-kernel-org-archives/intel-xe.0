Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B5C47074
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788210E23A;
	Tue,  2 Jan 2024 21:17:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C37210E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704230252; x=1735766252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2bfZuqv3uD3Y2DChXMABBRKU0vYgwC5dheVcVy1ScTg=;
 b=bf9uAWA3CLMs2r2wJiNZDivWCnnBW/XaNEU+LYdifsgbCN4R1VGog+0Q
 ZvCCBsf5jYxf6WJ2WO9Ir6WhUbyoGKlNT9lvMUumfEq13sQnxa5BI9iB1
 QuAp6K3bfxsGVgWinka25bhEccFPKbj0QWhlLhWdfywIhNkICNjL8PEuI
 vJYedigUKyQyEIsYRwxUrxGLb8yoTiXt4ajHnIWJOjUVN3Pvuf0wTvlit
 dANZNeoXR6B+LYUclEs5Ek/p13JOlbcsKz2GjCopA2Z5OLSBk21t+11ot
 aUwa1VFDSaJIgodLPDJs1Ig8VLrZ7IsLnzVnJRM8sLNCMlZ3YlykIMcMz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396654458"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396654458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898648800"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="898648800"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Finish refactoring of exec_queue_create
Date: Tue,  2 Jan 2024 13:17:31 -0800
Message-ID: <20240102211731.6720-5-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
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

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 74 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_exec_queue.h |  3 +-
 drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 +-
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 5 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9891cddba71c..8a2d51b994cf 100644
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
@@ -69,6 +71,21 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 				hwe->eclass->sched_props.job_timeout_ms;
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
@@ -124,12 +141,14 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 
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
 
@@ -174,7 +193,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 	if (!logical_mask)
 		return ERR_PTR(-ENODEV);
 
-	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags);
+	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
 }
 
 void xe_exec_queue_destroy(struct kref *ref)
@@ -258,7 +277,11 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
 	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
 		return -EPERM;
 
-	return q->ops->set_priority(q, value);
+	if (!create)
+		return q->ops->set_priority(q, value);
+	q->sched_props.priority = value;
+
+	return 0;
 }
 
 static bool xe_exec_queue_enforce_schedule_limit(void)
@@ -325,7 +348,11 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_timeslice(q, value);
+	if (!create)
+		return q->ops->set_timeslice(q, value);
+	q->sched_props.timeslice_us = value;
+
+	return 0;
 }
 
 static int exec_queue_set_preemption_timeout(struct xe_device *xe,
@@ -341,7 +368,11 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_preempt_timeout(q, value);
+	if (!create)
+		return q->ops->set_preempt_timeout(q, value);
+	q->sched_props.preempt_timeout_us = value;
+
+	return 0;
 }
 
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
@@ -376,7 +407,9 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
 	    !xe_hw_engine_timeout_in_range(value, min, max))
 		return -EINVAL;
 
-	return q->ops->set_job_timeout(q, value);
+	q->sched_props.job_timeout_ms = value;
+
+	return 0;
 }
 
 static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
@@ -651,6 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_exec_queue *new;
+			u32 flags;
 
 			if (xe_gt_is_media_type(gt))
 				continue;
@@ -669,14 +703,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
 
@@ -724,7 +757,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		q = xe_exec_queue_create(xe, vm, logical_mask,
 					 args->width, hwe,
 					 xe_vm_in_lr_mode(vm) ? 0 :
-					 EXEC_QUEUE_FLAG_PERSISTENT);
+					 EXEC_QUEUE_FLAG_PERSISTENT,
+					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
 		if (IS_ERR(q))
@@ -740,12 +774,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
index 6567abcb3c6d..e1615717486a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -344,7 +344,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
-					    EXEC_QUEUE_FLAG_PERMANENT);
+					    EXEC_QUEUE_FLAG_PERMANENT, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
-- 
2.43.0

