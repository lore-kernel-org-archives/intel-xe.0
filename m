Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE7CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B655C10E892;
	Wed, 15 Oct 2025 17:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9Lbvfv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0A10E892
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760548068; x=1792084068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LJElteA7PjLTkp9ei7VAWM/D0e/sVG9wJOdvFJgnr8Q=;
 b=B9Lbvfv93Lk2yy7qYURwq+8gkXN/sLst1+wynX48cYOOFxytBxsWnzUf
 JZCRE7tK046VXC3fc7sYfLbr9gu8vM+P3lhGvmZuRSox+oimAPEKRlSaA
 RRk0ilVQuHzHKhspX7uaHlWhpbmt5wtjsksvIrWzVWPE8q/QOd4LUexWX
 GzbQUd8jdaR2gNvT5o4Kyu2GVd6aR8sw05RQgAKKyAoiHkzTebAmMTB0E
 OIf9SthcnloM5pOxfKL3LI6KJ5+PtqBPS4kiKzmwBWskJ14QRb25Vn4gF
 Xsee/kYqPMAhf6iWv3q/aUsHVD8UD9Lb+WDUEAfmt+HkOzrB37Zdt/FNi w==;
X-CSE-ConnectionGUID: JV+ZAgtSRP+rtXRNAmLVsw==
X-CSE-MsgGUID: /DHEhgtjSMSve/AZdFJVSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73842251"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="73842251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:47 -0700
X-CSE-ConnectionGUID: xFd9pYFkSUSQ71NYWfHhVw==
X-CSE-MsgGUID: 4l7HJ8mSTPqUrwfzitwfpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182175605"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.73])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Retain vma flags when recreating and splitting
 vmas for madvise
Date: Wed, 15 Oct 2025 19:07:25 +0200
Message-ID: <20251015170726.178685-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

When splitting and restoring vmas for madvise, we only copied the
XE_VMA_SYSTEM_ALLOCATOR flag. That meant we lost flags for read_only,
dumpable and sparse (in case anyone would call madvise for the latter).

Instead, define a mask of relevant flags and ensure all are replicated,
To simplify this and make the code a bit less fragile, remove the
conversion to VMA_CREATE flags and instead just pass around the
gpuva flags after initial conversion from user-space.

Fixes: a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM garbage collector")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  4 +-
 drivers/gpu/drm/xe/xe_vm.c       | 86 +++++++++++---------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  9 +---
 3 files changed, 32 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e39da95f3a05..d22fd1ccc0ba 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2022,7 +2022,7 @@ static int op_prepare(struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		if ((!op->map.immediate && xe_vm_in_fault_mode(vm) &&
 		     !op->map.invalidate_on_bind) ||
-		    op->map.is_cpu_addr_mirror)
+		    (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
 			break;
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
@@ -2252,7 +2252,7 @@ static void op_commit(struct xe_vm *vm,
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
-		    op->map.is_cpu_addr_mirror)
+		    (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
 			break;
 
 		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 08bc55bd91d7..c3230d3f9e6f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -642,6 +642,12 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 			vops->pt_update_ops[i].num_ops += inc_val;
 }
 
+#define XE_VMA_CREATE_MASK (		    \
+	XE_VMA_READ_ONLY |		    \
+	XE_VMA_DUMPABLE |		    \
+	XE_VMA_SYSTEM_ALLOCATOR |           \
+	DRM_GPUVA_SPARSE)
+
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
 {
@@ -654,8 +660,7 @@ static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 	op->base.map.gem.offset = vma->gpuva.gem.offset;
 	op->map.vma = vma;
 	op->map.immediate = true;
-	op->map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
-	op->map.is_null = xe_vma_is_null(vma);
+	op->map.vma_flags = vma->gpuva.flags & XE_VMA_CREATE_MASK;
 }
 
 static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
@@ -958,11 +963,6 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
-#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
-#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
-#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
-#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
-
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
@@ -973,11 +973,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	struct xe_vma *vma;
 	struct xe_tile *tile;
 	u8 id;
-	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
-	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
-	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
-	bool is_cpu_addr_mirror =
-		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
+	bool is_null = (flags & DRM_GPUVA_SPARSE);
+	bool is_cpu_addr_mirror = (flags & XE_VMA_SYSTEM_ALLOCATOR);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -998,10 +995,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
-		if (is_cpu_addr_mirror)
-			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
-		if (is_null)
-			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 		if (bo)
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
@@ -1012,10 +1005,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->gpuva.vm = &vm->gpuvm;
 	vma->gpuva.va.addr = start;
 	vma->gpuva.va.range = end - start + 1;
-	if (read_only)
-		vma->gpuva.flags |= XE_VMA_READ_ONLY;
-	if (dumpable)
-		vma->gpuva.flags |= XE_VMA_DUMPABLE;
+	vma->gpuva.flags = flags;
 
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
@@ -2299,12 +2289,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.immediate =
 				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
-			op->map.read_only =
-				flags & DRM_XE_VM_BIND_FLAG_READONLY;
-			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
-			op->map.is_cpu_addr_mirror = flags &
-				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
-			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			if (flags & DRM_XE_VM_BIND_FLAG_READONLY)
+				op->map.vma_flags |= XE_VMA_READ_ONLY;
+			if (flags & DRM_XE_VM_BIND_FLAG_NULL)
+				op->map.vma_flags |= DRM_GPUVA_SPARSE;
+			if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
+			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
+				op->map.vma_flags |= XE_VMA_DUMPABLE;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2617,14 +2609,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				.pat_index = op->map.pat_index,
 			};
 
-			flags |= op->map.read_only ?
-				VMA_CREATE_FLAG_READ_ONLY : 0;
-			flags |= op->map.is_null ?
-				VMA_CREATE_FLAG_IS_NULL : 0;
-			flags |= op->map.dumpable ?
-				VMA_CREATE_FLAG_DUMPABLE : 0;
-			flags |= op->map.is_cpu_addr_mirror ?
-				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
+			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
 
 			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
@@ -2633,7 +2618,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			op->map.vma = vma;
 			if (((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
-			     !op->map.is_cpu_addr_mirror) ||
+			     !(op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR)) ||
 			    op->map.invalidate_on_bind)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask, 1);
@@ -2664,18 +2649,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
 
-			flags |= op->base.remap.unmap->va->flags &
-				XE_VMA_READ_ONLY ?
-				VMA_CREATE_FLAG_READ_ONLY : 0;
-			flags |= op->base.remap.unmap->va->flags &
-				DRM_GPUVA_SPARSE ?
-				VMA_CREATE_FLAG_IS_NULL : 0;
-			flags |= op->base.remap.unmap->va->flags &
-				XE_VMA_DUMPABLE ?
-				VMA_CREATE_FLAG_DUMPABLE : 0;
-			flags |= xe_vma_is_cpu_addr_mirror(old) ?
-				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
-
+			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      &old->attr, flags);
@@ -4239,7 +4213,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
 	struct drm_gpuva_op *__op;
-	bool is_cpu_addr_mirror = false;
+	unsigned int vma_flags = 0;
 	bool remap_op = false;
 	struct xe_vma_mem_attr tmp_attr;
 	u16 default_pat;
@@ -4269,15 +4243,17 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				vma = gpuva_to_vma(op->base.unmap.va);
 				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
 				default_pat = vma->attr.default_pat_index;
+				vma_flags = vma->gpuva.flags;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
 				vma = gpuva_to_vma(op->base.remap.unmap->va);
 				default_pat = vma->attr.default_pat_index;
+				vma_flags = vma->gpuva.flags;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
-				op->map.is_cpu_addr_mirror = true;
+				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
 				op->map.pat_index = default_pat;
 			}
 		} else {
@@ -4286,11 +4262,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				xe_assert(vm->xe, !remap_op);
 				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
 				remap_op = true;
-
-				if (xe_vma_is_cpu_addr_mirror(vma))
-					is_cpu_addr_mirror = true;
-				else
-					is_cpu_addr_mirror = false;
+				vma_flags = vma->gpuva.flags;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_MAP) {
@@ -4299,10 +4271,10 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 				/*
 				 * In case of madvise ops DRM_GPUVA_OP_MAP is
 				 * always after DRM_GPUVA_OP_REMAP, so ensure
-				 * we assign op->map.is_cpu_addr_mirror true
-				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+				 * to propagate the flags from the vma we're
+				 * unmapping.
 				 */
-				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
 			}
 		}
 		print_op(vm->xe, __op);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 413353e1c225..a3b422b27ae8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -345,17 +345,10 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	unsigned int vma_flags;
 	/** @immediate: Immediate bind */
 	bool immediate;
 	/** @read_only: Read only */
-	bool read_only;
-	/** @is_null: is NULL binding */
-	bool is_null;
-	/** @is_cpu_addr_mirror: is CPU address mirror binding */
-	bool is_cpu_addr_mirror;
-	/** @dumpable: whether BO is dumped on GPU hang */
-	bool dumpable;
-	/** @invalidate: invalidate the VMA before bind */
 	bool invalidate_on_bind;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
-- 
2.51.0

