Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD72C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7953C10E223;
	Thu, 24 Jul 2025 19:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcBETE2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8D310E2A2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753384232; x=1784920232;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MVmGXVahI7YltrfROl44vFwyMt/8TrbLhMVcUPs8DKw=;
 b=QcBETE2TvHG3fLIQ9S3dyE5jQoPMO9QRHucWnyOvv0x46OpBV3v3+OL8
 dmtopgGWpJn9UyCwjYIhc7K4SzEhL+xLFrKRTt/xTkknsTnpzETm5P2OY
 E+WCmsu6AolRnKqltGC0DX6nCLDFw5C4d2f0yGra9MhT0YsvWTVmflq2g
 J3HfMoVWxGaB1xIXtfNgWWO+zD73cWWyssa6m+XiHktuqwT1Q0mv8HYX0
 b/G/K4MxyhI1Fkwa+Jl3ygi+cDuile/u2i8MdzyH7PP8gtiWpBgxu1Lv+
 sVE669xIB8Ymxc2yqQNgzeMNNpyzzm7KSHDpGMEZZkIQaL23YOXfyRu7U A==;
X-CSE-ConnectionGUID: aK6RA/FBQN6QVNt0uncoQA==
X-CSE-MsgGUID: Wo0rdyHESaSlPo5r/j7BMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65976731"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="65976731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:31 -0700
X-CSE-ConnectionGUID: kdRdZ75JTGasPUS2EDrT6g==
X-CSE-MsgGUID: VnTvj4pnSWKNnuyJjd65Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160387672"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/xe: Remove unused GT TLB invalidation trace points
Date: Thu, 24 Jul 2025 12:12:16 -0700
Message-Id: <20250724191216.4076566-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
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

Remove unused GT TLB invalidation trace points after converting to used
GT TLB invalidation jobs. The trace points removed were used during
early bring up of unstable driver, with a stable driver no need to
replace with new tracepoints.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 16 ----------------
 1 file changed, 16 deletions(-)

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

