Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D37C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9410E2E8;
	Mon,  6 Nov 2023 11:22:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1B610E2E2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269763; x=1730805763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnmJNyNU3ieSMzKmYiHLY0qfh06g/+aO0B2CQi6UTBA=;
 b=WTOjtXyTaITfzONBPFN2YUg8nJueapprkm0+u1wEKf1Z7TqPBEW4TGSs
 4cAVFlC5JeNBpddFcEyLTdEPPaFvXHd733Vyzpxx9ysj3NioaZ6B5qmPZ
 VJtvtXeQudeuJESCSDZeLgKKqMPwKaBSHGs/UnumE/dEgWNlrYvqWjtGC
 E/YytmRTrDy9JAcdP6+z96cgTYzNl7jvb5QOENodwPMFJ3ypobalLyzU0
 q499UIyV7sOL/YOqWLXdIOQRkahISRe/av83Hdzx712PVNb5/lIgpSuxb
 R20IAQFJ4dj9ymECYoFGQ55vD80jeNO1QPnTd8YC0h77hvsg9wIwfBhPj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646878"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411741"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411741"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:40 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:42 +0200
Message-Id: <20231106111845.2333093-23-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 22/25] RFC: xe/drm: attach debug metadata to vma
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c |  15 ++-
 drivers/gpu/drm/xe/xe_debug_metadata.h |   3 +
 drivers/gpu/drm/xe/xe_vm.c             | 140 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h       |  13 +++
 4 files changed, 163 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index 7c4034d9223c..4c2a1f8c9a88 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -23,6 +23,19 @@ void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
 	kref_put(&mdata->refcount, xe_debug_metadata_release);
 }
 
+struct xe_debug_metadata *xe_debug_metadata_lookup(struct xe_file *xef, u32 id)
+{
+	struct xe_debug_metadata *mdata;
+
+	mutex_lock(&xef->debug_metadata.lock);
+	mdata = xa_load(&xef->debug_metadata.xa, id);
+	if (mdata)
+		kref_get(&mdata->refcount);
+	mutex_unlock(&xef->debug_metadata.lock);
+
+	return mdata;
+}
+
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 				   void *data,
 				   struct drm_file *file)
@@ -68,7 +81,7 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 	}
 
 	mutex_lock(&xef->debug_metadata.lock);
-	err = xa_alloc(&xef->debug_metadata.xa, &id, mdata, xa_limit_32b, GFP_KERNEL);
+	err = xa_alloc(&xef->debug_metadata.xa, &id, mdata, XA_LIMIT(1, UINT_MAX), GFP_KERNEL);
 	mutex_unlock(&xef->debug_metadata.lock);
 
 	args->id = id;
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
index abaea076c12d..fd2706431bd9 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.h
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -10,9 +10,12 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_file;
 
 void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
 
+struct xe_debug_metadata *xe_debug_metadata_lookup(struct xe_file *xef, u32 id);
+
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 				   void *data,
 				   struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9c0d7f6a09e0..480427a30b05 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -19,6 +19,7 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_metadata.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
@@ -2366,7 +2367,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null, bool capture)
+			      u8 tile_mask, bool read_only, bool is_null, bool capture,
+			      u32 metadata, u64 cookie)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2383,6 +2385,10 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null, capture,
 			    tile_mask);
+
+	vma->debug.metadata = metadata;
+	vma->debug.cookie = cookie;
+
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2528,7 +2534,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			vma = new_vma(vm, &op->base.map,
 				      op->tile_mask, op->map.read_only,
-				      op->map.is_null, op->map.capture);
+				      op->map.is_null, op->map.capture,
+				      op->map.metadata.id, op->map.metadata.cookie);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2554,7 +2561,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      op->tile_mask, read_only,
-					      is_null, op->map.capture);
+					      is_null, op->map.capture,
+					      op->map.metadata.id, op->map.metadata.cookie);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2578,10 +2586,14 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			if (op->base.remap.next) {
 				struct xe_vma *vma;
+
+				struct xe_vma *old =
+				gpuva_to_vma(op->base.remap.unmap->va);
+				u32 metadata = old->debug.metadata;
+				u64 cookie = old->debug.cookie;
 				bool read_only =
 					op->base.remap.unmap->va->flags &
 					XE_VMA_READ_ONLY;
-
 				bool is_null =
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
@@ -2591,7 +2603,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.next,
 					      op->tile_mask, read_only,
-					      is_null, capture);
+					      is_null, capture,
+					      metadata, cookie);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2932,6 +2945,104 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
+typedef int (*xe_vm_bind_op_user_extension_fn)(struct xe_device *xe,
+					       struct xe_file *xef,
+					       struct drm_gpuva_ops *ops,
+					       u32 operation, u64 extension);
+
+static int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+				       struct xe_file *xef,
+				       struct drm_gpuva_ops *ops,
+				       u32 operation, u64 extension)
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
+			 operation != XE_VM_BIND_OP_MAP_USERPTR &&
+			 operation != XE_VM_BIND_OP_MAP))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.flags))
+		return -EINVAL;
+
+	mdata = xe_debug_metadata_lookup(xef, (u32)ext.id);
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
+			op->map.metadata.id = ext.id;
+			op->map.metadata.flags = ext.flags;
+			op->map.metadata.cookie = ext.cookie;
+		}
+	}
+
+	return 0;
+}
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
+	struct xe_user_extension ext;
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
+}
+
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
@@ -2948,6 +3059,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
+				    struct xe_file *xef,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops,
 				    bool *async)
@@ -2990,6 +3102,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 region = (*bind_ops)[i].region;
 		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
 		bool capture = flags & XE_VM_BIND_FLAG_CAPTURE;
+		u64 extensions = (*bind_ops)[i].extensions;
 
 		if (i == 0) {
 			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
@@ -3044,6 +3157,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3072,7 +3192,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
+	err = vm_bind_ioctl_check_args(xe, xef, args, &bind_ops, &async);
 	if (err)
 		return err;
 
@@ -3211,11 +3331,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
+		u64 extensions = bind_ops[i].extensions;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  tile_mask, region);
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
index 8c3d199fa478..bfbc577e0a0c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -123,6 +123,13 @@ struct xe_vma {
 		struct list_head link;
 	} extobj;
 
+	struct {
+		/** @debug.metadata: id of attached xe_debug_metadata */
+		u32 metadata;
+		/** @debug.cookie: user defined cookie */
+		u64 cookie;
+	} debug;
+
 	/**
 	 * @userptr: user pointer state, only allocated for VMAs that are
 	 * user pointers
@@ -346,6 +353,12 @@ struct xe_vma_op_map {
 	bool is_null;
 	/** @capture:: Try to include in devcoredump */
 	bool capture;
+	/** @metadata: attached debug metadata */
+	struct {
+		u32 id;
+		u64 flags;
+		u64 cookie;
+	} metadata;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
-- 
2.34.1

