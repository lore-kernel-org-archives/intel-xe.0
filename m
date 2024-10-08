Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47450CEF14E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 10:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BFB10E4BD;
	Tue,  8 Oct 2024 10:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrxKmnxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292710E4BD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728384494; x=1759920494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G6xxaOSjCN/5dnIbgji/Go5suwHfMYkolIZegqyGfww=;
 b=NrxKmnxe9mpavL0gtHX4+aOj0lx/IlNgXcerQKdKkfe+3b+Er6JB/vmn
 4UQ7EMfzSZ3+AbWEjkg684KR7cCb9wdCAdTgA1RDWUxJZ3BLE2GaobBqQ
 TBMUTH/VxOYaU88YHFr5nWqdkC2HPPhryGnzVsMDDcO65Pg3GsqtkEkxJ
 m9O9U5VkFmSpikhPM5YL+u0b5euykgZCRVEOAEcTM15edZfFntwAdzqF6
 zXjA5BaBoYauEHQmOyCixw8q4oGDPK3AvLVAT8ytLhZwsdbWSDNXCCiFN
 P6SNjjrtJW3MPwoSX04IgWiFIfe7Xt6Orm1CtRGnel3Wazw+lZJdF76c2 w==;
X-CSE-ConnectionGUID: 6JdEX6YKQFOEpB/ZIbKKRg==
X-CSE-MsgGUID: WbyYI637RdyMSREcFIhTew==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27024536"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27024536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 03:48:08 -0700
X-CSE-ConnectionGUID: tUerDjmVQ528JTlh6mkt5A==
X-CSE-MsgGUID: FCmEcJqjRjymf7gTYYnoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="79785631"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 03:48:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/2] drm/xe: fix unbalanced rpm put() with fence_fini()
Date: Tue,  8 Oct 2024 11:47:24 +0100
Message-ID: <20241008104723.98300-3-matthew.auld@intel.com>
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

Fixes: 0a382f9bc5dc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 26 ++++++++-------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 -
 drivers/gpu/drm/xe/xe_vm.c                  |  8 ++-----
 3 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 98616de0c5bb..3eca8d680533 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,6 +37,12 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 	return hw_tlb_timeout + 2 * delay;
 }
 
+static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	xe_pm_runtime_put(gt_to_xe(fence->gt));
+	fence->gt = NULL; /* fini() should be called once */
+}
+
 static void
 __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -204,7 +210,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 						   tlb_timeout_jiffies(gt));
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	} else if (ret < 0) {
+	} else {
 		__invalidation_fence_signal(xe, fence);
 	}
 	if (!ret) {
@@ -267,10 +273,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
-		if (ret < 0) {
-			xe_gt_tlb_invalidation_fence_fini(&fence);
+		if (ret)
 			return ret;
-		}
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
@@ -498,7 +502,8 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * @stack: fence is stack variable
  *
  * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
- * must be called if fence is not signaled.
+ * will be automatically called when fence is signalled (all fences must signal),
+ * even on error.
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
@@ -518,14 +523,3 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
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

