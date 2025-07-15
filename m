Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D9DC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEEE10E6C6;
	Tue, 15 Jul 2025 21:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3s4ZU4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFE810E68D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752614499; x=1784150499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJLz6d3HWBGgwuMDSrYd+UDLhiZ2wpLcyNsMuT101+A=;
 b=l3s4ZU4eyKLmCGD6nB6Vy5jgRQWDK34FuWmd7STrAVnCY0K3w9RS0xR+
 b/m3QIQldIkxEjYskt6eXFtB/Cq1xwZIR917PUVvoChN4QdrUP8X1lzRj
 GfIV1ifOxWnfkrCDLJdyzo7yh7py1LeXDveZWAAIB82obGpx9cvMBo8gP
 Gl2hLoao43SZVWYzhMfQbkiNj5Yry97Tls9v7aQkozL38rdsHc3He4b73
 T+lAZcbAdEbL28Pz2l5rh+lzFWeU3RLgTL3dunt6faN4wgHlPWAfIE3SO
 0/gMRqnXqyz/RwG34RrpbED7sv3nifg/9bLKacWoEp6c/14VVcxuOIzjy A==;
X-CSE-ConnectionGUID: JTSBbUVSQDingM7ffoT4tQ==
X-CSE-MsgGUID: fDywzpMNQPCu0qStoBtDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54999485"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54999485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:38 -0700
X-CSE-ConnectionGUID: mGv57MjGSzuGXb5Yy1X9uA==
X-CSE-MsgGUID: iRM3W/OCSEKVV601Jh7Cfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156733529"
Received: from dut158arls.fm.intel.com ([10.105.23.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:36 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/4] drm/xe: Remove unused GT TLB invalidation trace points
Date: Tue, 15 Jul 2025 21:21:23 +0000
Message-Id: <20250715212125.337195-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715212125.337195-1-stuart.summers@intel.com>
References: <20250715212125.337195-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Remove unused GT TLB invalidation trace points after converting to used
GT TLB invalidation jobs. Tracepoint removed were used during early
bring up of unstable driver, with a stable driver no need to replace
with new tracepoints.

v2: Separate this out from the original series to make it a little
    more standalone

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c    |  6 ------
 drivers/gpu/drm/xe/xe_trace.h | 16 ----------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c8e63bd23300..7b441d1a77e9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1525,9 +1525,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 {
 	struct invalidation_fence *ifence =
 		container_of(cb, struct invalidation_fence, cb);
-	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
 	if (!ifence->fence->error) {
 		queue_work(system_wq, &ifence->work);
 	} else {
@@ -1541,9 +1539,7 @@ static void invalidation_fence_work_func(struct work_struct *w)
 {
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
-	struct xe_device *xe = gt_to_xe(ifence->gt);
 
-	trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
 	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
 				     ifence->end, ifence->asid);
 }
@@ -1555,8 +1551,6 @@ static void invalidation_fence_init(struct xe_gt *gt,
 {
 	int ret;
 
-	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
-
 	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
 
 	ifence->fence = fence;
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index b4a3577df70c..21486a6f693a 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -45,22 +45,6 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			      __get_str(dev), __entry->fence, __entry->seqno)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
-	     xe_gt_tlb_invalidation_fence_work_func,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
-	     TP_ARGS(xe, fence)
-);
-
 DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
 	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
 	     TP_ARGS(xe, fence)
-- 
2.34.1

