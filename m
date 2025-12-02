Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E2CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C8510E656;
	Tue,  2 Dec 2025 13:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLKjz60v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1110E656
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683628; x=1796219628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Z8a6GXQvqaOdsArWGW1TCLhEGTG0gtIpKbnjsYf744=;
 b=FLKjz60vughsQ7pTYlthDCgmv91ts6Vul+0wi61pZD3xGzVKSkhqiznd
 n6n1BVRkz+GfJw9W5OY3dVmr8XxHFevkb1IRSuu8B6KQva1T5krKKkX0N
 0QIZKkE8sK2ScaA3UM7mN3O9ofNVv4I96IQdraZLMVwsxRaS35Qp/LQ4/
 L8VhL75fi35hnDjUeXeCT9OwKR9qt3eikd8nGKg6QP0ojx5DiP22td9bY
 w16j2SEZUsc0hgPFbHWJ5nU4wVE3G4Vt6eiXH11ZvxD79WqPxaMaae0Jp
 H0HB7ALG9Ng7fFBH8i/YMR0AuCtAPsRtGYec0ot4qzA4chkuQweObAq4M g==;
X-CSE-ConnectionGUID: y207AkXBQfi67AJYksoWPA==
X-CSE-MsgGUID: vT392S8iQ0iCr8uCkuJnBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537111"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:47 -0800
X-CSE-ConnectionGUID: Y20mj9TtRaikXvxSsHIDew==
X-CSE-MsgGUID: 61GmoONeQeKcAIrGCiNOqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505727"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:44 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 13/20] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Tue,  2 Dec 2025 15:52:32 +0200
Message-ID: <20251202135241.880267-14-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 170 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.c    |   6 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h |   3 +-
 include/uapi/drm/xe_drm_eudebug.h     |  11 ++
 5 files changed, 188 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6fe6e200fe9f..15deeb8488da 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -679,6 +679,9 @@ struct xe_device {
 
 		/** @wq: used for client discovery */
 		struct workqueue_struct *wq;
+
+		/** @attention_poll: attention poll work */
+		struct delayed_work attention_dwork;
 	} eudebug;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 5faa06ba44db..97e8a7ccef55 100644
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
@@ -1704,6 +1706,154 @@ static const struct file_operations fops = {
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
+	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
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
@@ -1775,6 +1925,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
+	attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -1843,6 +1994,11 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
 
+	if (enable)
+		attention_poll_start(xe);
+	else
+		attention_poll_stop(xe);
+
 	return 0;
 }
 
@@ -1884,6 +2040,15 @@ static void xe_eudebug_sysfs_fini(void *arg)
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
@@ -1891,6 +2056,7 @@ void xe_eudebug_init(struct xe_device *xe)
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_dwork, attention_poll_work);
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
@@ -1905,6 +2071,10 @@ void xe_eudebug_init(struct xe_device *xe)
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
index 7ac0dd03ebf0..236740ef10ba 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -301,7 +301,7 @@ static struct xe_exec_queue *active_hwe_to_exec_queue(struct xe_hw_engine *hwe,
 	return found;
 }
 
-static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
 {
 	struct xe_hw_engine *active;
 
@@ -612,7 +612,7 @@ static int xe_eu_control_resume(struct xe_eudebug *d,
 	struct xe_exec_queue *active;
 	int lrc_idx;
 
-	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	active = xe_gt_runalone_active_queue_get(q->gt, &lrc_idx);
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
@@ -654,7 +654,7 @@ static int xe_eu_control_stopped(struct xe_eudebug *d,
 	if (XE_WARN_ON(!q) || XE_WARN_ON(!q->gt))
 		return -EINVAL;
 
-	active = runalone_active_queue_get(q->gt, &lrc_idx);
+	active = xe_gt_runalone_active_queue_get(q->gt, &lrc_idx);
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 205777a851a3..85fc321f8b0e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -37,7 +37,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -172,4 +172,3 @@ struct xe_eudebug {
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
-
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index df6e028bcd9c..9f558e56b577 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -55,6 +55,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -197,6 +198,16 @@ struct drm_xe_eudebug_eu_control {
 	__u64 bitmask_ptr;
 };
 
+struct drm_xe_eudebug_event_eu_attention {
+	struct drm_xe_eudebug_event base;
+
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

