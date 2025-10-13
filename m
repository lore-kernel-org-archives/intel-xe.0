Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F2CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 14:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AF810E45E;
	Mon, 13 Oct 2025 14:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlEYTkJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979010E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760365177; x=1791901177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xgnnphTB380uO8C49nCnKqamJCTrwtgNkUFix5Oju2E=;
 b=VlEYTkJVyPprKfIYyiK/H8kNLgQKHVLnbl5jYQv8vUELU3jv9K6M3tqv
 Ytjro1VJIVx5WyAicToXsLjP8YpflZ3vY4hiR/MtrGnJcjcck46wIxk1U
 WelHWlgnHWlO1pjeRFw+VZPKSJ3sal+oCCFnC5OCGec+2BTydVu9NYY6h
 EcM5+l7JRzCUSQatktSMW9yHKLYT4rBy0BjGJxs5UGeWBP01kAucjvXM8
 UW3I61fH6Bviqu2JMhXQxrIrmti+yvyaeA/slHnVzC9pS72wx/+0dAte3
 b1QnB/NjQHxWe9R8929MYf4O4cCeU21XJm+H0iq7TDG7eKqSsUwe5qb/j A==;
X-CSE-ConnectionGUID: Y6XFAS3ASMOUXRTJBvSE+w==
X-CSE-MsgGUID: Od54p4IWSz+eb1wXrgbCWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73185545"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73185545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:19:37 -0700
X-CSE-ConnectionGUID: zBeBiTqeT7u+HiJF4nilTQ==
X-CSE-MsgGUID: /A8vmbaeR0Wdnue1lVmTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="218726170"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa001.jf.intel.com with ESMTP; 13 Oct 2025 07:19:35 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v2 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Date: Mon, 13 Oct 2025 20:18:50 +0530
Message-Id: <20251013144850.757438-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013144850.757438-1-nitin.r.gote@intel.com>
References: <20251013144850.757438-1-nitin.r.gote@intel.com>
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

Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.

Key changes:
- Parse and record per-op intent (op->map.request_decompress) when the
  DECOMPRESS flag is present.
- Validate DECOMPRESS preconditions in the ioctl path:
  - Only valid for MAP ops.
  - The provided pat_index must select the device's "no-compression" PAT.
  - Only meaningful for VRAM-backed BOs on devices with flat CCS and the
    required XE2+ hardware (reject with -EOPNOTSUPP otherwise).
  - Use XE_IOCTL_DBG for uAPI sanity checks.
- Implement xe_bo_schedule_decompress():
  - Locate and invalidate any overlapping VMA.
  - Schedule an in-place resolve via the migrate/resolve path.
  - Install the resulting dma_fence into the BO's kernel reservation
    (DMA_RESV_USAGE_KERNEL).
- Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
  decompression when request_decompress is set.
- Handle fault-mode VMs by performing decompression synchronously during
  the bind process, ensuring that the resolve is completed before the bind
  finishes.

This schedules an in-place GPU resolve (xe_migrate_resolve) for
decompression.

v2:
   - Move decompression work out of vm_bind ioctl. (Matt)
   - Put that work in a small helper at the BO/migrate layer invoke it
     from vma_lock_and_validate which already runs under drm_exec.
   - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 53 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  3 ++
 drivers/gpu/drm/xe/xe_vm.c       | 48 ++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 4 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..e9b28c8462c6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3307,6 +3307,59 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+/**
+ * xe_bo_schedule_decompress - schedule in-place decompress and install fence
+ * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
+ * @vm:   VM containing the VMA range
+ * @addr: start GPU virtual address of the range
+ * @range:length in bytes of the range
+ *
+ * Schedules an in-place resolve via the migrate layer and installs the
+ * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
+ * Returns 0 on success, negative errno on error.
+ */
+int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,
+			      u64 addr, u64 range)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
+	struct xe_vma *existing_vma = NULL;
+	struct dma_fence *decomp_fence = NULL;
+	int err = 0;
+
+	/* Validate buffer is VRAM-backed  */
+	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type)) {
+		drm_err(&vm->xe->drm, "Decompression requires VRAM buffer\n");
+		return -EINVAL;
+	}
+
+	/* Find overlapping VMA */
+	existing_vma = xe_vm_find_overlapping_vma(vm, addr, range);
+	if (existing_vma) {
+		drm_dbg(&vm->xe->drm,
+			"Found overlapping VMA - automatic invalidation will occur\n");
+
+		/* Invalidate the VMA */
+		err = xe_vm_invalidate_vma(existing_vma);
+		if (err)
+			return err;
+	}
+
+	/* Schedule the in-place decompression */
+	decomp_fence = xe_migrate_resolve(tile->migrate,
+					  bo, bo,
+					  bo->ttm.resource, bo->ttm.resource,
+					  false);
+
+	if (IS_ERR(decomp_fence))
+		return PTR_ERR(decomp_fence);
+
+	/* Install kernel-usage fence */
+	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERNEL);
+	dma_fence_put(decomp_fence);
+
+	return 0;
+}
+
 /**
  * xe_bo_lock() - Lock the buffer object's dma_resv object
  * @bo: The struct xe_bo whose lock is to be taken
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 353d607d301d..b5dd8630cde5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -308,6 +308,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
+int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,
+			      u64 addr, u64 range);
+
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
 	return PAGE_ALIGN(xe_bo_size(bo));
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 179758ca7cb8..32bc6d899c36 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2304,6 +2304,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.is_cpu_addr_mirror = flags &
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2858,7 +2859,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool request_decompress)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2871,6 +2872,17 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &&
 					     res_evict, exec);
+
+		if (err)
+			return err;
+
+		if (request_decompress) {
+			int ret = xe_bo_schedule_decompress(bo, vm,
+							    xe_vma_start(vma),
+							    xe_vma_size(vma));
+			if (ret)
+				return ret;
+		}
 	}
 
 	return err;
@@ -2958,7 +2970,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    op->map.immediate,
+						    op->map.request_decompress);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -2967,13 +2980,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && op->remap.prev)
 			err = vma_lock_and_validate(exec, op->remap.prev,
-						    res_evict, true);
+						    res_evict, true, false);
 		if (!err && op->remap.next)
 			err = vma_lock_and_validate(exec, op->remap.next,
-						    res_evict, true);
+						    res_evict, true, false);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
@@ -2982,7 +2995,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -2997,7 +3010,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3305,7 +3318,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
-	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3322,7 +3336,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 {
 	int err;
 	int i;
-
 	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
@@ -3363,9 +3376,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
+		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
-
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
 				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
@@ -3397,7 +3410,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
 						    is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 (is_null || is_cpu_addr_mirror)) ||
+				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
+		    XE_IOCTL_DBG(xe, is_decompress &&
+				 pat_index == xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null && !is_cpu_addr_mirror) ||
@@ -3417,8 +3432,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
-				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
+		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
@@ -3433,6 +3448,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
+				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {
+			err = -EOPNOTSUPP;
+			goto free_bind_ops;
+		}
 	}
 
 	return 0;
@@ -3686,7 +3707,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
-
 		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 413353e1c225..7d652d17b0dc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -357,6 +357,8 @@ struct xe_vma_op_map {
 	bool dumpable;
 	/** @invalidate: invalidate the VMA before bind */
 	bool invalidate_on_bind;
+	/** @request_decompress: schedule decompression for GPU map */
+	bool request_decompress;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.25.1

