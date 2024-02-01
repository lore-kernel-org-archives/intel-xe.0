Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D6CC47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 11:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012010EC19;
	Thu,  1 Feb 2024 11:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMP9E8hi";
	dkim-atps=neutral
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 11:41:34 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8360A10EC19
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706787695; x=1738323695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N1lFV/QOceKaCmAel4Z25miMekAD5330vQtsg0ZqISU=;
 b=eMP9E8himwJFqPJxLR1e0alIOl4Gx+bdz/GjOi6B/dQ/BFe9dR77O2OS
 qvQejsCd9NHtggS7GHkLZKUFO3yMW5OOp6aKQPaqKf5dNNRrMwDm5PCe4
 9mVoCw6U3ox/DaneRlgEzdb7R8a+SNXujNvpMr6Rx9k1udBxQm80XO5va
 vMZE+PFFFVPbdEMqV0A9pe+/DXGQWTwMqC3oYR8F1gdIzZ+6y70+24DJA
 kek7zHx+LJ8BqQyS/AwkEizVJSa0CNeGUWZNOZOnfXdlHsiR17F4UCeRk
 2p2rTzuSWSzK5ga0k26mZlz8JbLNmDF3jk8kvjxanfuoVJJDZFvZtVI9o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="72116"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="72116"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932158518"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932158518"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2024 03:34:23 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove persistent queue support
Date: Thu,  1 Feb 2024 17:16:01 +0530
Message-Id: <20240201114601.2431375-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

Multiqueue support will be added in near future which
needs removal of persistent queue feature as it can
work without queues being persistent.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           | 38 ------------------------
 drivers/gpu/drm/xe/xe_device.h           |  4 ---
 drivers/gpu/drm/xe/xe_device_types.h     |  8 -----
 drivers/gpu/drm/xe/xe_exec_queue.c       | 26 +---------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 -------
 drivers/gpu/drm/xe/xe_execlist.c         |  2 --
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 --
 7 files changed, 1 insertion(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5b84d7305520..d385b50637b0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -86,9 +86,6 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static void device_kill_persistent_exec_queues(struct xe_device *xe,
-					       struct xe_file *xef);
-
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -105,7 +102,6 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
-	device_kill_persistent_exec_queues(xe, xef);
 
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
@@ -258,9 +254,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			xa_erase(&xe->usm.asid_to_vm, asid);
 	}
 
-	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
-	INIT_LIST_HEAD(&xe->persistent_engines.list);
-
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
@@ -599,37 +592,6 @@ void xe_device_shutdown(struct xe_device *xe)
 {
 }
 
-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
-{
-	mutex_lock(&xe->persistent_engines.lock);
-	list_add_tail(&q->persistent.link, &xe->persistent_engines.list);
-	mutex_unlock(&xe->persistent_engines.lock);
-}
-
-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
-					     struct xe_exec_queue *q)
-{
-	mutex_lock(&xe->persistent_engines.lock);
-	if (!list_empty(&q->persistent.link))
-		list_del(&q->persistent.link);
-	mutex_unlock(&xe->persistent_engines.lock);
-}
-
-static void device_kill_persistent_exec_queues(struct xe_device *xe,
-					       struct xe_file *xef)
-{
-	struct xe_exec_queue *q, *next;
-
-	mutex_lock(&xe->persistent_engines.lock);
-	list_for_each_entry_safe(q, next, &xe->persistent_engines.list,
-				 persistent.link)
-		if (q->persistent.xef == xef) {
-			xe_exec_queue_kill(q);
-			list_del_init(&q->persistent.link);
-		}
-	mutex_unlock(&xe->persistent_engines.lock);
-}
-
 void xe_device_wmb(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 462f59e902b1..14be34d9f543 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -42,10 +42,6 @@ int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
-					     struct xe_exec_queue *q);
-
 void xe_device_wmb(struct xe_device *xe);
 
 static inline struct xe_file *to_xe_file(const struct drm_file *file)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d23..9785eef2e5a4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -348,14 +348,6 @@ struct xe_device {
 		struct mutex lock;
 	} usm;
 
-	/** @persistent_engines: engines that are closed but still running */
-	struct {
-		/** @persistent_engines.lock: protects persistent engines */
-		struct mutex lock;
-		/** @persistent_engines.list: list of persistent engines */
-		struct list_head list;
-	} persistent_engines;
-
 	/** @pinned: pinned BO state */
 	struct {
 		/** @pinned.lock: protected pinned BO list state */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c0b7434e78f1..07e18c165478 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -60,7 +60,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
-	INIT_LIST_HEAD(&q->persistent.link);
 	INIT_LIST_HEAD(&q->compute.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
 
@@ -379,23 +378,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	return 0;
 }
 
-static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
-		return -EINVAL;
-
-	if (value)
-		q->flags |= EXEC_QUEUE_FLAG_PERSISTENT;
-	else
-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
-
-	return 0;
-}
-
 static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value, bool create)
 {
@@ -469,7 +451,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
@@ -778,8 +759,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	q->persistent.xef = xef;
-
 	mutex_lock(&xef->exec_queue.lock);
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
@@ -922,10 +901,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
-		xe_exec_queue_kill(q);
-	else
-		xe_device_add_persistent_exec_queues(xe, q);
+	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 648391961fc4..a695f97ac0f3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -105,16 +105,6 @@ struct xe_exec_queue {
 		struct xe_guc_exec_queue *guc;
 	};
 
-	/**
-	 * @persistent: persistent exec queue state
-	 */
-	struct {
-		/** @persistent.xef: file which this exec queue belongs to */
-		struct xe_file *xef;
-		/** @persisiten.link: link in list of persistent exec queues */
-		struct list_head link;
-	} persistent;
-
 	union {
 		/**
 		 * @parallel: parallel submission state
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 58dfe6a78ffe..1788e78caf5c 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -378,8 +378,6 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
 		list_del(&exl->active_link);
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
-		xe_device_remove_persistent_exec_queues(xe, q);
 	drm_sched_entity_fini(&exl->entity);
 	drm_sched_fini(&exl->sched);
 	kfree(exl);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4744668ef60a..efee08680aea 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1031,8 +1031,6 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
-		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
-- 
2.25.1

