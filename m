Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E7CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 23:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCCC10E80A;
	Wed, 20 Aug 2025 23:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ai9JqZ9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111EB10E80D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 23:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755732660; x=1787268660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOHWBQuLObw6oy2wSoe09DeacBrCVwRDaNfGJf5w+jE=;
 b=Ai9JqZ9AxQSwAf0vIKH9yEwQYthgoKYAGlvRMCoPpj8CDullHruxdSXW
 aLlK/mhwcP7Ea3Fe7Jx4JJDc+mLeuF1Hb8prJFEdB0fgLXKFLYrn8NoTN
 Silew05UFM9ingueAOJwo4fP4Qc3W1+O+HrICaqWmUN8dYSqnTfymjeVr
 ouV04ealuCiEjfh2gjzYVMcd51FLy211ugJecxcGOcl/43UFutq4zmPRJ
 4XeC1ufJ+vb2jTxJ+XXzZ7abG6mwWdNV32pmLabqPS1GU0XWGnOKcmBTE
 OdLvnkcdtMvnBGTmIK76s76OlFRo2P0Gpb7UmwRNLWH3wYB8Tm2QqLmFu w==;
X-CSE-ConnectionGUID: X1LYSe/cTBG3WCUUr/rP1w==
X-CSE-MsgGUID: FbtfeXiDRPyIp+pKoCG/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45586304"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="45586304"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
X-CSE-ConnectionGUID: /jndPPlpRD6zPwMFdtwYSw==
X-CSE-MsgGUID: zylBYXgbRSy6ID2ejiY/gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167470938"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/9] drm/xe: Prep TLB invalidation fence before sending
Date: Wed, 20 Aug 2025 23:30:55 +0000
Message-Id: <20250820233057.83894-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820233057.83894-1-stuart.summers@intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
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

It is a bit backwards to add a TLB invalidation fence to the pending
list after issuing the invalidation. Perform this step before issuing
the TLB invalidation in a helper function.

v2: Make sure the seqno_lock mutex covers the send as well (Matt)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 109 +++++++++++++++---------------
 1 file changed, 55 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 478b6348f805..8e73e68b37a4 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -66,19 +66,19 @@ __inval_fence_signal(struct xe_device *xe, struct xe_tlb_inval_fence *fence)
 static void
 inval_fence_signal(struct xe_device *xe, struct xe_tlb_inval_fence *fence)
 {
+	lockdep_assert_held(&fence->tlb_inval->pending_lock);
+
 	list_del(&fence->link);
 	__inval_fence_signal(xe, fence);
 }
 
-void xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence *fence)
+static void
+inval_fence_signal_unlocked(struct xe_device *xe,
+			    struct xe_tlb_inval_fence *fence)
 {
-	struct xe_gt *gt;
-
-	if (WARN_ON_ONCE(!fence->tlb_inval))
-		return;
-
-	gt = fence->tlb_inval->private;
-	__inval_fence_signal(gt_to_xe(gt), fence);
+	spin_lock_irq(&fence->tlb_inval->pending_lock);
+	inval_fence_signal(xe, fence);
+	spin_unlock_irq(&fence->tlb_inval->pending_lock);
 }
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
@@ -230,14 +230,10 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
-static int send_tlb_inval(struct xe_guc *guc,
-			  struct xe_tlb_inval_fence *fence,
+static int send_tlb_inval(struct xe_guc *guc, struct xe_tlb_inval_fence *fence,
 			  u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = gt_to_xe(gt);
-	int seqno;
-	int ret;
 
 	xe_gt_assert(gt, fence);
 
@@ -247,47 +243,36 @@ static int send_tlb_inval(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&gt->tlb_inval.seqno_lock);
-	seqno = gt->tlb_inval.seqno;
-	fence->seqno = seqno;
-	trace_xe_tlb_inval_fence_send(xe, fence);
-	action[1] = seqno;
-	ret = xe_guc_ct_send(&guc->ct, action, len,
-			     G2H_LEN_DW_TLB_INVALIDATE, 1);
-	if (!ret) {
-		spin_lock_irq(&gt->tlb_inval.pending_lock);
-		/*
-		 * We haven't actually published the TLB fence as per
-		 * pending_fences, but in theory our seqno could have already
-		 * been written as we acquired the pending_lock. In such a case
-		 * we can just go ahead and signal the fence here.
-		 */
-		if (tlb_inval_seqno_past(gt, seqno)) {
-			__inval_fence_signal(xe, fence);
-		} else {
-			fence->inval_time = ktime_get();
-			list_add_tail(&fence->link,
-				      &gt->tlb_inval.pending_fences);
-
-			if (list_is_singular(&gt->tlb_inval.pending_fences))
-				queue_delayed_work(system_wq,
-						   &gt->tlb_inval.fence_tdr,
-						   tlb_timeout_jiffies(gt));
-		}
-		spin_unlock_irq(&gt->tlb_inval.pending_lock);
-	} else {
-		__inval_fence_signal(xe, fence);
-	}
-	if (!ret) {
-		gt->tlb_inval.seqno = (gt->tlb_inval.seqno + 1) %
-			TLB_INVALIDATION_SEQNO_MAX;
-		if (!gt->tlb_inval.seqno)
-			gt->tlb_inval.seqno = 1;
-	}
-	mutex_unlock(&gt->tlb_inval.seqno_lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
+	action[1] = fence->seqno;
 
-	return ret;
+	return xe_guc_ct_send(&guc->ct, action, len,
+			      G2H_LEN_DW_TLB_INVALIDATE, 1);
+}
+
+static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
+{
+	struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
+	struct xe_gt *gt = tlb_inval->private;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	fence->seqno = tlb_inval->seqno;
+	trace_xe_tlb_inval_fence_send(xe, fence);
+
+	spin_lock_irq(&tlb_inval->pending_lock);
+	fence->inval_time = ktime_get();
+	list_add_tail(&fence->link, &tlb_inval->pending_fences);
+
+	if (list_is_singular(&tlb_inval->pending_fences))
+		queue_delayed_work(system_wq,
+				   &tlb_inval->fence_tdr,
+				   tlb_timeout_jiffies(gt));
+	spin_unlock_irq(&tlb_inval->pending_lock);
+
+	tlb_inval->seqno = (tlb_inval->seqno + 1) %
+		TLB_INVALIDATION_SEQNO_MAX;
+	if (!tlb_inval->seqno)
+		tlb_inval->seqno = 1;
 }
 
 #define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
@@ -315,7 +300,14 @@ static int xe_tlb_inval_guc(struct xe_gt *gt,
 	};
 	int ret;
 
+	mutex_lock(&gt->tlb_inval.seqno_lock);
+	xe_tlb_inval_fence_prep(fence);
+
 	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
+	mutex_unlock(&gt->tlb_inval.seqno_lock);
+
 	/*
 	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
 	 *  should be nuked on a GT reset so this error can be ignored.
@@ -442,7 +434,7 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
-	int len = 0;
+	int len = 0, ret;
 
 	xe_gt_assert(gt, fence);
 
@@ -503,7 +495,16 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_inval(&gt->uc.guc, fence, action, len);
+	mutex_lock(&gt->tlb_inval.seqno_lock);
+	xe_tlb_inval_fence_prep(fence);
+
+	ret = send_tlb_inval(&gt->uc.guc, fence, action,
+			     ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(xe, fence);
+	mutex_unlock(&gt->tlb_inval.seqno_lock);
+
+	return ret;
 }
 
 /**
-- 
2.34.1

