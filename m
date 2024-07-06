Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EE4C3DA45
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EDD10E1E9;
	Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXz8NJqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB0310E0E4
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WuoG3Q6ZRjbPooIS9Yzzw6vlfPnXoRXDp/cVTYwh0jE=;
 b=IXz8NJqQ9wdH5/SfosLb94qrEpqVlJAVUA1mCgj7SuOQY6E9gPADUVK/
 8uNkaqawSSwQlc8LvJMUCnIw4IWDJqoS6O4+hoHXjHPWe0PlHgVgEB1/c
 AI5nRxJntnFYnwVPIMzlJuAAex8kJTiWKNKZDgFftyjo5aIl2A8qtFq4p
 QIsMQmKBlBPmXeMU6vwKhvV/L0axv83w15wramUsjso8ZZ19AJNwzhiRr
 +dm3gqMHGYE7dCK4JWneAosd0/20jRiEDj3YUYDwNUcEX3w9vumD9UX+0
 caED5Eoz3kmnHlusxJFySP5ATdo7ptX5/iQFFiVGPJT0yYER0ffuaBRdA A==;
X-CSE-ConnectionGUID: B4blZPR7ShmEkFld2DjOEA==
X-CSE-MsgGUID: kQZ9rmMLQM+PeESnAPjnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464660"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:15 -0700
X-CSE-ConnectionGUID: pMakNs8eRz2k+jxrlMYw2A==
X-CSE-MsgGUID: aQ7HlwVXS82Zb3MmnxDNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128253"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 06/11] drm/xe: Add send tlb invalidation helpers
Date: Fri,  5 Jul 2024 17:02:47 -0700
Message-Id: <20240706000252.702044-7-matthew.brost@intel.com>
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

Break GuC specific code into dedicated functions.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 166 ++++++++++----------
 1 file changed, 84 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 3eca77eb3211..172e55d8d45e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -157,13 +157,11 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
-static int send_tlb_invalidation(struct xe_guc *guc,
-				 struct xe_gt_tlb_invalidation_fence *fence,
-				 u32 *action, int len)
+static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 
-	xe_gt_assert(gt, fence);
+	xe_gt_assert(gt, action[1]);	/* Seqno */
 	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
 
 	/*
@@ -172,11 +170,86 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	action[1] = fence->seqno;
 	return xe_guc_ct_send(&guc->ct, action, len,
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
 }
 
+#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+
+static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		seqno,
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
+	};
+
+	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
+}
+
+static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
+				       u32 asid, int seqno)
+{
+#define MAX_TLB_INVALIDATION_LEN	7
+	u32 action[MAX_TLB_INVALIDATION_LEN];
+	int len = 0;
+
+	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+	action[len++] = seqno;
+	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+	} else {
+		u64 orig_start = start;
+		u64 length = end - start;
+		u64 align;
+
+		if (length < SZ_4K)
+			length = SZ_4K;
+
+		/*
+		 * We need to invalidate a higher granularity if start address
+		 * is not aligned to length. When start is not aligned with
+		 * length we need to find the length large enough to create an
+		 * address mask covering the required range.
+		 */
+		align = roundup_pow_of_two(length);
+		start = ALIGN_DOWN(start, align);
+		end = ALIGN(end, align);
+		length = align;
+		while (start + length < end) {
+			length <<= 1;
+			start = ALIGN_DOWN(orig_start, length);
+		}
+
+		/*
+		 * Minimum invalidation size for a 2MB page that the hardware
+		 * expects is 16MB
+		 */
+		if (length >= SZ_2M) {
+			length = max_t(u64, SZ_16M, length);
+			start = ALIGN_DOWN(orig_start, length);
+		}
+
+		xe_gt_assert(gt, length >= SZ_4K);
+		xe_gt_assert(gt, is_power_of_2(length));
+		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
+						    ilog2(SZ_2M) + 1)));
+		xe_gt_assert(gt, IS_ALIGNED(start, length));
+
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+		action[len++] = asid;
+		action[len++] = lower_32_bits(start);
+		action[len++] = upper_32_bits(start);
+		action[len++] = ilog2(length) - ilog2(SZ_4K);
+	}
+
+	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
+
+	return send_tlb_invalidation(&gt->uc.guc, action, len);
+}
+
 static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
 					      struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -211,33 +284,16 @@ static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
 		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
 		XE_GUC_TLB_INVAL_FLUSH_CACHE)
 
-/**
- * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
- * @gt: graphics tile
- * @fence: invalidation fence which will be signal on TLB invalidation
- * completion
- *
- * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
- * caller can use the invalidation fence to wait for completion.
- *
- * Return: 0 on success, negative error code on error
- */
-static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
-				      struct xe_gt_tlb_invalidation_fence *fence)
+static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
+					 struct xe_gt_tlb_invalidation_fence *fence)
 {
-	u32 action[] = {
-		XE_GUC_ACTION_TLB_INVALIDATION,
-		0,  /* seqno, replaced in send_tlb_invalidation */
-		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
-	};
 	int ret;
 
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
 	xe_gt_tlb_invalidation_fence_prep(gt, fence);
 
-	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
-				    ARRAY_SIZE(action));
+	ret = send_tlb_invalidation_ggtt(gt, fence->seqno);
 	if (ret < 0)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 
@@ -265,7 +321,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 		int ret;
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence);
-		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
+		ret = __xe_gt_tlb_invalidation_ggtt(gt, &fence);
 		if (ret < 0)
 			return ret;
 
@@ -312,75 +368,21 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-#define MAX_TLB_INVALIDATION_LEN	7
-	u32 action[MAX_TLB_INVALIDATION_LEN];
-	int len = 0;
 	int ret;
 
 	xe_gt_assert(gt, fence);
 
 	/* Execlists not supported */
-	if (gt_to_xe(gt)->info.force_execlist) {
+	if (xe->info.force_execlist) {
 		__invalidation_fence_signal(xe, fence);
 		return 0;
 	}
 
-	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
-	if (!xe->info.has_range_tlb_invalidation) {
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
-	} else {
-		u64 orig_start = start;
-		u64 length = end - start;
-		u64 align;
-
-		if (length < SZ_4K)
-			length = SZ_4K;
-
-		/*
-		 * We need to invalidate a higher granularity if start address
-		 * is not aligned to length. When start is not aligned with
-		 * length we need to find the length large enough to create an
-		 * address mask covering the required range.
-		 */
-		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(start, align);
-		end = ALIGN(end, align);
-		length = align;
-		while (start + length < end) {
-			length <<= 1;
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		/*
-		 * Minimum invalidation size for a 2MB page that the hardware
-		 * expects is 16MB
-		 */
-		if (length >= SZ_2M) {
-			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		xe_gt_assert(gt, length >= SZ_4K);
-		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
-						    ilog2(SZ_2M) + 1)));
-		xe_gt_assert(gt, IS_ALIGNED(start, length));
-
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = asid;
-		action[len++] = lower_32_bits(start);
-		action[len++] = upper_32_bits(start);
-		action[len++] = ilog2(length) - ilog2(SZ_4K);
-	}
-
-	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
-
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
 	xe_gt_tlb_invalidation_fence_prep(gt, fence);
 
-	ret = send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	ret = send_tlb_invalidation_ppgtt(gt, start, end, asid, fence->seqno);
 	if (ret < 0)
 		invalidation_fence_signal(xe, fence);
 
-- 
2.34.1

