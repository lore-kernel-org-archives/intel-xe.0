Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8BBC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FB410E575;
	Thu, 18 Jul 2024 06:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BocWdWis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057EF10E575
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285688; x=1752821688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2bXDghRuea8GSiAgP/gvIGpJxek1qIvTh4h1KboAys=;
 b=BocWdWisF1NjcmGhhqiSux2Dt4lEcoGqefCAU4SOtPtm+KYxF2w7lETC
 POb2IoKJs9CmXJ3XS2KAZ3/HFqoxd736dFRZuiXO10Rw6HGhCUv9Cr/KV
 Y6z6N8HKUrbDD3hEzNZisz0chF1gm1Jo/bFoQUCzj/HFt+We4/wNad8SJ
 0SVsDaKyvOhSr2vIJAC9GgFAQNyig6Hlh4IeqCX+OqZQCBs3ssQfbIkp3
 qcDyjizUKapEftMzEfPE90Eeo7XWI51/AdGayX8cHajtYzggL85Cutth3
 yPo/sAaXJMp5eoADV55exDG4Iki8Bx2gvRLsL31tH7GBt0wIHx0LYk7PB g==;
X-CSE-ConnectionGUID: BlzwFepeSw6OZ57xKmDEsg==
X-CSE-MsgGUID: kLOhTCbjQyWCaJKQiE5G0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22597491"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22597491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:54:47 -0700
X-CSE-ConnectionGUID: nlFxualzQ5CGKp17R6iN0A==
X-CSE-MsgGUID: AMC0ROsKSsa0i6bw5NJhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="81697531"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:54:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v2 1/3] drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
Date: Wed, 17 Jul 2024 23:55:29 -0700
Message-Id: <20240718065531.1450775-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718065531.1450775-1-matthew.brost@intel.com>
References: <20240718065531.1450775-1-matthew.brost@intel.com>
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

