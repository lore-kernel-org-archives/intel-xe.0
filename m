Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D9C2BA12
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22A10E2B7;
	Fri, 14 Jun 2024 21:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTp35iS/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C9A10EE6F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401661; x=1749937661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W0gCJTB1AeMU94phzkQ0ywyP8byZA1gF/YFd7X2Lrw0=;
 b=ZTp35iS/DU55NFWBnLlo3a7cb5Y331z6wkbaBGdLy9l8DSEEktOm3eYT
 TRGtJlcruy2akY4waH+NEhC5H9tjq3rc0lu6ULxsynQgHRSGVwo5sPMZ3
 KAiBr0Rp/VU6aTbiLCdGP1IbOyzfOXKpcV7lnVlQMVjFOdzoUUmSPeULR
 FHcoxXurwFwPn5+zGWY1Q9uVXoUpGWrG+peP6OBgfcASzC4ffo37kzoMt
 9MCn0tLzwBPjywd4552B9dfDffWY7+QZ448x6oZcBfmrlnlNq6o41BdQu
 WBptgNANrlKjBUjXSZj2jraIy+r00fW7wcrZ6O4JPD72aCpWDF5kl0TKI Q==;
X-CSE-ConnectionGUID: I8iXXwuuRDWqiLGMDqkp7w==
X-CSE-MsgGUID: odGwNW/hTaiIVWtLH48Zxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886607"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: 0tZjSNUySxWn+u/ArhAoew==
X-CSE-MsgGUID: v7a0bbXlR2idbKJ/d8NmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572426"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 32/44] drm/xe/svm: Add faulted userptr VMA garbage collector
Date: Fri, 14 Jun 2024 17:58:05 -0400
Message-Id: <20240614215817.1097633-32-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

When a faulted userptr VMA (allocated by page handler) is invalidated
add to list which a garbage collector will unmap from GPU, destroy
faulted userptr VMA, and replace with system_allocator VMA.

v1: Run gargabe collector only on MMU_NOTIFY_UNMAP event. For other
    events, we just invalidate GPU page table but keep the vma because
    the userptr is still exist. On next GPU access, we will revalidate
    and rebind this userptr to GPU(Oak)
v2: rebase
    support range based userptr invalidation in garbage collector. Allow
    partial of a userptr to be invalidated (such as trigger by partial
    munmap of a userptr) (Oak)
    Fix vm->lock recursive lock issue (Oak)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   1 +
 drivers/gpu/drm/xe/xe_vm.c           | 162 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 +++
 4 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e5187d5d51d1..93efee125fc0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -145,6 +145,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	}
 
 retry_userptr:
+	xe_vm_userptr_garbage_collector(vm);
 	if (xe_vma_is_userptr(vma) &&
 	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 961aeb2bc9b6..418420918bd3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -690,6 +690,21 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 
 	xe_vma_userptr_dma_unmap_pages(uvma, range_start, range_end);
 
+	if (range->event == MMU_NOTIFY_UNMAP &&
+	    vma->gpuva.flags & XE_VMA_FAULT_USERPTR &&
+	    !xe_vm_is_closed(vm) && !xe_vm_is_banned(vm) &&
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
+		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+		userptr->invalidate_start = start;
+		userptr->invalidate_range = range_size;
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_move_tail(&userptr->invalidate_link,
+			       &vm->userptr.fault_invalidated);
+		spin_unlock(&vm->userptr.invalidated_lock);
+
+		queue_work(system_wq, &vm->userptr.garbage_collector);
+	}
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
@@ -1428,6 +1443,8 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void vm_userptr_garbage_collector(struct work_struct *w);
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1453,8 +1470,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
+	INIT_LIST_HEAD(&vm->userptr.fault_invalidated);
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
+	INIT_WORK(&vm->userptr.garbage_collector, vm_userptr_garbage_collector);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
@@ -1609,6 +1628,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->userptr.garbage_collector);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -3573,3 +3594,144 @@ struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr)
 
 	return ERR_PTR(err);
 }
+
+static int
+vm_userptr_garbage_collector_destroy_uvma(struct xe_vm *vm,
+					  struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct mm_struct *mm = vm->gpuvm.mm;
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	vm_dbg(&vm->xe->drm, "GARBAGE COLLECTOR: addr=0x%016llx, range=0x%016llx",
+	       userptr->invalidate_start, userptr->invalidate_range);
+
+	xe_assert(vm->xe, uvma->vma.gpuva.flags & XE_VMA_FAULT_USERPTR);
+	lockdep_assert_held_write(&vm->lock);
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	kthread_use_mm(mm);
+
+	/* Replace xe_userptr_vma sub-range with system_allocator VMA */
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm,
+					  userptr->invalidate_start,
+					  userptr->invalidate_range, 0, 0);
+	if (IS_ERR(ops)) {
+		err = PTR_ERR(ops);
+		goto err_kthread;
+	}
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (__op->op == DRM_GPUVA_OP_MAP) {
+			op->map.immediate = true;
+			op->map.is_system_allocator = true;
+		}
+
+		print_op(vm->xe, __op);
+	}
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	err = vm_bind_ioctl_ops_update_gpuvm_state(vm, ops, NULL, 0, &vops);
+	if (err)
+		goto err_kthread;
+
+	/*
+	 * Order behind any user operations and use same exec queue as page
+	 * fault handler.
+	 */
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[tile->id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_exec_queue(tile);
+	}
+
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto err_kthread;
+
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
+
+	xe_vma_ops_fini(&vops);
+	kthread_unuse_mm(mm);
+	mmput(mm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+
+	return err;
+
+err_kthread:
+	kthread_unuse_mm(mm);
+	mmput(mm);
+	if (ops)
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+
+	return err;
+}
+
+static void vm_userptr_garbage_collector_locked(struct xe_vm *vm)
+{
+	struct xe_userptr_vma *uvma, *next;
+	int err;
+
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return;
+
+	/*
+	 * FIXME: Could create 1 set of VMA ops for all VMAs on
+	 * fault_invalidated list
+	 */
+	spin_lock(&vm->userptr.invalidated_lock);
+	list_for_each_entry_safe(uvma, next, &vm->userptr.fault_invalidated,
+				 userptr.invalidate_link) {
+		list_del_init(&uvma->userptr.invalidate_link);
+		spin_unlock(&vm->userptr.invalidated_lock);
+
+		err = vm_userptr_garbage_collector_destroy_uvma(vm, uvma);
+		if (err) {
+			XE_WARN_ON("Garbage collection failed, killing VM");
+			xe_vm_kill(vm, true);
+		}
+
+		spin_lock(&vm->userptr.invalidated_lock);
+	}
+	spin_unlock(&vm->userptr.invalidated_lock);
+}
+
+static void vm_userptr_garbage_collector(struct work_struct *w)
+{
+	struct xe_vm *vm =
+		container_of(w, struct xe_vm, userptr.garbage_collector);
+
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		goto unlock;
+
+	vm_userptr_garbage_collector_locked(vm);
+
+unlock:
+	up_write(&vm->lock);
+}
+
+/**
+ * xe_vm_userptr_garbage_collector() - VM userptr garbage collector
+ * @vm: VM
+ *
+ * For all invalidated faulted userptr VMAs (created by page fault handler)
+ * unmap from GPU, destroy faulted userptr VMA, and replace with
+ * system_allocator VMA.
+ */
+void xe_vm_userptr_garbage_collector(struct xe_vm *vm)
+{
+	vm_userptr_garbage_collector_locked(vm);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index a31409b87b8a..b3b6ceec39ba 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -285,6 +285,14 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask);
+void xe_vma_ops_free(struct xe_vma_ops *vops);
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
+
+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+void xe_vm_userptr_garbage_collector(struct xe_vm *vm);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c1bffa60cefc..6ebe05242997 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -40,6 +40,10 @@ struct xe_userptr {
 	struct drm_hmmptr hmmptr;
 	/** @invalidate_link: Link for the vm::userptr.invalidated list */
 	struct list_head invalidate_link;
+	/** invalidation start address */
+	u64 invalidate_start;
+	/** invalidation range */
+	u64 invalidate_range;
 	/** @userptr: link into VM repin list if userptr. */
 	struct list_head repin_link;
 	/**
@@ -212,6 +216,17 @@ struct xe_vm {
 		 * write mode.
 		 */
 		struct list_head invalidated;
+		/**
+		 * @userptr.fault_invalidated: List of invalidated userptrs,
+		 * craeted by page fault, which will be destroy by the garbage
+		 * collector. Protected from access with the @invalidated_lock.
+		 */
+		struct list_head fault_invalidated;
+		/**
+		 * @userptr.garbage_collector: worker to implement destroying of
+		 * userptrs on @userptr.fault_invalidated list.
+		 */
+		struct work_struct garbage_collector;
 	} userptr;
 
 	/** @preempt: preempt state */
-- 
2.26.3

