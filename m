Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDE6C7EE2D
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33D10E49A;
	Tue,  2 May 2023 00:17:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D7910E400
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986650; x=1714522650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ygq8ivC7duyfWvp4dhlEATG6FOcVdlzsDJLXAM+0lPs=;
 b=Uh6C1sGYTgWU3MvLFU7cONMGPelpLXAluy2NJCrkFMNs1xklBwT2OFvE
 sq1fhCghRyEHutkX2tDmsPK23MRPEp6lgZN3Jik66cNs2c2YZCpZfMLLo
 zAtod/jCret/TJYg+/PEfwZ9FdFmX8wktO26ullzdOgJ/rpInYlMe8nlG
 KjuV9R6bfMVGoByagVCEO095dfOY2yPc5G6XvgzldAmzVa+U8Vxevq6v6
 EhpRVrvpvJ0S0VDBhcPnQ1dkrOC1Gjzx2msJJ9f4HqiXiA14yn6b+XqO0
 i83AfTSjiVQQIy1EUE4nRioItx40NsJvz+/v4ZJ8YKGQRohbyJqPGpaDT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619594"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541732"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541732"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:19 -0700
Message-Id: <20230502001727.3211096-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 23/31] drm/gpuva: Add support for extobj
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

Manager maintains lists of GPUVA with extobjs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c  | 45 +++++++++++++--
 drivers/gpu/drm/xe/xe_exec.c     | 24 ++++----
 drivers/gpu/drm/xe/xe_vm.c       | 99 +++++---------------------------
 drivers/gpu/drm/xe/xe_vm.h       |  3 -
 drivers/gpu/drm/xe/xe_vm_types.h | 16 ------
 include/drm/drm_gpuva_mgr.h      | 39 ++++++++++++-
 6 files changed, 105 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index 6d2d0f4d5018..e8cd6e154336 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -447,6 +447,9 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 
 	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 
+	mgr->extobj.entries = 0;
+	INIT_LIST_HEAD(&mgr->extobj.list);
+
 	if (reserve_range) {
 		mgr->kernel_alloc_node.va.addr = reserve_offset;
 		mgr->kernel_alloc_node.va.range = reserve_range;
@@ -706,7 +709,8 @@ EXPORT_SYMBOL(drm_gpuva_remove);
  * @va: the &drm_gpuva to link
  *
  * This adds the given &va to the GPU VA list of the &drm_gem_object it is
- * associated with.
+ * associated with and to &drm_gpuva_manager.extobj.list if GPUVA maps an
+ * extobj.
  *
  * This function expects the caller to protect the GEM's GPUVA list against
  * concurrent access.
@@ -714,8 +718,14 @@ EXPORT_SYMBOL(drm_gpuva_remove);
 void
 drm_gpuva_link(struct drm_gpuva *va)
 {
-	if (likely(va->gem.obj))
+	if (likely(va->gem.obj)) {
 		list_add_tail(&va->gem.entry, &va->gem.obj->gpuva.list);
+		if (va->flags & DRM_GPUVA_EXTOBJ) {
+			list_add_tail(&va->gem.extobj_link,
+				      &va->mgr->extobj.list);
+			++va->mgr->extobj.entries;
+		}
+	}
 }
 EXPORT_SYMBOL(drm_gpuva_link);
 
@@ -724,7 +734,8 @@ EXPORT_SYMBOL(drm_gpuva_link);
  * @va: the &drm_gpuva to unlink
  *
  * This removes the given &va from the GPU VA list of the &drm_gem_object it is
- * associated with.
+ * associated with and from &drm_gpuva_manager.extobj.list if GPUVA maps an
+ * extobj.
  *
  * This function expects the caller to protect the GEM's GPUVA list against
  * concurrent access.
@@ -732,8 +743,13 @@ EXPORT_SYMBOL(drm_gpuva_link);
 void
 drm_gpuva_unlink(struct drm_gpuva *va)
 {
-	if (likely(va->gem.obj))
+	if (likely(va->gem.obj)) {
 		list_del_init(&va->gem.entry);
+		if (va->flags & DRM_GPUVA_EXTOBJ) {
+			list_del(&va->gem.extobj_link);
+			--va->mgr->extobj.entries;
+		}
+	}
 }
 EXPORT_SYMBOL(drm_gpuva_unlink);
 
@@ -871,6 +887,27 @@ drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
 }
 EXPORT_SYMBOL(drm_gpuva_interval_empty);
 
+/**
+ * drm_gpuva_add_fence - add fence to private and all extobj dma-resv
+ * @mgr: the &drm_gpuva_manager to add a fence to
+ * @fence: fence to add
+ * @private_usage: private dma-resv usage
+ * @extobj_usage: extobj dma-resv usage
+ *
+ * Returns: true if the interval is empty, false otherwise
+ */
+void drm_gpuva_add_fence(struct drm_gpuva_manager *mgr, struct dma_fence *fence,
+			 enum dma_resv_usage private_usage,
+			 enum dma_resv_usage extobj_usage)
+{
+	struct drm_gpuva *gpuva;
+
+	dma_resv_add_fence(&mgr->resv, fence, private_usage);
+	drm_gpuva_for_each_extobj(gpuva, mgr)
+		dma_resv_add_fence(gpuva->gem.obj->resv, fence, extobj_usage);
+}
+EXPORT_SYMBOL(drm_gpuva_add_fence);
+
 /**
  * drm_gpuva_map - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
  * callbacks
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index b352fd6e1f4d..2ae02f1500d5 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -353,19 +353,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_no_dma_fences(vm)) {
-		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(xe_vm_resv(vm),
-				   &job->drm.s_fence->finished,
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		/*
-		 * Make implicit sync work across drivers, assuming all external
-		 * BOs are written as we don't pass in a read / write list.
-		 */
-		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
-					DMA_RESV_USAGE_WRITE);
-	}
+
+	/*
+	 * Block userptr invalidations / BO eviction
+	 *
+	 * Make implicit sync work across drivers, assuming all external BOss
+	 * are written as we don't pass in a read / write list.
+	 */
+	if (!xe_vm_no_dma_fences(vm))
+		drm_gpuva_add_fence(&vm->mgr, &job->drm.s_fence->finished,
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    DMA_RESV_USAGE_WRITE);
 
 	for (i = 0; i < num_syncs; i++)
 		xe_sync_entry_signal(&syncs[i], job,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8f7140501ff2..336e21c710a5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -278,25 +278,6 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	return 0;
 }
 
-/**
- * xe_vm_fence_all_extobjs() - Add a fence to vm's external objects' resv
- * @vm: The vm.
- * @fence: The fence to add.
- * @usage: The resv usage for the fence.
- *
- * Loops over all of the vm's external object bindings and adds a @fence
- * with the given @usage to all of the external object's reservation
- * objects.
- */
-void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
-			     enum dma_resv_usage usage)
-{
-	struct xe_vma *vma;
-
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
-		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
-}
-
 static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 {
 	struct xe_engine *e;
@@ -307,10 +288,9 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(e, &vm->preempt.engines, compute.link) {
 		e->ops->resume(e);
 
-		dma_resv_add_fence(xe_vm_resv(vm), e->compute.pfence,
-				   DMA_RESV_USAGE_BOOKKEEP);
-		xe_vm_fence_all_extobjs(vm, e->compute.pfence,
-					DMA_RESV_USAGE_BOOKKEEP);
+		drm_gpuva_add_fence(&vm->mgr, e->compute.pfence,
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    DMA_RESV_USAGE_BOOKKEEP);
 	}
 }
 
@@ -345,10 +325,9 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(xe_vm_resv(vm), pfence,
-			   DMA_RESV_USAGE_BOOKKEEP);
-
-	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
+	drm_gpuva_add_fence(&vm->mgr, pfence,
+			    DMA_RESV_USAGE_BOOKKEEP,
+			    DMA_RESV_USAGE_BOOKKEEP);
 
 	/*
 	 * Check to see if a preemption on VM is in flight or userptr
@@ -425,15 +404,17 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 {
 	struct ttm_validate_buffer *tv_vm, *tv_bo;
 	struct xe_vma *vma, *next;
+	struct drm_gpuva *gpuva;
 	LIST_HEAD(dups);
 	int err;
 
 	lockdep_assert_held(&vm->lock);
 
-	if (vm->extobj.entries < XE_ONSTACK_TV) {
+	if (vm->mgr.extobj.entries < XE_ONSTACK_TV) {
 		tv_vm = tv_onstack;
 	} else {
-		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
+		tv_vm = kvmalloc_array(vm->mgr.extobj.entries + 1,
+				       sizeof(*tv_vm),
 				       GFP_KERNEL);
 		if (!tv_vm)
 			return -ENOMEM;
@@ -441,9 +422,9 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	tv_bo = tv_vm + 1;
 
 	INIT_LIST_HEAD(objs);
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
+	drm_gpuva_for_each_extobj(gpuva, &vm->mgr) {
 		tv_bo->num_shared = num_shared;
-		tv_bo->bo = &xe_vma_bo(vma)->ttm;
+		tv_bo->bo = &gem_to_xe_bo(gpuva->gem.obj)->ttm;
 
 		list_add_tail(&tv_bo->head, objs);
 		tv_bo++;
@@ -838,9 +819,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	 * invalidate_link
 	 */
 	INIT_LIST_HEAD(&vma->rebind_link);
-	INIT_LIST_HEAD(&vma->extobj.link);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
+	INIT_LIST_HEAD(&vma->gpuva.gem.extobj_link);
 	vma->gpuva.mgr = &vm->mgr;
 	vma->gpuva.va.addr = start;
 	vma->gpuva.va.range = end - start + 1;
@@ -866,6 +847,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gem_object_get(&bo->ttm.base);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
+		if (!bo->vm)
+			vma->gpuva.flags |= DRM_GPUVA_EXTOBJ;
 		drm_gpuva_link(&vma->gpuva);
 	} else /* userptr or null */ {
 		if (!null) {
@@ -893,14 +876,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	return vma;
 }
 
-static void vm_remove_extobj(struct xe_vma *vma)
-{
-	if (!list_empty(&vma->extobj.link)) {
-		xe_vma_vm(vma)->extobj.entries--;
-		list_del_init(&vma->extobj.link);
-	}
-}
-
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -966,8 +941,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 		drm_gpuva_unlink(&vma->gpuva);
-		if (!xe_vma_bo(vma)->vm)
-			vm_remove_extobj(vma);
 	}
 
 	xe_vm_assert_held(vm);
@@ -1111,8 +1084,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&vm->preempt.engines);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
-	INIT_LIST_HEAD(&vm->extobj.list);
-
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		/* We need to immeditatelly exit from any D3 state */
 		xe_pm_runtime_get(xe);
@@ -1366,7 +1337,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (vm->async_ops.error_capture.addr)
 		wake_up_all(&vm->async_ops.error_capture.wq);
 
-	XE_WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
 	drm_gpuva_manager_destroy(&vm->mgr);
@@ -2019,44 +1989,6 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
 	vm->async_ops.error = err;
 }
 
-static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
-				 struct xe_vma *ignore)
-{
-	struct ww_acquire_ctx ww;
-	struct drm_gpuva *gpuva;
-	struct drm_gem_object *obj = &bo->ttm.base;
-	bool ret = false;
-
-	xe_bo_lock(bo, &ww, 0, false);
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-
-		if (vma != ignore && xe_vma_vm(vma) == vm &&
-		    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
-			ret = true;
-			break;
-		}
-	}
-	xe_bo_unlock(bo, &ww);
-
-	return ret;
-}
-
-static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
-{
-	struct xe_bo *bo = xe_vma_bo(vma);
-
-	lockdep_assert_held_write(&vm->lock);
-
-	if (bo_has_vm_references(bo, vm, vma))
-		return 0;
-
-	list_add(&vma->extobj.link, &vm->extobj.list);
-	vm->extobj.entries++;
-
-	return 0;
-}
-
 static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 				    u64 addr, u64 range, u32 op)
 {
@@ -2266,7 +2198,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			return ERR_PTR(err);
 		}
 	} else if(!xe_vma_has_no_bo(vma) && !bo->vm) {
-		vm_insert_extobj(vm, vma);
 		err = add_preempt_fences(vm, bo);
 		if (err) {
 			prep_vma_destroy(vm, vma, false);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 81a9271be728..12de652d8d1c 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -232,9 +232,6 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 			   struct ww_acquire_ctx *ww,
 			   struct list_head *objs);
 
-void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
-			     enum dma_resv_usage usage);
-
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 26571d171a43..0b59bde3bc4e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -113,14 +113,6 @@ struct xe_vma {
 		u8 gt_invalidated;
 	} usm;
 
-	struct {
-		/**
-		 * @extobj.link: Link into vm's external object list.
-		 * protected by the vm lock.
-		 */
-		struct list_head link;
-	} extobj;
-
 	/**
 	 * @userptr: user pointer state, only allocated for VMAs that are
 	 * user pointers
@@ -189,14 +181,6 @@ struct xe_vm {
 	 */
 	struct work_struct destroy_work;
 
-	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
-	struct {
-		/** @enties: number of external BOs attached this VM */
-		u32 entries;
-		/** @list: list of vmas with external bos attached */
-		struct list_head list;
-	} extobj;
-
 	/** @async_ops: async VM operations (bind / unbinds) */
 	struct {
 		/** @list: list of pending async VM ops */
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 010b649e363f..57861a7ed504 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -54,10 +54,18 @@ enum drm_gpuva_flags {
 	 */
 	DRM_GPUVA_SPARSE = (1 << 1),
 
+	/**
+	 * @DRM_GPUVA_EXTOBJ:
+	 *
+	 * Flag indicating that the &drm_gpuva is a mapping of an extobj (GEN
+	 * not tied to a single address space).
+	 */
+	DRM_GPUVA_EXTOBJ = (1 << 2),
+
 	/**
 	 * @DRM_GPUVA_USERBITS: user defined bits
 	 */
-	DRM_GPUVA_USERBITS = (1 << 2),
+	DRM_GPUVA_USERBITS = (1 << 3),
 };
 
 /**
@@ -112,6 +120,12 @@ struct drm_gpuva {
 		 * @entry: the &list_head to attach this object to a &drm_gem_object
 		 */
 		struct list_head entry;
+
+		/**
+		 * @extobj_link: the &list_head to attach this object to a
+		 * @drm_gpuva_manager.extobj.list
+		 */
+		struct list_head extobj_link;
 	} gem;
 };
 
@@ -134,6 +148,10 @@ struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
 
 bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
 
+void drm_gpuva_add_fence(struct drm_gpuva_manager *mgr, struct dma_fence *fence,
+			 enum dma_resv_usage private_usage,
+			 enum dma_resv_usage extobj_usage);
+
 /**
  * drm_gpuva_evict - sets whether the backing GEM of this &drm_gpuva is evicted
  * @va: the &drm_gpuva to set the evict flag for
@@ -206,6 +224,17 @@ struct drm_gpuva_manager {
 	 */
 	struct drm_gpuva kernel_alloc_node;
 
+	/** @extobj: bookkeeping for external GEMs */
+	struct {
+		/**
+		 * @entries: number of external GEMs attached this address
+		 * space
+		 */
+		u32 entries;
+		/** @list: list of GPUVAs with external GEMs attached */
+		struct list_head list;
+	} extobj;
+
 	/**
 	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
 	 */
@@ -509,6 +538,14 @@ struct drm_gpuva_ops {
 	struct list_head list;
 };
 
+/**
+ * drm_gpuva_for_each_op - iterator to walk over &drm_gpuva of extobjs
+ * @va: &drm_gpuva to assign in each iteration step
+ * @mgr: &drm_gpuva_manager to walk extobj lisy
+ */
+#define drm_gpuva_for_each_extobj(va, mgr) \
+	list_for_each_entry(va, &(mgr)->extobj.list, gem.extobj_link)
+
 /**
  * drm_gpuva_for_each_op - iterator to walk over &drm_gpuva_ops
  * @op: &drm_gpuva_op to assign in each iteration step
-- 
2.34.1

