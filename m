Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F8DC27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAA010E8DB;
	Thu, 30 May 2024 15:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n11b63kz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D010EA8E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082087; x=1748618087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4gYW2EoBuXXdVmNVWAYDDeHdRoUmwaAOoR07StZkCg=;
 b=n11b63kzmVaRYdnFsYM//8OYUQEAXnd1982Zk4AOdq76ofDqNU9FBXU4
 FTUaCNa3oVVwKh8D/3gOQ8+5uWimho9G0d08mT8WUArssa1DptlOTlmns
 raSCXED2b9RlHaZabv+zxgkubHQP2jYjy6dwSXXY+WXaQJ/LdfTN+kFS+
 NUzrFauM3nuvPXm49JSarR3iVTLU6WN4kxr9ohws8EpNCwgOBz4J7wOQB
 RWr5snVDlqVy4GWB2MM+fisCSLu/wQfaM3LC8lri/M1ny8cC+tr5DSJeA
 d9WW/hWuoeQIFspDn77c2eH2+zVkVpHfES2JFfpgF5nHcSt6d5kpzqGhW A==;
X-CSE-ConnectionGUID: M51PaGTGSlChgcbZQLhexA==
X-CSE-MsgGUID: FoP05/7HQZ+Cgh6PR1Appg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24695863"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24695863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:42 -0700
X-CSE-ConnectionGUID: mFHWNgr4ROa8ep51qb9p9Q==
X-CSE-MsgGUID: fu0mWMX7TjesNbzlfpe2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36326449"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 5/6] drm/xe/trace: Print device_id in xe_trace events
Date: Thu, 30 May 2024 08:13:12 -0700
Message-Id: <20240530151313.2284182-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

In multi-gpu environments it is important to know the device
gt events belongs to. The tracing information includes the device_id
to indicate the device the event is associated with.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 27 +++++-----
 drivers/gpu/drm/xe/xe_pt.c                  |  8 +--
 drivers/gpu/drm/xe/xe_trace.h               | 60 ++++++++++++---------
 3 files changed, 55 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 105797776a6c..a80b33a21064 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -22,6 +22,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
 					tlb_invalidation.fence_tdr.work);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
@@ -33,7 +34,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
 			break;
 
-		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
+		trace_xe_gt_tlb_invalidation_fence_timeout(dev_name(xe->drm.dev), fence);
 		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
@@ -71,18 +72,18 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 }
 
 static void
-__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
-	trace_xe_gt_tlb_invalidation_fence_signal(fence);
+	trace_xe_gt_tlb_invalidation_fence_signal(dev_name(xe->drm.dev), fence);
 	dma_fence_signal(&fence->base);
 	dma_fence_put(&fence->base);
 }
 
 static void
-invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
 	list_del(&fence->link);
-	__invalidation_fence_signal(fence);
+	__invalidation_fence_signal(xe, fence);
 }
 
 /**
@@ -121,7 +122,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
-		invalidation_fence_signal(fence);
+		invalidation_fence_signal(gt_to_xe(gt), fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	mutex_unlock(&gt->uc.guc.ct.lock);
 }
@@ -144,6 +145,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 				 u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
 	int seqno;
 	int ret;
 
@@ -157,7 +159,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
 		fence->seqno = seqno;
-		trace_xe_gt_tlb_invalidation_fence_send(fence);
+		trace_xe_gt_tlb_invalidation_fence_send(dev_name(xe->drm.dev), fence);
 	}
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
@@ -171,7 +173,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		 * we can just go ahead and signal the fence here.
 		 */
 		if (tlb_invalidation_seqno_past(gt, seqno)) {
-			__invalidation_fence_signal(fence);
+			__invalidation_fence_signal(xe, fence);
 		} else {
 			fence->invalidation_time = ktime_get();
 			list_add_tail(&fence->link,
@@ -184,7 +186,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	} else if (ret < 0 && fence) {
-		__invalidation_fence_signal(fence);
+		__invalidation_fence_signal(xe, fence);
 	}
 	if (!ret) {
 		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
@@ -294,7 +296,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
 		if (fence)
-			__invalidation_fence_signal(fence);
+			__invalidation_fence_signal(xe, fence);
 
 		return 0;
 	}
@@ -432,6 +434,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 	unsigned long flags;
 
@@ -468,12 +471,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
-		trace_xe_gt_tlb_invalidation_fence_recv(fence);
+		trace_xe_gt_tlb_invalidation_fence_recv(dev_name(xe->drm.dev), fence);
 
 		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
 			break;
 
-		invalidation_fence_signal(fence);
+		invalidation_fence_signal(xe, fence);
 	}
 
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index cd60c009b679..5ba57f9846c4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1137,8 +1137,9 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 {
 	struct invalidation_fence *ifence =
 		container_of(cb, struct invalidation_fence, cb);
+	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_cb(dev_name(xe->drm.dev), &ifence->base);
 	if (!ifence->fence->error) {
 		queue_work(system_wq, &ifence->work);
 	} else {
@@ -1153,8 +1154,9 @@ static void invalidation_fence_work_func(struct work_struct *w)
 {
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
+	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_work_func(dev_name(xe->drm.dev), &ifence->base);
 	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
 				     ifence->end, ifence->asid);
 }
@@ -1166,7 +1168,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 {
 	int ret;
 
-	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_create(dev_name(gt_to_xe(gt)->drm.dev), &ifence->base);
 
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 8e00f0cdeb75..41e0b3365876 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -21,57 +21,59 @@
 #include "xe_vm.h"
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
-		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-		    TP_ARGS(fence),
+		    TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+		    TP_ARGS(devid, fence),
 
 		    TP_STRUCT__entry(
+			     __array(char, devid, 12)
 			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
 			     __field(int, seqno)
 			     ),
 
 		    TP_fast_assign(
+			   memcpy(__entry->devid, devid, 12);
 			   __entry->fence = fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%d",
-			      __entry->fence, __entry->seqno)
+		    TP_printk("dev: %s: fence=%p, seqno=%d",
+			      __entry->devid, __entry->fence, __entry->seqno)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
 	     xe_gt_tlb_invalidation_fence_work_func,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(const char *devid, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(devid, fence)
 );
 
 DECLARE_EVENT_CLASS(xe_exec_queue,
@@ -79,6 +81,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 		    TP_ARGS(q),
 
 		    TP_STRUCT__entry(
+			     __array(char, devid, 12)
 			     __field(enum xe_engine_class, class)
 			     __field(u32, logical_mask)
 			     __field(u8, gt_id)
@@ -89,6 +92,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			     ),
 
 		    TP_fast_assign(
+			   memcpy(__entry->devid, dev_name(gt_to_xe(q->gt)->drm.dev), 12);
 			   __entry->class = q->class;
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
@@ -98,8 +102,8 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->flags = q->flags;
 			   ),
 
-		    TP_printk("%d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
-			      __entry->class, __entry->logical_mask,
+		    TP_printk("dev: %s: %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
+			      __entry->devid, __entry->class, __entry->logical_mask,
 			      __entry->gt_id, __entry->width, __entry->guc_id,
 			      __entry->guc_state, __entry->flags)
 );
@@ -199,6 +203,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_ARGS(job),
 
 		    TP_STRUCT__entry(
+			     __array(char, devid, 12)
 			     __field(u32, seqno)
 			     __field(u32, lrc_seqno)
 			     __field(u16, guc_id)
@@ -210,6 +215,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			     ),
 
 		    TP_fast_assign(
+			   memcpy(__entry->devid, dev_name(gt_to_xe(job->q->gt)->drm.dev), 12);
 			   __entry->seqno = xe_sched_job_seqno(job);
 			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
 			   __entry->guc_id = job->q->guc->id;
@@ -221,8 +227,8 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
-			      __entry->fence, __entry->seqno,
+		    TP_printk("dev: %s: fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
+			      __entry->devid, __entry->fence, __entry->seqno,
 			      __entry->lrc_seqno, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
@@ -268,17 +274,19 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
 		    TP_ARGS(msg),
 
 		    TP_STRUCT__entry(
+			     __array(char, devid, 12)
 			     __field(u32, opcode)
 			     __field(u16, guc_id)
 			     ),
 
 		    TP_fast_assign(
+			   memcpy(__entry->devid, dev_name(gt_to_xe(((struct xe_exec_queue *)msg->private_data)->gt)->drm.dev), 12);
 			   __entry->opcode = msg->opcode;
 			   __entry->guc_id =
 			   ((struct xe_exec_queue *)msg->private_data)->guc->id;
 			   ),
 
-		    TP_printk("guc_id=%d, opcode=%u", __entry->guc_id,
+		    TP_printk("dev: %s: guc_id=%d, opcode=%u", __entry->devid, __entry->guc_id,
 			      __entry->opcode)
 );
 
@@ -300,16 +308,18 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 			     __field(u64, ctx)
 			     __field(u32, seqno)
 			     __field(struct xe_hw_fence *, fence)
+			     __array(char, devid, 12)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->ctx = fence->dma.context;
 			   __entry->seqno = fence->dma.seqno;
 			   __entry->fence = fence;
+			   memcpy(__entry->devid, dev_name(gt_to_xe(fence->ctx->gt)->drm.dev), 12);
 			   ),
 
-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
-			      __entry->ctx, __entry->fence, __entry->seqno)
+		    TP_printk("dev: %s: ctx=0x%016llx, fence=%p, seqno=%u",
+			      __entry->devid, __entry->ctx, __entry->fence, __entry->seqno)
 );
 
 DEFINE_EVENT(xe_hw_fence, xe_hw_fence_create,
-- 
2.34.1

