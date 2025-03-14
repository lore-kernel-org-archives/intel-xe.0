Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67F9C28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366210E989;
	Fri, 14 Mar 2025 07:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVX6nCKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92510E985
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937933; x=1773473933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XvxsS4gzhswGRFLgw14e+MejB9XNs22pnnBRN5qrXis=;
 b=AVX6nCKIu7PlC9Wx7/YV4DN80ETuFfJNQhggF4xuBInu9IXJH14uQyIP
 IljnQdtjbXnCQ8tnYCSSIdOZ6KLYzeY57vZ0EnNRzPhDt0luY4hQA2A+9
 l2S8xGl0TrnnlFQMMvdbHtJ5gVvajn3hVZbOo+m50BqvQF5TIYrAVXqIs
 mThQewPgpp+XIyIVaVBgrEkmUz4B1b9GDjMe5SUrBKeiYqc3lEvrRi0JM
 dVKjFAUGdKojb4QmxNyg8Sog5QXQJ4Kp4v8spkDtSyIkYdzoVdOn0W7Nk
 ao4cahIEtktxgIzGk10BXpFwexHiOQWyyfTnd4RVe3jH94g1ht6oOVlun w==;
X-CSE-ConnectionGUID: 8zX1hrzDRdOSNUhT6cJSEg==
X-CSE-MsgGUID: SCkvYOVQSwWuqgtV6PMzOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446082"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:53 -0700
X-CSE-ConnectionGUID: 7BI8uwtHRbC685r0xXqRGg==
X-CSE-MsgGUID: o1vOxCD7SI+u1Bzrr5zr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043852"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 20/29] drm/xe: Implement madvise ioctl for xe
Date: Fri, 14 Mar 2025 13:32:17 +0530
Message-Id: <20250314080226.2059819-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_device.c     |   2 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 309 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
 4 files changed, 327 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 75a79390a0e3..ec7a3edf467a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -116,6 +116,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2f7d727c9392..91687679cf14 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -57,6 +57,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
@@ -193,6 +194,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..ef50031649e0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,309 @@
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
+	struct drm_gpusvm_notifier *notifier;
+	struct drm_gpuva *gpuva;
+	struct xe_svm_range *range;
+	struct xe_tile *tile;
+	u64 adj_start, adj_end;
+	u8 id;
+
+	lockdep_assert_held(&vm->lock);
+
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	down_write(&vm->svm.gpusvm.notifier_lock);
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *r = NULL;
+
+		adj_start = max(start, notifier->itree.start);
+		adj_end = min(end, notifier->itree.last + 1);
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+			range = to_xe_range(r);
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes_range(tile, vm, range)) {
+					*tile_mask |= BIT(id);
+					range->tile_invalidated |= BIT(id);
+				}
+			}
+		}
+	}
+
+	up_write(&vm->svm.gpusvm.notifier_lock);
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
+static void xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_tile *tile;
+	u32 fence_id = 0;
+	u8 tile_mask = 0;
+	u8 id;
+
+	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
+	if (!tile_mask)
+		return;
+
+	xe_device_wmb(vm->xe);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (tile_mask & BIT(id)) {
+			int err;
+
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->media_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+		}
+	}
+
+wait:
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+}
+
+static int input_ranges_same(struct drm_xe_madvise_ops *old,
+			     struct drm_xe_madvise_ops *new)
+{
+	return (new->start == old->start && new->range == old->range);
+}
+
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
+
+	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
+		err = -EINVAL;
+		goto put_vm;
+	}
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
+		if (!advs_ops)
+			return args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
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
+			goto unlock_vm;
+		}
+
+		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
+		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
+
+		kfree(vmas);
+		vmas = NULL;
+
+		if (err)
+			break;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		for (j = i + 1; j < args->num_ops; ++j) {
+			if (input_ranges_same(&advs_ops[j], &advs_ops[i]))
+				break;
+		}
+		xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
+					       advs_ops[i].start + advs_ops[i].range);
+	}
+free_advs_ops:
+	if (args->num_ops > 1)
+		kvfree(advs_ops);
+unlock_vm:
+	up_write(&vm->lock);
+put_vm:
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

