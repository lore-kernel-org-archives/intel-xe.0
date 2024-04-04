Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C4ACD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 14:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE220112838;
	Thu,  4 Apr 2024 14:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abB9Wtqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383C11296E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712241677; x=1743777677;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OTirNbIbq7yuDBh6FXuhXe/JAsqUlQyB9M0dBNJMVVU=;
 b=abB9WtqwYvYYOAUn8dRCMmI3kYkdAn3H9ritG5lsPprMa6OnOuKxL5VV
 D4Dp3s9bba5JmE7YEB+FgVVmMNCVEYeXA6kduECl8ZGpS9Zo+fauboGDJ
 q3FvcwWnyN+kb61xNZBMQTyEeI9iHdZ37eL/sng1UjEGKFV0cKreKcfdU
 nWw40mfFnYSYkJIesoEX3eaM5LStVCF2t41Chp7UD5yK1sOwwjgnZGefi
 glnAmhOZJKj1Q5/p8YsHI419+9Dqc8lQybg50vqBS87rhUdx/om4M0MAZ
 iWd05n2H6kVEiOeH0bDalFGvAnwMagdxAFX2kSL3komDVw6+ZSa0CaV5l A==;
X-CSE-ConnectionGUID: x2wBxh+GSMKaedcrGAWGgg==
X-CSE-MsgGUID: gt+5XHhARlOX+eFVcv3mgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7378669"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7378669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:41:16 -0700
X-CSE-ConnectionGUID: t6ccAk/TSxa8kPzQduY/8w==
X-CSE-MsgGUID: 7tNAJEAUTG6KOzkzRLaBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="50031138"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:41:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/guc: Reuse code while debugging GuC params
Date: Thu,  4 Apr 2024 16:41:07 +0200
Message-Id: <20240404144107.539-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404144107.539-1-michal.wajdeczko@intel.com>
References: <20240404144107.539-1-michal.wajdeczko@intel.com>
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

There is no need to duplicate code to print GuC parameters.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index afb083c7cbfa..17041c9257bf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -180,14 +180,22 @@ static u32 guc_ctl_devid(struct xe_guc *guc)
 	return (((u32)xe->info.devid) << 16) | xe->info.revid;
 }
 
+static void guc_dbg_params(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 *params = guc->params;
+	int i;
+
+	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
+
+	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
+		xe_gt_dbg(gt, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+}
+
 static void guc_init_params(struct xe_guc *guc)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	u32 *params = guc->params;
-	int i;
-
-	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
-	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = 0;
@@ -196,18 +204,12 @@ static void guc_init_params(struct xe_guc *guc)
 	params[GUC_CTL_WA] = 0;
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
-	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		xe_gt_dbg(gt, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+	guc_dbg_params(guc);
 }
 
 static void guc_init_params_post_hwconfig(struct xe_guc *guc)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	u32 *params = guc->params;
-	int i;
-
-	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
-	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
@@ -216,8 +218,7 @@ static void guc_init_params_post_hwconfig(struct xe_guc *guc)
 	params[GUC_CTL_WA] = guc_ctl_wa_flags(guc);
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
-	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		xe_gt_dbg(gt, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+	guc_dbg_params(guc);
 }
 
 /*
-- 
2.43.0

