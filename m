Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B77C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 18:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A155110E83E;
	Wed, 23 Jul 2025 18:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggYXeg2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303D010E115
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753294946; x=1784830946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l8G3ywPixmz2CmLb/kioRc+Oknc1TwPSuEkKL3C86ew=;
 b=ggYXeg2i+4elVisO0koHYk4zoLgpT7amZP5gfCNJwHrP+hr6Al4mMFp8
 CNxMATB+AoX6djszDCRLfdYa2vHomSkfbpyz+S2Ah9EHk+SE7g7F63/2V
 A587ZfegixjccqQNXWpOW1oBMLfjEzrc7EKKrAT7DMh8DMQ1cg6ALQ1Zi
 EbJq37dKqL9KyFvSiTD05XKUkeYnV2A5z2+zXvBUdTWR7dqRj4ukjcWMk
 iEV/xfo94T05ifwQt3mcsgs8Q5PaG3iuQ87RwhrY6gsLAYL1ntc8sVUIA
 kq04GVDiV4zVQGYd7AmOHT0tJTtISdPiCbudu0tj9jOgJYTOfz7cny8MA g==;
X-CSE-ConnectionGUID: KwYiXtM/SyyjHd7HoVtn1Q==
X-CSE-MsgGUID: iKFcqZWSRxORhgRxkHwamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59249611"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="59249611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:22:25 -0700
X-CSE-ConnectionGUID: v9Zjw80dTwe2ss/UaOZn+Q==
X-CSE-MsgGUID: bqsSfTb2SnOFSyD/NUj/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159670602"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT166ARLU.fm.intel.com) ([10.105.23.66])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:22:24 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe: Prep TLB invalidation fence before sending
Date: Wed, 23 Jul 2025 18:22:20 +0000
Message-Id: <20250723182222.48423-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723182222.48423-1-stuart.summers@intel.com>
References: <20250723182222.48423-1-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/xe_tlb_inval.c | 116 ++++++++++++++++--------------
 1 file changed, 62 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index a25c35005689..61bc16410228 100644
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
@@ -201,16 +201,13 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
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
+	lockdep_assert_held(&guc->ct.lock);
 
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
@@ -218,47 +215,38 @@ static int send_tlb_inval(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&guc->ct.lock);
-	seqno = gt->tlb_inval.seqno;
-	fence->seqno = seqno;
-	trace_xe_tlb_inval_fence_send(xe, fence);
-	action[1] = seqno;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
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
-	mutex_unlock(&guc->ct.lock);
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
+	lockdep_assert_held(&gt->uc.guc.ct.lock);
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
@@ -286,7 +274,16 @@ static int xe_tlb_inval_guc(struct xe_gt *gt,
 	};
 	int ret;
 
+	mutex_lock(&gt->uc.guc.ct.lock);
+
+	xe_tlb_inval_fence_prep(fence);
+
 	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
+
+	mutex_unlock(&gt->uc.guc.ct.lock);
+
 	/*
 	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
 	 *  should be nuked on a GT reset so this error can be ignored.
@@ -413,7 +410,7 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
-	int len = 0;
+	int len = 0, ret;
 
 	xe_gt_assert(gt, fence);
 
@@ -474,7 +471,18 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_inval(&gt->uc.guc, fence, action, len);
+	mutex_lock(&gt->uc.guc.ct.lock);
+
+	xe_tlb_inval_fence_prep(fence);
+
+	ret = send_tlb_inval(&gt->uc.guc, fence, action,
+			     ARRAY_SIZE(action));
+	if (ret < 0)
+		inval_fence_signal_unlocked(xe, fence);
+
+	mutex_unlock(&gt->uc.guc.ct.lock);
+
+	return ret;
 }
 
 /**
-- 
2.34.1

