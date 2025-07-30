Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A2BC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736B10E0F8;
	Wed, 30 Jul 2025 20:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jku5Shkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44E410E0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753908327; x=1785444327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nh6ZXppp0YMwi5mVJPoNM6/1zCsxW7h4+cNrNVcpoFU=;
 b=jku5ShkwVLHXURpBTpHcfiKLcl3jeMtd1azGtOPX+GKCeMW/Us8lNtIe
 zm4YjTaksUKR22cZ157LL9NaIJ+AOJMepR+tmrlOLfvamgHamzpguieSP
 iimkd7+gkVFOuYnN6lF7mxgaVslxOAoPsvEYC4mk7oiISks1FxR+H1R22
 +1X1n3ukEAguWdnJ9jNfPxhdqqQFPSPKOwUXNifx9nVYPnDtY3DQ6GFVZ
 Dilux596Y7TV7to2tNPBsAehoGwRxLm6097m0f58tJBENwqSpizqPvTLB
 6L62q6jNF3CJbKONfgN7sjWfDJ1J3KoCouzTLP6y0aNYR/P/ho/GMiwCj Q==;
X-CSE-ConnectionGUID: TDzvpVhKRISHK+Ere7lqmw==
X-CSE-MsgGUID: abMopuv3RQq+OlUfV0jwRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60046392"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="60046392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:45:17 -0700
X-CSE-ConnectionGUID: 73XIjYFHS7qkk1HUkdQJTA==
X-CSE-MsgGUID: QhP2R/WkQLOVGiaqhb2Xzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193925778"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT136ARLU.fm.intel.com) ([10.105.23.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:45:17 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 6/8] drm/xe: Prep TLB invalidation fence before sending
Date: Wed, 30 Jul 2025 20:45:12 +0000
Message-Id: <20250730204514.76459-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730204514.76459-1-stuart.summers@intel.com>
References: <20250730204514.76459-1-stuart.summers@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 103 +++++++++++++++---------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 288960ea0caa..2ffd677ee180 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -65,19 +65,19 @@ __inval_fence_signal(struct xe_device *xe, struct xe_tlb_inval_fence *fence)
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
@@ -199,14 +199,10 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
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
 
@@ -216,45 +212,36 @@ static int send_tlb_inval(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
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
@@ -282,7 +269,12 @@ static int xe_tlb_inval_guc(struct xe_gt *gt,
 	};
 	int ret;
 
+	xe_tlb_inval_fence_prep(fence);
+
 	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
+
 	/*
 	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
 	 *  should be nuked on a GT reset so this error can be ignored.
@@ -409,7 +401,7 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
-	int len = 0;
+	int len = 0, ret;
 
 	xe_gt_assert(gt, fence);
 
@@ -470,7 +462,14 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_inval(&gt->uc.guc, fence, action, len);
+	xe_tlb_inval_fence_prep(fence);
+
+	ret = send_tlb_inval(&gt->uc.guc, fence, action,
+			     ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(xe, fence);
+
+	return ret;
 }
 
 /**
-- 
2.34.1

