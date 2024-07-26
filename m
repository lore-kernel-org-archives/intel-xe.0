Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B9C3DA7E
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502C10E9A9;
	Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cm3UMFLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E2C10E9A8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003463; x=1753539463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QjFS/YS31ckKQKgvsMKU8dsydcz/CrI2JuCIfTCEYvs=;
 b=cm3UMFLuan0A7Mw3Ziao+H5iqAINIfTIGBycX8DCQ4kMpWfDtlNBsd8j
 +9mBPit0EvfPpR0SFGCQf7bwjALSskUOsKk8GEcGv31gMdXlKlgolH//2
 HsEp3+F+q0F/+xyPXpNvcohsyHAl4t6eaR6QVVMK4iv6fXx5HyjZHeSHw
 VugZj/sLFhNr2v5giLMz90mz5eRis1qO5bK1+n/rO/36YhuVS07tEa78C
 pV9Ee7PVR5m0M6cGpINGh6FzL8ly9GeRGOljkqvDwjd69dwLLfLGUgoZL
 enQox+V6Msy2WoFxvyZHKAR/V/DU9U4apugOmHmioNzxrmXwB4UiooWpF A==;
X-CSE-ConnectionGUID: GLRgAwjCRVGriGbnv6AdXg==
X-CSE-MsgGUID: YLWT1ASlQHK3+1z/VUR5dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598784"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:42 -0700
X-CSE-ConnectionGUID: vs9e2hRLTgy6w8xxlW6Knw==
X-CSE-MsgGUID: 3LC7RQt0RvKTH5qjMsKnOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861464"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:41 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 18/21] drm/xe/eudebug: Add debug metadata support for
 xe_eudebug
Date: Fri, 26 Jul 2024 17:08:15 +0300
Message-Id: <20240726140818.54304-19-mika.kuoppala@linux.intel.com>
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

Reflect debug metadata resource creation/destroy as events passed to the
debugger. Introduce ioctl allowing to read metadata content on demand.

Each VMA can have multiple metadata attached and it is passed from user
on BIND or it's copied on internal remap.

Xe EU Debugger on VM BIND will inform about VMA metadata attachements
during bind IOCTL sending proper OP event.

v2: checkpatch (Maciej) v2: struct alignment (Matthew)
v3: squash and typos (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c |   7 +-
 drivers/gpu/drm/xe/xe_eudebug.c        | 326 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h        |   8 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h  |  27 +-
 drivers/gpu/drm/xe/xe_vm.c             |   2 +-
 include/uapi/drm/xe_drm_eudebug.h      |  32 ++-
 6 files changed, 392 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index daffc13c58d6..31e943248cfc 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -9,6 +9,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_macros.h"
 
 static void xe_debug_metadata_release(struct kref *ref)
@@ -51,7 +52,7 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->type > DRM_XE_DEBUG_METADATA_PROGRAM_MODULE))
+	if (XE_IOCTL_DBG(xe, args->type >= WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, !args->user_addr || !args->len))
@@ -90,6 +91,8 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 	if (err)
 		goto put_mdata;
 
+	xe_eudebug_debug_metadata_create(xef, mdata);
+
 	return 0;
 
 put_mdata:
@@ -115,6 +118,8 @@ int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 	if (XE_IOCTL_DBG(xe, !mdata))
 		return -ENOENT;
 
+	xe_eudebug_debug_metadata_destroy(xef, mdata);
+
 	xe_debug_metadata_put(mdata);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 947331c19f43..f0bec8c8bba1 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -28,6 +28,7 @@
 #include "xe_eudebug_types.h"
 #include "xe_eudebug.h"
 #include "xe_exec_queue_types.h"
+#include "xe_debug_metadata.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_execlist_types.h"
 #include "xe_mmio.h"
@@ -763,6 +764,23 @@ static struct xe_vm *find_vm(struct xe_eudebug *d, const u32 id)
 	return NULL;
 }
 
+static struct xe_debug_metadata *find_metadata_get(struct xe_eudebug *d,
+						   u32 id)
+{
+	struct xe_debug_metadata *m = NULL;
+	struct xe_eudebug_handle *h;
+
+	mutex_lock(&d->res->lock);
+	h = __find_resource(d->res, XE_EUDEBUG_RES_TYPE_METADATA, id);
+	if (h) {
+		m = (struct xe_debug_metadata *)h->key;
+		kref_get(&m->refcount);
+	}
+	mutex_unlock(&d->res->lock);
+
+	return m;
+}
+
 static int _xe_eudebug_add_handle(struct xe_eudebug *d,
 				  int type,
 				  void *p,
@@ -1215,6 +1233,73 @@ static long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg)
 	return ret;
 }
 
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
+	xef = find_client(d, user_arg.client_handle);
+	if (XE_IOCTL_DBG(xe, !xef))
+		return -EINVAL;
+
+	mdata = find_metadata_get(d, (u32)user_arg.metadata_handle);
+	if (XE_IOCTL_DBG(xe, !mdata))
+		return -EINVAL;
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
+	return ret;
+}
+
 static long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg);
 
 static long xe_eudebug_ioctl(struct file *file,
@@ -1241,7 +1326,10 @@ static long xe_eudebug_ioctl(struct file *file,
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
@@ -2495,19 +2583,145 @@ static int vm_bind_op_event(struct xe_eudebug *d,
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
+			if (!mdata)
+				eu_err(d, "Metadata::%u not found.",
+				       metadata->metadata_id);
+			else
+				eu_err(d, "Metadata::%u not in the xe debugger",
+				       metadata->metadata_id);
+			xe_eudebug_disconnect(d, -ENOENT);
+			return -ENOENT;
+		}
+		metadata_count++;
+	}
+	return metadata_count;
+}
+
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
 
@@ -2609,16 +2823,28 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm)
 	xe_eudebug_put(d);
 }
 
-void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range,
+			       struct drm_gpuva_ops *ops)
 {
 	struct xe_eudebug *d;
+	struct list_head *debug_metadata = NULL;
 	u32 flags;
 
 	switch (op) {
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
+				debug_metadata = &op->map.vma->debug_metadata;
+		}
 		break;
 	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
@@ -2637,7 +2863,8 @@ void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range)
 	if (!d)
 		return;
 
-	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, addr, range));
+	xe_eudebug_event_put(d, vm_bind_op(d, vm, flags, 0, addr, range,
+					   debug_metadata));
 }
 
 static struct xe_eudebug_event *fetch_bind_event(struct xe_vm * const vm)
@@ -2763,8 +2990,89 @@ int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
 	return 0;
 }
 
+static int send_debug_metadata_event(struct xe_eudebug *d, u32 flags,
+				     u64 client_handle, u64 metadata_handle,
+				     u64 type, u64 len, u64 seqno)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_metadata *e;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_METADATA, seqno,
+				       flags, sizeof(*e), GFP_KERNEL);
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
+				       struct xe_file *xef, struct xe_debug_metadata *m)
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
@@ -2774,6 +3082,14 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 	if (err)
 		return err;
 
+	mutex_lock(&xef->debug_metadata.lock);
+	xa_for_each(&xef->debug_metadata.xa, i, m) {
+		err = debug_metadata_create_event(d, xef, m);
+		if (err)
+			break;
+	}
+	mutex_unlock(&xef->debug_metadata.lock);
+
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, i, vm) {
 		err = vm_create_event(d, xef, vm);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 3de54802a6ca..02c9ba56e752 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -16,6 +16,8 @@ struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
 struct xe_user_fence;
+struct xe_debug_metadata;
+struct drm_gpuva_ops;
 
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
@@ -36,7 +38,8 @@ void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
 void xe_eudebug_vm_bind_start(struct xe_vm *vm);
-void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
+void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range,
+			       struct drm_gpuva_ops *ops);
 void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
 
 int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
@@ -44,4 +47,7 @@ int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
 struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m);
+void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index a32c51416b5f..073629eb4809 100644
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
@@ -298,4 +299,28 @@ struct xe_eudebug_event_vm_bind_ufence {
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
index 9e27ae9d64e6..26f34055f5f8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3290,7 +3290,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto unwind_ops;
 
-		xe_eudebug_vm_bind_op_add(vm, op, addr, range);
+		xe_eudebug_vm_bind_op_add(vm, op, addr, range, ops[i]);
 
 #ifdef TEST_VM_OPS_ERROR
 		if (flags & FORCE_OP_ERROR) {
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index df79eafb6136..2dcd1ae106b1 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -19,6 +19,7 @@ extern "C" {
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
 #define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
 #define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -34,7 +35,9 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
+#define DRM_XE_EUDEBUG_EVENT_METADATA		9
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -189,6 +192,33 @@ struct drm_xe_eudebug_vm_open {
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

