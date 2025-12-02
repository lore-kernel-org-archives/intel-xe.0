Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12982D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD60010E64C;
	Tue,  2 Dec 2025 13:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTlfSANT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0A10E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683652; x=1796219652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NlmgcdXDUZm99U65+7Y5XDeGHJnB/hKcuGZsIDt8c3w=;
 b=OTlfSANTlP17TTMFdtazMaAQskwSqS5RDaQFEcO6t6cqg8IcwqdY/1pW
 OXaXqdCATG73b+2iLZtaVp2PL8u9h8wyLO9PUpINjTRmi79wz0RaixuBo
 nSkCCVWLOUl2TNVNG12ASlWePhTTAXNWCtIgt4Bfjbjn9u24IRmZGW7GN
 o0cVqUl7SC4JlKz8PpekNHfej+ilszfYy8IAsVTPV9vPrCsh9FgXIeO/r
 AWC355IBtoUGDrHYGlLcY9GYcY79WR77hhAQr1LGfRueW333O9rLwThRu
 mTKmYWlIN/pzLxVSpVM9im4dkemTrbYlTu9wrdqC+R3CcEMeDdANkX9Pk A==;
X-CSE-ConnectionGUID: QyQ4p6XmREiXo/aFnwFT2Q==
X-CSE-MsgGUID: OJVu9RfcRbWCN3L7HUI9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537143"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:12 -0800
X-CSE-ConnectionGUID: JJjdHBezSjiBC/w2gbJEXg==
X-CSE-MsgGUID: 2zlFpc9bRO2MfwsL8ZMDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505816"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:08 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 19/20] drm/xe/eudebug: Introduce EU pagefault handling
 interface
Date: Tue,  2 Dec 2025 15:52:38 +0200
Message-ID: <20251202135241.880267-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
v4: streamline uapi, cleanups (Mika)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jan Maślak <jan.maslak@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   2 +-
 drivers/gpu/drm/xe/xe_eudebug.c           | 101 ++++-
 drivers/gpu/drm/xe/xe_eudebug.h           |   9 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c        |  15 +-
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c | 441 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h |  47 +++
 drivers/gpu/drm/xe/xe_eudebug_types.h     |  69 +++-
 drivers/gpu/drm/xe/xe_pagefault_types.h   |   4 +
 include/uapi/drm/xe_drm_eudebug.h         |  12 +
 9 files changed, 678 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e19736227dfa..64d3d324b7aa 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -148,7 +148,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_eudebug_pagefault.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 44381084ee96..5e585e0006af 100644
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
 #include "xe_sriov_pf.h"
@@ -185,6 +189,8 @@ static void xe_eudebug_free(struct kref *ref)
 	while (kfifo_get(&d->events.fifo, &event))
 		kfree(event);
 
+	xe_eudebug_pagefault_fini(d);
+
 	xe_eudebug_destroy_resources(d);
 	XE_WARN_ON(d->target.xef);
 
@@ -383,7 +389,7 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
 	} \
 })
 
-static struct xe_eudebug *
+struct xe_eudebug *
 xe_eudebug_get_nolock(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
@@ -1793,10 +1799,6 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
 {
 	int ret;
 
-	ret = xe_gt_eu_threads_needing_attention(gt);
-	if (ret <= 0)
-		return ret;
-
 	ret = xe_send_gt_attention(gt);
 
 	/* Discovery in progress, fake it */
@@ -1806,6 +1808,65 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
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
@@ -1828,15 +1889,15 @@ static void attention_poll_work(struct work_struct *work)
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
+
+			ret = xe_eudebug_handle_pagefaults(gt);
+			if (!ret)
+				ret = xe_eudebug_handle_gt_attention(gt);
 
-				xe_gt_reset_async(gt);
-			}
+			if (ret)
+				handle_attention_fail(gt, gt_id, ret);
 		}
 
 		xe_pm_runtime_put(xe);
@@ -1845,12 +1906,12 @@ static void attention_poll_work(struct work_struct *work)
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
@@ -1893,6 +1954,8 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_init(&d->ref);
 	spin_lock_init(&d->target.lock);
+	mutex_init(&d->pf_lock);
+	INIT_LIST_HEAD(&d->pagefaults);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
 	init_completion(&d->discovery);
@@ -1926,7 +1989,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.wq, &d->discovery_work);
-	attention_poll_start(xe);
+	xe_eudebug_attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -2005,9 +2068,9 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	mutex_unlock(&xe->eudebug.lock);
 
 	if (enable) {
-		attention_poll_start(xe);
+		xe_eudebug_attention_poll_start(xe);
 	} else {
-		attention_poll_stop(xe);
+		xe_eudebug_attention_poll_stop(xe);
 
 		if (IS_SRIOV_PF(xe))
 			xe_sriov_pf_end_lockdown(xe);
@@ -2060,7 +2123,7 @@ static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
 
 	xe_assert(xe, list_empty(&xe->eudebug.targets));
 
-	attention_poll_stop(xe);
+	xe_eudebug_attention_poll_stop(xe);
 }
 
 void xe_eudebug_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index bd9fd7bf454f..34938e87be13 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,12 +13,14 @@ struct drm_file;
 struct xe_debug_data;
 struct xe_device;
 struct xe_file;
+struct xe_gt;
 struct xe_vm;
 struct xe_vma;
 struct xe_vma_ops;
 struct xe_exec_queue;
 struct xe_user_fence;
 struct xe_eudebug;
+struct xe_eudebug_pagefault;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -72,8 +74,15 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
 
+struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
+int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
+				    struct xe_eudebug_pagefault *pf);
+
+void xe_eudebug_attention_poll_stop(struct xe_device *xe);
+void xe_eudebug_attention_poll_start(struct xe_device *xe);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index 236740ef10ba..e8e47987c9f9 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -322,6 +322,7 @@ static int do_eu_control(struct xe_eudebug *d,
 	struct xe_device *xe = d->xe;
 	u8 *bits = NULL;
 	unsigned int hw_attn_size, attn_size;
+	struct dma_fence *pf_fence;
 	struct xe_exec_queue *q;
 	struct xe_lrc *lrc;
 	u64 seqno;
@@ -373,8 +374,20 @@ static int do_eu_control(struct xe_eudebug *d,
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
index 000000000000..f139435cad33
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -0,0 +1,441 @@
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
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_vm.h"
+
+static struct xe_gt *
+pf_to_gt(struct xe_eudebug_pagefault *pf)
+{
+	return pf->q->gt;
+}
+
+static void destroy_pagefault(struct xe_eudebug_pagefault *pf)
+{
+	xe_exec_queue_put(pf->q);
+	kfree(pf);
+}
+
+static int queue_pagefault(struct xe_eudebug_pagefault *pf)
+{
+	struct xe_eudebug *d;
+
+	d = xe_eudebug_get_nolock(pf->q->vm->xef);
+	if (!d)
+		return -EINVAL;
+
+	mutex_lock(&d->pf_lock);
+	list_add_tail(&pf->link, &d->pagefaults);
+	mutex_unlock(&d->pf_lock);
+
+	xe_eudebug_put(d);
+
+	return 0;
+}
+
+static int send_pagefault(struct xe_eudebug_pagefault *pf,
+			  bool from_attention_scan)
+{
+	struct xe_gt *gt = pf_to_gt(pf);
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
+void
+xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct pagefault_fence *pf_fence;
+	struct xe_eudebug_pagefault *epf;
+	struct xe_vma *vma;
+	struct xe_gt *gt = pf->gt;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	int lrc_idx;
+	u32 td_ctl;
+
+	pf->consumer.epf = NULL;
+
+	down_read(&vm->lock);
+	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
+	up_read(&vm->lock);
+
+	if (vma)
+		return;
+
+	d = xe_eudebug_get_nolock(vm->xef);
+	if (!d)
+		return;
+
+	q = xe_gt_runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(q))
+		goto err_put_eudebug;
+
+	if (XE_WARN_ON(q->vm != vm))
+		goto err_put_exec_queue;
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
+	epf = kzalloc(sizeof(*epf), GFP_KERNEL);
+	if (!epf)
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
+	INIT_LIST_HEAD(&epf->link);
+
+	xe_gt_eu_attentions_read(gt, &epf->attentions.before, 0);
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
+	xe_gt_eu_attentions_read(gt, &epf->attentions.after,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	mutex_unlock(&d->hw.lock);
+
+	/*
+	 * xe_exec_queue_put() will be called from xe_eudebug_pagefault_destroy()
+	 * or handle_pagefault()
+	 */
+	epf->q = q;
+	epf->lrc_idx = lrc_idx;
+	epf->fault.addr = pf->consumer.page_addr;
+	epf->fault.type = pf->consumer.fault_type;
+	epf->fault.level = pf->consumer.fault_level;
+	epf->fault.access = pf->consumer.access_type;
+
+	pf->consumer.epf = epf;
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_eudebug_put(d);
+
+	return;
+
+err_unlock_hw_lock:
+	mutex_unlock(&d->hw.lock);
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
+	kfree(epf);
+err_put_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+err_put_exec_queue:
+	xe_exec_queue_put(q);
+err_put_eudebug:
+	xe_eudebug_put(d);
+}
+
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct xe_vma *vma = NULL;
+
+	if (!pf->consumer.epf)
+		return NULL;
+
+	vma = xe_vm_create_null_vma(vm, pf->consumer.page_addr);
+	if (IS_ERR(vma))
+		return vma;
+
+	pf->consumer.epf->is_null = true;
+
+	return vma;
+}
+
+static void
+xe_eudebug_pagefault_process(struct xe_eudebug_pagefault *pf)
+{
+	struct xe_gt *gt = pf->q->gt;
+
+	xe_gt_eu_attentions_read(gt, &pf->attentions.resolved,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	if (!xe_eu_attentions_xor_count(&pf->attentions.after,
+					&pf->attentions.resolved))
+		pf->deferred_resolved = true;
+}
+
+static void
+_xe_eudebug_pagefault_destroy(struct xe_eudebug_pagefault *pf)
+{
+	struct xe_gt *gt = pf->q->gt;
+	struct xe_vm *vm = pf->q->vm;
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	u32 td_ctl;
+	bool queued, try_send;
+	int ret;
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
+	queued = false;
+	try_send = pf->is_null;
+	if (try_send) {
+		ret = send_pagefault(pf, false);
+
+		/*
+		 * if debugger discovery is not completed or resolved attentions are not
+		 * updated, then queue pagefault
+		 */
+		if (ret == -EBUSY) {
+			ret = queue_pagefault(pf);
+			if (!ret)
+				queued = true;
+		}
+	}
+
+	d = xe_eudebug_get_nolock(vm->xef);
+	if (d) {
+		struct dma_fence *f;
+
+		mutex_lock(&d->hw.lock);
+		f = d->pf_fence;
+		d->pf_fence = NULL;
+		mutex_unlock(&d->hw.lock);
+
+		if (f) {
+			if (!queued)
+				dma_fence_signal(f);
+
+			dma_fence_put(f);
+		}
+
+		xe_eudebug_put(d);
+	}
+
+	if (!queued)
+		destroy_pagefault(pf);
+
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
+}
+
+static int send_queued_pagefaults(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *pf, *pf_temp;
+	int ret = 0;
+
+	mutex_lock(&d->pf_lock);
+	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, link) {
+		ret = send_pagefault(pf, true);
+
+		/* if resolved attentions are not updated */
+		if (ret == -EBUSY)
+			break;
+
+		list_del(&pf->link);
+
+		destroy_pagefault(pf);
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
+	ret = send_queued_pagefaults(d);
+
+	xe_eudebug_put(d);
+
+out_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+void xe_eudebug_pagefault_service(struct xe_pagefault *pf)
+{
+	struct xe_eudebug_pagefault *f = pf->consumer.epf;
+
+	if (!f)
+		return;
+
+	if (f->is_null)
+		xe_eudebug_pagefault_process(f);
+}
+
+void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err)
+{
+	struct xe_eudebug_pagefault *f = pf->consumer.epf;
+
+	if (!f)
+		return;
+
+	if (err)
+		f->is_null = false;
+
+	_xe_eudebug_pagefault_destroy(f);
+}
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *pf, *pf_temp;
+
+	/* Since it's the last reference no race here */
+
+	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, link) {
+		list_del(&pf->link);
+		destroy_pagefault(pf);
+	}
+
+	XE_WARN_ON(d->pf_fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
new file mode 100644
index 000000000000..1ba20beac3cf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_EUDEBUG_PAGEFAULT_H_
+#define _XE_EUDEBUG_PAGEFAULT_H_
+
+#include <linux/types.h>
+
+struct xe_eudebug;
+struct xe_gt;
+struct xe_pagefault;
+struct xe_eudebug_pagefault;
+struct xe_vm;
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d);
+int xe_eudebug_handle_pagefaults(struct xe_gt *gt);
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+void xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf);
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf);
+void xe_eudebug_pagefault_service(struct xe_pagefault *pf);
+void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err);
+#else
+
+static inline void
+xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+}
+
+static inline struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	return NULL;
+}
+
+static inline void xe_eudebug_pagefault_service(struct xe_pagefault *pf)
+{
+}
+
+static inline void xe_eudebug_pagefault_destroy(struct xe_pagefault *pf, int err)
+{
+}
+
+#endif
+
+#endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 85fc321f8b0e..39cb70058994 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -15,6 +15,8 @@
 #include <linux/wait.h>
 #include <linux/xarray.h>
 
+#include "xe_gt_debug_types.h"
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
@@ -169,6 +171,71 @@ struct xe_eudebug {
 
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
+	struct list_head link;
+	/** @q: exec_queue which raised pagefault */
+	struct xe_exec_queue *q;
+	/** @lrc_idx: lrc index of the workload which raised pagefault */
+	int lrc_idx;
+
+	/* pagefault raw partial data passed from guc */
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
+
+	/**
+	 * @is_null: marks if this vma is null or not. The lookup for the
+	 * vma is done in two phases and eudebug pagefault struct needs
+	 * to be allocated apriori to resolving if we need null vma or not.
+	 * So we keep the state here so that processing and teardown
+	 * know which type of fault resulted in creation of this eudebug pf.
+	 */
+	bool is_null;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..c89d7fb698e0 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -10,6 +10,7 @@
 
 struct xe_gt;
 struct xe_pagefault;
+struct xe_eudebug_pagefault;
 
 /** enum xe_pagefault_access_type - Xe page fault access type */
 enum xe_pagefault_access_type {
@@ -84,6 +85,9 @@ struct xe_pagefault {
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+		struct xe_eudebug_pagefault *epf;
+#endif
 		/** consumer.reserved: reserved bits for future expansion */
 		u8 reserved[7];
 	} consumer;
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 9f558e56b577..a90077eac23d 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -56,6 +56,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -208,6 +209,17 @@ struct drm_xe_eudebug_event_eu_attention {
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

