Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6732AC3DA70
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233A310EC5F;
	Fri, 19 Jul 2024 16:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShHgDlhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732410EC59
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407768; x=1752943768;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5h6jc2nZtcu2D4h6JLpw6KxY3cJH4fRPMHdzE/SCaeU=;
 b=ShHgDlhKIolrjABuKk14UfD7g30BCenu+sgaHrd0hrnMSthiusOn8SDS
 lCjcUSl7eluQs0744/uzKp333X56BL1DOtzE/f83Kjuk7+06Y8KWQRAoS
 MR1P+exJmNBWqY1Rx+j+NDorUM4y5idyrpIrcMqY2i4MnGdSrAl/nZ57f
 ayC6rPxRHGIa0t/b+dsCTN9Mgnf487YeqrHQfMXaI0Q7M8ORi8HEWgxTI
 xG+VP95tafiQrFGn9Iy8k25O8rjPrTbaC4qx08aev7ZSBBAuUJ5r6mLUs
 n2+zg8W6kueh3tLk0BNN7PZf/npqY5DUBctQefbMLb0q8nx7kBdAj3t5l g==;
X-CSE-ConnectionGUID: X+nyHBxKQ1GrhWxrXjhzPA==
X-CSE-MsgGUID: Qz2kLR5pSH2qTg7fnt0lBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18651479"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18651479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:49:27 -0700
X-CSE-ConnectionGUID: pcJnXu8DQOW0vUOxzzxefg==
X-CSE-MsgGUID: 39FMOqfmTGecEDt1IdJJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51192719"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:49:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 3/4] drm/xe: Hold a PM ref when GT TLB invalidations are
 inflight
Date: Fri, 19 Jul 2024 09:50:11 -0700
Message-Id: <20240719165012.1512428-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719165012.1512428-1-matthew.brost@intel.com>
References: <20240719165012.1512428-1-matthew.brost@intel.com>
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
v3:
 - Move invalidation_fence_signal helper in tlb timeout to previous
   patch (Matthew Auld)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 23 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  1 +
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_vm.c                    |  4 +++-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c3419d4412ce..481d83d07367 100644
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
@@ -41,6 +42,7 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
 	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
 
 	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
+	xe_gt_tlb_invalidation_fence_fini(fence);
 	dma_fence_signal(&fence->base);
 	if (!stack)
 		dma_fence_put(&fence->base);
@@ -263,8 +265,10 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
-		if (ret < 0)
+		if (ret < 0) {
+			xe_gt_tlb_invalidation_fence_fini(&fence);
 			return ret;
+		}
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
@@ -489,12 +493,15 @@ static const struct dma_fence_ops invalidation_fence_ops = {
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
@@ -505,4 +512,16 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
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
index 6c456d6ebd5b..3fde2c8292ad 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3222,8 +3222,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
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

