Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F4CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7F10F2E3;
	Thu, 30 Apr 2026 10:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfCutFBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0D10F2E3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546437; x=1809082437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=naAinFnKbb+QALSGBabd7slsGNA/wc3bExD5H6IsTcM=;
 b=dfCutFBXgnp73Pkp3DRFoC1cBRPd3MzqMcWScxgvxiJerKYUf/fh1wzj
 T4Rp8jJra+iQJijxs4/uiKQfPsH5eUXww7e31f94P32TtExEBSAtQZHsY
 PAQzj7y32B3Aoqt3qS6lOftijid4ievWvu588hZcSbjqY3KM4/k0C02c6
 e8XI96j+DUJMeaBwFQGjonpk59brqLQEc55qYd4oW7GKlL+kVPiVvIsq6
 cLK6UAkwSEOj7Fyqj9KwU/20R0fCa+VYD92e7iNDIlFK2+Onv+XULl+XV
 yzCnge4EcgAQGIBwrx/IwZG0quMF3FIaCa1YkkCYC8JMVC6zKan4nD0Ha w==;
X-CSE-ConnectionGUID: tf7msEyiSwC3l8hVjBao0A==
X-CSE-MsgGUID: 8ffBFFPMRRW7YgQRXq3kQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586073"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:56 -0700
X-CSE-ConnectionGUID: VcgeEo1nQWu6aAMOrwS7VQ==
X-CSE-MsgGUID: U+c6f7rCRUSIkBVnqn6luQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518926"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:51 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 22/24] drm/xe/eudebug: Introduce EU pagefault handling
 interface
Date: Thu, 30 Apr 2026 13:51:18 +0300
Message-ID: <20260430105121.712843-23-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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
v5: struct member documentation (Mika)
v6: fault to fault_type (Mika)
v7: pagefault rework (Maciej)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jan Maślak <jan.maslak@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   2 +-
 drivers/gpu/drm/xe/xe_eudebug.c           | 104 +++++-
 drivers/gpu/drm/xe/xe_eudebug.h           |   8 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c        |  15 +-
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c | 412 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h |  63 ++++
 drivers/gpu/drm/xe/xe_eudebug_types.h     |  61 +++-
 drivers/gpu/drm/xe/xe_guc_pagefault.c     |   3 +-
 drivers/gpu/drm/xe/xe_pagefault_types.h   |   1 +
 include/uapi/drm/xe_drm_eudebug.h         |  12 +
 10 files changed, 658 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e43d89a45d39..53302104d05c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -158,7 +158,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_eudebug_pagefault.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 3f22924a1275..06cbb3de57f4 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -17,11 +17,15 @@
 #include "xe_eudebug.h"
 #include "xe_eudebug_hw.h"
 #include "xe_eudebug_types.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_eudebug_vm.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
 #include "xe_hw_engine.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
@@ -261,9 +265,12 @@ static void xe_eudebug_free(struct kref *ref)
 	while (kfifo_get(&d->events.fifo, &event))
 		kfree(event);
 
+	xe_eudebug_pagefault_fini(d);
 	xe_eudebug_resources_destroy(d);
+	mutex_destroy(&d->pf_lock);
 	mutex_destroy(&d->hw.lock);
 	mutex_destroy(&d->target.lock);
+
 	XE_WARN_ON(d->target.xef);
 
 	xe_eudebug_assert(d, !kfifo_len(&d->events.fifo));
@@ -440,7 +447,7 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 	eu_dbg(d, "session %lld detached with %d", d->session, err);
 
 	release_acks(d);
-
+	xe_eudebug_pagefault_signal(target);
 	remove_debugger(target);
 	xe_file_put(target);
 
@@ -1939,10 +1946,6 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
 {
 	int ret;
 
-	ret = xe_gt_eu_threads_needing_attention(gt);
-	if (ret <= 0)
-		return ret;
-
 	ret = xe_send_gt_attention(gt);
 
 	/* Discovery in progress, fake it */
@@ -1952,6 +1955,65 @@ static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
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
+	h_queue = find_handle(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, pf->q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d, XE_EUDEBUG_RES_TYPE_LRC, pf->q->lrc[pf->lrc_idx]);
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
@@ -1975,15 +2037,15 @@ static void attention_poll_work(struct work_struct *work)
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
@@ -1992,12 +2054,12 @@ static void attention_poll_work(struct work_struct *work)
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
@@ -2042,6 +2104,8 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_init(&d->ref);
 	mutex_init(&d->target.lock);
 	mutex_init(&d->hw.lock);
+	mutex_init(&d->pf_lock);
+	INIT_LIST_HEAD(&d->pagefaults);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
 	init_completion(&d->discovery);
@@ -2079,7 +2143,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref); /* for discovery */
 	queue_work(xe->eudebug.wq, &d->discovery_work);
-	attention_poll_start(xe);
+	xe_eudebug_attention_poll_start(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -2092,6 +2156,7 @@ xe_eudebug_connect(struct xe_device *xe,
 err_free_res:
 	xe_eudebug_resources_destroy(d);
 err_free:
+	mutex_destroy(&d->pf_lock);
 	mutex_destroy(&d->hw.lock);
 	mutex_destroy(&d->target.lock);
 	kfree(d);
@@ -2101,6 +2166,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 void xe_eudebug_file_close(struct xe_file *xef)
 {
+	xe_eudebug_pagefault_signal(xef);
 	remove_debugger(xef);
 }
 
@@ -2162,9 +2228,9 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable)
 	mutex_unlock(&xe->eudebug.lock);
 
 	if (enable) {
-		attention_poll_start(xe);
+		xe_eudebug_attention_poll_start(xe);
 	} else {
-		attention_poll_stop(xe);
+		xe_eudebug_attention_poll_stop(xe);
 
 		if (IS_SRIOV_PF(xe))
 			xe_sriov_pf_end_lockdown(xe);
@@ -2217,7 +2283,7 @@ static void xe_eudebug_fini(struct drm_device *dev, void *__unused)
 
 	xe_assert(xe, list_empty(&xe->eudebug.targets));
 
-	attention_poll_stop(xe);
+	xe_eudebug_attention_poll_stop(xe);
 }
 
 void xe_eudebug_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index b1f8a5fcc890..826b63c4ba09 100644
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
 
@@ -76,6 +78,12 @@ struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
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
index e6510e7b51a9..d67530ace186 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -340,6 +340,7 @@ static int do_eu_control(struct xe_eudebug *d,
 	void __user * const bitmask_ptr = u64_to_user_ptr(arg->bitmask_ptr);
 	struct xe_device *xe = d->xe;
 	struct xe_exec_queue *q, *active;
+	struct dma_fence *pf_fence;
 	struct xe_lrc *lrc;
 	unsigned int hw_attn_size, attn_size;
 	u8 *bits = NULL;
@@ -411,8 +412,20 @@ static int do_eu_control(struct xe_eudebug *d,
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
index 000000000000..15389fcd042f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -0,0 +1,412 @@
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
+epf_to_gt(struct xe_eudebug_pagefault *epf)
+{
+	return epf->q->gt;
+}
+
+static void destroy_pagefault(struct xe_eudebug_pagefault *epf)
+{
+	xe_exec_queue_put(epf->q);
+	kfree(epf);
+}
+
+static void queue_pagefault(struct xe_eudebug *d,
+			    struct xe_eudebug_pagefault *epf)
+{
+	mutex_lock(&d->pf_lock);
+	list_add_tail(&epf->link, &d->pagefaults);
+	mutex_unlock(&d->pf_lock);
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
+	fence = kzalloc_obj(*fence, GFP_KERNEL);
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
+static void xe_eudebug_pagefault_set_private(struct xe_pagefault *pf,
+					     struct xe_eudebug_pagefault *epf)
+{
+	u64 private = (u64)pf->producer.private;
+
+	XE_WARN_ON(private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG);
+
+	epf->private = pf->producer.private;
+	private = (u64)epf | XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG;
+	pf->producer.private = (void *)private;
+}
+
+void *xe_eudebug_pagefault_get_private(void *private)
+{
+	if ((u64)private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG) {
+		struct xe_eudebug_pagefault *epf = (void *)((u64)private &
+							    ~XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG);
+		return epf->private;
+	}
+	return private;
+}
+
+int
+xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct pagefault_fence *pf_fence;
+	struct xe_eudebug_pagefault *epf;
+	struct xe_gt *gt = pf->gt;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	int lrc_idx;
+	u32 td_ctl;
+
+	d = xe_eudebug_get_nolock_with_discovery(vm->xef);
+	if (!d)
+		return -ENOENT;
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
+	epf = kzalloc_obj(*epf, GFP_KERNEL);
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
+		 * Unless there are parallel PF routines this should
+		 * not happen.
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
+	 * xe_exec_queue_put() will be called from destroy_pagefault()
+	 * or handle_pagefault()
+	 */
+	epf->q = q;
+	epf->lrc_idx = lrc_idx;
+	epf->fault.addr = pf->consumer.page_addr;
+	epf->fault.type_level = pf->consumer.fault_type_level;
+	epf->fault.access_type = pf->consumer.access_type;
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_eudebug_put(d);
+
+	xe_eudebug_pagefault_set_private(pf, epf);
+
+	return 0;
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
+
+	return -EINVAL;
+}
+
+static struct xe_eudebug_pagefault *xe_debubug_get_epf(struct xe_pagefault *pf)
+{
+	u64 private = (u64)pf->producer.private;
+
+	if (private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG)
+		return (void *)(private & ~XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG);
+
+	return NULL;
+}
+
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct xe_vma *vma = NULL;
+	struct xe_eudebug_pagefault *epf = xe_debubug_get_epf(pf);
+
+	if (!epf)
+		return NULL;
+
+	vma = xe_vm_create_null_vma(vm, pf->consumer.page_addr);
+	if (IS_ERR(vma))
+		return vma;
+
+	return vma;
+}
+
+static void
+xe_eudebug_pagefault_process(struct xe_eudebug_pagefault *epf)
+{
+	struct xe_gt *gt = epf_to_gt(epf);
+
+	xe_gt_eu_attentions_read(gt, &epf->attentions.resolved,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+}
+
+static int send_queued_pagefaults_locked(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *epf, *epf_temp;
+	int ret = 0;
+
+	list_for_each_entry_safe(epf, epf_temp, &d->pagefaults, link) {
+		ret = xe_eudebug_send_pagefault_event(d, epf);
+
+		list_del(&epf->link);
+
+		destroy_pagefault(epf);
+
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
+static int send_queued_pagefaults(struct xe_eudebug *d)
+{
+	int ret = 0;
+
+	mutex_lock(&d->pf_lock);
+	ret = send_queued_pagefaults_locked(d);
+	mutex_unlock(&d->pf_lock);
+
+	return ret;
+}
+
+static void
+_xe_eudebug_pagefault_destroy(struct xe_eudebug_pagefault *epf, int err)
+{
+	struct xe_gt *gt = epf_to_gt(epf);
+	struct xe_vm *vm = epf->q->vm;
+	struct xe_eudebug *d;
+	struct dma_fence *f;
+	unsigned int fw_ref;
+	bool queued = false;
+	u32 td_ctl, ret = 0;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), epf->q->hwe->domain);
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
+	d = xe_eudebug_get_nolock_with_discovery(vm->xef);
+	if (!d)
+		goto epf_free;
+
+	if (!err) {
+		if (completion_done(&d->discovery)) {
+			/* Just in case there was a discovery */
+			ret = send_queued_pagefaults_locked(d);
+			if (!ret)
+				ret = xe_eudebug_send_pagefault_event(d, epf);
+		} else {
+			queue_pagefault(d, epf);
+			queued = true;
+		}
+	}
+
+	mutex_lock(&d->hw.lock);
+	f = d->pf_fence;
+	d->pf_fence = NULL;
+	mutex_unlock(&d->hw.lock);
+
+	if (f) {
+		dma_fence_signal(f);
+		dma_fence_put(f);
+	}
+
+	xe_eudebug_put(d);
+
+ epf_free:
+	if (!queued || ret)
+		destroy_pagefault(epf);
+
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
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
+void xe_eudebug_pagefault_service(struct xe_pagefault *pf, int err)
+{
+	struct xe_eudebug_pagefault *epf = xe_debubug_get_epf(pf);
+
+	if (!epf)
+		return;
+
+	if (!err)
+		xe_eudebug_pagefault_process(epf);
+
+	_xe_eudebug_pagefault_destroy(epf, err);
+}
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *epf, *epf_temp;
+
+	/* Since it's the last reference no race here */
+
+	list_for_each_entry_safe(epf, epf_temp, &d->pagefaults, link) {
+		list_del(&epf->link);
+		destroy_pagefault(epf);
+	}
+
+	XE_WARN_ON(d->pf_fence);
+}
+
+void xe_eudebug_pagefault_signal(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+	struct dma_fence *f;
+
+	mutex_lock(&xef->eudebug.lock);
+	d = xef->eudebug.debugger;
+	mutex_unlock(&xef->eudebug.lock);
+
+	if (!d)
+		return;
+
+	mutex_lock(&d->hw.lock);
+	f = d->pf_fence;
+	d->pf_fence = NULL;
+	mutex_unlock(&d->hw.lock);
+
+	if (f) {
+		dma_fence_signal(f);
+		dma_fence_put(f);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
new file mode 100644
index 000000000000..c7434e1c3bd3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -0,0 +1,63 @@
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
+struct xe_file;
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d);
+int xe_eudebug_handle_pagefaults(struct xe_gt *gt);
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+int xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf);
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf);
+void xe_eudebug_pagefault_service(struct xe_pagefault *pf, int err);
+/*
+ * The (struct xe_pagefault *)->producer.private is a pointer which, for now,
+ * stores the pointer guc.
+ * EU Debug intercepts this pointer to store struct xe_eudebug_pagefault.
+ * Original pointer can be obtained via eudebug function below called with
+ * mentioned producer's private field.
+ */
+#define XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG	0x1
+void *xe_eudebug_pagefault_get_private(void *private);
+
+void xe_eudebug_pagefault_signal(struct xe_file *xef);
+#else
+
+static inline int
+xe_eudebug_pagefault_create(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	return NULL;
+}
+
+static inline void xe_eudebug_pagefault_service(struct xe_pagefault *pf, int err)
+{
+}
+
+static inline void *xe_eudebug_pagefault_get_private(void *private)
+{
+	return private;
+}
+
+static inline void xe_eudebug_pagefault_signal(struct xe_file *xef)
+{
+}
+#endif
+
+#endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 386b5c78ecff..46dac32fabf6 100644
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
@@ -164,6 +166,63 @@ struct xe_eudebug {
 
 	/** @ops: operations for eu_control */
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
+	/** @link: link into the xe_eudebug.pagefaults */
+	struct list_head link;
+	/** @q: exec_queue which raised pagefault */
+	struct xe_exec_queue *q;
+	/** @lrc_idx: lrc index of the workload which raised pagefault */
+	int lrc_idx;
+
+	/** @fault: pagefault raw partial data passed from guc */
+	struct {
+		/** @addr: ppgtt address where the pagefault occurred */
+		u64 addr;
+		u8 type_level;
+		u8 access_type;
+	} fault;
+
+	/** @attentions: attention states in different phases of fault */
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
+	 * @private: copied the (struct xe_pagefault *)->producer.private filed.
+	 * EU Debugger masks private field in the struct xe_pagefault.
+	 * The xe_eudebug_pagefault_get_private() function to extracts original
+	 * private field regardless if it was shadowed or not.
+	 */
+	void *private;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 607e32392f46..038688ab63b4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -4,6 +4,7 @@
  */
 
 #include "abi/guc_actions_abi.h"
+#include "xe_eudebug_pagefault.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
@@ -35,7 +36,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
 		FIELD_PREP(PFR_PDATA, pdata),
 	};
-	struct xe_guc *guc = pf->producer.private;
+	struct xe_guc *guc = xe_eudebug_pagefault_get_private(pf->producer.private);
 
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index c4ee625b93dd..ab38e135f23d 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -10,6 +10,7 @@
 
 struct xe_gt;
 struct xe_pagefault;
+struct xe_eudebug_pagefault;
 
 /** enum xe_pagefault_access_type - Xe page fault access type */
 enum xe_pagefault_access_type {
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 54394a7e12ab..f7d035532be2 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -53,6 +53,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -358,6 +359,17 @@ struct drm_xe_eudebug_event_eu_attention {
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

