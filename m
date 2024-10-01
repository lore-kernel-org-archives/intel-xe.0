Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80278CEACDE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C11810E643;
	Tue,  1 Oct 2024 14:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dofVByG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633410E643
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794433; x=1759330433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4h2khrnsur7owkPEqEJ/lhzF2xjfOyUPwpTTG4oAAQo=;
 b=dofVByG/KMMSV9jShXFE/YZvujb1q790Y3qEpy7iumMU+hgNFV6ZOTHQ
 APy3IlLTtGbVws5mBnj8nK199faTzSoqXcMjSv+Wawcqv1rrX7LVklAeU
 bPAO1sj/00Epq6tOAJsPLoq8a7dvQkd7tWlyoFPsETS0v745Vj/3ZkMC0
 mzsoTLd6CmzWcJfMFjNMvm1qM+sT58WOiz9AEZDA8qQbIv+YGG7PpSWOV
 CtHqFRrPDY6GQG0c4ZmJbPzoZ54+WP/mDt1Roya41T2E4jNQjoh51x+S/
 clDhnFhyDUfkgch8G23xnpsc1Vbp0flo/UUr8wVQXQBQZNn3zTjmzBDG3 Q==;
X-CSE-ConnectionGUID: azYMLsEGS7ehft2YwhJp6g==
X-CSE-MsgGUID: TyxZvWKkQqSvJ4YwWA9t9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091424"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:52 -0700
X-CSE-ConnectionGUID: tkRjYjbzTP2BKP6E1edmHw==
X-CSE-MsgGUID: zMv4NFtDQNeN8Zdedoj2ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048753"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:51 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 14/18] drm/xe: Attach debug metadata to vma
Date: Tue,  1 Oct 2024 17:43:02 +0300
Message-Id: <20241001144306.1991001-15-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduces a vm_bind_op extension, enabling users to attach metadata objects
to each [OP_MAP|OP_MAP_USERPTR] operation. This interface will be utilized
by the EU debugger to relay information about the contents of specified
VMAs from the debugee to the debugger process.

v2: move vma metadata handling behind Kconfig (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c | 120 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debug_metadata.h |  48 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c             |  99 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h       |  27 ++++++
 include/uapi/drm/xe_drm.h              |  19 ++++
 5 files changed, 309 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index 72a00b628475..303640f8ba1f 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -10,6 +10,113 @@
 
 #include "xe_device.h"
 #include "xe_macros.h"
+#include "xe_vm.h"
+
+void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata)
+{
+	struct xe_vma_debug_metadata *vmad, *tmp;
+
+	list_for_each_entry_safe(vmad, tmp, &mdata->list, link) {
+		list_del(&vmad->link);
+		kfree(vmad);
+	}
+}
+
+static struct xe_vma_debug_metadata *
+vma_new_debug_metadata(u32 metadata_id, u64 cookie)
+{
+	struct xe_vma_debug_metadata *vmad;
+
+	vmad = kzalloc(sizeof(*vmad), GFP_KERNEL);
+	if (!vmad)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&vmad->link);
+
+	vmad->metadata_id = metadata_id;
+	vmad->cookie = cookie;
+
+	return vmad;
+}
+
+int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+				 struct xe_eudebug_vma_metadata *to)
+{
+	struct xe_vma_debug_metadata *vmad, *vma;
+
+	list_for_each_entry(vmad, &from->list, link) {
+		vma = vma_new_debug_metadata(vmad->metadata_id, vmad->cookie);
+		if (IS_ERR(vma))
+			return PTR_ERR(vma);
+
+		list_add_tail(&vmad->link, &to->list);
+	}
+
+	return 0;
+}
+
+static int vma_new_debug_metadata_op(struct xe_vma_op *op,
+				     u32 metadata_id, u64 cookie,
+				     u64 flags)
+{
+	struct xe_vma_debug_metadata *vmad;
+
+	vmad = vma_new_debug_metadata(metadata_id, cookie);
+	if (IS_ERR(vmad))
+		return PTR_ERR(vmad);
+
+	list_add_tail(&vmad->link, &op->map.eudebug.metadata.list);
+
+	return 0;
+}
+
+int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+				struct xe_file *xef,
+				struct drm_gpuva_ops *ops,
+				u32 operation, u64 extension)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_vm_bind_op_ext_attach_debug ext;
+	struct xe_debug_metadata *mdata;
+	struct drm_gpuva_op *__op;
+	int err;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe,
+			 operation != DRM_XE_VM_BIND_OP_MAP_USERPTR &&
+			 operation != DRM_XE_VM_BIND_OP_MAP))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.flags))
+		return -EINVAL;
+
+	mdata = xe_debug_metadata_get(xef, (u32)ext.metadata_id);
+	if (XE_IOCTL_DBG(xe, !mdata))
+		return -ENOENT;
+
+	/* care about metadata existence only on the time of attach */
+	xe_debug_metadata_put(mdata);
+
+	if (!ops)
+		return 0;
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (op->base.op == DRM_GPUVA_OP_MAP) {
+			err = vma_new_debug_metadata_op(op,
+							ext.metadata_id,
+							ext.cookie,
+							ext.flags);
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
 
 static void xe_debug_metadata_release(struct kref *ref)
 {
@@ -24,6 +131,19 @@ void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
 	kref_put(&mdata->refcount, xe_debug_metadata_release);
 }
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id)
+{
+	struct xe_debug_metadata *mdata;
+
+	mutex_lock(&xef->eudebug.metadata.lock);
+	mdata = xa_load(&xef->eudebug.metadata.xa, id);
+	if (mdata)
+		kref_get(&mdata->refcount);
+	mutex_unlock(&xef->eudebug.metadata.lock);
+
+	return mdata;
+}
+
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 				   void *data,
 				   struct drm_file *file)
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
index 3266c25e657e..13b763ee06e1 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.h
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -6,13 +6,18 @@
 #ifndef _XE_DEBUG_METADATA_H_
 #define _XE_DEBUG_METADATA_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
+struct xe_file;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
 #include "xe_debug_metadata_types.h"
+#include "xe_vm_types.h"
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id);
 void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
 
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
@@ -22,12 +27,32 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 				    void *data,
 				    struct drm_file *file);
+
+static inline void xe_eudebug_move_vma_metadata(struct xe_eudebug_vma_metadata *from,
+						struct xe_eudebug_vma_metadata *to)
+{
+	list_splice_tail_init(&from->list, &to->list);
+}
+
+int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+				 struct xe_eudebug_vma_metadata *to);
+void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata);
+
+int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+				struct xe_file *xef,
+				struct drm_gpuva_ops *ops,
+				u32 operation, u64 extension);
+
 #else /* CONFIG_DRM_XE_EUDEBUG */
 
 #include <linux/errno.h>
 
 struct xe_debug_metadata;
+struct xe_device;
+struct xe_eudebug_vma_metadata;
+struct drm_gpuva_ops;
 
+static inline struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id) { return NULL; }
 static inline void xe_debug_metadata_put(struct xe_debug_metadata *mdata) { }
 
 static inline int xe_debug_metadata_create_ioctl(struct drm_device *dev,
@@ -44,6 +69,29 @@ static inline int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 	return -EOPNOTSUPP;
 }
 
+static inline void xe_eudebug_move_vma_metadata(struct xe_eudebug_vma_metadata *from,
+						struct xe_eudebug_vma_metadata *to)
+{
+}
+
+static inline int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+					       struct xe_eudebug_vma_metadata *to)
+{
+	return 0;
+}
+
+static inline void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata)
+{
+}
+
+static inline int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+					      struct xe_file *xef,
+					      struct drm_gpuva_ops *ops,
+					      u32 operation, u64 extension)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f891e76993b..8c48223892c6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -24,6 +24,7 @@
 #include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_metadata.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_eudebug.h"
@@ -944,6 +945,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	INIT_LIST_HEAD(&vma->eudebug.metadata.list);
+#endif
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -1036,6 +1040,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(xe_vma_bo(vma));
 	}
 
+	xe_eudebug_free_vma_metadata(&vma->eudebug.metadata);
 	xe_vma_free(vma);
 }
 
@@ -1978,6 +1983,9 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+			INIT_LIST_HEAD(&op->map.eudebug.metadata.list);
+#endif
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2168,11 +2176,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
-				      flags);
+			vma = new_vma(vm, &op->base.map, op->map.pat_index, flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
+			xe_eudebug_move_vma_metadata(&op->map.eudebug.metadata,
+						     &vma->eudebug.metadata);
+
 			op->map.vma = vma;
 			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
 				xe_vma_ops_incr_pt_update_ops(vops,
@@ -2203,6 +2213,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				xe_eudebug_move_vma_metadata(&old->eudebug.metadata,
+							     &vma->eudebug.metadata);
+
 				op->remap.prev = vma;
 
 				/*
@@ -2242,6 +2255,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				if (op->base.remap.prev) {
+					err = xe_eudebug_copy_vma_metadata(&op->remap.prev->eudebug.metadata,
+									   &vma->eudebug.metadata);
+					if (err)
+						return err;
+				} else {
+					xe_eudebug_move_vma_metadata(&old->eudebug.metadata,
+								     &vma->eudebug.metadata);
+				}
+
 				op->remap.next = vma;
 
 				/*
@@ -2292,6 +2315,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (op->map.vma) {
+			xe_eudebug_free_vma_metadata(&op->map.eudebug.metadata);
 			prep_vma_destroy(vm, op->map.vma, post_commit);
 			xe_vma_destroy_unlocked(op->map.vma);
 		}
@@ -2530,6 +2554,58 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 	}
 
 	return number_tiles;
+};
+
+typedef int (*xe_vm_bind_op_user_extension_fn)(struct xe_device *xe,
+					       struct xe_file *xef,
+					       struct drm_gpuva_ops *ops,
+					       u32 operation, u64 extension);
+
+static const xe_vm_bind_op_user_extension_fn vm_bind_op_extension_funcs[] = {
+	[XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG] = vm_bind_op_ext_attach_debug,
+};
+
+#define MAX_USER_EXTENSIONS	16
+static int vm_bind_op_user_extensions(struct xe_device *xe,
+				      struct xe_file *xef,
+				      struct drm_gpuva_ops *ops,
+				      u32 operation,
+				      u64 extensions, int ext_number)
+{
+	u64 __user *address = u64_to_user_ptr(extensions);
+	struct drm_xe_user_extension ext;
+	int err;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
+			 ARRAY_SIZE(vm_bind_op_extension_funcs)))
+		return -EINVAL;
+
+	err = vm_bind_op_extension_funcs[ext.name](xe, xef, ops,
+						   operation, extensions);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return vm_bind_op_user_extensions(xe, xef, ops,
+						  operation, ext.next_extension,
+						  ++ext_number);
+
+	return 0;
+}
+
+static int vm_bind_op_user_extensions_check(struct xe_device *xe,
+					    struct xe_file *xef,
+					    u32 operation, u64 extensions)
+{
+	return vm_bind_op_user_extensions(xe, xef, NULL, operation, extensions, 0);
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
@@ -2726,6 +2802,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
+				    struct xe_file *xef,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
 {
@@ -2769,6 +2846,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		u64 extensions = (*bind_ops)[i].extensions;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -2829,6 +2907,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		if (extensions) {
+			err = vm_bind_op_user_extensions_check(xe, xef, op, extensions);
+			if (err)
+				goto free_bind_ops;
+		}
+
 	}
 
 	return 0;
@@ -2940,7 +3025,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
+	err = vm_bind_ioctl_check_args(xe, xef, args, &bind_ops);
 	if (err)
 		return err;
 
@@ -3067,11 +3152,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
+		u64 extensions = bind_ops[i].extensions;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
-		if (IS_ERR(ops[i])) {
+		if (!IS_ERR(ops[i]) && extensions) {
+			err = vm_bind_op_user_extensions(xe, xef, ops[i],
+							 op, extensions, 0);
+			if (err)
+				goto unwind_ops;
+		} else if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
 			goto unwind_ops;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 557b047ebdd7..1c5776194e54 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -70,6 +70,14 @@ struct xe_userptr {
 #endif
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+struct xe_eudebug_vma_metadata {
+	struct list_head list;
+};
+#else
+struct xe_eudebug_vma_metadata { };
+#endif
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -121,6 +129,11 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	struct {
+		/** @metadata: List of vma debug metadata */
+		struct xe_eudebug_vma_metadata metadata;
+	} eudebug;
 };
 
 /**
@@ -311,6 +324,10 @@ struct xe_vma_op_map {
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
+	struct  {
+		/** @vma_metadata: List of vma debug metadata */
+		struct xe_eudebug_vma_metadata metadata;
+	} eudebug;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
@@ -388,4 +405,14 @@ struct xe_vma_ops {
 #endif
 };
 
+struct xe_vma_debug_metadata {
+	/** @debug.metadata: id of attached xe_debug_metadata */
+	u32 metadata_id;
+	/** @debug.cookie: user defined cookie */
+	u64 cookie;
+
+	/** @link: list of metadata attached to vma */
+	struct list_head link;
+};
+
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0d75a072b838..2416971fbf2d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -886,6 +886,23 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vm_bind_op_ext_attach_debug {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @id: Debug object id from create metadata */
+	__u64 metadata_id;
+
+	/** @flags: Flags */
+	__u64 flags;
+
+	/** @cookie: Cookie */
+	__u64 cookie;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_vm_bind_op - run bind operations
  *
@@ -910,7 +927,9 @@ struct drm_xe_vm_destroy {
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
  */
+
 struct drm_xe_vm_bind_op {
+#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

