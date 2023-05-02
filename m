Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A47C7EE2F
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977E810E46E;
	Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C332210E403
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986650; x=1714522650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t0qrY0BHmi4OTbWxlxtE67qgGOl/DrNeaFjzSyeiMmU=;
 b=GYfeh85bOlX2jeHqkOdpSHqCSWXRfz0KCCDo4g8q2wr+oYcTImUS3lVp
 TcthV2NFsMC9i0qOcpz6IXOr3oHqeac4DU6SQX8nRvB8PEBCbYej0GJfh
 brWxmhjWwWs2XpqE0qtwPF+Fazc0GCNuMtj6nxEKE9gjBJpg9FxvRin91
 LxEKcg1Q33BVfbyvAa5eFg3+p4WhqfVNAptmjG6I9er9i85Wm5ei6bUe7
 KFuVln9FsuRxW9dCwZA1U/QujhGoFrHLoBzsHY0KNytIGzqCb4bBrLRv2
 cFBG4fvID3B16WSVvtagKyi1VZ6sRouQvQUw6VUfV1k3tPAEGTQK7Z3AS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619590"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619590"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541726"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541726"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:17 -0700
Message-Id: <20230502001727.3211096-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 21/31] drm/gpuva: Add drm device to GPUVA
 manager
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

This is the logical place for this, will help with upcoming changes too.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c  |  3 +++
 drivers/gpu/drm/xe/xe_migrate.c  | 10 +++++-----
 drivers/gpu/drm/xe/xe_pt.c       | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_vm.c       | 31 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  2 --
 include/drm/drm_gpuva_mgr.h      |  4 ++++
 7 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index bd7d27ee44bb..137322945e91 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -413,6 +413,7 @@ static void __drm_gpuva_remove(struct drm_gpuva *va);
 /**
  * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
  * @mgr: pointer to the &drm_gpuva_manager to initialize
+ * @drm: drm device
  * @name: the name of the GPU VA space
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
@@ -427,6 +428,7 @@ static void __drm_gpuva_remove(struct drm_gpuva *va);
  */
 void
 drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+		       struct drm_device *drm,
 		       const char *name,
 		       u64 start_offset, u64 range,
 		       u64 reserve_offset, u64 reserve_range,
@@ -437,6 +439,7 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 	mgr->mm_start = start_offset;
 	mgr->mm_range = range;
 
+	mgr->drm = drm;
 	mgr->name = name ? name : "unknown";
 	mgr->ops = ops;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b44aa094a466..0a393c5772e5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -129,7 +129,7 @@ static u64 xe_migrate_vram_ofs(u64 addr)
 static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 {
 	struct xe_gt *gt = m->gt;
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	size_t cleared_size;
 	u64 vram_addr;
 	bool is_vram;
@@ -175,7 +175,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	/* Need to be sure everything fits in the first PT, or create more */
 	XE_BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
 
-	bo = xe_bo_create_pin_map(vm->xe, m->gt, vm,
+	bo = xe_bo_create_pin_map(xe_vm_device(vm), m->gt, vm,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
@@ -1051,7 +1051,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 
 	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
 					       DMA_RESV_USAGE_BOOKKEEP)) {
-		vm_dbg(&vm->xe->drm, "wait on VM for munmap");
+		vm_dbg(&xe_vm_device(vm)->drm, "wait on VM for munmap");
 		return ERR_PTR(-ETIME);
 	}
 
@@ -1069,7 +1069,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 
 	if (vm) {
 		trace_xe_vm_cpu_bind(vm);
-		xe_device_wmb(vm->xe);
+		xe_device_wmb(xe_vm_device(vm));
 	}
 
 	fence = dma_fence_get_stub();
@@ -1263,7 +1263,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * trigger preempts before moving forward
 	 */
 	if (first_munmap_rebind) {
-		vm_dbg(&vm->xe->drm, "wait on first_munmap_rebind");
+		vm_dbg(&xe_vm_device(vm)->drm, "wait on first_munmap_rebind");
 		err = job_add_deps(job, &vm->resv,
 				   DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8eab8e1bbaf0..4167f666d98d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -218,7 +218,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
-	bo = xe_bo_create_pin_map(vm->xe, gt, vm, SZ_4K,
+	bo = xe_bo_create_pin_map(xe_vm_device(vm), gt, vm, SZ_4K,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
@@ -264,11 +264,11 @@ void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
 		 * FIXME: Some memory is allocated already allocated to zero?
 		 * Find out which memory that is and avoid this memset...
 		 */
-		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
+		xe_map_memset(xe_vm_device(vm), map, 0, 0, SZ_4K);
 	} else {
 		empty = __xe_pt_empty_pte(gt, vm, pt->level);
 		for (i = 0; i < XE_PDES; i++)
-			xe_pt_write(vm->xe, map, i, empty);
+			xe_pt_write(xe_vm_device(vm), map, i, empty);
 	}
 }
 
@@ -355,7 +355,7 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_gt *gt,
 	if (IS_ERR(vm->scratch_bo[id]))
 		return PTR_ERR(vm->scratch_bo[id]);
 
-	xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
+	xe_map_memset(xe_vm_device(vm), &vm->scratch_bo[id]->vmap, 0, 0,
 		      vm->scratch_bo[id]->size);
 
 	for (i = 0; i < vm->pt_root[id]->level; i++) {
@@ -538,7 +538,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		if (unlikely(xe_child))
 			parent->drm.dir->entries[offset] = &xe_child->drm;
 
-		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
+		xe_pt_write(xe_vm_device(xe_walk->vm), map, offset, pte);
 		parent->num_live++;
 	} else {
 		/* Shared pt. Stage update. */
@@ -1337,7 +1337,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	xe_vm_assert_held(vm);
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	vm_dbg(&xe_vma_device(vma)->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
@@ -1366,7 +1366,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 
 		if (last_munmap_rebind)
-			vm_dbg(&vm->xe->drm, "last_munmap_rebind");
+			vm_dbg(&xe_vm_device(vm)->drm, "last_munmap_rebind");
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (rebind && !xe_vm_no_dma_fences(xe_vma_vm(vma))) {
@@ -1401,7 +1401,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 			xe_bo_put_commit(&deferred);
 		}
 		if (!rebind && last_munmap_rebind && xe_vm_in_compute_mode(vm))
-			queue_work(vm->xe->ordered_wq,
+			queue_work(xe_vm_device(vm)->ordered_wq,
 				   &vm->preempt.rebind_work);
 	} else {
 		kfree(ifence);
@@ -1664,7 +1664,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	xe_vm_assert_held(vm);
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	vm_dbg(&xe_vma_device(vma)->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e8d9939ee535..688130c509a4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -50,7 +50,7 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma)
 int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
 	struct page **pages;
 	bool in_kthread = !current->mm;
@@ -852,12 +852,12 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (gt_mask) {
 		vma->gt_mask = gt_mask;
 	} else {
-		for_each_gt(gt, vm->xe, id)
+		for_each_gt(gt, xe_vm_device(vm), id)
 			if (!xe_gt_is_media_type(gt))
 				vma->gt_mask |= 0x1 << id;
 	}
 
-	if (vm->xe->info.platform == XE_PVC)
+	if (xe_vm_device(vm)->info.platform == XE_PVC)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	if (bo) {
@@ -904,7 +904,7 @@ static void vm_remove_extobj(struct xe_vma *vma)
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	bool read_only = xe_vma_read_only(vma);
 
 	if (xe_vma_is_userptr(vma)) {
@@ -1084,7 +1084,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	vm->xe = xe;
 	kref_init(&vm->refcount);
 	dma_resv_init(&vm->resv);
 
@@ -1125,7 +1124,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (err)
 		goto err_put;
 
-	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
+	drm_gpuva_manager_init(&vm->mgr, &xe->drm, "Xe VM", 0, vm->size, 0, 0,
 			       &gpuva_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAGS_64K;
@@ -1284,7 +1283,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	struct list_head contested;
 	struct ww_acquire_ctx ww;
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	struct xe_gt *gt;
 	struct xe_vma *vma, *next_vma;
 	struct drm_gpuva *gpuva;
@@ -1387,7 +1386,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_vm *vm =
 		container_of(w, struct xe_vm, destroy_work);
 	struct ww_acquire_ctx ww;
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	struct xe_gt *gt;
 	u8 id;
 	void *lookup;
@@ -1481,7 +1480,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
-	for_each_gt(gt, vm->xe, id) {
+	for_each_gt(gt, xe_vm_device(vm), id) {
 		if (!(vma->gt_present & BIT(id)))
 			goto next;
 
@@ -1555,7 +1554,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
-	for_each_gt(gt, vm->xe, id) {
+	for_each_gt(gt, xe_vm_device(vm), id) {
 		if (!(vma->gt_mask & BIT(id)))
 			goto next;
 
@@ -2061,7 +2060,7 @@ static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
 static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 				    u64 addr, u64 range, u32 op)
 {
-	struct xe_device *xe = vm->xe;
+	struct xe_device *xe = xe_vm_device(vm);
 	struct xe_vma *vma;
 	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
 
@@ -2164,7 +2163,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	vm_dbg(&vm->xe->drm,
+	vm_dbg(&xe_vm_device(vm)->drm,
 	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
 	       VM_BIND_OP(operation), addr, range, bo_offset_or_userptr);
 
@@ -2232,7 +2231,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	if (!IS_ERR(ops))
 		drm_gpuva_for_each_op(__op, ops)
-			print_op(vm->xe, __op);
+			print_op(xe_vm_device(vm), __op);
 
 	return ops;
 }
@@ -2783,7 +2782,7 @@ static void xe_vma_op_work_func(struct work_struct *w)
 			down_write(&vm->lock);
 			err = xe_vma_op_execute(vm, op);
 			if (err) {
-				drm_warn(&vm->xe->drm,
+				drm_warn(&xe_vm_device(vm)->drm,
 					 "Async VM op(%d) failed with %d",
 					 op->base.op, err);
 				vm_set_async_error(vm, err);
@@ -3103,7 +3102,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 			/* Rebinds may have been blocked, give worker a kick */
 			if (xe_vm_in_compute_mode(vm))
-				queue_work(vm->xe->ordered_wq,
+				queue_work(xe_vm_device(vm)->ordered_wq,
 					   &vm->preempt.rebind_work);
 		}
 
@@ -3315,7 +3314,7 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
  */
 int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
-	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_device *xe = xe_vm_device(xe_vma_vm(vma));
 	struct xe_gt *gt;
 	u32 gt_needs_invalidate = 0;
 	int seqno[XE_MAX_GT];
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 96e2c6b07bf8..cbbe95d6291f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -52,6 +52,11 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
+static inline struct xe_device *xe_vm_device(struct xe_vm *vm)
+{
+	return container_of(vm->mgr.drm, struct xe_device, drm);
+}
+
 static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
 {
 	return container_of(gpuva->mgr, struct xe_vm, mgr);
@@ -102,6 +107,11 @@ static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
 	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
 }
 
+static inline struct xe_device *xe_vma_device(struct xe_vma *vma)
+{
+	return xe_vm_device(xe_vma_vm(vma));
+}
+
 static inline bool xe_vma_read_only(struct xe_vma *vma)
 {
 	return vma->gpuva.flags & XE_VMA_READ_ONLY;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index df4797ec4d7f..fca42910dcae 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -137,8 +137,6 @@ struct xe_vm {
 	/** @mgr: base GPUVA used to track VMAs */
 	struct drm_gpuva_manager mgr;
 
-	struct xe_device *xe;
-
 	struct kref refcount;
 
 	/* engine used for (un)binding vma's */
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 62169d850098..55b0acfdcc44 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -169,6 +169,9 @@ static inline bool drm_gpuva_evicted(struct drm_gpuva *va)
  * There should be one manager instance per GPU virtual address space.
  */
 struct drm_gpuva_manager {
+	/** @drm: drm device */
+	struct drm_device *drm;
+
 	/**
 	 * @name: the name of the DRM GPU VA space
 	 */
@@ -204,6 +207,7 @@ struct drm_gpuva_manager {
 };
 
 void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+			    struct drm_device *drm,
 			    const char *name,
 			    u64 start_offset, u64 range,
 			    u64 reserve_offset, u64 reserve_range,
-- 
2.34.1

