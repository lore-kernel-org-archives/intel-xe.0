Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02D5C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 11:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80228112176;
	Fri, 15 Mar 2024 11:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2z7UARZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D106112176
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710500888; x=1742036888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7FjmtJePFOjhF6YI8g1TSwHDwGxppGGs/WHvwqvZIXg=;
 b=h2z7UARZkWmz1LMQGsVsLe2DzjCr5sc7BS0OtOuKNjcviFq50D/Hdnx6
 ysV7IU6sXkLkGQtPs3bebvSqRRIkUtqj6OOPElM3sve06yp92cNkQ37nJ
 PZ1ZnVygF2fyIM+Ixn5VC1X1sBzQSe5jYNwBIEpiUDRbqbPEo+BuFq4VT
 6bFcDLTghOcqpkaUAbw/27o80lnAinrERMkfNTmr3aJsaInLKFsVv5wsO
 9mvNSQOaYRixMub2vPep/IW04EOWl2AQvbzcP0ETctR0FDOdD8dDuCs0u
 sMGt7YWgP9y4VGj58Bsl0D3s5wYKGYnAQsggjmCW5sPpVbKj5GKv+1lut Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5229481"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5229481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17340758"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:08:06 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Date: Fri, 15 Mar 2024 16:51:47 +0530
Message-Id: <20240315112147.2460691-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315112147.2460691-1-badal.nilawar@intel.com>
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
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

Enable GuC Wa_14019882105 to block interrupts during C6 flow
when the memory path has been blocked

Cc: John Harrison <john.harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0400bc0fccdc..5dd45e06f0b6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -319,4 +319,11 @@ enum  {
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
 
+/*
+ * Workaround keys:
+ */
+enum xe_guc_klv_ids {
+	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ee48cf01fe22..3d2048747230 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -7,6 +7,8 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -19,6 +21,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
@@ -281,8 +284,30 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 
 #define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 
+static u32 guc_waklv_opt_in(struct xe_guc_ads *ads,
+			    enum xe_guc_klv_ids klv_id, u32 offset, u32 remain)
+{
+	u32 size;
+	u32 klv_entry[] = {
+		/* 16:16 key/length */
+		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+		FIELD_PREP(GUC_KLV_0_LEN, 0),
+		/* 0 dwords data */
+	};
+
+	size = sizeof(klv_entry);
+
+	if (remain < size)
+		drm_warn(&ads_to_xe(ads)->drm, "Cannot apply guc wa klv_id %d\n", klv_id);
+	else
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), offset,
+				 klv_entry, size);
+	return size;
+}
+
 static void guc_waklv_init(struct xe_guc_ads *ads)
 {
+	struct xe_gt *gt = ads_to_gt(ads);
 	u32 addr_ggtt, offset, remain, size;
 	struct xe_uc_fw *uc_fw = &ads_to_guc(ads)->fw;
 	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
@@ -293,15 +318,13 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
-	/*
-	 * Add workarounds here:
-	 *
-	 * if (want_wa_<name>) {
-	 *      size = guc_waklv_<name>(guc, offset, remain);
-	 *      offset += size;
-	 *      remain -= size;
-	 * }
-	 */
+	if (XE_WA(gt, 14019882105)) {
+		size = guc_waklv_opt_in(ads,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					offset, remain);
+		offset += size;
+		remain -= size;
+	}
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 48cdba1cbf95..a8d15f004b6c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,3 +19,4 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
+14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-- 
2.25.1

