Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A84C5B554
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6441B10E545;
	Tue, 27 May 2025 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYQMUd2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA9C10E4B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362519; x=1779898519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+VIDQiF0nTBFxBTrKfrfWNJviUAh5BRsAYUaZeP56E=;
 b=BYQMUd2hF84DY7j8i632K6mGC6DEmVlrdjfCHlbtzrsLzxOQH726BVXx
 +11ik9rVHy2r10G92udZQjDZEj0OIp17UXkWyJIbgWOOZqqyFN7k9XtGG
 y//COCVugy2iLlJspvGDbueQmnKazPVYahGyQ18AqhB3DSb6Dc4VvKKCE
 6S0OibP8r50nc6aDzzfZMLyfzu2ALX0Zxtf3j8OnS6m+iTC22VeD1nB45
 VUkygQimwRNtbajsbwieZCBYcNaiID1fQzieey47wpSaRknTOVvKieyD5
 AxO9CWkbR6JOKHA6q4jaaU57LYeUhX0DmeacpAiVhFKOrzYsCszhJpO3V g==;
X-CSE-ConnectionGUID: dHIvGieAT0q8CxHEQqq8yA==
X-CSE-MsgGUID: 144y9I9sQ0Cnx8mn4E1fmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471889"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:37 -0700
X-CSE-ConnectionGUID: euQDGIAUSNmVSMonxTL2nA==
X-CSE-MsgGUID: Ib6eq6QITlGbIg0mVo5Sdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646083"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
Date: Tue, 27 May 2025 22:09:54 +0530
Message-Id: <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_device.c     |   2 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
 4 files changed, 282 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c5d6681645ed..dc64bdcddfdc 100644
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
index d4b6e623aa48..b9791c614749 100644
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
index 000000000000..f7edefe5f6cf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
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
+static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
+				u64 addr, u64 range)
+{
+	struct xe_vma **vmas, **__vmas;
+	struct drm_gpuva *gpuva;
+	int max_vmas = 8;
+
+	lockdep_assert_held(&vm->lock);
+
+	*num_vmas = 0;
+	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
+	if (!vmas)
+		return NULL;
+
+	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (*num_vmas == max_vmas) {
+			max_vmas <<= 1;
+			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
+			if (!__vmas) {
+				kfree(vmas);
+				return NULL;
+			}
+			vmas = __vmas;
+		}
+
+		vmas[*num_vmas] = vma;
+		(*num_vmas)++;
+	}
+
+	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
+
+	if (!*num_vmas) {
+		kfree(vmas);
+		return NULL;
+	}
+
+	return vmas;
+}
+
+static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
+				     struct xe_vma **vmas, int num_vmas,
+				     struct drm_xe_madvise_ops ops)
+{
+	/* Implementation pending */
+	return 0;
+}
+
+static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
+			  struct xe_vma **vmas, int num_vmas,
+			  struct drm_xe_madvise_ops ops)
+{
+	/* Implementation pending */
+	return 0;
+}
+
+static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
+			     struct xe_vma **vmas, int num_vmas,
+			     struct drm_xe_madvise_ops ops)
+{
+	/* Implementation pending */
+	return 0;
+}
+
+static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
+				   struct xe_vma **vmas, int num_vmas,
+				   struct drm_xe_madvise_ops ops)
+{
+	/* Implementation pending */
+	return 0;
+}
+
+typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
+			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
+
+static const madvise_func madvise_funcs[] = {
+	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
+	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
+	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
+	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
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
+			WARN_ON_ONCE(!mmu_interval_check_retry
+				    (&to_userptr_vma(vma)->userptr.notifier,
+				     to_userptr_vma(vma)->userptr.notifier_seq));
+
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
+							     DMA_RESV_USAGE_BOOKKEEP));
+		}
+
+		if (xe_vma_bo(vma))
+			xe_bo_lock(xe_vma_bo(vma), false);
+
+		for_each_tile(tile, vm->xe, id) {
+			if (xe_pt_zap_ptes(tile, vma))
+				*tile_mask |= BIT(id);
+		}
+
+		if (xe_vma_bo(vma))
+			xe_bo_unlock(xe_vma_bo(vma));
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
+static int input_ranges_same(struct drm_xe_madvise_ops *old,
+			     struct drm_xe_madvise_ops *new)
+{
+	return (new->start == old->start && new->range == old->range);
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
+	struct drm_xe_madvise_ops *advs_ops;
+	struct drm_xe_madvise *args = data;
+	struct xe_vm *vm;
+	struct xe_vma **vmas = NULL;
+	int num_vmas, err = 0;
+	int i, j, attr_type;
+	bool needs_invalidation;
+
+	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	down_write(&vm->lock);
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	if (args->num_ops > 1) {
+		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
+
+		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
+					  GFP_KERNEL | __GFP_ACCOUNT |
+					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+		if (!advs_ops) {
+			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
+			goto unlock_vm;
+		}
+
+		err = __copy_from_user(advs_ops, madvise_user,
+				       sizeof(struct drm_xe_madvise_ops) *
+				       args->num_ops);
+		if (XE_IOCTL_DBG(xe, err)) {
+			err = -EFAULT;
+			goto free_advs_ops;
+		}
+	} else {
+		advs_ops = &args->ops;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
+
+		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
+		if (!vmas) {
+			err = -ENOMEM;
+			goto free_advs_ops;
+		}
+
+		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
+		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
+
+		kfree(vmas);
+		vmas = NULL;
+
+		if (err)
+			goto free_advs_ops;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		needs_invalidation = true;
+		for (j = i + 1; j < args->num_ops; ++j) {
+			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
+				needs_invalidation = false;
+				break;
+			}
+		}
+		if (needs_invalidation) {
+			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
+							     advs_ops[i].start + advs_ops[i].range);
+			if (err)
+				goto free_advs_ops;
+		}
+	}
+
+free_advs_ops:
+	if (args->num_ops > 1)
+		kvfree(advs_ops);
+unlock_vm:
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
new file mode 100644
index 000000000000..c5cdd058c322
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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

