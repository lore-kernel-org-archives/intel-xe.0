Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DE9CEACD5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B9610E645;
	Tue,  1 Oct 2024 14:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6UmMny9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FED410E645
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794418; x=1759330418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=suVz6QbuiwVWKSzpBgSbsXSxnui6Jn6dg2FwAGDznAY=;
 b=Q6UmMny9zkFERJopAcs70IBCBRuFWU/USBJ/UuLMDcSCATMTasRBpf2H
 qSQ2n3XXxOCNW7xWCJ+AuauNCMzvhbrfGtjNlNmKVfmB70nyokwhV/fjf
 l9/ibrcw4zHD0/QmnXmkQqcTrX4PP/vJOYv/tJC8+ocoeZVBYMId2fXJ6
 5Ykw0M9+BPd50w2VwRiZGxN6QjG4CXhUS9ALuX1DJpFpURg4TdjjkFLkQ
 AOxOqDGhMYu1vqrYq6F0argNe6bpEy0/0NQev7LgIbHePYSjirApImSfa
 I6ml1UVzqTvrN9CV7adkQPJg7frEE+dXnOlxjmzEcAYnnT1V4sATtKihk g==;
X-CSE-ConnectionGUID: PX0B6D/KQUWVkBbzqIzyzw==
X-CSE-MsgGUID: WvrBHl5ZR+a3nCpm0iexag==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091384"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:38 -0700
X-CSE-ConnectionGUID: P+J3ExOBQTuhmT3q0k4RUA==
X-CSE-MsgGUID: 0zrBl2DJR5q9YAnnytWf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048644"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:36 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 04/18] drm/xe/eudebug: Introduce exec_queue events
Date: Tue,  1 Oct 2024 17:42:52 +0300
Message-Id: <20241001144306.1991001-5-mika.kuoppala@linux.intel.com>
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

Inform debugger about creation and destruction of exec_queues.

1) Use user engine class types instead of internal xe_engine_class enum
   in exec_queue event.

2) During discovery do not advertise every execqueue created, only ones
   with class render or compute.

v2: - Only track long running queues
    - Checkpatch (Tilak)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 187 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  31 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   5 +
 include/uapi/drm/xe_drm_eudebug.h     |  12 ++
 5 files changed, 240 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index c294e2c6152b..4706320b39b6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_vm.h"
 
@@ -748,7 +749,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -1155,8 +1156,183 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
 }
 
+static bool exec_queue_class_is_tracked(enum xe_engine_class class)
+{
+	return class == XE_ENGINE_CLASS_COMPUTE ||
+		class == XE_ENGINE_CLASS_RENDER;
+}
+
+static const u16 xe_to_user_engine_class[] = {
+	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+};
+
+static int send_exec_queue_event(struct xe_eudebug *d, u32 flags,
+				 u64 client_handle, u64 vm_handle,
+				 u64 exec_queue_handle, enum xe_engine_class class,
+				 u32 width, u64 *lrc_handles, u64 seqno)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_exec_queue *e;
+	const u32 sz = struct_size(e, lrc_handle, width);
+	const u32 xe_engine_class = xe_to_user_engine_class[class];
+
+	if (!exec_queue_class_is_tracked(class))
+		return -EINVAL;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					seqno, flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, client_handle, client_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, vm_handle, vm_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, exec_queue_handle,
+		     exec_queue_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue, e, engine_class, xe_engine_class);
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
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
+	int i;
+
+	if (!xe_exec_queue_is_lr(q))
+		return 0;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	if (XE_WARN_ON(q->width >= XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
+	for (i = 0; i < q->width; i++) {
+		int h, ret;
+
+		ret = _xe_eudebug_add_handle(d,
+					     XE_EUDEBUG_RES_TYPE_LRC,
+					     q->lrc[i],
+					     NULL,
+					     &h);
+
+		if (ret < 0 && ret != -EEXIST)
+			return ret;
+
+		XE_WARN_ON(!h);
+
+		h_lrc[i] = h;
+	}
+
+	h_queue = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q, &seqno);
+	if (h_queue <= 0)
+		return h_queue;
+
+	/* No need to cleanup for added handles on error as if we fail
+	 * we disconnect
+	 */
+
+	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+				     h_c, h_vm, h_queue, q->class,
+				     q->width, h_lrc, seqno);
+}
+
+static int exec_queue_destroy_event(struct xe_eudebug *d,
+				    struct xe_file *xef,
+				    struct xe_exec_queue *q)
+{
+	int h_c, h_vm, h_queue;
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
+	int i;
+
+	if (!xe_exec_queue_is_lr(q))
+		return 0;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	if (XE_WARN_ON(q->width >= XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
+	h_queue = xe_eudebug_remove_handle(d,
+					   XE_EUDEBUG_RES_TYPE_EXEC_QUEUE,
+					   q,
+					   &seqno);
+	if (h_queue <= 0)
+		return h_queue;
+
+	for (i = 0; i < q->width; i++) {
+		int ret;
+
+		ret = _xe_eudebug_remove_handle(d,
+						XE_EUDEBUG_RES_TYPE_LRC,
+						q->lrc[i],
+						NULL);
+		if (ret < 0 && ret != -ENOENT)
+			return ret;
+
+		XE_WARN_ON(!ret);
+
+		h_lrc[i] = ret;
+	}
+
+	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
+				     h_c, h_vm, h_queue, q->class,
+				     q->width, h_lrc, seqno);
+}
+
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+
+	if (!exec_queue_class_is_tracked(q->class))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, exec_queue_create_event(d, xef, q));
+}
+
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+
+	if (!exec_queue_class_is_tracked(q->class))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, exec_queue_destroy_event(d, xef, q));
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
+	struct xe_exec_queue *q;
 	struct xe_vm *vm;
 	unsigned long i;
 	int err;
@@ -1171,6 +1347,15 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 			break;
 	}
 
+	xa_for_each(&xef->exec_queue.xa, i, q) {
+		if (!exec_queue_class_is_tracked(q->class))
+			continue;
+
+		err = exec_queue_create_event(d, xef, q);
+		if (err)
+			break;
+	}
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index e3247365f72f..326ddbd50651 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -10,6 +10,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_exec_queue;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -26,6 +27,9 @@ void xe_eudebug_file_close(struct xe_file *xef);
 void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -41,6 +45,9 @@ static inline void xe_eudebug_file_close(struct xe_file *xef) { }
 static inline void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm) { }
 
+static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
+static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 080a821db3e4..6428905a0557 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -50,7 +50,9 @@ struct xe_eudebug_resource {
 
 #define XE_EUDEBUG_RES_TYPE_CLIENT	0
 #define XE_EUDEBUG_RES_TYPE_VM		1
-#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
+#define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE	2
+#define XE_EUDEBUG_RES_TYPE_LRC		3
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
 
 /**
  * struct xe_eudebug_resources - eudebug resources for all types
@@ -173,4 +175,31 @@ struct xe_eudebug_event_vm {
 	u64 vm_handle;
 };
 
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
+	u32 engine_class;
+
+	/** @width: submission width (number BB per exec) for this exec queue */
+	u32 width;
+
+	/** @lrc_handles: handles for each logical ring context created with this exec queue */
+	u64 lrc_handle[];
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d098d2dd1b2d..e6b2487de48e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -23,6 +23,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_eudebug.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -644,6 +645,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	args->exec_queue_id = id;
 
+	xe_eudebug_exec_queue_create(xef, q);
+
 	return 0;
 
 kill_exec_queue:
@@ -827,6 +830,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
+	xe_eudebug_exec_queue_destroy(xef, q);
+
 	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index acf6071c82bf..ac44e890152a 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -26,6 +26,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_OPEN		2
 #define DRM_XE_EUDEBUG_EVENT_VM			3
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -49,6 +50,17 @@ struct drm_xe_eudebug_event_vm {
 	__u64 vm_handle;
 };
 
+struct drm_xe_eudebug_event_exec_queue {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+	__u64 exec_queue_handle;
+	__u32 engine_class;
+	__u32 width;
+	__u64 lrc_handle[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

