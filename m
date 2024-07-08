Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE11AC3DA46
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BCD10E1C7;
	Mon,  8 Jul 2024 04:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jah4ZyS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801310E012
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411372; x=1751947372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=85UJT0CN4UHyWAyc/rypOe4J4dcSXQ7aA5NhHddrKzk=;
 b=Jah4ZyS88kCHaug3in4IS38Pqe2ykPwM+otqRnxPTn8t1l9LGJhaEjXO
 YckJv0OWxMTJIAc77L3GbR2xLh14LI8YI+rD7cJlD3EoatBV51K23BIDb
 iVCCsEV+PVVUnot2rp+CueCAhYt9LbjrW+dS99B6rKbGMjaDo4onIe6FU
 RkBAX4I1VQrKXyUyLnviIRXruU0ao4fMI3eCesIkTPx09PhpGM1VLNOlp
 7Y8YZh4YAKTUJpecqXMHDpwxfGJG1CVdm+sjeUXd7sSUwKw7CJngzMZ83
 GvdU47l1lPXZIgLXAHVw+u4WVwbhXooZYRn+UtmG5kN5xkB69YaG3LYQH w==;
X-CSE-ConnectionGUID: N+3lN3+CRpGjb4dohPq53g==
X-CSE-MsgGUID: Fo2TS79VSHqyaNdZHhbR0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205306"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:52 -0700
X-CSE-ConnectionGUID: DBrMqVeoRvyJN99AC9CQnQ==
X-CSE-MsgGUID: dhZ9FP4bSXamVxn5pZaQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518792"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 08/11] drm/xe: Add multi-client support for GT TLB
 invalidations
Date: Sun,  7 Jul 2024 21:03:28 -0700
Message-Id: <20240708040331.766264-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
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

Add multi-client support for GT TLB invalidations as future platforms
may have multiple sets of TLBs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 86 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  4 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  5 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  5 +-
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  |  4 +-
 5 files changed, 82 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 4b7b5f8205f9..15941e803d8f 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -52,8 +52,9 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
-		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
-			  fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d, guc_recv=%d",
+			  fence->seqno,
+			  gt->tlb_invalidation.seqno_recv[XE_GT_TLB_INVALIDATION_CLIENT_GUC]);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -84,7 +85,11 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
-	gt->tlb_invalidation.ops = xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);
+
+	/* Execlists not supported */
+	if (!gt_to_xe(gt)->info.force_execlist)
+		gt->tlb_invalidation.ops[XE_GT_TLB_INVALIDATION_CLIENT_GUC] =
+			xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);
 
 	return drmm_mutex_init(&gt_to_xe(gt)->drm,
 			       &gt->tlb_invalidation.seqno_lock);
@@ -114,6 +119,7 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	enum xe_gt_tlb_invalidation_clients client;
 	int pending_seqno;
 
 	/*
@@ -135,7 +141,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 		pending_seqno = TLB_INVALIDATION_SEQNO_MAX - 1;
 	else
 		pending_seqno = gt->tlb_invalidation.seqno - 1;
-	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
+	for (client = 0; client < XE_GT_TLB_INVALIDATION_CLIENT_MAX; ++client)
+		WRITE_ONCE(gt->tlb_invalidation.seqno_recv[client],
+			   pending_seqno);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
@@ -144,9 +152,11 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
-static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
+static bool __tlb_invalidation_seqno_past(struct xe_gt *gt,
+					  enum xe_gt_tlb_invalidation_clients client,
+					  int seqno)
 {
-	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
+	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv[client]);
 
 	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
 		return false;
@@ -157,16 +167,59 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
+static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
+{
+	enum xe_gt_tlb_invalidation_clients client;
+
+	for (client = 0; client < XE_GT_TLB_INVALIDATION_CLIENT_MAX; ++client)
+		if (!__tlb_invalidation_seqno_past(gt, client, seqno))
+			return false;
+
+	return true;
+}
+
 static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
 {
-	return gt->tlb_invalidation.ops->tlb_invalidation_ggtt(gt, seqno);
+	enum xe_gt_tlb_invalidation_clients client;
+	int ret;
+
+	for (client = 0; client < XE_GT_TLB_INVALIDATION_CLIENT_MAX; ++client) {
+		const struct xe_gt_tlb_invalidation_ops *ops =
+			gt->tlb_invalidation.ops[client];
+
+		if (!ops || !ops->tlb_invalidation_ggtt) {
+			xe_gt_tlb_invalidation_done_handler(gt, client, seqno);
+		} else {
+			ret = ops->tlb_invalidation_ggtt(gt, seqno);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
 				       u32 asid, int seqno)
 {
-	return gt->tlb_invalidation.ops->tlb_invalidation_ppgtt(gt, start, end,
-								asid, seqno);
+	enum xe_gt_tlb_invalidation_clients client;
+	int ret;
+
+	for (client = 0; client < XE_GT_TLB_INVALIDATION_CLIENT_MAX; ++client) {
+		const struct xe_gt_tlb_invalidation_ops *ops =
+			gt->tlb_invalidation.ops[client];
+
+		if (!ops || !ops->tlb_invalidation_ppgtt) {
+			xe_gt_tlb_invalidation_done_handler(gt, client, seqno);
+		} else {
+			ret = ops->tlb_invalidation_ppgtt(gt, start, end, asid,
+							  seqno);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
 }
 
 static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
@@ -285,12 +338,6 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	xe_gt_assert(gt, fence);
 
-	/* Execlists not supported */
-	if (xe->info.force_execlist) {
-		__invalidation_fence_signal(xe, fence);
-		return 0;
-	}
-
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
 	xe_gt_tlb_invalidation_fence_prep(gt, fence);
@@ -331,11 +378,14 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 /**
  * xe_gt_tlb_invalidation_done_handler - GT TLB invalidation done handler
  * @gt: gt
+ * @client: client of invalidation that is done
  * @seqno: seqno of invalidation that is done
  *
  * Update recv seqno, signal any GT TLB invalidation fences, and restart TDR
  */
-void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
+void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt,
+					 enum xe_gt_tlb_invalidation_clients client,
+					 int seqno)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
@@ -357,12 +407,12 @@ void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&gt->tlb_invalidation.pending_lock, flags);
-	if (tlb_invalidation_seqno_past(gt, seqno)) {
+	if (__tlb_invalidation_seqno_past(gt, client, seqno)) {
 		spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
 		return;
 	}
 
-	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, seqno);
+	WRITE_ONCE(gt->tlb_invalidation.seqno_recv[client], seqno);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index ee532ad64aac..df22d9b4d85c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -26,7 +26,9 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence);
 
-void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno);
+void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt,
+					 enum xe_gt_tlb_invalidation_clients client,
+					 int seqno);
 
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index 1abb8692d14b..1208edf7a5a4 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -38,4 +38,9 @@ struct xe_gt_tlb_invalidation_ops {
 				      u32 asid, int seqno);
 };
 
+enum xe_gt_tlb_invalidation_clients {
+	XE_GT_TLB_INVALIDATION_CLIENT_GUC = 0,
+	XE_GT_TLB_INVALIDATION_CLIENT_MAX,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 4b9740a68457..9a2f1e8b74e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -10,6 +10,7 @@
 #include "xe_gt_idle_types.h"
 #include "xe_gt_sriov_pf_types.h"
 #include "xe_gt_sriov_vf_types.h"
+#include "xe_gt_tlb_invalidation_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_oa.h"
@@ -170,7 +171,7 @@ struct xe_gt {
 	/** @tlb_invalidation: TLB invalidation state */
 	struct {
 		/** @tlb_invalidation.ops: TLB invalidation ops */
-		const struct xe_gt_tlb_invalidation_ops *ops;
+		const struct xe_gt_tlb_invalidation_ops *ops[XE_GT_TLB_INVALIDATION_CLIENT_MAX];
 		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
 		struct mutex seqno_lock;
 		/**
@@ -184,7 +185,7 @@ struct xe_gt {
 		 * protected by @tlb_invalidation.seqno_lock (send) and
 		 * @tlb_invalidation.pending_lock (send, recv)
 		 */
-		int seqno_recv;
+		int seqno_recv[XE_GT_TLB_INVALIDATION_CLIENT_MAX];
 		/**
 		 * @tlb_invalidation.pending_fences: list of pending fences waiting TLB
 		 * invaliations, protected by @tlb_invalidation.seqno_lock
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
index b6fd61bb77ba..f6f38dd99d90 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
@@ -137,7 +137,9 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
+	xe_gt_tlb_invalidation_done_handler(gt,
+					    XE_GT_TLB_INVALIDATION_CLIENT_GUC,
+					    msg[0]);
 
 	return 0;
 }
-- 
2.34.1

