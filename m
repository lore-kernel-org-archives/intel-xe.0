Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DE4C2A086
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323A10E3B6;
	Mon,  5 Jan 2026 04:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FN1UooOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAFE10E359
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xb/RK9XjGpsD0C6HEshOqiIAs5LYQTNLZuRStUDwxQM=;
 b=FN1UooOZoeDwxIFtvqyXNCfw1uaNmc7Two2lI9nhaF7liIGF/80k1QVJ
 BuAm7sfdF1J5i9kVZkuBFwJshJzgzychkHkmsRN+w0y6uC7zYA16Ncz1y
 w9y4A+Fe0kgtcnGTqiWrAajWNZukqjGcaWijCsFYU6V6F0vbVU2oWyHQF
 bxUDD8yMEdFFLkgGoSuek2s16gr32gdW4EoTmP74S3jS0gYSr8yboJBcs
 zmajKmEAuwy4OQXazq9tFkEcmH/j3AU4W1FtsqXtcIW03z56m/qkS/63T
 JN0WkuFxZmjtbkoxJSNBDKUnebAZ5mxQmxefl5YP7MWrEKr0HpcR6GcBe A==;
X-CSE-ConnectionGUID: 0qhmNkqLQjWKx/8F/DBbxQ==
X-CSE-MsgGUID: YTBXpgLdRF28i413Mf5zoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856270"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: ECC6cm4ISeaIFGctpk+XXg==
X-CSE-MsgGUID: 8hfMH7W2RZWavAwzARIbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060687"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 17/22] drm/xe: Add hw fence deadline trace points
Date: Sun,  4 Jan 2026 20:02:32 -0800
Message-Id: <20260105040237.1307873-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add hw fence deadline trace points to help debug and profile the
deadline implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_deadline_mgr.c | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_trace.h        | 22 ++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
index f3c920017e40..e2ee23f6e787 100644
--- a/drivers/gpu/drm/xe/xe_deadline_mgr.c
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -10,6 +10,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
+#include "xe_trace.h"
 
 #ifdef CONFIG_DRM_XE_DEADLINE_WINDOW_US
 #define XE_DEADLINE_WINDOW_US	CONFIG_DRM_XE_DEADLINE_WINDOW_US
@@ -345,6 +346,8 @@ void xe_deadline_mgr_add_deadline(struct xe_deadline_mgr *mgr,
 	__xe_deadline_mgr_remove_deadline(mgr, hw_fence);
 	__xe_deadline_mgr_add_deadline(mgr, hw_fence, deadline);
 	__xe_deadline_mgr_update_deadline(mgr);
+
+	trace_xe_hw_fence_add_deadline(hw_fence);
 }
 
 /**
@@ -359,15 +362,22 @@ void xe_deadline_mgr_add_deadline(struct xe_deadline_mgr *mgr,
 void xe_deadline_mgr_remove_deadline(struct xe_deadline_mgr *mgr,
 				     struct dma_fence *fence)
 {
+	struct xe_hw_fence *hw_fence;
+
 	if (mgr->state == XE_DEADLINE_MGR_STATE_UNSUPPORTED)
 		return;
 
 	guard(spinlock_irqsave)(&mgr->lock);
 
+	hw_fence = to_xe_hw_fence(fence);
+
 	xe_assert(gt_to_xe(mgr->q->gt), !dma_fence_is_container(fence));
 	xe_assert(gt_to_xe(mgr->q->gt), dma_fence_is_signaled(fence));
 	xe_assert(gt_to_xe(mgr->q->gt),
-		  to_xe_hw_fence(fence)->deadline.time != XE_DEADLINE_DONE);
+		  hw_fence->deadline.time != XE_DEADLINE_DONE);
+
+	if (hw_fence->deadline.time != XE_DEADLINE_NONE)
+		trace_xe_hw_fence_remove_deadline(hw_fence);
 
-	__xe_deadline_mgr_remove_deadline(mgr, to_xe_hw_fence(fence));
+	__xe_deadline_mgr_remove_deadline(mgr, hw_fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 14592403d2c0..5c84b8503de3 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -369,6 +369,8 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 			     __field(u64, ctx)
 			     __field(u32, seqno)
 			     __field(struct xe_hw_fence *, fence)
+			     __field(s64, delta_ns)
+			     __field(bool, missed)
 			     ),
 
 		    TP_fast_assign(
@@ -376,10 +378,16 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 			   __entry->ctx = fence->dma.context;
 			   __entry->seqno = fence->dma.seqno;
 			   __entry->fence = fence;
+			   __entry->delta_ns =
+			   ktime_to_ns(ktime_sub(fence->deadline.time, ktime_get()));
+			   __entry->missed = (__entry->delta_ns < 0 &&
+			    fence->deadline.time != XE_DEADLINE_NONE);
 			   ),
 
-		    TP_printk("dev=%s, ctx=0x%016llx, fence=%p, seqno=%u",
-			      __get_str(dev), __entry->ctx, __entry->fence, __entry->seqno)
+		    TP_printk("dev=%s, ctx=0x%llx, fence=%p, seqno=%u, missed=%d, delta_ns=0x%llx",
+			      __get_str(dev), __entry->ctx, __entry->fence,
+			      __entry->seqno, __entry->missed ? 1 : 0,
+			      (u64)__entry->delta_ns)
 );
 
 DEFINE_EVENT(xe_hw_fence, xe_hw_fence_create,
@@ -397,6 +405,16 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
 	     TP_ARGS(fence)
 );
 
+DEFINE_EVENT(xe_hw_fence, xe_hw_fence_add_deadline,
+	     TP_PROTO(struct xe_hw_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_hw_fence, xe_hw_fence_remove_deadline,
+	     TP_PROTO(struct xe_hw_fence *fence),
+	     TP_ARGS(fence)
+);
+
 TRACE_EVENT(xe_reg_rw,
 	TP_PROTO(struct xe_mmio *mmio, bool write, u32 reg, u64 val, int len),
 
-- 
2.34.1

