Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F768C3DA43
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC1710E171;
	Sat,  6 Jul 2024 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIFPZM21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3093D10E008
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224137; x=1751760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APM5fbrVdhQOTvscw7EjHLX9c3mAZ3gijGBB/J9xdEo=;
 b=IIFPZM21iRbBJgZiLp+GO7UkgIXCv8PN73+lmmDuox7YMDpFNbdlnsui
 G4G9fyRdGf/UL2rx6v1AHPv+hmhThX8Kw5neTa3foRSIIf4DICRN0947T
 dXDYwv9/ICpNHeyjPQkB6+p78ttQL+mnsemlWtDGq3daT8jCUAK9+LxgB
 Jr3YhrzgidGICQaBlIKhE323kC9omRheC+9Oz3DqxY6UOh8qsT6RLcP5D
 GLhlgnTnzk0+VtL+kypuozScR1rJ+ZvxMvq6MFHiOmqqn6EuteeTgEqEU
 mT9nl4o95gNg0M5QT83KsKFvYYiQj834z9UoUsuy/E5HnDtGyQMJ4irPW A==;
X-CSE-ConnectionGUID: 1xhrkjEcT5OpJvHe+EGBhw==
X-CSE-MsgGUID: zVxQRS/ZRpGer8miQFVxwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464657"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
X-CSE-ConnectionGUID: 13cpY0tcTn6V81PVKUzONg==
X-CSE-MsgGUID: PHSnAMhbRv+m9lcI0e0Skg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128245"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 04/11] drm/xe: Add tlb_invalidation.seqno_lock
Date: Fri,  5 Jul 2024 17:02:45 -0700
Message-Id: <20240706000252.702044-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Stop abusing CT lock for GT TLB invalidation fence seqno, add a
dedicated lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 106 +++++++++++---------
 drivers/gpu/drm/xe/xe_gt_types.h            |  13 ++-
 2 files changed, 71 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 147840b66ba9..e37436c140df 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "xe_gt_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
@@ -84,7 +86,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
-	return 0;
+	return drmm_mutex_init(&gt_to_xe(gt)->drm,
+			       &gt->tlb_invalidation.seqno_lock);
 }
 
 static void
@@ -118,7 +121,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * appear.
 	 */
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	/*
@@ -138,7 +141,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
@@ -159,11 +162,9 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 				 u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = gt_to_xe(gt);
-	int seqno;
-	int ret;
 
 	xe_gt_assert(gt, fence);
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
 
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
@@ -171,46 +172,39 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&guc->ct.lock);
+	action[1] = fence->seqno;
+	return xe_guc_ct_send(&guc->ct, action, len,
+			      G2H_LEN_DW_TLB_INVALIDATE, 1);
+}
+
+static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
+					      struct xe_gt_tlb_invalidation_fence *fence)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int seqno;
+
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
+
 	seqno = gt->tlb_invalidation.seqno;
 	fence->seqno = seqno;
+
 	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
-	action[1] = seqno;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
-	if (!ret && fence) {
-		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
-		/*
-		 * We haven't actually published the TLB fence as per
-		 * pending_fences, but in theory our seqno could have already
-		 * been written as we acquired the pending_lock. In such a case
-		 * we can just go ahead and signal the fence here.
-		 */
-		if (tlb_invalidation_seqno_past(gt, seqno)) {
-			__invalidation_fence_signal(xe, fence);
-		} else {
-			fence->invalidation_time = ktime_get();
-			list_add_tail(&fence->link,
-				      &gt->tlb_invalidation.pending_fences);
-
-			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
-				queue_delayed_work(system_wq,
-						   &gt->tlb_invalidation.fence_tdr,
-						   tlb_timeout_jiffies(gt));
-		}
-		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	} else if (ret < 0 && fence) {
-		__invalidation_fence_signal(xe, fence);
-	}
-	if (!ret) {
-		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
-			TLB_INVALIDATION_SEQNO_MAX;
-		if (!gt->tlb_invalidation.seqno)
-			gt->tlb_invalidation.seqno = 1;
-	}
-	mutex_unlock(&guc->ct.lock);
 
-	return ret;
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+		fence->invalidation_time = ktime_get();
+		list_add_tail(&fence->link,
+			      &gt->tlb_invalidation.pending_fences);
+
+		if (list_is_singular(&gt->tlb_invalidation.pending_fences))
+			queue_delayed_work(system_wq,
+					   &gt->tlb_invalidation.fence_tdr,
+					   tlb_timeout_jiffies(gt));
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+
+	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
+		TLB_INVALIDATION_SEQNO_MAX;
+	if (!gt->tlb_invalidation.seqno)
+		gt->tlb_invalidation.seqno = 1;
 }
 
 #define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
@@ -236,9 +230,20 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 		0,  /* seqno, replaced in send_tlb_invalidation */
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
+	int ret;
+
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
+
+	xe_gt_tlb_invalidation_fence_prep(gt, fence);
+
+	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
+				    ARRAY_SIZE(action));
+	if (ret < 0)
+		invalidation_fence_signal(gt_to_xe(gt), fence);
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action,
-				     ARRAY_SIZE(action));
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+
+	return ret;
 }
 
 /**
@@ -310,6 +315,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
+	int ret;
 
 	xe_gt_assert(gt, fence);
 
@@ -370,7 +376,17 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
+
+	xe_gt_tlb_invalidation_fence_prep(gt, fence);
+
+	ret = send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	if (ret < 0)
+		invalidation_fence_signal(xe, fence);
+
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d190a66514c0..fb280f058cdc 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -169,17 +169,24 @@ struct xe_gt {
 
 	/** @tlb_invalidation: TLB invalidation state */
 	struct {
-		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
+		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
+		struct mutex seqno_lock;
+		/**
+		 * @tlb_invalidation.seqno: TLB invalidation seqno, protected
+		 * by @tlb_invalidation.seqno_lock
+		 */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
 		int seqno;
 		/**
 		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
-		 * protected by CT lock
+		 * protected by @tlb_invalidation.seqno_lock (send) and
+		 * @tlb_invalidation.pending_lock (send, recv)
 		 */
 		int seqno_recv;
 		/**
 		 * @tlb_invalidation.pending_fences: list of pending fences waiting TLB
-		 * invaliations, protected by CT lock
+		 * invaliations, protected by @tlb_invalidation.seqno_lock
+		 * (send) and @tlb_invalidation.pending_lock (send, recv)
 		 */
 		struct list_head pending_fences;
 		/**
-- 
2.34.1

