Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268E4CEACDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BDA10EB30;
	Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUYgMJ5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640810EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156629; x=1794692629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4W8YTl3qYNaMQFw9B4brPkyL6yFY4v5g2aJl7z4mhMY=;
 b=lUYgMJ5DucTz/FO5F4ziOzvrZvwhExSr4OILL/eqwCT7W5ZhbVbu929L
 S6pEtLccQKp1sO6AxshzvWuTTdba/UeV+utK1Yf6v4TKFMyXjq0w4qkNj
 Y4pHR1UeVy/bRXU48ft7yDxUfjDfQqsyaSFCrOHhMXj+KfFhHz8H0PGqd
 Fmz8rYTqgCid4hrZX5qUG1I3681Kp8S1EEsOIDe3Q7rSa4X/MM9zexza8
 DCsUu3XTOUXQIYxDR2ORV4Q3nqgn1faHLXTAY5dLe/09UoQr15QoWHtGQ
 cCto3lhJ0Bdp4imhWsP83VWscz+vVTbLNdiJYgcCSpxbvf0/oiKVyKxMH Q==;
X-CSE-ConnectionGUID: tePgPsx5TMusVyvOg61HFg==
X-CSE-MsgGUID: h75ke79hQ8uc0v6kDvHkWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648305"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648305"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: TmBaFDWWQjuU3twwd0Yazg==
X-CSE-MsgGUID: Vt8/ZEhITPuV4MIdM+JXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308282"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 03/27] drm/xe/gt: Use scope-based cleanup
Date: Fri, 14 Nov 2025 13:43:39 -0800
Message-ID: <20251114214335.2388972-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Using scope-based cleanup for forcewake and runtime PM allows us to
reduce or eliminate some of the goto-based error handling and simplify
several functions.

v2:
 - Drop changes to do_gt_restart().  This function still has goto-based
   logic, making scope-based cleanup unsafe for now.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 130 ++++++++++++-------------------------
 1 file changed, 41 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6d479948bf21..514ed50e6d83 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -103,14 +103,13 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return;
 
 	if (xe_gt_is_main_type(gt)) {
@@ -120,12 +119,10 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
@@ -134,15 +131,13 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void gt_reset_worker(struct work_struct *w);
@@ -389,7 +384,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 int xe_gt_init_early(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -436,13 +430,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return 0;
 }
@@ -460,16 +453,15 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	err = xe_uc_init(&gt->uc);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
@@ -478,7 +470,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
-			goto err_force_wake;
+			return err;
 		if (IS_SRIOV_PF(gt_to_xe(gt)))
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
@@ -492,17 +484,17 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	err = xe_hw_engines_init_early(gt);
 	if (err) {
 		dump_pat_on_error(gt);
-		goto err_force_wake;
+		return err;
 	}
 
 	err = xe_hw_engine_class_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	err = xe_gt_ccs_mode_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	/*
 	 * Stash hardware-reported version.  Since this register does not exist
@@ -510,25 +502,16 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return err;
 }
 
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_force_wake;
-	}
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+		return -ETIMEDOUT;
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_wa_process_gt(gt);
@@ -537,20 +520,20 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 
 	err = xe_gt_clock_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	xe_mocs_init(gt);
 	err = xe_execlist_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	err = xe_hw_engines_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	err = xe_uc_init_post_hwconfig(&gt->uc);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	if (xe_gt_is_main_type(gt)) {
 		/*
@@ -561,10 +544,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 
 			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
 								IS_DGFX(xe) ? SZ_1M : SZ_512K, 16);
-			if (IS_ERR(gt->usm.bb_pool)) {
-				err = PTR_ERR(gt->usm.bb_pool);
-				goto err_force_wake;
-			}
+			if (IS_ERR(gt->usm.bb_pool))
+				return PTR_ERR(gt->usm.bb_pool);
 		}
 	}
 
@@ -573,12 +554,12 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 
 		err = xe_migrate_init(tile->migrate);
 		if (err)
-			goto err_force_wake;
+			return err;
 	}
 
 	err = xe_uc_load_hw(&gt->uc);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	/* Configure default CCS mode of 1 engine with all resources */
 	if (xe_gt_ccs_mode_enabled(gt)) {
@@ -592,14 +573,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return err;
 }
 
 static void xe_gt_fini(void *arg)
@@ -902,56 +876,42 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_suspend_prepare(&gt->uc);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		return -ETIMEDOUT;
+	}
 
 	err = xe_uc_suspend(&gt->uc);
-	if (err)
-		goto err_force_wake;
+	if (err) {
+		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
+		return err;
+	}
 
 	xe_gt_idle_disable_pg(gt);
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
-
-err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
-
-	return err;
 }
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -976,32 +936,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		return -ETIMEDOUT;
+	}
 
 	err = do_gt_restart(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	xe_gt_idle_enable_pg(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
-
-err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
-
-	return err;
 }
 
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
-- 
2.51.1

