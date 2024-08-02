Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44892C52D6D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 00:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96B710E92B;
	Fri,  2 Aug 2024 00:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgE9PK9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D4610E638
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722559223; x=1754095223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XVsp0aabdqwRhjxlS/yOlYQEQEejniLapd+Do5t4CKA=;
 b=MgE9PK9Ee099o5bR22xnQtJd89NZyJkmk5Ibcak/VFyNx/R1/aaD5K2i
 riWBkOuVYMixxjBCOOK8BaV9nNo2uk+Q9CiSMuXO5irLI8yxq9id4lZZf
 BUbuKSQvGqu9oX8MzD8VwWlcZlO6arSnPop3luFPXF5cGW94dC5mLKrby
 +yLS6VBOf5BFPbLE3ZNsIY/2r6rWpI7lYAKOu94yh1GqzXtf0dFwEOkP7
 jO6QphHPsV/U4Xnai9SSo3fWVnztbkJvidR9EBPi++bJL4ait6O038kdy
 MLqNB4bOPHDwg2uz0hz2ni7BQnKt9eN0gg6fhuQaajYEHsxEdWJhBFYH1 Q==;
X-CSE-ConnectionGUID: EEcIjTtqQLq41uu/STUcXg==
X-CSE-MsgGUID: je2BddELQDe4MIOJ/D/oFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="45963264"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="45963264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:22 -0700
X-CSE-ConnectionGUID: 77l3IZrqSCea/hfs2g/K3Q==
X-CSE-MsgGUID: HQYypEd9S76mAgqxKp+Q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="92767535"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:21 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Date: Thu,  1 Aug 2024 17:40:17 -0700
Message-ID: <20240802004017.3057708-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802004017.3057708-1-julia.filipchuk@intel.com>
References: <20240802004017.3057708-1-julia.filipchuk@intel.com>
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

Enable workarounds for HW bug where render engine reset fails. Check
firmware version supports the workarounds.

v2: Enable KLV correctly for either workaround (Lucas)
v4: Add check for minimum supported GuC firmware version. Enable w/a for
hw version 20.01 too. (Daniele)

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 8f9f60b28306..6b30743a2f6c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
+	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 1c60b685dbc6..ba70e6a81d88 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -24,6 +24,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_uc_fw.h"
 #include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
@@ -337,9 +338,14 @@ static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
 static void guc_waklv_init(struct xe_guc_ads *ads)
 {
 	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_guc *guc = ads_to_guc(ads);
 	u64 addr_ggtt;
 	u32 offset, remain, size;
+	u64 fw_ver;
 
+	xe_gt_assert(gt, guc->fw.type == XE_UC_FW_TYPE_GUC);
+
+	fw_ver = GUC_FIRMWARE_VER(guc);
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
@@ -367,6 +373,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					  0xC40,
 					  &offset, &remain);
 
+	if (fw_ver >= MAKE_VER(70, 29, 0) &&
+		(XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406)))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..5cf27ff27ce6 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,6 +27,10 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+14022293748	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
+22019794406	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 22019338487_display	PLATFORM(LUNARLAKE)
-- 
2.45.2

