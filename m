Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE0C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 05:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6610E52E;
	Thu, 18 Jul 2024 05:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VC7gSsS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35D10E52F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 05:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721280409; x=1752816409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lEKqyyNNHj5qq2fHmpd+DZQ+SCqj/ymyENVClpY0gbE=;
 b=VC7gSsS9mHz277PXHPeQVYXXsAiOEnvjP6GXJajMUoDa0InFLPSIQABp
 6LFAhccEb5w3DurpK7nz6H9FHVH6AI4seGAzt1talTV1HS3qT66aJ7kYA
 V5ryrUW/0mEk7PkGtmYd0o6ABTtTpB85Rg39iiQpJ3iJCFa5ohKLGZSaY
 u2VOqSotVx1HSR1Bx2tIcFsCOy+QjYq5W+HcHNvXrmapWEZmrAxgecA6e
 Igp6UYLYJHR9vZHEF6kk4xJDVkl2ondbS9urAcwOepuAh2TMuaKMqTOAF
 LRr9nDFhp1uuAgcrzflbLcit/EBdIMAUbvGkCxxH8u3+8zPQ4D46CtXDm g==;
X-CSE-ConnectionGUID: p6xqsrs2S3WLu6yF1nkiZQ==
X-CSE-MsgGUID: T/6fRSKWTWerDlnrK6jGlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18671187"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18671187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 22:26:48 -0700
X-CSE-ConnectionGUID: Ssln6uT1RvSsDDR0lEO41g==
X-CSE-MsgGUID: NM9LGObNTRmlqsh8T68zeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55777617"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 22:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 3/3] drm/xe: Hold a PM ref when GT TLB invalidations are
 inflight
Date: Wed, 17 Jul 2024 22:27:33 -0700
Message-Id: <20240718052733.1434755-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718052733.1434755-1-matthew.brost@intel.com>
References: <20240718052733.1434755-1-matthew.brost@intel.com>
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

Avoid GT TLB invalidation timeouts by holding a PM ref when
invalidations are inflight.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 56 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  1 +
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  4 ++
 drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
 4 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 687214d07ac7..ee9e1533a769 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
@@ -33,6 +34,21 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 	return hw_tlb_timeout + 2 * delay;
 }
 
+static void
+__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+{
+	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
+	dma_fence_signal(&fence->base);
+	xe_gt_tlb_invalidation_fence_fini(fence);
+	dma_fence_put(&fence->base);
+}
+
+static void
+invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+{
+	list_del(&fence->link);
+	__invalidation_fence_signal(xe, fence);
+}
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
@@ -54,10 +70,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
-		list_del(&fence->link);
 		fence->base.error = -ETIME;
-		dma_fence_signal(&fence->base);
-		dma_fence_put(&fence->base);
+		invalidation_fence_signal(xe, fence);
 	}
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
 		queue_delayed_work(system_wq,
@@ -87,21 +101,6 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	return 0;
 }
 
-static void
-__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
-{
-	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
-	dma_fence_signal(&fence->base);
-	dma_fence_put(&fence->base);
-}
-
-static void
-invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
-{
-	list_del(&fence->link);
-	__invalidation_fence_signal(xe, fence);
-}
-
 /**
  * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
  * @gt: graphics tile
@@ -261,8 +260,10 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
-		if (ret < 0)
+		if (ret < 0) {
+			xe_gt_tlb_invalidation_fence_fini(&fence);
 			return ret;
+		}
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
@@ -486,11 +487,14 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * @gt: GT
  * @fence: TLB invalidation fence to initialize
  *
- * Initialize TLB invalidation fence for use
+ * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
+ * must be called if fence is not signaled.
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence)
 {
+	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
 		       &gt->tlb_invalidation.lock,
@@ -498,4 +502,16 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 	spin_unlock_irq(&gt->tlb_invalidation.lock);
 	INIT_LIST_HEAD(&fence->link);
 	dma_fence_get(&fence->base);
+	fence->gt = gt;
+}
+
+/**
+ * xe_gt_tlb_invalidation_fence_fini - Finalize TLB invalidation fence
+ * @fence: TLB invalidation fence to finalize
+ *
+ * Drop PM ref which fence took durinig init.
+ */
+void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	xe_pm_runtime_put(gt_to_xe(fence->gt));
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index cbf49b3d0265..f54208d30a0b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -27,6 +27,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence);
+void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence);
 
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index 934c828efe31..de6e825e0851 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -8,6 +8,8 @@
 
 #include <linux/dma-fence.h>
 
+struct xe_gt;
+
 /**
  * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
  *
@@ -17,6 +19,8 @@
 struct xe_gt_tlb_invalidation_fence {
 	/** @base: dma fence base */
 	struct dma_fence base;
+	/** @gt: GT which fence belong to */
+	struct xe_gt *gt;
 	/** @link: link into list of pending tlb fences */
 	struct list_head link;
 	/** @seqno: seqno of TLB invalidation to signal fence one */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 135bccc72d50..8c78d7e843f5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3218,8 +3218,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 */
 			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
 							 &fence[id], vma);
-			if (ret < 0)
+			if (ret < 0) {
+				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
 				goto wait;
+			}
 
 			tile_needs_invalidate |= BIT(id);
 		}
-- 
2.34.1

