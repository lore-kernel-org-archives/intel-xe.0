Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A324CEE346
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF8410E50E;
	Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeAY9UE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0252A10E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484230; x=1795020230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8zPrmGOm220yxTGEyxhO/K+vFgy9UbsVEvphGy4Vyuk=;
 b=PeAY9UE1mNEjDcSuZqfocy3Kh2v1HYzvgieBuhp5sXdiUntWDaLw0hZa
 IibwQ9ORQc3Gr9gtWUvK85kc7hNCP9ekxNmQHvAPDJmMSPt0Fdh5968Ho
 cbZlkd4O0BtKCNrwOwW4dB/HEoLgrcEYRGtvD31Zhc/cDbnS2kilAEIwU
 +9e8OLD+IlC0uXLNmOUdfPt/XSkThJM993n63BS+PXfIQiJUmXuQIbPRv
 ogSvFMZB+P9icgjBDxh//hmV2/XTko3muzNK0VbjLjJ8oFgWQt2vY1+hH
 I/BW+guItu2pkq7I1HmBBQRa/aduN50NY3anDBV7HddRpy11rEYlBkQR+ w==;
X-CSE-ConnectionGUID: BfzMEYgHTAuDXC9LRa2t6A==
X-CSE-MsgGUID: raS2wk8WSdueT64uoKL/qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544766"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544766"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: mXRHI24GTzmVdxMY4j7hmQ==
X-CSE-MsgGUID: Pt4NkB0CTIy6ujVBpkXokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952212"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 06/27] drm/xe/guc_pc: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:45 -0800
Message-ID: <20251118164338.3572146-35-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM in the GuC PC code.
This allows us to eliminate to goto-based cleanup and simplifies some
other functions.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 62 ++++++++++------------------------
 1 file changed, 17 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 951a49fb1d3e..e2e6edb851ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -499,21 +499,17 @@ u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	unsigned int fw_ref;
 
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
 		return -ETIMEDOUT;
-	}
 
 	*freq = get_cur_freq(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -1087,13 +1083,8 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
  */
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
 {
-	int ret;
-
-	xe_pm_runtime_get(pc_to_xe(pc));
-	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
-	xe_pm_runtime_put(pc_to_xe(pc));
-
-	return ret;
+	guard(xe_pm_runtime)(pc_to_xe(pc));
+	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
 }
 
 /**
@@ -1104,13 +1095,8 @@ int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mod
  */
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
 {
-	int ret;
-
-	xe_pm_runtime_get(pc_to_xe(pc));
-	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
-	xe_pm_runtime_put(pc_to_xe(pc));
-
-	return ret;
+	guard(xe_pm_runtime)(pc_to_xe(pc));
+	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
 }
 
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
@@ -1198,7 +1184,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
 		return -EINVAL;
 
 	guard(mutex)(&pc->freq_lock);
-	xe_pm_runtime_get_noresume(pc_to_xe(pc));
+	guard(xe_pm_runtime_noresume)(pc_to_xe(pc));
 
 	ret = pc_action_set_param(pc,
 				  SLPC_PARAM_POWER_PROFILE,
@@ -1209,8 +1195,6 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
 	else
 		pc->power_profile = val;
 
-	xe_pm_runtime_put(pc_to_xe(pc));
-
 	return ret;
 }
 
@@ -1223,17 +1207,14 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
-	unsigned int fw_ref;
 	ktime_t earlier;
 	int ret;
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
 		return -ETIMEDOUT;
-	}
 
 	if (xe->info.skip_guc_pc) {
 		if (xe->info.platform != XE_PVC)
@@ -1241,9 +1222,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 		/* Request max possible since dynamic freq mgmt is not enabled */
 		pc_set_cur_freq(pc, UINT_MAX);
-
-		ret = 0;
-		goto out;
+		return 0;
 	}
 
 	xe_map_memset(xe, &pc->bo->vmap, 0, 0, size);
@@ -1252,7 +1231,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	earlier = ktime_get();
 	ret = pc_action_reset(pc);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
 			      SLPC_RESET_TIMEOUT_MS)) {
@@ -1263,8 +1242,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
 				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
 			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
-			ret = -EIO;
-			goto out;
+			return -EIO;
 		}
 
 		xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
@@ -1273,21 +1251,20 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	ret = pc_init_freqs(pc);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = pc_set_mert_freq_cap(pc);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (xe->info.platform == XE_PVC) {
 		xe_guc_pc_gucrc_disable(pc);
-		ret = 0;
-		goto out;
+		return 0;
 	}
 
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* Enable SLPC Optimized Strategy for compute */
 	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
@@ -1297,8 +1274,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (unlikely(ret))
 		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
 
-out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
 }
 
@@ -1330,19 +1305,16 @@ static void xe_guc_pc_fini_hw(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
-	unsigned int fw_ref;
 
 	if (xe_device_wedged(xe))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	xe_guc_pc_gucrc_disable(pc);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
-
-	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
 
 /**
-- 
2.51.1

