Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F76C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF2110F653;
	Thu,  3 Sep 2026 15:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye7cfNnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AEF10F653
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447634; x=1819983634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+pmbjnIVMydxWzS40nfdWczYjnWd4d5bFRasNgF7ak=;
 b=Ye7cfNnVu5p8lARRageNoSWtmWfwNN31P24FOhdZVRD6fuv5x1Aibufy
 KXbkum0ADP3IuEdCAz8k+5ZVbf/75VvMsD6BDMWddLp4IsjmmEMehSdVr
 7qpfCkdQzz0qTJGEG5wZC2bzgLe4jueF+hy+zuwbadDCnKWoA+zvtBSn8
 HgPrMzCOqf4mAcWUf8ynW4T36nIMUa914cTyXFzyZ6Z6s7EcdvRa/Sdw+
 xk2L0OQyIf6voYr7pASQMitOD1LWy1HLhV4DKOfwp4BWR420vszyDS/Ad
 tS8Wp7GPYu6uEFz9TxMMYAJ5PERbtXDV35O5YxAvN/azLMzA7NUW7MKbu Q==;
X-CSE-ConnectionGUID: yaXKJENzTPiOsF5t4UGnMg==
X-CSE-MsgGUID: ug6CvQBVQpmpAoTMoXdrbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486672"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:34 -0700
X-CSE-ConnectionGUID: TkxTbBJgQRuZldyyV9niVQ==
X-CSE-MsgGUID: lUlnCp7HTLmA9RavyOl7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440608"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:29 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 06/27] drm/xe/eudebug: Introduce exec_queue events
Date: Thu,  3 Sep 2026 17:59:30 +0300
Message-ID: <20260903145952.848051-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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
exec_queues with render or compute class, excluding others.

v2: - Only track long running queues
    - Checkpatch (Tilak)
v3: __counted_by added
v4: - use helpers for filtering engines (Mika)
v5: - fix lrc handles memcpy size bug (Mika)
v6: - lookup for create event (Sashiko)
    - defer engine class lookup (Sashiko)
    - avoid uninitialized read on adding handle (Sashiko)
    - too strict warn on q->width check (Sashiko)
    - create eudebug eq event early (claude)

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 243 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |   7 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c    |   8 +-
 4 files changed, 256 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 7a5b14346e05..d70970f70a8b 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -443,6 +443,28 @@ __find_handle(struct xe_eudebug_resource *r,
 	return h;
 }
 
+static int find_handle(struct xe_eudebug *d,
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
+	r = resource_from_type(d, type);
+
+	mutex_lock(&r->lock);
+	h = __find_handle(r, key);
+	id = h ? h->id : -ENOENT;
+	mutex_unlock(&r->lock);
+
+	return id;
+}
+
 static int _xe_eudebug_add_handle(struct xe_eudebug *d,
 				  int type,
 				  void *p,
@@ -705,6 +727,209 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
 	xe_eudebug_put(d);
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
+	u32 xe_engine_class;
+	int err;
+
+	if (!xe_engine_supports_eudebug(class))
+		return -EINVAL;
+
+	xe_engine_class = xe_to_user_engine_class[class];
+
+	spin_lock(&d->events.lock);
+	event = xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					 seqno, flags, sz);
+	e = cast_event(e, event);
+
+	e->vm_handle = vm_handle;
+	e->exec_queue_handle = exec_queue_handle;
+	e->engine_class = xe_engine_class;
+	e->width = width;
+
+	memcpy(e->lrc_handle, lrc_handles, width * sizeof(u64));
+
+	err = xe_eudebug_queue_event(d, event);
+	spin_unlock(&d->events.lock);
+
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	return err;
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
+	if (!xe_exec_queue_is_debuggable(q))
+		return 0;
+
+	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	if (XE_WARN_ON(q->width > XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
+	ret = 0;
+	for (i = 0; i < q->width; i++) {
+		ret = _xe_eudebug_add_handle(d,
+					     XE_EUDEBUG_RES_TYPE_LRC,
+					     q->lrc[i],
+					     NULL);
+
+		if (ret < 0)
+			break;
+
+		XE_WARN_ON(!ret);
+
+		h_lrc[i] = ret;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	h_queue = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q, &seqno);
+	if (h_queue < 0)
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
+	int ret, err = 0;
+
+	if (!xe_exec_queue_is_debuggable(q))
+		return 0;
+
+	/*
+	 * A queue we never handed out to the debugger needs no destroy event.
+	 * The queue handle is added last on create, so its presence implies
+	 * the lrc handles are there too. Past this point a missing handle
+	 * means our resource map and the client have diverged, and that has
+	 * to drop the session.
+	 */
+	if (find_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q) == -ENOENT)
+		return 0;
+
+	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	if (XE_WARN_ON(q->width > XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
+	for (i = 0; i < q->width; i++) {
+		ret = _xe_eudebug_remove_handle(d,
+						XE_EUDEBUG_RES_TYPE_LRC,
+						q->lrc[i],
+						NULL);
+		if (ret < 0) {
+			XE_WARN_ON(ret);
+			if (!err)
+				err = ret;
+			h_lrc[i] = 0;
+			continue;
+		}
+
+		XE_WARN_ON(!ret);
+		h_lrc[i] = ret;
+	}
+
+	if (err)
+		return err;
+
+	h_queue = xe_eudebug_remove_handle(d,
+					   XE_EUDEBUG_RES_TYPE_EXEC_QUEUE,
+					   q,
+					   &seqno);
+	if (h_queue < 0)
+		return h_queue;
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
+	int err;
+
+	if (!xe_engine_supports_eudebug(q->class))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = exec_queue_create_event(d, xef, q);
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	if (!xe_engine_supports_eudebug(q->class))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = exec_queue_destroy_event(d, xef, q);
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	xe_eudebug_put(d);
+}
+
 static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
 {
 	struct xe_file *xef = NULL;
@@ -720,9 +945,10 @@ static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
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
@@ -756,14 +982,23 @@ static void discover_client(struct xe_eudebug *d)
 		vm_count++;
 	}
 
+	xa_for_each(&xef->exec_queue.xa, i, q) {
+		if (!xe_engine_supports_eudebug(q->class))
+			continue;
+
+		err = exec_queue_create_event(d, xef, q);
+		if (err)
+			goto out;
+	}
+
 out:
 	complete_all(&d->discovery);
 
 	up_write(&xef->eudebug.ioctl_lock);
 
-	if (vm_count)
-		eu_dbg(d, "Discovery found %u vms",
-		       vm_count);
+	if (vm_count || eq_count)
+		eu_dbg(d, "Discovery found %u vms, %u exec_queues",
+		       vm_count, eq_count);
 
 	xe_file_put(xef);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 2d9b6e23315d..3540f1a798ea 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,6 +13,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_exec_queue;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -55,6 +56,9 @@ struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
+void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -70,6 +74,9 @@ static inline void xe_eudebug_file_close(struct xe_file *xef) { }
 static inline void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm) { }
 
+static inline void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q) { }
+static inline void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index cc4b5f6f2a3a..59d77998b829 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -65,7 +65,9 @@ struct xe_eudebug_resource {
 };
 
 #define XE_EUDEBUG_RES_TYPE_VM		0
-#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
+#define XE_EUDEBUG_RES_TYPE_EXEC_QUEUE  1
+#define XE_EUDEBUG_RES_TYPE_LRC		2
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_LRC + 1)
 
 /**
  * struct xe_eudebug - Top level struct for eudebug: the connection
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d13f69eb025c..12410646d15d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1487,10 +1487,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (eci[0].engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
 		xe_vm_add_exec_queue(vm, q);
 
+	xe_eudebug_exec_queue_create(xef, q);
+
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
-	if (err)
+	if (err) {
+		xe_eudebug_exec_queue_destroy(xef, q);
 		goto del_hw_engine_group;
+	}
 
 	args->exec_queue_id = id;
 
@@ -1691,6 +1695,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
+	xe_eudebug_exec_queue_destroy(xef, q);
+
 	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
-- 
2.53.0

