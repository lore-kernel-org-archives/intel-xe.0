Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55AC3DA49
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42C710E1D5;
	Mon,  8 Jul 2024 04:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGXqA7Az";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6A410E012
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411373; x=1751947373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Em4Aa2oMzunpwxwOh8rxT2hl8SVD6V/rG31W5p6Fnw8=;
 b=dGXqA7AzKgqMv7IdTlJNcU2EW9jK3OSKjghklP0oLjmbwY80yOdgwcV5
 XTABtRV2d0z22bAtUDWSGpUv33jgeGWVpiQbSJeaSqA5tAKhTn/1y1x+q
 JrQ3sL9Laygd4ywcVudTfrd7dgX7rpmH3P6b/RxbkgayXb8P+4S8+T7Xi
 i6+7qWrXpKJYbXpnH5FAD3Z4ermhBy6f6vBh7c1sByyHeCiU6j8ztgGpy
 NiFAMKQfsRoSTeaKpoDty7lH43BJ4kda3+DgoXlACsdz0JLOhVI/kPWGE
 zulvVE7PjGVcv1Tuk4RnmfbFFRPs9v+F4iPekMHTTQVms9HsHXXfkWOU4 w==;
X-CSE-ConnectionGUID: 4GvdxpAXQOSdgcuhCtLtnQ==
X-CSE-MsgGUID: b1rzKwfkSrqTjTyU/PIu4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205308"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:53 -0700
X-CSE-ConnectionGUID: 9DJ2n47fThePhAOAZEBRlw==
X-CSE-MsgGUID: dZYwai7AT5a8KEJ1M0VVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518811"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 10/11] drm/xe: Add GT TLB invalidation coalesce tracepoints
Date: Sun,  7 Jul 2024 21:03:30 -0700
Message-Id: <20240708040331.766264-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
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

Add visibility to GT TLB invalidation coalescing.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  5 ++++-
 drivers/gpu/drm/xe/xe_trace.h               | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index b094bc790672..db127432b469 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -363,7 +363,8 @@ xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
 	list_for_each_entry(fence, &coalesce->fence_list, link) {
 		fence->seqno = seqno;
 		fence->invalidation_time = ktime_get();
-		trace_xe_gt_tlb_invalidation_fence_send(gt_to_xe(gt), fence);
+		trace_xe_gt_tlb_invalidation_fence_send_coalesce(gt_to_xe(gt),
+								 fence);
 	}
 
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
@@ -412,6 +413,8 @@ xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 		goto unlock;
 	}
 
+	trace_xe_gt_tlb_invalidation_fence_coalesce(gt_to_xe(gt), fence);
+
 	if (list_empty(&coalesce->link))
 		list_add_tail(&coalesce->link,
 			      &gt->tlb_invalidation.pending_coalesce);
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

