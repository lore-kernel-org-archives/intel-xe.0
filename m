Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94388CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EED110F2E3;
	Thu, 30 Apr 2026 10:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAF/Q8E3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B71310F2E3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546396; x=1809082396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vWx2DZ5qMmLBOkgL27e5gsXrBqjws+1nXhmdwL102ic=;
 b=iAF/Q8E3HxLoT/8Gk1KNrtc/uXM5vWRS/NtkknS+O+13jx/wFk8jw2kU
 EdRwBkpEwz8XopKLRZSmfnrWmRsMZS5DtxQTaW2AOt6fjp5q8ii6Lme7D
 gGAeUXIltUmJsrq7XH8M4cVpvGXTYryZLD6JWk8Xz04SmDrgHNe4MmMD3
 PXcFV/zageD84AMFP4qqlHXREgMu/uX5MVRVOpV2SWmvBsQlhLnioTgJa
 e/rFaRgxsEpXctkvCn6NP3FII4B3IJi8tGGBPlwC6/0iAiXdPHcXWuCLU
 p7F9F/CzXvvVWir1TeGjNjby/2ukkoIX5/TGRHFMHpEmwam5A2w3K0l8o w==;
X-CSE-ConnectionGUID: EZmKyuNWQOWcc5J5KH7WDA==
X-CSE-MsgGUID: vww1gPAjSPGXnnX0uqsySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586002"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586002"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:16 -0700
X-CSE-ConnectionGUID: MJOnujP4T9ev+EDzK+xM3A==
X-CSE-MsgGUID: 20B4Y+eOQr+VRB4O9559FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518836"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:10 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 15/24] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Thu, 30 Apr 2026 13:51:11 +0300
Message-ID: <20260430105121.712843-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

Scan for EU debugging attention bits periodically to detect if some EU
thread has entered the system routine (SIP) due to EU thread exception.

Make the scanning interval 10 times slower when there is no debugger
connection open. Send attention event whenever we see attention with
debugger presence. If there is no debugger connection active - reset.

Based on work by authors and other folks who were part of attentions in
i915.

v2: - use xa_array for files
    - null ptr deref fix for non-debugged context (Dominik)
    - checkpatch (Tilak)
    - use discovery_lock during list traversal

v3: - engine status per gen improvements, force_wake ref
    - __counted_by (Mika)

v4: - attention register naming (Dominik)
v5: - free event on error (Mika)
v6: - annotata data race on extending the poll interval (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 172 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_types.h |   3 +-
 include/uapi/drm/xe_drm_eudebug.h     |  29 +++++
 5 files changed, 208 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index 76f255c7da73..29f70b023326 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -67,6 +67,9 @@ Resource Event Types
 .. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
    :identifiers: drm_xe_eudebug_event_vm_bind_ufence
 
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_eu_attention
+
 VM Access
 =========
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b72edf776f93..5d9569d5fd1a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -587,6 +587,9 @@ struct xe_device {
 
 		/** @wq: used for client discovery */
 		struct workqueue_struct *wq;
+
+		/** @attention_poll: attention poll work */
+		struct delayed_work attention_dwork;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 321012d2f6e8..2566b55f9c47 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -20,6 +20,7 @@
 #include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_gt_debug.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
@@ -1822,6 +1823,157 @@ static const struct file_operations fops = {
 	.unlocked_ioctl	= xe_eudebug_ioctl,
 };
 
+static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
+{
+	struct drm_xe_eudebug_event_eu_attention *e;
+	struct drm_xe_eudebug_event *event;
+	const u32 size = xe_gt_eu_attention_bitmap_size(q->gt);
+	const u32 sz = struct_size(e, bitmask, size);
+	int h_queue, h_lrc;
+	int ret;
+
+	XE_WARN_ON(lrc_idx < 0 || lrc_idx >= q->width);
+
+	XE_WARN_ON(!xe_exec_queue_is_debuggable(q));
+
+	h_queue = find_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
+	if (h_lrc < 0)
+		return h_lrc;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION, 0,
+					DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz);
+
+	if (!event)
+		return -ENOSPC;
+
+	e = cast_event(e, event);
+	e->exec_queue_handle = h_queue;
+	e->lrc_handle = h_lrc;
+	e->bitmask_size = size;
+
+	mutex_lock(&d->hw.lock);
+	event->seqno = atomic_long_inc_return(&d->events.seqno);
+	ret = xe_gt_eu_attention_bitmap(q->gt, &e->bitmask[0], e->bitmask_size);
+	mutex_unlock(&d->hw.lock);
+
+	if (ret) {
+		kfree(event);
+		return ret;
+	}
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int xe_send_gt_attention(struct xe_gt *gt)
+{
+	struct xe_eudebug *d;
+	struct xe_exec_queue *q;
+	int ret, lrc_idx;
+
+	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	if (!xe_exec_queue_is_debuggable(q)) {
+		ret = -EPERM;
+		goto err_exec_queue_put;
+	}
+
+	d = xe_eudebug_get_nolock(q->vm->xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto err_exec_queue_put;
+	}
+
+	if (!completion_done(&d->discovery)) {
+		eu_dbg(d, "discovery not yet done\n");
+		ret = -EBUSY;
+		goto err_eudebug_put;
+	}
+
+	ret = send_attention_event(d, q, lrc_idx);
+	if (ret)
+		xe_eudebug_disconnect(d, ret);
+
+err_eudebug_put:
+	xe_eudebug_put(d);
+err_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
+{
+	int ret;
+
+	ret = xe_gt_eu_threads_needing_attention(gt);
+	if (ret <= 0)
+		return ret;
+
+	ret = xe_send_gt_attention(gt);
+
+	/* Discovery in progress, fake it */
+	if (ret == -EBUSY)
+		return 0;
+
+	return ret;
+}
+
+static void attention_poll_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, typeof(*xe),
+					    eudebug.attention_dwork.work);
+	const unsigned int poll_interval_ms = 100;
+	long delay = msecs_to_jiffies(poll_interval_ms);
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	/* Non critical if we get it wrong, just longer delay on race */
+	if (data_race(list_empty(&xe->eudebug.targets)))
+		delay *= 11;
+
+	if (delay >= HZ)
+		delay = round_jiffies_up_relative(delay);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		for_each_gt(gt, xe, gt_id) {
+			int ret;
+
+			if (gt->info.type != XE_GT_TYPE_MAIN)
+				continue;
+
+			ret = xe_eudebug_handle_gt_attention(gt);
+			if (ret) {
+				/* TODO: error capture */
+				drm_info(&gt_to_xe(gt)->drm,
+					 "gt:%d unable to handle eu attention ret=%d\n",
+					 gt_id, ret);
+
+				xe_gt_reset_async(gt);
+			}
+		}
+
+		xe_pm_runtime_put(xe);
+	}
+
+	schedule_delayed_work(&xe->eudebug.attention_dwork, delay);
+}
+
+static void attention_poll_stop(struct xe_device *xe)
+{
+	cancel_delayed_work_sync(&xe->eudebug.attention_dwork);
+}
+
+static void attention_poll_start(struct xe_device *xe)
+{
+	mod_delayed_work(system_wq, &xe->eudebug.attention_dwork, 0);
+}
+
 static int
 xe_eudebug_connect(struct xe_device *xe,
 		   struct drm_file *drm_file,
@@ -1899,6 +2051,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref); /* for discovery */
 	queue_work(xe->eudebug.wq, &d->discovery_work);
+	attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -1971,6 +2124,11 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
 
+	if (enable)
+		attention_poll_start(xe);
+	else
+		attention_poll_stop(xe);
+
 	return 0;
 }
 
@@ -2012,6 +2170,15 @@ static void xe_eudebug_sysfs_fini(void *arg)
 			  &dev_attr_enable_eudebug.attr);
 }
 
+static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	xe_assert(xe, list_empty(&xe->eudebug.targets));
+
+	attention_poll_stop(xe);
+}
+
 void xe_eudebug_init(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
@@ -2019,6 +2186,7 @@ void xe_eudebug_init(struct xe_device *xe)
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_dwork, attention_poll_work);
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
@@ -2033,6 +2201,10 @@ void xe_eudebug_init(struct xe_device *xe)
 	}
 	xe->eudebug.wq = wq;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_eudebug_fini, NULL);
+	if (err)
+		goto out_err;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 57bd82a02ecb..386b5c78ecff 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -37,7 +37,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -167,4 +167,3 @@ struct xe_eudebug {
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
-
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 6d69e100c965..54394a7e12ab 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -52,6 +52,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -329,6 +330,34 @@ struct drm_xe_eudebug_eu_control {
 	__u64 bitmask_ptr;
 };
 
+/**
+ * struct drm_xe_eudebug_event_eu_attention - EU Attention Event
+ *
+ * Whenever there is any thread in halted/attentions state, this
+ * event will be delivered. The event will be delivered periodically
+ * until there are no attentions detected.
+ *
+ */
+struct drm_xe_eudebug_event_eu_attention {
+	/** @base: base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @exec_queue_handle: Exec queue handle for the attentions */
+	__u64 exec_queue_handle;
+
+	/** @lrc_handle: LRC handle for the attentions */
+	__u64 lrc_handle;
+
+	/** @flags: Flags */
+	__u32 flags;
+
+	/** @bitmask_size: Bitmask size in bytes for bitmask[] */
+	__u32 bitmask_size;
+
+	/** @bitmask: Attention bits, one per thread */
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

