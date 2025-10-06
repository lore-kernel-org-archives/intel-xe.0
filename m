Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBCACCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036F910E42D;
	Mon,  6 Oct 2025 11:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfqXYToX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53C10E42D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749527; x=1791285527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E6K8iRyUk0c+9jYZBnybPP/P1jF3XcT6UvvgTtaFceE=;
 b=IfqXYToXqCk6pN1jDZyp52qhU5z6v1J9VJdebZEut//mCD2QyMuy7fk9
 bzAkqq/hmb7fLN1mmnFeNeCu1rUAM1n71w1ororIc0P5QNoiJwkbUSGe2
 /frSYZktl/icJjEfNm0xXzZRAQyucAdpo4ZNX/ztbLHH9H57AMvUlxMdV
 v8ACam6UgnT/s9LRCSQUo9gAkonN4nWnXVDiG+jIzXHNtOwq5FjVDrMJf
 1JBs5pjiJfTrh1sNjb9ykMFZaVxZHoUA5qkaz2Tmb/ljbsPe7/0HcLb5T
 3yAOsnAEbjSiyV/VcVcSBbgMSfiJQNf8p2LlocxJY9OG8rSTYUefFRoWr A==;
X-CSE-ConnectionGUID: AQJxBN+FTPKXUFUzUfOrdw==
X-CSE-MsgGUID: TLDVYw39T1WLbuQVDNJYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825474"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:47 -0700
X-CSE-ConnectionGUID: 1GKzAO4BSd+lTFF/NWBdxw==
X-CSE-MsgGUID: Es8DNrqwQxCw7+5yr1rlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216947244"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:42 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 18/20] drm/xe/eudebug: Introduce EU pagefault handling
 interface
Date: Mon,  6 Oct 2025 14:17:08 +0300
Message-ID: <20251006111711.201906-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. To solve this problem, introduce
EU pagefault handling functionality, which allows to unhalt pagefaulted
eu threads and to EU debugger to get inform about the eu attentions state
of EU threads during execution.

If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
after handling the pagefault. The pagefault eudebug event follows
the newly added drm_xe_eudebug_event_pagefault type.
When a pagefault occurs, it prevents to send the
DRM_XE_EUDEBUG_EVENT_EU_ATTENTION event to the client during pagefault
handling.

The page fault event delivery follows the below policy.
(1) If EU Debugger discovery has completed and pagefaulted eu threads turn
    on attention bit then pagefault handler delivers pagefault event
    directly.
(2) If a pagefault occurs during eu debugger discovery process, pagefault
    handler queues a pagefault event and sends the queued event when
    discovery has completed and pagefaulted eu threads turn on attention
    bit.
(3) If the pagefaulted eu thread struggles to turn on the attention bit
    within the specified time, the attention scan worker sends a pagefault
    event when it detects that the attention bit is turned on.

If multiple eu threads are running and a pagefault occurs due to accessing
the same invalid address, send a single pagefault event
(DRM_XE_EUDEBUG_EVENT_PAGEFAULT type) to the user debugger instead of a
pagefault event for each of the multiple eu threads.
If eu threads (other than the one that caused the page fault before) access
the new invalid addresses, send a new pagefault event.

As the attention scan worker send the eu attention event whenever the
attention bit is turned on, user debugger receives attenion event
immediately after pagefault event.
In this case, the page-fault event always precedes the attention event.

When the user debugger receives an attention event after a pagefault event,
it can detect whether additional breakpoints or interrupts occur in
addition to the existing pagefault by comparing the eu threads where the
pagefault occurred with the eu threads where the attention bit is newly
enabled.

v2: use only force exception (Joonas, Mika)
v3: rebased on v4 (Mika)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jan Maślak <jan.maslak@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   2 +-
 drivers/gpu/drm/xe/xe_eudebug.c           | 124 +++++--
 drivers/gpu/drm/xe/xe_eudebug.h           |  36 ++
 drivers/gpu/drm/xe/xe_eudebug_hw.c        |  15 +-
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c | 391 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h |  15 +
 drivers/gpu/drm/xe/xe_eudebug_types.h     |  60 +++-
 include/uapi/drm/xe_drm_eudebug.h         |  12 +
 8 files changed, 618 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 16666f0a4c01..97827ec36e59 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -147,7 +147,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_eudebug_pagefault.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 5dc8e4cd7f6b..c64898de85d8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -17,12 +17,16 @@
 #include "xe_eudebug.h"
 #include "xe_eudebug_hw.h"
 #include "xe_eudebug_types.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_sync.h"
@@ -184,6 +188,8 @@ static void xe_eudebug_free(struct kref *ref)
 	while (kfifo_get(&d->events.fifo, &event))
 		kfree(event);
 
+	xe_eudebug_pagefault_fini(d);
+
 	xe_eudebug_destroy_resources(d);
 	XE_WARN_ON(d->target.xef);
 
@@ -381,8 +387,8 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
 	} \
 })
 
-static struct xe_eudebug *
-_xe_eudebug_get(struct xe_file *xef)
+struct xe_eudebug *
+xe_eudebug_get_nolock(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
@@ -392,7 +398,11 @@ _xe_eudebug_get(struct xe_file *xef)
 		d = NULL;
 	mutex_unlock(&xef->eudebug.lock);
 
-	if (d && xe_eudebug_detached(d)) {
+	if (!d)
+		return NULL;
+
+	if (xe_eudebug_detached(d) ||
+	    !completion_done(&d->discovery)) {
 		xe_eudebug_put(d);
 		return NULL;
 	}
@@ -403,20 +413,9 @@ _xe_eudebug_get(struct xe_file *xef)
 struct xe_eudebug *
 xe_eudebug_get(struct xe_file *xef)
 {
-	struct xe_eudebug *d;
-
 	lockdep_assert_held(&xef->eudebug.ioctl_lock);
 
-	d = _xe_eudebug_get(xef);
-	if (!d)
-		return NULL;
-
-	if (!completion_done(&d->discovery)) {
-		xe_eudebug_put(d);
-		return NULL;
-	}
-
-	return d;
+	return xe_eudebug_get_nolock(xef);
 }
 
 static int xe_eudebug_queue_event(struct xe_eudebug *d,
@@ -1932,7 +1931,7 @@ static int xe_send_gt_attention(struct xe_gt *gt)
 		goto err_exec_queue_put;
 	}
 
-	d = _xe_eudebug_get(q->vm->xef);
+	d = xe_eudebug_get_nolock(q->vm->xef);
 	if (!d) {
 		ret = -ENOTCONN;
 		goto err_exec_queue_put;
@@ -1960,10 +1959,6 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
 {
 	int ret;
 
-	ret = xe_gt_eu_threads_needing_attention(gt);
-	if (ret <= 0)
-		return ret;
-
 	ret = xe_send_gt_attention(gt);
 
 	/* Discovery in progress, fake it */
@@ -1973,6 +1968,65 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
 	return ret;
 }
 
+int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
+				    struct xe_eudebug_pagefault *pf)
+{
+	struct drm_xe_eudebug_event_pagefault *ep;
+	struct drm_xe_eudebug_event *event;
+	int h_queue, h_lrc;
+	u32 size = xe_gt_eu_attention_bitmap_size(pf->q->gt) * 3;
+	u32 sz = struct_size(ep, bitmask, size);
+	int ret;
+
+	XE_WARN_ON(pf->lrc_idx < 0 || pf->lrc_idx >= pf->q->width);
+
+	XE_WARN_ON(!xe_exec_queue_is_debuggable(pf->q));
+
+	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, pf->q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, pf->q->lrc[pf->lrc_idx]);
+	if (h_lrc < 0)
+		return h_lrc;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0,
+					DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz);
+
+	if (!event)
+		return -ENOSPC;
+
+	ep = cast_event(ep, event);
+	ep->exec_queue_handle = h_queue;
+	ep->lrc_handle = h_lrc;
+	ep->bitmask_size = size;
+	ep->pagefault_address = pf->fault.addr;
+
+	memcpy(ep->bitmask, pf->attentions.before.att, pf->attentions.before.size);
+	memcpy(ep->bitmask + pf->attentions.before.size,
+	       pf->attentions.after.att, pf->attentions.after.size);
+	memcpy(ep->bitmask + pf->attentions.before.size + pf->attentions.after.size,
+	       pf->attentions.resolved.att, pf->attentions.resolved.size);
+
+	event->seqno = atomic_long_inc_return(&d->events.seqno);
+
+	ret = xe_eudebug_queue_event(d, event);
+	if (ret)
+		xe_eudebug_disconnect(d, ret);
+
+	return ret;
+}
+
+static void handle_attention_fail(struct xe_gt *gt, int gt_id, int ret)
+{
+	/* TODO: error capture */
+	drm_info(&gt_to_xe(gt)->drm,
+		 "gt:%d unable to handle eu attention ret = %d\n",
+		 gt_id, ret);
+
+	xe_gt_reset_async(gt);
+}
+
 static void attention_poll_work(struct work_struct *work)
 {
 	struct xe_device *xe = container_of(work, typeof(*xe),
@@ -1995,15 +2049,15 @@ static void attention_poll_work(struct work_struct *work)
 			if (gt->info.type != XE_GT_TYPE_MAIN)
 				continue;
 
-			ret = xe_eudebug_handle_gt_attention(gt);
-			if (ret) {
-				/* TODO: error capture */
-				drm_info(&gt_to_xe(gt)->drm,
-					 "gt:%d unable to handle eu attention ret=%d\n",
-					 gt_id, ret);
+			if (!xe_gt_eu_threads_needing_attention(gt))
+				continue;
 
-				xe_gt_reset_async(gt);
-			}
+			ret = xe_eudebug_handle_pagefaults(gt);
+			if (!ret)
+				ret = xe_eudebug_handle_gt_attention(gt);
+
+			if (ret)
+				handle_attention_fail(gt, gt_id, ret);
 		}
 
 		xe_pm_runtime_put(xe);
@@ -2012,12 +2066,12 @@ static void attention_poll_work(struct work_struct *work)
 	schedule_delayed_work(&xe->eudebug.attention_dwork, delay);
 }
 
-static void attention_poll_stop(struct xe_device *xe)
+void xe_eudebug_attention_poll_stop(struct xe_device *xe)
 {
 	cancel_delayed_work_sync(&xe->eudebug.attention_dwork);
 }
 
-static void attention_poll_start(struct xe_device *xe)
+void xe_eudebug_attention_poll_start(struct xe_device *xe)
 {
 	mod_delayed_work(system_wq, &xe->eudebug.attention_dwork, 0);
 }
@@ -2060,6 +2114,8 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_init(&d->ref);
 	spin_lock_init(&d->target.lock);
+	mutex_init(&d->pf_lock);
+	INIT_LIST_HEAD(&d->pagefaults);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
 	init_completion(&d->discovery);
@@ -2093,7 +2149,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
-	attention_poll_start(xe);
+	xe_eudebug_attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -2187,9 +2243,9 @@ static int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	mutex_unlock(&xe->eudebug.lock);
 
 	if (enable)
-		attention_poll_start(xe);
+		xe_eudebug_attention_poll_start(xe);
 	else
-		attention_poll_stop(xe);
+		xe_eudebug_attention_poll_stop(xe);
 
 	return 0;
 }
@@ -2238,7 +2294,7 @@ static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
 
 	xe_assert(xe, list_empty(&xe->eudebug.targets));
 
-	attention_poll_stop(xe);
+	xe_eudebug_attention_poll_stop(xe);
 }
 
 void xe_eudebug_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ed3c2078e960..f5b02ee010c2 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,11 +13,13 @@ struct drm_file;
 struct xe_debug_data;
 struct xe_device;
 struct xe_file;
+struct xe_gt;
 struct xe_vm;
 struct xe_vma;
 struct xe_exec_queue;
 struct xe_user_fence;
 struct xe_eudebug;
+struct xe_eudebug_pagefault;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -77,8 +79,23 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, s
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 
 struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
+struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
+				    struct xe_eudebug_pagefault *pf);
+
+struct xe_eudebug_pagefault *xe_eudebug_pagefault_create(struct xe_gt *gt, struct xe_vm *vm,
+							 u64 page_addr, u8 fault_type,
+							 u8 fault_level, u8 access_type);
+void xe_eudebug_pagefault_process(struct xe_gt *gt, struct xe_eudebug_pagefault *pf);
+void xe_eudebug_pagefault_destroy(struct xe_gt *gt, struct xe_vm *vm,
+				  struct xe_eudebug_pagefault *pf, bool send_event);
+
+
+void xe_eudebug_attention_poll_stop(struct xe_device *xe);
+void xe_eudebug_attention_poll_start(struct xe_device *xe);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -116,6 +133,25 @@ static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
 static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
 static inline void xe_eudebug_put(struct xe_eudebug *d) { }
 
+static inline struct xe_eudebug_pagefault *
+xe_eudebug_pagefault_create(struct xe_gt *gt, struct xe_vm *vm, u64 page_addr,
+			    u8 fault_type, u8 fault_level, u8 access_type)
+{
+	return NULL;
+}
+
+static inline void
+xe_eudebug_pagefault_process(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+}
+
+static inline void xe_eudebug_pagefault_destroy(struct xe_gt *gt,
+						struct xe_vm *vm,
+						struct xe_eudebug_pagefault *pf,
+						bool send_event)
+{
+}
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index cd4627705b56..0d82542e03ce 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -326,6 +326,7 @@ static int do_eu_control(struct xe_eudebug *d,
 	struct xe_device *xe = d->xe;
 	u8 *bits = NULL;
 	unsigned int hw_attn_size, attn_size;
+	struct dma_fence *pf_fence;
 	struct xe_exec_queue *q;
 	struct xe_lrc *lrc;
 	u64 seqno;
@@ -377,8 +378,20 @@ static int do_eu_control(struct xe_eudebug *d,
 		goto out_free;
 	}
 
-	ret = -EINVAL;
 	mutex_lock(&d->hw.lock);
+	do {
+		pf_fence = dma_fence_get(d->pf_fence);
+		if (pf_fence) {
+			mutex_unlock(&d->hw.lock);
+			ret = dma_fence_wait(pf_fence, true);
+			dma_fence_put(pf_fence);
+			if (ret)
+				goto out_free;
+			mutex_lock(&d->hw.lock);
+		}
+	} while (pf_fence);
+
+	ret = -EINVAL;
 
 	switch (arg->cmd) {
 	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
new file mode 100644
index 000000000000..8d705d41a2aa
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include "xe_eudebug_pagefault.h"
+
+#include <linux/delay.h>
+
+#include "xe_exec_queue.h"
+#include "xe_eudebug.h"
+#include "xe_eudebug_hw.h"
+#include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_vm.h"
+
+static int queue_pagefault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	struct xe_eudebug *d;
+
+	d = xe_eudebug_get_nolock(pf->q->vm->xef);
+	if (!d)
+		return -EINVAL;
+
+	mutex_lock(&d->pf_lock);
+	list_add_tail(&pf->list, &d->pagefaults);
+	mutex_unlock(&d->pf_lock);
+
+	xe_eudebug_put(d);
+
+	return 0;
+}
+
+static int send_pagefault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf,
+			  bool from_attention_scan)
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
+		goto out_exec_queue_put;
+	}
+
+	d = xe_eudebug_get_nolock(q->vm->xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto out_exec_queue_put;
+	}
+
+	if (pf->deferred_resolved) {
+		xe_gt_eu_attentions_read(gt, &pf->attentions.resolved,
+					 XE_GT_ATTENTION_TIMEOUT_MS);
+
+		if (!xe_eu_attentions_xor_count(&pf->attentions.after,
+						&pf->attentions.resolved) &&
+		    !from_attention_scan) {
+			eu_dbg(d, "xe attentions not yet updated\n");
+			ret = -EBUSY;
+			goto out_eudebug_put;
+		}
+	}
+
+	ret = xe_eudebug_send_pagefault_event(d, pf);
+
+out_eudebug_put:
+	xe_eudebug_put(d);
+out_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int handle_pagefault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	int ret;
+
+	ret = send_pagefault(gt, pf, false);
+
+	/*
+	 * if debugger discovery is not completed or resolved attentions are not
+	 * updated, then queue pagefault
+	 */
+	if (ret == -EBUSY) {
+		ret = queue_pagefault(gt, pf);
+		if (!ret)
+			goto out;
+	}
+
+	xe_exec_queue_put(pf->q);
+	kfree(pf);
+
+out:
+	return ret;
+}
+
+static const char *
+pagefault_get_driver_name(struct dma_fence *dma_fence)
+{
+	return "xe";
+}
+
+static const char *
+pagefault_fence_get_timeline_name(struct dma_fence *dma_fence)
+{
+	return "eudebug_pagefault_fence";
+}
+
+static const struct dma_fence_ops pagefault_fence_ops = {
+	.get_driver_name = pagefault_get_driver_name,
+	.get_timeline_name = pagefault_fence_get_timeline_name,
+};
+
+struct pagefault_fence {
+	struct dma_fence base;
+	spinlock_t lock;
+};
+
+static struct pagefault_fence *pagefault_fence_create(void)
+{
+	struct pagefault_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return NULL;
+
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &pagefault_fence_ops, &fence->lock,
+		       dma_fence_context_alloc(1), 1);
+
+	return fence;
+}
+
+struct xe_eudebug_pagefault *
+xe_eudebug_pagefault_create(struct xe_gt *gt, struct xe_vm *vm, u64 page_addr,
+			    u8 fault_type, u8 fault_level, u8 access_type)
+{
+	struct pagefault_fence *pf_fence;
+	struct xe_eudebug_pagefault *pf;
+	struct xe_vma *vma = NULL;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	int lrc_idx;
+	u32 td_ctl;
+
+	down_read(&vm->lock);
+	vma = xe_vm_find_vma_by_addr(vm, page_addr);
+	up_read(&vm->lock);
+
+	if (vma)
+		return NULL;
+
+	d = xe_eudebug_get_nolock(vm->xef);
+	if (!d)
+		return NULL;
+
+	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(q))
+		goto err_put_eudebug;
+
+	if (!xe_exec_queue_is_debuggable(q))
+		goto err_put_exec_queue;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), q->hwe->domain);
+	if (!fw_ref)
+		goto err_put_exec_queue;
+
+	/*
+	 * If there is no debug functionality (TD_CTL_GLOBAL_DEBUG_ENABLE, etc.),
+	 * don't proceed pagefault routine for eu debugger.
+	 */
+	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	if (!td_ctl)
+		goto err_put_fw;
+
+	pf = kzalloc(sizeof(*pf), GFP_KERNEL);
+	if (!pf)
+		goto err_put_fw;
+
+	xe_eudebug_attention_poll_stop(gt_to_xe(gt));
+
+	mutex_lock(&d->hw.lock);
+	fence = dma_fence_get(d->pf_fence);
+
+	if (fence) {
+		/*
+		 * TODO: If the new incoming pagefaulted address is different
+		 * from the pagefaulted address it is currently handling on the
+		 * same ASID, it needs a routine to wait here and then do the
+		 * following pagefault.
+		 */
+		dma_fence_put(fence);
+		goto err_unlock_hw_lock;
+	}
+
+	pf_fence = pagefault_fence_create();
+	if (!pf_fence)
+		goto err_unlock_hw_lock;
+
+	d->pf_fence = &pf_fence->base;
+
+	INIT_LIST_HEAD(&pf->list);
+
+	xe_gt_eu_attentions_read(gt, &pf->attentions.before, 0);
+
+	if (td_ctl & TD_CTL_FORCE_EXCEPTION)
+		eu_warn(d, "force exception already set!");
+
+	/* Halt regardless of thread dependencies */
+	while (!(td_ctl & TD_CTL_FORCE_EXCEPTION)) {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+		udelay(200);
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	}
+
+	xe_gt_eu_attentions_read(gt, &pf->attentions.after,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	mutex_unlock(&d->hw.lock);
+
+	/*
+	 * xe_exec_queue_put() will be called from xe_eudebug_pagefault_destroy()
+	 * or handle_pagefault()
+	 */
+	pf->q = q;
+	pf->lrc_idx = lrc_idx;
+	pf->fault.addr = page_addr;
+	pf->fault.type = fault_type;
+	pf->fault.level = fault_level;
+	pf->fault.access = access_type;
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_eudebug_put(d);
+
+	return pf;
+
+err_unlock_hw_lock:
+	mutex_unlock(&d->hw.lock);
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
+	kfree(pf);
+err_put_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+err_put_exec_queue:
+	xe_exec_queue_put(q);
+err_put_eudebug:
+	xe_eudebug_put(d);
+
+	return NULL;
+}
+
+void
+xe_eudebug_pagefault_process(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	xe_gt_eu_attentions_read(gt, &pf->attentions.resolved,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	if (!xe_eu_attentions_xor_count(&pf->attentions.after,
+					&pf->attentions.resolved))
+		pf->deferred_resolved = true;
+}
+
+void
+xe_eudebug_pagefault_destroy(struct xe_gt *gt, struct xe_vm *vm,
+			     struct xe_eudebug_pagefault *pf, bool send_event)
+{
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	u32 td_ctl;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), pf->q->hwe->domain);
+	if (!fw_ref) {
+		struct xe_device *xe = gt_to_xe(gt);
+
+		drm_warn(&xe->drm, "Forcewake fail: Can not recover TD_CTL");
+	} else {
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+		xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
+					  ~(TD_CTL_FORCE_EXCEPTION));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+
+	if (send_event)
+		handle_pagefault(gt, pf);
+
+	d = xe_eudebug_get_nolock(vm->xef);
+	if (d) {
+		struct dma_fence *fence;
+
+		mutex_lock(&d->hw.lock);
+		fence = dma_fence_get(d->pf_fence);
+
+		if (fence) {
+			if (send_event)
+				dma_fence_signal(fence);
+
+			dma_fence_put(fence); /* deref for dma_fence_get() */
+			dma_fence_put(fence); /* defef for dma_fence_init() */
+		}
+
+		d->pf_fence = NULL;
+		mutex_unlock(&d->hw.lock);
+
+		xe_eudebug_put(d);
+	}
+
+	if (!send_event) {
+		xe_exec_queue_put(pf->q);
+		kfree(pf);
+	}
+
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
+}
+
+static int send_queued_pagefault(struct xe_eudebug *d, bool from_attention_scan)
+{
+	struct xe_eudebug_pagefault *pf, *pf_temp;
+	int ret = 0;
+
+	mutex_lock(&d->pf_lock);
+	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, list) {
+		struct xe_gt *gt = pf->q->gt;
+
+		ret = send_pagefault(gt, pf, from_attention_scan);
+
+		/* if resolved attentions are not updated */
+		if (ret == -EBUSY)
+			break;
+
+		/* decrease the reference count of xe_exec_queue obtained from pagefault handler */
+		xe_exec_queue_put(pf->q);
+		list_del(&pf->list);
+		kfree(pf);
+
+		if (ret)
+			break;
+	}
+	mutex_unlock(&d->pf_lock);
+
+	return ret;
+}
+
+int xe_eudebug_handle_pagefaults(struct xe_gt *gt)
+{
+	struct xe_exec_queue *q;
+	struct xe_eudebug *d;
+	int ret, lrc_idx;
+
+	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	if (!xe_exec_queue_is_debuggable(q)) {
+		ret = -EPERM;
+		goto out_exec_queue_put;
+	}
+
+	d = xe_eudebug_get_nolock(q->vm->xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto out_exec_queue_put;
+	}
+
+	ret = send_queued_pagefault(d, true);
+
+	xe_eudebug_put(d);
+
+out_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *pf, *pf_temp;
+
+	/* Since it's the last reference no race here */
+	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, list) {
+		xe_exec_queue_put(pf->q);
+		kfree(pf);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
new file mode 100644
index 000000000000..0b22e91f4f85
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_EUDEBUG_PAGEFAULT_H_
+#define _XE_EUDEBUG_PAGEFAULT_H_
+
+struct xe_eudebug;
+struct xe_gt;
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d);
+int xe_eudebug_handle_pagefaults(struct xe_gt *gt);
+
+#endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 85fc321f8b0e..c4debbb92838 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -15,6 +15,8 @@
 #include <linux/wait.h>
 #include <linux/xarray.h>
 
+#include "xe_gt_debug.h"
+
 struct xe_device;
 struct task_struct;
 struct xe_eudebug;
@@ -37,7 +39,7 @@ enum xe_eudebug_state {
 };
 
 #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_PAGEFAULT
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -169,6 +171,62 @@ struct xe_eudebug {
 
 	/** @ops operations for eu_control */
 	struct xe_eudebug_eu_control_ops *ops;
+
+	/** @pf_lock: guards access to pagefaults list*/
+	struct mutex pf_lock;
+	/** @pagefaults: xe_eudebug_pagefault list for pagefault event queuing */
+	struct list_head pagefaults;
+	/**
+	 * @pf_fence: fence on operations of eus (eu thread control and attention)
+	 * when page faults are being handled, protected by @eu_lock.
+	 */
+	struct dma_fence *pf_fence;
+};
+
+/**
+ * struct xe_eudebug_pagefault - eudebug structure for queuing pagefault
+ */
+struct xe_eudebug_pagefault {
+	/** @list: link into the xe_eudebug.pagefaults */
+	struct list_head list;
+	/** @q: exec_queue which raised pagefault */
+	struct xe_exec_queue *q;
+	/** @lrc_idx: lrc index of the workload which raised pagefault */
+	int lrc_idx;
+
+	/* pagefault raw partial data passed from guc*/
+	struct {
+		/** @addr: ppgtt address where the pagefault occurred */
+		u64 addr;
+		int type;
+		int level;
+		int access;
+	} fault;
+
+	struct {
+		/** @before: state of attention bits before page fault WA processing*/
+		struct xe_eu_attentions before;
+		/**
+		 * @after: status of attention bits during page fault WA processing.
+		 * It includes eu threads where attention bits are turned on for
+		 * reasons other than page fault WA (breakpoint, interrupt, etc.).
+		 */
+		struct xe_eu_attentions after;
+		/**
+		 * @resolved: state of the attention bits after page fault WA.
+		 * It includes the eu thread that caused the page fault.
+		 * To determine the eu thread that caused the page fault,
+		 * do XOR attentions.after and attentions.resolved.
+		 */
+		struct xe_eu_attentions resolved;
+	} attentions;
+
+	/**
+	 * @deferred_resolved: to update attentions.resolved again when attention
+	 * bits are ready if the eu thread fails to turn on attention bits within
+	 * a certain time after page fault WA processing.
+	 */
+	bool deferred_resolved;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 1c797a8b4d32..a6ee51aa0ede 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -56,6 +56,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -210,6 +211,17 @@ struct drm_xe_eudebug_event_eu_attention {
 	__u8 bitmask[];
 };
 
+struct drm_xe_eudebug_event_pagefault {
+	struct drm_xe_eudebug_event base;
+
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u64 pagefault_address;
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

