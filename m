Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA42BC3DA46
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D010E0E4;
	Sat,  6 Jul 2024 00:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eY1bkqox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0911410E008
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224137; x=1751760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IIo+rNXJnC23X1DW23RPDihJmGboyEopzRWluL6sIM=;
 b=eY1bkqox3UWOQVADXF1tpZ5cD4mu+Am1y/W7X3XH1wQ6UPm+BpqgMoaR
 BP79tDymEMgn4zEiyAKR/u6JXNoCz5L8J3YjTX2J0/Yodct2VVynOtrHy
 VAFTZ7arS+eWdWMHvbYWl82VZdzGZ2hvm/7eJRKsK4KdDXNxvIoFiYP9R
 nQOb6hLlwSJEMfSy5mIdxiTkum0bpEHB1CobNczrXcrFHwjn086/2MNba
 iJuKK+LJitJUKdzYyD8PpdF6MyEi//M+/wwQ70/TNYwaFvz9HEBFWlYf6
 5SxDcV0pG2LIlN8b+DENEW3EbsVJ2RJ9sXDVRdwS8plL6DUkCed/7zCL+ g==;
X-CSE-ConnectionGUID: A7lCrQuzTvOcUFJzmAmSwA==
X-CSE-MsgGUID: ym3QTKxCTAeOhSBeW11CXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464655"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464655"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
X-CSE-ConnectionGUID: 96HkJd3xRl2bCa5LeIggIQ==
X-CSE-MsgGUID: X2t8uxbLTNCFlAl39nhuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128239"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 02/11] drm/xe: Drop xe_gt_tlb_invalidation_wait
Date: Fri,  5 Jul 2024 17:02:43 -0700
Message-Id: <20240706000252.702044-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 103 ++++++--------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   7 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   2 -
 drivers/gpu/drm/xe/xe_vm.c                  |  28 +++---
 4 files changed, 51 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 64a3a25f70c2..687214d07ac7 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -111,7 +111,6 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
-	struct xe_guc *guc = &gt->uc.guc;
 	int pending_seqno;
 
 	/*
@@ -134,7 +133,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	else
 		pending_seqno = gt->tlb_invalidation.seqno - 1;
 	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
-	wake_up_all(&guc->ct.wq);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
@@ -165,6 +163,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	int seqno;
 	int ret;
 
+	xe_gt_assert(gt, fence);
+
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
 	 * in order which they currently are, if that changes the algorithm will
@@ -173,10 +173,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 
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
@@ -209,7 +207,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			TLB_INVALIDATION_SEQNO_MAX;
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
-		ret = seqno;
 	}
 	mutex_unlock(&guc->ct.lock);
 
@@ -223,14 +220,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
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
@@ -238,7 +237,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
 
-	return send_tlb_invalidation(&gt->uc.guc, NULL, action,
+	return send_tlb_invalidation(&gt->uc.guc, fence, action,
 				     ARRAY_SIZE(action));
 }
 
@@ -257,13 +256,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
-		int seqno;
+		struct xe_gt_tlb_invalidation_fence fence;
+		int ret;
 
-		seqno = xe_gt_tlb_invalidation_guc(gt);
-		if (seqno <= 0)
-			return seqno;
+		xe_gt_tlb_invalidation_fence_init(gt, &fence);
+		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
+		if (ret < 0)
+			return ret;
 
-		xe_gt_tlb_invalidation_wait(gt, seqno);
+		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		if (IS_SRIOV_VF(xe))
 			return 0;
@@ -290,18 +291,16 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
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
@@ -312,11 +311,11 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
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
 
@@ -382,12 +381,10 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
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
@@ -400,43 +397,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
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
@@ -480,12 +440,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
@@ -541,4 +496,6 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 		       &gt->tlb_invalidation.lock,
 		       dma_fence_context_alloc(1), 1);
 	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	INIT_LIST_HEAD(&fence->link);
+	dma_fence_get(&fence->base);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 948f4a2f5214..cbf49b3d0265 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -23,10 +23,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence);
 
+static inline void
+xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	dma_fence_wait(&fence->base, false);
+}
+
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ff4ca19e31f0..1caa99b22c73 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1356,9 +1356,7 @@ static void invalidation_fence_init(struct xe_gt *gt,
 	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
 
 	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base);
-	INIT_LIST_HEAD(&ifence->base.link);
 
-	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
 	ifence->start = start;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cf3aea5d8cdc..478932fb7718 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3176,8 +3176,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
+	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
 	u32 tile_needs_invalidate = 0;
-	int seqno[XE_MAX_TILES_PER_DEVICE];
 	u8 id;
 	int ret;
 
@@ -3204,29 +3204,31 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (xe_pt_zap_ptes(tile, vma)) {
-			tile_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[id]);
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

