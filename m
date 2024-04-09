Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D6FCD129A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90D8112F19;
	Tue,  9 Apr 2024 20:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBBGQCV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0A5112F11
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIE7DWKhWOW9jJibs8vZz7Mjex8zZbTDh2gihdiZIz0=;
 b=iBBGQCV9R8i8ambB87CqF/Yhf3W9Ns0kUW3GPzQ9UZ26Y+BVmC85IZ7m
 tqokguBw2SiZv1MbAz3dcE/Xcc7EsMU52mtp9Bed0Pezrobp5EfX4R5ax
 KWe3vpka86Fgze8kFycNwUrphqnWQGqcBHSh8Z+u0ben6UMRy8cGP1RUY
 Rb/XLCCE0lVGgtnckKxvcUbp5NvvjFsnRxnh4s8S30+UwwJMQl+6ej37X
 OAIU1hDm0jQCMJXA0Xu1Z3lfVCE/AQ5wI4YUEZOktM8qgC5Y4KezJ2QoD
 YC/0R65XILTjYQX7LqirRZ8NtQZH7zu0GCotxnb+PpVHxC+KvqGVpLFgf A==;
X-CSE-ConnectionGUID: /o6FjzvqRNie4pOIGTuVhA==
X-CSE-MsgGUID: 2ZEvrZl1SRyrhRV2griP5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803755"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: OPOtVN9OSIuP1ID+lS+img==
X-CSE-MsgGUID: nQow9XdFTgW2vUfTLszPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773729"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 06/31] drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
Date: Tue,  9 Apr 2024 16:17:17 -0400
Message-Id: <20240409201742.3042626-7-oak.zeng@intel.com>
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

Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag which is used to create
unpopulated (no memory backing or GPU page tables) VMAs. These VMAs are
referred to as system allocator VMAs. The idea is on page fault the
memory back and GPU page tables will be populated.

FIXME: Only supporting 1 to 1 mapping between user address space and
GPU address space

v1: enforce DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR fo fault mode
VMs

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  73 +++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c       | 132 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.h       |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h |   3 +
 include/uapi/drm/xe_drm.h        |  15 +++-
 5 files changed, 161 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ff01d616dac..846e896edcb5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1030,6 +1030,11 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	int err = 0;
 
+	/*
+	 * No need to check for is_system_allocator here as vma_add_deps is a
+	 * NOP if VMA is_system_allocator
+	 */
+
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
@@ -1602,6 +1607,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int err;
 
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
@@ -1659,6 +1665,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
@@ -1694,15 +1701,21 @@ static int op_prepare(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_system_allocator)
 			break;
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.remap.unmap->va));
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_system_allocator(old))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, old);
 
 		if (!err && op->remap.prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
@@ -1715,15 +1728,28 @@ static int op_prepare(struct xe_vm *vm,
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.unmap.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (xe_vma_is_system_allocator(vma))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, vma);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		err = bind_op_prepare(vm, tile, pt_update_ops,
-				      gpuva_to_vma(op->base.prefetch.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (xe_vma_is_system_allocator(vma))
+			break;
+
+		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1785,6 +1811,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, struct dma_fence *fence)
 {
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1810,6 +1838,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
 			     struct xe_vma *vma, struct dma_fence *fence)
 {
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1837,14 +1867,20 @@ static void op_commit(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_system_allocator)
 			break;
 
 		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_system_allocator(old))
+			break;
+
+		unbind_op_commit(vm, tile, pt_update_ops, old, fence);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
@@ -1853,14 +1889,23 @@ static void op_commit(struct xe_vm *vm,
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
 				       fence);
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (!xe_vma_is_system_allocator(vma))
+			unbind_op_commit(vm, tile, pt_update_ops, vma, fence);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (!xe_vma_is_system_allocator(vma))
+			bind_op_commit(vm, tile, pt_update_ops, vma, fence);
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ce7dbeb6f0a..d31d067d2e8b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -841,6 +841,8 @@ int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 	vm->dummy_ops.op.map.immediate = true;
 	vm->dummy_ops.op.map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
 	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
+	vm->dummy_ops.op.map.is_system_allocator =
+		xe_vma_is_system_allocator(vma);
 
 	return xe_vma_ops_alloc(&vm->dummy_ops.vops);
 }
@@ -889,9 +891,10 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
-#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
-#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
-#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
+#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
+#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
+#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -905,6 +908,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
+	bool is_system_allocator =
+		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -913,7 +918,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	 * Allocate and ensure that the xe_vma_is_userptr() return
 	 * matches what was allocated.
 	 */
-	if (!bo && !is_null) {
+	if (!bo && !is_null && !is_system_allocator) {
 		struct xe_userptr_vma *uvma = kzalloc(sizeof(*uvma), GFP_KERNEL);
 
 		if (!uvma)
@@ -925,6 +930,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
+		if (is_system_allocator)
+			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
 		if (is_null)
 			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 		if (bo)
@@ -967,7 +974,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gpuva_link(&vma->gpuva, vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
-		if (!is_null) {
+		if (!is_null && !is_system_allocator) {
 			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
 			u64 size = end - start + 1;
 			int err;
@@ -1024,7 +1031,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		 */
 		mmu_interval_notifier_remove(&userptr->notifier);
 		xe_vm_put(vm);
-	} else if (xe_vma_is_null(vma)) {
+	} else if (xe_vma_is_null(vma) || xe_vma_is_system_allocator(vma)) {
 		xe_vm_put(vm);
 	} else {
 		xe_bo_put(xe_vma_bo(vma));
@@ -1063,7 +1070,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
-	} else if (!xe_vma_is_null(vma)) {
+	} else if (!xe_vma_is_null(vma) && !xe_vma_is_system_allocator(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
 		drm_gpuva_unlink(&vma->gpuva);
@@ -1982,6 +1989,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.immediate = !xe_vm_in_fault_mode(vm);
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+			op->map.is_system_allocator = flags &
+				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
@@ -2173,6 +2182,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->map.is_system_allocator ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2180,7 +2191,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
-			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
+			    !op->map.is_system_allocator)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask);
 			break;
@@ -2189,22 +2201,25 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		{
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
+			bool skip = xe_vma_is_system_allocator(old);
 
 			op->tile_mask = old->tile_present;
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
 
-			if (op->base.remap.prev) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_READ_ONLY ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				DRM_GPUVA_SPARSE ?
+				VMA_CREATE_FLAG_IS_NULL : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_DUMPABLE ?
+				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= xe_vma_is_system_allocator(old) ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
+			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2216,9 +2231,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+				op->remap.skip_prev = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_end(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_prev) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2234,16 +2250,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			}
 
 			if (op->base.remap.next) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
-
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2255,9 +2261,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_next = !xe_vma_is_userptr(old) &&
+				op->remap.skip_next = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_start(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_next) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2270,7 +2277,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!skip)
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -2278,13 +2286,19 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
 			op->tile_mask = vma->tile_present;
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!xe_vma_is_system_allocator(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_PREFETCH:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
 			/* FIXME: Need to skip some prefetch ops */
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!xe_vma_is_system_allocator(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
+		}
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
@@ -2715,22 +2729,31 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 }
 
 #ifdef TEST_VM_OPS_ERROR
-#define SUPPORTED_FLAGS	(FORCE_OP_ERROR | DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+#define SUPPORTED_FLAGS	(FORCE_OP_ERROR | \
+			 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR | \
+			 DRM_XE_VM_BIND_FLAG_NULL | \
+			 DRM_XE_VM_BIND_FLAG_DUMPABLE)
 #else
 #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+			 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR | \
+			 DRM_XE_VM_BIND_FLAG_DUMPABLE)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
+				    struct xe_file *xef,
 				    struct drm_xe_vm_bind *args,
-				    struct drm_xe_vm_bind_op **bind_ops)
+				    struct drm_xe_vm_bind_op **bind_ops,
+				    struct xe_vm **vm)
 {
 	int err;
 	int i;
 
+	*vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !*vm))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
@@ -2768,9 +2791,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		bool is_system_allocator = flags &
+			DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
+		if (is_system_allocator && !xe_vm_in_fault_mode(*vm)) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -2791,13 +2821,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
-		    XE_IOCTL_DBG(xe, obj && is_null) ||
-		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
+		    XE_IOCTL_DBG(xe, obj && (is_null || is_system_allocator)) ||
+		    XE_IOCTL_DBG(xe, obj_offset &&
+				 (is_null || is_system_allocator)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 is_null) ||
+				 (is_null || is_system_allocator)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
-				 !is_null) ||
+				 !is_null && !is_system_allocator) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
@@ -2878,7 +2909,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
+	err = vm_bind_ioctl_check_args(xe,xef, args, &bind_ops, &vm);
 	if (err)
 		return err;
 
@@ -2895,12 +2926,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_DBG(xe, !vm)) {
-		err = -EINVAL;
-		goto put_exec_queue;
-	}
-
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
@@ -3151,6 +3176,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	int ret;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
+	xe_assert(xe, !xe_vma_is_system_allocator(vma));
 	trace_xe_vma_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
@@ -3215,8 +3241,9 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 		bool is_userptr = xe_vma_is_userptr(vma);
 		bool is_null = xe_vma_is_null(vma);
+		bool is_system_allocator = xe_vma_is_system_allocator(vma);
 
-		if (is_null) {
+		if (is_null || is_system_allocator) {
 			addr = 0;
 		} else if (is_userptr) {
 			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
@@ -3235,7 +3262,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
 			   xe_vma_start(vma), xe_vma_end(vma) - 1,
 			   xe_vma_size(vma),
-			   addr, is_null ? "NULL" : is_userptr ? "USR" :
+			   addr, is_system_allocator ? "SYSTEM ALLOCATOR" :
+			   is_null ? "NULL" : is_userptr ? "USR" :
 			   is_vram ? "VRAM" : "SYS");
 	}
 	up_read(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 492237b60341..6e5470a409fc 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -150,6 +150,11 @@ static inline bool xe_vma_is_null(struct xe_vma *vma)
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
 }
 
+static inline bool xe_vma_is_system_allocator(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
+}
+
 static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !xe_vma_bo(vma);
@@ -157,7 +162,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
-	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
+		!xe_vma_is_system_allocator(vma);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2bb76adf66a1..e5d12bf4cf87 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -45,6 +45,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 10)
+#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 11)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -141,6 +142,8 @@ struct xe_vma_op_map {
 	bool immediate;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @is_system_allocator: is system allocator binding */
+	bool is_system_allocator;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2fc19177d2b0..50ab31d59fe2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -869,6 +869,12 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR - When the system allocator flag is
+ *    set, no mappings are created rather the range is reserved for system
+ *    allocations which will be populated on GPU page faults. Only valid on VMs
+ *    with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The system allocator flag are
+ *    only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO handle MBZ, and
+ *    the BO offset MBZ.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -921,7 +927,9 @@ struct drm_xe_vm_bind_op {
 	 * on the @pat_index. For such mappings there is no actual memory being
 	 * mapped (the address in the PTE is invalid), so the various PAT memory
 	 * attributes likely do not apply.  Simply leaving as zero is one
-	 * option (still a valid pat_index).
+	 * option (still a valid pat_index). Same applies to
+	 * DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR bindings as for such mapping
+	 * there is no actual memory being mapped.
 	 */
 	__u16 pat_index;
 
@@ -955,8 +963,9 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.26.3

