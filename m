Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85756CEE341
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4017C10E512;
	Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYepFrBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4E10E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484230; x=1795020230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eWVcYcndSxbqNDmGPeY7jIPByOHg0uf6Z9qzO/pY4PI=;
 b=VYepFrBanIgRPRw8HUi2+4bS+Owam/uRh2aLi457mA9SCBoJz8vpbnEx
 M0nWuulxwDsFUGaJbAg9AcjW+RjAyNDkUsRLiR6LigbfImDQDYI5MHu3n
 BaQxggLcJVbBN7nVCoWLjOEmqjzNAcqiL/uJK3P9q6N3gfia9vWZf67XT
 FBDTekfNNErvJLL70TYKMHFJyy525BEeAHllIdm1YEiJdRuwTmEEs1Ml9
 V3I7Xz+RrHl6GYajn2JXSnsPklQNFZ4J9dxgUZ1AkRDiaNkaCvcvlqp1P
 3DbidwFYX/NdsKGCa/edO2qnFyHgcZkUFMbjvEuMY1Dq+Uoj+u+WlxXgB w==;
X-CSE-ConnectionGUID: Z2ZCzIiBSF6c7wPXJymCSg==
X-CSE-MsgGUID: ziaWV54VS4uEtueIwdMaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544769"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: pqUEiBOHRbu29E33F6vz6w==
X-CSE-MsgGUID: apK/hdXNR86b+H6YRGTSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952224"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 09/27] drm/xe/pxp: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:48 -0800
Message-ID: <20251118164338.3572146-38-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime pm.  This allows us to
eliminate some goto-based error handling and simplify other functions.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 55 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index bdbdbbf6a678..508f4c128a48 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -58,10 +58,9 @@ bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
-	unsigned int fw_ref;
 	bool ready;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	/*
 	 * If force_wake fails we could falsely report the prerequisites as not
@@ -71,14 +70,12 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 	 * PXP. Therefore, we can just log the force_wake error and not escalate
 	 * it.
 	 */
-	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL));
+	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL));
 
 	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
 	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
 		xe_gsc_proxy_init_done(&gt->uc.gsc);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return ready;
 }
 
@@ -104,13 +101,12 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
 	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
 		return -EIO;
 
-	xe_pm_runtime_get(pxp->xe);
+	guard(xe_pm_runtime)(pxp->xe);
 
 	/* PXP requires both HuC loaded and GSC proxy initialized */
 	if (pxp_prerequisites_done(pxp))
 		ret = 1;
 
-	xe_pm_runtime_put(pxp->xe);
 	return ret;
 }
 
@@ -135,35 +131,28 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp);
 static int pxp_terminate_hw(struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
-	unsigned int fw_ref;
 	int ret = 0;
 
 	drm_dbg(&pxp->xe->drm, "Terminating PXP\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
-		ret = -EIO;
-		goto out;
-	}
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
+		return -EIO;
 
 	/* terminate the hw session */
 	ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* Trigger full HW cleanup */
 	xe_mmio_write32(&gt->mmio, KCR_GLOBAL_TERMINATE, 1);
 
 	/* now we can tell the GSC to clean up its own state */
-	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
-
-out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return ret;
+	return xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
 }
 
 static void mark_termination_in_progress(struct xe_pxp *pxp)
@@ -326,14 +315,12 @@ static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
 {
 	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
 		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
-	unsigned int fw_ref;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pxp->gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
 		return -EIO;
 
 	xe_mmio_write32(&pxp->gt->mmio, KCR_INIT, val);
-	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
 
 	return 0;
 }
@@ -453,34 +440,28 @@ int xe_pxp_init(struct xe_device *xe)
 static int __pxp_start_arb_session(struct xe_pxp *pxp)
 {
 	int ret;
-	unsigned int fw_ref;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pxp->gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
 		return -EIO;
 
-	if (pxp_session_is_in_play(pxp, ARB_SESSION)) {
-		ret = -EEXIST;
-		goto out_force_wake;
-	}
+	if (pxp_session_is_in_play(pxp, ARB_SESSION))
+		return -EEXIST;
 
 	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
 	if (ret) {
 		drm_err(&pxp->xe->drm, "Failed to init PXP arb session: %pe\n", ERR_PTR(ret));
-		goto out_force_wake;
+		return ret;
 	}
 
 	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
 	if (ret) {
 		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play%pe\n", ERR_PTR(ret));
-		goto out_force_wake;
+		return ret;
 	}
 
 	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
-
-out_force_wake:
-	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.51.1

