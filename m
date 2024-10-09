Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F61FCED628
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 08:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4D10E277;
	Wed,  9 Oct 2024 08:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3gB0MF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9599710E691
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728463712; x=1759999712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zl1da4/aJ8WO0J/rlsjnCc1Zlg7XSe4kmMW7rniu1XU=;
 b=N3gB0MF5Y8Hz2XQZ9l0pQ7YPw031ZDAHzgsO1AuUxW7qvY2X3q/OQ9E3
 Q45Zv04r90gvu+FVpgC9LjvvcUARtk4C2WhcKxBAEj0MWA3AaiSc5snR4
 zEKPaUNldaIEG36yj1XbyNap58Y5Q0hrw4EpJyqxmtlKKTd+m4Lv4cBR8
 7r8rlXX7vfHtwEjBNANIHqloDZH25KH/tfMVx8uih5eWcxVBKEve+a8+k
 H4uKyqOF5vbsrXvVvNYyi8o6Act1QXJcV2x9E2q/Ivow5h5nPyc1ICC5X
 ts5Cq6n5HilOMQwHdAn2KqDJI2PNCwjXYE8gTddh8vV5vDiOackZzSaZK Q==;
X-CSE-ConnectionGUID: hgg7V96ETR+7hIar9lVQ7g==
X-CSE-MsgGUID: vDL7Xs/5R3W4VAYXNAYrJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27198442"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27198442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:48:32 -0700
X-CSE-ConnectionGUID: GmwXFBU3Qe6BObuzWFCWrA==
X-CSE-MsgGUID: JdZJtS5FRiGHbIHsCSm7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76191819"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:48:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 1/2] drm/xe: fix unbalanced rpm put() with fence_fini()
Date: Wed,  9 Oct 2024 09:48:09 +0100
Message-ID: <20241009084808.204432-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
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

Currently we can call fence_fini() twice if something goes wrong when
sending the GuC CT for the tlb request, since we signal the fence and
return an error, leading to the caller also calling fini() on the error
path in the case of stack version of the flow, which leads to an extra
rpm put() which might later cause device to enter suspend when it
shouldn't. It looks like we can just drop the fini() call since the
fence signaller side will already call this for us.

There are known mysterious splats with device going to sleep even with
an rpm ref, and this could be one candidate.

v2 (Matt B):
  - Prefer warning if we detect double fini()

Fixes: 0a382f9bc5dc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 29 +++++++++------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 -
 drivers/gpu/drm/xe/xe_vm.c                  |  8 ++----
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 98616de0c5bb..a530a933eedc 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,6 +37,15 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 	return hw_tlb_timeout + 2 * delay;
 }
 
+static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	if (WARN_ON_ONCE(!fence->gt))
+		return;
+
+	xe_pm_runtime_put(gt_to_xe(fence->gt));
+	fence->gt = NULL; /* fini() should be called once */
+}
+
 static void
 __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -204,7 +213,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 						   tlb_timeout_jiffies(gt));
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	} else if (ret < 0) {
+	} else {
 		__invalidation_fence_signal(xe, fence);
 	}
 	if (!ret) {
@@ -267,10 +276,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
-		if (ret < 0) {
-			xe_gt_tlb_invalidation_fence_fini(&fence);
+		if (ret)
 			return ret;
-		}
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
@@ -498,7 +505,8 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * @stack: fence is stack variable
  *
  * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
- * must be called if fence is not signaled.
+ * will be automatically called when fence is signalled (all fences must signal),
+ * even on error.
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
@@ -518,14 +526,3 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 		dma_fence_get(&fence->base);
 	fence->gt = gt;
 }
-
-/**
- * xe_gt_tlb_invalidation_fence_fini - Finalize TLB invalidation fence
- * @fence: TLB invalidation fence to finalize
- *
- * Drop PM ref which fence took durinig init.
- */
-void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
-{
-	xe_pm_runtime_put(gt_to_xe(fence->gt));
-}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index a84065fa324c..f430d5797af7 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -28,7 +28,6 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
 				       bool stack);
-void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence);
 
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ce9dca4d4e87..c99380271de6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3199,10 +3199,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
 							 &fence[fence_id], vma);
-			if (ret < 0) {
-				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+			if (ret)
 				goto wait;
-			}
 			++fence_id;
 
 			if (!tile->media_gt)
@@ -3214,10 +3212,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
 							 &fence[fence_id], vma);
-			if (ret < 0) {
-				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+			if (ret)
 				goto wait;
-			}
 			++fence_id;
 		}
 	}
-- 
2.46.2

