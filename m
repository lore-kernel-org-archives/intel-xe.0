Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77FFC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723EC10E210;
	Fri, 13 Jun 2025 12:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmFD4ALR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E4510E963
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817815; x=1781353815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/s4IdILxsfxCO6nllQVukK1O9hbi/DUvvPS2El5ePqw=;
 b=WmFD4ALRJgcv9NQ1NQ2yaDzv1R9a9f0BNjNXPNE5zO30/nICMPU5EcsV
 smoMDl2QwgDvvg2SeMA6bemowG0ZZ5FcEch+2DBzuTkYhbokRTi0V66Lk
 1G8SMcdF7eEPOi0sQUCwHMWKHrYB0Q65AgFotAT4Zny0F3sN+YDPEkKse
 ecvVk7vNWyISNwZK3A8eJIenbAI/siv8r19N1HxBmTfK063Jubm8s9LZB
 rEriwPlnrjxScOhLKZxuXZlRIuP7XJobn2uj2o2h66a9o76+3hOPIKYhS
 htNfEVN4gyulXBZ8mX1ayWYra2BZGJMepmQQ5iwCieWZQYlxo4uoawDLh A==;
X-CSE-ConnectionGUID: qG5u6MDGTSW7lG5KsBSNsA==
X-CSE-MsgGUID: 5V7Yd7ewRbq6mX4HEGbwxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610167"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:15 -0700
X-CSE-ConnectionGUID: kMYyv7PMSd+DMGLUnuYgyA==
X-CSE-MsgGUID: FQ2mjjgjRxGPWQzh5NjYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290328"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 09/20] drm/xe: Implement madvise ioctl for xe
Date: Fri, 13 Jun 2025 18:25:47 +0530
Message-Id: <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

This driver-specific ioctl enables UMDs to control the memory attributes
for GPU VMAs within a specified input range. If the start or end
addresses fall within an existing VMA, the VMA is split accordingly. The
attributes of the VMA are modified as provided by the users. The old
mappings of the VMAs are invalidated, and TLB invalidation is performed
if necessary.

v2(Matthew brost)
- xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
fault mode too
- fix tlb invalidation skip for same ranges in multiple op
- use helper for tlb invalidation
- use xe_svm_notifier_lock/unlock helper
- s/lockdep_assert_held/lockdep_assert_held_write
- Add kernel-doc

v3(Matthew Brost)
- make vfunc fail safe
- Add sanitizing input args before vfunc

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_device.c     |   2 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 282 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
 4 files changed, 300 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..d375b549c30f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7d9a31868ea9..632d3ab12392 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
@@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..ff560914ad7e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_vm_madvise.h"
+
+#include <linux/nospec.h>
+#include <drm/ttm/ttm_tt.h>
+#include <drm/xe_drm.h>
+
+#include "xe_bo.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+
+struct xe_vmas_in_madvise_range {
+	u64 addr;
+	u64 range;
+	struct xe_vma **vmas;
+	int num_vmas;
+	bool has_svm_vmas;
+	bool has_bo_vmas;
+	bool has_userptr_vmas;
+};
+
+static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
+{
+	u64 addr = madvise_range->addr;
+	u64 range = madvise_range->range;
+
+	struct xe_vma  **__vmas;
+	struct drm_gpuva *gpuva;
+	int max_vmas = 8;
+
+	lockdep_assert_held(&vm->lock);
+
+	madvise_range->num_vmas = 0;
+	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
+	if (!madvise_range->vmas)
+		return -ENOMEM;
+
+	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (xe_vma_bo(vma))
+			madvise_range->has_bo_vmas = true;
+		else if (xe_vma_is_cpu_addr_mirror(vma))
+			madvise_range->has_svm_vmas = true;
+		else if (xe_vma_is_userptr(vma))
+			madvise_range->has_userptr_vmas = true;
+		else
+			XE_WARN_ON("UNEXPECTED VMA");
+
+		if (madvise_range->num_vmas == max_vmas) {
+			max_vmas <<= 1;
+			__vmas = krealloc(madvise_range->vmas,
+					  max_vmas * sizeof(*madvise_range->vmas),
+					  GFP_KERNEL);
+			if (!__vmas) {
+				kfree(madvise_range->vmas);
+				return -ENOMEM;
+			}
+			madvise_range->vmas = __vmas;
+		}
+
+		madvise_range->vmas[madvise_range->num_vmas] = vma;
+		(madvise_range->num_vmas)++;
+	}
+
+	if (!madvise_range->num_vmas)
+		kfree(madvise_range->vmas);
+
+	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
+
+	return 0;
+}
+
+static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
+				      struct xe_vma **vmas, int num_vmas,
+				      struct drm_xe_madvise *op)
+{
+	/* Implementation pending */
+}
+
+static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
+			   struct xe_vma **vmas, int num_vmas,
+			   struct drm_xe_madvise *op)
+{
+	/* Implementation pending */
+}
+
+static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
+			      struct xe_vma **vmas, int num_vmas,
+			      struct drm_xe_madvise *op)
+{
+	/* Implementation pending */
+}
+
+typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
+			     struct xe_vma **vmas, int num_vmas,
+			     struct drm_xe_madvise *op);
+
+static const madvise_func madvise_funcs[] = {
+	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
+	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
+	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
+};
+
+static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
+{
+	struct drm_gpuva *gpuva;
+	struct xe_tile *tile;
+	u8 id;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			continue;
+
+		if (xe_vma_is_userptr(vma)) {
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
+							     DMA_RESV_USAGE_BOOKKEEP));
+		}
+
+		for_each_tile(tile, vm->xe, id) {
+			if (xe_pt_zap_ptes(tile, vma)) {
+				*tile_mask |= BIT(id);
+				vma->tile_invalidated |= BIT(id);
+			}
+		}
+	}
+}
+
+static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	u8 tile_mask = 0;
+
+	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
+	if (!tile_mask)
+		return 0;
+
+	xe_device_wmb(vm->xe);
+
+	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
+}
+
+static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
+{
+	if (XE_IOCTL_DBG(xe, !args))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
+		return -EINVAL;
+
+	switch (args->type) {
+	case DRM_XE_VMA_ATTR_ATOMIC:
+		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_VMA_ATOMIC_CPU))
+			return -EINVAL;
+		break;
+	case DRM_XE_VMA_ATTR_PAT:
+		/*TODO: Add valid pat check */
+		break;
+	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
+				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
+			return -EINVAL;
+		break;
+	default:
+		if (XE_IOCTL_DBG(xe, 1))
+			return -EINVAL;
+	}
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
+ * @dev: DRM device pointer
+ * @data: Pointer to ioctl data (drm_xe_madvise*)
+ * @file: DRM file pointer
+ *
+ * Handles the MADVISE ioctl to provide memory advice for vma's within
+ * input range.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_madvise *args = data;
+	struct xe_vm *vm;
+	struct xe_bo *bo;
+	struct drm_exec exec;
+	int err = 0;
+	int attr_type;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (drm_xe_madvise_args_are_sane(vm->xe, args))
+		return -EINVAL;
+
+	down_write(&vm->lock);
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+
+	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
+							 .range =  args->range, };
+	err = get_vmas(vm, &madvise_range);
+	if (err || !madvise_range.num_vmas)
+		goto unlock_vm;
+
+	if (madvise_range.has_bo_vmas) {
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			for (int i = 0; i < madvise_range.num_vmas; i++) {
+				bo = xe_vma_bo(madvise_range.vmas[i]);
+				if (!bo)
+					continue;
+				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
+				drm_exec_retry_on_contention(&exec);
+				if (err)
+					goto err_fini;
+			}
+		}
+	}
+
+	if (madvise_range.has_userptr_vmas)
+		down_read(&vm->userptr.notifier_lock);
+
+	if (madvise_range.has_svm_vmas)
+		xe_svm_notifier_lock(vm);
+
+	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
+	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
+
+	kfree(madvise_range.vmas);
+	madvise_range.vmas = NULL;
+
+	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+
+	if (madvise_range.has_svm_vmas)
+		xe_svm_notifier_unlock(vm);
+
+	if (madvise_range.has_userptr_vmas)
+		up_read(&vm->userptr.notifier_lock);
+err_fini:
+	if (madvise_range.has_bo_vmas)
+		drm_exec_fini(&exec);
+unlock_vm:
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
new file mode 100644
index 000000000000..b0e1fc445f23
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VM_MADVISE_H_
+#define _XE_VM_MADVISE_H_
+
+struct drm_device;
+struct drm_file;
+
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file);
+
+#endif
-- 
2.34.1

