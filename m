Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6E0C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 12:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2C0113087;
	Tue, 30 Jan 2024 12:52:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ADC113087
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706619172; x=1738155172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqtJKoBwqcNNSzp3QzDqMlPkIbmafcCLGhQxxTD3fIE=;
 b=bA6ptecyJkVbsgow7hnMnoyluqd2CSlWjGaTKjlk596na5/n3HhvQk3Z
 17GQ4xnzJzmfmEgVlUyprDHt8Xs9xFw0IqC6wwvFdnhIQ8hFd81JVr2O5
 Oa/z5QXk2unyOzoF4t7JT53jyvoCOd01OsmjrqC9CNi0kDCSa+M9K36RW
 VOJB0yfs6s+LVZJLTbZ+4S+uHsUF7kr3aGE/m+cYR32rY73AbNsNKPTrg
 zmdchnMyBLVyMUfXk372/WV73exCRtWii/DCPOlp2Htwnwg2oF85nMKaf
 /U2/Ny08pUlNXc8GiopowOdIF3TzyQ1JL1OscdckVtK7ppqfbQHX3rrVG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16652024"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="16652024"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 04:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911436869"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="911436869"
Received: from skofoed-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 04:52:46 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
Date: Tue, 30 Jan 2024 13:52:20 +0100
Message-ID: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Persistent exec_queues delays explicit destruction of exec_queues
until they are done executing, but destruction on process exit
is still immediate. It turns out no UMD is relying on this
functionality, so remove it. If there turns out to be a use-case
in the future, let's re-add.

Persistent exec_queues were never used for LR VMs

Open: Should we renumber the exec_queue properties, or leave a hole
as in this patch.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 39 ----------------------------
 drivers/gpu/drm/xe/xe_device.h       |  4 ---
 drivers/gpu/drm/xe/xe_device_types.h |  8 ------
 drivers/gpu/drm/xe/xe_exec_queue.c   | 36 +++++--------------------
 drivers/gpu/drm/xe/xe_execlist.c     |  2 --
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 --
 include/uapi/drm/xe_drm.h            |  2 +-
 7 files changed, 7 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aa..d11cdc0b3cb5 100644
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
index 270124da1e00..b5236ca7fecc 100644
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
index c0b7434e78f1..4b7b41501c92 100644
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
index 2b008ec1b6de..bdbf23229b40 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1028,8 +1028,6 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
-		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..4124284e4cce 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1045,7 +1045,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define   DRM_XE_EXEC_QUEUE_SET_UNUSED_1		        3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-- 
2.43.0

