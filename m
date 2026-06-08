Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6F4CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685910F6B3;
	Mon,  8 Jun 2026 16:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K42v97OU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA9610F6B7
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935452; x=1812471452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vCRr1BM9offhdNZoJ0T8W9P+0am/znzJnwrcscMpBGI=;
 b=K42v97OUh9eI7uP2jGVEsMku+V4rmggGXNIDHQNR94JG3KtBUpl910kF
 E0dCIXJPwjEKQjgglGtkJ9AmK3C1T7niiRwWE0qZZ0Fj/c5ALfhqxurmO
 YkVp7di1t5yuLmjQRnAGxtKX/3PR2q7Em/55fAbmnofIO3s7MmQXGHsfc
 qtoXr7yofdeM22EovmZQ8wFWgYLCbgKqKS8InQjXWXzuPNoGkN5o1bHdu
 nClbZRBpc9Wd5uxJwwWwUsyFCqLxn+UwETfgLMtcV359q9V41NE7HRqnD
 ykB5XMPbNiX+k8FpPyy+QplM5QRJhHxNszKnvfLQXdH6pO6BxwO0ykMaY A==;
X-CSE-ConnectionGUID: HhBz2VepSiW0Gp8a3W06Xw==
X-CSE-MsgGUID: vQDvTG6gRlqJj0Ja3VqpcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531829"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531829"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:32 -0700
X-CSE-ConnectionGUID: h+KxryELT3+/PDum2WRHbg==
X-CSE-MsgGUID: hCNzT4lrSreVntEoFqLPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247457678"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:26 -0700
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
Subject: [PATCH 06/18] drm/xe/eudebug: Introduce exec_queue events
Date: Mon,  8 Jun 2026 19:16:24 +0300
Message-ID: <20260608161639.1652127-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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
v5: - fix lrc handles memcpy size bug (Mika)
v6: - lookup for create event (Sashiko)
    - defer engine class lookup (Sashiko)
    - avoid uninitialized read on adding handle (Sashiko)
    - too strict warn on q->width check (Sashiko)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 240 +++++++++++++++++++++++++++++++-
 1 file changed, 236 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 799b34db8f9d..95d589101fd5 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -431,6 +431,28 @@ __find_handle(struct xe_eudebug_resource *r,
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
@@ -699,6 +721,206 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
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
+		int h;
+
+		ret = _xe_eudebug_add_handle(d,
+					     XE_EUDEBUG_RES_TYPE_LRC,
+					     q->lrc[i],
+					     NULL,
+					     &h);
+
+		if (ret < 0)
+			break;
+
+		XE_WARN_ON(!h);
+
+		h_lrc[i] = h;
+	}
+
+	if (ret < 0)
+		return ret;
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
+	int ret, err = 0;
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
+	for (i = 0; i < q->width; i++) {
+		ret = _xe_eudebug_remove_handle(d,
+						XE_EUDEBUG_RES_TYPE_LRC,
+						q->lrc[i],
+						NULL);
+		if (ret < 0) {
+			XE_WARN_ON(ret != -ENOENT);
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
+	if (h_queue <= 0)
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
+void xe_eudebug_exec_queue_create(struct xe_file *xef, u32 id)
+{
+	struct xe_exec_queue *q;
+	struct xe_eudebug *d;
+	int err;
+
+	q = xe_exec_queue_lookup(xef, id);
+	if (!q)
+		return;
+
+	if (xe_engine_supports_eudebug(q->class)) {
+		d = xe_eudebug_get(xef);
+		if (d) {
+			err = exec_queue_create_event(d, xef, q);
+			if (err)
+				xe_eudebug_disconnect(d, err);
+			xe_eudebug_put(d);
+		}
+	}
+
+	xe_exec_queue_put(q);
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
@@ -714,9 +936,10 @@ static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
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
@@ -737,6 +960,15 @@ static void discover_client(struct xe_eudebug *d)
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
 
@@ -744,9 +976,9 @@ static void discover_client(struct xe_eudebug *d)
 
 	up_write(&xef->eudebug.ioctl_lock);
 
-	if (vm_count)
-		eu_dbg(d, "Discovery found %u vms",
-		       vm_count);
+	if (vm_count || eq_count)
+		eu_dbg(d, "Discovery found %u vms, %u exec_queues",
+		       vm_count, eq_count);
 
 	xe_file_put(xef);
 }
-- 
2.43.0

