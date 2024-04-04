Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED90CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015CF10E7F8;
	Thu,  4 Apr 2024 15:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kup1K755";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D9D10E31D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712245982; x=1743781982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hfbRhUun51hatwKu4xoyOykBWTTIxxDvM2Lbb/5xu6k=;
 b=Kup1K7555lcq3AQNr8/EhOeGrCYWzixTK6gUCyC/ZJDO5bgkVq7183DK
 hvdDVVQ1X+30nYzweTz7p2YYc/LtDtsM74HAdNidHqSMoWNh5gFDdcuT+
 cBQQyL5orMZTvCV20hR0S6PlfFFeoFQLacEMXVPyFKJ9ROuG4obfg5i3v
 q3Uo65UWphYstjLHBDWw3XBk0T4jnl0q5ESBz3dHBXL22q0rUAOpdhaUU
 lDWlXKVKT4u+ymCh5gjImlwiAdkT7RSLGSNlGl4sdkw5xC1c6wrGnxZAt
 lBmdEPq/5V3KQNOxkOx0RAYZ8Cz/xH6QJdZfwhUeaVFMVxfddl49wh0HF w==;
X-CSE-ConnectionGUID: Ns/+9eIHTQyTBm8eDmPBoA==
X-CSE-MsgGUID: za34ZMheTTeDTsL3gcK+vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11313706"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11313706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:52:54 -0700
X-CSE-ConnectionGUID: EAKxSHclTYmpSH0xKlZ69Q==
X-CSE-MsgGUID: yaErDPE+QBeZ0na1S2ap+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23592360"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:52:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/guc: Reuse code while debugging GuC params
Date: Thu,  4 Apr 2024 17:50:46 +0200
Message-Id: <20240404155046.627-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404155046.627-1-michal.wajdeczko@intel.com>
References: <20240404155046.627-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: s/guc_dbg_params/guc_print_params (Lucas)
---
 drivers/gpu/drm/xe/xe_guc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index afb083c7cbfa..59fe73770711 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -180,14 +180,22 @@ static u32 guc_ctl_devid(struct xe_guc *guc)
 	return (((u32)xe->info.devid) << 16) | xe->info.revid;
 }
 
+static void guc_print_params(struct xe_guc *guc)
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
+	guc_print_params(guc);
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
+	guc_print_params(guc);
 }
 
 /*
-- 
2.43.0

