Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E01CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBD10E424;
	Mon,  6 Oct 2025 11:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENioGedD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8C510E424
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749499; x=1791285499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nVf0W16uRGquL+3oTgkiiJXAcohm0XD8bpUAxI9vViQ=;
 b=ENioGedDgw9rMCmqC2WvvT0KxdLzAyxc8/rH0ny0mkqLdsZhyA/yEjun
 3EMT50VStTaOIXBTRJyCZZCRQd43uCYYBBIH5fyGDbtny3x0BA9BhOfP8
 NuH6zsvIKL+1oKMBjzXrDzIC8OoRXVZtmmmDYkeF5YJ0K/6q0Xx6ci5ju
 ptZWyi3C5+Ksri9udsPSdTUYIlAWVclWwHmnhWwdDZyUHuy3BQcgVvdsF
 VLnzz8uhTG7sDJ1D4UZSKJN8VctbkwU+j+6n5sDrJNyBg1oZvCmWHD+QJ
 vk3LPyRHggh2hBczvE2Bksji61d8yKDT8WHxTn/EE4JnTXDLFDVl8S2ia w==;
X-CSE-ConnectionGUID: cSaJF0eqQWybRMABcirwAg==
X-CSE-MsgGUID: RYap1adZQ3qKdNSycI1dCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825448"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:19 -0700
X-CSE-ConnectionGUID: Ef3p9+CeSDSkSDHzrZ+yyw==
X-CSE-MsgGUID: PNVWrzdzRDy7yvHn0v2YyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216947100"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:15 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 12/20] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Mon,  6 Oct 2025 14:17:02 +0300
Message-ID: <20251006111711.201906-13-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_eudebug.c       | 171 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.c    |   6 +-
 drivers/gpu/drm/xe/xe_eudebug_types.h |   3 +-
 include/uapi/drm/xe_drm_eudebug.h     |  12 ++
 5 files changed, 190 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 163305440fdf..9ea962dd4749 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -632,6 +632,9 @@ struct xe_device {
 
 		/** @wq: used for client discovery */
 		struct workqueue_struct *wq;
+
+		/** @attention_poll: attention poll work */
+		struct delayed_work attention_dwork;
 	} eudebug;
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a71797b4e9dd..0dae4694b8a0 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -21,7 +21,10 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
+#include "xe_gt.h"
+#include "xe_gt_debug.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -1871,6 +1874,154 @@ static const struct file_operations fops = {
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
+	d = _xe_eudebug_get(q->vm->xef);
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
@@ -1942,6 +2093,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
+	attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -2006,6 +2158,11 @@ static int xe_eudebug_enable(struct xe_device *xe, bool enable)
 		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
 	mutex_unlock(&xe->eudebug.lock);
 
+	if (enable)
+		attention_poll_start(xe);
+	else
+		attention_poll_stop(xe);
+
 	return 0;
 }
 
@@ -2047,6 +2204,15 @@ static void xe_eudebug_sysfs_fini(void *arg)
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
@@ -2054,6 +2220,7 @@ void xe_eudebug_init(struct xe_device *xe)
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_dwork, attention_poll_work);
 
 	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
 
@@ -2068,6 +2235,10 @@ void xe_eudebug_init(struct xe_device *xe)
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
index 11e3fe0c05e0..a62c4b439888 100644
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
index 24bf3887d556..1c797a8b4d32 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -55,12 +55,14 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
 #define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
 #define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
 #define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
+
 	__u64 seqno;
 	__u64 reserved;
 };
@@ -198,6 +200,16 @@ struct drm_xe_eudebug_eu_control {
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

