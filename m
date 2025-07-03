Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC936C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C71A10E8F9;
	Thu,  3 Jul 2025 21:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQyxYrny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56610E8F9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751578727; x=1783114727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5wPFxK2nTImG4wWONVyy5eiufQ6cljNbfOT99jlVOiY=;
 b=mQyxYrny7ocv2zkDB2Z8VVR2g6ChI/58VdEFLHUYGQP+gjbWHOuHrI5K
 oiflKxZAYwEh0FpuoydEmohquZo0C/kPcqk7KHj2eqK7O/thOY1TIV5jO
 KiRYPvPr0VEh/aoyaM1XdZ8M608b48DU9czjc0niMRgNuErzpuhjP7GPE
 oX+qkNQsxlN2JuJ23I8GanBAzay7uikz/5lMVydZCov8p3ZsuGMlvsVIh
 WB2UKLd6NwCaKJxvTxChFBNP8gS6UX9jaqJHlfuujTihxCvg65V23WRrQ
 x0AP2NYjssvUnDGVndE7BYZm2f0ihweDLjPBpAf6fcrYmkXwH3DMwdLxm A==;
X-CSE-ConnectionGUID: RPxkWbPSRR2DkCyjWz4r/A==
X-CSE-MsgGUID: EvGC8zbqRC62h4m94nEY/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79354771"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79354771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:38:47 -0700
X-CSE-ConnectionGUID: mB+B7zzxSQiiOFj2uTjztA==
X-CSE-MsgGUID: 6/nP6l96SnSQpp2wPQIlVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="185428604"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 14:38:47 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Date: Thu,  3 Jul 2025 17:38:45 -0400
Message-Id: <20250703213845.2259302-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Disable GuC communication on Xe micro controller hardware initialization
error.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>

Change list:
v8: Fix kernel-doc style
    Add error handling in vf_guc_min_load_for_hwconfig
v7: Add kernel-doc for xe_guc_disable_communication
    Unset submission_state.enabled as well
v6: Skip disable ct on xe_guc_enable_communication error
v5: Set wedge is excessive action, revert back to disable ct
v4: Fix typo and add new line
v3: v2 CI re-run
v2: Remove unnecessary jump to err-out
    Drop disable ct, switch to set wedge
---
 drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8573957facae..6643a2cb898b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	ret = xe_gt_sriov_vf_connect(gt);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_gt_sriov_vf_query_runtime(gt);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	return 0;
+
+err_out:
+	xe_guc_disable_communication(guc);
+	return ret;
 }
 
 /**
@@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
+/**
+ * xe_guc_disable_communication() - Disable GuC communication
+ * @guc: The GuC object
+ *
+ * This function will disable the GuC communication.
+ */
+void xe_guc_disable_communication(struct xe_guc *guc)
+{
+	guc->submission_state.enabled = false;
+	xe_guc_ct_disable(&guc->ct);
+}
+
 int xe_guc_suspend(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 22cf019a11bf..20823b821f7d 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
+void xe_guc_disable_communication(struct xe_guc *guc);
 int xe_guc_opt_in_features_enable(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 6431ba3a2c53..1012fe84b379 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
@@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	uc->guc.submission_state.enabled = true;
 
@@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	return 0;
+
+err_out:
+	xe_guc_disable_communication(&uc->guc);
+	return err;
 }
 
 /*
@@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+
+err_out:
+	xe_guc_disable_communication(&uc->guc);
+	return ret;
 }
 
 int xe_uc_reset_prepare(struct xe_uc *uc)
-- 
2.34.1

