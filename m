Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE476C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18110E2D0;
	Mon,  6 Nov 2023 11:22:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89410E2E2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269764; x=1730805764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zX3FxmgIZzAwrBNMxqV+3g56j5O8i9bHBKKV4RSFaQw=;
 b=ZRSdgWN4F5P8k8aFzng8N9L9qHOohgy1PZgzM+G25gnE3gT1zgC2gy+I
 ZNz8JlbqRrLPuTpMKbGXX51qSwpNjGQQltU7bH1LsomA3y+0kol48l/mM
 UZMM9kKq5qGevwt+MgT7mo8CWT0BBXPcbEmx6PdLoDriqL9PmGih2/VFa
 i8uGvYGFCyYfKe3A7b3U/nIdxhiNstnFkN5UKLSJgOr+PVoE6InF6bB80
 qnOSUZ+1k2u7qqkeKsFLSP2FHXd3c++HRcRk4OezfXdoKJoeRKHnFV3oR
 ll8oflPS8J4kDgVmaeNatTMoqaAdyADhkRfBCmddAZKNLz0lXfVgDS5OO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646887"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411765"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411765"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:42 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:44 +0200
Message-Id: <20231106111845.2333093-25-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 24/25] drm/xe/xe_eudebug: Add vm bind events w/o
 acking
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

TODO:
- reduce code duplication in xe_eudebug bind/unbind functions
- rebase on latest eudebug-dev
- address XXX

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 93 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |  4 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h | 13 ++++
 drivers/gpu/drm/xe/xe_vm.c            |  5 ++
 include/uapi/drm/xe_drm_tmp.h         | 22 +++++--
 5 files changed, 131 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 886da91ea0a4..57a3cf59aaba 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -1983,6 +1983,99 @@ void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
 	xe_eudebug_put(d);
 }
 
+static int send_vm_bind_event(struct xe_eudebug *d, u32 flags, u64 client_handle, u64 vm_handle,
+			      u64 va_start, u64 va_length)
+{
+	struct xe_eudebug_event_vm_bind *e;
+	struct xe_eudebug_event *event;
+
+	const u32 sz = sizeof(*e);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND,
+					flags, sz, GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
+
+	e = from_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, client_handle, client_handle);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, vm_handle, vm_handle);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, va_start, va_start);
+	write_member(struct drm_xe_eudebug_event_vm_bind, e, va_length, va_length);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int vm_bind_event(struct xe_eudebug *d, struct xe_file *xef, struct xe_vm *vm,
+			 struct xe_vma *vma)
+{
+	int h_c, h_vm;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	return send_vm_bind_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, h_c, h_vm, vma->gpuva.va.addr,
+				  vma->gpuva.va.range);
+}
+
+static int vm_unbind_event(struct xe_eudebug *d, struct xe_file *xef, struct xe_vm *vm,
+			   struct xe_vma *vma)
+{
+	int h_c, h_vm;
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, vm);
+	if (h_vm < 0)
+		return h_vm;
+
+	return send_vm_bind_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, h_c, h_vm, vma->gpuva.va.addr,
+				  vma->gpuva.va.range);
+}
+
+void xe_eudebug_vm_bind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = vm_bind_event(d, xef, vm, vma);
+	if (err) {
+		eu_err(d, "error %d on %s, disconnecting", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_vm_unbind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = vm_unbind_event(d, xef, vm, vma);
+	if (err) {
+		eu_err(d, "error %d on %s, disconnecting", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	xe_eudebug_put(d);
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_exec_queue *q;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ac89a3d1ee1d..0f5e04603c9d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -10,6 +10,7 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 struct xe_vm;
+struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
 
@@ -30,4 +31,7 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
 void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q);
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q);
 
+void xe_eudebug_vm_bind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma);
+void xe_eudebug_vm_unbind(struct xe_file *xef, struct xe_vm *vm, struct xe_vma *vma);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index d5103ec4648e..73016a940585 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -129,6 +129,19 @@ struct xe_eudebug_event_eu_attention {
 	u8 bitmask[0];
 } __packed;
 
+/**
+ * struct xe_eudebug_event_vm_bind - Internal event for vm bind/unbind operation
+ */
+struct xe_eudebug_event_vm_bind {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+	u64 client_handle;
+
+	u64 vm_handle;
+	u64 va_start;
+	u64 va_length;
+} __packed;
+
 /**
  * struct xe_eudebug_handle - eudebug resource handle
  */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 480427a30b05..f8c3f3efd12e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1882,6 +1882,9 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
+	/* XXX: get's also called for prefetch */
+	xe_eudebug_vm_bind(vm->xef, vm, vma);
+
 	return 0;
 }
 
@@ -1919,6 +1922,8 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
 
+	xe_eudebug_vm_unbind(vm->xef, vm, vma);
+
 	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 776ec9d0f32f..093884b70ca6 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -28,13 +28,14 @@ struct drm_xe_eudebug_event {
 	__u32 len;
 
 	__u16 type;
-#define DRM_XE_EUDEBUG_EVENT_NONE     0
-#define DRM_XE_EUDEBUG_EVENT_READ     1
-#define DRM_XE_EUDEBUG_EVENT_OPEN     2
-#define DRM_XE_EUDEBUG_EVENT_VM	      3
+#define DRM_XE_EUDEBUG_EVENT_NONE 0
+#define DRM_XE_EUDEBUG_EVENT_READ 1
+#define DRM_XE_EUDEBUG_EVENT_OPEN 2
+#define DRM_XE_EUDEBUG_EVENT_VM 3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE 4
-#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION 5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND 6
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_VM_BIND
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		BIT(0)
@@ -79,6 +80,15 @@ struct drm_xe_eudebug_event_eu_attention {
 	__u8 bitmask[0];
 } __attribute__((packed));
 
+struct drm_xe_eudebug_event_vm_bind {
+	struct drm_xe_eudebug_event base;
+	__u64 client_handle;
+
+	__u64 vm_handle;
+	__u64 va_start;
+	__u64 va_length;
+} __attribute__((packed));
+
 struct drm_xe_eudebug_event_metadata {
 	struct drm_xe_eudebug_event base;
 
-- 
2.34.1

