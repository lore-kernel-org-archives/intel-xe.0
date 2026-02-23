Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C409EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B44510E445;
	Mon, 23 Feb 2026 14:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrosFi5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE710E447
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855479; x=1803391479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLkf0ykHqCRCvUTgBSl9OsGjJfqkWEBIOqLy6bXExE4=;
 b=VrosFi5dHliXQ8WgnJjSCccofT4Z7cNqWhuRkXcS1HiyYwAjpc2xuCz+
 XsEF3TuATtUSkpUE0JfWX3h67I3rQGFVgSqseM0qBTEoaKdDmiHoaKw9W
 lWVuAHtD8Xg8SZb9oS8w44xtjBxTYKJS8QPTHD2N1h/Rx5Wnrb1NnD9HD
 ADTdZ0+6YGqTQHxCvzi4fhDjfHnUEOwm4SoXplTxdVCRFU3jHLeGji/Pu
 c39/C0RPZGuS8ybO8B6uvCNsYEj9l5ZlThsNMfl+bLT/GMeCNgoXV08Vu
 zCJbDGl5culQDpVWMkfoTrumLVOh77ZgvxEzIlgdaVMTKbmWYqqpmOLsG Q==;
X-CSE-ConnectionGUID: KXgrK7ztQZaP41kriWsihA==
X-CSE-MsgGUID: w1kIAz1LRwOQrz77n8mZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460932"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:39 -0800
X-CSE-ConnectionGUID: GSENXpDeSz2ceyQ85F0z1A==
X-CSE-MsgGUID: 65ilxZClRSiVtG4yzRbO+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656428"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:34 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 15/22] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Mon, 23 Feb 2026 16:03:10 +0200
Message-ID: <20260223140318.1822138-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 170 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.c    |   6 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h |   3 +-
 include/uapi/drm/xe_drm_eudebug.h     |  29 +++++
 6 files changed, 209 insertions(+), 5 deletions(-)

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
index 21e749c6a635..985c294e94de 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -585,6 +585,9 @@ struct xe_device {
 
 		/** @wq: used for client discovery */
 		struct workqueue_struct *wq;
+
+		/** @attention_poll: attention poll work */
+		struct delayed_work attention_dwork;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index da28baa007c8..0c67db86f009 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -21,6 +21,8 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
+#include "xe_gt.h"
+#include "xe_gt_debug.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_sync.h"
@@ -1799,6 +1801,154 @@ static const struct file_operations fops = {
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
+	if (ret)
+		return ret;
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
+	if (list_empty(&xe->eudebug.targets))
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
 		   struct drm_file *file,
@@ -1868,6 +2018,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
+	attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -1936,6 +2087,11 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
 
+	if (enable)
+		attention_poll_start(xe);
+	else
+		attention_poll_stop(xe);
+
 	return 0;
 }
 
@@ -1977,6 +2133,15 @@ static void xe_eudebug_sysfs_fini(void *arg)
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
@@ -1984,6 +2149,7 @@ void xe_eudebug_init(struct xe_device *xe)
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_dwork, attention_poll_work);
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
@@ -1998,6 +2164,10 @@ void xe_eudebug_init(struct xe_device *xe)
 	}
 	xe->eudebug.wq = wq;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_eudebug_fini, NULL);
+	if (err)
+		goto out_err;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index 3e2e3ab5aa45..5365265a67b3 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -301,7 +301,7 @@ static struct xe_exec_queue *active_hwe_to_exec_queue(struct xe_hw_engine *hwe,
 	return found;
 }
 
-static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
 {
 	struct xe_hw_engine *active;
 
@@ -615,7 +615,7 @@ static int xe_eu_control_resume(struct xe_eudebug *d,
 	struct xe_exec_queue *active;
 	int lrc_idx;
 
-	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	active = xe_gt_runalone_active_queue_get(q->gt, &lrc_idx);
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
@@ -657,7 +657,7 @@ static int xe_eu_control_stopped(struct xe_eudebug *d,
 	if (XE_WARN_ON(!q) || XE_WARN_ON(!q->gt))
 		return -EINVAL;
 
-	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	active = xe_gt_runalone_active_queue_get(q->gt, &lrc_idx);
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
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

