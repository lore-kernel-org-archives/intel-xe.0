Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25930C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CA610E57E;
	Thu, 18 Jul 2024 06:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfHZ4e+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC110E57A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285934; x=1752821934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2bXDghRuea8GSiAgP/gvIGpJxek1qIvTh4h1KboAys=;
 b=cfHZ4e+L2LSaBbOmxJJXPHufD7QK1SmplnB2Mb5JtBnmphDfCY4IgReg
 CMSbMbclT9SmR5BIGgt2S/9ZgjzWDuVASFEhhm0Yr8MPUbyYRGqORmHjk
 /tKRraGlIJgVlEPIUy038wwRnNocPHKlST/NcKQu2S79tTn7w4Z5ldGIp
 T3xtggYBQTBjz//X66O5IWa7Qk8xGIRbJAG7v0QgkmFus4uGfbPRIvnuf
 Dree2AAZbXVTZje/dikcp9UVCQBTWLc+/OH1XgwbQZU6DU80VPFpqLMdT
 9mDOUU9xjKhKl37eWCaiis23Jqf21fAjJRlp+8r/PT6ISQ8MTh0JI3UPx w==;
X-CSE-ConnectionGUID: IyTMz2U7QaCbL780itk5mA==
X-CSE-MsgGUID: QZCoGt/wTWyKl2i7YIH/1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18639348"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18639348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
X-CSE-ConnectionGUID: n4Ueyoj9SCaVbDsmDryJhw==
X-CSE-MsgGUID: ekdIFSdITQ2MEkn677k4PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="51279282"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 1/3] drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
Date: Wed, 17 Jul 2024 23:59:33 -0700
Message-Id: <20240718065935.1451330-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718065935.1451330-1-matthew.brost@intel.com>
References: <20240718065935.1451330-1-matthew.brost@intel.com>
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

Other layers should not be touching struct xe_gt_tlb_invalidation_fence
directly, add helper for initialization.

v2:
 - Add dma_fence_get and list init to xe_gt_tlb_invalidation_fence_init

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 36 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
 drivers/gpu/drm/xe/xe_pt.c                  | 26 +--------------
 3 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index d9359976ab8b..92a18a0e4acd 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -508,3 +508,39 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	return 0;
 }
+
+static const char *
+invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
+{
+	return "xe";
+}
+
+static const char *
+invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
+{
+	return "invalidation_fence";
+}
+
+static const struct dma_fence_ops invalidation_fence_ops = {
+	.get_driver_name = invalidation_fence_get_driver_name,
+	.get_timeline_name = invalidation_fence_get_timeline_name,
+};
+
+/**
+ * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation fence
+ * @gt: GT
+ * @fence: TLB invalidation fence to initialize
+ *
+ * Initialize TLB invalidation fence for use
+ */
+void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
+				       struct xe_gt_tlb_invalidation_fence *fence)
+{
+	spin_lock_irq(&gt->tlb_invalidation.lock);
+	dma_fence_init(&fence->base, &invalidation_fence_ops,
+		       &gt->tlb_invalidation.lock,
+		       dma_fence_context_alloc(1), 1);
+	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	INIT_LIST_HEAD(&fence->link);
+	dma_fence_get(&fence->base);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index bf3bebd9f985..948f4a2f5214 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -26,4 +26,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
+				       struct xe_gt_tlb_invalidation_fence *fence);
+
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f391de908033..1caa99b22c73 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1317,23 +1317,6 @@ struct invalidation_fence {
 	u32 asid;
 };
 
-static const char *
-invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
-{
-	return "xe";
-}
-
-static const char *
-invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
-{
-	return "invalidation_fence";
-}
-
-static const struct dma_fence_ops invalidation_fence_ops = {
-	.get_driver_name = invalidation_fence_get_driver_name,
-	.get_timeline_name = invalidation_fence_get_timeline_name,
-};
-
 static void invalidation_fence_cb(struct dma_fence *fence,
 				  struct dma_fence_cb *cb)
 {
@@ -1372,15 +1355,8 @@ static void invalidation_fence_init(struct xe_gt *gt,
 
 	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
 
-	spin_lock_irq(&gt->tlb_invalidation.lock);
-	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
-		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
-
-	INIT_LIST_HEAD(&ifence->base.link);
+	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base);
 
-	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
 	ifence->start = start;
-- 
2.34.1

