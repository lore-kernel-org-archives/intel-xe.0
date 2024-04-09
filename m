Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC2BCD129C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC716112F20;
	Tue,  9 Apr 2024 20:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LN6m0Z6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8780D10EE99
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4vHFplddn3JbO8QDMfX24zpk45wLl9nANAv1eDQRm0=;
 b=LN6m0Z6YM3B3CTsa0eDOKzollK3Ij51dgll0amRNXlWknGO2d64VJqNd
 wHgH4/v12lorgdn+2MQGOAWOVg9gPXtuMd4dFLGbG9UJbG64TgP19pTT5
 BTXENNhMNY1idxrHICN5GOlG5tBB/4PUc29xICaZ6AcgVwn7sg7miHXXZ
 9ViYcpXBmPcfggayeAAbfUSEknYAgCTN+aL9Yk6kleBPnafPrlogp6y/J
 Gd258IaNFppi5IaeZ37/hlU6H3wLtGtTNefaH/Us9Kh8YYUII5S2MJomD
 aKzFnRUH7Okj+eWoX6C1uwhoiLlahAfyAoI7p3sRmpp4n9aVfxeZsHnas A==;
X-CSE-ConnectionGUID: s4PDIuSMQRCXxD00fQrzJA==
X-CSE-MsgGUID: OQg5gQTPQkOoDXvB1O0KXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803760"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803760"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: KyRFjNYcSRiDkcc0SN/Pkw==
X-CSE-MsgGUID: li7kkCHMROKOJvd34vzW8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773736"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 08/31] drm/xe: Add faulted userptr VMA garbage collector
Date: Tue,  9 Apr 2024 16:17:19 -0400
Message-Id: <20240409201742.3042626-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

When a faulted userptr VMA (allocated by page handler) is invalidated
add to list which a garbage collector will unmap from GPU, destroy
faulted userptr VMA, and replace with system_allocator VMA.

v1: Run gargabe collector only on MMU_NOTIFY_UNMAP event. For other
    events, we just invalidate GPU page table but keep the vma because
    the userptr is still exist. On next GPU access, we will revalidate
    and rebind this userptr to GPU(Oak)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   6 ++
 drivers/gpu/drm/xe/xe_vm.c           | 151 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   1 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  12 +++
 4 files changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c9c2f15d9f5b..707a3466f36b 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -154,12 +154,18 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		return -EINVAL;
 
 retry_userptr:
+	xe_vm_userptr_garbage_collector(vm);
+
 	/*
 	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
 	 * start out read-locked?
 	 */
 	down_write(&vm->lock);
 	write_locked = true;
+	if (xe_vm_is_closed_or_banned(vm)) {
+		ret = -ENOENT;
+		goto unlock_vm;
+	}
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ae7f4160061..95dda229a9fe 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -692,6 +692,18 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	if (range->event == MMU_NOTIFY_UNMAP &&
+	    vma->gpuva.flags & XE_VMA_FAULT_USERPTR &&
+	    !xe_vm_is_closed(vm) && !xe_vm_is_banned(vm) &&
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
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
@@ -1398,6 +1410,8 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
 			++vops->pt_update_ops[i].num_ops;
 }
 
+static void vm_userptr_garbage_collector(struct work_struct *w);
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1430,8 +1444,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
+	INIT_LIST_HEAD(&vm->userptr.fault_invalidated);
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
+	INIT_WORK(&vm->userptr.garbage_collector, vm_userptr_garbage_collector);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
@@ -1568,6 +1584,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->userptr.garbage_collector);
 
 	if (vm->q) {
 		down_write(&vm->lock);
@@ -3509,6 +3527,7 @@ struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr)
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			xe_assert(vm->xe, !vma);
 			vma = op->map.vma;
+			vma->gpuva.flags |= XE_VMA_FAULT_USERPTR;
 		} else if (__op->op == DRM_GPUVA_OP_UNMAP) {
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
@@ -3543,3 +3562,135 @@ struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr)
 
 	return ERR_PTR(err);
 }
+
+static int
+vm_userptr_garbage_collector_destroy_uvma(struct xe_vm *vm,
+					  struct xe_userptr_vma *uvma)
+{
+	struct mm_struct *mm = vm->mm;
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	vm_dbg(&vm->xe->drm, "GARBAGE COLLECTOR: addr=0x%016llx, range=0x%016llx",
+	       xe_vma_start(&uvma->vma), xe_vma_size(&uvma->vma));
+
+	xe_assert(vm->xe, uvma->vma.gpuva.flags & XE_VMA_FAULT_USERPTR);
+	lockdep_assert_held_write(&vm->lock);
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	kthread_use_mm(mm);
+
+	/* Blow away xe_userptr_vma with system_allocator VMA */
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm,
+					  xe_vma_start(&uvma->vma),
+					  xe_vma_size(&uvma->vma), 0, 0);
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
+			xe_tile_migrate_bind_exec_queue(tile);
+	}
+
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto err_kthread;
+
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
+
+	xe_vma_ops_free(&vops);
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
+static void vm_userptr_garbage_collector(struct work_struct *w)
+{
+	struct xe_vm *vm =
+		container_of(w, struct xe_vm, userptr.garbage_collector);
+	struct xe_userptr_vma *uvma, *next;
+	int err;
+
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		goto unlock;
+
+	/*
+	 * FIXME: Could create 1 set of VMA ops for all VMAs on
+	 * fault_invalidated list
+	 */
+
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
+	vm_userptr_garbage_collector(&vm->userptr.garbage_collector);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 97d38daf0e9a..0b2790f697db 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -276,6 +276,7 @@ void xe_vma_ops_free(struct xe_vma_ops *vops);
 struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
 
 void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+void xe_vm_userptr_garbage_collector(struct xe_vm *vm);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index cb67a3918990..fbf6bfcf59a8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -46,6 +46,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 10)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 11)
+#define XE_VMA_FAULT_USERPTR	(DRM_GPUVA_USERBITS << 12)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -326,6 +327,17 @@ struct xe_vm {
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

