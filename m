Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10ACCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03E210EB9D;
	Fri,  7 Nov 2025 18:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfNddtzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA9910EB78
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539210; x=1794075210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2PNO/RH//5XuXOBtkZ0kx5bgZYusoI+FzdlOVCWNZTU=;
 b=kfNddtzXAl+UFwxWqUcM5bPKJx4u/qvSkIlFDL12z2s96Zx7NXsUVEI/
 kKq4oUfkMM1ynVbTLIbjK3sNSL0y3Ag54i7Te0dXyCqPa271bSoHK458e
 gbki65t37/fhxHjkO5CEa/PIdcuVB9SoRtlQAbt0nAWMt1QdVsvzrEq35
 ucp01sAn63Rvsx7GLpeTyo4U5yKO9nhg5pw/ieXqfYO4aP816XkTh9HrP
 dv/jdDAosED04pjg6IwdCLO8eMSnlx3oWI/tHQR/7Axm0tZUGIDIe+mbr
 aSf9eHfGWrTdow0NFVd2ozsszCCtF80ZcrEhKPzCzgQX7EG5EABkyOd61 A==;
X-CSE-ConnectionGUID: OsT5aO6YR+qEeFGOKJ2KDg==
X-CSE-MsgGUID: LVIMTIvsSleVQe2FVkiljQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733142"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: AwhOSTAoS7y/lWjiQ5jxoA==
X-CSE-MsgGUID: QxYcqu/PQyufl0pmJ0G4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271173"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 09/33] drm/xe/gt: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:25 -0800
Message-ID: <20251107181315.631642-44-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 141 +++++++++++--------------------------
 1 file changed, 43 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d39bf8cb64eb..9111d7d60e33 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -103,13 +103,12 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return;
 
@@ -120,12 +119,10 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
-	xe_force_wake_put(fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
@@ -134,15 +131,13 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
-
-	xe_force_wake_put(fw_ref);
 }
 
 static void gt_reset_worker(struct work_struct *w);
@@ -389,7 +384,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 int xe_gt_init_early(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -436,13 +430,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
-	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
@@ -460,16 +453,15 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
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
 
-	xe_force_wake_put(fw_ref);
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(fw_ref);
-
-	return err;
 }
 
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_force_wake;
-	}
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
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
 
-	xe_force_wake_put(fw_ref);
-
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(fw_ref);
-
-	return err;
 }
 
 static void xe_gt_fini(void *arg)
@@ -819,15 +793,17 @@ static int do_gt_restart(struct xe_gt *gt)
 static void gt_reset_worker(struct work_struct *w)
 {
 	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
+	/* Drop the existing runtime PM reference when exiting this function */
+	guard(xe_pm_runtime_release_only)(gt_to_xe(gt));
+
 	if (xe_device_wedged(gt_to_xe(gt)))
-		goto err_pm_put;
+		return;
 
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
-		goto err_pm_put;
+		return;
 
 	xe_gt_info(gt, "reset started\n");
 
@@ -838,7 +814,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
 		err = -ETIMEDOUT;
 		goto err_out;
@@ -863,25 +839,16 @@ static void gt_reset_worker(struct work_struct *w)
 	if (err)
 		goto err_out;
 
-	xe_force_wake_put(fw_ref);
-
-	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	xe_gt_info(gt, "reset done\n");
 
 	return;
 
 err_out:
-	xe_force_wake_put(fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(gt_to_xe(gt));
-
-err_pm_put:
-	xe_pm_runtime_put(gt_to_xe(gt));
 }
 
 void xe_gt_reset_async(struct xe_gt *gt)
@@ -902,56 +869,42 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_suspend_prepare(&gt->uc);
-
-	xe_force_wake_put(fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
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
 
-	xe_force_wake_put(fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
-
-err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(fw_ref);
-	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
-
-	return err;
 }
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(fw_ref);
 }
 
 /**
@@ -976,32 +929,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		return -ETIMEDOUT;
+	}
 
 	err = do_gt_restart(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	xe_gt_idle_enable_pg(gt);
 
-	xe_force_wake_put(fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
-
-err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(fw_ref);
-	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
-
-	return err;
 }
 
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
-- 
2.51.1

