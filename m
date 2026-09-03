Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2CFC624DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2CA10F66F;
	Thu,  3 Sep 2026 15:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHjgCDRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032E10F66D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447693; x=1819983693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTNBQnaRloQPCNRizXAOzuFBNxLK4eNqx7RG1F3RB1I=;
 b=WHjgCDRkyG5NvoGku63SRIDmdQ+cKuc5exL3nOtQjn/99BEbacfeYy+V
 qeZzxfK8ZvL2oTyVD0hYmfqK776dkmKEeyjsho/k/A7ESYSaWwKSSj2qL
 MIEuJcsrrarUiW9nzOVbr3q+W+MoDFDQEmDZd8Kvu8CiBcqlrVxsGT1D4
 Jy3JossrCpFDmU3ICk5F1inWBZNzQoJAqnESU2UAXkvfFplCySnO9Ht1m
 RmxTOOi6GQXCpe6ovSxSn2lSg+B98qTVkApdyqMTZ82M7RWLCOCihNHli
 aNg1nD2z9HuO91thReD+xCnvYIOKECQKFEZSisv6idL2hbVZGDdZ6meaX A==;
X-CSE-ConnectionGUID: IYU+fbjFR8eBzLPnc3gz4g==
X-CSE-MsgGUID: za7d82omTrqoxzOtivzOnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486812"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486812"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:20 -0700
X-CSE-ConnectionGUID: +Lz4q1GxT0KOsgkDvq+iNw==
X-CSE-MsgGUID: 67bw02Z5T5GNm7zKe72qvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441119"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:15 -0700
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
Subject: [PATCH v10 16/27] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Thu,  3 Sep 2026 17:59:40 +0300
Message-ID: <20260903145952.848051-17-mika.kuoppala@linux.intel.com>
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

Scan for EU debugging attention bits periodically to detect if some EU
thread has entered the system routine (SIP) due to EU thread exception.

Make the scanning interval 50 times slower when there is no debugger
connection open. Send an attention event whenever we see attention
with a debugger present. If there is no active debugger connection,
reset.

Based on work by the authors and others who worked on attentions in
i915.

v2: - use xa_array for files
    - null ptr deref fix for non-debugged context (Dominik)
    - checkpatch (Tilak)
    - use discovery_lock during list traversal

v3: - engine status per gen improvements, force_wake ref
    - __counted_by (Mika)

v4: - attention register naming (Dominik)
v5: - free event on error (Mika)
v6: - annotate data race on extending the poll interval (Mika)
v7: - sysfs race fix, return error instead of XA_WARN_ON (Sashiko)
    - attention_poll_stop to async to avoid deadlock (lockdep)
v8: - don't send if there are no attentions
    - stop before cancel (Claude)
    - use a device workqueue instead of system_dfl_wq (Maciej, Claude)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst   |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   9 ++
 drivers/gpu/drm/xe/xe_eudebug.c       | 214 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_types.h |   2 +-
 include/uapi/drm/xe_drm_eudebug.h     |  34 ++++
 5 files changed, 261 insertions(+), 1 deletion(-)

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
index c62e774495fd..90ef9ba684d7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -622,6 +622,15 @@ struct xe_device {
 
 		/** @eudebug.ufence_wq: used for deferred ufence signalling */
 		struct workqueue_struct *ufence_wq;
+
+		/** @eudebug.attention_wq: used for the attention poll work */
+		struct workqueue_struct *attention_wq;
+
+		/** @eudebug.attention_dwork: attention poll work */
+		struct delayed_work attention_dwork;
+
+		/** @eudebug.send_attentions: handle attentions or ignore */
+		bool send_attentions;
 	} eudebug;
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index ecd6d4c5d63c..9cb02024bf51 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -22,6 +22,7 @@
 #include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_gt_debug.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
@@ -1928,6 +1929,190 @@ static const struct file_operations fops = {
 	.compat_ioctl   = xe_eudebug_ioctl,
 };
 
+static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q,
+				int lrc_idx, void *bitmap, unsigned int size)
+{
+	struct drm_xe_eudebug_event_eu_attention *e;
+	struct drm_xe_eudebug_event *event;
+	const u32 sz = struct_size(e, bitmask, size);
+	int h_queue, h_lrc;
+	int ret;
+
+	if (lrc_idx < 0 || lrc_idx >= q->width)
+		return -EINVAL;
+
+	h_queue = find_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
+	if (h_lrc < 0)
+		return h_lrc;
+
+	spin_lock(&d->events.lock);
+	event = xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION, 0,
+					 DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz);
+
+	event->seqno = atomic_long_inc_return(&d->events.seqno);
+	e = cast_event(e, event);
+	e->exec_queue_handle = h_queue;
+	e->lrc_handle = h_lrc;
+	e->bitmask_size = size;
+
+	memcpy(e->bitmask, bitmap, size);
+	ret = xe_eudebug_queue_event(d, event);
+	spin_unlock(&d->events.lock);
+
+	return ret;
+}
+
+static int xe_send_gt_attention(struct xe_gt *gt, void *bitmap, unsigned int size)
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
+	ret = send_attention_event(d, q, lrc_idx, bitmap, size);
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
+	struct xe_device *xe = gt_to_xe(gt);
+	const u32 size = xe_gt_eu_attention_bitmap_size(gt);
+	int ret;
+	void *bitmask;
+
+	if (!READ_ONCE(xe->eudebug.send_attentions))
+		return 0;
+
+	ret = xe_gt_eu_threads_needing_attention(gt);
+	if (ret <= 0)
+		return ret;
+
+	/* If we fail at this time, assume we manage to send eventually */
+	bitmask = kvzalloc(size, GFP_KERNEL);
+	if (!bitmask)
+		return 0;
+
+	ret = xe_gt_eu_attention_bitmap(gt, bitmask, size);
+	if (ret)
+		goto out;
+
+	if (bitmap_empty(bitmask, size * BITS_PER_BYTE))
+		goto out;
+
+	ret = xe_send_gt_attention(gt, bitmask, size);
+out:
+	kvfree(bitmask);
+
+	/* Discovery in progress, fake it */
+	if (ret == -EBUSY)
+		return 0;
+
+	return ret;
+}
+
+static void handle_attention_fail(struct xe_gt *gt, int gt_id, int ret)
+{
+	/* TODO: error capture */
+	drm_err_ratelimited(&gt_to_xe(gt)->drm,
+			    "gt:%d unable to handle eu attention ret = %d\n",
+			    gt_id, ret);
+
+	xe_gt_reset_async(gt);
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
+	if (!READ_ONCE(xe->eudebug.send_attentions))
+		return;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		for_each_gt(gt, xe, gt_id) {
+			int ret;
+
+			if (gt->info.type != XE_GT_TYPE_MAIN)
+				continue;
+
+			ret = xe_eudebug_handle_gt_attention(gt);
+			if (ret)
+				handle_attention_fail(gt, gt_id, ret);
+		}
+
+		xe_pm_runtime_put(xe);
+	}
+
+	/* Non critical if we get it wrong, just longer delay on race */
+	if (data_race(list_empty(&xe->eudebug.targets)))
+		delay = 5 * HZ;
+
+	if (delay >= HZ)
+		delay = round_jiffies_up_relative(delay);
+
+	if (READ_ONCE(xe->eudebug.send_attentions))
+		queue_delayed_work(xe->eudebug.attention_wq,
+				   &xe->eudebug.attention_dwork, delay);
+}
+
+/*
+ * The cancel is deliberately the async one. This runs under
+ * xe->eudebug.lock and attention_poll_work() reaches that same lock
+ * through xe_gt_runalone_active_queue_get(), so waiting for the worker
+ * here would deadlock.
+ *
+ * Clearing send_attentions first is therefore what actually stops the
+ * poll: a worker already past its own requeue check can arm the work one
+ * more time, and that wakeup returns at the top guard without rearming.
+ */
+static void xe_eudebug_attention_poll_stop(struct xe_device *xe)
+{
+	WRITE_ONCE(xe->eudebug.send_attentions, false);
+	cancel_delayed_work(&xe->eudebug.attention_dwork);
+}
+
+static void xe_eudebug_attention_poll_start(struct xe_device *xe)
+{
+	WRITE_ONCE(xe->eudebug.send_attentions, true);
+	mod_delayed_work(xe->eudebug.attention_wq, &xe->eudebug.attention_dwork, 0);
+}
+
 static int
 xe_eudebug_connect(struct xe_device *xe,
 		   struct drm_file *drm_file,
@@ -2017,6 +2202,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref); /* for discovery */
 	queue_work(xe->eudebug.discovery_wq, &d->discovery_work);
+	xe_eudebug_attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -2090,6 +2276,11 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	WRITE_ONCE(xe->eudebug.cap_state, enable ?
 		   XE_EUDEBUG_CAP_ENABLED : XE_EUDEBUG_CAP_DISABLED);
 
+	if (enable)
+		xe_eudebug_attention_poll_start(xe);
+	else
+		xe_eudebug_attention_poll_stop(xe);
+
 	return 0;
 }
 
@@ -2131,12 +2322,24 @@ static void xe_eudebug_sysfs_fini(void *arg)
 			  &dev_attr_enable_eudebug.attr);
 }
 
+static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	xe_assert(xe, list_empty(&xe->eudebug.targets));
+
+	xe_eudebug_attention_poll_stop(xe);
+	cancel_delayed_work_sync(&xe->eudebug.attention_dwork);
+}
+
 void xe_eudebug_init_early(struct xe_device *xe)
 {
 	struct drm_device *dev = &xe->drm;
 	int err;
 
 	INIT_LIST_HEAD(&xe->eudebug.targets);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_dwork, attention_poll_work);
+
 	WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_NOT_SUPPORTED);
 
 	err = drmm_mutex_init(dev, &xe->eudebug.lock);
@@ -2174,6 +2377,17 @@ void xe_eudebug_init(struct xe_device *xe)
 		goto out_err;
 	xe->eudebug.ufence_wq = wq;
 
+	wq = drmm_alloc_ordered_workqueue(dev, "xe-eudebug-attn", 0);
+	if (IS_ERR(wq)) {
+		err = PTR_ERR(wq);
+		goto out_err;
+	}
+	xe->eudebug.attention_wq = wq;
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_eudebug_fini, NULL);
+	if (err)
+		goto out_err;
+
 	err = sysfs_create_file(&dev->dev->kobj,
 				&dev_attr_enable_eudebug.attr);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 2885882ae415..5d3f190baecd 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -38,7 +38,7 @@ enum xe_eudebug_cap_state {
 	XE_EUDEBUG_CAP_ENABLED,
 };
 
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index e000d41a5e02..57ff3d90ac29 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -73,6 +73,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -363,6 +364,39 @@ struct drm_xe_eudebug_eu_control {
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
+	/**
+	 * @flags: Reserved for future use, reads as zero
+	 *
+	 * Event wide flags are carried in
+	 * :c:member:`drm_xe_eudebug_event_eu_attention.base`.
+	 */
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
2.53.0

