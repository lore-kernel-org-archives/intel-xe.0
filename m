Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC09BCA0EE7
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 19:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C778510E7BF;
	Wed, 13 Aug 2025 19:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwjU3AW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C36B10E7B8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755114493; x=1786650493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYptiOrWZWgHRSPQ4QNay1XHsgyWPCa2/0H2QPkW64g=;
 b=MwjU3AW48J4W99/iC5EYmWTj8yMVZAT4w044UGQRIncFz/NgeDzJedoF
 K9fgGzgl43tl+8DQwQzLSaV7Ne13zebz596FLpFT/+d+XNQaa2Qiw4Deg
 MLTqb/StN/aSrHX9UmV0z93PF2YrZ2K7dvWYFd+j7bbOXu8m+36Pa6iek
 DypNsyc/MPTIT7s3GCeGpDXO6t4204yZBkVqJkeKTOrHZ60Od97HMX57G
 hiNP65VXE5B3VJ6MCkrB4fFG8vo2CqJFSq959b3SWTbZapvP8LEwRMuIb
 Qk0kkBnZeZjiDyJogLWa/7nnu1cOp6e5bpnMRYljCaD6Swox/oYHadHUj A==;
X-CSE-ConnectionGUID: T66o0yRUSA2OofWhU/Y90w==
X-CSE-MsgGUID: grd5s2fKRc6ASKH8JNZipg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60047023"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60047023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
X-CSE-ConnectionGUID: rbFapQ8zTvKvAIVtXyjzFw==
X-CSE-MsgGUID: rjWOd+6QR2axWgCpwZDqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166206201"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:13 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 8/9] drm/xe: Add helpers to send TLB invalidations
Date: Wed, 13 Aug 2025 19:48:05 +0000
Message-Id: <20250813194806.140500-9-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813194806.140500-1-stuart.summers@intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Break out the GuC specific code into helpers as part of the process to
decouple frontback TLB invalidation code from the backend.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 234 +++++++++++++++---------------
 1 file changed, 117 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 1fbe109701ca..e6af305a01a2 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -211,12 +211,11 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
-static int send_tlb_inval(struct xe_guc *guc, struct xe_tlb_inval_fence *fence,
-			  u32 *action, int len)
+static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 
-	xe_gt_assert(gt, fence);
+	xe_gt_assert(gt, action[1]);	/* Seqno */
 
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
@@ -225,7 +224,6 @@ static int send_tlb_inval(struct xe_guc *guc, struct xe_tlb_inval_fence *fence,
 	 */
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
-	action[1] = fence->seqno;
 
 	return xe_guc_ct_send(&guc->ct, action, len,
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
@@ -260,91 +258,15 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
 		XE_GUC_TLB_INVAL_FLUSH_CACHE)
 
-/**
- * xe_tlb_inval_guc - Issue a TLB invalidation on this GT for the GuC
- * @gt: GT structure
- * @fence: invalidation fence which will be signal on TLB invalidation
- * completion
- *
- * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
- * caller can use the invalidation fence to wait for completion.
- *
- * Return: 0 on success, negative error code on error
- */
-static int xe_tlb_inval_guc(struct xe_gt *gt,
-			    struct xe_tlb_inval_fence *fence)
+static int send_tlb_inval_ggtt(struct xe_gt *gt, int seqno)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION,
-		0,  /* seqno, replaced in send_tlb_inval */
+		seqno,
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
-	int ret;
-
-	mutex_lock(&gt->tlb_inval.seqno_lock);
-	xe_tlb_inval_fence_prep(fence);
-
-	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
-	if (ret < 0)
-		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
-	mutex_unlock(&gt->tlb_inval.seqno_lock);
-
-	/*
-	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
-	 *  should be nuked on a GT reset so this error can be ignored.
-	 */
-	if (ret == -ECANCELED)
-		return 0;
-
-	return ret;
-}
-
-/**
- * xe_tlb_inval_ggtt - Issue a TLB invalidation on this GT for the GGTT
- * @tlb_inval: TLB invalidation client
- *
- * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
- * synchronous.
- *
- * Return: 0 on success, negative error code on error
- */
-int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
-{
-	struct xe_gt *gt = tlb_inval->private;
-	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
-
-	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
-	    gt->uc.guc.submission_state.enabled) {
-		struct xe_tlb_inval_fence fence;
-		int ret;
-
-		xe_tlb_inval_fence_init(tlb_inval, &fence, true);
-		ret = xe_tlb_inval_guc(gt, &fence);
-		if (ret)
-			return ret;
-
-		xe_tlb_inval_fence_wait(&fence);
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
-		struct xe_mmio *mmio = &gt->mmio;
 
-		if (IS_SRIOV_VF(xe))
-			return 0;
-
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
-					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
-					PVC_GUC_TLB_INV_DESC0_VALID);
-		} else {
-			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
-					GUC_TLB_INV_CR_INVALIDATE);
-		}
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	}
-
-	return 0;
+	return send_tlb_inval(&gt->uc.guc, action, ARRAY_SIZE(action));
 }
 
 static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
@@ -359,7 +281,7 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, fence);
 
-	return send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	return send_tlb_inval(&gt->uc.guc, action, ARRAY_SIZE(action));
 }
 
 /**
@@ -391,43 +313,17 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-/**
- * xe_tlb_inval_range - Issue a TLB invalidation on this GT for an address range
- * @tlb_inval: TLB invalidation client
- * @fence: invalidation fence which will be signal on TLB invalidation
- * completion
- * @start: start address
- * @end: end address
- * @asid: address space id
- *
- * Issue a range based TLB invalidation if supported, if not fallback to a full
- * TLB invalidation. Completion of TLB is asynchronous and caller can use
- * the invalidation fence to wait for completion.
- *
- * Return: Negative error code on error, 0 on success
- */
-int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
-		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
-		       u32 asid)
+static int send_tlb_inval_ppgtt(struct xe_gt *gt, u64 start, u64 end,
+				u32 asid, int seqno)
 {
-	struct xe_gt *gt = tlb_inval->private;
-	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
-	int len = 0, ret;
-
-	xe_gt_assert(gt, fence);
-
-	/* Execlists not supported */
-	if (gt_to_xe(gt)->info.force_execlist) {
-		__inval_fence_signal(xe, fence);
-		return 0;
-	}
+	int len = 0;
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-	action[len++] = 0; /* seqno, replaced in send_tlb_inval */
-	if (!xe->info.has_range_tlb_inval ||
+	action[len++] = seqno;
+	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
@@ -476,11 +372,115 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
+	return send_tlb_inval(&gt->uc.guc, action, len);
+}
+
+static int __xe_tlb_inval_ggtt(struct xe_gt *gt,
+			       struct xe_tlb_inval_fence *fence)
+{
+	int ret;
+
+	mutex_lock(&gt->tlb_inval.seqno_lock);
+	xe_tlb_inval_fence_prep(fence);
+
+	ret = send_tlb_inval_ggtt(gt, fence->seqno);
+	if (ret < 0)
+		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
+	mutex_unlock(&gt->tlb_inval.seqno_lock);
+
+	/*
+	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
+	 *  should be nuked on a GT reset so this error can be ignored.
+	 */
+	if (ret == -ECANCELED)
+		return 0;
+
+	return ret;
+}
+
+/**
+ * xe_tlb_inval_ggtt - Issue a TLB invalidation on this GT for the GGTT
+ * @tlb_inval: TLB invalidation client
+ *
+ * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
+ * synchronous.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
+{
+	struct xe_gt *gt = tlb_inval->private;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
+
+	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
+	    gt->uc.guc.submission_state.enabled) {
+		struct xe_tlb_inval_fence fence;
+		int ret;
+
+		xe_tlb_inval_fence_init(tlb_inval, &fence, true);
+		ret = __xe_tlb_inval_ggtt(gt, &fence);
+		if (ret)
+			return ret;
+
+		xe_tlb_inval_fence_wait(&fence);
+	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+		struct xe_mmio *mmio = &gt->mmio;
+
+		if (IS_SRIOV_VF(xe))
+			return 0;
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
+					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
+					PVC_GUC_TLB_INV_DESC0_VALID);
+		} else {
+			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
+					GUC_TLB_INV_CR_INVALIDATE);
+		}
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+
+	return 0;
+}
+
+/**
+ * xe_tlb_inval_range - Issue a TLB invalidation on this GT for an address range
+ * @tlb_inval: TLB invalidation client
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion
+ * @start: start address
+ * @end: end address
+ * @asid: address space id
+ *
+ * Issue a range based TLB invalidation if supported, if not fallback to a full
+ * TLB invalidation. Completion of TLB is asynchronous and caller can use
+ * the invalidation fence to wait for completion.
+ *
+ * Return: Negative error code on error, 0 on success
+ */
+int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
+		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
+		       u32 asid)
+{
+	struct xe_gt *gt = tlb_inval->private;
+	struct xe_device *xe = gt_to_xe(gt);
+	int  ret;
+
+	xe_gt_assert(gt, fence);
+
+	/* Execlists not supported */
+	if (xe->info.force_execlist) {
+		__inval_fence_signal(xe, fence);
+		return 0;
+	}
+
 	mutex_lock(&gt->tlb_inval.seqno_lock);
 	xe_tlb_inval_fence_prep(fence);
 
-	ret = send_tlb_inval(&gt->uc.guc, fence, action,
-			     ARRAY_SIZE(action));
+	ret = send_tlb_inval_ppgtt(gt, start, end, asid, fence->seqno);
 	if (ret < 0)
 		inval_fence_signal_unlocked(xe, fence);
 	mutex_unlock(&gt->tlb_inval.seqno_lock);
-- 
2.34.1

