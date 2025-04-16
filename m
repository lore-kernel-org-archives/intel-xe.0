Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F07C369C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 18:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D011310E995;
	Wed, 16 Apr 2025 18:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7EK2+Lh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C31C10E995
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744828243; x=1776364243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DiMV5ZZYLI4djS6cp4T/R2/q0a0po/59gyuaV+T+85I=;
 b=O7EK2+Lh1oZ8IvIfvg6vXhkCNBrBtswOQKfOVTEdkRO83lm29ZaQ6kHH
 kWQTUdkdtc534eI2HKtJoUJhT+dhgRL9mILa4LptChCgjUpWB74hR998z
 2QNK45vAOAs9onMORxgpRk40kmyCAa+lRBVDz3sjcA9dnjfYMtf6TCrlQ
 kN1VHAobba2jfNP3kmhfdFrsGkQcxGvAPHBakQZm1F2OBBExlllzPHqSU
 eWqxJ98GHEOoRzZ8FnB/BRcxCK6Gf6PIR5vwwhevfHlkh3KxNh/bnewFl
 rmXashIoAe4rebtxaAbUZ3FOacxxCfNoplSBxT5z8+qQmiz8aNOX2UMfs Q==;
X-CSE-ConnectionGUID: oQtt8m/aRlmBkVEpgK0Jiw==
X-CSE-MsgGUID: vcZTN03wSJuJUuKiKSQ/sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46560385"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46560385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:30:41 -0700
X-CSE-ConnectionGUID: 5Hu3EG71QKC0XqWFZO9QCg==
X-CSE-MsgGUID: INq9XvuGRuifvl6JENKOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135374591"
Received: from dut136arlu.fm.intel.com ([10.105.23.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:30:41 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: stuart.summers@intel.com, matthew.brost@intel.com,
 lucas.demarchi@intel.com, nirmoy.das@linux.intel.com,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/2] drm/xe: Do not use CT lock in TLB code
Date: Wed, 16 Apr 2025 18:30:32 +0000
Message-Id: <20250416183032.70948-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416183032.70948-1-stuart.summers@intel.com>
References: <20250416183032.70948-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nirmoy Das <nirmoy.das@intel.com>

Stop abusing CT lock for GT TLB invalidation fence seqno, add a
dedicated lock.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++-------
 drivers/gpu/drm/xe/xe_gt_types.h            | 13 ++++++++++---
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 031c4d43f36b..c2bb53362d74 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "xe_gt_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
@@ -123,7 +125,8 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
-	return 0;
+	return drmm_mutex_init(&gt_to_xe(gt)->drm,
+			       &gt->tlb_invalidation.seqno_lock);
 }
 
 /**
@@ -142,7 +145,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * appear.
 	 */
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	/*
@@ -162,7 +165,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
@@ -195,13 +198,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&guc->ct.lock);
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	seqno = gt->tlb_invalidation.seqno;
 	fence->seqno = seqno;
 	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
 	action[1] = seqno;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
+	ret = xe_guc_ct_send(&guc->ct, action, len,
+			     G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret) {
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
@@ -232,7 +235,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
 	}
-	mutex_unlock(&guc->ct.lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index be81687cbe2b..4736a608a881 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -187,17 +187,24 @@ struct xe_gt {
 
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

