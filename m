Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1456FC4829F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6C112F71;
	Tue,  6 Feb 2024 23:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhzIgC0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B155112F65
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dr0mlGNZwqo+48BMtEd72HvGBHIjEEluostn5wYXIA=;
 b=BhzIgC0tpc4gnF5XaX2lbjkK53t0jVzbPWCRMBx5yyQnx0uHA5pLGzH7
 QRTmptHo70nRbG9v/FaUS8tz8OPn3TfW/vYd9Mvm20rv9Z/DddhKV+N81
 M43Aifgfddkci6QuMu7OlQSOzZxaPYSTznQ8KqJoMLrZRmokSp/cIUsK+
 pweVqbAn1UgFHj4+H15Jm3iN8UaIGasha+6dMQJaPpz2NJL0Mh4M7K0n1
 mUpeCdHU/WsmaK2hkOwRoTqQAS6cBH79Gb8pzbqxJz9HmyCeARnF3FjFQ
 xQ3bgQCQWw9zsHDXqNLvrwlSmC2sI5E/B9fofKcEigREgOT9YuAWPtHN2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776794"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793812"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 11/22] drm/xe: Add xe_gt_tlb_invalidation_range and convert
 PT layer to use this
Date: Tue,  6 Feb 2024 15:37:18 -0800
Message-Id: <20240206233729.3173206-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

xe_gt_tlb_invalidation_range accepts a start and end address rather than
a VMA. This will enable multiple VMAs to be invalidated in a single
invalidation. Update the PT layer to use this new function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 60 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
 drivers/gpu/drm/xe/xe_pt.c                  | 25 ++++++---
 3 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e3a4131ebb58..3babc143abc3 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -223,11 +223,15 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
+ * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
+ * address range
+ *
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
- * @vma: VMA to invalidate
+ * @start: start address
+ * @end: end address
+ * @asid: address space id
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
  * TLB invalidation. Completion of TLB is asynchronous and caller can either use
@@ -237,24 +241,22 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma)
+int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
+				 struct xe_gt_tlb_invalidation_fence *fence,
+				 u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
-	xe_gt_assert(gt, vma);
-
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
 	if (!xe->info.has_range_tlb_invalidation) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 start = xe_vma_start(vma);
-		u64 length = xe_vma_size(vma);
+		u64 orig_start = start;
+		u64 length = end - start;
 		u64 align, end;
 
 		if (length < SZ_4K)
@@ -267,12 +269,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 * address mask covering the required range.
 		 */
 		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(xe_vma_start(vma), align);
-		end = ALIGN(xe_vma_end(vma), align);
+		start = ALIGN_DOWN(start, align);
+		end = ALIGN(end, align);
 		length = align;
 		while (start + length < end) {
 			length <<= 1;
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
+			start = ALIGN_DOWN(orig_start, length);
 		}
 
 		/*
@@ -281,16 +283,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 */
 		if (length >= SZ_2M) {
 			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
+			start = ALIGN_DOWN(orig_start, length);
 		}
 
 		xe_gt_assert(gt, length >= SZ_4K);
 		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
+		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
+						    ilog2(SZ_2M) + 1)));
 		xe_gt_assert(gt, IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = xe_vma_vm(vma)->usm.asid;
+		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
@@ -299,6 +302,33 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+
+}
+
+/**
+ * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
+ * @gt: graphics tile
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion, can be NULL
+ * @vma: VMA to invalidate
+ *
+ * Issue a range based TLB invalidation if supported, if not fallback to a full
+ * TLB invalidation. Completion of TLB is asynchronous and caller can either use
+ * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
+ * completion.
+ *
+ * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
+ * negative error code on error.
+ */
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
+			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_vma *vma)
+{
+	xe_gt_assert(gt, vma);
+
+	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
+					    xe_vma_end(vma),
+					    xe_vma_vm(vma)->usm.asid);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index b333c1709397..5bb09885aa0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -20,6 +20,9 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
+int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
+				 struct xe_gt_tlb_invalidation_fence *fence,
+				 u64 start, u64 end, u32 asid);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3a99bf6e558f..ada5a65e62dc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1058,10 +1058,12 @@ static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
-	struct xe_vma *vma;
 	struct dma_fence *fence;
 	struct dma_fence_cb cb;
 	struct work_struct work;
+	u64 start;
+	u64 end;
+	u32 asid;
 };
 
 static const char *
@@ -1104,13 +1106,14 @@ static void invalidation_fence_work_func(struct work_struct *w)
 		container_of(w, struct invalidation_fence, work);
 
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
+				     ifence->end, ifence->asid);
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
 				   struct invalidation_fence *ifence,
 				   struct dma_fence *fence,
-				   struct xe_vma *vma)
+				   u64 start, u64 end, u32 asid)
 {
 	int ret;
 
@@ -1128,7 +1131,9 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
-	ifence->vma = vma;
+	ifence->start = start;
+	ifence->end = end;
+	ifence->asid = asid;
 
 	INIT_WORK(&ifence->work, invalidation_fence_work_func);
 	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
@@ -1270,8 +1275,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (ifence) {
-			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
-							  vma);
+			int err = invalidation_fence_init(tile->primary_gt,
+							  ifence, fence,
+							  xe_vma_start(vma),
+							  xe_vma_end(vma),
+							  xe_vma_vm(vma)->usm.asid);
 			if (err) {
 				dma_fence_put(fence);
 				kfree(ifence);
@@ -1609,7 +1617,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 			dma_fence_wait(fence, false);
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
+		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
+					      xe_vma_start(vma),
+					      xe_vma_end(vma),
+					      xe_vma_vm(vma)->usm.asid);
 		if (err) {
 			dma_fence_put(fence);
 			kfree(ifence);
-- 
2.34.1

