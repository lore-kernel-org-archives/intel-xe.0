Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DEFC3DA62
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E74110E57A;
	Thu, 18 Jul 2024 06:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXtJhBd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AE110E57B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285934; x=1752821934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFNgA9MhElnj43VRPF1bAwfA1fFybDWZA5gCvuWrKeY=;
 b=hXtJhBd8ljBg9iyDPz/IqKGUKQuAxTsC0LCmI1OzzenPSPLMebQU27x9
 mEN7zLYgQkRYz3OpVe1VuXfeEe/lhuS21cNWTtW5YfjJfmNppaeQ7eaGa
 fmuMrGMnBNXM9T7te6dYN5vrCnAyShjAMdhBU3366467c+vlvYxRAaZXR
 FLe2jVOwtUxjvF5wrbvknf1vjLOM1EIe7CZLWXtUc76bN5/ySAvagx88v
 U330EF3Dst8TaQajeOF8f7huQViOprkaurkNdAMMMsJG2hr/bZHVlHs6i
 FV55ZBycDPfpGdIiHbaaLaw/xT9UEXswTsaJcL1h/oGTWUU12Rif6nvl0 w==;
X-CSE-ConnectionGUID: TV+dgI1mRWeZc0b+vgQ4oQ==
X-CSE-MsgGUID: //zGGF9vRJau7sg3fLNuDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18639349"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18639349"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
X-CSE-ConnectionGUID: 3soUl7fmRIurp3MDm7gYSg==
X-CSE-MsgGUID: C+M2OqIOSg+sZvz4t/T4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="51279285"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 2/3] drm/xe: Drop xe_gt_tlb_invalidation_wait
Date: Wed, 17 Jul 2024 23:59:34 -0700
Message-Id: <20240718065935.1451330-3-matthew.brost@intel.com>
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

Having two methods to wait on GT TLB invalidations is not ideal. Remove
xe_gt_tlb_invalidation_wait and only use GT TLB invalidation fences.

In addition to two methods being less than ideal, once GT TLB
invalidations are coalesced the seqno cannot be assigned during
xe_gt_tlb_invalidation_ggtt/range. Thus xe_gt_tlb_invalidation_wait
would not have a seqno to wait one. A fence however can be armed and
later signaled.

v3:
 - Add explaination about coalescing to commit message
v4:
 - Don't put dma fence if defined on stack (CI)
v5:
 - Initialize ret to zero (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 117 +++++++-------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  10 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                  |  30 ++---
 4 files changed, 66 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 92a18a0e4acd..668c1a3f06ac 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,6 +17,8 @@
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
 
+#define FENCE_STACK_BIT		DMA_FENCE_FLAG_USER_BITS
+
 /*
  * TLB inval depends on pending commands in the CT queue and then the real
  * invalidation time. Double up the time to process full CT queue
@@ -90,9 +92,12 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 static void
 __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
 {
+	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
+
 	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
 	dma_fence_signal(&fence->base);
-	dma_fence_put(&fence->base);
+	if (!stack)
+		dma_fence_put(&fence->base);
 }
 
 static void
@@ -111,7 +116,6 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
-	struct xe_guc *guc = &gt->uc.guc;
 	int pending_seqno;
 
 	/*
@@ -134,7 +138,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	else
 		pending_seqno = gt->tlb_invalidation.seqno - 1;
 	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
-	wake_up_all(&guc->ct.wq);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
@@ -165,6 +168,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	int seqno;
 	int ret;
 
+	xe_gt_assert(gt, fence);
+
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
 	 * in order which they currently are, if that changes the algorithm will
@@ -173,10 +178,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
-	if (fence) {
-		fence->seqno = seqno;
-		trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
-	}
+	fence->seqno = seqno;
+	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
@@ -209,7 +212,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			TLB_INVALIDATION_SEQNO_MAX;
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
-		ret = seqno;
 	}
 	mutex_unlock(&guc->ct.lock);
 
@@ -223,14 +225,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 /**
  * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
  * @gt: graphics tile
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion
  *
  * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
- * caller can use seqno + xe_gt_tlb_invalidation_wait to wait for completion.
+ * caller can use the invalidation fence to wait for completion.
  *
- * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
- * negative error code on error.
+ * Return: 0 on success, negative error code on error
  */
-static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
+static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
+				      struct xe_gt_tlb_invalidation_fence *fence)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION,
@@ -238,7 +242,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
 
-	return send_tlb_invalidation(&gt->uc.guc, NULL, action,
+	return send_tlb_invalidation(&gt->uc.guc, fence, action,
 				     ARRAY_SIZE(action));
 }
 
@@ -257,13 +261,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
-		int seqno;
+		struct xe_gt_tlb_invalidation_fence fence;
+		int ret;
 
-		seqno = xe_gt_tlb_invalidation_guc(gt);
-		if (seqno <= 0)
-			return seqno;
+		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
+		if (ret < 0)
+			return ret;
 
-		xe_gt_tlb_invalidation_wait(gt, seqno);
+		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		if (IS_SRIOV_VF(xe))
 			return 0;
@@ -290,18 +296,16 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
  *
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
- * completion, can be NULL
+ * completion
  * @start: start address
  * @end: end address
  * @asid: address space id
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
- * TLB invalidation. Completion of TLB is asynchronous and caller can either use
- * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
- * completion.
+ * TLB invalidation. Completion of TLB is asynchronous and caller can use
+ * the invalidation fence to wait for completion.
  *
- * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
- * negative error code on error.
+ * Return: Negative error code on error, 0 on success
  */
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
@@ -312,11 +316,11 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
+	xe_gt_assert(gt, fence);
+
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
-		if (fence)
-			__invalidation_fence_signal(xe, fence);
-
+		__invalidation_fence_signal(xe, fence);
 		return 0;
 	}
 
@@ -382,12 +386,10 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
  * @vma: VMA to invalidate
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
- * TLB invalidation. Completion of TLB is asynchronous and caller can either use
- * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
- * completion.
+ * TLB invalidation. Completion of TLB is asynchronous and caller can use
+ * the invalidation fence to wait for completion.
  *
- * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
- * negative error code on error.
+ * Return: Negative error code on error, 0 on success
  */
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
@@ -400,43 +402,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 					    xe_vma_vm(vma)->usm.asid);
 }
 
-/**
- * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
- * @gt: graphics tile
- * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
- *
- * Wait for tlb_timeout_jiffies() for a TLB invalidation to complete.
- *
- * Return: 0 on success, -ETIME on TLB invalidation timeout
- */
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
-{
-	struct xe_guc *guc = &gt->uc.guc;
-	int ret;
-
-	/* Execlists not supported */
-	if (gt_to_xe(gt)->info.force_execlist)
-		return 0;
-
-	/*
-	 * XXX: See above, this algorithm only works if seqno are always in
-	 * order
-	 */
-	ret = wait_event_timeout(guc->ct.wq,
-				 tlb_invalidation_seqno_past(gt, seqno),
-				 tlb_timeout_jiffies(gt));
-	if (!ret) {
-		struct drm_printer p = xe_gt_err_printer(gt);
-
-		xe_gt_err(gt, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			  seqno, gt->tlb_invalidation.seqno_recv);
-		xe_guc_ct_print(&guc->ct, &p, true);
-		return -ETIME;
-	}
-
-	return 0;
-}
-
 /**
  * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
  * @guc: guc
@@ -480,12 +445,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return 0;
 	}
 
-	/*
-	 * wake_up_all() and wait_event_timeout() already have the correct
-	 * barriers.
-	 */
 	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
-	wake_up_all(&guc->ct.wq);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
@@ -530,11 +490,13 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation fence
  * @gt: GT
  * @fence: TLB invalidation fence to initialize
+ * @stack: fence is stack variable
  *
  * Initialize TLB invalidation fence for use
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
-				       struct xe_gt_tlb_invalidation_fence *fence)
+				       struct xe_gt_tlb_invalidation_fence *fence,
+				       bool stack)
 {
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
@@ -542,5 +504,8 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 		       dma_fence_context_alloc(1), 1);
 	spin_unlock_irq(&gt->tlb_invalidation.lock);
 	INIT_LIST_HEAD(&fence->link);
-	dma_fence_get(&fence->base);
+	if (stack)
+		set_bit(FENCE_STACK_BIT, &fence->base.flags);
+	else
+		dma_fence_get(&fence->base);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 948f4a2f5214..f430d5797af7 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -23,10 +23,16 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
-				       struct xe_gt_tlb_invalidation_fence *fence);
+				       struct xe_gt_tlb_invalidation_fence *fence,
+				       bool stack);
+
+static inline void
+xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	dma_fence_wait(&fence->base, false);
+}
 
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1caa99b22c73..c24e869b7eae 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1355,7 +1355,7 @@ static void invalidation_fence_init(struct xe_gt *gt,
 
 	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
 
-	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base);
+	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
 
 	ifence->fence = fence;
 	ifence->gt = gt;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b6932cc98ff9..4a29d5be7310 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3180,10 +3180,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
+	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
 	u32 tile_needs_invalidate = 0;
-	int seqno[XE_MAX_TILES_PER_DEVICE];
 	u8 id;
-	int ret;
+	int ret = 0;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
 	trace_xe_vma_invalidate(vma);
@@ -3208,29 +3208,31 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (xe_pt_zap_ptes(tile, vma)) {
-			tile_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[id], true);
+
 			/*
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
-			if (seqno[id] < 0)
-				return seqno[id];
-		}
-	}
-
-	for_each_tile(tile, xe, id) {
-		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
+			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
+							 &fence[id], vma);
 			if (ret < 0)
-				return ret;
+				goto wait;
+
+			tile_needs_invalidate |= BIT(id);
 		}
 	}
 
+wait:
+	for_each_tile(tile, xe, id)
+		if (tile_needs_invalidate & BIT(id))
+			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+
 	vma->tile_invalidated = vma->tile_mask;
 
-	return 0;
+	return ret;
 }
 
 struct xe_vm_snapshot {
-- 
2.34.1

