Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346AAC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 03:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FA10E09A;
	Wed,  5 Jun 2024 03:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFRXhFYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F25410E09A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 03:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717558841; x=1749094841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGgt6aaC0bbAZJYOTKmyewur76Qz+tMjiWmvJhDDD6o=;
 b=YFRXhFYVQLZn334ENdg/CxnGdXWkAP7R3LJ9MNEDpvSYSeYvselRh0hX
 h6swbCzpyeaCbycu+vTmtnbclcdLA04+N/dJc2/lAJzburzwEd8Y+GlQR
 uYMgHqdDmIvWutbNNj2LN/HScHXIix4brIJNzvA3Ef1V/3dteGft3szqf
 zgA46/sHcE9LigMekxl4aR2gy+cHEqmGjY0Q8mwlE8anP06V2+Lf8dpGp
 zuNox1cpwYJFoz/HRRhXRJy5646BpW9k4qFEDxXCPzIF+8xhXkQueqKF1
 y+LdIiWnQheiug5X40Gpz5TDh6BEYVPUetCQTMBAJl1m261dYW9CuGcu6 g==;
X-CSE-ConnectionGUID: mBEu/VAfRneD9oyh2KadTg==
X-CSE-MsgGUID: cfXAinp7RJ6i3YrLy4zEsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13984080"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="13984080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 20:40:40 -0700
X-CSE-ConnectionGUID: btFgRwC3TwWY/0k+joIGKg==
X-CSE-MsgGUID: T0ExGAM3RDumkfO1+/EkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="41877050"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 20:40:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [RFC PATCH] drm/xe: CPU binds
Date: Tue,  4 Jun 2024 20:41:08 -0700
Message-Id: <20240605034108.2027179-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Debug for isse #799, do not review.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/xe_bo.c               |    7 +-
 drivers/gpu/drm/xe/xe_bo.h               |    4 +-
 drivers/gpu/drm/xe/xe_device.c           |   35 +
 drivers/gpu/drm/xe/xe_device.h           |    2 +
 drivers/gpu/drm/xe/xe_device_types.h     |    4 +
 drivers/gpu/drm/xe/xe_exec.c             |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  112 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   20 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |   24 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  385 ++----
 drivers/gpu/drm/xe/xe_migrate.h          |   46 +-
 drivers/gpu/drm/xe/xe_pt.c               | 1359 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_pt.h               |   17 +-
 drivers/gpu/drm/xe/xe_pt_exec_queue.c    |  170 +++
 drivers/gpu/drm/xe/xe_pt_exec_queue.h    |   14 +
 drivers/gpu/drm/xe/xe_pt_types.h         |   67 ++
 drivers/gpu/drm/xe/xe_sched_job.c        |  104 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h  |   30 +-
 drivers/gpu/drm/xe/xe_trace.h            |   23 +-
 drivers/gpu/drm/xe/xe_vm.c               |  692 ++++-------
 drivers/gpu/drm/xe/xe_vm.h               |    4 +
 drivers/gpu/drm/xe/xe_vm_types.h         |   43 +-
 23 files changed, 1766 insertions(+), 1399 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a55d284386c5..a56dbecd8778 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -121,6 +121,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_exec_queue.o \
 	xe_pt_walk.o \
 	xe_query.o \
 	xe_range_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..0ec619e73d8f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2256,16 +2256,16 @@ void __xe_bo_release_dummy(struct kref *kref)
 
 /**
  * xe_bo_put_commit() - Put bos whose put was deferred by xe_bo_put_deferred().
+ * @xe: Xe device
  * @deferred: The lockless list used for the call to xe_bo_put_deferred().
  *
  * Puts all bos whose put was deferred by xe_bo_put_deferred().
  * The @deferred list can be either an onstack local list or a global
  * shared list used by a workqueue.
  */
-void xe_bo_put_commit(struct llist_head *deferred)
+void xe_bo_put_commit(struct xe_device *xe, struct llist_head *deferred)
 {
 	struct llist_node *freed;
-	struct xe_bo *bo, *next;
 
 	if (!deferred)
 		return;
@@ -2274,8 +2274,7 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
-		drm_gem_object_free(&bo->ttm.base.refcount);
+	xe_device_put_deferred(xe, freed);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..f40e9860a42b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,7 +10,6 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
-#include "xe_vm_types.h"
 #include "xe_vm.h"
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
@@ -282,10 +281,11 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	xe_vm_get(bo->vm);
 	return llist_add(&bo->freed, deferred);
 }
 
-void xe_bo_put_commit(struct llist_head *deferred);
+void xe_bo_put_commit(struct xe_device *xe, struct llist_head *deferred);
 
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0ff95a0ea5ea..6895d1b46fe0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -232,6 +232,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
+	flush_work(&xe->mem.deferred_work);
+	xe_assert(xe, !llist_del_all(&xe->mem.deferred));
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -241,6 +244,35 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred)
+{
+	struct xe_bo *bo, *next;
+
+	llist_for_each_entry_safe(bo, next, deferred, freed) {
+		init_llist_node(&bo->freed);
+		llist_add(&bo->freed, &xe->mem.deferred);
+	}
+	queue_work(system_wq, &xe->mem.deferred_work);
+}
+
+static void deferred_work(struct work_struct *w)
+{
+	struct xe_device *xe = container_of(w, struct xe_device,
+					    mem.deferred_work);
+	struct llist_node *freed = llist_del_all(&xe->mem.deferred);
+	struct xe_bo *bo, *next;
+
+	if (!freed)
+		return;
+
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+
+		drm_gem_object_free(&bo->ttm.base.refcount);
+		xe_vm_put(vm);
+	}
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -314,6 +346,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	init_llist_head(&xe->mem.deferred);
+	INIT_WORK(&xe->mem.deferred_work, deferred_work);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 3ed14072d8d1..c0c80705ba4a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -168,4 +168,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 
 void xe_device_declare_wedged(struct xe_device *xe);
 
+void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 52bc461171d5..5cb4b4d7c026 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -324,6 +324,10 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.deferred: deferred list to destroy PT entries */
+		struct llist_head deferred;
+		/** @mem.deferred_work: worker to destroy PT entries */
+		struct work_struct deferred_work;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 97eeb973e897..22960b1cc44a 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -134,7 +134,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_PT))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 27215075c799..e0bf01522a7e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -19,6 +19,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -50,6 +51,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	struct xe_gt *gt = hwe->gt;
 	int err;
 
+	xe_assert(xe, !(flags & EXEC_QUEUE_FLAG_PT));
+
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
 
@@ -60,6 +63,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	kref_init(&q->refcount);
 	q->flags = flags;
 	q->hwe = hwe;
+	q->xe = xe;
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
@@ -68,7 +72,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->compute.link);
-	INIT_LIST_HEAD(&q->multi_gt_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -183,15 +186,8 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
-	struct xe_exec_queue *eq, *next;
 
 	xe_exec_queue_last_fence_put_unlocked(q);
-	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
-		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
-					 multi_gt_link)
-			xe_exec_queue_put(eq);
-	}
-
 	q->ops->fini(q);
 }
 
@@ -437,35 +433,6 @@ find_hw_engine(struct xe_device *xe,
 			       eci.engine_instance, true);
 }
 
-static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-					struct drm_xe_engine_class_instance *eci,
-					u16 width, u16 num_placements)
-{
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 logical_mask = 0;
-
-	if (XE_IOCTL_DBG(xe, width != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, num_placements != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
-		return 0;
-
-	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
-
-	for_each_hw_engine(hwe, gt, id) {
-		if (xe_hw_engine_is_reserved(hwe))
-			continue;
-
-		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
-			logical_mask |= BIT(hwe->logical_instance);
-	}
-
-	return logical_mask;
-}
-
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -527,7 +494,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
-	struct xe_vm *vm, *migrate_vm;
+	struct xe_vm *vm;
 	struct xe_gt *gt;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
@@ -553,48 +520,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-		for_each_gt(gt, xe, id) {
-			struct xe_exec_queue *new;
-			u32 flags;
-
-			if (xe_gt_is_media_type(gt))
-				continue;
-
-			eci[0].gt_id = gt->info.id;
-			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
-								    args->width,
-								    args->num_placements);
-			if (XE_IOCTL_DBG(xe, !logical_mask))
-				return -EINVAL;
+		if (XE_IOCTL_DBG(xe, args->extensions))
+			return -EINVAL;
 
-			hwe = find_hw_engine(xe, eci[0]);
-			if (XE_IOCTL_DBG(xe, !hwe))
-				return -EINVAL;
-
-			/* The migration vm doesn't hold rpm ref */
-			xe_pm_runtime_get_noresume(xe);
-
-			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
-
-			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
-			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe, flags,
-						   args->extensions);
-
-			xe_pm_runtime_put(xe); /* now held by engine */
-
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(new)) {
-				err = PTR_ERR(new);
-				if (q)
-					goto put_exec_queue;
-				return err;
-			}
-			if (id == 0)
-				q = new;
-			else
-				list_add_tail(&new->multi_gt_list,
-					      &q->multi_gt_link);
+		q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			return err;
 		}
 	} else {
 		gt = xe_device_get_gt(xe, eci[0].gt_id);
@@ -697,8 +629,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
  */
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 {
-	return q->vm && xe_vm_in_lr_mode(q->vm) &&
-		!(q->flags & EXEC_QUEUE_FLAG_VM);
+	return q->vm && xe_vm_in_lr_mode(q->vm);
 }
 
 static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
@@ -736,6 +667,12 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
+	if (q->flags & EXEC_QUEUE_FLAG_PT) {
+		struct dma_fence *fence = q->last_fence ?: dma_fence_get_stub();
+
+		return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+	}
+
 	if (xe_exec_queue_is_parallel(q)) {
 		int i;
 
@@ -788,16 +725,9 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *eq = q, *next;
-
-	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
-				 multi_gt_link) {
-		q->ops->kill(eq);
-		xe_vm_remove_compute_exec_queue(q->vm, eq);
-	}
-
 	q->ops->kill(q);
-	xe_vm_remove_compute_exec_queue(q->vm, q);
+	if (q->vm)
+		xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -829,7 +759,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_PT)
 		lockdep_assert_held(&vm->lock);
 	else
 		xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 18d8b2a60928..ad461ddd0d76 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -19,6 +19,7 @@ struct xe_execlist_exec_queue;
 struct xe_gt;
 struct xe_guc_exec_queue;
 struct xe_hw_engine;
+struct xe_pt_exec_queue;
 struct xe_vm;
 
 enum xe_exec_queue_priority {
@@ -38,6 +39,8 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xe: Xe device */
+	struct xe_device *xe;
 	/** @gt: graphics tile this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
@@ -76,12 +79,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
 /* kernel engine only destroyed at driver unload */
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
-/* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(3)
-/* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
+/* for PT jobs. Caller needs to hold rpm ref when creating queue with this flag */
+#define EXEC_QUEUE_FLAG_PT			BIT(3)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -89,18 +90,13 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
-	union {
-		/** @multi_gt_list: list head for VM bind engines if multi-GT */
-		struct list_head multi_gt_list;
-		/** @multi_gt_link: link for VM bind engines if multi-GT */
-		struct list_head multi_gt_link;
-	};
-
 	union {
 		/** @execlist: execlist backend specific state for exec queue */
 		struct xe_execlist_exec_queue *execlist;
 		/** @guc: GuC backend specific state for exec queue */
 		struct xe_guc_exec_queue *guc;
+		/** @pt: PT backend specific state for exec queue */
+		struct xe_pt_exec_queue *pt;
 	};
 
 	/** @sched_props: scheduling properties */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 47aab04cf34f..16be614dbe47 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: MIT
+	// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2022 Intel Corporation
  */
@@ -17,6 +17,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -727,6 +728,11 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -736,6 +742,8 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
 
+	xe_assert(xe, !is_pt_job(job));
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
 
@@ -930,6 +938,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 	bool wedged;
 
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled.
@@ -945,8 +955,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		   q->guc->id, q->flags);
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
 		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
 
 	if (!exec_queue_killed(q))
 		xe_devcoredump(job);
@@ -962,8 +970,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
+	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -1448,11 +1455,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_stop(q);
 
 	/*
-	 * Ban any engine (aside from kernel and engines used for VM ops) with a
-	 * started but not complete job or if a job has gone through a GT reset
-	 * more than twice.
+	 * Ban any engine (aside from kernel) with a started but not complete
+	 * job or if a job has gone through a GT reset more than twice.
 	 */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		bool ban = false;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cccffaf3db06..c4d6d9a2a9ab 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -29,6 +29,7 @@
 #include "xe_map.h"
 #include "xe_mocs.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
@@ -41,6 +42,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -84,19 +87,23 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate engine of this tile.
- * TODO: Perhaps this function is slightly misplaced, and even unneeded?
+ * Returns the default migrate exec queue of this tile.
  *
- * Return: The default migrate engine
+ * Return: The default migrate exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 {
 	return tile->migrate->q;
 }
 
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile)
+{
+	return tile->migrate->bind_q;
+}
+
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_migrate *m = arg;
@@ -111,6 +118,8 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	if (m->bind_q)
+		xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -363,6 +372,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		m->bind_q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(m->bind_q)) {
+			xe_vm_close_and_put(vm);
+			return ERR_CAST(m->bind_q);
+		}
+
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
@@ -378,6 +393,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->q)) {
+		if (m->bind_q)
+			xe_exec_queue_put(m->bind_q);
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
@@ -1102,50 +1119,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	return fence;
 }
 
-static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
-			  const struct xe_vm_pgtable_update *update,
-			  struct xe_migrate_pt_update *pt_update)
-{
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	u32 chunk;
-	u32 ofs = update->ofs, size = update->qwords;
-
-	/*
-	 * If we have 512 entries (max), we would populate it ourselves,
-	 * and update the PDE above it to the new pointer.
-	 * The only time this can only happen if we have to update the top
-	 * PDE. This requires a BO that is almost vm->size big.
-	 *
-	 * This shouldn't be possible in practice.. might change when 16K
-	 * pages are used. Hence the assert.
-	 */
-	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
-	if (!ppgtt_ofs)
-		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
-						xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
-
-	do {
-		u64 addr = ppgtt_ofs + ofs * 8;
-
-		chunk = min(size, MAX_PTE_PER_SDI);
-
-		/* Ensure populatefn can do memset64 by aligning bb->cs */
-		if (!(bb->len & 1))
-			bb->cs[bb->len++] = MI_NOOP;
-
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
-		bb->cs[bb->len++] = lower_32_bits(addr);
-		bb->cs[bb->len++] = upper_32_bits(addr);
-		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
-			      update);
-
-		bb->len += chunk * 2;
-		ofs += chunk;
-		size -= chunk;
-	} while (size);
-}
-
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
 {
 	return xe_vm_get(m->q->vm);
@@ -1161,95 +1134,121 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
+void
+__xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				 const struct xe_migrate_pt_update_ops *ops,
+				 struct xe_vm_pgtable_update_op *pt_op,
+				 int num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
+			xe_tile_assert(tile, update);
+			xe_tile_assert(tile, update->pt_bo);
+			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
+
+			if (pt_op->bind)
+				ops->populate(tile, &update->pt_bo->vmap,
+					      update->ofs, update->qwords,
+					      update);
+			else
+				ops->clear(vm, tile, &update->pt_bo->vmap,
+					   update->ofs, update->qwords,
+					   update);
+		}
+	}
+
+	trace_xe_vm_cpu_bind(vm);
+	xe_device_wmb(vm->xe);
+}
+
 static struct dma_fence *
 xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
-			       struct xe_vm *vm, struct xe_bo *bo,
-			       const struct  xe_vm_pgtable_update *updates,
-			       u32 num_updates, bool wait_vm,
 			       struct xe_migrate_pt_update *pt_update)
 {
 	XE_TEST_DECLARE(struct migrate_test_params *test =
 			to_migrate_test_params
 			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct dma_fence *fence;
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
 
-	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
-					  DMA_RESV_USAGE_KERNEL))
-		return ERR_PTR(-ETIME);
-
-	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
-					       DMA_RESV_USAGE_BOOKKEEP))
-		return ERR_PTR(-ETIME);
-
 	if (ops->pre_commit) {
 		pt_update->job = NULL;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			return ERR_PTR(err);
 	}
-	for (i = 0; i < num_updates; i++) {
-		const struct xe_vm_pgtable_update *update = &updates[i];
-
-		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
-			      update->ofs, update->qwords, update);
-	}
 
-	if (vm) {
-		trace_xe_vm_cpu_bind(vm);
-		xe_device_wmb(vm->xe);
-	}
-
-	fence = dma_fence_get_stub();
+	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
+					 pt_update_ops->pt_job_ops->ops,
+					 pt_update_ops->num_ops);
 
-	return fence;
+	return dma_fence_get_stub();
 }
 
-static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
-			struct xe_sync_entry *syncs, u32 num_syncs)
+static struct dma_fence *
+__xe_migrate_update_pgtables(struct xe_migrate *m,
+			     struct xe_migrate_pt_update *pt_update,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
+	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
+	struct xe_tile *tile = m->tile;
+	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	int i;
-
-	for (i = 0; i < num_syncs; i++) {
-		fence = syncs[i].fence;
+	bool is_migrate = pt_update_ops->q == m->bind_q;
+	int err;
 
-		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				       &fence->flags))
-			return false;
+	job = xe_sched_job_create(pt_update_ops->q, NULL);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto err_out;
 	}
-	if (q) {
-		fence = xe_exec_queue_last_fence_get(q, vm);
-		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			dma_fence_put(fence);
-			return false;
-		}
-		dma_fence_put(fence);
+
+	if (ops->pre_commit) {
+		pt_update->job = job;
+		err = ops->pre_commit(pt_update);
+		if (err)
+			goto err_job;
 	}
+	if (is_migrate)
+		mutex_lock(&m->job_mutex);
+
+	set_bit(JOB_FLAG_PT, &job->fence->flags);
+	job->pt_update[0].vm = pt_update->vops->vm;
+	job->pt_update[0].tile = tile;
+	job->pt_update[0].ops = ops;
+	job->pt_update[0].pt_job_ops =
+		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
 
-	return true;
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	if (is_migrate)
+		mutex_unlock(&m->job_mutex);
+
+	return fence;
+
+err_job:
+	xe_sched_job_put(job);
+err_out:
+	return ERR_PTR(err);
 }
 
 /**
  * xe_migrate_update_pgtables() - Pipelined page-table update
  * @m: The migrate context.
- * @vm: The vm we'll be updating.
- * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
- * @q: The exec queue to be used for the update or NULL if the default
- * migration engine is to be used.
- * @updates: An array of update descriptors.
- * @num_updates: Number of descriptors in @updates.
- * @syncs: Array of xe_sync_entry to await before updating. Note that waits
- * will block the engine timeline.
- * @num_syncs: Number of entries in @syncs.
- * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
- * pointers to callback functions and, if subclassed, private arguments to
- * those.
+ * @pt_update: PT update arguments
  *
  * Perform a pipelined page-table update. The update descriptors are typically
  * built under the same lock critical section as a call to this function. If
@@ -1264,182 +1263,18 @@ static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
  */
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_vm *vm,
-			   struct xe_bo *bo,
-			   struct xe_exec_queue *q,
-			   const struct xe_vm_pgtable_update *updates,
-			   u32 num_updates,
-			   struct xe_sync_entry *syncs, u32 num_syncs,
 			   struct xe_migrate_pt_update *pt_update)
+
 {
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct xe_tile *tile = m->tile;
-	struct xe_gt *gt = tile->primary_gt;
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_sched_job *job;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	struct dma_fence *fence;
-	struct drm_suballoc *sa_bo = NULL;
-	struct xe_vma *vma = pt_update->vma;
-	struct xe_bb *bb;
-	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
-	u64 addr;
-	int err = 0;
-	bool usm = !q && xe->info.has_usm;
-	bool first_munmap_rebind = vma &&
-		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
-	struct xe_exec_queue *q_override = !q ? m->q : q;
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 
-	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
-		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
-							num_updates,
-							first_munmap_rebind,
-							pt_update);
-		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
-			return fence;
-	}
-
-	/* fixed + PTE entries */
-	if (IS_DGFX(xe))
-		batch_size = 2;
-	else
-		batch_size = 6 + num_updates * 2;
-
-	for (i = 0; i < num_updates; i++) {
-		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
-
-		/* align noop + MI_STORE_DATA_IMM cmd prefix */
-		batch_size += 4 * num_cmds + updates[i].qwords * 2;
-	}
-
-	/*
-	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
-	 *
-	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
-	 * Should be reasonably bound..
-	 */
-	xe_tile_assert(tile, batch_size < SZ_128K);
-
-	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
-	if (IS_ERR(bb))
-		return ERR_CAST(bb);
-
-	/* For sysmem PTE's, need to map them in our hole.. */
-	if (!IS_DGFX(xe)) {
-		ppgtt_ofs = NUM_KERNEL_PDE - 1;
-		if (q) {
-			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
-
-			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
-						 GFP_KERNEL, true, 0);
-			if (IS_ERR(sa_bo)) {
-				err = PTR_ERR(sa_bo);
-				goto err;
-			}
-
-			ppgtt_ofs = NUM_KERNEL_PDE +
-				(drm_suballoc_soffset(sa_bo) /
-				 NUM_VMUSA_UNIT_PER_PAGE);
-			page_ofs = (drm_suballoc_soffset(sa_bo) %
-				    NUM_VMUSA_UNIT_PER_PAGE) *
-				VM_SA_UPDATE_UNIT_SIZE;
-		}
-
-		/* Map our PT's to gtt */
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
-		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
-		bb->cs[bb->len++] = 0; /* upper_32_bits */
-
-		for (i = 0; i < num_updates; i++) {
-			struct xe_bo *pt_bo = updates[i].pt_bo;
-
-			xe_tile_assert(tile, pt_bo->size == SZ_4K);
-
-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
-			bb->cs[bb->len++] = lower_32_bits(addr);
-			bb->cs[bb->len++] = upper_32_bits(addr);
-		}
-
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
-			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
-				      &updates[i], pt_update);
-	} else {
-		/* phys pages, no preamble required */
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, 0, &updates[i], pt_update);
-	}
-
-	job = xe_bb_create_migration_job(q ?: m->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
-	if (IS_ERR(job)) {
-		err = PTR_ERR(job);
-		goto err_bb;
-	}
-
-	/* Wait on BO move */
-	if (bo) {
-		err = job_add_deps(job, bo->ttm.base.resv,
-				   DMA_RESV_USAGE_KERNEL);
-		if (err)
-			goto err_job;
-	}
-
-	/*
-	 * Munmap style VM unbind, need to wait for all jobs to be complete /
-	 * trigger preempts before moving forward
-	 */
-	if (first_munmap_rebind) {
-		err = job_add_deps(job, xe_vm_resv(vm),
-				   DMA_RESV_USAGE_BOOKKEEP);
-		if (err)
-			goto err_job;
-	}
-
-	err = xe_sched_job_last_fence_add_dep(job, vm);
-	for (i = 0; !err && i < num_syncs; i++)
-		err = xe_sync_entry_add_deps(&syncs[i], job);
-
-	if (err)
-		goto err_job;
+	fence =  xe_migrate_update_pgtables_cpu(m, pt_update);
+	if (!IS_ERR(fence))
+		return fence;
 
-	if (ops->pre_commit) {
-		pt_update->job = job;
-		err = ops->pre_commit(pt_update);
-		if (err)
-			goto err_job;
-	}
-	if (!q)
-		mutex_lock(&m->job_mutex);
-
-	xe_sched_job_arm(job);
-	fence = dma_fence_get(&job->drm.s_fence->finished);
-	xe_sched_job_push(job);
-
-	if (!q)
-		mutex_unlock(&m->job_mutex);
-
-	xe_bb_free(bb, fence);
-	drm_suballoc_free(sa_bo, fence);
-
-	return fence;
-
-err_job:
-	xe_sched_job_put(job);
-err_bb:
-	xe_bb_free(bb, NULL);
-err:
-	drm_suballoc_free(sa_bo, NULL);
-	return ERR_PTR(err);
+	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..61e5dbf903b7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -22,6 +22,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 /**
@@ -31,10 +32,8 @@ struct xe_vma;
 struct xe_migrate_pt_update_ops {
 	/**
 	 * @populate: Populate a command buffer or page-table with ptes.
-	 * @pt_update: Embeddable callback argument.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
-	 * @pos: If @map is NULL, map into the memory to be populated.
 	 * @ofs: qword offset into @map, unused if @map is NULL.
 	 * @num_qwords: Number of qwords to write.
 	 * @update: Information about the PTEs to be inserted.
@@ -43,10 +42,25 @@ struct xe_migrate_pt_update_ops {
 	 * page-table system to populate command buffers or shared
 	 * page-tables with PTEs.
 	 */
-	void (*populate)(struct xe_migrate_pt_update *pt_update,
-			 struct xe_tile *tile, struct iosys_map *map,
-			 void *pos, u32 ofs, u32 num_qwords,
+	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
+			 u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
+	/**
+	 * @clear: Clear a command buffer or page-table with ptes.
+	 * @vm: VM being updated
+	 * @tile: The tile for the current operation.
+	 * @map: struct iosys_map into the memory to be populated.
+	 * @ofs: qword offset into @map, unused if @map is NULL.
+	 * @num_qwords: Number of qwords to write.
+	 * @update: Information about the PTEs to be inserted.
+	 *
+	 * This interface is intended to be used as a callback into the
+	 * page-table system to populate command buffers or shared
+	 * page-tables with PTEs.
+	 */
+	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
+		      struct iosys_map *map, u32 ofs, u32 num_qwords,
+		      const struct xe_vm_pgtable_update *update);
 
 	/**
 	 * @pre_commit: Callback to be called just before arming the
@@ -67,14 +81,10 @@ struct xe_migrate_pt_update_ops {
 struct xe_migrate_pt_update {
 	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
 	const struct xe_migrate_pt_update_ops *ops;
-	/** @vma: The vma we're updating the pagetable for. */
-	struct xe_vma *vma;
+	/** @vops: VMA operations */
+	struct xe_vma_ops *vops;
 	/** @job: The job if a GPU page-table update. NULL otherwise */
 	struct xe_sched_job *job;
-	/** @start: Start of update for the range fence */
-	u64 start;
-	/** @last: Last of update for the range fence */
-	u64 last;
 	/** @tile_id: Tile ID of the update */
 	u8 tile_id;
 };
@@ -94,17 +104,17 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
+void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				      const struct xe_migrate_pt_update_ops *ops,
+				      struct xe_vm_pgtable_update_op *pt_op,
+				      int num_ops);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_vm *vm,
-			   struct xe_bo *bo,
-			   struct xe_exec_queue *q,
-			   const struct xe_vm_pgtable_update *updates,
-			   u32 num_updates,
-			   struct xe_sync_entry *syncs, u32 num_syncs,
 			   struct xe_migrate_pt_update *pt_update);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index cd60c009b679..60077f412da5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -9,12 +9,14 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
+#include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -325,6 +327,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_array(XE_PDES,
@@ -824,37 +827,42 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static void
-xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
-		       struct iosys_map *map, void *data,
+xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
 		       u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
 {
 	struct xe_pt_entry *ptes = update->pt_entries;
-	u64 *ptr = data;
 	u32 i;
 
-	for (i = 0; i < num_qwords; i++) {
-		if (map)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, ptes[i].pte);
-		else
-			ptr[i] = ptes[i].pte;
-	}
+	xe_assert(tile_to_xe(tile), map);
+	xe_assert(tile_to_xe(tile), !iosys_map_is_null(map));
+
+	for (i = 0; i < num_qwords; i++)
+		xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
+			  sizeof(u64), u64, ptes[i].pte);
 }
 
-static void xe_pt_abort_bind(struct xe_vma *vma,
-			     struct xe_vm_pgtable_update *entries,
-			     u32 num_entries)
+static void xe_pt_cancel_bind(struct xe_vma *vma,
+			      struct xe_vm_pgtable_update *entries,
+			      u32 num_entries)
 {
 	u32 i, j;
 
 	for (i = 0; i < num_entries; i++) {
-		if (!entries[i].pt_entries)
+		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt)
 			continue;
 
-		for (j = 0; j < entries[i].qwords; j++)
-			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
+		if (pt->level) {
+			for (j = 0; j < entries[i].qwords; j++)
+				xe_pt_destroy(entries[i].pt_entries[j].pt,
+					      xe_vma_vm(vma)->flags, NULL);
+		}
+
 		kfree(entries[i].pt_entries);
+		entries[i].pt_entries = NULL;
+		entries[i].qwords = 0;
 	}
 }
 
@@ -864,18 +872,15 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	lockdep_assert_held(&vm->lock);
 
-	if (xe_vma_is_userptr(vma))
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
-	else if (!xe_vma_is_null(vma))
+	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	xe_vm_assert_held(vm);
 }
 
-static void xe_pt_commit_bind(struct xe_vma *vma,
-			      struct xe_vm_pgtable_update *entries,
-			      u32 num_entries, bool rebind,
-			      struct llist_head *deferred)
+static void xe_pt_commit(struct xe_vma *vma,
+			 struct xe_vm_pgtable_update *entries,
+			 u32 num_entries, struct llist_head *deferred)
 {
 	u32 i, j;
 
@@ -883,31 +888,90 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 	for (i = 0; i < num_entries; i++) {
 		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt->level)
+			continue;
+
+		for (j = 0; j < entries[i].qwords; j++) {
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+		}
+	}
+}
+
+static void xe_pt_abort_bind(struct xe_vma *vma,
+			     struct xe_vm_pgtable_update *entries,
+			     u32 num_entries, bool rebind)
+{
+	int i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = num_entries - 1; i >= 0; --i) {
+		struct xe_pt *pt = entries[i].pt;
 		struct xe_pt_dir *pt_dir;
 
 		if (!rebind)
-			pt->num_live += entries[i].qwords;
+			pt->num_live -= entries[i].qwords;
 
-		if (!pt->level) {
-			kfree(entries[i].pt_entries);
+		if (!pt->level)
 			continue;
+
+		pt_dir = as_xe_pt_dir(pt);
+		for (j = 0; j < entries[i].qwords; j++) {
+			u32 j_ = j + entries[i].ofs;
+			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
+			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
 		}
+	}
+}
+
+static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
+				      struct xe_vm_pgtable_update *entries,
+				      u32 num_entries, bool rebind)
+{
+	u32 i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = 0; i < num_entries; i++) {
+		struct xe_pt *pt = entries[i].pt;
+		struct xe_pt_dir *pt_dir;
+
+		if (!rebind)
+			pt->num_live += entries[i].qwords;
+
+		if (!pt->level)
+			continue;
 
 		pt_dir = as_xe_pt_dir(pt);
 		for (j = 0; j < entries[i].qwords; j++) {
 			u32 j_ = j + entries[i].ofs;
 			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
+			struct xe_pt *oldpte = NULL;
 
 			if (xe_pt_entry(pt_dir, j_))
-				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
-					      xe_vma_vm(vma)->flags, deferred);
+				oldpte = xe_pt_entry(pt_dir, j_);
 
 			pt_dir->children[j_] = &newpte->base;
+			entries[i].pt_entries[j].pt = oldpte;
 		}
-		kfree(entries[i].pt_entries);
 	}
 }
 
+static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
+			    u32 num_entries)
+{
+	u32 i;
+
+	for (i = 0; i < num_entries; i++)
+		kfree(entries[i].pt_entries);
+}
+
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
@@ -918,20 +982,19 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
-	else /* abort! */
-		xe_pt_abort_bind(vma, entries, *num_entries);
 
 	return err;
 }
 
 static void xe_vm_dbg_print_entries(struct xe_device *xe,
 				    const struct xe_vm_pgtable_update *entries,
-				    unsigned int num_entries)
+				    unsigned int num_entries, bool bind)
 #if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
 {
 	unsigned int i;
 
-	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
+	vm_dbg(&xe->drm, "%s: %u entries to update\n", bind ? "bind" : "unbind",
+	       num_entries);
 	for (i = 0; i < num_entries; i++) {
 		const struct xe_vm_pgtable_update *entry = &entries[i];
 		struct xe_pt *xe_pt = entry->pt;
@@ -952,66 +1015,122 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 {}
 #endif
 
-#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
+			enum dma_resv_usage usage)
+{
+	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
+}
 
-static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 {
-	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
-	static u32 count;
+	int i;
 
-	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	for (i = 0; i < num_syncs; i++) {
+		struct dma_fence *fence = syncs[i].fence;
 
-		uvma->userptr.divisor = divisor << 1;
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&uvma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-		return true;
+		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				       &fence->flags))
+			return false;
 	}
 
-	return false;
+	return true;
 }
 
-#else
-
-static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+static int vma_add_deps(struct xe_vma *vma, struct xe_sched_job *job)
 {
-	return false;
+	struct xe_bo *bo = xe_vma_bo(vma);
+
+	xe_bo_assert_held(bo);
+
+	if (bo && !bo->vm) {
+		if (!job) {
+			if (!dma_resv_test_signaled(bo->ttm.base.resv,
+						    DMA_RESV_USAGE_KERNEL))
+				return -ETIME;
+		} else {
+			return job_add_deps(job, bo->ttm.base.resv,
+					    DMA_RESV_USAGE_KERNEL);
+		}
+	}
+
+	return 0;
 }
 
-#endif
+static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
+		       struct xe_sched_job *job)
+{
+	int err = 0;
 
-/**
- * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
- * @base: Base we derive from.
- * @bind: Whether this is a bind or an unbind operation. A bind operation
- *        makes the pre-commit callback error with -EAGAIN if it detects a
- *        pending invalidation.
- * @locked: Whether the pre-commit callback locked the userptr notifier lock
- *          and it needs unlocking.
- */
-struct xe_pt_migrate_pt_update {
-	struct xe_migrate_pt_update base;
-	bool bind;
-	bool locked;
-};
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		err = vma_add_deps(op->map.vma, job);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			err = vma_add_deps(op->remap.prev, job);
+		if (!err && op->remap.next)
+			err = vma_add_deps(op->remap.next, job);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
 
-/*
- * This function adds the needed dependencies to a page-table update job
- * to make sure racing jobs for separate bind engines don't race writing
- * to the same page-table range, wreaking havoc. Initially use a single
- * fence for the entire VM. An optimization would use smaller granularity.
- */
 static int xe_pt_vm_dependencies(struct xe_sched_job *job,
-				 struct xe_range_fence_tree *rftree,
-				 u64 start, u64 last)
+				 struct xe_vm *vm,
+				 struct xe_vma_ops *vops,
+				 struct xe_vm_pgtable_update_ops *pt_update_ops,
+				 struct xe_range_fence_tree *rftree)
 {
 	struct xe_range_fence *rtfence;
 	struct dma_fence *fence;
-	int err;
+	struct xe_vma_op *op;
+	int err = 0, i;
+
+	xe_vm_assert_held(vm);
+
+	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
+		return -ETIME;
+
+	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
+		return -ETIME;
+
+	if (pt_update_ops->wait_vm_bookkeep) {
+		if (!job) {
+			if (!dma_resv_test_signaled(xe_vm_resv(vm),
+						    DMA_RESV_USAGE_BOOKKEEP))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, xe_vm_resv(vm),
+					   DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				return err;
+		}
+	} else if (pt_update_ops->wait_vm_kernel) {
+		if (!job) {
+			if (!dma_resv_test_signaled(xe_vm_resv(vm),
+						    DMA_RESV_USAGE_KERNEL))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, xe_vm_resv(vm),
+					   DMA_RESV_USAGE_KERNEL);
+			if (err)
+				return err;
+		}
+	}
 
-	rtfence = xe_range_fence_tree_first(rftree, start, last);
+	rtfence = xe_range_fence_tree_first(rftree, pt_update_ops->start,
+					    pt_update_ops->last);
 	while (rtfence) {
 		fence = rtfence->fence;
 
@@ -1029,80 +1148,168 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 				return err;
 		}
 
-		rtfence = xe_range_fence_tree_next(rtfence, start, last);
+		rtfence = xe_range_fence_tree_next(rtfence,
+						   pt_update_ops->start,
+						   pt_update_ops->last);
 	}
 
-	return 0;
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_add_deps(vm, op, job);
+		if (err)
+			return err;
+	}
+
+	for (i = 0; job && !err && i < vops->num_syncs; i++)
+		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
+
+	return err;
 }
 
 static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
-	struct xe_range_fence_tree *rftree =
-		&xe_vma_vm(pt_update->vma)->rftree[pt_update->tile_id];
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vm *vm = vops->vm;
+	struct xe_range_fence_tree *rftree = &vm->rftree[pt_update->tile_id];
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[pt_update->tile_id];
+
+	return xe_pt_vm_dependencies(pt_update->job, vm, pt_update->vops,
+				     pt_update_ops, rftree);
+}
+
+#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+
+static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+{
+	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
+	static u32 count;
+
+	if (count++ % divisor == divisor - 1) {
+		uvma->userptr.divisor = divisor << 1;
+		return true;
+	}
 
-	return xe_pt_vm_dependencies(pt_update->job, rftree,
-				     pt_update->start, pt_update->last);
+	return false;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+#else
+
+static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
 {
-	struct xe_pt_migrate_pt_update *userptr_update =
-		container_of(pt_update, typeof(*userptr_update), base);
-	struct xe_userptr_vma *uvma = to_userptr_vma(pt_update->vma);
-	unsigned long notifier_seq = uvma->userptr.notifier_seq;
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-	int err = xe_pt_vm_dependencies(pt_update->job,
-					&vm->rftree[pt_update->tile_id],
-					pt_update->start,
-					pt_update->last);
+	return false;
+}
 
-	if (err)
-		return err;
+#endif
 
-	userptr_update->locked = false;
+static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
+			     struct xe_vm_pgtable_update_ops *pt_update)
+{
+	struct xe_userptr_vma *uvma;
+	unsigned long notifier_seq;
 
-	/*
-	 * Wait until nobody is running the invalidation notifier, and
-	 * since we're exiting the loop holding the notifier lock,
-	 * nobody can proceed invalidating either.
-	 *
-	 * Note that we don't update the vma->userptr.notifier_seq since
-	 * we don't update the userptr pages.
-	 */
-	do {
-		down_read(&vm->userptr.notifier_lock);
-		if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-					     notifier_seq))
-			break;
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-		up_read(&vm->userptr.notifier_lock);
+	if (!xe_vma_is_userptr(vma))
+		return 0;
 
-		if (userptr_update->bind)
-			return -EAGAIN;
+	uvma = to_userptr_vma(vma);
+	notifier_seq = uvma->userptr.notifier_seq;
 
-		notifier_seq = mmu_interval_read_begin(&uvma->userptr.notifier);
-	} while (true);
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;
 
-	/* Inject errors to test_whether they are handled correctly */
-	if (userptr_update->bind && xe_pt_userptr_inject_eagain(uvma)) {
-		up_read(&vm->userptr.notifier_lock);
+	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
+				     notifier_seq) &&
+	    !xe_pt_userptr_inject_eagain(uvma))
+		return 0;
+
+	if (xe_vm_in_fault_mode(vm)) {
 		return -EAGAIN;
-	}
+	} else {
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_move_tail(&uvma->userptr.invalidate_link,
+			       &vm->userptr.invalidated);
+		spin_unlock(&vm->userptr.invalidated_lock);
 
-	userptr_update->locked = true;
+		if (xe_vm_in_preempt_fence_mode(vm)) {
+			struct dma_resv_iter cursor;
+			struct dma_fence *fence;
+			long err;
+
+			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
+					    DMA_RESV_USAGE_BOOKKEEP);
+			dma_resv_for_each_fence_unlocked(&cursor, fence)
+				dma_fence_enable_sw_signaling(fence);
+			dma_resv_iter_end(&cursor);
+
+			err = dma_resv_wait_timeout(xe_vm_resv(vm),
+						    DMA_RESV_USAGE_BOOKKEEP,
+						    false, MAX_SCHEDULE_TIMEOUT);
+			XE_WARN_ON(err <= 0);
+		}
+	}
 
 	return 0;
 }
 
-static const struct xe_migrate_pt_update_ops bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_pre_commit,
-};
+static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+			    struct xe_vm_pgtable_update_ops *pt_update)
+{
+	int err = 0;
 
-static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		err = vma_check_userptr(vm, op->map.vma, pt_update);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			err = vma_check_userptr(vm, op->remap.prev, pt_update);
+		if (!err && op->remap.next)
+			err = vma_check_userptr(vm, op->remap.next, pt_update);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
+					pt_update);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[pt_update->tile_id];
+	struct xe_vma_op *op;
+	int err;
+
+	err = xe_pt_pre_commit(pt_update);
+	if (err)
+		return err;
+
+	down_read(&vm->userptr.notifier_lock);
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_check_userptr(vm, op, pt_update_ops);
+		if (err) {
+			up_read(&vm->userptr.notifier_lock);
+			break;
+		}
+	}
+
+	return err;
+}
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
@@ -1198,190 +1405,6 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	return ret && ret != -ENOENT ? ret : 0;
 }
 
-static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
-				       struct xe_pt_migrate_pt_update *update,
-				       struct xe_vm_pgtable_update *entries,
-				       u32 num_entries)
-{
-	int i, level = 0;
-
-	for (i = 0; i < num_entries; i++) {
-		const struct xe_vm_pgtable_update *entry = &entries[i];
-
-		if (entry->pt->level > level)
-			level = entry->pt->level;
-	}
-
-	/* Greedy (non-optimal) calculation but simple */
-	update->base.start = ALIGN_DOWN(xe_vma_start(vma),
-					0x1ull << xe_pt_shift(level));
-	update->base.last = ALIGN(xe_vma_end(vma),
-				  0x1ull << xe_pt_shift(level)) - 1;
-}
-
-/**
- * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
- * address range.
- * @tile: The tile to bind for.
- * @vma: The vma to bind.
- * @q: The exec_queue with which to do pipelined page-table updates.
- * @syncs: Entries to sync on before binding the built tree to the live vm tree.
- * @num_syncs: Number of @sync entries.
- * @rebind: Whether we're rebinding this vma to the same address range without
- * an unbind in-between.
- *
- * This function builds a page-table tree (see xe_pt_stage_bind() for more
- * information on page-table building), and the xe_vm_pgtable_update entries
- * abstracting the operations needed to attach it to the main vm tree. It
- * then takes the relevant locks and updates the metadata side of the main
- * vm tree and submits the operations for pipelined attachment of the
- * gpu page-table to the vm main tree, (which can be done either by the
- * cpu and the GPU).
- *
- * Return: A valid dma-fence representing the pipelined attachment operation
- * on success, an error pointer on error.
- */
-struct dma_fence *
-__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool rebind)
-{
-	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
-	struct xe_pt_migrate_pt_update bind_pt_update = {
-		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
-			.vma = vma,
-			.tile_id = tile->id,
-		},
-		.bind = true,
-	};
-	struct xe_vm *vm = xe_vma_vm(vma);
-	u32 num_entries;
-	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL;
-	struct xe_range_fence *rfence;
-	int err;
-
-	bind_pt_update.locked = false;
-	xe_bo_assert_held(xe_vma_bo(vma));
-	xe_vm_assert_held(vm);
-
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma), q);
-
-	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
-	if (err)
-		goto err;
-
-	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
-	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
-	if (err)
-		goto err;
-
-	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
-	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
-				   num_entries);
-
-	/*
-	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
-	 * cached PTEs point to freed memory. on LR vms this is done
-	 * automatically when the context is re-enabled by the rebind worker,
-	 * or in fault mode it was invalidated on PTE zapping.
-	 *
-	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
-	 * PTE is already cached in the TLB so it needs to be invalidated.
-	 * on !LR VMs this is done in the ring ops preceding a batch, but on
-	 * non-faulting LR, in particular on user-space batch buffer chaining,
-	 * it needs to be done here.
-	 */
-	if ((!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
-		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-		if (!ifence)
-			return ERR_PTR(-ENOMEM);
-	} else if (rebind && !xe_vm_in_lr_mode(vm)) {
-		/* We bump also if batch_invalidate_tlb is true */
-		vm->tlb_flush_seqno++;
-	}
-
-	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
-	if (!rfence) {
-		kfree(ifence);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, xe_vma_bo(vma), q,
-					   entries, num_entries,
-					   syncs, num_syncs,
-					   &bind_pt_update.base);
-	if (!IS_ERR(fence)) {
-		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
-		LLIST_HEAD(deferred);
-		int err;
-
-		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
-					    &xe_range_fence_kfree_ops,
-					    bind_pt_update.base.start,
-					    bind_pt_update.base.last, fence);
-		if (err)
-			dma_fence_wait(fence, false);
-
-		/* TLB invalidation must be done before signaling rebind */
-		if (ifence) {
-			int err = invalidation_fence_init(tile->primary_gt,
-							  ifence, fence,
-							  xe_vma_start(vma),
-							  xe_vma_end(vma),
-							  xe_vma_vm(vma)->usm.asid);
-			if (err) {
-				dma_fence_put(fence);
-				kfree(ifence);
-				return ERR_PTR(err);
-			}
-			fence = &ifence->base.base;
-		}
-
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence, rebind ||
-				   last_munmap_rebind ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-					   DMA_RESV_USAGE_BOOKKEEP);
-		xe_pt_commit_bind(vma, entries, num_entries, rebind,
-				  bind_pt_update.locked ? &deferred : NULL);
-
-		/* This vma is live (again?) now */
-		vma->tile_present |= BIT(tile->id);
-
-		if (bind_pt_update.locked) {
-			to_userptr_vma(vma)->userptr.initial_bind = true;
-			up_read(&vm->userptr.notifier_lock);
-			xe_bo_put_commit(&deferred);
-		}
-		if (!rebind && last_munmap_rebind &&
-		    xe_vm_in_preempt_fence_mode(vm))
-			xe_vm_queue_rebind_worker(vm);
-	} else {
-		kfree(rfence);
-		kfree(ifence);
-		if (bind_pt_update.locked)
-			up_read(&vm->userptr.notifier_lock);
-		xe_pt_abort_bind(vma, entries, num_entries);
-	}
-
-	return fence;
-
-err:
-	return ERR_PTR(err);
-}
-
 struct xe_pt_stage_unbind_walk {
 	/** @base: The pagewalk base-class. */
 	struct xe_pt_walk base;
@@ -1479,7 +1502,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				     &end_offset))
 		return 0;
 
-	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
+	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
 	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
 
 	return 0;
@@ -1527,201 +1550,647 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 }
 
 static void
-xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
-				  struct xe_tile *tile, struct iosys_map *map,
-				  void *ptr, u32 qword_ofs, u32 num_qwords,
+xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
+				  struct iosys_map *map, u32 qword_ofs,
+				  u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
-	if (map && map->is_iomem)
+	xe_assert(vm->xe, map);
+	xe_assert(vm->xe, !iosys_map_is_null(map));
+
+	if (map->is_iomem)
 		for (i = 0; i < num_qwords; ++i)
 			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
 				  sizeof(u64), u64, empty);
-	else if (map)
+	else
 		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
 			 num_qwords);
-	else
-		memset64(ptr, empty, num_qwords);
+}
+
+static void xe_pt_abort_unbind(struct xe_vma *vma,
+			       struct xe_vm_pgtable_update *entries,
+			       u32 num_entries)
+{
+	int j, i;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (j = num_entries - 1; j >= 0; --j) {
+		struct xe_vm_pgtable_update *entry = &entries[j];
+		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
+
+		pt->num_live += entry->qwords;
+
+		if (!pt->level)
+			continue;
+
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++)
+			pt_dir->children[i] =
+				entries[j].pt_entries[i - entry->ofs].pt ?
+				&entries[j].pt_entries[i - entry->ofs].pt->base : 0;
+	}
 }
 
 static void
-xe_pt_commit_unbind(struct xe_vma *vma,
-		    struct xe_vm_pgtable_update *entries, u32 num_entries,
-		    struct llist_head *deferred)
+xe_pt_commit_prepare_unbind(struct xe_vma *vma,
+			    struct xe_vm_pgtable_update *entries,
+			    u32 num_entries)
 {
-	u32 j;
+	int j, i;
 
 	xe_pt_commit_locks_assert(vma);
 
 	for (j = 0; j < num_entries; ++j) {
 		struct xe_vm_pgtable_update *entry = &entries[j];
 		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir;
 
 		pt->num_live -= entry->qwords;
-		if (pt->level) {
-			struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
-			u32 i;
+		if (!pt->level)
+			continue;
 
-			for (i = entry->ofs; i < entry->ofs + entry->qwords;
-			     i++) {
-				if (xe_pt_entry(pt_dir, i))
-					xe_pt_destroy(xe_pt_entry(pt_dir, i),
-						      xe_vma_vm(vma)->flags, deferred);
+		pt_dir = as_xe_pt_dir(pt);
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++) {
+			if (xe_pt_entry(pt_dir, i))
+				entries[j].pt_entries[i - entry->ofs].pt =
+					xe_pt_entry(pt_dir, i);
+			else
+				entries[j].pt_entries[i - entry->ofs].pt = NULL;
+			pt_dir->children[i] = NULL;
+		}
+	}
+}
 
-				pt_dir->children[i] = NULL;
-			}
+static struct xe_vm_pgtable_update_op *
+to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 current_op)
+{
+	return &pt_update_ops->pt_job_ops->ops[current_op];
+}
+
+static void
+xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
+				 struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
+	int i, level = 0;
+	u64 start, last;
+
+	for (i = 0; i < pt_op->num_entries; i++) {
+		const struct xe_vm_pgtable_update *entry = &pt_op->entries[i];
+
+		if (entry->pt->level > level)
+			level = entry->pt->level;
+	}
+
+	/* Greedy (non-optimal) calculation but simple */
+	start = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
+	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+
+	if (start < pt_update_ops->start)
+		pt_update_ops->start = start;
+	if (last > pt_update_ops->last)
+		pt_update_ops->last = last;
+}
+
+static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
+					       xe->info.tile_count);
+
+	return 0;
+}
+
+static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
+			   struct xe_vm_pgtable_update_ops *pt_update_ops,
+			   struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
+	int err;
+
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing bind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+
+	pt_op->vma = NULL;
+	pt_op->bind = true;
+	pt_op->rebind = BIT(tile->id) & vma->tile_present;
+
+	err = vma_reserve_fences(tile_to_xe(tile), vma);
+	if (err)
+		return err;
+
+	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+				 &pt_op->num_entries);
+	if (!err) {
+		xe_tile_assert(tile, pt_op->num_entries <=
+			       ARRAY_SIZE(pt_op->entries));
+		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+					pt_op->num_entries, true);
+
+		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+		++pt_update_ops->pt_job_ops->current_op;
+		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+
+		/*
+		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
+		 * cached PTEs point to freed memory. on LR vms this is done
+		 * automatically when the context is re-enabled by the rebind worker,
+		 * or in fault mode it was invalidated on PTE zapping.
+		 *
+		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
+		 * PTE is already cached in the TLB so it needs to be invalidated.
+		 * on !LR VMs this is done in the ring ops preceding a batch, but on
+		 * non-faulting LR, in particular on user-space batch buffer chaining,
+		 * it needs to be done here.
+		 */
+		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
+		     xe_vm_in_preempt_fence_mode(vm)))
+			pt_update_ops->needs_invalidation = true;
+		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
+			/* We bump also if batch_invalidate_tlb is true */
+			vm->tlb_flush_seqno++;
+
+		vma->tile_staged |= BIT(tile->id);
+		pt_op->vma = vma;
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
+	}
+
+	return err;
+}
+
+static int unbind_op_prepare(struct xe_tile *tile,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops,
+			     struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
+	int err;
+
+	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
+		return 0;
+
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing unbind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+
+	/*
+	 * Wait for invalidation to complete. Can corrupt internal page table
+	 * state if an invalidation is running while preparing an unbind.
+	 */
+	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
+		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
+
+	pt_op->vma = vma;
+	pt_op->bind = false;
+	pt_op->rebind = false;
+
+	err = vma_reserve_fences(tile_to_xe(tile), vma);
+	if (err)
+		return err;
+
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
+
+	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+				pt_op->num_entries, false);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	++pt_update_ops->pt_job_ops->current_op;
+	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_invalidation = true;
+
+	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
+
+	return 0;
+}
+
+static int op_prepare(struct xe_vm *vm,
+		      struct xe_tile *tile,
+		      struct xe_vm_pgtable_update_ops *pt_update_ops,
+		      struct xe_vma_op *op)
+{
+	int err = 0;
+
+	xe_vm_assert_held(vm);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
+		pt_update_ops->wait_vm_kernel = true;
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		err = unbind_op_prepare(tile, pt_update_ops,
+					gpuva_to_vma(op->base.remap.unmap->va));
+
+		if (!err && op->remap.prev) {
+			err = bind_op_prepare(vm, tile, pt_update_ops,
+					      op->remap.prev);
+			pt_update_ops->wait_vm_bookkeep = true;
 		}
+		if (!err && op->remap.next) {
+			err = bind_op_prepare(vm, tile, pt_update_ops,
+					      op->remap.next);
+			pt_update_ops->wait_vm_bookkeep = true;
+		}
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		err = unbind_op_prepare(tile, pt_update_ops,
+					gpuva_to_vma(op->base.unmap.va));
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = bind_op_prepare(vm, tile, pt_update_ops,
+				      gpuva_to_vma(op->base.prefetch.va));
+		pt_update_ops->wait_vm_kernel = true;
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
+
+	return err;
+}
+
+static void
+xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
+{
+	pt_update_ops->start = ~0x0ull;
+	pt_update_ops->last = 0x0ull;
 }
 
-static const struct xe_migrate_pt_update_ops unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
+/**
+ * xe_pt_update_ops_prepare() - Prepare PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
+ *
+ * Prepare PT update operations which includes updating internal PT state,
+ * allocate memory for page tables, populate page table being pruned in, and
+ * create PT update operations for leaf insertion / removal.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	struct xe_vma_op *op;
+	int err;
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	xe_pt_update_ops_init(pt_update_ops);
+
+	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
+				      tile_to_xe(tile)->info.tile_count);
+	if (err)
+		return err;
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_prepare(vops->vm, tile, pt_update_ops, op);
+
+		if (err)
+			return err;
+	}
+
+	xe_tile_assert(tile, pt_update_ops->pt_job_ops->current_op <=
+		       pt_update_ops->num_ops);
+
+	return 0;
+}
+
+static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			   struct xe_vm_pgtable_update_ops *pt_update_ops,
+			   struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present |= BIT(tile->id);
+	vma->tile_staged &= ~BIT(tile->id);
+	if (xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		to_userptr_vma(vma)->userptr.initial_bind = true;
+	}
+
+	/*
+	 * Kick rebind worker if this bind triggers preempt fences and not in
+	 * the rebind worker
+	 */
+	if (pt_update_ops->wait_vm_bookkeep &&
+	    xe_vm_in_preempt_fence_mode(vm) &&
+	    !current->mm)
+		xe_vm_queue_rebind_worker(vm);
+}
+
+static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops,
+			     struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present &= ~BIT(tile->id);
+	if (!vma->tile_present) {
+		list_del_init(&vma->combined_links.rebind);
+		if (xe_vma_is_userptr(vma)) {
+			lockdep_assert_held_read(&vm->userptr.notifier_lock);
+
+			spin_lock(&vm->userptr.invalidated_lock);
+			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
+			spin_unlock(&vm->userptr.invalidated_lock);
+		}
+	}
+}
+
+static void op_commit(struct xe_vm *vm,
+		      struct xe_tile *tile,
+		      struct xe_vm_pgtable_update_ops *pt_update_ops,
+		      struct xe_vma_op *op, struct dma_fence *fence)
+{
+	xe_vm_assert_held(vm);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		unbind_op_commit(vm, tile, pt_update_ops,
+				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+
+		if (op->remap.prev)
+			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
+				       fence);
+		if (op->remap.next)
+			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
+				       fence);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		unbind_op_commit(vm, tile, pt_update_ops,
+				 gpuva_to_vma(op->base.unmap.va), fence);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		bind_op_commit(vm, tile, pt_update_ops,
+			       gpuva_to_vma(op->base.prefetch.va), fence);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+}
+
+static const struct xe_migrate_pt_update_ops migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_pre_commit,
 };
 
-static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
+static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
 /**
- * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
- * address range.
- * @tile: The tile to unbind for.
- * @vma: The vma to unbind.
- * @q: The exec_queue with which to do pipelined page-table updates.
- * @syncs: Entries to sync on before disconnecting the tree to be destroyed.
- * @num_syncs: Number of @sync entries.
- *
- * This function builds a the xe_vm_pgtable_update entries abstracting the
- * operations needed to detach the page-table tree to be destroyed from the
- * man vm tree.
- * It then takes the relevant locks and submits the operations for
- * pipelined detachment of the gpu page-table from  the vm main tree,
- * (which can be done either by the cpu and the GPU), Finally it frees the
- * detached page-table tree.
+ * xe_pt_update_ops_run() - Run PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
  *
- * Return: A valid dma-fence representing the pipelined detachment operation
- * on success, an error pointer on error.
+ * Run PT update operations which includes committing internal PT state changes,
+ * creating job for PT update operations for leaf insertion / removal, and
+ * installing job fence in various places.
+  *
+ * Return: fence on success, negative ERR_PTR on error.
  */
 struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs)
+xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
-	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
-	struct xe_pt_migrate_pt_update unbind_pt_update = {
-		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_unbind_ops :
-			&unbind_ops,
-			.vma = vma,
-			.tile_id = tile->id,
-		},
-	};
-	struct xe_vm *vm = xe_vma_vm(vma);
-	u32 num_entries;
-	struct dma_fence *fence = NULL;
-	struct invalidation_fence *ifence;
+	struct xe_vm *vm = vops->vm;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	struct dma_fence *fence;
+	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
-	int err;
-
-	LLIST_HEAD(deferred);
+	struct xe_vma_op *op;
+	int err = 0, i;
+	struct xe_migrate_pt_update update = {
+		.ops = pt_update_ops->needs_userptr_lock ?
+			&userptr_migrate_ops :
+			&migrate_ops,
+		.vops = vops,
+		.tile_id = tile->id
+	};
 
-	xe_bo_assert_held(xe_vma_bo(vma));
+	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma), q);
-
-	num_entries = xe_pt_stage_unbind(tile, vma, entries);
-	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
-	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
-				   num_entries);
+	if (!pt_update_ops->pt_job_ops->current_op) {
+		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
-	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
-	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
-	if (err)
-		return ERR_PTR(err);
+		return dma_fence_get_stub();
+	}
 
-	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-	if (!ifence)
-		return ERR_PTR(-ENOMEM);
+	if (pt_update_ops->needs_invalidation) {
+		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+		if (!ifence) {
+			err = -ENOMEM;
+			goto kill_vm_tile1;
+		}
+	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
 	if (!rfence) {
-		kfree(ifence);
-		return ERR_PTR(-ENOMEM);
+		err = -ENOMEM;
+		goto free_ifence;
+	}
+
+	fence = xe_migrate_update_pgtables(tile->migrate, &update);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto free_rfence;
 	}
 
 	/*
-	 * Even if we were already evicted and unbind to destroy, we need to
-	 * clear again here. The eviction may have updated pagetables at a
-	 * lower level, because it needs to be more conservative.
+	 * Point of no return - VM killed if failure after this
 	 */
-	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, NULL, q ? q :
-					   vm->q[tile->id],
-					   entries, num_entries,
-					   syncs, num_syncs,
-					   &unbind_pt_update.base);
-	if (!IS_ERR(fence)) {
-		int err;
-
-		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
-					    &xe_range_fence_kfree_ops,
-					    unbind_pt_update.base.start,
-					    unbind_pt_update.base.last, fence);
-		if (err)
-			dma_fence_wait(fence, false);
+	for (i = 0; i < pt_update_ops->pt_job_ops->current_op; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
+
+		xe_pt_commit(pt_op->vma, pt_op->entries,
+			     pt_op->num_entries,
+			     &pt_update_ops->pt_job_ops->deferred);
+		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+	}
+
+	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+				    &xe_range_fence_kfree_ops,
+				    pt_update_ops->start,
+				    pt_update_ops->last, fence);
+	if (err)
+		dma_fence_wait(fence, false);
 
-		/* TLB invalidation must be done before signaling unbind */
+	/* tlb invalidation must be done before signaling rebind */
+	if (ifence) {
 		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
-					      xe_vma_start(vma),
-					      xe_vma_end(vma),
-					      xe_vma_vm(vma)->usm.asid);
-		if (err) {
-			dma_fence_put(fence);
-			kfree(ifence);
-			return ERR_PTR(err);
-		}
+					      pt_update_ops->start,
+					      pt_update_ops->last,
+					      vm->usm.asid);
+		if (err)
+			goto put_fence;
 		fence = &ifence->base.base;
+	}
 
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence,
-				   DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_add_fence(xe_vm_resv(vm), fence,
+			   pt_update_ops->wait_vm_bookkeep ?
+			   DMA_RESV_USAGE_KERNEL :
+			   DMA_RESV_USAGE_BOOKKEEP);
 
-		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-					   DMA_RESV_USAGE_BOOKKEEP);
-		xe_pt_commit_unbind(vma, entries, num_entries,
-				    unbind_pt_update.locked ? &deferred : NULL);
-		vma->tile_present &= ~BIT(tile->id);
-	} else {
-		kfree(rfence);
-		kfree(ifence);
-	}
+	list_for_each_entry(op, &vops->list, link)
+		op_commit(vops->vm, tile, pt_update_ops, op, fence);
 
-	if (!vma->tile_present)
-		list_del_init(&vma->combined_links.rebind);
+	if (pt_update_ops->needs_userptr_lock)
+		up_read(&vm->userptr.notifier_lock);
 
-	if (unbind_pt_update.locked) {
-		xe_tile_assert(tile, xe_vma_is_userptr(vma));
+	return fence;
 
-		if (!vma->tile_present) {
-			spin_lock(&vm->userptr.invalidated_lock);
-			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
-			spin_unlock(&vm->userptr.invalidated_lock);
-		}
+put_fence:
+	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
-		xe_bo_put_commit(&deferred);
+	dma_fence_put(fence);
+	if (!tile->id)
+		xe_vm_kill(vops->vm, false);
+free_rfence:
+	kfree(rfence);
+free_ifence:
+	kfree(ifence);
+kill_vm_tile1:
+	if (err != -EAGAIN && tile->id)
+		xe_vm_kill(vops->vm, false);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_pt_update_ops_free() - Free PT update operations
+ * @pt_op: Array of PT update operations
+ * @num_ops: Number of PT update operations
+ *
+ * Free PT update operations
+ */
+static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
+				  u32 num_ops)
+{
+	u32 i;
+
+	for (i = 0; i < num_ops; ++i, ++pt_op)
+		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+}
+
+/**
+ * xe_pt_update_ops_abort() - Abort PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
+ *
+ *  Abort PT update operations by unwinding internal PT state
+ */
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	int i;
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
+
+		if (!pt_op->vma || i >= pt_update_ops->pt_job_ops->current_op)
+			continue;
+
+		if (pt_op->bind)
+			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
+					 pt_op->num_entries,
+					 pt_op->rebind);
+		else
+			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
+					   pt_op->num_entries);
 	}
+}
 
-	return fence;
+struct xe_pt_job_ops *xe_pt_job_ops_alloc(struct xe_device *xe, u32 num_ops)
+{
+	struct xe_pt_job_ops *pt_job_ops;
+
+	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);
+	if (!pt_job_ops)
+		return NULL;
+
+	pt_job_ops->ops = kvmalloc_array(num_ops, sizeof(*pt_job_ops->ops),
+					 GFP_KERNEL);
+	if (!pt_job_ops->ops) {
+		kvfree(pt_job_ops);
+		return NULL;
+	}
+
+	pt_job_ops->current_op = 0;
+	pt_job_ops->xe = xe;
+	kref_init(&pt_job_ops->refcount);
+	init_llist_head(&pt_job_ops->deferred);
+
+	return pt_job_ops;
+}
+
+struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops)
+{
+	if (pt_job_ops)
+		kref_get(&pt_job_ops->refcount);
+
+	return pt_job_ops;
+}
+
+static void xe_pt_job_ops_destroy(struct kref *ref)
+{
+	struct xe_pt_job_ops *pt_job_ops =
+		container_of(ref, struct xe_pt_job_ops, refcount);
+
+	xe_pt_update_ops_free(pt_job_ops->ops,
+			      pt_job_ops->current_op);
+	xe_bo_put_commit(pt_job_ops->xe,
+			 &pt_job_ops->deferred);
+
+	kvfree(pt_job_ops->ops);
+	kfree(pt_job_ops);
+}
+
+void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
+{
+	if (!pt_job_ops)
+		return;
+
+	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 71a4fbfcff43..d1156fa36be8 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -17,6 +17,7 @@ struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
+struct xe_vma_ops;
 
 /* Largest huge pte is currently 1GiB. May become device dependent. */
 #define MAX_HUGEPTE_LEVEL 2
@@ -34,15 +35,15 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
-struct dma_fence *
-__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool rebind);
-
-struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs);
+int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
+struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
+				       struct xe_vma_ops *vops);
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
+struct xe_pt_job_ops *xe_pt_job_ops_alloc(struct xe_device *xe, u32 num_ops);
+struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops);
+void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.c b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
new file mode 100644
index 000000000000..4aab51481a67
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/gpu_scheduler.h>
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_migrate.h"
+#include "xe_pm.h"
+#include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
+#include "xe_sched_job.h"
+#include "xe_trace.h"
+
+/**
+ * struct xe_pt_exec_queue - PT specific state for an xe_exec_queue
+ */
+struct xe_pt_exec_queue {
+	/** @q: Backpointer to parent xe_exec_queue */
+	struct xe_exec_queue *q;
+	/** @sched: GPU scheduler for this xe_exec_queue */
+	struct drm_gpu_scheduler sched;
+	/** @entity: Scheduler entity for this xe_exec_queue */
+	struct drm_sched_entity entity;
+	/** @fini_async: do final fini async from this worker */
+	struct work_struct fini_async;
+};
+
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
+static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
+}
+
+static void run_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
+					 job->pt_update[0].tile,
+					 job->pt_update[0].ops,
+					 job->pt_update[0].pt_job_ops->ops,
+					 job->pt_update[0].pt_job_ops->current_op);
+	cleanup_pt_job(xe, job);
+}
+
+static struct dma_fence *
+pt_exec_queue_run_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = q->xe;
+
+	xe_assert(xe, is_pt_job(job));
+	xe_assert(xe, q->flags & EXEC_QUEUE_FLAG_PT);
+
+	trace_xe_sched_job_run(job);
+	run_pt_job(xe, job);
+
+	return NULL;
+}
+
+static void pt_exec_queue_free_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+
+	trace_xe_sched_job_free(job);
+	xe_sched_job_put(job);
+}
+
+static const struct drm_sched_backend_ops drm_sched_ops = {
+	.run_job = pt_exec_queue_run_job,
+	.free_job = pt_exec_queue_free_job,
+};
+
+static void pt_exec_queue_kill(struct xe_exec_queue *q)
+{
+}
+
+static void __pt_exec_queue_fini_async(struct work_struct *w)
+{
+	struct xe_pt_exec_queue *pe =
+		container_of(w, struct xe_pt_exec_queue, fini_async);
+	struct xe_exec_queue *q = pe->q;
+	struct xe_device *xe = q->xe;
+
+	xe_pm_runtime_get(xe);
+	trace_xe_exec_queue_destroy(q);
+
+	drm_sched_entity_fini(&pe->entity);
+	drm_sched_fini(&pe->sched);
+
+	kfree(pe);
+
+	xe_exec_queue_fini(q);
+	xe_pm_runtime_put(xe);
+}
+
+static void pt_exec_queue_fini(struct xe_exec_queue *q)
+{
+	INIT_WORK(&q->pt->fini_async, __pt_exec_queue_fini_async);
+	queue_work(system_wq, &q->pt->fini_async);
+}
+
+static bool pt_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	return false;
+}
+
+static const struct xe_exec_queue_ops pt_exec_queue_ops = {
+	.kill = pt_exec_queue_kill,
+	.fini = pt_exec_queue_fini,
+	.reset_status = pt_exec_queue_reset_status,
+};
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe)
+{
+	struct drm_gpu_scheduler *sched;
+	struct xe_exec_queue *q;
+	struct xe_pt_exec_queue *pe;
+	int err;
+
+	q = kzalloc(sizeof(*q), GFP_KERNEL);
+	if (!q)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&q->refcount);
+	q->flags = EXEC_QUEUE_FLAG_PT;
+	q->ops = &pt_exec_queue_ops;
+
+	pe = kzalloc(sizeof(*pe), GFP_KERNEL);
+	if (!pe) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+
+	err = drm_sched_init(&pe->sched, &drm_sched_ops, system_wq, 1, 64, 64,
+			     MAX_SCHEDULE_TIMEOUT, system_wq, NULL,
+			     q->name, xe->drm.dev);
+	if (err)
+		goto err_free;
+
+	sched = &pe->sched;
+	err = drm_sched_entity_init(&pe->entity, 0, &sched, 1, NULL);
+	if (err)
+		goto err_sched;
+
+	q->xe = xe;
+	q->pt = pe;
+	pe->q = q;
+	q->entity = &pe->entity;
+
+	xe_exec_queue_assign_name(q, 0);
+	trace_xe_exec_queue_create(q);
+
+	return q;
+
+err_sched:
+	drm_sched_fini(&pe->sched);
+err_free:
+	kfree(pe);
+	kfree(q);
+
+	return ERR_PTR(err);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.h b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
new file mode 100644
index 000000000000..a4d16b845418
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PT_EXEC_QUEUE_H_
+#define _XE_PT_EXEC_QUEUE_H_
+
+struct xe_device;
+struct xe_exec_queue;
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index cee70cb0f014..e1148450493c 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -70,8 +70,75 @@ struct xe_vm_pgtable_update {
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
 
+/** struct xe_vm_pgtable_update_op - Page table update operation */
+struct xe_vm_pgtable_update_op {
+	/** @entries: entries to update for this operation */
+	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
+	/** @vma: VMA for operation, operation not valid if NULL */
+	struct xe_vma *vma;
+	/** @num_entries: number of entries for this update operation */
+	u32 num_entries;
+	/** @bind: is a bind */
+	bool bind;
+	/** @rebind: is a rebind */
+	bool rebind;
+};
+
+/**
+ * struct xe_pt_job_ops: page table update operations dynamic allocation
+ *
+ * This is the part of struct xe_vma_ops and struct xe_vm_pgtable_update_ops
+ * which is dynamic allocated as it must be available until the bind job is
+ * complete.
+ */
+struct xe_pt_job_ops {
+	/** @xe: Xe deive */
+	struct xe_device *xe;
+	/** @current_op: current operations */
+	u32 current_op;
+	/** @refcount: ref count ops allocation */
+	struct kref refcount;
+	/** @deferred: deferred list to destroy PT entries */
+	struct llist_head deferred;
+	/** @ops: operations */
+	struct xe_vm_pgtable_update_op *ops;
+};
+
+/** struct xe_vm_pgtable_update_ops: page table update operations */
+struct xe_vm_pgtable_update_ops {
+	/** @pt_job_ops: PT update operations dynamic allocation*/
+	struct xe_pt_job_ops *pt_job_ops;
+	/** @q: exec queue for PT operations */
+	struct xe_exec_queue *q;
+	/** @start: start address of ops */
+	u64 start;
+	/** @last: last address of ops */
+	u64 last;
+	/** @num_ops: number of operations */
+	u32 num_ops;
+	/** @needs_userptr_lock: Needs userptr lock */
+	bool needs_userptr_lock;
+	/** @needs_invalidation: Needs invalidation */
+	bool needs_invalidation;
+	/**
+	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
+	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
+	 * behind these operations (install PT operations into VM kernel
+	 * dma-resv slot).
+	 */
+	bool wait_vm_bookkeep;
+	/**
+	 * @wait_vm_kernel: PT operations need to wait until VM kernel dma-resv
+	 * slots are idle.
+	 */
+	bool wait_vm_kernel;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 5c013904877a..ef8ab4860439 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
 
 int __init xe_sched_job_module_init(void)
 {
+	struct xe_sched_job *job;
+	size_t size;
+
+	size = struct_size(job, ptrs, 1);
 	xe_sched_job_slab =
-		kmem_cache_create("xe_sched_job",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs), 0,
+		kmem_cache_create("xe_sched_job", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_slab)
 		return -ENOMEM;
 
+	size = max_t(size_t,
+		     struct_size(job, ptrs,
+				 XE_HW_ENGINE_MAX_INSTANCE),
+		     struct_size(job, pt_update, 1));
 	xe_sched_job_parallel_slab =
-		kmem_cache_create("xe_sched_job_parallel",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs) *
-				  XE_HW_ENGINE_MAX_INSTANCE, 0,
+		kmem_cache_create("xe_sched_job_parallel", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
@@ -65,18 +68,21 @@ bool xe_sched_job_is_migration(struct xe_exec_queue *q)
 	return q->vm && (q->vm->flags & XE_VM_FLAG_MIGRATION);
 }
 
-static void job_free(struct xe_sched_job *job)
+static bool parallel_slab(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *q = job->q;
-	bool is_migration = xe_sched_job_is_migration(q);
+	return !q->width || xe_exec_queue_is_parallel(q) ||
+		xe_sched_job_is_migration(q);
+}
 
-	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
-			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
+static void job_free(struct xe_sched_job *job)
+{
+	kmem_cache_free(parallel_slab(job->q) ? xe_sched_job_parallel_slab :
+			xe_sched_job_slab, job);
 }
 
 static struct xe_device *job_to_xe(struct xe_sched_job *job)
 {
-	return gt_to_xe(job->q->gt);
+	return job->q->xe;
 }
 
 /* Free unused pre-allocated fences */
@@ -103,10 +109,11 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i;
 	u32 width;
 
-	/* only a kernel context can submit a vm-less job */
-	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
+	/* only a kernel and pt exec queue can submit a vm-less job */
+	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+		   !(q->flags & EXEC_QUEUE_FLAG_PT));
 
-	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
+	job = job_alloc(parallel_slab(q));
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
@@ -118,33 +125,45 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (err)
 		goto err_free;
 
-	for (i = 0; i < q->width; ++i) {
-		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
-		struct dma_fence_chain *chain;
-
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_sched_job;
-		}
-		job->ptrs[i].lrc_fence = fence;
-
-		if (i + 1 == q->width)
-			continue;
+	if (!batch_addr) {
+		xe_assert(q->xe, q->flags & EXEC_QUEUE_FLAG_PT);
 
-		chain = dma_fence_chain_alloc();
-		if (!chain) {
+		job->fence = dma_fence_allocate_private_stub(ktime_get());
+		if (!job->fence) {
 			err = -ENOMEM;
 			goto err_sched_job;
 		}
-		job->ptrs[i].chain_fence = chain;
+	} else {
+		for (i = 0; i < q->width; ++i) {
+			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
+			struct dma_fence_chain *chain;
+
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_sched_job;
+			}
+			job->ptrs[i].lrc_fence = fence;
+
+			if (i + 1 == q->width)
+				continue;
+
+			chain = dma_fence_chain_alloc();
+			if (!chain) {
+				err = -ENOMEM;
+				goto err_sched_job;
+			}
+			job->ptrs[i].chain_fence = chain;
+		}
 	}
 
-	width = q->width;
-	if (is_migration)
-		width = 2;
+	if (batch_addr) {
+		width = q->width;
+		if (is_migration)
+			width = 2;
 
-	for (i = 0; i < width; ++i)
-		job->ptrs[i].batch_addr = batch_addr[i];
+		for (i = 0; i < width; ++i)
+			job->ptrs[i].batch_addr = batch_addr[i];
+	}
 
 	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
@@ -245,9 +264,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 	u64 seqno = 0;
 	int i;
 
-	/* Migration and kernel engines have their own locking */
-	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    !(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	/* Kernel and pt exec queues have their own locking */
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+	    !(q->flags & EXEC_QUEUE_FLAG_PT)) {
 		lockdep_assert_held(&q->vm->lock);
 		if (!xe_vm_in_lr_mode(q->vm))
 			xe_vm_assert_held(q->vm);
@@ -260,6 +279,10 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		job->ring_ops_flush_tlb = true;
 	}
 
+	/* PT job */
+	if (job->fence)
+		goto arm;
+
 	/* Arm the pre-allocated fences */
 	for (i = 0; i < q->width; prev = fence, ++i) {
 		struct dma_fence_chain *chain;
@@ -281,6 +304,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 	}
 
 	job->fence = fence;
+arm:
 	drm_sched_job_arm(&job->drm);
 }
 
@@ -329,7 +353,7 @@ struct xe_sched_job_snapshot *
 xe_sched_job_snapshot_capture(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct xe_device *xe = q->gt->tile->xe;
+	struct xe_device *xe = job_to_xe(job);
 	struct xe_sched_job_snapshot *snapshot;
 	size_t len = sizeof(*snapshot) + (sizeof(u64) * q->width);
 	u16 i;
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0d3f76fb05ce..c806e048e38d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -10,10 +10,29 @@
 
 #include <drm/gpu_scheduler.h>
 
-struct xe_exec_queue;
 struct dma_fence;
 struct dma_fence_chain;
 
+struct xe_exec_queue;
+struct xe_migrate_pt_update_ops;
+struct xe_pt_job_ops;
+struct xe_tile;
+struct xe_vm;
+
+/**
+ * struct xe_pt_update_args - PT update arguments
+ */
+struct xe_pt_update_args {
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @tile: Tile */
+	struct xe_tile *tile;
+	/** @ops: Migrate PT update ops */
+	const struct xe_migrate_pt_update_ops *ops;
+	/** @pt_job_ops: PT update ops */
+	struct xe_pt_job_ops *pt_job_ops;
+};
+
 /**
  * struct xe_job_ptrs - Per hw engine instance data
  */
@@ -41,6 +60,7 @@ struct xe_sched_job {
 	 * can safely reference fence, fence cannot safely reference job.
 	 */
 #define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
+#define JOB_FLAG_PT		(DMA_FENCE_FLAG_USER_BITS << 1)
 	struct dma_fence *fence;
 	/** @user_fence: write back value when BB is complete */
 	struct {
@@ -57,8 +77,12 @@ struct xe_sched_job {
 	u32 migrate_flush_flags;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
-	/** @ptrs: per instance pointers. */
-	struct xe_job_ptrs ptrs[];
+	union {
+		/** @ptrs: per instance pointers. */
+		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
+		/** @pt_update: PT update arguments */
+		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
+	};
 };
 
 struct xe_sched_job_snapshot {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 450f407c66e8..7ca9e5c1f11f 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -147,8 +147,10 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
 			   __entry->width = q->width;
-			   __entry->guc_id = q->guc->id;
-			   __entry->guc_state = atomic_read(&q->guc->state);
+			   __entry->guc_id = !(q->flags & EXEC_QUEUE_FLAG_PT) ?
+			   q->guc->id : 0;
+			   __entry->guc_state = !(q->flags & EXEC_QUEUE_FLAG_PT) ?
+			   atomic_read(&q->guc->state) : 0;
 			   __entry->flags = q->flags;
 			   ),
 
@@ -266,9 +268,10 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_fast_assign(
 			   __entry->seqno = xe_sched_job_seqno(job);
 			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
-			   __entry->guc_id = job->q->guc->id;
-			   __entry->guc_state =
-			   atomic_read(&job->q->guc->state);
+			   __entry->guc_id = !(job->q->flags & EXEC_QUEUE_FLAG_PT) ?
+			   job->q->guc->id : 0;
+			   __entry->guc_state = !(job->q->flags & EXEC_QUEUE_FLAG_PT) ?
+			   atomic_read(&job->q->guc->state) : 0;
 			   __entry->flags = job->q->flags;
 			   __entry->error = job->fence->error;
 			   __entry->fence = job->fence;
@@ -426,11 +429,6 @@ DEFINE_EVENT(xe_vma, xe_vma_acc,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_fail,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_bind,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
@@ -544,6 +542,11 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 /* GuC */
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 26b409e1b0f0..3d3d8b9c080e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
@@ -315,7 +316,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
 
@@ -695,6 +696,44 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	return 0;
 }
 
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs)
+{
+	memset(vops, 0, sizeof(*vops));
+	INIT_LIST_HEAD(&vops->list);
+	vops->vm = vm;
+	vops->q = q;
+	vops->syncs = syncs;
+	vops->num_syncs = num_syncs;
+}
+
+static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
+		if (!vops->pt_update_ops[i].num_ops)
+			continue;
+
+		vops->pt_update_ops[i].pt_job_ops =
+			xe_pt_job_ops_alloc(vops->vm->xe,
+					    vops->pt_update_ops[i].num_ops);
+		if (!vops->pt_update_ops[i].pt_job_ops)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+void xe_vma_ops_fini(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		xe_pt_job_ops_put(vops->pt_update_ops[i].pt_job_ops);
+}
+
 /**
  * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
  * that need repinning.
@@ -712,6 +751,15 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		if (BIT(i) & tile_mask)
+			++vops->pt_update_ops[i].num_ops;
+}
+
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
 {
@@ -739,15 +787,13 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
 
 	return 0;
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops);
-static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
-			    struct xe_exec_queue *q,
-			    struct xe_sync_entry *syncs, u32 num_syncs);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -755,6 +801,8 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
@@ -763,6 +811,11 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		return 0;
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[id].q =
+			xe_tile_migrate_bind_exec_queue(tile);
+	}
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -779,6 +832,10 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			goto free_ops;
 	}
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto free_ops;
+
 	fence = ops_execute(vm, &vops);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
@@ -793,6 +850,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		list_del(&op->link);
 		kfree(op);
 	}
+	xe_vma_ops_fini(&vops);
 
 	return err;
 }
@@ -802,6 +860,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	struct dma_fence *fence = NULL;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
@@ -809,17 +869,30 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_bind_exec_queue(tile);
+	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
 	if (err)
 		return ERR_PTR(err);
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
 	fence = ops_execute(vm, &vops);
 
+free_ops:
 	list_for_each_entry_safe(op, next_op, &vops.list, link) {
 		list_del(&op->link);
 		kfree(op);
 	}
+	xe_vma_ops_fini(&vops);
 
 	return fence;
 }
@@ -1410,32 +1483,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			continue;
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
+		number_tiles++;
 	}
 	xe_vm_unlock(vm);
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = tile->primary_gt;
-			struct xe_vm *migrate_vm;
-			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM;
-
-			if (!vm->pt_root[id])
-				continue;
+		struct xe_exec_queue *q;
 
-			migrate_vm = xe_migrate_get_vm(tile->migrate);
-			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
-						       XE_ENGINE_CLASS_COPY,
-						       create_flags);
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(q)) {
-				err = PTR_ERR(q);
-				goto err_close;
-			}
-			vm->q[id] = q;
-			number_tiles++;
+		q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			goto err_close;
 		}
+		vm->q = q;
 	}
 
 	if (number_tiles > 1)
@@ -1490,21 +1551,20 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
-	down_write(&vm->lock);
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id])
-			xe_exec_queue_last_fence_put(vm->q[id], vm);
-	}
-	up_write(&vm->lock);
+	if (vm->q) {
+		down_write(&vm->lock);
+		xe_exec_queue_last_fence_put(vm->q, vm);
+		up_write(&vm->lock);
 
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			xe_exec_queue_kill(vm->q[id]);
-			xe_exec_queue_put(vm->q[id]);
-			vm->q[id] = NULL;
-		}
+		xe_exec_queue_kill(vm->q);
+		xe_exec_queue_put(vm->q);
 	}
 
+	/* FIXME: Wait for VM idle, needed as CPU require PT root to be valid */
+	dma_resv_wait_timeout(xe_vm_resv(vm),
+			      DMA_RESV_USAGE_BOOKKEEP,
+			      false, MAX_SCHEDULE_TIMEOUT);
+
 	down_write(&vm->lock);
 	xe_vm_lock(vm, false);
 	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
@@ -1638,148 +1698,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 static struct xe_exec_queue *
 to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	return q ? q : vm->q[0];
-}
-
-static struct dma_fence *
-xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool first_op, bool last_op)
-{
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	struct xe_tile *tile;
-	struct dma_fence *fence = NULL;
-	struct dma_fence **fences = NULL;
-	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0;
-	int number_tiles = hweight8(vma->tile_present);
-	int err;
-	u8 id;
-
-	trace_xe_vma_unbind(vma);
-
-	if (number_tiles > 1) {
-		fences = kmalloc_array(number_tiles, sizeof(*fences),
-				       GFP_KERNEL);
-		if (!fences)
-			return ERR_PTR(-ENOMEM);
-	}
-
-	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_present & BIT(id)))
-			goto next;
-
-		fence = __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],
-					   first_op ? syncs : NULL,
-					   first_op ? num_syncs : 0);
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_fences;
-		}
-
-		if (fences)
-			fences[cur_fence++] = fence;
-
-next:
-		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-			q = list_next_entry(q, multi_gt_list);
-	}
-
-	if (fences) {
-		cf = dma_fence_array_create(number_tiles, fences,
-					    vm->composite_fence_ctx,
-					    vm->composite_fence_seqno++,
-					    false);
-		if (!cf) {
-			--vm->composite_fence_seqno;
-			err = -ENOMEM;
-			goto err_fences;
-		}
-	}
-
-	fence = cf ? &cf->base : !fence ?
-		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
-
-	return fence;
-
-err_fences:
-	if (fences) {
-		while (cur_fence)
-			dma_fence_put(fences[--cur_fence]);
-		kfree(fences);
-	}
-
-	return ERR_PTR(err);
-}
-
-static struct dma_fence *
-xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       u8 tile_mask, bool first_op, bool last_op)
-{
-	struct xe_tile *tile;
-	struct dma_fence *fence;
-	struct dma_fence **fences = NULL;
-	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0;
-	int number_tiles = hweight8(tile_mask);
-	int err;
-	u8 id;
-
-	trace_xe_vma_bind(vma);
-
-	if (number_tiles > 1) {
-		fences = kmalloc_array(number_tiles, sizeof(*fences),
-				       GFP_KERNEL);
-		if (!fences)
-			return ERR_PTR(-ENOMEM);
-	}
-
-	for_each_tile(tile, vm->xe, id) {
-		if (!(tile_mask & BIT(id)))
-			goto next;
-
-		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
-					 first_op ? syncs : NULL,
-					 first_op ? num_syncs : 0,
-					 vma->tile_present & BIT(id));
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_fences;
-		}
-
-		if (fences)
-			fences[cur_fence++] = fence;
-
-next:
-		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-			q = list_next_entry(q, multi_gt_list);
-	}
-
-	if (fences) {
-		cf = dma_fence_array_create(number_tiles, fences,
-					    vm->composite_fence_ctx,
-					    vm->composite_fence_seqno++,
-					    false);
-		if (!cf) {
-			--vm->composite_fence_seqno;
-			err = -ENOMEM;
-			goto err_fences;
-		}
-	}
-
-	return cf ? &cf->base : fence;
-
-err_fences:
-	if (fences) {
-		while (cur_fence)
-			dma_fence_put(fences[--cur_fence]);
-		kfree(fences);
-	}
-
-	return ERR_PTR(err);
+	return q ? q : vm->q;
 }
 
 static struct xe_user_fence *
@@ -1797,48 +1716,6 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 	return NULL;
 }
 
-static struct dma_fence *
-xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
-	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
-	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
-{
-	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(bo);
-
-	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
-				       first_op, last_op);
-		if (IS_ERR(fence))
-			return fence;
-	} else {
-		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
-
-		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-	}
-
-	return fence;
-}
-
-static struct dma_fence *
-xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
-	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-	     u32 num_syncs, bool first_op, bool last_op)
-{
-	struct dma_fence *fence;
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op, last_op);
-	if (IS_ERR(fence))
-		return fence;
-
-	return fence;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
@@ -1979,21 +1856,6 @@ static const u32 region_to_mem_type[] = {
 	XE_PL_VRAM1,
 };
 
-static struct dma_fence *
-xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
-	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-	       u32 num_syncs, bool first_op, bool last_op)
-{
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-
-	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
-		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  vma->tile_mask, true, first_op, last_op);
-	} else {
-		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-	}
-}
-
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
@@ -2282,14 +2144,10 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-
-static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
-				   struct drm_gpuva_ops *ops,
-				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct xe_vma_ops *vops, bool last)
+static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
+				   struct xe_vma_ops *vops)
 {
 	struct xe_device *xe = vm->xe;
-	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
 	struct xe_tile *tile;
 	u8 id, tile_mask = 0;
@@ -2303,19 +2161,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 		struct xe_vma *vma;
-		bool first = list_empty(&vops->list);
 		unsigned int flags = 0;
 
 		INIT_LIST_HEAD(&op->link);
 		list_add_tail(&op->link, &vops->list);
-
-		if (first) {
-			op->flags |= XE_VMA_OP_FIRST;
-			op->num_syncs = num_syncs;
-			op->syncs = syncs;
-		}
-
-		op->q = q;
 		op->tile_mask = tile_mask;
 
 		switch (op->base.op) {
@@ -2334,6 +2183,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+				xe_vma_ops_incr_pt_update_ops(vops,
+							      op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2378,6 +2230,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
 
@@ -2414,203 +2268,30 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
 		case DRM_GPUVA_OP_PREFETCH:
-			/* Nothing to do */
+			/* FIXME: Need to skip some prefetch ops */
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
 
-		last_op = op;
-
 		err = xe_vma_op_commit(vm, op);
 		if (err)
 			return err;
 	}
 
-	/* FIXME: Unhandled corner case */
-	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
-
-	if (!last_op)
-		return 0;
-
-	if (last) {
-		last_op->flags |= XE_VMA_OP_LAST;
-		last_op->num_syncs = num_syncs;
-		last_op->syncs = syncs;
-	}
-
 	return 0;
 }
 
-static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
-				    struct xe_vma_op *op)
-{
-	struct dma_fence *fence = NULL;
-
-	lockdep_assert_held(&vm->lock);
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
-				   op->syncs, op->num_syncs,
-				   op->tile_mask,
-				   op->map.immediate || !xe_vm_in_fault_mode(vm),
-				   op->flags & XE_VMA_OP_FIRST,
-				   op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_REMAP:
-	{
-		bool prev = !!op->remap.prev;
-		bool next = !!op->remap.next;
-
-		if (!op->remap.unmap_done) {
-			if (prev || next)
-				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
-			fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
-					     op->num_syncs,
-					     op->flags & XE_VMA_OP_FIRST,
-					     op->flags & XE_VMA_OP_LAST &&
-					     !prev && !next);
-			if (IS_ERR(fence))
-				break;
-			op->remap.unmap_done = true;
-		}
-
-		if (prev) {
-			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
-			dma_fence_put(fence);
-			fence = xe_vm_bind(vm, op->remap.prev, op->q,
-					   xe_vma_bo(op->remap.prev), op->syncs,
-					   op->num_syncs,
-					   op->remap.prev->tile_mask, true,
-					   false,
-					   op->flags & XE_VMA_OP_LAST && !next);
-			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (IS_ERR(fence))
-				break;
-			op->remap.prev = NULL;
-		}
-
-		if (next) {
-			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
-			dma_fence_put(fence);
-			fence = xe_vm_bind(vm, op->remap.next, op->q,
-					   xe_vma_bo(op->remap.next),
-					   op->syncs, op->num_syncs,
-					   op->remap.next->tile_mask, true,
-					   false, op->flags & XE_VMA_OP_LAST);
-			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (IS_ERR(fence))
-				break;
-			op->remap.next = NULL;
-		}
-
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
-				     op->num_syncs, op->flags & XE_VMA_OP_FIRST,
-				     op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op->num_syncs,
-				       op->flags & XE_VMA_OP_FIRST,
-				       op->flags & XE_VMA_OP_LAST);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	if (IS_ERR(fence))
-		trace_xe_vma_fail(vma);
-
-	return fence;
-}
-
-static struct dma_fence *
-__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
-		    struct xe_vma_op *op)
-{
-	struct dma_fence *fence;
-	int err;
-
-retry_userptr:
-	fence = op_execute(vm, vma, op);
-	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN) {
-		lockdep_assert_held_write(&vm->lock);
-
-		if (op->base.op == DRM_GPUVA_OP_REMAP) {
-			if (!op->remap.unmap_done)
-				vma = gpuva_to_vma(op->base.remap.unmap->va);
-			else if (op->remap.prev)
-				vma = op->remap.prev;
-			else
-				vma = op->remap.next;
-		}
-
-		if (xe_vma_is_userptr(vma)) {
-			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-			if (!err)
-				goto retry_userptr;
-
-			fence = ERR_PTR(err);
-			trace_xe_vma_fail(vma);
-		}
-	}
-
-	return fence;
-}
-
-static struct dma_fence *
-xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	struct dma_fence *fence = ERR_PTR(-ENOMEM);
-
-	lockdep_assert_held(&vm->lock);
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		fence = __xe_vma_op_execute(vm, op->map.vma, op);
-		break;
-	case DRM_GPUVA_OP_REMAP:
-	{
-		struct xe_vma *vma;
-
-		if (!op->remap.unmap_done)
-			vma = gpuva_to_vma(op->base.remap.unmap->va);
-		else if (op->remap.prev)
-			vma = op->remap.prev;
-		else
-			vma = op->remap.next;
-
-		fence = __xe_vma_op_execute(vm, vma, op);
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		fence = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
-					    op);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		fence = __xe_vma_op_execute(vm,
-					    gpuva_to_vma(op->base.prefetch.va),
-					    op);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	return fence;
-}
-
 static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
@@ -2796,23 +2477,134 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	return 0;
 }
 
+static void op_trace(struct xe_vma_op *op)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		trace_xe_vma_bind(op->map.vma);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.remap.unmap->va));
+		if (op->remap.prev)
+			trace_xe_vma_bind(op->remap.prev);
+		if (op->remap.next)
+			trace_xe_vma_bind(op->remap.next);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.unmap.va));
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		trace_xe_vma_bind(gpuva_to_vma(op->base.prefetch.va));
+		break;
+	default:
+		XE_WARN_ON("NOT POSSIBLE");
+	}
+}
+
+static void trace_xe_vm_ops_execute(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	list_for_each_entry(op, &vops->list, link)
+		op_trace(op);
+}
+
+static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_tile *tile;
+	int number_tiles = 0;
+	u8 id;
+
+	for_each_tile(tile, vm->xe, id) {
+		if (vops->pt_update_ops[id].num_ops)
+			++number_tiles;
+
+		if (vops->pt_update_ops[id].q)
+			continue;
+
+		vops->pt_update_ops[id].q = vops->q ?: vm->q;
+	}
+
+	return number_tiles;
+}
+
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops)
 {
-	struct xe_vma_op *op, *next;
+	struct xe_tile *tile;
 	struct dma_fence *fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
+	int number_tiles = 0, current_fence = 0, err;
+	u8 id;
 
-	list_for_each_entry_safe(op, next, &vops->list, link) {
-		dma_fence_put(fence);
-		fence = xe_vma_op_execute(vm, op);
-		if (IS_ERR(fence)) {
-			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
-				 op->base.op, PTR_ERR(fence));
-			fence = ERR_PTR(-ENOSPC);
-			break;
+	number_tiles = vm_ops_setup_tile_args(vm, vops);
+	if (number_tiles == 0)
+		return ERR_PTR(-ENODATA);
+
+	if (number_tiles > 1) {
+		fences = kmalloc_array(number_tiles, sizeof(*fences),
+				       GFP_KERNEL);
+		if (!fences) {
+			fence = ERR_PTR(-ENOMEM);
+			goto err_trace;
 		}
 	}
 
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		err = xe_pt_update_ops_prepare(tile, vops);
+		if (err) {
+			fence = ERR_PTR(err);
+			goto err_out;
+		}
+	}
+
+	trace_xe_vm_ops_execute(vops);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		fence = xe_pt_update_ops_run(tile, vops);
+		if (IS_ERR(fence))
+			goto err_out;
+
+		if (fences)
+			fences[current_fence++] = fence;
+	}
+
+	if (fences) {
+		cf = dma_fence_array_create(number_tiles, fences,
+					    vm->composite_fence_ctx,
+					    vm->composite_fence_seqno++,
+					    false);
+		if (!cf) {
+			--vm->composite_fence_seqno;
+			fence = ERR_PTR(-ENOMEM);
+			goto err_out;
+		}
+		fence = &cf->base;
+	}
+
+	return fence;
+
+err_out:
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		xe_pt_update_ops_abort(tile, vops);
+	}
+	while (current_fence)
+		dma_fence_put(fences[--current_fence]);
+	kfree(fences);
+	kfree(cf);
+
+err_trace:
+	trace_xe_vm_ops_fail(vm);
 	return fence;
 }
 
@@ -2893,12 +2685,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			/* FIXME: Killing VM rather than proper error handling */
-			xe_vm_kill(vm, false);
 			goto unlock;
-		} else {
-			vm_bind_ioctl_ops_fini(vm, vops, fence);
 		}
+
+		vm_bind_ioctl_ops_fini(vm, vops, fence);
 	}
 
 unlock:
@@ -3051,18 +2841,6 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
 }
 
-static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
-			    struct xe_exec_queue *q,
-			    struct xe_sync_entry *syncs, u32 num_syncs)
-{
-	memset(vops, 0, sizeof(*vops));
-	INIT_LIST_HEAD(&vops->list);
-	vops->vm = vm;
-	vops->q = q;
-	vops->syncs = syncs;
-	vops->num_syncs = num_syncs;
-}
-
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
 					u16 pat_index)
@@ -3131,7 +2909,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_objs;
 		}
 
-		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
+		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_PT))) {
 			err = -EINVAL;
 			goto put_exec_queue;
 		}
@@ -3255,8 +3033,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto unwind_ops;
 		}
 
-		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &vops, i == args->num_binds - 1);
+		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
 		if (err)
 			goto unwind_ops;
 	}
@@ -3267,11 +3044,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto unwind_ops;
+
 	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 unwind_ops:
 	if (err && err != -ENODATA)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..42761936d90b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -259,6 +259,10 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
 	return drm_gpuvm_resv(&vm->gpuvm);
 }
 
+void xe_vma_ops_fini(struct xe_vma_ops *vops);
+
+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..008a769f3cdb 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,18 +21,17 @@ struct xe_bo;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
+struct xe_vm_pgtable_update_op;
 
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
-#define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
-#define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
-#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
-#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
-#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
-#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
-#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
-#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 10)
+#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 3)
+#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 4)
+#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 5)
+#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
+#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -99,6 +98,9 @@ struct xe_vma {
 	 */
 	u8 tile_present;
 
+	/** @tile_staged: bind is staged for this VMA */
+	u8 tile_staged;
+
 	/**
 	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
 	 */
@@ -130,7 +132,7 @@ struct xe_vm {
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
+	struct xe_exec_queue *q;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
@@ -314,31 +316,18 @@ struct xe_vma_op_prefetch {
 
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
-	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST			= BIT(0),
-	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST			= BIT(1),
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED		= BIT(2),
+	XE_VMA_OP_COMMITTED		= BIT(0),
 	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
-	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
+	XE_VMA_OP_PREV_COMMITTED	= BIT(1),
 	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
-	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
+	XE_VMA_OP_NEXT_COMMITTED	= BIT(2),
 };
 
 /** struct xe_vma_op - VMA operation */
 struct xe_vma_op {
 	/** @base: GPUVA base operation */
 	struct drm_gpuva_op base;
-	/** @q: exec queue for this operation */
-	struct xe_exec_queue *q;
-	/**
-	 * @syncs: syncs for this operation, only used on first and last
-	 * operation
-	 */
-	struct xe_sync_entry *syncs;
-	/** @num_syncs: number of syncs */
-	u32 num_syncs;
 	/** @link: async operation link */
 	struct list_head link;
 	/** @flags: operation flags */
@@ -362,12 +351,14 @@ struct xe_vma_ops {
 	struct list_head list;
 	/** @vm: VM */
 	struct xe_vm *vm;
-	/** @q: exec queue these operations */
+	/** @q: exec queue for VMA operations */
 	struct xe_exec_queue *q;
 	/** @syncs: syncs these operation */
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
+	/** @pt_update_ops: page table update operations */
+	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 };
 
 #endif
-- 
2.34.1

