Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1680CD129A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63643112F14;
	Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajzf7ym2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C821112F20
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7oZLLrPbAPd45CloxPwyqYIrMiqBm86zjRa25mCnu30=;
 b=ajzf7ym2EWmsevLCSjzmTOd8OJ8LHBxM3Juajqc7jRKhhuzObyKgPGcP
 uWceoZ2bkbTQglcR1yLH5XagpIP5k7GSjVURVufw+3HMjJB9WbYTpV3zZ
 c28vkMWWU3xyDzmkpGNmswMh1hlHjUyON0fFF9kVeG5yT5ZoXsCEd1pcB
 MTpQ7+PqwRXRkMlZMEoLdl9/U9X00/wE3X4cqkFPOPaWJ0c4zOpDyZB7H
 MGdTl0+gQ4/KuX9h3nNW+dXgDE52dLss2pZik5/p82jPZAkUddjO5Yp5z
 R5zd8xVEYT+38HFWB+xQz9a+eHz+soyxOAcTC1JIGhnTyIhoIrgklhiYl g==;
X-CSE-ConnectionGUID: fAadMy5gTsiGGq12RUMGcQ==
X-CSE-MsgGUID: S9u3UbILTJG+LukGiF6pwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803758"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: hTYrccDUSNyu4+BL4XKAvg==
X-CSE-MsgGUID: UKKeQurOTveYvcqQmEYVJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773732"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 07/31] drm/xe: Create userptr if page fault occurs on
 system_allocator VMA
Date: Tue,  9 Apr 2024 16:17:18 -0400
Message-Id: <20240409201742.3042626-8-oak.zeng@intel.com>
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

If a page fault occurs on system_allocator VMA, create a userptr VMA to
replaced fault region and map to GPU.

v1: Pass userptr to the req_offset of sm_map_ops_create function. This
    fix malloc'd memory failure (Oak)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 +++
 drivers/gpu/drm/xe/xe_vm.c           | 115 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   3 +
 4 files changed, 128 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c49b1409e168..c9c2f15d9f5b 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -166,6 +166,19 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
+	/*
+	 * Create userptr VMA if fault occurs in a range reserved for system
+	 * allocator.
+	 */
+	if (xe_vma_is_system_allocator(vma)) {
+		vma = xe_vm_fault_userptr(vm, pf->page_addr);
+		if (IS_ERR(vma)) {
+			xe_vm_kill(vm, true);
+			ret = PTR_ERR(vma);
+			goto unlock_vm;
+		}
+	}
+
 	if (!xe_vma_is_userptr(vma) ||
 	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
 		downgrade_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d31d067d2e8b..1ae7f4160061 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1411,6 +1411,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	vm->xe = xe;
+	vm->mm = current->mm;
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -2151,9 +2152,11 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
-				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct xe_vma_ops *vops)
+static int vm_bind_ioctl_ops_update_gpuvm_state(struct xe_vm *vm,
+						struct drm_gpuva_ops *ops,
+						struct xe_sync_entry *syncs,
+						u32 num_syncs,
+						struct xe_vma_ops *vops)
 {
 	struct xe_device *xe = vm->xe;
 	struct drm_gpuva_op *__op;
@@ -3069,8 +3072,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto unwind_ops;
 		}
 
-		err = vm_bind_ioctl_ops_parse(vm, ops[i], syncs, num_syncs,
-					      &vops);
+		err = vm_bind_ioctl_ops_update_gpuvm_state(vm, ops[i], syncs,
+							   num_syncs, &vops);
 		if (err)
 			goto unwind_ops;
 
@@ -3438,3 +3441,105 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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
+	struct mm_struct *mm = vm->mm;
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
index 6e5470a409fc..97d38daf0e9a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -244,6 +244,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+struct xe_vma *xe_vm_fault_userptr(struct xe_vm *vm, u64 fault_addr);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index e5d12bf4cf87..cb67a3918990 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -233,6 +233,9 @@ struct xe_vm {
 
 	struct xe_device *xe;
 
+	/** @mm: user MM of VM */
+	struct mm_struct *mm;
+
 	/* exec queue used for (un)binding vma's */
 	struct xe_exec_queue *q;
 
-- 
2.26.3

