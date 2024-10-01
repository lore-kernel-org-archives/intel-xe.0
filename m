Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4F5CEACDC
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB64210E657;
	Tue,  1 Oct 2024 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVTdP7FS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7810E646
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794434; x=1759330434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hc5a03mqzZxeWORmORu/Ac5zJ61EY2wPF15LDxcAe0g=;
 b=DVTdP7FSLR1O6x4e42TaWQCkiNPDidXc/001ntO3hxva0zMNbNDXzTh0
 je77bXIy7zpRA6jzcwQ6um8DJ8yyg5N3Q78H3GxT9z4wuwFFUkE8RlSxD
 3/iCp+Rr7BmHh1qZ8n4eoZ3cO4pBq7RIv3FHpCwZZbBExgQ5keDE7QgQs
 eTxQqlHB8jSZ3DF/j5j/yQJ+d73AcaHkka5Zjce5X9XoSSfR1qXa0iJ2Z
 USJmhnMD/mwlHjV+DwP5A7Kt3G1bEskBIpcmCgQMLhc24pfuzzCDrX6du
 swHMDxSoStp8+Ok0nf5XkJzvfm6m78kcVCCMBo4DaXIeW+OAS5bhWybVc w==;
X-CSE-ConnectionGUID: zijlatSfQimcIXq02D0zPQ==
X-CSE-MsgGUID: Vp2QPRaaQbCNZmzHcLvxQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091426"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:54 -0700
X-CSE-ConnectionGUID: ZfcVM+21SMqx8O6hL3ZeeA==
X-CSE-MsgGUID: gdeMeroyQkO0Ts2E7fumZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048763"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:52 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 15/18] drm/xe/eudebug: Add debug metadata support for
 xe_eudebug
Date: Tue,  1 Oct 2024 17:43:03 +0300
Message-Id: <20241001144306.1991001-16-mika.kuoppala@linux.intel.com>
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

Reflect debug metadata resource creation/destroy as events passed to the
debugger. Introduce ioctl allowing to read metadata content on demand.

Each VMA can have multiple metadata attached and it is passed from user
on BIND or it's copied on internal remap.

Xe EU Debugger on VM BIND will inform about VMA metadata attachements
during bind IOCTL sending proper OP event.

v2:  - checkpatch (Maciej, Tilak)
     - struct alignment (Matthew)
     - Kconfig (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c |   7 +-
 drivers/gpu/drm/xe/xe_eudebug.c        | 328 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h        |  13 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h  |  27 +-
 drivers/gpu/drm/xe/xe_vm.c             |   2 +-
 include/uapi/drm/xe_drm_eudebug.h      |  30 +++
 6 files changed, 396 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index 303640f8ba1f..d02ec99f7ca1 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -9,6 +9,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_macros.h"
 #include "xe_vm.h"
 
@@ -158,7 +159,7 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->type > DRM_XE_DEBUG_METADATA_PROGRAM_MODULE))
+	if (XE_IOCTL_DBG(xe, args->type >= WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, !args->user_addr || !args->len))
@@ -197,6 +198,8 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 	if (err)
 		goto put_mdata;
 
+	xe_eudebug_debug_metadata_create(xef, mdata);
+
 	return 0;
 
 put_mdata:
@@ -222,6 +225,8 @@ int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 	if (XE_IOCTL_DBG(xe, !mdata))
 		return -ENOENT;
 
+	xe_eudebug_debug_metadata_destroy(xef, mdata);
+
 	xe_debug_metadata_put(mdata);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 6ee06a58b640..368e1a987f7a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -20,15 +20,18 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_metadata.h"
 #include "xe_device.h"
 #include "xe_debug_metadata.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue.h"
+#include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -940,7 +943,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -1224,6 +1227,90 @@ static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
 	return ret;
 }
 
+static struct xe_debug_metadata *find_metadata_get(struct xe_eudebug *d,
+						   u32 id)
+{
+	struct xe_debug_metadata *m;
+
+	mutex_lock(&d->res->lock);
+	m = find_resource__unlocked(d->res, XE_EUDEBUG_RES_TYPE_METADATA, id);
+	if (m)
+		kref_get(&m->refcount);
+	mutex_unlock(&d->res->lock);
+
+	return m;
+}
+
+static long xe_eudebug_read_metadata(struct xe_eudebug *d,
+				     unsigned int cmd,
+				     const u64 arg)
+{
+	struct drm_xe_eudebug_read_metadata user_arg;
+	struct xe_debug_metadata *mdata;
+	struct xe_file *xef;
+	struct xe_device *xe = d->xe;
+	long ret = 0;
+
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_WRITE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_READ)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, _IOC_SIZE(cmd) < sizeof(user_arg)))
+		return -EINVAL;
+
+	if (copy_from_user(&user_arg, u64_to_user_ptr(arg), sizeof(user_arg)))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_arg.flags))
+		return -EINVAL;
+
+	if (!access_ok(u64_to_user_ptr(user_arg.ptr), user_arg.size))
+		return -EFAULT;
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	eu_dbg(d,
+	       "read metadata: client_handle=%llu, metadata_handle=%llu, flags=0x%x",
+	       user_arg.client_handle, user_arg.metadata_handle, user_arg.flags);
+
+	xef = find_client_get(d, user_arg.client_handle);
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL;
+
+	mdata = find_metadata_get(d, (u32)user_arg.metadata_handle);
+	if (XE_IOCTL_DBG(xe, !mdata)) {
+		xe_file_put(xef);
+		return -EINVAL;
+	}
+
+	if (user_arg.size) {
+		if (user_arg.size < mdata->len) {
+			ret = -EINVAL;
+			goto metadata_put;
+		}
+
+		/* This limits us to a maximum payload size of 2G */
+		if (copy_to_user(u64_to_user_ptr(user_arg.ptr),
+				 mdata->ptr, mdata->len)) {
+			ret = -EFAULT;
+			goto metadata_put;
+		}
+	}
+
+	user_arg.size = mdata->len;
+
+	if (copy_to_user(u64_to_user_ptr(arg), &user_arg, sizeof(user_arg)))
+		ret = -EFAULT;
+
+metadata_put:
+	xe_debug_metadata_put(mdata);
+	xe_file_put(xef);
+	return ret;
+}
+
 static long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
 
 static long xe_eudebug_ioctl(struct file *file,
@@ -1254,7 +1341,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_vm_open_ioctl(d, arg);
 		eu_dbg(d, "ioctl cmd=VM_OPEN ret=%ld\n", ret);
 		break;
-
+	case DRM_XE_EUDEBUG_IOCTL_READ_METADATA:
+		ret = xe_eudebug_read_metadata(d, cmd, arg);
+		eu_dbg(d, "ioctl cmd=READ_METADATA ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -2559,19 +2649,145 @@ static int vm_bind_op_event(struct xe_eudebug *d,
 	return xe_eudebug_queue_bind_event(d, vm, event);
 }
 
+static int vm_bind_op_metadata_event(struct xe_eudebug *d,
+				     struct xe_vm *vm,
+				     u32 flags,
+				     u64 ref_seqno,
+				     u64 metadata_handle,
+				     u64 metadata_cookie)
+{
+	struct xe_eudebug_event_vm_bind_op_metadata *e;
+	struct xe_eudebug_event *event;
+	const u32 sz = sizeof(*e);
+	u64 seqno;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
+					seqno, flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_vm_bind_op_metadata, e,
+		     vm_bind_op_ref_seqno, ref_seqno);
+	write_member(struct drm_xe_eudebug_event_vm_bind_op_metadata, e,
+		     metadata_handle, metadata_handle);
+	write_member(struct drm_xe_eudebug_event_vm_bind_op_metadata, e,
+		     metadata_cookie, metadata_cookie);
+
+	/* If in discovery, no need to collect ops */
+	if (!completion_done(&d->discovery))
+		return xe_eudebug_queue_event(d, event);
+
+	return xe_eudebug_queue_bind_event(d, vm, event);
+}
+
+static int vm_bind_op_metadata_count(struct xe_eudebug *d,
+				     struct xe_vm *vm,
+				     struct list_head *debug_metadata)
+{
+	struct xe_vma_debug_metadata *metadata;
+	struct xe_debug_metadata *mdata;
+	int h_m = 0, metadata_count = 0;
+
+	if (!debug_metadata)
+		return 0;
+
+	list_for_each_entry(metadata, debug_metadata, link) {
+		mdata = xe_debug_metadata_get(vm->xef, metadata->metadata_id);
+		if (mdata) {
+			h_m = find_handle(d->res, XE_EUDEBUG_RES_TYPE_METADATA, mdata);
+			xe_debug_metadata_put(mdata);
+		}
+
+		if (!mdata || h_m < 0) {
+			if (!mdata) {
+				eu_err(d, "Metadata::%u not found.",
+				       metadata->metadata_id);
+			} else {
+				eu_err(d, "Metadata::%u not in the xe debugger",
+				       metadata->metadata_id);
+			}
+			xe_eudebug_disconnect(d, -ENOENT);
+			return -ENOENT;
+		}
+		metadata_count++;
+	}
+	return metadata_count;
+}
+
+static int vm_bind_op_metadata(struct xe_eudebug *d, struct xe_vm *vm,
+			       const u32 flags,
+			       const u64 op_ref_seqno,
+			       struct list_head *debug_metadata)
+{
+	struct xe_vma_debug_metadata *metadata;
+	int h_m = 0; /* handle space range = <1, MAX_INT>, return 0 if metadata not attached */
+	int metadata_count = 0;
+	int ret;
+
+	if (!debug_metadata)
+		return 0;
+
+	XE_WARN_ON(flags != DRM_XE_EUDEBUG_EVENT_CREATE);
+
+	list_for_each_entry(metadata, debug_metadata, link) {
+		struct xe_debug_metadata *mdata;
+
+		mdata = xe_debug_metadata_get(vm->xef, metadata->metadata_id);
+		if (mdata) {
+			h_m = find_handle(d->res, XE_EUDEBUG_RES_TYPE_METADATA, mdata);
+			xe_debug_metadata_put(mdata);
+		}
+
+		if (!mdata || h_m < 0) {
+			eu_err(d, "Attached debug metadata::%u not found!\n",
+			       metadata->metadata_id);
+			return -ENOENT;
+		}
+
+		ret = vm_bind_op_metadata_event(d, vm, flags, op_ref_seqno,
+						h_m, metadata->cookie);
+		if (ret < 0)
+			return ret;
+
+		metadata_count++;
+	}
+
+	return metadata_count;
+}
+
 static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 		      const u32 flags, const u64 bind_ref_seqno,
-		      u64 addr, u64 range)
+		      u64 addr, u64 range,
+		      struct list_head *debug_metadata)
 {
 	u64 op_seqno = 0;
-	u64 num_extensions = 0;
+	u64 num_extensions;
 	int ret;
 
+	ret = vm_bind_op_metadata_count(d, vm, debug_metadata);
+	if (ret < 0)
+		return ret;
+
+	num_extensions = ret;
+
 	ret = vm_bind_op_event(d, vm, flags, bind_ref_seqno, num_extensions,
 			       addr, range, &op_seqno);
 	if (ret)
 		return ret;
 
+	ret = vm_bind_op_metadata(d, vm, flags, op_seqno, debug_metadata);
+	if (ret < 0)
+		return ret;
+
+	if (ret != num_extensions) {
+		eu_err(d, "Inconsistency in metadata detected.");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -2684,9 +2900,11 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm)
 	xe_eudebug_put(d);
 }
 
-void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range,
+			       struct drm_gpuva_ops *ops)
 {
 	struct xe_eudebug *d;
+	struct list_head *debug_metadata = NULL;
 	u32 flags;
 
 	if (!xe_vm_in_lr_mode(vm))
@@ -2696,7 +2914,17 @@ void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 	{
+		struct drm_gpuva_op *__op;
+
 		flags = DRM_XE_EUDEBUG_EVENT_CREATE;
+
+		/* OP_MAP will be last and singleton */
+		drm_gpuva_for_each_op(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+			if (op->base.op == DRM_GPUVA_OP_MAP)
+				debug_metadata = &op->map.vma->eudebug.metadata.list;
+		}
 		break;
 	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
@@ -2715,7 +2943,8 @@ void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
 	if (!d)
 		return;
 
-	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, addr, range));
+	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, addr, range,
+					   debug_metadata));
 }
 
 static struct xe_eudebug_event *fetch_bind_event(struct xe_vm * const vm)
@@ -2844,8 +3073,89 @@ int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
 	return err;
 }
 
+static int send_debug_metadata_event(struct xe_eudebug *d, u32 flags,
+				     u64 client_handle, u64 metadata_handle,
+				     u64 type, u64 len, u64 seqno)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_metadata *e;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_METADATA, seqno,
+					flags, sizeof(*e), GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_metadata, e, client_handle, client_handle);
+	write_member(struct drm_xe_eudebug_event_metadata, e, metadata_handle, metadata_handle);
+	write_member(struct drm_xe_eudebug_event_metadata, e, type, type);
+	write_member(struct drm_xe_eudebug_event_metadata, e, len, len);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int debug_metadata_create_event(struct xe_eudebug *d,
+				       struct xe_file *xef, struct xe_debug_metadata *m)
+{
+	int h_c, h_m;
+	u64 seqno;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_m = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_METADATA, m, &seqno);
+	if (h_m <= 0)
+		return h_m;
+
+	return send_debug_metadata_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+					 h_c, h_m, m->type, m->len, seqno);
+}
+
+static int debug_metadata_destroy_event(struct xe_eudebug *d,
+					struct xe_file *xef, struct xe_debug_metadata *m)
+{
+	int h_c, h_m;
+	u64 seqno;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_m = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_METADATA, m, &seqno);
+	if (h_m < 0)
+		return h_m;
+
+	return send_debug_metadata_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
+					 h_c, h_m, m->type, m->len, seqno);
+}
+
+void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m)
+{
+	struct xe_eudebug *d;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, debug_metadata_create_event(d, xef, m));
+}
+
+void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m)
+{
+	struct xe_eudebug *d;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
+	struct xe_debug_metadata *m;
 	struct xe_exec_queue *q;
 	struct xe_vm *vm;
 	unsigned long i;
@@ -2855,6 +3165,12 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 	if (err)
 		return err;
 
+	xa_for_each(&xef->eudebug.metadata.xa, i, m) {
+		err = debug_metadata_create_event(d, xef, m);
+		if (err)
+			break;
+	}
+
 	xa_for_each(&xef->vm.xa, i, vm) {
 		err = vm_create_event(d, xef, vm);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ae720a1b05d9..766d0a94d200 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -16,6 +16,8 @@ struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
 struct xe_user_fence;
+struct xe_debug_metadata;
+struct drm_gpuva_ops;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -39,7 +41,8 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 
 void xe_eudebug_vm_init(struct xe_vm *vm);
 void xe_eudebug_vm_bind_start(struct xe_vm *vm);
-void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range,
+			       struct drm_gpuva_ops *ops);
 void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
 
 int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
@@ -49,6 +52,9 @@ void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m);
+void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -71,7 +77,7 @@ static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_
 
 static inline void xe_eudebug_vm_init(struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_bind_start(struct xe_vm *vm) { }
-static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range) { }
+static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range, struct drm_gpuva_ops *ops) { }
 static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err) { }
 
 static inline int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence) { return 0; }
@@ -81,6 +87,9 @@ static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
 static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
 static inline void xe_eudebug_put(struct xe_eudebug *d) { }
 
+static inline void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m) { }
+static inline void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index aae7bc476c7e..b79d4c078216 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -56,7 +56,8 @@ struct xe_eudebug_resource {
 #define XE_EUDEBUG_RES_TYPE_VM		1
 #define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE	2
 #define XE_EUDEBUG_RES_TYPE_LRC		3
-#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
+#define XE_EUDEBUG_RES_TYPE_METADATA	4
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_METADATA + 1)
 
 /**
  * struct xe_eudebug_resources - eudebug resources for all types
@@ -300,4 +301,28 @@ struct xe_eudebug_event_vm_bind_ufence {
 	u64 vm_bind_ref_seqno;
 };
 
+struct xe_eudebug_event_metadata {
+	struct xe_eudebug_event base;
+
+	/** @client_handle: client for the attention */
+	u64 client_handle;
+
+	/** @metadata_handle: debug metadata handle it's created/destroyed */
+	u64 metadata_handle;
+
+	/* @type: metadata type, refer to xe_drm.h for options */
+	u64 type;
+
+	/* @len: size of metadata paylad */
+	u64 len;
+};
+
+struct xe_eudebug_event_vm_bind_op_metadata {
+	struct xe_eudebug_event base;
+	u64 vm_bind_op_ref_seqno;
+
+	u64 metadata_handle;
+	u64 metadata_cookie;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8c48223892c6..24a7ee1a6e58 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3172,7 +3172,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto unwind_ops;
 
-		xe_eudebug_vm_bind_op_add(vm, op, addr, range);
+		xe_eudebug_vm_bind_op_add(vm, op, addr, range, ops[i]);
 
 #ifdef TEST_VM_OPS_ERROR
 		if (flags & FORCE_OP_ERROR) {
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 9917280400d6..2ebf21e15f5b 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -19,6 +19,7 @@ extern "C" {
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
 #define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -34,6 +35,8 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
+#define DRM_XE_EUDEBUG_EVENT_METADATA		9
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -188,6 +191,33 @@ struct drm_xe_eudebug_vm_open {
 	__u64 timeout_ns;
 };
 
+struct drm_xe_eudebug_read_metadata {
+	__u64 client_handle;
+	__u64 metadata_handle;
+	__u32 flags;
+	__u32 reserved;
+	__u64 ptr;
+	__u64 size;
+};
+
+struct drm_xe_eudebug_event_metadata {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 metadata_handle;
+	/* XXX: Refer to xe_drm.h for fields */
+	__u64 type;
+	__u64 len;
+};
+
+struct drm_xe_eudebug_event_vm_bind_op_metadata {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_op_ref_seqno; /* *_event_vm_bind_op.base.seqno */
+
+	__u64 metadata_handle;
+	__u64 metadata_cookie;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

