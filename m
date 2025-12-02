Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A17CCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111610E64C;
	Tue,  2 Dec 2025 13:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWajeFu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C7F10E64C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683586; x=1796219586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zAslnoMQjDBQiXsZDxKsQeK7QfGbRF/Y+IhYtLs8s+k=;
 b=OWajeFu/AVCQLC/E+GWx1eI5O6jN9fsbKaLqdM9UTSwV/jYIOalxdwwr
 AnI57/E7ncH8zvtojFRoqRtcwet36Ezwr3BflRdNRj6DdsFSsw1YqxDMJ
 4cM0/yUDxN3UzuQqUOBXtDTYVgg3dWCwfIbnZugGQMK/Kesy9y85Q7M7v
 /jdE/ybUxwHWxu0bqo6Vvk1YGFD0YkHbOzTvu4HEygyJT8uag8eIjW0iq
 Lrq1SjEmz0DiLmZGQyxXqU1PrF7eDypxwtfqK0SuLXtkwvA8Z2KwhQuAr
 YXMQT1iQSIAM314XRIyiZjWhfFrCxp6w7UXud3Hk3IL9kI6kY61PRY10t A==;
X-CSE-ConnectionGUID: xg2mWNkAR7OVaabmcOrP5g==
X-CSE-MsgGUID: r2w2sSVsRDOIJ/Gud3p3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537032"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:06 -0800
X-CSE-ConnectionGUID: 2Vu5qsN1Qeibq/6oREpIGw==
X-CSE-MsgGUID: NwnymS2DTGyFy42xhhQSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505586"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:02 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 03/20] drm/xe/eudebug: Introduce exec_queue events
Date: Tue,  2 Dec 2025 15:52:22 +0200
Message-ID: <20251202135241.880267-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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

Add events to inform the debugger about the creation and destruction of
exec_queues. Use user engine class types instead of the internal
xe_engine_class enum in exec_queue events. During discovery, only advertise
exec_queues with render or compute class,excluding others.

v2: - Only track long running queues
    - Checkpatch (Tilak)
v3: __counted_by added
v4: - use helpers for filtering engines (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 209 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   5 +
 drivers/gpu/drm/xe/xe_hw_engine.h     |  14 ++
 include/uapi/drm/xe_drm_eudebug.h     |  11 ++
 6 files changed, 248 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 8b43e0384b57..4fee035765df 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -15,6 +15,8 @@
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
+#include "xe_exec_queue.h"
+#include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_vm.h"
 
@@ -391,6 +393,28 @@ __find_handle(struct xe_eudebug_resource *r,
 	return h;
 }
 
+static int find_handle(struct xe_eudebug_resources *res,
+		       const int type,
+		       const void *p)
+{
+	const u64 key = (uintptr_t)p;
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h;
+	int id;
+
+	if (XE_WARN_ON(!key))
+		return -EINVAL;
+
+	r = resource_from_type(res, type);
+
+	mutex_lock(&res->lock);
+	h = __find_handle(r, key);
+	id = h ? h->id : -ENOENT;
+	mutex_unlock(&res->lock);
+
+	return id;
+}
+
 static int _xe_eudebug_add_handle(struct xe_eudebug *d,
 				  int type,
 				  void *p,
@@ -649,6 +673,174 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
 }
 
+static const u16 xe_to_user_engine_class[] = {
+	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+};
+
+static int send_exec_queue_event(struct xe_eudebug *d, u32 flags,
+				 u64 vm_handle, u64 exec_queue_handle,
+				 enum xe_engine_class class,
+				 u32 width, u64 *lrc_handles, u64 seqno)
+{
+	struct drm_xe_eudebug_event *event;
+	struct drm_xe_eudebug_event_exec_queue *e;
+	const u32 sz = struct_size(e, lrc_handle, width);
+	const u32 xe_engine_class = xe_to_user_engine_class[class];
+
+	if (!xe_engine_supports_eudebug(class))
+		return -EINVAL;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					seqno, flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	e->vm_handle = vm_handle;
+	e->exec_queue_handle = exec_queue_handle;
+	e->engine_class = xe_engine_class;
+	e->width = width;
+
+	memcpy(e->lrc_handle, lrc_handles, width);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int exec_queue_create_event(struct xe_eudebug *d,
+				   struct xe_file *xef, struct xe_exec_queue *q)
+{
+	int h_vm, h_queue;
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
+	int i;
+	int ret;
+
+	if (!xe_exec_queue_is_lr(q))
+		return 0;
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
+	ret = send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+				    h_vm, h_queue, q->class,
+				    q->width, h_lrc, seqno);
+
+	if (ret)
+		eu_dbg(d, "send_exec_queue_event create error %d", ret);
+
+	return ret;
+}
+
+static int exec_queue_destroy_event(struct xe_eudebug *d,
+				    struct xe_file *xef,
+				    struct xe_exec_queue *q)
+{
+	int h_vm, h_queue;
+	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
+	int i;
+	int ret;
+
+	if (!xe_exec_queue_is_lr(q))
+		return 0;
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
+	ret = send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
+				    h_vm, h_queue, q->class,
+				    q->width, h_lrc, seqno);
+
+	if (ret)
+		eu_dbg(d, "send_exec_queue_event destroy error %d\n", ret);
+
+	return ret;
+}
+
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+
+	if (!xe_engine_supports_eudebug(q->class))
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
+	if (!xe_engine_supports_eudebug(q->class))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, exec_queue_destroy_event(d, xef, q));
+}
+
 static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 {
 	struct xe_file *xef = NULL;
@@ -664,9 +856,10 @@ static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 static void discover_client(struct xe_eudebug *d)
 {
 	struct xe_file *xef;
+	struct xe_exec_queue *q;
 	struct xe_vm *vm;
 	unsigned long i;
-	unsigned int vm_count = 0;
+	unsigned int vm_count = 0, eq_count = 0;
 	int err = 0;
 
 	xef = xe_eudebug_target_get(d);
@@ -684,14 +877,24 @@ static void discover_client(struct xe_eudebug *d)
 		vm_count++;
 	}
 
+	xa_for_each(&xef->exec_queue.xa, i, q) {
+		if (!xe_engine_supports_eudebug(q->class))
+			continue;
+
+		err = exec_queue_create_event(d, xef, q);
+		if (err)
+			break;
+	}
+
 	complete_all(&d->discovery);
 
 	eu_dbg(d, "Discovery end for %lld: %d", d->session, err);
 
 	up_write(&xef->eudebug.ioctl_lock);
 
-	if (vm_count)
-		eu_dbg(d, "Discovery found %u vms", vm_count);
+	if (vm_count || eq_count)
+		eu_dbg(d, "Discovery found %u vms, %u exec_queues",
+		       vm_count, eq_count);
 
 	xe_file_put(xef);
 }
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 22fbb2ff24da..10480a226fac 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,6 +13,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_exec_queue;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -46,6 +47,9 @@ void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -60,6 +64,9 @@ static inline void xe_eudebug_file_close(struct xe_file *xef) { }
 static inline void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm) { }
 
+static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
+static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 55b71ddd92b6..57bff7482163 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -33,7 +33,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -61,7 +61,9 @@ struct xe_eudebug_resource {
 };
 
 #define XE_EUDEBUG_RES_TYPE_VM		0
-#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
+#define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE	1
+#define XE_EUDEBUG_RES_TYPE_LRC		2
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
 
 /**
  * struct xe_eudebug_resources - eudebug resources for all types
@@ -133,3 +135,4 @@ struct xe_eudebug {
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
+
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 226d07a3d852..a3bbc776f99d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -29,6 +29,7 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
+#include "xe_eudebug.h"
 
 /**
  * DOC: Execution Queue
@@ -842,6 +843,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	args->exec_queue_id = id;
 
+	xe_eudebug_exec_queue_create(xef, q);
+
 	return 0;
 
 kill_exec_queue:
@@ -1027,6 +1030,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
+	xe_eudebug_exec_queue_destroy(xef, q);
+
 	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..d8781bf79547 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -79,4 +79,18 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
+static inline bool xe_engine_supports_eudebug(const enum xe_engine_class ec)
+{
+	if (ec == XE_ENGINE_CLASS_COMPUTE ||
+	    ec == XE_ENGINE_CLASS_RENDER)
+		return true;
+
+	return false;
+}
+
+static inline bool xe_hw_engine_has_eudebug(const struct xe_hw_engine *hwe)
+{
+	return xe_engine_supports_eudebug(hwe->class);
+}
+
 #endif
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index fd2a0c911d02..360d7a7ecb67 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -48,6 +48,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_NONE		0
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -70,6 +71,16 @@ struct drm_xe_eudebug_event_vm {
 	__u64 vm_handle;
 };
 
+struct drm_xe_eudebug_event_exec_queue {
+	struct drm_xe_eudebug_event base;
+
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
2.43.0

