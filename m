Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F613C7115B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 01:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D7B10E491;
	Tue, 24 Jun 2025 01:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNQU8Ayu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277C810E491
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750727862; x=1782263862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRzSezwm+Tx4zGPqnsF+Qd0Lv0gsvjsuzki1XqiZcN0=;
 b=ZNQU8AyucAeW6HRmvMaAsqETkvLLknnGZ4ranXWGR8ARLpeyYd0MYStg
 RS6UQhnXACxmYuAn9SZRuaoFH/WmmpvscAlNC0qSJsgWTDTJ2k3mMQYMs
 3DdwUCIrmdTQz1Az/P52WqomG/Pp2/3GqeT6ctdWtngHb8xGN2UYpeZx9
 DhvcxtBs1pa41XVe9W+GKt6YCdL0Z2fK6a+4QhSvwuzE3iAS2AZ8BXcNY
 OFqIuNRYapFwKQZS2eVm8tss+GMMEzvAePRU1ZvfAxzuzllEX+uhsiHqm
 Z67fBZ4KXKTmptHYJfoKKdzZoHcjZzNLiTuUmfCGLEH3MeCnhfI1VLszU A==;
X-CSE-ConnectionGUID: ZOYqDIgvQ+y5wITjQAscDQ==
X-CSE-MsgGUID: C34IB2ZKSVuOmu04f1iJeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52823289"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52823289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 18:17:37 -0700
X-CSE-ConnectionGUID: Dcpmx8YyS4mkEL5eu5VYNg==
X-CSE-MsgGUID: yuGKrsdeTA2M5YmsPCB8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151915537"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2025 18:17:37 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Date: Mon, 23 Jun 2025 21:17:35 -0400
Message-Id: <20250624011735.3976-1-zhanjun.dong@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>

Change list:
v6: Skip disable ct on xe_guc_enable_communication error
v5: Set wedge is excessive action, revert back to disable ct
v4: Fix typo and add new line
v3: v2 CI re-run
v2: Remove unnecessary jump to err-out
    Drop disable ct, switch to set wedge
---
 drivers/gpu/drm/xe/xe_guc.c |  5 +++++
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 209e5d53c290..9d7175b16cc7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1230,6 +1230,11 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
+void xe_guc_disable_communication(struct xe_guc *guc)
+{
+	xe_guc_ct_disable(&guc->ct);
+}
+
 int xe_guc_suspend(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 58338be44558..285c19929f8c 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
+void xe_guc_disable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92d..d74bfc7a85d1 100644
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
@@ -161,15 +162,19 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	uc->guc.submission_state.enabled = true;
 
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
@@ -201,15 +206,15 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
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
 
@@ -221,6 +226,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+
+err_out:
+	xe_guc_disable_communication(&uc->guc);
+	return ret;
 }
 
 int xe_uc_fini_hw(struct xe_uc *uc)
-- 
2.34.1

