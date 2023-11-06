Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16134C4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86410E2D3;
	Mon,  6 Nov 2023 11:22:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198BB10E2D1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydwzLLu8UEfEwNy7exa/XdabUwzuKl8jr++kvrXawZ8=;
 b=iXb7FDp7sNeMG+0z+RmDIpIqwi620g+pr1zdE4ol6tXlSoh4U1jZlzHL
 kyFWSTa0uS43GNrsH/n6pu6Gvt8Bz8E9O/vEZNjvX9Al+JCUHvkhtIa+d
 HrurfHH1Hvf+fE04ZCuelbye81t2he61oNLES8L5bLQiakKJMEED3nf47
 FEG5TYG3INokMLZuh4E2wjAQgBOXuSdydiVnOmUemm/3tfgivuZsZbr2i
 8C8xFbm5b+HbmjUBh2tApc2bfKTeCc5MR55CCqtmoqIL+7RPbAw0kzddv
 5oKylkD8O5pAgIowe8zFiePIkWxnQ0zqIHUg+KlupCA+uH1MCc2RIcZHg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646770"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646770"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411542"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411542"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:16 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:23 +0200
Message-Id: <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue events
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

Introduce exec_queue events.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 160 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |   4 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  31 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   5 +
 include/uapi/drm/xe_drm_tmp.h         |  14 ++-
 5 files changed, 212 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 91d1a323e2ac..3598c0f352fe 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -16,6 +16,8 @@
 
 #include "xe_device.h"
 #include "xe_eudebug_types.h"
+#include "xe_exec_queue_types.h"
+#include "xe_vm.h"
 
 /*
  * If there is no event being read in this time (for example gdb stuck)
@@ -1034,8 +1036,158 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_put(d);
 }
 
+static int send_exec_queue_event(struct xe_eudebug *d, u32 flags,
+			     u64 client_handle, u64 vm_handle,
+			     u64 exec_queue_handle, u16 engine_class,
+			     u16 width, u64 *lrc_handles)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_exec_queue *e;
+	const u32 sz = struct_size(e, lrc_handle, width);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = from_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, client_handle, client_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, vm_handle, vm_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, exec_queue_handle, exec_queue_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, engine_class, engine_class);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, width, width);
+
+	memcpy(e->lrc_handle, lrc_handles, width);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int exec_queue_create_event(struct xe_eudebug *d,
+				   struct xe_file *xef, struct xe_exec_queue *q)
+{
+	int h_c, h_vm, h_queue;
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE];
+	int i;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	h_queue = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	for (i = 0; i < q->width; i++) {
+		int h = xe_eudebug_add_handle(d,
+					      XE_EUDEBUG_RES_TYPE_LRC,
+					      &q->lrc[i]);
+		if (h < 0)
+			return h;
+
+		h_lrc[i] = h;
+	}
+
+	/* No need to cleanup for added handles on error as if we fail
+	 * we disconnect
+	 */
+
+	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+				     h_c, h_vm, h_queue, (u16)q->class,
+				     q->width, h_lrc);
+}
+
+static int exec_queue_destroy_event(struct xe_eudebug *d,
+				    struct xe_file *xef, struct xe_exec_queue *q)
+{
+	int h_c, h_vm, h_queue;
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE];
+	int i;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	h_queue = xe_eudebug_remove_handle(d,
+					   XE_EUDEBUG_RES_TYPE_EXEC_QUEUE,
+					   q);
+	if (h_queue < 0)
+		return h_queue;
+
+	for (i = 0; i < q->width; i++) {
+		int h = xe_eudebug_remove_handle(d,
+						 XE_EUDEBUG_RES_TYPE_LRC,
+						 &q->lrc[i]);
+
+		if (h < 0)
+			return h;
+
+		h_lrc[i] = h;
+	}
+
+	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
+				     h_c, h_vm, h_queue, (u16)q->class,
+				     q->width, h_lrc);
+}
+
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	if (q->class != XE_ENGINE_CLASS_RENDER &&
+	    q->class != XE_ENGINE_CLASS_COMPUTE)
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = exec_queue_create_event(d, xef, q);
+	if (err == -EEXIST || err == -ENOTCONN)
+		err = 0;
+
+	if (err) {
+		eu_err(d, "error %d on %s, disconnecting", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	if (q->class != XE_ENGINE_CLASS_RENDER &&
+	    q->class != XE_ENGINE_CLASS_COMPUTE)
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = exec_queue_destroy_event(d, xef, q);
+	if (err && err != -ENOTCONN) {
+		eu_err(d, "error %d on %s, disconnecting", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	xe_eudebug_put(d);
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
+	struct xe_exec_queue *q;
 	struct xe_vm *vm;
 	unsigned long i;
 	int err;
@@ -1052,6 +1204,14 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 	}
 	mutex_unlock(&xef->vm.lock);
 
+	mutex_lock(&xef->exec_queue.lock);
+	xa_for_each(&xef->exec_queue.xa, i, q) {
+		err = exec_queue_create_event(d, xef, q);
+		if (err)
+			break;
+	}
+	mutex_unlock(&xef->exec_queue.lock);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index df577b581364..44b20549eb6d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -10,6 +10,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_exec_queue;
 
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
@@ -24,4 +25,7 @@ void xe_eudebug_file_close(struct xe_file *xef);
 void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index a0ab551bc102..0fd317e7201f 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -71,6 +71,33 @@ struct xe_eudebug_event_vm {
 	u64 vm_handle;
 } __packed;
 
+/**
+ * struct xe_eudebug_event_exec_queue - Internal event for
+ * exec_queue create/destroy
+ */
+struct xe_eudebug_event_exec_queue {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+
+	/** @client_handle: client for the engine create/destroy */
+	u64 client_handle;
+
+	/** @vm_handle: vm handle for the engine create/destroy */
+	u64 vm_handle;
+
+	/** @exec_queue_handle: engine handle */
+	u64 exec_queue_handle;
+
+	/** @engine_handle: engine class */
+	u16 engine_class;
+
+	/** @width: submission width (number BB per exec) for this exec queue */
+	u16 width;
+
+	/** @lrc_handles: handles for each logical ring context created with this exec queue */
+	u64 lrc_handle[];
+} __packed;
+
 /**
  * struct xe_eudebug_handle - eudebug resource handle
  */
@@ -98,7 +125,9 @@ struct xe_eudebug_resource {
 
 #define XE_EUDEBUG_RES_TYPE_CLIENT 0
 #define XE_EUDEBUG_RES_TYPE_VM     1
-#define XE_EUDEBUG_RES_TYPE_COUNT  (XE_EUDEBUG_RES_TYPE_VM + 1)
+#define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE 2
+#define XE_EUDEBUG_RES_TYPE_LRC	   3
+#define XE_EUDEBUG_RES_TYPE_COUNT  (XE_EUDEBUG_RES_TYPE_LRC + 1)
 
 /**
  * struct xe_eudebug_resources - eudebug resources for all types
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4fd44a9203e4..8e4ee13f098f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -22,6 +22,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_eudebug.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -738,6 +739,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	args->exec_queue_id = id;
 
+	xe_eudebug_exec_queue_create(xef, q);
+
 	return 0;
 
 kill_exec_queue:
@@ -872,6 +875,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
+	xe_eudebug_exec_queue_destroy(xef, q);
+
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
 		xe_exec_queue_kill(q);
 	else
diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 1ab9e67b6f94..64d0f1295341 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -31,7 +31,8 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_READ     1
 #define DRM_XE_EUDEBUG_EVENT_OPEN     2
 #define DRM_XE_EUDEBUG_EVENT_VM	      3
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_VM
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE 4
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE	(1 << 0)
@@ -54,6 +55,17 @@ struct drm_xe_eudebug_event_vm {
 	__u64 vm_handle;
 } __attribute__((packed));
 
+struct drm_xe_eudebug_event_exec_queue {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+	__u64 exec_queue_handle;
+	__u16 engine_class;
+	__u16 width;
+	__u64 lrc_handle[0];
+} __attribute__((packed));
+
 /*
  * Debugger ABI (ioctl and events) Version History:
  * 0 - No debugger available
-- 
2.34.1

