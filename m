Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A29C87FDA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 19:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDED10E891;
	Thu,  7 Aug 2025 19:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APpKPPmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476CC10E48D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 19:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754595414; x=1786131414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ir0JDnrLUKEbEScfdChDN0IEwzz/ZKtvSC6KdxUzDdg=;
 b=APpKPPmMXFQU9lofxqqMhBE9eS124m1lwfSgTaOpnI3Z/c+pRCPxjTcf
 uWam8AaEr3mlaIcbiIp+9P11cjxarnZIlL2FFasY2dDTX2pwqcwFYJ4SJ
 XAoRlNy71F46DF9H5AOUXvTCyXTQEx7iVACg6pmE63ix2fcVERzhtVHwo
 mxbT+ACOyoYfFBvCcFs1YYOlKBnqKJM9J4+gRSYFkSop5xoBkoslX4Y+n
 jAPY100hFTUApjpGCxCnMDyZa/S/afQ31jppOT7fbn9vVPWw+hbPY5TAu
 kXVq7YXvCDWVvwKj1qu9+f4lfroUSaDRxVm0ipHpDscecuZfQvH47RHa0 g==;
X-CSE-ConnectionGUID: j8KPlqgKQga4ONZqQV67qA==
X-CSE-MsgGUID: lYaNv0SkQ2SXFi1Gsw7R1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56842546"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56842546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 12:36:53 -0700
X-CSE-ConnectionGUID: va6MxM2HQe2CUSZYX3LABg==
X-CSE-MsgGUID: Nd7X6eSOQjavuDvl46AhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202308348"
Received: from dut136arlu.fm.intel.com ([10.105.23.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 12:36:52 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/8] drm/xe: Add helpers to send TLB invalidations
Date: Thu,  7 Aug 2025 19:36:48 +0000
Message-Id: <20250807193649.55399-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807193649.55399-1-stuart.summers@intel.com>
References: <20250807193649.55399-1-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/xe_tlb_inval.c | 230 +++++++++++++++---------------
 1 file changed, 115 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 967e5a261bb6..e1fbd12e9eef 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -208,12 +208,11 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
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
@@ -222,7 +221,6 @@ static int send_tlb_inval(struct xe_guc *guc, struct xe_tlb_inval_fence *fence,
 	 */
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
-	action[1] = fence->seqno;
 
 	return xe_guc_ct_send(&guc->ct, action, len,
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
@@ -259,89 +257,15 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
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
-	xe_tlb_inval_fence_prep(fence);
-
-	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
-	if (ret < 0)
-		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
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
 
-		xe_tlb_inval_fence_wait(&fence);
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
-		struct xe_mmio *mmio = &gt->mmio;
-
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
@@ -356,7 +280,7 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, fence);
 
-	return send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	return send_tlb_inval(&gt->uc.guc, action, ARRAY_SIZE(action));
 }
 
 /**
@@ -388,43 +312,17 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
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
@@ -473,10 +371,112 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
+	return send_tlb_inval(&gt->uc.guc, action, len);
+}
+
+static int __xe_tlb_inval_ggtt(struct xe_gt *gt,
+			       struct xe_tlb_inval_fence *fence)
+{
+	int ret;
+
+	xe_tlb_inval_fence_prep(fence);
+
+	ret = send_tlb_inval_ggtt(gt, fence->seqno);
+	if (ret < 0)
+		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
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
 	xe_tlb_inval_fence_prep(fence);
 
-	ret = send_tlb_inval(&gt->uc.guc, fence, action,
-			     ARRAY_SIZE(action));
+	ret = send_tlb_inval_ppgtt(gt, start, end, asid, fence->seqno);
 	if (ret < 0)
 		inval_fence_signal_unlocked(xe, fence);
 
-- 
2.34.1

