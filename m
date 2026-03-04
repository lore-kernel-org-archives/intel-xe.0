Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C7DEB7EDA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 12:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3215E10E9E9;
	Wed,  4 Mar 2026 12:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtRC1nWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01F10E9F5
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626139; x=1804162139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gPhX8/IgEsOt6NY1adH89GIq+kU5JzMXKebj3K/l9o=;
 b=WtRC1nWfBvL2Konty2HLNq0kre8Nc/X3Zk+y6prEEA6gYgXkH4pm+iO2
 EOOSnL95/kxrWZbmSlTCSHytwXKfPQ2gfU/s/DNiN9xNlV0uYxnOTcdF2
 KxwqKjcIKPklCksR03WNYa0FnKBxjts8oU31fdNGW8lSkI5vf2hOoYYnB
 +gSoSZofycsmeJc94odci3YzytG7w9OEfA1XZfZK/SKXfcgqkUJ3JJ6El
 vR4FX5aG9EXbNOhBJQIHHK14tWDLsG4Q5vcsNEzCkg88Hazgff4mNK/d+
 JVF42SDa64PsKvOzn5prI/vV193KmpY/DBUetJRhW+H6RGLJ+2ROg0pai w==;
X-CSE-ConnectionGUID: IQvtR7aWS5+GCLUEzLRT6A==
X-CSE-MsgGUID: Y7j8J49bQAWrxP5qrAxHVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96300617"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96300617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:04:53 -0800
X-CSE-ConnectionGUID: 4pjuwHihSgKImlM2eYrErA==
X-CSE-MsgGUID: MLyE4P8bSkiuk3sqkypLxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="244992788"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 04:04:47 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com, michal.mrozek@intel.com,
 thomas.hellstrom@linux.intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v7 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Date: Wed,  4 Mar 2026 18:08:02 +0530
Message-ID: <20260304123758.3050386-8-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304123758.3050386-5-nitin.r.gote@intel.com>
References: <20260304123758.3050386-5-nitin.r.gote@intel.com>
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

Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.

Key changes:
- Parse and record per-op intent (op->map.request_decompress) when the
  DECOMPRESS flag is present.
- Use xe_pat_index_get_comp_en() helper to check if a PAT index
  has compression enabled via the XE2_COMP_EN bit.
- Validate DECOMPRESS preconditions in the ioctl path:
  - Only valid for MAP ops.
  - The provided pat_index must select the device's "no-compression" PAT.
  - Only meaningful on devices with flat CCS and the required XE2+
    otherwise return -EOPNOTSUPP.
  - Use XE_IOCTL_DBG for uAPI sanity checks.
- Implement xe_bo_decompress():
  For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
  schedule xe_migrate_resolve(), and attach the returned fence
  with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
- Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
  decompression when request_decompress is set.
- Handle fault-mode VMs by performing decompression synchronously during
  the bind process, ensuring that the resolve is completed before the bind
  finishes.

This schedules an in-place GPU resolve (xe_migrate_resolve) for
decompression.

Compute PR: https://github.com/intel/compute-runtime/pull/898
IGT PR: https://patchwork.freedesktop.org/series/157553/

v7: Rebase on latest drm-tip and add compute and igt pr info

v6: (Matt Auld)
   - Rebase as xe_pat_index_get_comp_en() is added in separate
     patch
   - Drop vm param from xe_bo_decompress(), instead of it
     extract tile from bo
   - Reject decompression on igpu instead of silent skipping
     to avoid any failure on Xe2+igpu as xe_device_has_flat_ccs()
     can sometimes be false on igpu due some setting in the BIOS
     to turn off compression on igpu.
   - Nits

v5: (Matt)
   - Correct the condition check of xe_pat_index_get_comp_en

v4: (Matt)
   - Introduce xe_pat_index_get_comp_en(), which checks
     XE2_COMP_EN for the pat_index
   - .interruptible should be true, everything else false

v3: (Matt)
   - s/xe_bo_schedule_decompress/xe_bo_decompress
   - skip the decrompress step if the BO isn't in VRAM
   - start/size not required in xe_bo_schedule_decompress
   - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
     with respect to invalidation.
   - Nits

v2:
   - Move decompression work out of vm_bind ioctl. (Matt)
   - Put that work in a small helper at the BO/migrate layer invoke it
     from vma_lock_and_validate which already runs under drm_exec.
   - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 55 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       | 37 +++++++++++++++------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 4 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8ff193600443..22179b2df85c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3330,6 +3330,61 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+/**
+ * xe_bo_decompress - schedule in-place decompress and install fence
+ * @bo: buffer object (caller should hold drm_exec reservations for VM+BO)
+ *
+ * Schedules an in-place resolve via the migrate layer and installs the
+ * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
+ * In preempt fence mode, this operation interrupts hardware execution
+ * which is expensive. Page fault mode is recommended for better performance.
+ *
+ * The resolve path only runs for VRAM-backed buffers (currently dGPU-only);
+ * iGPU/system-memory objects fail the resource check and bypass the resolve.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int xe_bo_decompress(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct dma_fence *decomp_fence = NULL;
+	struct ttm_operation_ctx op_ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+		.gfp_retry_mayfail = false,
+	};
+	int err = 0;
+
+	/* Silently skip decompression for non-VRAM buffers */
+	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type))
+		return 0;
+
+	/* Notify before scheduling resolve */
+	err = xe_bo_move_notify(bo, &op_ctx);
+	if (err)
+		return err;
+
+	/* Reserve fence slot before scheduling */
+	err = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+	if (err)
+		return err;
+
+	/* Schedule the in-place decompression */
+	decomp_fence = xe_migrate_resolve(tile->migrate,
+					  bo,
+					  bo->ttm.resource);
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
index c914ab719f20..2cbac16f7db7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -312,6 +312,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
+int xe_bo_decompress(struct xe_bo *bo);
+
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
 	return PAGE_ALIGN(xe_bo_size(bo));
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 548b0769b3ef..4be666bd68db 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2362,6 +2362,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
 			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2902,7 +2903,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool request_decompress)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2915,6 +2916,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = xe_bo_validate(bo, vm,
 					     xe_vm_allow_vm_eviction(vm) &&
 					     res_evict, exec);
+
+		if (err)
+			return err;
+
+		if (request_decompress)
+			err = xe_bo_decompress(bo);
 	}
 
 	return err;
@@ -3009,7 +3016,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    op->map.immediate,
+						    op->map.request_decompress);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -3018,13 +3026,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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
@@ -3033,7 +3041,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -3048,7 +3056,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3370,7 +3378,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
 	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
-	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
+	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3430,6 +3439,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
+		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 		bool comp_en;
@@ -3466,7 +3476,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
 						    is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 (is_null || is_cpu_addr_mirror)) ||
+				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
+		    XE_IOCTL_DBG(xe, is_decompress &&
+				 xe_pat_index_get_comp_en(xe, pat_index)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null && !is_cpu_addr_mirror) ||
@@ -3508,6 +3520,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
+				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20) ||
+				      XE_IOCTL_DBG(xe, !IS_DGFX(xe)))) {
+			err = -EOPNOTSUPP;
+			goto free_bind_ops;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1f6f7e30e751..11163a83d6e7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -376,6 +376,8 @@ struct xe_vma_op_map {
 	bool immediate;
 	/** @read_only: Read only */
 	bool invalidate_on_bind;
+	/** @request_decompress: schedule decompression for GPU map */
+	bool request_decompress;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.50.1

