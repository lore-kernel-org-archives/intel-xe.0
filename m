Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C908CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 10:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D65B10E774;
	Wed, 15 Oct 2025 10:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LO2gIv2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341110E773
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760523450; x=1792059450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R58tBjMnwpegYaMGjpke7QBDc6pFKIa5QxFovSInPUc=;
 b=LO2gIv2pYvZeMgKZO6IABcS/5kwI1ofJFLPmPhKf5gwis4OmB+AAB9BJ
 VW/XM0IiGiDOq/kkPlRLbXTN1bpbWAkB9DxXagg/B2S1T9Cp5h0yTH5QJ
 Cme9Rxm3AJlmukITT3dtH0lnwX4kYSgvGLrTvPPlUs2zipeNYK99uLQdA
 5XgME9J0rrZsheKqYH9oGT+M84wc0+17DNT92bpmq9eVzTHePa7AtZF+4
 e9F7CeAnGOg9ZtvNnGhJJGjQvB7GImJTK/9XmOqttfk4JssZNeN2P1KTl
 YR346wS8jz8SD/Rd/z/hvOmi0AH6LzIdIIhRQRCKqejNVLQhxWxWZAFji Q==;
X-CSE-ConnectionGUID: 3N5/pe6pSK+Ab43r5pQyQw==
X-CSE-MsgGUID: t7mu1Q/RSKuO4hQf7VrLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62733050"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62733050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:17:30 -0700
X-CSE-ConnectionGUID: tAtG522XQui/K5ixPGzSyQ==
X-CSE-MsgGUID: xFQzVdUUTWS9MQANMGu/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="187437782"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2025 03:17:28 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v3 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Date: Wed, 15 Oct 2025 16:17:09 +0530
Message-Id: <20251015104709.44476-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015104709.44476-1-nitin.r.gote@intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
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
  - Only meaningful on devices with flat CCS and the required XE2+
    otherwise return -EOPNOTSUPP.
  - Use XE_IOCTL_DBG for uAPI sanity checks.
- Implement xe_bo_schedule_decompress():
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
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Matt,
Thank you for the review.
Regarding multiple bool params in vma_lock_and_validate(),
I will clean it in new patch.

-Nitin

 drivers/gpu/drm/xe/xe_bo.c       | 50 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 4 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..7438c01c1895 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3307,6 +3307,56 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+/**
+ * xe_bo_decompress - schedule in-place decompress and install fence
+ * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
+ * @vm:   VM containing the VMA range
+ *
+ * Schedules an in-place resolve via the migrate layer and installs the
+ * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
+ * Returns 0 on success, negative errno on error.
+ */
+int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
+	struct dma_fence *decomp_fence = NULL;
+	int err = 0;
+	struct ttm_operation_ctx op_ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
+	};
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
index 353d607d301d..472c9de889c9 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -308,6 +308,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
+int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
+
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
 	return PAGE_ALIGN(xe_bo_size(bo));
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 08bc55bd91d7..8bb2a3259d56 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2305,6 +2305,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.is_cpu_addr_mirror = flags &
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
@@ -2859,7 +2860,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool request_decompress)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2872,6 +2873,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &&
 					     res_evict, exec);
+
+		if (err)
+			return err;
+
+		if (request_decompress)
+			err = xe_bo_decompress(bo, vm);
 	}
 
 	return err;
@@ -2959,7 +2966,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    op->map.immediate,
+						    op->map.request_decompress);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -2968,13 +2976,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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
@@ -2983,7 +2991,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -2998,7 +3006,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3306,7 +3314,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
-	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3364,6 +3373,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
+		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -3398,7 +3408,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
 						    is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 (is_null || is_cpu_addr_mirror)) ||
+				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
+		    XE_IOCTL_DBG(xe, is_decompress &&
+				 pat_index != xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null && !is_cpu_addr_mirror) ||
@@ -3418,8 +3430,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
@@ -3434,6 +3446,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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

