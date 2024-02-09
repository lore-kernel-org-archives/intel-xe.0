Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5EBC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 11:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9B010EDE1;
	Fri,  9 Feb 2024 11:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k51OvuxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E5C10EDE1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707478510; x=1739014510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N13Jx6bVejuFpfgCmXhqvs/Ey3uUizWpfbsItm3WExw=;
 b=k51OvuxWmRHnM6yo7rp9eH9sqEGebJw8nDn4K7Yus2ONEYkf9oSg1V6N
 tc9PbUItd3ilwlHsAN8KPWPpiHPqfzBh4wXsLEb9mV1U21L09u8JovTsE
 PRnQCRFaz6GlRsiABHY/v9oH4KwmWCeU33WzUS1oj7rw7M4HDKYr7KjC7
 xI87/Y64gsyfgJiJqtBNzA0pT7IlqrLG4GuGZDqniLoncxaBs9+8tLJ08
 YR/LjAsOj14ACYnfQ/8pCcF76qIUnEleqD/cQGs0KLad8ajF5ndv/varA
 +pfPPunDbNXdb4yyZqw1shawDWjAXqP4SvSHX4wG91X/FIp3WzgDXqQNS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1567666"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1567666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6571103"
Received: from janlundk-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.150])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:35:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3] drm/xe/uapi: Remove support for persistent exec_queues
Date: Fri,  9 Feb 2024 12:34:44 +0100
Message-ID: <20240209113444.8396-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Persistent exec_queues delays explicit destruction of exec_queues
until they are done executing, but destruction on process exit
is still immediate. It turns out no UMD is relying on this
functionality, so remove it. If there turns out to be a use-case
in the future, let's re-add.

Persistent exec_queues were never used for LR VMs

v2:
- Don't add an "UNUSED" define for the missing property
  (Lucas, Rodrigo)
v3:
- Remove the remaining struct xe_exec_queue::persistent state
  (Niranjana, Lucas)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           | 39 ------------------------
 drivers/gpu/drm/xe/xe_device.h           |  4 ---
 drivers/gpu/drm/xe/xe_device_types.h     |  8 -----
 drivers/gpu/drm/xe/xe_exec_queue.c       | 36 ++++------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ------
 drivers/gpu/drm/xe/xe_execlist.c         |  2 --
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 --
 include/uapi/drm/xe_drm.h                |  1 -
 8 files changed, 6 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5b84d7305520..1cf7561c8b4d 100644
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
@@ -105,8 +102,6 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
-	device_kill_persistent_exec_queues(xe, xef);
-
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
@@ -258,9 +253,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			xa_erase(&xe->usm.asid_to_vm, asid);
 	}
 
-	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
-	INIT_LIST_HEAD(&xe->persistent_engines.list);
-
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
@@ -599,37 +591,6 @@ void xe_device_shutdown(struct xe_device *xe)
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
index 2976635be4d3..c2bcb5735e7b 100644
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
@@ -496,6 +477,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
+	if (!exec_queue_set_property_funcs[idx])
+		return -EINVAL;
+
 	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
 }
 
@@ -707,8 +691,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			/* The migration vm doesn't hold rpm ref */
 			xe_device_mem_access_get(xe);
 
-			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
-				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
+			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
@@ -759,9 +742,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe,
-					 xe_vm_in_lr_mode(vm) ? 0 :
-					 EXEC_QUEUE_FLAG_PERSISTENT,
+					 args->width, hwe, 0,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..ee4673d5d1c1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1045,7 +1045,6 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-- 
2.43.0

