Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D166C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 10:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3276989E2A;
	Thu, 24 Apr 2025 10:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmEALz7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D95789E2A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745490195; x=1777026195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vr/88LuMQegj3Y08ZEc2HgEFN3cRN7m0ppe7r6Om7UU=;
 b=MmEALz7vhQBTjHJvPjk4D9QE2jQ6YzIiz1bbULfbrksVSjPqjplcYsR6
 SbGNAJBVAfmEVsOmXdr+1jDD1vdD0j4uiX/9kOGMFcrM6dy3kpY8kcAUt
 +A4c1Qjzyys2XvBVIXSHSUmtk7kkAOva8lr7U8uHSf8KJsA4oSgUHa1da
 3VtIoGmrL0l69UVmPo8gJn/6WiFOm2jigFZ76vq1vLhl1kmUiE1N64lsX
 tM4bw9xq32Xbza7+CDI2hVIWYmHa8x+k063ifuGh3vAsG0YTUCPI+Cu3n
 HKtXG2pbaOxEmJLaagBd2NLaYyJzV9ZqVzg11lARKMhgsUMos7ei7JKUJ w==;
X-CSE-ConnectionGUID: G6EtPX1CThKbNdVP1X9b9g==
X-CSE-MsgGUID: qVlD8WcJT4ubsqnw/yJcMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47026745"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47026745"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:23:15 -0700
X-CSE-ConnectionGUID: 6V2Kl+6JSI2jbs9o3WmLSg==
X-CSE-MsgGUID: nhqnGyw9QAqszdD43e17AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="133106258"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 24 Apr 2025 03:23:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/1] drm/xe/svm: PREFETCH svm patches squash for CI
Date: Thu, 24 Apr 2025 16:18:17 +0530
Message-Id: <20250424104817.3791574-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

DO NOT REVIEW

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c         |  14 ++
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  77 +++++++--
 drivers/gpu/drm/xe/xe_svm.c          | 227 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          | 126 +++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 248 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 include/drm/drm_gpusvm.h             |   7 +
 14 files changed, 655 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 2451c816edd5..7466eb1694ef 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
+			if (ctx->devmem_only) {
+				err = -EFAULT;
+				goto err_unmap;
+			}
+
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
@@ -1765,6 +1770,8 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
 		goto err_finalize;
 
 	/* Upon success bind devmem allocation to range and zdd */
+	devmem_allocation->timeslice_expiration = get_jiffies_64() +
+		msecs_to_jiffies(ctx->timeslice_ms);
 	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 err_finalize:
@@ -1985,6 +1992,13 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
+	if (page) {
+		zdd = page->zone_device_data;
+		if (time_before64(get_jiffies_64(),
+				  zdd->devmem_allocation->timeslice_expiration))
+			return 0;
+	}
+
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..d83cd6ed3fa8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -191,6 +191,41 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
+					    size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t atomic_svm_timeslice_ms_set(struct file *f,
+					   const char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 atomic_svm_timeslice_ms;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &atomic_svm_timeslice_ms);
+	if (ret)
+		return ret;
+
+	xe->atomic_svm_timeslice_ms = atomic_svm_timeslice_ms;
+
+	return size;
+}
+
+static const struct file_operations atomic_svm_timeslice_ms_fops = {
+	.owner = THIS_MODULE,
+	.read = atomic_svm_timeslice_ms_show,
+	.write = atomic_svm_timeslice_ms_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +246,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
+			    &atomic_svm_timeslice_ms_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..abf3c72baaa6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -444,6 +444,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3745389ead0d..70924e75b597 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -571,6 +571,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
+	u32 atomic_svm_timeslice_ms;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 10622ca471a2..7a8f87709e39 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
-static bool vma_matches(struct xe_vma *vma, u64 page_addr)
-{
-	if (page_addr > xe_vma_end(vma) - 1 ||
-	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
-		return false;
-
-	return true;
-}
-
-static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
-{
-	struct xe_vma *vma = NULL;
-
-	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, page_addr))
-			vma = vm->usm.last_fault_vma;
-	}
-	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
-
-	return vma;
-}
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
@@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	vma = lookup_vma(vm, pf->page_addr);
+	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
 	if (!vma) {
 		err = -EINVAL;
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 64bf46646544..e4742e27e2cd 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -30,9 +30,6 @@ struct xe_modparam xe_modparam = {
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
 
-module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
-MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
-
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 84339e509c80..5a3bfea8b7b4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,7 +12,6 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
-	bool always_migrate_to_vram;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b42cf5d1b20c..f3a99ee4f733 100644
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
@@ -2216,6 +2241,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 }
 
+static void range_present_and_invalidated_tile(struct xe_vm *vm,
+					       struct xe_svm_range *range,
+					       u8 tile_id)
+{
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+
+	range->tile_present |= BIT(tile_id);
+	range->tile_invalidated &= ~BIT(tile_id);
+}
+
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2263,19 +2298,25 @@ static void op_commit(struct xe_vm *vm,
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
 	{
-		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			op->map_range.range->tile_present |= BIT(tile->id);
-			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
-		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
+			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			op->unmap_range.range->tile_present &= ~BIT(tile->id);
-		}
+
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d927f50f2a68..284c7752e164 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -36,21 +36,6 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
-static unsigned long xe_svm_range_start(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_start(&range->base);
-}
-
-static unsigned long xe_svm_range_end(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_end(&range->base);
-}
-
-static unsigned long xe_svm_range_size(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_size(&range->base);
-}
-
 #define range_debug(r__, operaton__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
@@ -94,11 +79,6 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 	kfree(range);
 }
 
-static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
-{
-	return container_of(r, struct xe_svm_range, base);
-}
-
 static void
 xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 				   const struct mmu_notifier_range *mmu_range)
@@ -649,10 +629,23 @@ void xe_svm_fini(struct xe_vm *vm)
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
 
-static bool xe_svm_range_is_valid(struct xe_svm_range *range,
-				  struct xe_tile *tile)
+/**
+ * xe_svm_range_is_valid - Check if the SVM range is valid
+ * @range: Pointer to the SVM range structure
+ * @tile_mask: Mask representing the tiles to be checked
+ * @devmem_only: if true range needs to be in devmem
+ *
+ * This function checks if the range is mapped and is in preferred
+ * location.
+ *
+ * Return: true if the range is valid, false otherwise
+ */
+
+bool xe_svm_range_is_valid(struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_only)
 {
-	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
+	return (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask
+		&& (!devmem_only || range->base.flags.has_devmem_pages);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
@@ -661,9 +654,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+/**
+ * xe_svm_alloc_vram()- Allocate device memory pages for range,
+ * migrating existing data.
+ * @vm: The VM.
+ * @tile: tile to allocate vram from
+ * @range: SVM range
+ * @ctx: DRM GPU SVM context
+ *
+ * Return: 0 on success, error code on failure.
+ */
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
 {
 	struct mm_struct *mm = vm->svm.gpusvm.mm;
 	struct xe_vram_region *vr = tile_to_vr(tile);
@@ -717,15 +720,47 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
 	return err;
 }
-#else
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+#endif
+
+static bool supports_4K_migration(struct xe_device *xe)
 {
-	return -EOPNOTSUPP;
+	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		return false;
+
+	return true;
 }
-#endif
 
+/**
+ * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
+ * @range: SVM range for which migration needs to be decided
+ * @vma: vma which has range
+ * @preferred_region_is_vram: preferred region for range is vram
+ *
+ * Return: True for range needing migration and migration is supported else false
+ */
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					bool preferred_region_is_vram)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+
+	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
+		return false;
+
+	xe_assert(vm->xe, IS_DGFX(vm->xe));
+
+	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
+		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return true;
+}
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -750,12 +785,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
-	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
+	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
 	int err;
 
@@ -770,46 +810,55 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
-					    xe_vma_start(vma), xe_vma_end(vma),
-					    &ctx);
-	if (IS_ERR(r))
-		return PTR_ERR(r);
+	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
+
+	if (IS_ERR(range))
+		return PTR_ERR(range);
 
-	range = to_xe_range(r);
-	if (xe_svm_range_is_valid(range, tile))
+	if (xe_svm_range_is_valid(range, BIT(tile->id), ctx.devmem_only))
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
-		range->skip_migrate = true;
-
+	if (--migrate_try_count >= 0 &&
+	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (migrate_try_count || !ctx.devmem_only) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
 	}
 
 	range_debug(range, "GET PAGES");
-	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP) {
-			range_debug(range, "PAGE FAULT - EVICT PAGES");
-			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		if (migrate_try_count > 0 || !ctx.devmem_only) {
+			if (err == -EOPNOTSUPP) {
+				range_debug(range, "PAGE FAULT - EVICT PAGES");
+				drm_gpusvm_range_evict(&vm->svm.gpusvm,
+						       &range->base);
+			}
+			drm_dbg(&vm->xe->drm,
+				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			goto retry;
+		} else {
+			drm_err(&vm->xe->drm,
+				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 		}
-		drm_dbg(&vm->xe->drm,
-			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
-			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-		range_debug(range, "PAGE FAULT - RETRY PAGES");
-		goto retry;
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
@@ -843,9 +892,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
-	if (xe_modparam.always_migrate_to_vram)
-		range->skip_migrate = false;
-
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
@@ -883,6 +929,56 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
 }
 
+/**
+ * xe_svm_range_find_or_insert- Find or insert GPU SVM range
+ * @vm: xe_vm pointer
+ * @addr: address for which range needs to be found/inserted
+ * @vma:  Pointer to struct xe_vma which mirrors CPU
+ * @ctx: GPU SVM context
+ *
+ * This function finds or inserts a newly allocated a SVM range based on the
+ * address.
+ *
+ * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
+ */
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
+{
+	struct drm_gpusvm_range *r;
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
+					    xe_vma_start(vma), xe_vma_end(vma), ctx);
+	if (IS_ERR(r))
+		return ERR_PTR(PTR_ERR(r));
+
+	return to_xe_range(r);
+}
+
+/**
+ * xe_svm_range_get_pages() - Get pages for a SVM range
+ * @vm: Pointer to the struct xe_vm
+ * @range: Pointer to the xe SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a SVM range and ensures they are mapped for
+ * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	int err = 0;
+
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
+	if (err == -EOPNOTSUPP) {
+		range_debug(range, "PAGE FAULT - EVICT PAGES");
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	}
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 
 static struct drm_pagemap_device_addr
@@ -961,6 +1057,13 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	return 0;
 }
 #else
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+
 int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..35fdd70ec9b0 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -39,11 +39,6 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
-	/**
-	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
-	 * locking.
-	 */
-	u8 skip_migrate	:1;
 };
 
 /**
@@ -75,6 +70,22 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx);
+
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
+
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx);
+
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					bool preferred_region_is_vram);
+
+bool xe_svm_range_is_valid(struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_only);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -87,6 +98,53 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
 }
 
+/**
+ * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
+ * @r: Pointer to the drm_gpusvm_range structure
+ *
+ * This function takes a pointer to a drm_gpusvm_range structure and
+ * converts it to a pointer to the containing xe_svm_range structure.
+ *
+ * Return: Pointer to the xe_svm_range structure
+ */
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
+/**
+ * xe_svm_range_start() - SVM range start address
+ * @range: SVM range
+ *
+ * Return: start address of range.
+ */
+static inline unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_start(&range->base);
+}
+
+/**
+ * xe_svm_range_end() - SVM range end address
+ * @range: SVM range
+ *
+ * Return: end address of range.
+ */
+static inline unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_end(&range->base);
+}
+
+/**
+ * xe_svm_range_size() - SVM range size
+ * @range: SVM range
+ *
+ * Return: Size of range.
+ */
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
+
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
@@ -100,6 +158,8 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 #include <linux/interval_tree.h>
 
 struct drm_pagemap_device_addr;
+struct drm_gpusvm_ctx;
+struct drm_gpusvm_range;
 struct xe_bo;
 struct xe_gt;
 struct xe_vm;
@@ -170,6 +230,62 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
 
+static inline
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	return -EINVAL;
+}
+
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return NULL;
+}
+
+static inline unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return 0;
+}
+
+static inline unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return 0;
+}
+
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return 0;
+}
+
+static inline
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region)
+{
+	return false;
+}
+
+static inline
+bool xe_svm_range_is_valid(struct xe_svm_range *range,
+			   u8 tile_mask, bool devmem_only)
+{
+	return false;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c69ef6b5ec5..fbe50a438cf9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -798,21 +798,47 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
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
 
-static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, int inc_val)
 {
 	int i;
 
+	if (!inc_val)
+		return;
+
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		if (BIT(i) & tile_mask)
-			++vops->pt_update_ops[i].num_ops;
+			vops->pt_update_ops[i].num_ops += inc_val;
 }
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
@@ -842,7 +868,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -977,7 +1003,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -1062,7 +1088,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_unbind(op, range);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
 
 	return 0;
 }
@@ -2136,6 +2162,35 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static bool vma_matches(struct xe_vma *vma, u64 page_addr)
+{
+	if (page_addr > xe_vma_end(vma) - 1 ||
+	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_vm_find_vma_by_addr() - Find a VMA by its address
+ *
+ * @vm: the xe_vm the vma belongs to
+ * @page_addr: address to look up
+ */
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
+{
+	struct xe_vma *vma = NULL;
+
+	if (vm->usm.last_fault_vma) {   /* Fast lookup */
+		if (vma_matches(vm->usm.last_fault_vma, page_addr))
+			vma = vm->usm.last_fault_vma;
+	}
+	if (!vma)
+		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
+
+	return vma;
+}
+
 static const u32 region_to_mem_type[] = {
 	XE_PL_TT,
 	XE_PL_VRAM0,
@@ -2216,13 +2271,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
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
@@ -2230,6 +2297,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_end = addr + range;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2291,14 +2359,74 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
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
+
+			struct drm_gpusvm_ctx ctx = {
+			.read_only = xe_vma_read_only(vma),
+			.devmem_possible = IS_DGFX(vm->xe) &&
+					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			};
+
+			struct xe_svm_range *svm_range;
+			struct xe_tile *tile;
+			u8 id, tile_mask = 0;
+			u32 i;
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
+			if (PTR_ERR(svm_range) == -ENOENT)
+				break;
+
+			if (IS_ERR(svm_range)) {
+				err = PTR_ERR(svm_range);
+				goto unwind_prefetch_ops;
+			}
 
+			if (xe_svm_range_is_valid(svm_range, tile_mask, !!prefetch_region)){
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
+				goto check_next_range;
+			}
+
+			err = xa_alloc(&op->prefetch_range.range,
+				       &i, svm_range, xa_limit_32b,
+				       GFP_KERNEL);
+
+			if (err)
+				goto unwind_prefetch_ops;
+
+			op->prefetch_range.ranges_count++;
+			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
+check_next_range:
+			if (range_end > xe_svm_range_end(svm_range) &&
+			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
+				addr = xe_svm_range_end(svm_range);
+				goto alloc_next_range;
+			}
+		}
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
@@ -2493,7 +2621,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			     !op->map.is_cpu_addr_mirror) ||
 			    op->map.invalidate_on_bind)
 				xe_vma_ops_incr_pt_update_ops(vops,
-							      op->tile_mask);
+							      op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2502,6 +2630,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				gpuva_to_vma(op->base.remap.unmap->va);
 			bool skip = xe_vma_is_cpu_addr_mirror(old);
 			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+			int num_remap_ops = 0;
 
 			if (op->base.remap.prev)
 				start = op->base.remap.prev->va.addr +
@@ -2554,7 +2683,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					num_remap_ops++;
 				}
 			}
 
@@ -2583,11 +2712,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					num_remap_ops++;
 				}
 			}
 			if (!skip)
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				num_remap_ops++;
+
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, num_remap_ops);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -2599,7 +2730,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		case DRM_GPUVA_OP_PREFETCH:
 			vma = gpuva_to_vma(op->base.prefetch.va);
@@ -2610,8 +2741,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					return err;
 			}
 
-			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (xe_vma_is_cpu_addr_mirror(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
+							      op->prefetch_range.ranges_count);
+			else
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
+
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -2737,6 +2872,52 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
+static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	int err = 0;
+
+	struct xe_svm_range *svm_range;
+	struct xe_tile *tile;
+	unsigned long i;
+	u32 region;
+
+	if (!xe_vma_is_cpu_addr_mirror(vma))
+		return 0;
+	region = op->prefetch_range.region;
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.check_pages_threshold = IS_DGFX(vm->xe) &&
+					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.devmem_only = region && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+	};
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
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
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
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+	}
+	return err;
+}
+
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			    struct xe_vma_op *op)
 {
@@ -2774,7 +2955,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
 
@@ -2793,6 +2979,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -3234,6 +3439,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->flags = 0;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
@@ -3442,7 +3648,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
-		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
+		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
 		if (IS_ERR(ops[i])) {
@@ -3475,6 +3681,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto unwind_ops;
 
+	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
+	if (err)
+		goto unwind_ops;
+
 	fence = vm_bind_ioctl_ops_execute(vm, &vops);
 	if (IS_ERR(fence))
 		err = PTR_ERR(fence);
@@ -3544,7 +3754,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
+	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
 				       vm->xe->pat.idx[cache_lvl]);
 	if (IS_ERR(ops)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0ef811fc2bde..99e164852f63 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -169,6 +169,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1662604c4486..bfc145baad49 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -374,6 +374,16 @@ struct xe_vma_op_unmap_range {
 	struct xe_svm_range *range;
 };
 
+/** struct xe_vma_op_prefetch_range - VMA prefetch range operation */
+struct xe_vma_op_prefetch_range {
+	/** @range: xarray for SVM ranges data */
+	struct xarray range;
+	/** @ranges_count: number of svm ranges to map */
+	u32 ranges_count;
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -416,6 +426,8 @@ struct xe_vma_op {
 		struct xe_vma_op_map_range map_range;
 		/** @unmap_range: VMA unmap range operation specific data */
 		struct xe_vma_op_unmap_range unmap_range;
+		/** @prefetch_range: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
@@ -433,6 +445,9 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @flag: signify the properties within xe_vma_ops*/
+#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
 	bool inject_error;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index df120b4d1f83..cce217bc136f 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -89,6 +89,7 @@ struct drm_gpusvm_devmem_ops {
  * @ops: Pointer to the operations structure for GPU SVM device memory
  * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
  * @size: Size of device memory allocation
+ * @timeslice_expiration: Timeslice expiration in jiffies
  */
 struct drm_gpusvm_devmem {
 	struct device *dev;
@@ -97,6 +98,7 @@ struct drm_gpusvm_devmem {
 	const struct drm_gpusvm_devmem_ops *ops;
 	struct drm_pagemap *dpagemap;
 	size_t size;
+	u64 timeslice_expiration;
 };
 
 /**
@@ -283,17 +285,22 @@ struct drm_gpusvm {
  * @check_pages_threshold: Check CPU pages for present if chunk is less than or
  *                         equal to threshold. If not present, reduce chunk
  *                         size.
+ * @timeslice_ms: The timeslice MS which in minimum time a piece of memory
+ *		  remains with either exclusive GPU or CPU access.
  * @in_notifier: entering from a MMU notifier
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
+ * @devmem_only: use only device memory
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
 struct drm_gpusvm_ctx {
 	unsigned long check_pages_threshold;
+	unsigned long timeslice_ms;
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
+	unsigned int devmem_only :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.34.1

