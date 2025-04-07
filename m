Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2440BC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BB810E3F6;
	Mon,  7 Apr 2025 09:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIGcAS1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A948710E3F6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019589; x=1775555589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thTs0R7ihs6jh2k0achhLaBF2c0IpUTxVfpQR49VYhc=;
 b=hIGcAS1MOCvZpzGrpfY3/dMt9d4sgn8CsrRPDYHGiBxPelkmNCK+Es8V
 bkSHZGFGI9Wp+6C6cR/A8XmKZsDpKoDv0FTTLiUvgWS3kH0QBM79nBmUW
 eMjZAqGcebSE2Tk5ni06ZWvgjOLBiHY95ig/vqwWQitkCKR2ws8FTjTQN
 r+cq+s/+WGMRCO8aczogon92dT6Kbp871rBbI+SAP153TrRHsEMkFKhXJ
 AH8xQaP/diXlDSVOjk96XaBCUC4JRphOBpewHIwavN5htLYHMNf9+vMzj
 Gc92Ge+Esz8MVAk4XLFYEBLntAHCxv55LhSP1MN2v9vCLsLpr8oiqRv4F Q==;
X-CSE-ConnectionGUID: hmZzeWkOTsWQL2OBQythdg==
X-CSE-MsgGUID: Et92G4kLRGWROs7uCFs30A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029410"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:08 -0700
X-CSE-ConnectionGUID: 4//59673Si6/Q7OOQlVIAA==
X-CSE-MsgGUID: Ja1NqLxDRkyPZiGYjofVPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778732"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 14/32] drm/xe/svm: Implement prefetch support for SVM ranges
Date: Mon,  7 Apr 2025 15:47:01 +0530
Message-Id: <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

This commit adds prefetch support for SVM ranges, utilizing the
existing ioctl vm_bind functionality to achieve this.

v2: rebase

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c |  61 +++++++++---
 drivers/gpu/drm/xe/xe_vm.c | 185 +++++++++++++++++++++++++++++++++++--
 2 files changed, 222 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de4e3edda758..59dc065fae93 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1458,7 +1458,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
 	struct xe_vma_op *op;
-	int err;
+	int ranges_count;
+	int err, i;
 
 	err = xe_pt_pre_commit(pt_update);
 	if (err)
@@ -1467,20 +1468,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	xe_svm_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = op->map_range.range;
+		struct xe_svm_range *range = NULL;
 
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
-		xe_svm_range_debug(range, "PRE-COMMIT");
-
-		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
+			ranges_count = op->prefetch_range.ranges_count;
+		} else {
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+			ranges_count  = 1;
+		}
 
-		if (!xe_svm_range_pages_valid(range)) {
-			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-			xe_svm_notifier_unlock(vm);
-			return -EAGAIN;
+		for (i = 0; i < ranges_count; i++) {
+			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
+				range = xa_load(&op->prefetch_range.range, i);
+			else
+				range = op->map_range.range;
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				xe_svm_notifier_unlock(vm);
+				return -EAGAIN;
+			}
 		}
 	}
 
@@ -2065,11 +2079,21 @@ static int op_prepare(struct xe_vm *vm,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
-		if (xe_vma_is_cpu_addr_mirror(vma))
-			break;
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			struct xe_svm_range *range;
+			int i;
 
-		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
-		pt_update_ops->wait_vm_kernel = true;
+			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
+				range = xa_load(&op->prefetch_range.range, i);
+				err = bind_range_prepare(vm, tile, pt_update_ops,
+							 vma, range);
+				if (err)
+					return err;
+			}
+		} else {
+			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
+			pt_update_ops->wait_vm_kernel = true;
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_DRIVER:
@@ -2273,9 +2297,16 @@ static void op_commit(struct xe_vm *vm,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
-		if (!xe_vma_is_cpu_addr_mirror(vma))
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {
+				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
+
+				range_present_and_invalidated_tile(vm, range, tile->id);
+			}
+		} else {
 			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
 				       fence2, false);
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_DRIVER:
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57af2c37f927..ffd7ad664921 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -798,10 +798,36 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 }
 ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
 
+static void clean_svm_prefetch_op(struct xe_vma_op *op)
+{
+	struct xe_vma *vma;
+
+	vma = gpuva_to_vma(op->base.prefetch.va);
+
+	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
+		xa_destroy(&op->prefetch_range.range);
+		op->prefetch_range.ranges_count = 0;
+	}
+}
+
+static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
+		return;
+
+	list_for_each_entry(op, &vops->list, link) {
+		clean_svm_prefetch_op(op);
+	}
+}
+
 static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 {
 	int i;
 
+	clean_svm_prefetch_in_vma_ops(vops);
+
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		kfree(vops->pt_update_ops[i].ops);
 }
@@ -2248,13 +2274,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
 	return true;
 }
 
+static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *__op;
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		clean_svm_prefetch_op(op);
+	}
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
  */
 static struct drm_gpuva_ops *
-vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
-			 u64 bo_offset_or_userptr, u64 addr, u64 range,
+vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
+			 struct xe_bo *bo, u64 bo_offset_or_userptr,
+			 u64 addr, u64 range,
 			 u32 operation, u32 flags,
 			 u32 prefetch_region, u16 pat_index)
 {
@@ -2262,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_end = addr + range;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2323,14 +2362,61 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-			op->prefetch.region = prefetch_region;
-		}
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+			if (!xe_vma_is_cpu_addr_mirror(vma)) {
+				op->prefetch.region = prefetch_region;
+				break;
+			}
 
+			struct drm_gpusvm_ctx ctx = {
+			.read_only = xe_vma_read_only(vma),
+			.devmem_possible = IS_DGFX(vm->xe) &&
+					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			.check_pages_threshold = IS_DGFX(vm->xe) &&
+						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+						 SZ_64K : 0,
+			};
+
+			op->prefetch_range.region = prefetch_region;
+			struct xe_svm_range *svm_range;
+			int i = 0;
+
+			xa_init(&op->prefetch_range.range);
+			op->prefetch_range.ranges_count = 0;
+alloc_next_range:
+			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
+
+			if (PTR_ERR(svm_range) == -ENOENT)
+				break;
+
+			if (IS_ERR(svm_range)) {
+				err = PTR_ERR(svm_range);
+				goto unwind_prefetch_ops;
+			}
+
+			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
+			op->prefetch_range.ranges_count++;
+			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
+
+			if (range_end > xe_svm_range_end(svm_range) &&
+			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
+				i++;
+				addr = xe_svm_range_end(svm_range);
+				goto alloc_next_range;
+			}
+		}
 		print_op(vm->xe, __op);
 	}
 
 	return ops;
+
+unwind_prefetch_ops:
+	clean_svm_prefetch_in_gpuva_ops(ops);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return ERR_PTR(err);
 }
+
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
@@ -2645,8 +2731,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					return err;
 			}
 
-			if (!xe_vma_is_cpu_addr_mirror(vma))
+			if (xe_vma_is_cpu_addr_mirror(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
+							      op->prefetch_range.ranges_count);
+			else
 				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
+
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -2772,6 +2862,58 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
+static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
+					 struct xe_vma_op *op)
+{
+	int err = 0;
+
+	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+		struct drm_gpusvm_ctx ctx = {
+			.read_only = xe_vma_read_only(vma),
+			.devmem_possible = IS_DGFX(vm->xe) &&
+					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			.check_pages_threshold = IS_DGFX(vm->xe) &&
+						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+						 SZ_64K : 0,
+		};
+		struct xe_svm_range *svm_range;
+		struct xe_tile *tile;
+		u32 region;
+		int i;
+
+		if (!xe_vma_is_cpu_addr_mirror(vma))
+			return 0;
+
+		region = op->prefetch_range.region;
+
+		/* TODO: Threading the migration */
+		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
+			svm_range = xa_load(&op->prefetch_range.range, i);
+			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+				if (err) {
+					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
+						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+					return -ENODATA;
+				}
+			}
+
+			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
+			if (err) {
+				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+					err = -ENODATA;
+
+				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
+					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+				return err;
+			}
+		}
+	}
+	return err;
+}
+
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			    struct xe_vma_op *op)
 {
@@ -2809,7 +2951,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_PREFETCH:
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-		u32 region = op->prefetch.region;
+		u32 region;
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			region = op->prefetch_range.region;
+		else
+			region = op->prefetch.region;
 
 		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
 
@@ -2828,6 +2975,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	return err;
 }
 
+static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
+		return 0;
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = prefetch_ranges_lock_and_prep(vm, op);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -2850,7 +3014,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
 		return -ENOSPC;
 #endif
-
 	return 0;
 }
 
@@ -3492,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
-		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
+		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
 		if (IS_ERR(ops[i])) {
@@ -3525,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto unwind_ops;
 
+	err = xe_vma_ops_execute_ready(vm, &vops);
+	if (err)
+		goto unwind_ops;
+
 	fence = vm_bind_ioctl_ops_execute(vm, &vops);
 	if (IS_ERR(fence))
 		err = PTR_ERR(fence);
@@ -3594,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
+	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
 				       vm->xe->pat.idx[cache_lvl]);
 	if (IS_ERR(ops)) {
-- 
2.34.1

