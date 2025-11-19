Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997EFCF258C
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 09:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5BD10E5CA;
	Wed, 19 Nov 2025 09:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaNybqxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB53310E5CA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545752; x=1795081752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GcEYk4Wj0KOcImsMoGMd8K0r1LX+vh1a1UwQfRRdR0E=;
 b=UaNybqxeTag0f3LHwoAliTCqLB66jV8+C8bMYpD9FJV60b61NoL5Xg9E
 rQ99Lkb+eqA3SWzOub+yKd6/fg4QlSVKi+YFbl7HyeRFFDurePfyv1oan
 LlKdCVacliXDyLoO4fBKIP51tiNl5skThM7+IX4ApM59FAwLG8XlgL5II
 e1Rz2byLbdblR6af/L09BJV7GQU4ITruHTB+wW7NFfPO4SnuJxKsI8RWl
 6hn43jMmbcq0jfWaCN2gZukDJSd0V0fVRNJN7TLi5qSIcZwoEZYgG/RHi
 eUMgIf6t+Z25lZP9U8yJOf+Ba2Fl86iAeV6o/XjILv7GoOWVAEkiUoB9m g==;
X-CSE-ConnectionGUID: VqYIjLu2QZyCgftF8phWZA==
X-CSE-MsgGUID: t+JtCuaCSOqmDpst2TkMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76190439"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76190439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:49:12 -0800
X-CSE-ConnectionGUID: p8eE4AXSTAurAwGT9I95vA==
X-CSE-MsgGUID: wQzuFda7S4aM9i+WFpnIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195317212"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2025 01:49:09 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com,
	matthew.auld@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.mrozek@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v6 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Date: Wed, 19 Nov 2025 15:49:08 +0530
Message-ID: <20251119101904.2456979-8-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119101904.2456979-5-nitin.r.gote@intel.com>
References: <20251119101904.2456979-5-nitin.r.gote@intel.com>
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
index b0bd31d14bb9..2b1b1c436595 100644
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
index 911d5b90461a..a72c789c7b6b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -309,6 +309,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
+int xe_bo_decompress(struct xe_bo *bo);
+
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
 	return PAGE_ALIGN(xe_bo_size(bo));
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c..426847d365ad 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2302,6 +2302,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
 			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2838,7 +2839,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool request_decompress)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2851,6 +2852,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &&
 					     res_evict, exec);
+
+		if (err)
+			return err;
+
+		if (request_decompress)
+			err = xe_bo_decompress(bo);
 	}
 
 	return err;
@@ -2938,7 +2945,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    op->map.immediate,
+						    op->map.request_decompress);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -2947,13 +2955,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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
@@ -2962,7 +2970,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -2977,7 +2985,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3299,7 +3307,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
 	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
-	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
+	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3357,6 +3366,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
+		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -3391,7 +3401,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
@@ -3431,6 +3443,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
index ccd6cc090309..f4962ca0df09 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -346,6 +346,8 @@ struct xe_vma_op_map {
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

