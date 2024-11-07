Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1FD5D689
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798CC10E8D3;
	Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6MT0Kt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517F410E1F5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731008879; x=1762544879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IXXsOjNjyPoddRBGzfKYkFebn/SUR0InPNe64DsNwP8=;
 b=g6MT0Kt/WYMRF5mHRFy8ZwRDbrNmVa82LDig14malsbmEnb1hUFxIXdx
 5tnbUDrMqR+LKYmffxud9aAoAQqj+F7EUxyjlFbtIlIeuzfQDHL5VgT+y
 o+/dYdVx5krOhvqig04AFLnO66/XQDW4TvLFvD52Gfazj4O4BXW0m6ipq
 /jrNNaPgPysaTRO1NKLsPqJ/gMBclWNb9Moghhk3w2Flii/oWhSp606Ez
 ANgh+MYxNVVSqocCH4DgEn+05rQIeoOTeKkhcppDHwjIwqEhmpmUwUoNg
 ACFEPzWozYC7uPJ7GzSjyQj01Dt0Av7R1kGSRddsqehE2doLcRANo7fN9 g==;
X-CSE-ConnectionGUID: gJi98TukQmOpQw83XWQMyQ==
X-CSE-MsgGUID: OcNggdxZQJ2YwZ9dqjvcBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31045980"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31045980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:59 -0800
X-CSE-ConnectionGUID: g0U0stzVQ068Aevelw8BfA==
X-CSE-MsgGUID: qX0XOzTGS+ayD8QPsXwu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="90340367"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Prefer GT oriented logs in submit code
Date: Thu,  7 Nov 2024 20:47:41 +0100
Message-Id: <20241107194741.2167-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241107194741.2167-1-michal.wajdeczko@intel.com>
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
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

For better diagnostics, use xe_gt_err() instead of drm_err().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0311d9e50d06..c70b75a3eb85 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -763,7 +763,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
 {
 	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
-	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
 	set_min_preemption_timeout(guc, q);
@@ -773,7 +772,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	if (!ret) {
 		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
-		drm_warn(&xe->drm, "Pending enable failed to respond");
+		xe_gt_warn(q->gt, "Pending enable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
 		xe_sched_tdr_queue_imm(sched);
@@ -817,7 +816,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
  */
 void xe_guc_submit_wedge(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
@@ -827,7 +826,8 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
-		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
+		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
+			  "Although device is wedged.\n");
 		return;
 	}
 
@@ -859,7 +859,6 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		container_of(w, struct xe_guc_exec_queue, lr_tdr);
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &ge->sched;
 	bool wedged;
 
@@ -897,7 +896,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			drm_warn(&xe->drm, "Schedule disable failed to respond");
+			xe_gt_warn(q->gt, "Schedule disable failed to respond\n");
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
@@ -1801,17 +1800,17 @@ int xe_guc_submit_start(struct xe_guc *guc)
 static struct xe_exec_queue *
 g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
-		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		xe_gt_err(gt, "Not engine present for guc_id %u\n", guc_id);
 		return NULL;
 	}
 
@@ -2039,7 +2038,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	u8 guc_class, instance;
 	u32 reason;
 
@@ -2051,10 +2050,10 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
-		guc_class, instance, reason);
+	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
+		  guc_class, instance, reason);
 
-	xe_gt_reset_async(guc_to_gt(guc));
+	xe_gt_reset_async(gt);
 
 	return 0;
 }
-- 
2.43.0

