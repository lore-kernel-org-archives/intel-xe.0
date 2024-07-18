Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788C4C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9B710EABD;
	Thu, 18 Jul 2024 18:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXBAXg3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CC310EABD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328897; x=1752864897;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=q1llPIYFBJXSL7LSCnSPgp4YXz/TQCBIRGgr5CJka5A=;
 b=PXBAXg3w3vD2XdS6nJo9ua9eMXYPzhK/zX0jvs8Q2FfRLf8TDbSZezgc
 PX3tEL/sel4vRlW+1XZmpFII/I0O2Q9l+Tc/LU3WRW1v7GJWetLN8REw9
 xJ6vj7oKzZPGO3O4G/WIGDfUN3fiDaRlZMYYhl/9C1G/+TXPN1vOJB7VB
 UV9+v6a8d2pTmphm14YCdIjjZ0aZhBY7Tcg9U1gDF+lmmNz20VqIUn+zO
 Y0hM+0/bf+PhsrRYXtyfHv3xvd9tTFKSrlK7gVc8Ur9KkLpbaQ61WLWyk
 Y86jP1beUllyd9VB0Sj2KTEi0xGyGd6lAdHf7qQIaSNjSkcnYIUh5bPnO Q==;
X-CSE-ConnectionGUID: isou8LZcTfWXX9ysubdp/w==
X-CSE-MsgGUID: FDxg+D0NTMexxeWLTQBy7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21816222"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="21816222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
X-CSE-ConnectionGUID: rP4JjtdwSNWQvU+bglqvzw==
X-CSE-MsgGUID: ts/xyDmGSr+oeG3AJNRssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51152679"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/xe: Hold a PM ref when GT TLB invalidations are
 inflight
Date: Thu, 18 Jul 2024 11:55:30 -0700
Message-Id: <20240718185531.1500815-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718185531.1500815-1-matthew.brost@intel.com>
References: <20240718185531.1500815-1-matthew.brost@intel.com>
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

v2:
 - Drop PM ref before signaling fence (CI)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 62 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  1 +
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  4 ++
 drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
 4 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 668c1a3f06ac..481d83d07367 100644
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
@@ -35,6 +36,24 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 	return hw_tlb_timeout + 2 * delay;
 }
 
+static void
+__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+{
+	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
+
+	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
+	xe_gt_tlb_invalidation_fence_fini(fence);
+	dma_fence_signal(&fence->base);
+	if (!stack)
+		dma_fence_put(&fence->base);
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
@@ -56,10 +75,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
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
@@ -89,24 +106,6 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	return 0;
 }
 
-static void
-__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
-{
-	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
-
-	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
-	dma_fence_signal(&fence->base);
-	if (!stack)
-		dma_fence_put(&fence->base);
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
@@ -266,8 +265,10 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
-		if (ret < 0)
+		if (ret < 0) {
+			xe_gt_tlb_invalidation_fence_fini(&fence);
 			return ret;
+		}
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
@@ -492,12 +493,15 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * @fence: TLB invalidation fence to initialize
  * @stack: fence is stack variable
  *
- * Initialize TLB invalidation fence for use
+ * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
+ * must be called if fence is not signaled.
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
 				       bool stack)
 {
+	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
 		       &gt->tlb_invalidation.lock,
@@ -508,4 +512,16 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 		set_bit(FENCE_STACK_BIT, &fence->base.flags);
 	else
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
index f430d5797af7..a84065fa324c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -28,6 +28,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
 				       bool stack);
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
index 4a29d5be7310..9a9c1e11545b 100644
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

