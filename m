Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D581C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BCB10E45F;
	Tue,  4 Jun 2024 11:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLFAXMhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8906F10E45B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499843; x=1749035843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CYigcLp9GAsL+LGF+/9rG8lLK25NEc5GTQGBk3FxRDM=;
 b=aLFAXMhKTo4eyRXtX7kS5+f3IaUphKGqt4fR8Cj+AYpHT+B1oPCa3GbG
 uwtl19IJoUzdjgx0xnKVAeTDDT62xGRhY/vFTbTqAB4YCJ2ERPharrJRz
 j80jVo1XeEu6DNHbPUir11B7RVskWiwJnuotMLQuou3ZKd+NqN4v50NRL
 KqN6R6B2avkvQ41j4mj7vsiGqQiicgCkD9U6fd2bq180u94dseh/jppSB
 0w3SSHeWrOqv7nI1gnJPd9DQyrexp2lLS8he/lE054xckQ791FYx5AWlr
 ZwNjvGzyb7fKnLLNarFnd6lhfzh4gB0XSly8zHHPel52uP3xjU5Er+WrY Q==;
X-CSE-ConnectionGUID: e8A+vatxTDyYl1Wa3EXkhA==
X-CSE-MsgGUID: EiVyISeZRqeOhBbTw8NjVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701850"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:22 -0700
X-CSE-ConnectionGUID: krJEbqUpTDSG8OCIwl5pEg==
X-CSE-MsgGUID: geecfHagRLSrHgEg8QHAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669680"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:21 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 4/9] drm/xe/xe_gt: Always call xe_force_wake_put/get in pairs
Date: Tue,  4 Jun 2024 13:02:20 +0200
Message-ID: <20240604110225.29495-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_put() even on failure to keep ref
count accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 27 +++++++++++----------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4e11662b78bd..8c899e203c45 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -363,7 +363,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
-			goto err_force_wake;
+			goto err_dump_pat;
 		if (IS_SRIOV_PF(gt_to_xe(gt)))
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
@@ -376,16 +376,16 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_hw_engines_init_early(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_dump_pat;
 
 	err = xe_hw_engine_class_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_dump_pat;
 
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	err = xe_gt_ccs_mode_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_dump_pat;
 
 	/*
 	 * Stash hardware-reported version.  Since this register does not exist
@@ -398,10 +398,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	return 0;
 
-err_force_wake:
+err_dump_pat:
 	dump_pat_on_error(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_hw_fence_irq:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
@@ -414,7 +414,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
-		goto err_hw_fence_irq;
+		goto err_force_wake;
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
@@ -485,7 +485,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
@@ -502,7 +501,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
-		goto out;
+		goto out_fw;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
@@ -520,7 +519,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-out:
 	return err;
 }
 
@@ -682,7 +680,7 @@ static int gt_reset(struct xe_gt *gt)
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
-		goto err_msg;
+		goto err_out;
 
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
@@ -710,7 +708,6 @@ static int gt_reset(struct xe_gt *gt)
 
 err_out:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
@@ -758,7 +755,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
-		goto err_msg;
+		goto err_force_wake;
 
 	err = xe_uc_suspend(&gt->uc);
 	if (err)
@@ -773,7 +770,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-err_msg:
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -786,7 +782,7 @@ int xe_gt_resume(struct xe_gt *gt)
 	xe_gt_dbg(gt, "resuming\n");
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
-		goto err_msg;
+		goto err_force_wake;
 
 	err = do_gt_restart(gt);
 	if (err)
@@ -801,7 +797,6 @@ int xe_gt_resume(struct xe_gt *gt)
 
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-err_msg:
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 66f897a9b6ca..9d98818045a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -91,15 +91,13 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_pm_runtime_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err) {
-		xe_pm_runtime_put(xe);
-		return err;
-	}
+	if (err)
+		goto err_out;
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
-
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+err_out:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(xe);
 	if (err)
 		return err;
-- 
2.42.0

