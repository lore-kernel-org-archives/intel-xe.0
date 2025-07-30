Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9994FC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8910E207;
	Wed, 30 Jul 2025 12:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAiz7IF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6054E10E203
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878863; x=1785414863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXeQku0T+koZs73gRowofAUIAoWBJrQxA5qbiIaVktY=;
 b=ZAiz7IF/8BQHr49SCHIq8WRYt6//fQGVF2BP55YhQF3BboiVKB3c9t0N
 UTsVQMlpaILgHOVD4AZgKNoaP3Zhxd8cwawGazHWrd+JLNeH34ObY4bKD
 UES/Foj1y4AZxMWTMQ9soE5G1ghuZoyY3eBzrsGCpXDj7avQ83r2P2NrI
 NHf64nGjnfdFn9P7uS9WNfjQ2E5op5CJ+TJXsQ6OqQg4D/MNulW0xb71a
 Yi+WFSj5dfvFR/U37HCg4Q8a0d11mz7z0JCeugBMx/YLJzNbnc2UMMseM
 Z9qZC+NCQ8KNFB3EkGL3vlmEUej9I8NMoT167SDLy3GDnrfz9drg4E2bP w==;
X-CSE-ConnectionGUID: kd169Oz9TE6p2wcqYnGtJw==
X-CSE-MsgGUID: IOf+70FiRAK5pjAwVtc40A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450156"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450156"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:23 -0700
X-CSE-ConnectionGUID: B/QPQCcAS+WozB8i2CfXxA==
X-CSE-MsgGUID: fvrp0s+PRBmIWBaHLv5heg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649488"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v5 13/25] drm/xe: Implement madvise ioctl for xe
Date: Wed, 30 Jul 2025 18:30:38 +0530
Message-Id: <20250730130050.1001648-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

v4(Matthew Brost/Shuicheng)
- Make locks interruptable
- Error handling fixes
- vm_put fixes

v5(Matthew Brost)
- Flush garbage collector before any locking.
- Add check for null vma

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 308 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
 3 files changed, 324 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..d0ea869fcd24 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -128,6 +128,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..b861c3349b0a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_vm_madvise.h"
+
+#include <linux/nospec.h>
+#include <drm/xe_drm.h>
+
+#include "xe_bo.h"
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
+	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
+	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
+	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
+};
+
+static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+	struct xe_tile *tile;
+	u8 id, tile_mask;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Wait for pending binds */
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma))
+			continue;
+
+		for_each_tile(tile, vm->xe, id) {
+			if (xe_pt_zap_ptes(tile, vma)) {
+				tile_mask |= BIT(id);
+
+				/*
+				 * WRITE_ONCE pairs with READ_ONCE
+				 * in xe_vm_has_valid_gpu_mapping()
+				 */
+				WRITE_ONCE(vma->tile_invalidated,
+					   vma->tile_invalidated | BIT(id));
+			}
+		}
+	}
+
+	return tile_mask;
+}
+
+static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
+
+	if (!tile_mask)
+		return 0;
+
+	xe_device_wmb(vm->xe);
+
+	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
+}
+
+static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
+{
+	if (XE_IOCTL_DBG(xe, !args))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
+		return false;
+
+	switch (args->type) {
+	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
+				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
+			return false;
+		break;
+	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
+		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
+			return false;
+
+		break;
+	case DRM_XE_MEM_RANGE_ATTR_PAT:
+		/*TODO: Add valid pat check */
+		break;
+	default:
+		if (XE_IOCTL_DBG(xe, 1))
+			return false;
+	}
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return false;
+
+	return true;
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
+	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
+							 .range =  args->range, };
+	struct xe_vm *vm;
+	struct drm_exec exec;
+	int err, attr_type;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (!madvise_args_are_sane(vm->xe, args)) {
+		err = -EINVAL;
+		goto put_vm;
+	}
+
+	xe_svm_flush(vm);
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	if (err)
+		goto unlock_vm;
+
+	err = get_vmas(vm, &madvise_range);
+	if (err || !madvise_range.num_vmas)
+		goto unlock_vm;
+
+	if (madvise_range.has_bo_vmas) {
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+		drm_exec_until_all_locked(&exec) {
+			for (int i = 0; i < madvise_range.num_vmas; i++) {
+				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
+
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
+	if (madvise_range.has_userptr_vmas) {
+		err = down_read_interruptible(&vm->userptr.notifier_lock);
+		if (err)
+			goto err_fini;
+	}
+
+	if (madvise_range.has_svm_vmas) {
+		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
+		if (err)
+			goto unlock_userptr;
+	}
+
+	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
+	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
+
+	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+
+	if (madvise_range.has_svm_vmas)
+		xe_svm_notifier_unlock(vm);
+
+unlock_userptr:
+	if (madvise_range.has_userptr_vmas)
+		up_read(&vm->userptr.notifier_lock);
+err_fini:
+	if (madvise_range.has_bo_vmas)
+		drm_exec_fini(&exec);
+	kfree(madvise_range.vmas);
+	madvise_range.vmas = NULL;
+unlock_vm:
+	up_write(&vm->lock);
+put_vm:
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

