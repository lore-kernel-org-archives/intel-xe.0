Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA2C0032E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C7510E4B5;
	Tue,  7 Nov 2023 05:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F4310E4AE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoL5a1pL7HhEl2zF9o917nx/hQ1xn+iR2C2GkB9g86M=;
 b=dxsNdJ8rHgFSfRZilQnxoIB+oNV8S2BjFV6SuZbgauiTsRnWar7EKN+h
 FkFF2zPOkjTzSenW2TnkkNTsFYuE7GUMKhwzElTGEoEwNWU6nTDtAXs6W
 T81G+iGwBUnkl4NsH+8QP9XYkXD4oagDLOv4CNk5BqMBZqC+CyIHvzuoP
 Tdm5PCiAgW2QsYbSVUv9QvzC5gXOTRLJ0tpCCGG0MwZqZrUly6ChhkDUS
 ljnAgiE9BLTuWMhvMTuyTD5KSkGkz17LqDi3tT0FVp5E6MbpzER1aRLWA
 sR3DFmDehzUJFI6JTh/letOszjfjkQZX5Zojt3Okx6CtLV/8pANPzUF2m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769530"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769530"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689872"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689872"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:55 -0800
Message-Id: <20231107052603.124361-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 19/27] drm/xe: Add
 xe_gt_tlb_invalidation_range and convert PT layer to use this
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
index b5c39c55e1fa..9a6408d3f0fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -227,11 +227,15 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
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
@@ -241,24 +245,22 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
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
@@ -271,12 +273,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
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
@@ -285,16 +287,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
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
@@ -303,6 +306,33 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
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
index f06ceaea98cf..0050ab6aad05 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1111,10 +1111,12 @@ static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
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
@@ -1157,13 +1159,14 @@ static void invalidation_fence_work_func(struct work_struct *w)
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
 
@@ -1181,7 +1184,9 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
-	ifence->vma = vma;
+	ifence->start = start;
+	ifence->end = end;
+	ifence->asid = asid;
 
 	INIT_WORK(&ifence->work, invalidation_fence_work_func);
 	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
@@ -1323,8 +1328,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 
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
@@ -1662,7 +1670,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
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

