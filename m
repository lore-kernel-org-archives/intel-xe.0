Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F06CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4E410EA18;
	Thu, 30 Oct 2025 20:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxrp/Gi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B3F10EA18
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761854762; x=1793390762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fOWCA7U2taXXR+bQSbxkMKEki+BdPpc3ypOVxldT2ck=;
 b=fxrp/Gi0cr4AYrTMF9saxxKPDazvFAnye5FQovhuIxaovGYSpMBG8zE6
 /Uh3ELLuYNSyVaa0nBCdI4eI+CnTqPHxIxnaHA13NCc6ogEhzUdneS56c
 ObJ8SjYd4rFS20tKfPcvBaiE9TMii1pu99z0gakyPPypGHbpIpnI23fWv
 L0Hua6yyhSmEacoui9urx12YFzc9jPnKuMX9HbLXvOFqQL4kKuff1556U
 zlPmAHs+4Rv8EAzjjGHJFZl/QjZz+pBB8k5p2QJ1eGWlg8vyXdUA7E/px
 4NzgNWEBrXji/cVE2WKc/jZbvSPrTMak3ZgFggQcZReqm84k2m8qajTyU A==;
X-CSE-ConnectionGUID: nipT3zLqTo65jBaJPE3wqg==
X-CSE-MsgGUID: jYCqPjDrSiOfE2IDO7c82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64050383"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64050383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:06:02 -0700
X-CSE-ConnectionGUID: 7ikg4mXJSE2f0Q6R0rbiIA==
X-CSE-MsgGUID: 7MVqZrk1T/6nf1dtGZ0FcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190392416"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:06:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe: Inline gt_reset in the worker
Date: Thu, 30 Oct 2025 13:05:04 -0700
Message-ID: <20251030200503.3667381-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.0
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

gt_reset() doesn't make sense by itself: it can only be called as part
of the worker. Inline it there to avoid it being called from elsewhere
and clarify the gt_reset() vs do_gt_reset() paths. Note that the error
return from gt_reset() was just being ignored.

Also add a comment to the xe_pm_runtime_put() to make sure the
get()/put() pair is clear.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8b..ce192875e5160 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -813,36 +813,29 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
-static int gt_reset(struct xe_gt *gt)
+static void gt_reset_worker(struct work_struct *w)
 {
+	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
 	unsigned int fw_ref;
 	int err;
 
-	if (xe_device_wedged(gt_to_xe(gt))) {
-		err = -ECANCELED;
+	if (xe_device_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
-	}
 
 	/* We only support GT resets with GuC submission */
-	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
-		err = -ENODEV;
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		goto err_pm_put;
-	}
 
 	xe_gt_info(gt, "reset started\n");
 
-	if (xe_fault_inject_gt_reset()) {
-		err = -ECANCELED;
+	if (xe_fault_inject_gt_reset())
 		goto err_fail;
-	}
 
 	xe_gt_sanitize(gt);
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		goto err_out;
-	}
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_stop_prepare(gt);
@@ -864,12 +857,12 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
-	return 0;
-
 err_out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
@@ -879,15 +872,6 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_declare_wedged(gt_to_xe(gt));
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return err;
-}
-
-static void gt_reset_worker(struct work_struct *w)
-{
-	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
-
-	gt_reset(gt);
 }
 
 void xe_gt_reset_async(struct xe_gt *gt)
@@ -899,6 +883,8 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
+
+	/* Pair with put in gt_reset_worker() if work is enqueued */
 	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
 		xe_pm_runtime_put(gt_to_xe(gt));
-- 
2.51.0

