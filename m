Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C472DCA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8801110E8C9;
	Thu, 18 Sep 2025 13:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWqOa0O9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11110E8C9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203803; x=1789739803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=06qimScF1OWru0PCRAw7EpzMGuKbEsxOAOToPeNffME=;
 b=fWqOa0O989T6dm+mUU9l3FnVRS6HKNRyNvsVtajHrfWwBW/UYMd3o5ud
 SFUmQJQj0px9XeuTX9cuSvtjS9uxtxbnvfXobtfGYySxOsIz3EFSVuO+k
 hK4AIkQa4yzQsKPOwH3Wlx/CAdHH4tSICYYM7Yxc+jGgLuuI5z8URsN2t
 BiuyVbO7PkgSEzwkKLObdyDzjmxgo1qax4Ieir39cuqVkXHM5qMSph5fU
 J/+m4B5BQVWX9KCGTr2zdzlOXMdIZBz/bniaHvyXnjQBLav66ZIv+b7EP
 Gvw6fIA6eTbtpEWynl5qr62oeeRr92RnWx4eKz940pGKM1Msr8bEIl9aL Q==;
X-CSE-ConnectionGUID: iKAdnfNmS4mbwcXCOEfrTA==
X-CSE-MsgGUID: xxfT/syeSIOC7mldsSq/TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337086"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337086"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:42 -0700
X-CSE-ConnectionGUID: u1x+kDmOQhiRPW0oRUYlrw==
X-CSE-MsgGUID: CdSyZteURz2h68JO34jiKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828074"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:41 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 4/5] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Date: Thu, 18 Sep 2025 19:55:28 +0530
Message-Id: <20250918142529.608432-5-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918142529.608432-1-nitin.r.gote@intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
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

- Validate decompression preconditions (VRAM buffer, flat CCS support,
  XE2+ hardware, and an uncompressed PAT index).
- Mark the BO with DRM_XE_VM_BIND_FLAG_DECOMPRESS.
- Invalidate any overlapping VMA when required.
- Use helper xe_vm_exec_lock_vm_and_bo(..., wait_bookkeep=true)
  to atomically acquire the VM reservation and optional BO reservation and
  handle BOOKKEEP wait/retry.
  * Drop vm->lock before calling the helper.
  * Do VMA invalidation or schedule the migrate resolve while reservations
    are held.
  * Call drm_exec_fini() to release reservations, then wait on the
    migrate/decompression fence without holding reservations and
    re-acquire vm->lock to continue.
- Defer decompression when the VM is in fault mode.

This schedules an in-place GPU resolve (xe_migrate_resolve) for
decompression and waits for completion before proceeding with the bind.
The change centralises drm_exec + BOOKKEEP retry logic and avoids
sleeping while holding resv locks.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 134 +++++++++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fae88c4c981e..cdeb7995eab1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3266,7 +3266,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
-	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3324,6 +3325,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		bool is_cpu_addr_mirror = flags &
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
+		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -3361,7 +3363,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 (is_null || is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
-				 !is_null && !is_cpu_addr_mirror) ||
+				 is_decompress && !is_null && !is_cpu_addr_mirror) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
@@ -3378,8 +3380,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
@@ -3698,6 +3700,130 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
+		bool do_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+
+		/* Handle decompression process */
+		if (do_decompress && bos[i]) {
+			struct xe_vma *existing_vma;
+			struct dma_fence *decomp_fence;
+			struct xe_tile *tile = xe_device_get_root_tile(xe);
+
+			bos[i]->flags |= DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+
+			/* Validate VRAM buffer suitable for decompression or not */
+			if (!mem_type_is_vram(bos[i]->ttm.resource->mem_type)) {
+				drm_err(&vm->xe->drm,
+					"Decompression requires VRAM buffer\n");
+				err = -EINVAL;
+				goto unwind_ops;
+			}
+
+			/* Check hardware support for decompression */
+			if (!xe_device_has_flat_ccs(vm->xe)) {
+				drm_err(&vm->xe->drm,
+					"Decompression requires flat CCS support\n");
+				err = -EOPNOTSUPP;
+				goto unwind_ops;
+			}
+
+			if (GRAPHICS_VER(vm->xe) < 20) {
+				drm_err(&vm->xe->drm,
+					"Decompression requires XE2+ hardware\n");
+				err = -EOPNOTSUPP;
+				goto unwind_ops;
+			}
+
+			/* Validate that user provided an uncompressed PAT index */
+			if (pat_index == vm->xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) {
+				drm_err(&vm->xe->drm,
+					"Decompression requires uncompressed PAT index\n");
+				err = -EINVAL;
+				goto unwind_ops;
+			}
+
+			/* Invalidate VMA so GPU mappings are destroyed */
+			existing_vma = xe_vm_find_overlapping_vma(vm, addr, range);
+			if (existing_vma) {
+				struct xe_bo *existing_bo = xe_vma_bo(existing_vma);
+
+				drm_dbg(&vm->xe->drm,
+					"Found overlapping VMA - automatic invalidation will occur\n");
+
+				/* Drop vm->lock and atomically take VM+BO resvs via drm_exec */
+				up_write(&vm->lock);
+				struct drm_exec exec;
+
+				err = xe_vm_exec_lock_vm_and_bo(vm, existing_bo, &exec, true, true);
+				if (err) {
+					down_write(&vm->lock);
+					goto put_obj;
+				}
+
+				/* Invalidate the VMA while reservations are held. */
+				err = xe_vm_invalidate_vma(existing_vma);
+
+				/* release reservations (drm_exec_fini releases VM+BO resvs) */
+				drm_exec_fini(&exec);
+
+				/* Re-acquire vm->lock */
+				down_write(&vm->lock);
+
+				if (err)
+					goto put_obj;
+			}
+
+			/* Handle decompression differently for fault mode */
+			if (xe_vm_in_fault_mode(vm)) {
+				drm_dbg(&vm->xe->drm,
+					"Deferring decompression for fault mode\n");
+				/* Skip immediate decompression */
+				goto unwind_ops;
+			}
+
+			/* Drop vm->lock and atomically acquire VM+BO reservations via drm_exec.
+			 * Hold the reservations while we wait for BOOKKEEP and schedule the
+			 * in-place resolve. Release the reservations (drm_exec_fini) before
+			 * waiting on the migrate fence so we don't hold resv locks while
+			 * sleeping.
+			 */
+			up_write(&vm->lock);
+			struct drm_exec exec;
+
+			err = xe_vm_exec_lock_vm_and_bo(vm, bos[i], &exec, true, true);
+			if (err) {
+				drm_err(&vm->xe->drm,
+					"Failed to acquire reservations for decompression: %d\n",
+					err);
+				down_write(&vm->lock);
+				goto unwind_ops;
+			}
+
+			/* With exec holding reservations, schedule the in-place decompression */
+			decomp_fence = xe_migrate_resolve(tile->migrate,
+							  bos[i], bos[i],
+							  bos[i]->ttm.resource,
+							  bos[i]->ttm.resource,
+							  false);
+
+			/* release the reservations so scheduler can observe BO fences */
+			drm_exec_fini(&exec);
+
+			if (IS_ERR(decomp_fence)) {
+				err = PTR_ERR(decomp_fence);
+				drm_err(&vm->xe->drm,
+					"In-place decompression failed: %d\n", err);
+				/* vm->lock must be held for unwind_ops cleanup */
+				down_write(&vm->lock);
+				goto unwind_ops;
+			}
+
+			/* Wait for in-place decompression to complete without holding vm->lock */
+			dma_fence_wait(decomp_fence, false);
+			dma_fence_put(decomp_fence);
+
+			/* Now re-acquire vm->lock and continue */
+			down_write(&vm->lock);
+		}
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
-- 
2.25.1

