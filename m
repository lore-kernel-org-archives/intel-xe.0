Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B834C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100A410EA08;
	Fri,  3 Nov 2023 14:35:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4397010EA07
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022127; x=1730558127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IQzV5tLw+kM9jZp1jk8Z68oXFpX5UUIMN+KWS96gTU=;
 b=WOG0l0g74JoyxHA5ChyJjIDpZAtM/I0WAmdsHq0fIv10hV4303fggrcT
 3PVKJpDOSSk1RsATKwtI5EyZfq85Odwhws/6q2hdDzpZpFhkx8KYbcBWf
 LmDCpy3ZbaogrxM5CGnRKuOBKhsJmqKKnP93/h6bUt8ruKWFhdDiaoRWn
 a2Pl14AyGMhFKJ5EkUpDp+5+Ps6UcyD12G/uoNzqzF4EPcRiV2XlgIUcq
 Tm6OZZfh8VJ7mRdAeVilZfWsfCyqK2B+6rk1Yz+CZZAULKaNI1w+KCmxu
 VtY6yj//uabFWps+EmRC74NKFyfI/n+UfoFm8qldwoZixjvkTRgz5zIOf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843363"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832451"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832451"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:20 +0000
Message-Id: <20231103143456.7-15-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/50] drm/xe/uapi: Kill VM_MADVISE IOCTL
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Remove unused IOCTL.
Without any userspace using it we need to remove before we
can be accepted upstream.

At this point we are breaking the compatibility for good,
so we don't need to break when we are in-tree. So, let's
also use this breakage to sort out the IOCTL entries and
fix all the small indentation and line issues.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 -
 drivers/gpu/drm/xe/xe_bo.c         |   2 +-
 drivers/gpu/drm/xe/xe_bo_types.h   |   3 +
 drivers/gpu/drm/xe/xe_device.c     |   8 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 299 -----------------------------
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 --
 include/uapi/drm/xe_drm.h          |  92 ++-------
 7 files changed, 18 insertions(+), 402 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 776c31e73f29..6c18a9213851 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -114,7 +114,6 @@ xe-y += xe_bb.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
 	xe_vm.o \
-	xe_vm_madvise.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 632f75a752c5..9e6e8f77dd51 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1235,7 +1235,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
 	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
 	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
-	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
+	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
 	INIT_LIST_HEAD(&bo->pinned_link);
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 051fe990c133..4bff60996168 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -19,6 +19,9 @@ struct xe_vm;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
+/* TODO: To be selected with VM_MADVISE */
+#define	XE_BO_PRIORITY_NORMAL	1
+
 /** @xe_bo: XE buffer object */
 struct xe_bo {
 	/** @ttm: TTM base buffer object */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..350d52c54f7a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,7 +34,6 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
-#include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
 
@@ -115,18 +114,17 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_VM_CREATE, xe_vm_create_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_DESTROY, xe_vm_destroy_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_BIND, xe_vm_bind_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_CREATE, xe_exec_queue_create_ioctl,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_GET_PROPERTY, xe_exec_queue_get_property_ioctl,
-			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_GET_PROPERTY, xe_exec_queue_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
deleted file mode 100644
index 72d051ecac5c..000000000000
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ /dev/null
@@ -1,299 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#include "xe_vm_madvise.h"
-
-#include <linux/nospec.h>
-
-#include <drm/ttm/ttm_tt.h>
-#include <drm/xe_drm.h>
-
-#include "xe_bo.h"
-#include "xe_vm.h"
-
-static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
-				       struct xe_vma **vmas, int num_vmas,
-				       u64 value)
-{
-	int i, err;
-
-	if (XE_IOCTL_DBG(xe, value > DRM_XE_MEM_REGION_CLASS_VRAM))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, value == DRM_XE_MEM_REGION_CLASS_VRAM &&
-			 !xe->info.is_dgfx))
-		return -EINVAL;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->props.preferred_mem_class = value;
-		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
-				struct xe_vma **vmas, int num_vmas, u64 value)
-{
-	int i, err;
-
-	if (XE_IOCTL_DBG(xe, value > xe->info.tile_count))
-		return -EINVAL;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->props.preferred_gt = value;
-		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_preferred_mem_class_gt(struct xe_device *xe,
-					  struct xe_vm *vm,
-					  struct xe_vma **vmas, int num_vmas,
-					  u64 value)
-{
-	int i, err;
-	u32 gt_id = upper_32_bits(value);
-	u32 mem_class = lower_32_bits(value);
-
-	if (XE_IOCTL_DBG(xe, mem_class > DRM_XE_MEM_REGION_CLASS_VRAM))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, mem_class == DRM_XE_MEM_REGION_CLASS_VRAM &&
-			 !xe->info.is_dgfx))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, gt_id > xe->info.tile_count))
-		return -EINVAL;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->props.preferred_mem_class = mem_class;
-		bo->props.preferred_gt = gt_id;
-		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
-			      struct xe_vma **vmas, int num_vmas, u64 value)
-{
-	int i, err;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
-			return -EINVAL;
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->props.cpu_atomic = !!value;
-
-		/*
-		 * All future CPU accesses must be from system memory only, we
-		 * just invalidate the CPU page tables which will trigger a
-		 * migration on next access.
-		 */
-		if (bo->props.cpu_atomic)
-			ttm_bo_unmap_virtual(&bo->ttm);
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
-				 struct xe_vma **vmas, int num_vmas, u64 value)
-{
-	int i, err;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
-				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
-			return -EINVAL;
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->props.device_atomic = !!value;
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
-			    struct xe_vma **vmas, int num_vmas, u64 value)
-{
-	int i, err;
-
-	if (XE_IOCTL_DBG(xe, value > DRM_XE_VMA_PRIORITY_HIGH))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, value == DRM_XE_VMA_PRIORITY_HIGH &&
-			 !capable(CAP_SYS_NICE)))
-		return -EPERM;
-
-	for (i = 0; i < num_vmas; ++i) {
-		struct xe_bo *bo;
-
-		bo = xe_vma_bo(vmas[i]);
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return err;
-		bo->ttm.priority = value;
-		ttm_bo_move_to_lru_tail(&bo->ttm);
-		xe_bo_unlock(bo);
-	}
-
-	return 0;
-}
-
-static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
-		       struct xe_vma **vmas, int num_vmas, u64 value)
-{
-	drm_warn(&xe->drm, "NIY");
-	return 0;
-}
-
-typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
-			    struct xe_vma **vmas, int num_vmas, u64 value);
-
-static const madvise_func madvise_funcs[] = {
-	[DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS] = madvise_preferred_mem_class,
-	[DRM_XE_VM_MADVISE_PREFERRED_GT] = madvise_preferred_gt,
-	[DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT] =
-		madvise_preferred_mem_class_gt,
-	[DRM_XE_VM_MADVISE_CPU_ATOMIC] = madvise_cpu_atomic,
-	[DRM_XE_VM_MADVISE_DEVICE_ATOMIC] = madvise_device_atomic,
-	[DRM_XE_VM_MADVISE_PRIORITY] = madvise_priority,
-	[DRM_XE_VM_MADVISE_PIN] = madvise_pin,
-};
-
-static struct xe_vma **
-get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
-{
-	struct xe_vma **vmas, **__vmas;
-	struct drm_gpuva *gpuva;
-	int max_vmas = 8;
-
-	lockdep_assert_held(&vm->lock);
-
-	vmas = kmalloc(max_vmas * sizeof(*vmas), GFP_KERNEL);
-	if (!vmas)
-		return NULL;
-
-	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-
-		if (xe_vma_is_userptr(vma))
-			continue;
-
-		if (*num_vmas == max_vmas) {
-			max_vmas <<= 1;
-			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas),
-					  GFP_KERNEL);
-			if (!__vmas)
-				return NULL;
-			vmas = __vmas;
-		}
-
-		vmas[*num_vmas] = vma;
-		*num_vmas += 1;
-	}
-
-	return vmas;
-}
-
-int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file)
-{
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_file *xef = to_xe_file(file);
-	struct drm_xe_vm_madvise *args = data;
-	struct xe_vm *vm;
-	struct xe_vma **vmas = NULL;
-	int num_vmas = 0, err = 0, idx;
-
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, args->property > ARRAY_SIZE(madvise_funcs)))
-		return -EINVAL;
-
-	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_DBG(xe, !vm))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
-		err = -EINVAL;
-		goto put_vm;
-	}
-
-	down_read(&vm->lock);
-
-	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
-		err = -ENOENT;
-		goto unlock_vm;
-	}
-
-	vmas = get_vmas(vm, &num_vmas, args->addr, args->range);
-	if (XE_IOCTL_DBG(xe, err))
-		goto unlock_vm;
-
-	if (XE_IOCTL_DBG(xe, !vmas)) {
-		err = -ENOMEM;
-		goto unlock_vm;
-	}
-
-	if (XE_IOCTL_DBG(xe, !num_vmas)) {
-		err = -EINVAL;
-		goto unlock_vm;
-	}
-
-	idx = array_index_nospec(args->property, ARRAY_SIZE(madvise_funcs));
-	err = madvise_funcs[idx](xe, vm, vmas, num_vmas, args->value);
-
-unlock_vm:
-	up_read(&vm->lock);
-put_vm:
-	xe_vm_put(vm);
-	kfree(vmas);
-	return err;
-}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
deleted file mode 100644
index eecd33acd248..000000000000
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#ifndef _XE_VM_MADVISE_H_
-#define _XE_VM_MADVISE_H_
-
-struct drm_device;
-struct drm_file;
-
-int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file);
-
-#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1473dd29aa3f..dcd4cdf167f3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -103,28 +103,26 @@ struct xe_user_extension {
 #define DRM_XE_VM_CREATE		0x03
 #define DRM_XE_VM_DESTROY		0x04
 #define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC_QUEUE_CREATE	0x06
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
-#define DRM_XE_EXEC			0x08
+#define DRM_XE_EXEC			0x06
+#define DRM_XE_EXEC_QUEUE_CREATE	0x07
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_WAIT_USER_FENCE		0x0a
-#define DRM_XE_VM_MADVISE		0x0b
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
-
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_WAIT_USER_FENCE		0x0b
 /* Must be kept compact -- no holes */
+
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
 #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
 #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
-#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
-#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
-#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
@@ -1095,74 +1093,6 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_madvise - give advice about use of memory
- *
- * The @property can be:
- *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS - Setting the preferred
- *    location will trigger a migrate of the VMA backing store to new
- *    location if the backing store is already allocated.
- *    For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
- *    drm_xe_memory_class.
- *  - %DRM_XE_VM_MADVISE_PREFERRED_GT
- *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT - In this case lower 32 bits
- *    are mem class, upper 32 are GT. Combination provides a single IOCTL
- *    plus migrate VMA to preferred location.
- *  - %DRM_XE_VM_MADVISE_CPU_ATOMIC - The CPU will do atomic memory
- *    operations to this VMA. Must be set on some devices for atomics to
- *    behave correctly.
- *  - %DRM_XE_VM_MADVISE_DEVICE_ATOMIC - The device will do atomic memory
- *    operations to this VMA. Must be set on some devices for atomics to
- *    behave correctly.
- *  - %DRM_XE_VM_MADVISE_PRIORITY - Priority WRT to eviction (moving from
- *    preferred memory location due to memory pressure). The lower the
- *    priority, the more likely to be evicted.
- *
- *    - %DRM_XE_VMA_PRIORITY_LOW
- *    - %DRM_XE_VMA_PRIORITY_NORMAL - Default
- *    - %DRM_XE_VMA_PRIORITY_HIGH - Must be user with elevated privileges
- *  - %DRM_XE_VM_MADVISE_PIN - Pin the VMA in memory, must be user with
- *    elevated privileges
- */
-struct drm_xe_vm_madvise {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @vm_id: The ID VM in which the VMA exists */
-	__u32 vm_id;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @range: Number of bytes in the VMA */
-	__u64 range;
-
-	/** @addr: Address of the VMA to operation on */
-	__u64 addr;
-
-#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS		0
-#define DRM_XE_VM_MADVISE_PREFERRED_GT			1
-#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
-#define DRM_XE_VM_MADVISE_CPU_ATOMIC			3
-#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC			4
-#define DRM_XE_VM_MADVISE_PRIORITY			5
-#define		DRM_XE_VMA_PRIORITY_LOW			0
-#define		DRM_XE_VMA_PRIORITY_NORMAL		1
-#define		DRM_XE_VMA_PRIORITY_HIGH		2
-#define DRM_XE_VM_MADVISE_PIN				6
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad2: MBZ */
-	__u32 pad2;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * DOC: XE PMU event config IDs
  *
-- 
2.34.1

