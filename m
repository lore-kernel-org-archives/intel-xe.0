Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0C5C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EDA10E433;
	Tue, 29 Apr 2025 10:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux8bXnqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8280B10E432
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921883; x=1777457883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrgibXIFkgdO6yA5tqOT4xa1PN8AlTP7G2I01fiNhJ4=;
 b=Ux8bXnqIo0GDER62ap9vKNoy3DCd1b8W5X+CXRF0bHw0xCkyqMMdDUJZ
 EU0N/0O3ZgPE8ugqWbFPuip3nEkidySOq/TG0rN+t1C6P3773pkVswldX
 gR6r8xAv7qdcZ6Q/kby9IJuLXjmjX0bdChXXIBdM3Hk8fHnSbugz9K9LW
 SUF/7uMqsF9l6Vc4P+JwdDkR1XgJ3F5Qp4XXU6zCxT+DHQxfA3fD+kgev
 czI/JuMffvghXMYgiWS/yC+CmREgtXEWZJPMwQw87NipuPvBciHNhPjgz
 tK+eKO21CJCgST11YgvqaF0MA8WUO5Ah4yifzO44qfbxMkLlvNWf1TG9E g==;
X-CSE-ConnectionGUID: 5qIMFAe+TamtaNwmSsOajg==
X-CSE-MsgGUID: dD8mRrfuRyyFMwKtFybmUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243211"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:18:03 -0700
X-CSE-ConnectionGUID: OW9N1LPMSa66acbfBlKl+A==
X-CSE-MsgGUID: 4KF0kWlESseAWvQmXlt1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287623"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:18:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 19/20] drm/xe/svm: Implement prefetch support for SVM ranges
Date: Tue, 29 Apr 2025 16:12:32 +0530
Message-Id: <20250429104233.215602-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

v3:
   - use xa_for_each() instead of manual loop
   - check range is valid and in preferred location before adding to
     xarray
   - Fix naming conventions
   - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
   - Handle sparsely populated cpu vma range (Matthew Brost)

v4:
   - fix end address to find next cpu vma in case of -ENOENT

v5:
   - Move find next vma logic to drm gpusvm layer
   - Avoid mixing declaration and logic

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
 drivers/gpu/drm/xe/xe_vm.c | 192 +++++++++++++++++++++++++++++++++++--
 2 files changed, 229 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de4e3edda758..f3a99ee4f733 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
 	struct xe_vma_op *op;
+	unsigned long i;
 	int err;
 
 	err = xe_pt_pre_commit(pt_update);
@@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	xe_svm_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = op->map_range.range;
+		struct xe_svm_range *range = NULL;
 
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
-		xe_svm_range_debug(range, "PRE-COMMIT");
+		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
+			xa_for_each(&op->prefetch_range.range, i, range) {
+				xe_svm_range_debug(range, "PRE-COMMIT");
 
-		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+				if (!xe_svm_range_pages_valid(range)) {
+					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+					xe_svm_notifier_unlock(vm);
+					return -ENODATA;
+				}
+			}
+		} else {
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+			range = op->map_range.range;
 
-		if (!xe_svm_range_pages_valid(range)) {
-			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-			xe_svm_notifier_unlock(vm);
-			return -EAGAIN;
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				xe_svm_notifier_unlock(vm);
+				return -EAGAIN;
+			}
 		}
 	}
 
@@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
-		if (xe_vma_is_cpu_addr_mirror(vma))
-			break;
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			struct xe_svm_range *range;
+			unsigned long i;
 
-		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
-		pt_update_ops->wait_vm_kernel = true;
+			xa_for_each(&op->prefetch_range.range, i, range) {
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
@@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
-		if (!xe_vma_is_cpu_addr_mirror(vma))
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			struct xe_svm_range *range = NULL;
+			unsigned long i;
+
+			xa_for_each(&op->prefetch_range.range, i, range)
+				range_present_and_invalidated_tile(vm, range, tile->id);
+		} else {
 			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
 				       fence2, false);
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_DRIVER:
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 555ed10dac85..47133ce0e8b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 }
 ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
 
+static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
+{
+	struct xe_vma *vma;
+
+	vma = gpuva_to_vma(op->base.prefetch.va);
+
+	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
+		xa_destroy(&op->prefetch_range.range);
+}
+
+static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
+		return;
+
+	list_for_each_entry(op, &vops->list, link)
+		xe_vma_svm_prefetch_op_fini(op);
+}
+
 static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 {
 	int i;
 
+	xe_vma_svm_prefetch_ops_fini(vops);
+
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		kfree(vops->pt_update_ops[i].ops);
 }
@@ -2248,13 +2271,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
 	return true;
 }
 
+static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *__op;
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		xe_vma_svm_prefetch_op_fini(op);
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
@@ -2262,6 +2297,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_end = addr + range;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2323,14 +2359,76 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-			op->prefetch.region = prefetch_region;
-		}
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+			struct xe_svm_range *svm_range;
+			struct drm_gpusvm_ctx ctx;
+			struct xe_tile *tile;
+			u8 id, tile_mask = 0;
+			u32 i;
+
+			if (!xe_vma_is_cpu_addr_mirror(vma)) {
+				op->prefetch.region = prefetch_region;
+				break;
+			}
+
+			ctx.read_only = xe_vma_read_only(vma);
+			ctx.devmem_possible = IS_DGFX(vm->xe) &&
+					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+
+			for_each_tile(tile, vm->xe, id)
+				tile_mask |= 0x1 << id;
+
+			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
+			op->prefetch_range.region = prefetch_region;
+			op->prefetch_range.ranges_count = 0;
+alloc_next_range:
+			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
+
+			if (PTR_ERR(svm_range) == -ENOENT) {
+				addr = xe_svm_range_find_or_insert_start(vm, addr, range_end, vma);
+				if (addr)
+					goto alloc_next_range;
+				else
+					goto print_op_label;
+			}
+
+			if (IS_ERR(svm_range)) {
+				err = PTR_ERR(svm_range);
+				goto unwind_prefetch_ops;
+			}
+
+			if (xe_svm_range_validate_and_evict(vm, svm_range,
+							    tile_mask, !!prefetch_region))
+				goto check_next_range;
 
+			err = xa_alloc(&op->prefetch_range.range,
+				       &i, svm_range, xa_limit_32b,
+				       GFP_KERNEL);
+
+			if (err)
+				goto unwind_prefetch_ops;
+
+			op->prefetch_range.ranges_count++;
+			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+check_next_range:
+			if (range_end > xe_svm_range_end(svm_range) &&
+			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
+				addr = xe_svm_range_end(svm_range);
+				goto alloc_next_range;
+			}
+		}
+print_op_label:
 		print_op(vm->xe, __op);
 	}
 
 	return ops;
+
+unwind_prefetch_ops:
+	xe_svm_prefetch_gpuva_ops_fini(ops);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return ERR_PTR(err);
 }
+
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
@@ -2645,8 +2743,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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
@@ -2772,6 +2874,52 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
+static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	int err = 0;
+
+	struct xe_svm_range *svm_range;
+	struct drm_gpusvm_ctx ctx;
+	struct xe_tile *tile;
+	unsigned long i;
+	u32 region;
+
+	if (!xe_vma_is_cpu_addr_mirror(vma))
+		return 0;
+
+	region = op->prefetch_range.region;
+
+	ctx.read_only = xe_vma_read_only(vma);
+	ctx.devmem_possible = devmem_possible;
+	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
+	ctx.devmem_only = region && devmem_possible;
+
+	/* TODO: Threading the migration */
+	xa_for_each(&op->prefetch_range.range, i, svm_range) {
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+			if (err) {
+				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
+					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+				return -ENODATA;
+			}
+		}
+
+		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
+		if (err) {
+			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+				err = -ENODATA;
+			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			return err;
+		}
+	}
+	return err;
+}
+
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			    struct xe_vma_op *op)
 {
@@ -2809,7 +2957,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
 
@@ -2828,6 +2981,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	return err;
 }
 
+static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
+		return 0;
+
+	list_for_each_entry(op, &vops->list, link) {
+		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
+			err = prefetch_ranges(vm, op);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -3478,7 +3650,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
-		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
+		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
 		if (IS_ERR(ops[i])) {
@@ -3511,6 +3683,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto unwind_ops;
 
+	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
+	if (err)
+		goto unwind_ops;
+
 	fence = vm_bind_ioctl_ops_execute(vm, &vops);
 	if (IS_ERR(fence))
 		err = PTR_ERR(fence);
@@ -3580,7 +3756,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
+	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
 				       vm->xe->pat.idx[cache_lvl]);
 	if (IS_ERR(ops)) {
-- 
2.34.1

