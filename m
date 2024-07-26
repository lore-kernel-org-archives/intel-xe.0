Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ADDC3DA70
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A08510E9A8;
	Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0tExSZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E92710E9A8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003461; x=1753539461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gR6pn2uB7PUXMc7wtEDlRdifXMPzyBw6vBOkdeCOKvs=;
 b=n0tExSZNtTiv/MtuzRypXkeGIX5anI2Y1f//i1DGQ2KuAEwmTVSHIADD
 4KDMa5nUc5zA6uX6J+Kq5j/5RYEdwsOtbYp2wiS4hW72iKcYa8c0yeNCx
 tTatkdBTH46vlqNFeh2McIQnSK4kTCyerK86F2lTBmxngK9G0FxhwmyR3
 gR/vgdjMHXOpWf/sFnAh5dnw7QuLTDNrKjm/PsFutL5cwAV+T1/jHO2es
 Uk6vEm7f55VUdyrsdOEdQa1Z4i1LYbX72aytrVC70bKv4zju0RDECo30x
 Nj+X84OytrgYPKuQaPxb5PeSKOTtOg48RwQj+J636kShjwo4EYY0dscM3 g==;
X-CSE-ConnectionGUID: aH6QEUHLR9WicKEoANLfHg==
X-CSE-MsgGUID: f5lWL/vKRiuxa4n25b9FBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598779"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:41 -0700
X-CSE-ConnectionGUID: xbClohJbTui+q20u0x3wcQ==
X-CSE-MsgGUID: lu+E8fEPQUKngr/gll4Uvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861461"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:39 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 17/21] drm/xe: Attach debug metadata to vma
Date: Fri, 26 Jul 2024 17:08:14 +0300
Message-Id: <20240726140818.54304-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c |  13 ++
 drivers/gpu/drm/xe/xe_debug_metadata.h |   2 +
 drivers/gpu/drm/xe/xe_vm.c             | 198 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h       |  15 ++
 include/uapi/drm/xe_drm.h              |  19 +++
 5 files changed, 243 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index 8d99170d3591..daffc13c58d6 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -24,6 +24,19 @@ void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
 	kref_put(&mdata->refcount, xe_debug_metadata_release);
 }
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id)
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
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
index abaea076c12d..deca24fa2cba 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.h
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -10,7 +10,9 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_file;
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id);
 void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
 
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b117a892e386..9e27ae9d64e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -24,6 +24,7 @@
 #include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_metadata.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
@@ -940,6 +941,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+	INIT_LIST_HEAD(&vma->debug_metadata);
+
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -1003,6 +1006,48 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	return vma;
 }
 
+static void vma_free_debug_metadata(struct list_head *debug_metadata)
+{
+	struct xe_vma_debug_metadata *vmad, *tmp;
+
+	list_for_each_entry_safe(vmad, tmp, debug_metadata, link) {
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
+static int vma_debug_metadata_copy(struct xe_vma *from,
+				   struct xe_vma *to)
+{
+	struct xe_vma_debug_metadata *vmad, *vma;
+
+	list_for_each_entry(vmad, &from->debug_metadata, link) {
+		vma = vma_new_debug_metadata(vmad->metadata_id, vmad->cookie);
+		if (IS_ERR(vma))
+			return PTR_ERR(vma);
+
+		list_add_tail(&vmad->link, &to->debug_metadata);
+	}
+	return 0;
+}
+
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -1032,6 +1077,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(xe_vma_bo(vma));
 	}
 
+	vma_free_debug_metadata(&vma->debug_metadata);
 	xe_vma_free(vma);
 }
 
@@ -2005,6 +2051,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+
+			INIT_LIST_HEAD(&op->map.debug_metadata);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2195,11 +2243,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
-				      flags);
+			vma = new_vma(vm, &op->base.map, op->map.pat_index, flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
+			list_splice_tail_init(&op->map.debug_metadata, &vma->debug_metadata);
 			op->map.vma = vma;
 			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
 				xe_vma_ops_incr_pt_update_ops(vops,
@@ -2230,6 +2278,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				list_splice_tail_init(&old->debug_metadata, &vma->debug_metadata);
+
 				op->remap.prev = vma;
 
 				/*
@@ -2269,6 +2319,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				if (op->base.remap.prev) {
+					err = vma_debug_metadata_copy(op->remap.prev,
+								      vma);
+					if (err)
+						return err;
+				} else {
+					list_splice_tail_init(&old->debug_metadata,
+							      &vma->debug_metadata);
+				}
+
 				op->remap.next = vma;
 
 				/*
@@ -2319,6 +2379,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (op->map.vma) {
+			vma_free_debug_metadata(&op->map.debug_metadata);
 			prep_vma_destroy(vm, op->map.vma, post_commit);
 			xe_vma_destroy_unlocked(op->map.vma);
 		}
@@ -2557,6 +2618,120 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 	}
 
 	return number_tiles;
+};
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
+	list_add_tail(&vmad->link, &op->map.debug_metadata);
+	return 0;
+}
+
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
@@ -2753,6 +2928,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
+				    struct xe_file *xef,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
 {
@@ -2796,6 +2972,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		u64 extensions = (*bind_ops)[i].extensions;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -2856,6 +3033,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -2958,7 +3142,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
+	err = vm_bind_ioctl_check_args(xe, xef, args, &bind_ops);
 	if (err)
 		return err;
 
@@ -3086,11 +3270,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index da9d7ef6ab8f..fe64ce6ed1d9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -121,6 +121,9 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/** @debug_metadata: List of vma debug metadata */
+	struct list_head debug_metadata;
 };
 
 /**
@@ -309,6 +312,8 @@ struct xe_vma_op_map {
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
+	/** @debug_metadata: List of attached debug metadata */
+	struct list_head debug_metadata;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
@@ -386,4 +391,14 @@ struct xe_vma_ops {
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
index cddc36c9be02..eab503754735 100644
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

