Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF006C001DD
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2C110E2DF;
	Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96110E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269760; x=1730805760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1X2q6qzCAdtwrhqSflkiCKz50LTnLup6+MuFlOvKUAY=;
 b=NwuM3Nzh7pYB0T80guKvHWGJuu7Faq9WEeQ15RAwjzqxP6mD5V6WcB1w
 UKMNAZd9H3AfSj3O34AMUA3VfwwbPSvoI4osu4ACfHeznQcFhs9I4C9Iq
 q5eCnCjagWI0IgTbgw4CUqfRH2B5oiHIjw8SZlelUa78UCYFCdFbDHfRF
 9dqq07WjrCu7Ve6grn12/XI2hPhJotcTfWBsbalfNOVN5LU0wzXFiUQhF
 zdx7Bvw9HY4uHqNIhW31CbVMgNt9wdAUk/MNAX62nexJx6xl5uDfsmdT8
 eOTDHIIbcyvTc2iAgjzcBUESQyW6wZjDp9SiTdvLFRLxOpfZjETk2INiY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646868"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646868"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411722"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411722"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:37 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:40 +0200
Message-Id: <20231106111845.2333093-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 20/25] drm/xe: Set vm debug metadata
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

Implement set debug metadata vm extension, which allow to the vm
debug information needed by dbgUMD.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_usercoredump.c       |  51 +++++++++-
 drivers/gpu/drm/xe/xe_usercoredump_types.h |   7 ++
 drivers/gpu/drm/xe/xe_vm.c                 | 107 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h           |  23 +++++
 4 files changed, 177 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
index 95a893a31302..27b201641e4d 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.c
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -5,7 +5,6 @@
 
 #include "xe_usercoredump.h"
 
-#include <drm/xe_drm.h>
 
 #include "xe_debug_metadata.h"
 #include "xe_device_types.h"
@@ -206,9 +205,11 @@ static void capture_vmas(struct xe_user_state_snapshot *s,
 }
 
 static void capture_metadata(struct xe_user_state_snapshot *s,
-			     struct xe_file *xef)
+			     struct xe_file *xef,
+			     struct xe_vm *vm)
 {
 	struct xe_debug_metadata_snapshot *ms;
+	struct xe_vm_debug_metadata *vmd;
 	struct xe_debug_metadata *mdata;
 	unsigned long i;
 
@@ -225,6 +226,17 @@ static void capture_metadata(struct xe_user_state_snapshot *s,
 		ms->mdata = mdata;
 	}
 	mutex_unlock(&xef->debug_metadata.lock);
+
+	xe_vm_get(vm);
+	list_for_each_entry(vmd, &vm->debug_metadata, link) {
+
+		if (vmd->type >= ARRAY_SIZE(s->vm_metadata))
+			continue;
+
+		s->vm_metadata[vmd->type].value = vmd->offset;
+		s->vm_metadata[vmd->type].len = vmd->len;
+	}
+	xe_vm_put(vm);
 }
 
 static void hexdump(struct drm_printer *m, const void *buf, size_t len)
@@ -286,11 +298,28 @@ static const char *debug_metadata_type_to_str(const u64 type)
 	return "unknown";
 }
 
+static const char *vm_metadata_type_to_str(const u64 type)
+{
+	switch (type) {
+	case DRM_XE_VM_DEBUG_METADATA_COOKIE:
+		return "Cookie";
+	case DRM_XE_VM_DEBUG_METADATA_MODULE_AREA:
+		return "Module area";
+	case DRM_XE_VM_DEBUG_METADATA_SBA_AREA:
+		return "Sba area";
+	case DRM_XE_VM_DEBUG_METADATA_SIP_AREA:
+		return "Sip area";
+	}
+
+	return "Unknown";
+}
+
 void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 				  struct drm_printer *p)
 {
 	struct xe_vma_snapshot *v;
 	struct xe_debug_metadata_snapshot *ms;
+	int i;
 
 	drm_printf(p, "PID: %d\n", pid_vnr(s->pid));
 	drm_printf(p, "Comm: %s\n", s->comm);
@@ -302,10 +331,22 @@ void xe_user_state_snapshot_print(struct xe_user_state_snapshot *s,
 	mutex_unlock(&s->vmas.lock);
 
 	list_for_each_entry(ms, &s->metadata_list, link) {
-		drm_printf(p, "Metadata id=%llu of type %s:\n",
-			   ms->mdata->id, debug_metadata_type_to_str(ms->mdata->type));
+		drm_printf(p, "Metadata id:%llu s:0x%016llx of type %s:\n",
+			   ms->mdata->id, ms->mdata->len,
+			   debug_metadata_type_to_str(ms->mdata->type));
 		hexdump(p, ms->mdata->ptr, ms->mdata->len);
 	}
+
+	for (i = 0; i < ARRAY_SIZE(s->vm_metadata); i++)
+		if (i == DRM_XE_VM_DEBUG_METADATA_COOKIE)
+			drm_printf(p, "%s: 0x%016llx\n",
+				   vm_metadata_type_to_str(i), s->vm_metadata[i].value);
+		else
+			drm_printf(p, "%s: 0x%08x_%08x size=0x%llx\n",
+				   vm_metadata_type_to_str(i),
+				   upper_32_bits(s->vm_metadata[i].value),
+				   lower_32_bits(s->vm_metadata[i].value),
+				   s->vm_metadata[i].len);
 }
 
 struct xe_user_state_snapshot *
@@ -337,7 +378,7 @@ xe_user_state_snapshot_capture(struct xe_exec_queue *q)
 	}
 
 	capture_vmas(s, q);
-	capture_metadata(s, xef);
+	capture_metadata(s, xef, q->vm);
 
 
 	return s;
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
index c69590affde7..10950e127670 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -11,6 +11,8 @@
 #include <linux/sched.h>
 #include <linux/xarray.h>
 
+#include <drm/xe_drm.h>
+
 struct xe_device;
 struct xe_pidroot;
 struct xe_debug_metadata;
@@ -52,6 +54,11 @@ struct xe_user_state_snapshot {
 
 	struct list_head metadata_list;
 
+	struct {
+		u64 value;
+		u64 len;
+	} vm_metadata[DRM_XE_VM_DEBUG_METADATA_NUM];
+
 	struct pid *pid;
 	u64 client_id; /* drm client id */
 	char comm[TASK_COMM_LEN];
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a284fd1fdad6..9c0d7f6a09e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1372,6 +1372,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
 	INIT_LIST_HEAD(&vm->extobj.list);
+	INIT_LIST_HEAD(&vm->debug_metadata);
 
 	vm->pt_ops = &xelp_pt_ops;
 
@@ -1613,6 +1614,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_vm *vm =
 		container_of(w, struct xe_vm, destroy_work);
 	struct xe_device *xe = vm->xe;
+	struct xe_vm_debug_metadata *vmd, *tmp;
 	struct xe_tile *tile;
 	u8 id;
 	void *lookup;
@@ -1645,6 +1647,11 @@ static void vm_destroy_work_func(struct work_struct *w)
 	}
 	xe_vm_unlock(vm);
 
+	list_for_each_entry_safe(vmd, tmp, &vm->debug_metadata, link) {
+		list_del(&vmd->link);
+		kfree(vmd);
+	}
+
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
 	dma_resv_fini(&vm->resv);
@@ -1921,6 +1928,92 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
+typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
+				       u64 extension);
+
+static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
+				    u64 extension)
+{
+	XE_IOCTL_DBG(xe, extension);
+	return -EINVAL;
+}
+
+static int vm_user_set_debug_metadata(struct xe_device *xe, struct xe_vm *vm,
+				      u64 extension)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_ext_vm_set_debug_metadata ext;
+	struct xe_vm_debug_metadata *vmd;
+	int err;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.type > DRM_XE_VM_DEBUG_METADATA_SIP_AREA))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.type == DRM_XE_VM_DEBUG_METADATA_COOKIE &&
+			 (ext.len || !ext.cookie)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.type != DRM_XE_VM_DEBUG_METADATA_COOKIE &&
+			 !ext.len))
+		return -EINVAL;
+
+	list_for_each_entry(vmd, &vm->debug_metadata, link)
+		if (XE_IOCTL_DBG(xe, ext.type == vmd->type))
+			return -EEXIST;
+
+	vmd = kzalloc(sizeof(*vmd), GFP_KERNEL);
+	if (!vmd)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&vmd->link);
+	list_add(&vmd->link, &vm->debug_metadata);
+	vmd->offset = ext.offset;
+	vmd->type = ext.type;
+	vmd->len = ext.len;
+
+	return 0;
+}
+
+static const xe_vm_user_extension_fn vm_user_extension_funcs[] = {
+	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
+	[XE_VM_EXTENSION_SET_DEBUG_METADATA] = vm_user_set_debug_metadata,
+};
+
+#define MAX_USER_EXTENSIONS	16
+static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
+			      u64 extensions, int ext_number)
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
+			 ARRAY_SIZE(vm_user_extension_funcs)))
+		return -EINVAL;
+
+	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return vm_user_extensions(xe, vm, ext.next_extension,
+					  ++ext_number);
+
+	return 0;
+}
+
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
@@ -1938,9 +2031,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
-	if (XE_IOCTL_DBG(xe, args->extensions))
-		return -EINVAL;
-
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
 
@@ -1970,9 +2060,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 xe_device_in_fault_mode(xe)))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->extensions))
-		return -EINVAL;
-
 	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
@@ -1986,6 +2073,14 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	if (args->extensions) {
+		err = vm_user_extensions(xe, vm, args->extensions, 0);
+		if (XE_IOCTL_DBG(xe, err)) {
+			xe_vm_close_and_put(vm);
+			return err;
+		}
+	}
+
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bbf192587ff3..8c3d199fa478 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -329,6 +329,9 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	/** @debug_metadata: List of vm debug metadata */
+	struct list_head debug_metadata;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
@@ -423,4 +426,24 @@ struct xe_vma_op {
 	};
 };
 
+/** struct xe_vm_debug_metadata - vm creation time metadata for eu debug */
+struct xe_vm_debug_metadata {
+	/** @type: Type of metadata */
+	u64 type;
+
+	union {
+		/** @cookie: Cookie value to attach if type is METADATA_COOKIE */
+		u64 cookie;
+
+		/** @offset: Offset into vm where metadata starts */
+		u64 offset;
+	};
+
+	/** @len: Length of metadata in bytes or zero for cookie */
+	u64 len;
+
+	/** @link: list of metadata attached to vm */
+	struct list_head link;
+};
+
 #endif
-- 
2.34.1

