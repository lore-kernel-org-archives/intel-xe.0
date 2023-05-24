Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5591FC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 12:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2993110E675;
	Wed, 24 May 2023 12:37:28 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788BC10E196
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684931843; x=1716467843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TeGGRPG6qRR6wm8Y3wGoUaGjNYuB3teXObWhrg7IYA0=;
 b=fKUQpn6CyDhEdu5vNiX1yd5JbjiDxJ1ENWTxIF6QAVSX87u3g3vU3yKe
 7t2IO5cU6jACJzzH3yk7xbR0tIfIezdUUYzDAIdcI3m67GKhAfMFXQz80
 XQwzLZD7RepQYCqLOalbAimR/YQ4/RUuCyjdxna62G4eNaS4rol95r+/Y
 /FY5UzSqhxt7chsZAqglTd73iEXj2tFci3n5dVE2vuDySmM9kBdQzOoO9
 H4t30qImw8wbYcRVjEV/DFhrGgH5duHXyLfVS3JoUFbPmM2VJ/Gpp2IiY
 V+VKIohtg61E2pDXHQd0cgCzQ6P5OF2PCO1FSUpqpK6u/yfDmlOerEkQO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343010800"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343010800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="735186131"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="735186131"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:22 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 14:36:48 +0200
Message-Id: <20230524123648.29955-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230524123648.29955-1-nirmoy.das@intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 2/2] drm/xe: Implement madvise ioctl for vma
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Implement a new ioctl where userspace can hint the
KMD if VMAs in a address range are needed in future or
not.

This new ioctl accepts DRM_XE_VMA_MADVISE_WILLNEED
which indicate that targeted VMAs will be needed in future
so KMD will make sure that those VMAs are already placed in their
allowed placement and VMAs are binded.

On DRM_XE_VMA_MADVISE_DONTNEED KMD, will free up resources
needed for VMAs and also set ttm bo priority to low that
ttm can evict if needed.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_device.c      |   2 +
 drivers/gpu/drm/xe/xe_vma_madvise.c | 223 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vma_madvise.h |  15 ++
 include/uapi/drm/xe_drm.h           |  28 ++++
 5 files changed, 269 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cd1614b68734..6bd410d35c2d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -94,6 +94,7 @@ xe-y += xe_bb.o \
 	xe_uc_fw.o \
 	xe_vm.o \
 	xe_vm_madvise.o \
+	xe_vma_madvise.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd4a4a6e0b94..a68310ee83b5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -32,6 +32,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
+#include "xe_vma_madvise.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -106,6 +107,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VMA_MADVISE, xe_vma_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_vma_madvise.c b/drivers/gpu/drm/xe/xe_vma_madvise.c
new file mode 100644
index 000000000000..71b9693fd9fa
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vma_madvise.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_vma_madvise.h"
+
+#include <linux/nospec.h>
+
+#include <drm/ttm/ttm_tt.h>
+#include <drm/xe_drm.h>
+
+#include "xe_bo.h"
+#include "xe_vm.h"
+
+static int set_vma_priority(struct xe_vma **vmas, int num_vmas, u64 priority)
+{
+	int i, err;
+
+	for (i = 0; i < num_vmas; ++i) {
+		struct xe_bo *bo;
+		struct ww_acquire_ctx ww;
+
+		bo = vmas[i]->bo;
+
+		err = xe_bo_lock(bo, &ww, 0, true);
+		if (err)
+			return err;
+		bo->ttm.priority = priority;
+		ttm_bo_move_to_lru_tail(&bo->ttm);
+		xe_bo_unlock(bo, &ww);
+	}
+
+	return 0;
+}
+
+static int madvise_willneed(struct xe_device *xe, struct xe_vm *vm,
+			    struct xe_vma **vmas, int num_vmas)
+{
+	u64 priority = DRM_XE_VMA_PRIORITY_NORMAL;
+	int i, err;
+
+	if (capable(CAP_SYS_NICE))
+		priority = DRM_XE_VMA_PRIORITY_HIGH;
+
+	err = set_vma_priority(vmas, num_vmas, priority);
+	if (err)
+		return err;
+
+	for (i = 0; i < num_vmas; ++i) {
+		bool need_binding = vmas[i]->gt_mask !=
+			(vmas[i]->gt_present & ~vmas[i]->usm.gt_invalidated);
+
+		if (need_binding) {
+			err = xe_vm_bind(vm, vmas[i]);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static int madvise_dontneed(struct xe_device *xe, struct xe_vm *vm,
+			    struct xe_vma **vmas, int num_vmas)
+{
+	int i, err;
+
+	err = set_vma_priority(vmas, num_vmas, DRM_XE_VMA_PRIORITY_LOW);
+	if (err)
+		return err;
+
+	for (i = 0; i < num_vmas; ++i) {
+		if (!vmas[i]->destroyed) {
+			err = xe_vm_unbind(vm, vmas[i]);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
+			    struct xe_vma **vmas, int num_vmas);
+
+static const madvise_func madvise_funcs[] = {
+	[DRM_XE_VMA_MADVISE_WILLNEED] = madvise_willneed,
+	[DRM_XE_VMA_MADVISE_DONTNEED] = madvise_dontneed,
+};
+
+static struct xe_vma *node_to_vma(const struct rb_node *node)
+{
+	BUILD_BUG_ON(offsetof(struct xe_vma, vm_node) != 0);
+	return (struct xe_vma *)node;
+}
+
+static struct xe_vma **
+get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
+{
+	struct xe_vma **vmas;
+	struct xe_vma *vma, *__vma, lookup;
+	int max_vmas = 8;
+	struct rb_node *node;
+
+	lockdep_assert_held(&vm->lock);
+
+	vmas = kmalloc(max_vmas * sizeof(*vmas), GFP_KERNEL);
+	if (!vmas)
+		return NULL;
+
+	lookup.start = addr;
+	lookup.end = addr + range - 1;
+
+	vma = xe_vm_find_overlapping_vma(vm, &lookup);
+	if (!vma)
+		return vmas;
+
+	if (!xe_vma_is_userptr(vma)) {
+		vmas[*num_vmas] = vma;
+		*num_vmas += 1;
+	}
+
+	node = &vma->vm_node;
+	while ((node = rb_next(node))) {
+		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
+			__vma = node_to_vma(node);
+			if (xe_vma_is_userptr(__vma))
+				continue;
+
+			if (*num_vmas == max_vmas) {
+				struct xe_vma **__vmas =
+					krealloc(vmas, max_vmas * sizeof(*vmas),
+						 GFP_KERNEL);
+
+				if (!__vmas)
+					return NULL;
+				vmas = __vmas;
+			}
+			vmas[*num_vmas] = __vma;
+			*num_vmas += 1;
+		} else {
+			break;
+		}
+	}
+
+	node = &vma->vm_node;
+	while ((node = rb_prev(node))) {
+		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
+			__vma = node_to_vma(node);
+			if (xe_vma_is_userptr(__vma))
+				continue;
+
+			if (*num_vmas == max_vmas) {
+				struct xe_vma **__vmas =
+					krealloc(vmas, max_vmas * sizeof(*vmas),
+						 GFP_KERNEL);
+
+				if (!__vmas)
+					return NULL;
+				vmas = __vmas;
+			}
+			vmas[*num_vmas] = __vma;
+			*num_vmas += 1;
+		} else {
+			break;
+		}
+	}
+
+	return vmas;
+}
+
+int xe_vma_madvise_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vma_madvise *args = data;
+	struct xe_vm *vm;
+	struct xe_vma **vmas = NULL;
+	int num_vmas = 0, err = 0, idx;
+
+	if (XE_IOCTL_ERR(xe, args->extensions))
+		return -EINVAL;
+
+	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_ERR(xe, !vm))
+		return -EINVAL;
+
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
+		err = -ENOENT;
+		goto put_vm;
+	}
+
+	down_read(&vm->lock);
+
+	vmas = get_vmas(vm, &num_vmas, args->addr, args->range);
+	if (XE_IOCTL_ERR(xe, err))
+		goto unlock_vm;
+
+	if (XE_IOCTL_ERR(xe, !vmas)) {
+		err = -ENOMEM;
+		goto unlock_vm;
+	}
+
+	if (XE_IOCTL_ERR(xe, !num_vmas)) {
+		err = -EINVAL;
+		goto unlock_vm;
+	}
+
+	idx = array_index_nospec(args->property, ARRAY_SIZE(madvise_funcs));
+	err = madvise_funcs[idx](xe, vm, vmas, num_vmas);
+
+unlock_vm:
+	up_read(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	kfree(vmas);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vma_madvise.h b/drivers/gpu/drm/xe/xe_vma_madvise.h
new file mode 100644
index 000000000000..5cf0ad3755c4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vma_madvise.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _XE_VMA_MADVISE_H_
+#define _XE_VMA_MADVISE_H_
+
+struct drm_device;
+struct drm_file;
+
+int xe_vma_madvise_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file);
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..7c439ad7d574 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -119,6 +119,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
+#define DRM_XE_VMA_MADVISE		0x0e
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -135,6 +136,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_VMA_MADVISE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VMA_MADVISE, struct drm_xe_vma_madvise)
 
 struct drm_xe_engine_class_instance {
 	__u16 engine_class;
@@ -801,6 +803,32 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vma_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID VM in which the VMA exists */
+	__u32 vm_id;
+
+	/** @range: Number of bytes in the VMA */
+	__u64 range;
+
+	/** @addr: Address of the VMA to operation on */
+	__u64 addr;
+
+	/* Indication provided by the userspace to forecast if VMAs will be
+	 * required or not in future operations.
+	 */
+#define DRM_XE_VMA_MADVISE_WILLNEED	0
+#define DRM_XE_VMA_MADVISE_DONTNEED	1
+
+	/** @property: property to set */
+	__u32 property;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.39.0

