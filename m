Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F68C3DA40
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD410E047;
	Sat,  6 Jul 2024 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hU1ws2zT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC710E14C
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wudVBXu1VWIIIBkdyPu43mFLe9e3Ts0e4tmO2W3Oow=;
 b=hU1ws2zTRXREw3SCX9wgP5AQCxvwmqcsZMc1Ab3tglY/x+lYrCrbhzTz
 +IgPbf0gWjjAtG+PugA9sVKlbqTC0pGjwu25v5FcELNWRyWhh6wz1LihV
 vd83d7L1w7q3ZqqJeHafroFKJR4fsSQtYhi3d3jkpkwx+O2ThptG1aryq
 g0qO0PeCbJbJbcnGJyJYxrdxu2Xd4xA/4dmrQd6xlxF8ftSebUB0JXgZi
 CNLu74RQsYK0hqr2f3rDcPSDNBztH7mo6HKavmrIM5Nv/W1FSz6SPvDFE
 t0JQQkxhgKgiuqe/JTKjtiIkDJwiCEt2DalgyJYMiyWBdhHBzPb1YQgi/ A==;
X-CSE-ConnectionGUID: NjDLlIFWTlO1k8yNlm+lew==
X-CSE-MsgGUID: dY/MHRjmQqe2h9xKsiaS3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464664"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:16 -0700
X-CSE-ConnectionGUID: BSZ+0uNnRqC3lKuSLKbDyQ==
X-CSE-MsgGUID: AWZgegKEQVymfAsd5N8EpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128266"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 10/11] drm/xe: Add GT TLB coalesce tracepoints
Date: Fri,  5 Jul 2024 17:02:51 -0700
Message-Id: <20240706000252.702044-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

Add visibility to GT TLB coalescing.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 10 +++++++++-
 drivers/gpu/drm/xe/xe_trace.h               | 10 ++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index b85089d27a36..c7634acea938 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -362,7 +362,8 @@ xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
 	list_for_each_entry(fence, &coalesce->fence_list, link) {
 		fence->seqno = seqno;
 		fence->invalidation_time = ktime_get();
-		trace_xe_gt_tlb_invalidation_fence_send(gt_to_xe(gt), fence);
+		trace_xe_gt_tlb_invalidation_fence_send_coalesce(gt_to_xe(gt),
+								 fence);
 	}
 
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
@@ -411,6 +412,8 @@ xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 		goto unlock;
 	}
 
+	trace_xe_gt_tlb_invalidation_fence_coalesce(gt_to_xe(gt), fence);
+
 	if (list_empty(&coalesce->link))
 		list_add_tail(&coalesce->link,
 			      &gt->tlb_invalidation.pending_coalesce);
@@ -469,6 +472,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
+	xe_gt_assert(gt, coalesce);
+	xe_gt_assert(gt, coalesce->type == XE_GT_TLB_INVALIDATION_COALESCE_GGTT);
+
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
 		struct xe_gt_tlb_invalidation_fence fence;
@@ -527,6 +533,8 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	int ret = 0;
 
 	xe_gt_assert(gt, fence);
+	xe_gt_assert(gt, coalesce);
+	xe_gt_assert(gt, coalesce->type == XE_GT_TLB_INVALIDATION_COALESCE_PPGTT);
 
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 09ca1ad057b0..e2c5af5a1d23 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -60,11 +60,21 @@ DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
 	     TP_ARGS(xe, fence)
 );
 
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_coalesce,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
+);
+
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
 	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
 	     TP_ARGS(xe, fence)
 );
 
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send_coalesce,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(xe, fence)
+);
+
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
 	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
 	     TP_ARGS(xe, fence)
-- 
2.34.1

