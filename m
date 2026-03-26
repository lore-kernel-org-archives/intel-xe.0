Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D20110AB828
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 21:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FD010EAEF;
	Thu, 26 Mar 2026 21:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0clNZ3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3089910E315
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774558885; x=1806094885;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w2zgxRt19NTL9hJFgRy1N2jHB58uucgObBiONEpgSO8=;
 b=S0clNZ3+PscunJwfClu8H5RMjxGUehjpG2or8+qZZaUtCVbBJt9sYlms
 FSpAFDHkshVbTDMRNBGhWtPD20sDyX6SoQJcXwH96OfgE08a6DcDdVQG2
 5Od57T0oBSrPWw30UWPe1oGJHTDxbN1U6MVxz1hyHxhoFT5tG3+DEHTcL
 0H2yfYIT2MzcapnH7Cw0GEWZ6IfH7DYOO92JSiFnsaLCIuwiUal1cctFU
 sImp0b7X8ydb/fXXAPuiZlo8jeb+g7mpRbFT0/O50DJvWthyg8pvRA9MG
 wGOYdFnsWfby0B+ldo78k1L4mBznhZkvMdWK8mGlLMQPjQGogTdFF61ta A==;
X-CSE-ConnectionGUID: rA5f4g0cQ0yTG65AUTbINA==
X-CSE-MsgGUID: CRpAIaEaTgC5O5W+i+Vgow==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98251877"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="98251877"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:20 -0700
X-CSE-ConnectionGUID: aoDn83VtSd+GxTEBgVQNzA==
X-CSE-MsgGUID: Jb4lNbukR4CzJlHKmybqpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229182396"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Drop registration of guc_submit_wedged_fini from
 xe_guc_submit_wedge()
Date: Thu, 26 Mar 2026 14:01:16 -0700
Message-Id: <20260326210116.202585-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326210116.202585-1-matthew.brost@intel.com>
References: <20260326210116.202585-1-matthew.brost@intel.com>
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

xe_guc_submit_wedge() runs in the DMA-fence signaling path, where
GFP_KERNEL memory allocations are not permitted. However, registering
guc_submit_wedged_fini via drmm_add_action_or_reset() triggers such an
allocation.

Avoid this by moving the logic from guc_submit_wedged_fini() into
guc_submit_fini(), where wedged exec queue references are dropped during
normal teardown.

Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 33 ++++++++----------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a145234f662b..10556156eaad 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -259,24 +259,12 @@ static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
 }
 
 static void guc_submit_fini(void *arg)
-{
-	struct xe_guc *guc = arg;
-
-	/* Forcefully kill any remaining exec queues */
-	xe_guc_ct_stop(&guc->ct);
-	guc_submit_reset_prepare(guc);
-	xe_guc_softreset(guc);
-	xe_guc_submit_stop(guc);
-	xe_uc_fw_sanitize(&guc->fw);
-	xe_guc_submit_pause_abort(guc);
-}
-
-static void guc_submit_wedged_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	/* Drop any wedged queue refs */
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		if (exec_queue_wedged(q)) {
@@ -286,6 +274,14 @@ static void guc_submit_wedged_fini(void *arg)
 		}
 	}
 	mutex_unlock(&guc->submission_state.lock);
+
+	/* Forcefully kill any remaining exec queues */
+	xe_guc_ct_stop(&guc->ct);
+	guc_submit_reset_prepare(guc);
+	xe_guc_softreset(guc);
+	xe_guc_submit_stop(guc);
+	xe_uc_fw_sanitize(&guc->fw);
+	xe_guc_submit_pause_abort(guc);
 }
 
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
@@ -1320,10 +1316,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 void xe_guc_submit_wedge(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
-	int err;
 
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
@@ -1335,15 +1329,6 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 		return;
 
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
-					       guc_submit_wedged_fini, guc);
-		if (err) {
-			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
-				  "Although device is wedged.\n",
-				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
-			return;
-		}
-
 		mutex_lock(&guc->submission_state.lock);
 		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
 			if (xe_exec_queue_get_unless_zero(q))
-- 
2.34.1

