Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA4F55810
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 11:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7D810E51D;
	Mon, 20 Apr 2026 11:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGj+XfgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6FB10E4F6
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776684679; x=1808220679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ShcC2ePTisdZ5sYgOCqTadLrS2TH0OxmZgdIFljeC9Y=;
 b=lGj+XfgANp3unWTy92N2meJWJb3nbbivfATX9318ufi7qyxa5VTKgxHm
 Gca8bOawAfdfe7NK6bvgrhJEB/4TqqnReMy+bDgIeDdcJug51f4RrvO0T
 5AqtCKJrUVs2YbLzhtkjF+tT06v5G6eca4dxOHGuAwsLSzqn4p+KuLlUD
 KY1OmsOnnQ4qZDD7kUhiDUcM45TptdTaowS1dZvDT75+wd1zQSC4iYX7F
 61ctwXu+cQ90a6jWl2PEuLszu6V5sIPt0TsNBFYj9IMyBbHnP0J4SPyzM
 VxZ+8rA86lwb/p6fM2MsWTABe5R60PUG67ZMaQzwdj2yncqA2MGmygQjz Q==;
X-CSE-ConnectionGUID: fuAigpyXTtib3WVxN2nsZw==
X-CSE-MsgGUID: Go2t/rcBSlqDRntTcOmhmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81468268"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="81468268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:31:19 -0700
X-CSE-ConnectionGUID: gi26VsKhSCerFZ7XkAnjHA==
X-CSE-MsgGUID: nZHdOf4nTCCIkwNWowdhOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231564411"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:31:17 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
Date: Mon, 20 Apr 2026 16:59:26 +0530
Message-ID: <20260420112925.1379274-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

When the device is wedged, GuC CT sends return -ECANCELED. This is
expected behavior, not an actionable error. Avoid logging these as
errors in the engine activity and power profile code paths.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 8 +++++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 4 ++--
 drivers/gpu/drm/xe/xe_uc.c                  | 5 ++++-
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2b99c1ebdd58..700f3464fb63 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -464,18 +464,20 @@ int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool
  *
  * Enable engine activity stats and set initial timestamps
  */
-void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
+int xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 {
 	int ret;
 
 	if (!xe_guc_engine_activity_supported(guc))
-		return;
+		return 0;
 
 	ret = enable_engine_activity_stats(guc);
-	if (ret)
+	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
 	else
 		engine_activity_set_cpu_ts(guc, 0);
+
+	return ret;
 }
 
 static void engine_activity_fini(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index b32926c2d208..188f325a462d 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -13,7 +13,7 @@ struct xe_guc;
 
 int xe_guc_engine_activity_init(struct xe_guc *guc);
 bool xe_guc_engine_activity_supported(struct xe_guc *guc);
-void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
+int xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
 int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
 u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
 					unsigned int fn_id);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 7ecd91ad6192..efcd432ef6ef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1202,7 +1202,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
 	ret = pc_action_set_param(pc,
 				  SLPC_PARAM_POWER_PROFILE,
 				  val);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err_once(pc_to_gt(pc), "Failed to set power profile to %d: %pe\n",
 			       val, ERR_PTR(ret));
 	else
@@ -1306,7 +1306,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	/* Set cached value of power_profile */
 	ret = xe_guc_pc_set_power_profile(pc, power_profile_to_string(pc));
-	if (unlikely(ret))
+	if (ret && !(xe_device_wedged(xe) && ret == -ECANCELED))
 		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 75091bde0d50..b440cf8c431d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -215,7 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
-	xe_guc_engine_activity_enable_stats(&uc->guc);
+	ret = xe_guc_engine_activity_enable_stats(&uc->guc);
+
+	if (xe_device_wedged(guc_to_xe(&uc->guc)) && ret == -ECANCELED)
+		return ret;
 
 	/* We don't fail the driver load if HuC fails to auth */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
-- 
2.43.0

