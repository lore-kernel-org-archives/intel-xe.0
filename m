Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D7EC2BA16
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969210E2BE;
	Fri, 14 Jun 2024 21:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4snyjkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB02A10EE83
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401661; x=1749937661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FOyhvwxqTZSjXwqz6qm+iMypSBQS/wtY6gY4LBp4pAQ=;
 b=d4snyjkz31PBfmgN9OwT/4IrPHv2VMfNmmP+s0Hp0yeuQjqAToVViCu5
 lah19ZQtcilWfQ5dFo3/hfqQf3DBAX+8Cfqq//TY+GRBpV3dqIK8QdxCq
 AxG4A8fVc1kR4mI5qnWFvbIklcHVYlLxyJV59A5B1l5cTX1Vj8EcJo7Um
 Xs5B1p/N0af8gutG9fCeND9H8xfJIx2SYbeORwwg3yo9eeJZAVQxIw35M
 d+X4wgGV+lhgqU8rONq2EyIVzmkT9xLkrWrY785tAkFaMDhZEywihRyqR
 AYB11FqSP0XKAlpOSw0JqsaZVc2nYq/g0VQwFl2jIkq2CHenLfznek/w6 g==;
X-CSE-ConnectionGUID: tLbvlD/CTiu8dRtdAvqkCQ==
X-CSE-MsgGUID: suuEs4JkSveuphshXx2GGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886606"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: U2b1ugGbQSiidXeUSwEebg==
X-CSE-MsgGUID: 0tYzYksKSOyZ1bNt43PnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572425"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 31/44] drm/xe/svm: Create userptr if page fault occurs on
 system_allocator VMA
Date: Fri, 14 Jun 2024 17:58:04 -0400
Message-Id: <20240614215817.1097633-31-oak.zeng@intel.com>
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

If a page fault occurs on system_allocator VMA, create a userptr VMA to
replaced fault region and map to GPU.

v1: Pass userptr to the req_offset of sm_map_ops_create function. This
fix malloc'd memory failure (Oak)
drop xe_vma_is_userptr(vma) condition. XE_VMA_FAULT_USERPTR
is enough to determine a fault userptr (Matt)

v2: don't pin fault userptr during fault userptr creation. Fault userptr
is created during gpu page fault. After creation, we decide whether we
need to migrate it to GPU vram. So pin fault userptr after migration is
enough. A pin before migration is redundant. (Oak)

v3: remove mm field from xe_vm as we add mm in drm_gpuvm now. rebase (Oak)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  12 +++
 drivers/gpu/drm/xe/xe_vm.c           | 118 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   7 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |   1 +
 4 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 83167fc44dd7..e5187d5d51d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -132,6 +132,18 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	trace_xe_vma_pagefault(vma);
 	atomic = access_is_atomic(pf->access_type);
 
+	/*
+	 * Create userptr VMA if fault occurs in a range reserved for system
+	 * allocator.
+	 */
+	if (xe_vma_is_system_allocator(vma)) {
+		vma = xe_vm_fault_userptr(vm, pf->page_addr);
+		if (IS_ERR(vma)) {
+			xe_vm_kill(vm, true);
+			return PTR_ERR(vma);
+		}
+	}
+
 retry_userptr:
 	if (xe_vma_is_userptr(vma) &&
 	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4aa5a596475e..961aeb2bc9b6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1482,7 +1482,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	}
 
 	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
-		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops, false);
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops,
+		       flags & XE_VM_FLAG_PARTICIPATE_SVM);
 
 	drm_gem_object_put(vm_resv_obj);
 
@@ -2093,7 +2094,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	if (bo)
 		drm_exec_fini(&exec);
 
-	if (xe_vma_is_userptr(vma)) {
+	if (xe_vma_is_userptr(vma) && !xe_vma_is_fault_userptr(vma)) {
 		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
 		if (err) {
 			prep_vma_destroy(vm, vma, false);
@@ -2207,8 +2208,11 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
-				   struct xe_vma_ops *vops)
+static int vm_bind_ioctl_ops_update_gpuvm_state(struct xe_vm *vm,
+						struct drm_gpuva_ops *ops,
+						struct xe_sync_entry *syncs,
+						u32 num_syncs,
+						struct xe_vma_ops *vops)
 {
 	struct xe_device *xe = vm->xe;
 	struct drm_gpuva_op *__op;
@@ -3145,7 +3149,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto unwind_ops;
 		}
 
-		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
+		err = vm_bind_ioctl_ops_update_gpuvm_state(vm, ops[i], syncs,
+							   num_syncs, &vops);
 		if (err)
 			goto unwind_ops;
 	}
@@ -3465,3 +3470,106 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+/**
+ * xe_vm_fault_userptr() - VM fault userptr
+ * @vm: VM
+ * @fault_addr: fault address
+ *
+ * Create userptr VMA from fault address
+ *
+ * Return: newly created userptr VMA on success, ERR_PTR on failure
+ */
+struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr)
+{
+	struct vm_area_struct *vas;
+	struct mm_struct *mm = vm->gpuvm.mm;
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	struct xe_vma *vma = NULL;
+	u64 start, range;
+	int err;
+
+	vm_dbg(&vm->xe->drm, "FAULT: addr=0x%016llx", fault_addr);
+
+	if (!mmget_not_zero(mm))
+		return ERR_PTR(-EFAULT);
+
+	kthread_use_mm(mm);
+
+	mmap_read_lock(mm);
+	vas = find_vma_intersection(mm, fault_addr, fault_addr + 4);
+	if (!vas) {
+		err = -ENOENT;
+		goto err_unlock;
+	}
+
+	vm_dbg(&vm->xe->drm, "FOUND VAS: vm_start=0x%016lx, vm_end=0x%016lx",
+	       vas->vm_start, vas->vm_end);
+
+	start = vas->vm_start;
+	range = vas->vm_end - vas->vm_start;
+	mmap_read_unlock(mm);
+
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range, 0, start);
+	if (IS_ERR(ops)) {
+		err = PTR_ERR(ops);
+		goto err_kthread;
+	}
+
+	drm_gpuva_for_each_op(__op, ops)
+		print_op(vm->xe, __op);
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	err = vm_bind_ioctl_ops_update_gpuvm_state(vm, ops, NULL, 0, &vops);
+	if (err)
+		goto err_kthread;
+
+	/*
+	 * No need to execute ops as we just want to update GPUVM state, page
+	 * fault handler will update GPU page tables. Find VMA that needs GPU
+	 * mapping and return to page fault handler.
+	 */
+	xe_vm_lock(vm, false);
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (__op->op == DRM_GPUVA_OP_MAP) {
+			xe_assert(vm->xe, !vma);
+			vma = op->map.vma;
+			vma->gpuva.flags |= XE_VMA_FAULT_USERPTR;
+		} else if (__op->op == DRM_GPUVA_OP_UNMAP) {
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
+				       NULL);
+		}
+	}
+	xe_vm_unlock(vm);
+
+	kthread_unuse_mm(mm);
+	mmput(mm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+
+	return vma;
+
+err_unlock:
+	mmap_read_unlock(mm);
+err_kthread:
+	kthread_unuse_mm(mm);
+	mmput(mm);
+	if (ops) {
+		drm_gpuva_for_each_op_reverse(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+			xe_vma_op_unwind(vm, op,
+					 op->flags & XE_VMA_OP_COMMITTED,
+					 op->flags & XE_VMA_OP_PREV_COMMITTED,
+					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
+		}
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+	}
+
+	return ERR_PTR(err);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 680c0c49b2f4..a31409b87b8a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -172,6 +172,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_system_allocator(vma);
 }
 
+static inline bool xe_vma_is_fault_userptr(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_FAULT_USERPTR;
+}
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
@@ -252,6 +257,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 165c2ca258de..c1bffa60cefc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -33,6 +33,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
+#define XE_VMA_FAULT_USERPTR	(DRM_GPUVA_USERBITS << 10)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
-- 
2.26.3

