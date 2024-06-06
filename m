Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC03C27C53
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007FE10E5F8;
	Thu,  6 Jun 2024 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mg3k5xE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131510E469
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633187; x=1749169187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VwN3ZEu/KXSRA9lnjEyjYi742X/k0lotxYewSISaeM=;
 b=Mg3k5xE5QnfOwTasgxv5pRblkvT6CJy1TBDKeFx/+3465yMljN6MLFEC
 vZ04XNtlEhhV6eD3Reb1dkbf4ZPHgWRbd82snTwg8L3fievddIpSPxKq6
 UdohBMYQ0ip0+66H/I/H9Fua9TXjZFeS2AhS3zCuTuDj9PbJKpQyCbrlM
 kxMNp0QCBLUOtK5S/GJpTCf1xQrfE+Oo7vuK8B6o8xWpp9qyIyraxJUMU
 kmOVi8u1FXuDXTld58R/ObCozi2gz/vCC/6qtzzlXq6AwubtZdJp2lIss
 Ix4QMiSHc0lPgaLjGRVXCeYH0HMXLS//5l+eufUOWL6evP4MFfFW+H+dg A==;
X-CSE-ConnectionGUID: acfPbHh5TVyORf1OQifiXg==
X-CSE-MsgGUID: qXBBGdqnT9yji+usFcVxBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820040"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: UQfF1GEOSWil5NjHYAPY8A==
X-CSE-MsgGUID: fTsELtszSkaxfE2FJApROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328637"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 5/6] drm/xe/trace: Print device_id in xe_trace events
Date: Wed,  5 Jun 2024 17:18:13 -0700
Message-Id: <20240606001814.3460974-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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

v2: Use variable sized variant to display dev name(Gustavo)

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 27 +++++----
 drivers/gpu/drm/xe/xe_pt.c                  |  8 ++-
 drivers/gpu/drm/xe/xe_trace.h               | 65 +++++++++++++--------
 3 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 105797776a6c..23d397a246a8 100644
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
+		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
 		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
@@ -71,18 +72,18 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 }
 
 static void
-__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
-	trace_xe_gt_tlb_invalidation_fence_signal(fence);
+	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
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
+		trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
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
+		trace_xe_gt_tlb_invalidation_fence_recv(xe, fence);
 
 		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
 			break;
 
-		invalidation_fence_signal(fence);
+		invalidation_fence_signal(xe, fence);
 	}
 
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index cd60c009b679..ade9e7a3a0ad 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1137,8 +1137,9 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 {
 	struct invalidation_fence *ifence =
 		container_of(cb, struct invalidation_fence, cb);
+	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
 	if (!ifence->fence->error) {
 		queue_work(system_wq, &ifence->work);
 	} else {
@@ -1153,8 +1154,9 @@ static void invalidation_fence_work_func(struct work_struct *w)
 {
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
+	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
 	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
 				     ifence->end, ifence->asid);
 }
@@ -1166,7 +1168,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 {
 	int ret;
 
-	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
+	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
 
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 8e00f0cdeb75..a22db52e88e3 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -9,6 +9,7 @@
 #if !defined(_XE_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _XE_TRACE_H_
 
+#include <linux/string_helpers.h>
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
@@ -20,58 +21,64 @@
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
+#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
+#define __dev_name_gt(gt)	__dev_name_xe(gt_to_xe((gt)))
+#define __dev_name_eq(q)	__dev_name_gt((q)->gt)
+
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
-		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-		    TP_ARGS(fence),
+		    TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+		    TP_ARGS(xe, fence),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_xe(xe))
 			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
 			     __field(int, seqno)
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev, __dev_name_xe(xe));
 			   __entry->fence = fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%d",
-			      __entry->fence, __entry->seqno)
+		    TP_printk("dev=%s, fence=%p, seqno=%d",
+			      __get_str(dev), __entry->fence, __entry->seqno)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
 	     xe_gt_tlb_invalidation_fence_work_func,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(fence)
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
 );
 
 DECLARE_EVENT_CLASS(xe_exec_queue,
@@ -79,6 +86,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 		    TP_ARGS(q),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_eq(q))
 			     __field(enum xe_engine_class, class)
 			     __field(u32, logical_mask)
 			     __field(u8, gt_id)
@@ -89,6 +97,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev, __dev_name_eq(q));
 			   __entry->class = q->class;
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
@@ -98,8 +107,8 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->flags = q->flags;
 			   ),
 
-		    TP_printk("%d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
-			      __entry->class, __entry->logical_mask,
+		    TP_printk("dev=%s, %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
+			      __get_str(dev), __entry->class, __entry->logical_mask,
 			      __entry->gt_id, __entry->width, __entry->guc_id,
 			      __entry->guc_state, __entry->flags)
 );
@@ -199,6 +208,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_ARGS(job),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_eq(job->q))
 			     __field(u32, seqno)
 			     __field(u32, lrc_seqno)
 			     __field(u16, guc_id)
@@ -210,6 +220,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev, __dev_name_eq(job->q));
 			   __entry->seqno = xe_sched_job_seqno(job);
 			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
 			   __entry->guc_id = job->q->guc->id;
@@ -221,8 +232,8 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
-			      __entry->fence, __entry->seqno,
+		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
+			      __get_str(dev), __entry->fence, __entry->seqno,
 			      __entry->lrc_seqno, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
@@ -268,17 +279,19 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
 		    TP_ARGS(msg),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)))
 			     __field(u32, opcode)
 			     __field(u16, guc_id)
 			     ),
 
 		    TP_fast_assign(
+			    __assign_str(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)));
 			   __entry->opcode = msg->opcode;
 			   __entry->guc_id =
 			   ((struct xe_exec_queue *)msg->private_data)->guc->id;
 			   ),
 
-		    TP_printk("guc_id=%d, opcode=%u", __entry->guc_id,
+		    TP_printk("dev=%s, guc_id=%d, opcode=%u", __get_str(dev), __entry->guc_id,
 			      __entry->opcode)
 );
 
@@ -297,19 +310,21 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 		    TP_ARGS(fence),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_gt(fence->ctx->gt))
 			     __field(u64, ctx)
 			     __field(u32, seqno)
 			     __field(struct xe_hw_fence *, fence)
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev, __dev_name_gt(fence->ctx->gt));
 			   __entry->ctx = fence->dma.context;
 			   __entry->seqno = fence->dma.seqno;
 			   __entry->fence = fence;
 			   ),
 
-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
-			      __entry->ctx, __entry->fence, __entry->seqno)
+		    TP_printk("dev=%s, ctx=0x%016llx, fence=%p, seqno=%u",
+			      __get_str(dev), __entry->ctx, __entry->fence, __entry->seqno)
 );
 
 DEFINE_EVENT(xe_hw_fence, xe_hw_fence_create,
-- 
2.34.1

