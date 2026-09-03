Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBBEC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAFC10F690;
	Thu,  3 Sep 2026 15:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGniasjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F380E10F687
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447727; x=1819983727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nyy0TMvpEVeDXirjbRdGV1/USV9Y5KQu6eE6jansvfc=;
 b=GGniasjUWL9ARw4SHF1vmvGjJw+BmMAbXKMRp7GCNKaQRHOCoLz2Nye0
 qchlq1p4UR/7ZvtlgsN+MKGmvFFn9lShh0snzyoG2urM0AQEE+SlJZmzL
 4ZQloXZNr11vEfo69pxpGOq4qOvoayaPcZ59XVbTAdybO2bopnE8de4QO
 Ncf7uNpbd+da1CrKdHj5jCu7tXq2SBXmLYxot8LNpn9pfFXvCd1+WvJN2
 hCCnpgGajpbC9ulxVWPcf7aTv6oRHjHJikBwZIFefIkr5TGQy+cGOyiFZ
 4k1ef8F0vGDc5wL9zTPcIxaVudlNCg6B5bnvrAWoSJK9q2fAjeeQq4D1I g==;
X-CSE-ConnectionGUID: yDnVjl+fTEewto5r1CmxCQ==
X-CSE-MsgGUID: h9GZ6D1uR2ub4OCQcTsv3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91443557"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91443557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:02:06 -0700
X-CSE-ConnectionGUID: 3OdFUegHTSCZ2QJrx+Vc5w==
X-CSE-MsgGUID: MnKSsKVqQZCy0bvIkDgS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441626"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:02:01 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 26/27] drm/xe/eudebug: Introduce EU pagefault handling
 interface
Date: Thu,  3 Sep 2026 17:59:50 +0300
Message-ID: <20260903145952.848051-27-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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
(3) The pagefault handling procedure is started when first pagefault
    occurs and it will end when the last is handled. It means that
    no worker handles currently pagefault and no pagefault is in the queue.
    The start and end is handled by eudebug. All pagefaults in between
    have simplified handing by inserting temporary NULL VMA and ACK.

If multiple eu threads are running and a pagefault occurs due to accessing
the same or other invalid address, send a single pagefault event
(DRM_XE_EUDEBUG_EVENT_PAGEFAULT type) to the user debugger instead of a
pagefault event for each of the multiple eu threads.

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
v8: get debugger reference on signalling (Mika)
v9: pagefault storm adaptation and fixes (Maciej, Sashiko)
v10: - rebased on eudebug v9
     - reworked flow to support multiple pagefault processing
Assisted-by: sashiko
Assisted-by: GitHub Copilot CLI:claude-opus-4.7
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jan Maślak <jan.maslak@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   2 +-
 drivers/gpu/drm/xe/xe_eudebug.c           | 125 +++-
 drivers/gpu/drm/xe/xe_eudebug.h           |   9 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c        |  14 +-
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c | 699 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h |  79 +++
 drivers/gpu/drm/xe/xe_eudebug_types.h     | 107 +++-
 drivers/gpu/drm/xe/xe_pagefault_types.h   |   1 +
 include/uapi/drm/xe_drm_eudebug.h         |  12 +
 9 files changed, 1013 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4a882e34bbe8..b5da138fd26e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -162,7 +162,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_eudebug_pagefault.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 2c8d8fc82898..cbe32ec4f244 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -19,11 +19,15 @@
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
@@ -241,12 +245,25 @@ static void xe_eudebug_free(struct kref *ref)
 
 	xe_assert(d->xe, xe_eudebug_detached(d));
 
+	xe_eudebug_pagefault_fini(d);
 	xe_eudebug_resources_destroy(d);
+	mutex_destroy(&d->pf.lock);
 	XE_WARN_ON(d->target.xef);
 
 	kvfree(d->events.fifo_buf);
 	kvfree(d->events.staging);
 	kvfree(d->events.pending);
+
+	/*
+	 * This should be finalized in detach.
+	 * Warn if there is a leftover due to race
+	 */
+	WARN_ON(d->pf.fence);
+	if (d->pf.fence) {
+		dma_fence_signal(d->pf.fence);
+		dma_fence_put(d->pf.fence);
+	}
+
 	kfree(d);
 }
 
@@ -394,6 +411,7 @@ static bool xe_eudebug_detach(struct xe_eudebug *d,
 	wake_up_all(&d->events.write_done);
 
 	if (target) {
+		xe_eudebug_pagefault_signal(d);
 		xe_eudebug_put(d);
 		xe_file_put(target);
 	}
@@ -1930,11 +1948,12 @@ static const struct file_operations fops = {
 	.compat_ioctl   = xe_eudebug_ioctl,
 };
 
-static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q,
-				int lrc_idx, void *bitmap, unsigned int size)
+static int
+send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
 {
 	struct drm_xe_eudebug_event_eu_attention *e;
 	struct drm_xe_eudebug_event *event;
+	const u32 size = xe_gt_eu_attention_bitmap_size(q->gt);
 	const u32 sz = struct_size(e, bitmask, size);
 	int h_queue, h_lrc;
 	int ret;
@@ -1960,14 +1979,18 @@ static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q,
 	e->lrc_handle = h_lrc;
 	e->bitmask_size = size;
 
-	memcpy(e->bitmask, bitmap, size);
-	ret = xe_eudebug_queue_event(d, event);
+	ret = xe_gt_eu_attention_bitmap(q->gt, &e->bitmask[0], e->bitmask_size);
+
+	if (!ret && !bitmap_empty((unsigned long *)&e->bitmask[0],
+				  e->bitmask_size * BITS_PER_BYTE))
+		ret = xe_eudebug_queue_event(d, event);
+
 	spin_unlock(&d->events.lock);
 
 	return ret;
 }
 
-static int xe_send_gt_attention(struct xe_gt *gt, void *bitmap, unsigned int size)
+static int xe_send_gt_attention(struct xe_gt *gt)
 {
 	struct xe_eudebug *d;
 	struct xe_exec_queue *q;
@@ -1982,7 +2005,7 @@ static int xe_send_gt_attention(struct xe_gt *gt, void *bitmap, unsigned int siz
 		goto err_exec_queue_put;
 	}
 
-	d = xe_eudebug_get_nolock(q->vm->xef);
+	d = xe_eudebug_get_nolock_with_discovery(q->vm->xef);
 	if (!d) {
 		ret = -ENOTCONN;
 		goto err_exec_queue_put;
@@ -1994,7 +2017,7 @@ static int xe_send_gt_attention(struct xe_gt *gt, void *bitmap, unsigned int siz
 		goto err_eudebug_put;
 	}
 
-	ret = send_attention_event(d, q, lrc_idx, bitmap, size);
+	ret = send_attention_event(d, q, lrc_idx);
 	if (ret)
 		xe_eudebug_disconnect(d, ret);
 
@@ -2009,32 +2032,12 @@ static int xe_send_gt_attention(struct xe_gt *gt, void *bitmap, unsigned int siz
 static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	const u32 size = xe_gt_eu_attention_bitmap_size(gt);
 	int ret;
-	void *bitmask;
 
 	if (!READ_ONCE(xe->eudebug.send_attentions))
 		return 0;
 
-	ret = xe_gt_eu_threads_needing_attention(gt);
-	if (ret <= 0)
-		return ret;
-
-	/* If we fail at this time, assume we manage to send eventually */
-	bitmask = kvzalloc(size, GFP_KERNEL);
-	if (!bitmask)
-		return 0;
-
-	ret = xe_gt_eu_attention_bitmap(gt, bitmask, size);
-	if (ret)
-		goto out;
-
-	if (bitmap_empty(bitmask, size * BITS_PER_BYTE))
-		goto out;
-
-	ret = xe_send_gt_attention(gt, bitmask, size);
-out:
-	kvfree(bitmask);
+	ret = xe_send_gt_attention(gt);
 
 	/* Discovery in progress, fake it */
 	if (ret == -EBUSY)
@@ -2053,6 +2056,53 @@ static void handle_attention_fail(struct xe_gt *gt, int gt_id, int ret)
 	xe_gt_reset_async(gt);
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
+	spin_lock(&d->events.lock);
+	event = xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0,
+					 DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz);
+
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
+	spin_unlock(&d->events.lock);
+
+	return ret;
+}
+
 static void attention_poll_work(struct work_struct *work)
 {
 	struct xe_device *xe = container_of(work, typeof(*xe),
@@ -2072,8 +2122,14 @@ static void attention_poll_work(struct work_struct *work)
 			if (gt->info.type != XE_GT_TYPE_MAIN)
 				continue;
 
-			ret = xe_eudebug_handle_gt_attention(gt);
-			if (ret)
+			if (!xe_gt_eu_threads_needing_attention(gt))
+				continue;
+
+			ret = xe_eudebug_handle_pagefaults(gt);
+			if (!ret)
+				ret = xe_eudebug_handle_gt_attention(gt);
+
+			if (ret && ret != -EBUSY)
 				handle_attention_fail(gt, gt_id, ret);
 		}
 
@@ -2102,13 +2158,13 @@ static void attention_poll_work(struct work_struct *work)
  * poll: a worker already past its own requeue check can arm the work one
  * more time, and that wakeup returns at the top guard without rearming.
  */
-static void xe_eudebug_attention_poll_stop(struct xe_device *xe)
+void xe_eudebug_attention_poll_stop(struct xe_device *xe)
 {
 	WRITE_ONCE(xe->eudebug.send_attentions, false);
 	cancel_delayed_work(&xe->eudebug.attention_dwork);
 }
 
-static void xe_eudebug_attention_poll_start(struct xe_device *xe)
+void xe_eudebug_attention_poll_start(struct xe_device *xe)
 {
 	WRITE_ONCE(xe->eudebug.send_attentions, true);
 	mod_delayed_work(xe->eudebug.attention_wq, &xe->eudebug.attention_dwork, 0);
@@ -2143,6 +2199,8 @@ xe_eudebug_connect(struct xe_device *xe,
 	d->xe = xe;
 
 	kref_init(&d->ref);
+	mutex_init(&d->pf.lock);
+	INIT_LIST_HEAD(&d->pf.pagefaults);
 	init_waitqueue_head(&d->events.write_done);
 	spin_lock_init(&d->events.lock);
 
@@ -2152,6 +2210,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	spin_lock_init(&d->acks.lock);
 	d->acks.tree = RB_ROOT;
 
+	d->pf.active = 0;
+	d->pf.first = NULL;
+
 	err = xe_eudebug_resources_init(d);
 	if (XE_IOCTL_DBG(xe, err)) {
 		kfree(d);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 8a5a10bf7e8b..2bad3e7f8b8c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -13,12 +13,14 @@ struct drm_file;
 struct xe_debug_data;
 struct xe_device;
 struct xe_file;
+struct xe_gt;
 struct xe_vm;
 struct xe_exec_queue;
 struct xe_vma;
 struct xe_vma_ops;
 struct xe_user_fence;
 struct xe_eudebug;
+struct xe_eudebug_pagefault;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -66,6 +68,7 @@ int xe_eudebug_enable(struct xe_device *xe, bool enable);
 
 struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
 struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
+
 void xe_eudebug_put(struct xe_eudebug *d);
 
 struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d, u32 vm_id);
@@ -81,6 +84,12 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
 
+int xe_eudebug_send_pagefault_event(struct xe_eudebug *d,
+				    struct xe_eudebug_pagefault *pf);
+
+void xe_eudebug_attention_poll_stop(struct xe_device *xe);
+void xe_eudebug_attention_poll_start(struct xe_device *xe);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index d14e4e4775f2..a246a9905bc8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -345,6 +345,7 @@ static int do_eu_control(struct xe_eudebug *d,
 	void __user * const bitmask_ptr = u64_to_user_ptr(arg->bitmask_ptr);
 	struct xe_device *xe = d->xe;
 	struct xe_exec_queue *q, *active;
+	struct dma_fence *pf_fence;
 	struct xe_lrc *lrc;
 	unsigned int hw_attn_size, attn_size;
 	u8 *bits = NULL;
@@ -416,8 +417,19 @@ static int do_eu_control(struct xe_eudebug *d,
 		}
 	}
 
-	ret = -EINVAL;
 	mutex_lock(&xe->eudebug.lock);
+	do {
+		pf_fence = dma_fence_get(d->pf.fence);
+		if (pf_fence) {
+			mutex_unlock(&xe->eudebug.lock);
+			ret = dma_fence_wait(pf_fence, true);
+			dma_fence_put(pf_fence);
+			if (ret)
+				goto out_free;
+			mutex_lock(&xe->eudebug.lock);
+		}
+	} while (pf_fence);
+	ret = -EINVAL;
 
 	switch (arg->cmd) {
 	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.c b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
new file mode 100644
index 000000000000..5ad37e757f69
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.c
@@ -0,0 +1,699 @@
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
+#include "xe_pagefault.h"
+#include "xe_eudebug.h"
+#include "xe_eudebug_hw.h"
+#include "xe_force_wake.h"
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_vm.h"
+
+/**
+ * DOC: EU Debug page fault workaround
+ *
+ * When shader generates an unresolvable page fault for client under debug
+ * then eudebug performs following steps:
+ * - Attention register is read to get current state of hw threads ('before').
+ * - TD_CTL_FORCE_EXCEPTION is set to halt all currently running hw threads
+ *   ('after'). Threads that caused page fault(s) are halted by HW and will
+ *   not appread in 'after' bitmask.
+ * - Page fault is ACKed to GuC.
+ * - All other page faults for a matching VM are processed with optional
+ *   temporary null VMA insertion before and removal after processing.
+ * - When there are no more matching page faults in a queue and worker's
+ *   cache then:
+ *   - attention register is read to get 'resolved' bitmask.
+ *   - TD_CTL_FORCE_EXCEPTION is cleared
+ *   - null vma is removed
+ *   - event to UMD is send.
+ *
+ * Single EUDebug pagefault event reports only first page fault however it
+ * 'handles' them all so the bitmask may contain many aggregated page faults
+ * and UMD shall check all threads that transitioned from 0 ('after') to 1
+ * ('resolved').
+ *
+ * It is assumed that only client under debug is actively running (runalone
+ * mode).
+ */
+
+static struct xe_gt *
+epf_to_gt(struct xe_eudebug_pagefault *epf)
+{
+	return epf->q->gt;
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
+static void pagefault_set_private(struct xe_pagefault *pf,
+				  struct xe_eudebug_pagefault *epf)
+{
+	u64 private;
+
+	epf->private = pf->producer.private;
+	private = (u64)epf | XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG;
+	pf->producer.private = (void *)private;
+}
+
+void xe_eudebug_pagefault_set_private(struct xe_pagefault *pf,
+				      struct xe_vm *vm)
+{
+	struct xe_eudebug_pagefault *epf;
+	struct xe_eudebug *d;
+
+	if (!xe_eudebug_is_enabled(vm->xe))
+		return;
+
+	/* Could be a retry from -EAGAIN handler error */
+	if ((u64)pf->producer.private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG)
+		return;
+
+	d = xe_eudebug_get_nolock_with_discovery(vm->xef);
+	if (!d)
+		return;
+
+	mutex_lock(&d->xe->eudebug.lock);
+	epf = d->pf.first;
+	if (epf && pf->consumer.asid == d->pf.asid)
+		d->pf.active++;
+	else
+		epf = NULL;
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	if (epf)
+		pagefault_set_private(pf, epf);
+
+	xe_eudebug_put(d);
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
+xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct pagefault_fence *pf_fence;
+	struct xe_eudebug_pagefault *epf;
+	struct xe_gt *gt = pf->gt;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	struct xe_eudebug *d;
+	unsigned long tdctl_timeout;
+	unsigned int fw_ref;
+	int lrc_idx;
+	u32 td_ctl;
+
+	if (!xe_eudebug_is_enabled(vm->xe))
+		return -EOPNOTSUPP;
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
+	/**
+	 * Check if there is an active pagefault.
+	 * If so, attach original epf to current pagefault and leave.
+	 */
+	mutex_lock(&d->xe->eudebug.lock);
+	if (d->pf.active || d->pf.first) {
+		epf = kzalloc_obj(*epf, GFP_KERNEL);
+		if (!epf) {
+			mutex_unlock(&d->xe->eudebug.lock);
+			goto err_put_exec_queue;
+		}
+		d->pf.active++;
+		goto out_set_epf;
+	}
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), q->hwe->domain);
+	if (!fw_ref)
+		goto err_put_exec_queue_unlock;
+
+	/*
+	 * If there is no debug functionality (TD_CTL_GLOBAL_DEBUG_ENABLE, etc.),
+	 * don't proceed pagefault routine for eu debugger.
+	 */
+	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	if (!(td_ctl & TD_CTL_GLOBAL_DEBUG_ENABLE))
+		goto err_put_fw;
+
+	epf = kzalloc_obj(*epf, GFP_KERNEL);
+	if (!epf)
+		goto err_put_fw;
+
+	/* Will be enabled when d->pf.first is released */
+	xe_eudebug_attention_poll_stop(gt_to_xe(gt));
+
+	do {
+		fence = dma_fence_get(d->pf.fence);
+		if (fence) {
+			mutex_unlock(&d->xe->eudebug.lock);
+			dma_fence_wait(fence, true);
+			dma_fence_put(fence);
+			mutex_lock(&d->xe->eudebug.lock);
+		}
+	} while (fence);
+
+	pf_fence = pagefault_fence_create();
+	if (!pf_fence)
+		goto err_fence;
+
+	d->pf.fence = &pf_fence->base;
+
+	INIT_LIST_HEAD(&epf->link);
+
+	xe_gt_eu_attentions_read(gt, &epf->attentions.before, 0);
+
+	if (td_ctl & TD_CTL_FORCE_EXCEPTION)
+		eu_warn(d, "force exception already set!");
+
+	tdctl_timeout = jiffies + msecs_to_jiffies(XE_GT_ATTENTION_TIMEOUT_MS);
+	/* Halt regardless of thread dependencies */
+	do {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+		usleep_range(200, 220);
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+
+		if (!(td_ctl & TD_CTL_FORCE_EXCEPTION) &&
+		    time_after(jiffies, tdctl_timeout)) {
+			eu_err(d, "Failed to set Force Exception. Pagefault failed");
+			goto err_tdctl;
+		}
+	} while (!(td_ctl & TD_CTL_FORCE_EXCEPTION));
+
+	xe_gt_eu_attentions_read(gt, &epf->attentions.after,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+out_set_epf:
+	/*
+	 * xe_exec_queue_put() will be called from destroy_pagefault()
+	 * or handle_pagefault()
+	 */
+	epf->q = q;
+	epf->d = d; /* Ref is taken and will not be dropped here */
+	if (!d->pf.first) {
+		d->pf.first = epf;
+		d->pf.active++;
+		d->pf.asid = pf->consumer.asid;
+	}
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	epf->lrc_idx = lrc_idx;
+	epf->fault.addr = pf->consumer.page_addr;
+	epf->fault.type_level = pf->consumer.fault_type_level;
+	epf->fault.access_type = pf->consumer.access_type;
+
+	pagefault_set_private(pf, epf);
+
+	return 0;
+
+err_tdctl:
+	dma_fence_put(d->pf.fence);
+	d->pf.fence = NULL;
+err_fence:
+	xe_eudebug_attention_poll_start(gt_to_xe(gt));
+	kfree(epf);
+err_put_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+err_put_exec_queue_unlock:
+	mutex_unlock(&d->xe->eudebug.lock);
+err_put_exec_queue:
+	xe_exec_queue_put(q);
+err_put_eudebug:
+	xe_eudebug_put(d);
+
+	return -EINVAL;
+}
+
+static struct xe_eudebug_pagefault *_get_epf(void *private)
+{
+	if ((u64)private & XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG)
+		return (struct xe_eudebug_pagefault *)((u64)private &
+						       ~XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG);
+
+	return NULL;
+
+}
+static struct xe_eudebug_pagefault *xe_eudebug_get_epf(struct xe_pagefault *pf)
+{
+	return _get_epf(pf->producer.private);
+}
+
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	u64 addr;
+	size_t align;
+	struct xe_vma *vma = NULL;
+	struct xe_eudebug_pagefault *epf = xe_eudebug_get_epf(pf);
+
+	align = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+	addr = ALIGN_DOWN(pf->consumer.page_addr, align);
+	vma = xe_vm_create_null_vma(vm, addr);
+	if (IS_ERR(vma))
+		return vma;
+
+	epf->null_vma = vma;
+	return vma;
+}
+
+static void eudebug_destroy_vma(struct xe_vm *vm, struct xe_vma *vma)
+{
+	struct dma_fence *fence;
+
+	xe_vm_lock(vm, false);
+	xe_vm_prep_vma_destroy(vm, vma, true);
+
+	fence = xe_vma_unbind(vm, vma, vma->tile_present);
+	if (IS_ERR(fence)) {
+		drm_err(&vm->xe->drm,
+			"eudebug: failed to unbind temporary NULL vma. Err = %ld\n",
+			PTR_ERR(fence));
+		fence = NULL;
+	} else {
+		dma_fence_wait(fence, true);
+	}
+
+	xe_vma_destroy(vma, fence);
+	if (fence)
+		dma_fence_put(fence);
+	xe_vm_unlock(vm);
+}
+
+static void destroy_pagefault(struct xe_eudebug_pagefault *epf)
+{
+	if (epf->d && epf == epf->d->pf.first)
+		epf->d->pf.first = NULL;
+
+	if (epf->null_vma) {
+		lockdep_assert_held(&epf->q->vm->lock);
+		eudebug_destroy_vma(epf->q->vm, epf->null_vma);
+	}
+
+	xe_exec_queue_put(epf->q);
+	if (epf->d)
+		xe_eudebug_put(epf->d);
+	kfree(epf);
+}
+
+static void queue_pagefault(struct xe_eudebug *d,
+			    struct xe_eudebug_pagefault *epf)
+{
+	lockdep_assert_held(&epf->q->vm->lock);
+
+	mutex_lock(&d->pf.lock);
+
+	if (epf->null_vma) {
+		eudebug_destroy_vma(epf->q->vm, epf->null_vma);
+		epf->null_vma = NULL;
+	}
+
+	list_add_tail(&epf->link, &d->pf.pagefaults);
+	mutex_unlock(&d->pf.lock);
+
+	/* Queued is equivalent of sent. Drop references */
+	xe_eudebug_put(epf->d);
+	epf->d = NULL;
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
+static int send_queued_pagefaults(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *epf, *epf_temp;
+	int ret = 0;
+
+	mutex_lock(&d->pf.lock);
+	list_for_each_entry_safe(epf, epf_temp, &d->pf.pagefaults, link) {
+		ret = xe_eudebug_send_pagefault_event(d, epf);
+
+		if (ret == -ENOSPC) {
+			ret = 0;
+			break;
+		}
+
+		list_del(&epf->link);
+
+		destroy_pagefault(epf);
+
+		if (ret)
+			break;
+	}
+	mutex_unlock(&d->pf.lock);
+	return ret;
+}
+
+/*
+ * Fills up the 'resolved' bitmask.
+ * Clears FEE and singlas the pagefault fence.
+ * In the end event is send or internally queued.
+ *
+ * Returns 0 if epf shall not be destroyed (event was queued).
+ */
+static int
+eudebug_pagefault_finalize(struct xe_eudebug_pagefault *epf, int err)
+{
+	struct xe_gt *gt = epf_to_gt(epf);
+	struct xe_eudebug *d;
+	unsigned long tdctl_timeout;
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
+		tdctl_timeout = jiffies + msecs_to_jiffies(XE_GT_ATTENTION_TIMEOUT_MS);
+		do {
+			xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
+						  ~(TD_CTL_FORCE_EXCEPTION));
+			usleep_range(200, 220);
+			td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+
+			if ((td_ctl & TD_CTL_FORCE_EXCEPTION) &&
+			    time_after(jiffies, tdctl_timeout)) {
+				eu_err(epf->d, "Failed to clear Force Exception!!!");
+				break;
+			}
+		} while (td_ctl & TD_CTL_FORCE_EXCEPTION);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+
+	d = epf->d;
+
+	if (!err) {
+		if (completion_done(&d->discovery)) {
+			/* Just in case there was a discovery */
+			ret = send_queued_pagefaults(d);
+			if (!ret) {
+				ret = xe_eudebug_send_pagefault_event(d, epf);
+				if (ret == -ENOSPC) {
+					queue_pagefault(d, epf);
+					queued = true;
+					ret = 0;
+				}
+			}
+
+		} else {
+			queue_pagefault(d, epf);
+			queued = true;
+		}
+	}
+
+	if (d->pf.fence) {
+		dma_fence_signal(d->pf.fence);
+		dma_fence_put(d->pf.fence);
+		d->pf.fence = NULL;
+	}
+
+	return (!queued || ret);
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
+	d = xe_eudebug_get_nolock_with_discovery(q->vm->xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto out_exec_queue_put;
+	} else {
+		if (!completion_done(&d->discovery)) {
+			xe_eudebug_put(d);
+			ret = -EBUSY;
+			goto out_exec_queue_put;
+		}
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
+static bool
+xe_eudebug_pagefault_queue_has_asid(struct xe_pagefault_queue *pf_queue,
+				    u32 asid)
+{
+	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
+					    usm.pf_queue);
+	struct xe_pagefault_work *pf_work;
+	struct xe_pagefault *lpf;
+	u32 head, tail;
+	int i;
+
+	guard(spinlock_irq)(&pf_queue->lock);
+
+	/*
+	 * Entry can be as pf_worker.cache but
+	 * waiting for eudebug hw mutex.
+	 */
+	pf_work = xe->usm.pf_workers;
+	for (i = 0; i < xe->info.num_pf_work; ++i)
+		if (pf_work[i].cache.asid == asid &&
+		    pf_work[i].cache.start != XE_PAGEFAULT_CACHE_START_INVALID)
+			return true;
+
+	head = pf_queue->head;
+	tail = pf_queue->tail;
+
+	/* PF my be queued and pending processing. */
+	while (head != tail) {
+		lpf = (pf_queue->data + tail);
+		if (lpf->consumer.alloc_state == XE_PAGEFAULT_ALLOC_STATE_QUEUED)
+			if (lpf->consumer.asid == asid)
+				return true;
+
+		tail = (tail + xe_pagefault_entry_size()) % pf_queue->size;
+	}
+
+	return false;
+}
+
+void xe_eudebug_pagefault_end(void *private, int err)
+{
+	struct xe_eudebug_pagefault *epf = _get_epf(private);
+	struct xe_eudebug_pagefault *first_epf = NULL;
+	struct xe_pagefault_queue *pf_queue;
+	struct xe_device *xe;
+	struct xe_eudebug *d;
+	struct xe_vm *vm;
+	int resume_attn = 0, destroy_pf = 0;
+
+	if (!epf)
+		return;
+
+	xe = epf->q->xef->xe;
+	pf_queue = &xe->usm.pf_queue;
+
+	d = epf->d;
+	vm = xe_vm_get(epf->q->vm);
+	/* Need to have outher vm lock for eudebug lock as for pf start */
+	down_write(&vm->lock);
+	mutex_lock(&d->xe->eudebug.lock);
+	if (!--d->pf.active) {
+		/*
+		 * This will also catch entries that are popped from pagefault
+		 * queue and moved to worker but not yet processed.
+		 * xe_eudebug_pagefault_start() will catch later it and increase
+		 * the pf.active counter.
+		 */
+		if (!xe_eudebug_pagefault_queue_has_asid(pf_queue, d->pf.asid)) {
+			if (!err)
+				xe_eudebug_pagefault_process(d->pf.first);
+
+			destroy_pf = eudebug_pagefault_finalize(d->pf.first, err);
+			/* If d->pf.first was queued the epf shall be removed. */
+			if (epf != d->pf.first) {
+				if (destroy_pf)
+					first_epf = d->pf.first;
+				else
+					destroy_pf = 1;
+			}
+			d->pf.first = NULL;
+			d->pf.asid = 0;
+			resume_attn = 1;
+		} else {
+			/* page faults still queued */
+			if (epf != d->pf.first)
+				destroy_pf = 1;
+		}
+	} else {
+		/* Multiple page faults for different addresses. Remove vma.*/
+		if (epf != d->pf.first)
+			destroy_pf = 1;
+	}
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	if (destroy_pf) {
+		destroy_pagefault(epf);
+		if (first_epf)
+			destroy_pagefault(first_epf);
+	}
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+
+	if (resume_attn)
+		xe_eudebug_attention_poll_start(xe);
+}
+
+void xe_eudebug_pagefault_fini(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *epf, *epf_temp;
+
+	/* Since it's the last reference no race here */
+
+	list_for_each_entry_safe(epf, epf_temp, &d->pf.pagefaults, link) {
+		list_del(&epf->link);
+		destroy_pagefault(epf);
+	}
+
+	if (d->pf.first) {
+		struct xe_vm *vm;
+		epf = d->pf.first;
+		vm = xe_vm_get(epf->q->vm);
+		down_write(&vm->lock);
+		destroy_pagefault(epf);
+		up_write(&vm->lock);
+		xe_vm_put(vm);
+	}
+	XE_WARN_ON(d->pf.fence);
+}
+
+void xe_eudebug_pagefault_signal(struct xe_eudebug *d)
+{
+	struct dma_fence *f;
+
+	mutex_lock(&d->xe->eudebug.lock);
+	f = d->pf.fence;
+	d->pf.fence = NULL;
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	if (f) {
+		dma_fence_signal(f);
+		dma_fence_put(f);
+	}
+}
+
+bool xe_eudebug_pagefault_creatable(struct xe_gt *gt, struct xe_vm *vm)
+{
+	struct xe_exec_queue *q;
+	struct xe_eudebug *d;
+	bool ret = false;
+	int lrc_idx;
+
+	if (GRAPHICS_VER(gt_to_xe(gt)) >= 35)
+		goto out;
+
+	d = xe_eudebug_get_nolock(vm->xef);
+	if (!d)
+		goto out;
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
+	ret = true;
+
+err_put_exec_queue:
+	xe_exec_queue_put(q);
+err_put_eudebug:
+	xe_eudebug_put(d);
+
+out:
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_pagefault.h b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
new file mode 100644
index 000000000000..927c9b83457c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_pagefault.h
@@ -0,0 +1,79 @@
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
+int xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf);
+struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm, struct xe_pagefault *pf);
+void xe_eudebug_pagefault_end(void *private, int err);
+/*
+ * The (struct xe_pagefault *)->producer.private is a pointer which, for now,
+ * stores the pointer guc.
+ * EU Debug intercepts this pointer to store struct xe_eudebug_pagefault.
+ * Original pointer can be obtained via eudebug function below called with
+ * mentioned producer's private field.
+ */
+#define XE_EUDEBUG_PAGEFAULT_PRIVATE_EUDEBUG	0x1
+void xe_eudebug_pagefault_set_private(struct xe_pagefault *pf,
+				      struct xe_vm *vm);
+void *xe_eudebug_pagefault_get_private(void *private);
+
+void xe_eudebug_pagefault_signal(struct xe_eudebug *d);
+
+bool xe_eudebug_pagefault_creatable(struct xe_gt *gt, struct xe_vm *vm);
+#else
+
+static inline int
+xe_eudebug_pagefault_start(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void xe_eudebug_pagefault_end(void *private, int err)
+{
+}
+
+static inline struct xe_vma *xe_eudebug_create_vma(struct xe_vm *vm,
+						   struct xe_pagefault *pf)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline void xe_eudebug_pagefault_set_private(struct xe_pagefault *pf,
+						    struct xe_vm *vm)
+{
+}
+
+static inline void *xe_eudebug_pagefault_get_private(void *private)
+{
+	return private;
+}
+
+static inline void xe_eudebug_pagefault_signal(struct xe_eudebug *d)
+{
+}
+
+static inline bool xe_eudebug_pagefault_creatable(struct xe_gt *gt,
+						  struct xe_vm *vm)
+{
+	return false;
+}
+#endif
+
+#endif /* _XE_EUDEBUG_PAGEFAULT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 5d3f190baecd..12711f507ddc 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -17,6 +17,7 @@
 #include <linux/xarray.h>
 
 #include <uapi/drm/xe_drm_eudebug.h>
+#include "xe_gt_debug_types.h"
 
 struct xe_device;
 struct xe_eudebug;
@@ -38,7 +39,7 @@ enum xe_eudebug_cap_state {
 	XE_EUDEBUG_CAP_ENABLED,
 };
 
-#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_PAGEFAULT
 
 /**
  * struct xe_eudebug_handle - eudebug resource handle
@@ -169,6 +170,110 @@ struct xe_eudebug {
 
 	/** @ops: operations for eu_control */
 	const struct xe_eudebug_eu_control_ops *ops;
+
+	/**
+	 * @pf: Aggregates pagefault related fields.
+	 */
+	struct {
+		/** @pf.lock: guards access to pagefaults list*/
+		struct mutex lock;
+
+		/** @pf.pagefaults: xe_eudebug_pagefault list for pagefault event queuing */
+		struct list_head pagefaults;
+
+		/**
+		 * @pf.fence: fence on operations of eus (eu thread control and attention)
+		 * when page faults are being handled, protected by @xe.eudebug.lock.
+		 */
+		struct dma_fence *fence;
+
+		/**
+		 * @pf.active: number of pagefaults that are being processed in
+		 * parallel by workers and that are after xe_eudebug_pagefault_start()
+		 * but before xe_eudebug_pagefault_end() (ack_fault_end() handler).
+		 *
+		 * Value 0 means that no other worker is currently handling eudebug
+		 * related pagefault but there still may be a pagefault queued and waiting.
+		 *
+		 * Protected by @xe.eudebug.lock.
+		 */
+		u32 active;
+
+		/**
+		 * @pf.first: first pagefault. Only this pagefault will be reported
+		 * with event.
+		 * Subsequent pagefaults with matching VM will be ACKed without
+		 * being handled by eudebug.
+		 * Valid until there are no more pagefaults with matching asid.
+		 *
+		 * This field may be set while @pf.active is 0 if eudebug related
+		 * pagefault is queued but not yet processed.
+		 * Protected by @xe.eudebug.lock.
+		 */
+		struct xe_eudebug_pagefault *first;
+
+		/**
+		 * @pf.asid: VM id of the first pagefault (@pf.first).
+		 */
+		u32 asid;
+	} pf;
+};
+
+/**
+ * struct xe_eudebug_pagefault - eudebug structure for queuing pagefault
+ */
+struct xe_eudebug_pagefault {
+	/** @link: link into the xe_eudebug.pagefaults */
+	struct list_head link;
+	/** @d: eudebug instance. */
+	struct xe_eudebug *d;
+	/** @q: exec_queue which raised pagefault */
+	struct xe_exec_queue *q;
+	/** @lrc_idx: lrc index of the workload which raised pagefault */
+	int lrc_idx;
+
+	/** @fault: pagefault raw partial data passed from guc */
+	struct {
+		/** @fault.addr: ppgtt address where the pagefault occurred */
+		u64 addr;
+		/** @fault.type_level: mixed type & level */
+		u8 type_level;
+		/** @fault.access_type: access type */
+		u8 access_type;
+	} fault;
+
+	/** @attentions: attention states in different phases of fault */
+	struct {
+		/** @attentions.before: state of attention bits before page fault WA processing*/
+		struct xe_eu_attentions before;
+		/**
+		 * @attentions.after: status of attention bits during page fault WA processing.
+		 * It includes eu threads where attention bits are turned on for
+		 * reasons other than page fault WA (breakpoint, interrupt, etc.).
+		 */
+		struct xe_eu_attentions after;
+		/**
+		 * @attentions.resolved: state of the attention bits after page fault WA.
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
+
+	/**
+	 * @null_vma: temporary vma for handling pagefault. Shall be removed
+	 * when pagefault is handled.
+	 */
+	struct xe_vma *null_vma;
 };
 
 #endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index f99b4e22441c..c7ff08408e43 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -10,6 +10,7 @@
 
 struct xe_gt;
 struct xe_pagefault;
+struct xe_eudebug_pagefault;
 
 /** enum xe_pagefault_access_type - Xe page fault access type */
 enum xe_pagefault_access_type {
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 57ff3d90ac29..903c01703792 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -74,6 +74,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA	5
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
 
 	/** @flags: Flags */
 	__u16 flags;
@@ -397,6 +398,17 @@ struct drm_xe_eudebug_event_eu_attention {
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
2.53.0

