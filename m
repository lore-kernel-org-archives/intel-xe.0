Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303F9CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C099E11B032;
	Thu,  4 Apr 2024 09:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/SJyL4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43311B032
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712224687; x=1743760687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=epBxZ13ouHl741V5inwVCJG8xRiFf1HKxtqiRJFXaQc=;
 b=E/SJyL4GSJGem7PV9uk/ahmanEVWuwsjritNn7COtCd1XKpvffaI+R6R
 u0nIsAmNtGMsBivvd+SEt0k0Hcy70bdHy7KWUQ/IwDfaWoyqnM8F4fo6b
 JiCsHbX7IY5aPaOS/ZqcVV0AYRNIK/fvYIX08Z17Z/DrqhCPmNlEB+SIe
 356P9pIlgs9uv4QLRpPVgbN6UZM6HiS5hA+Aq9Pjlj0Pc0x7QnF97zZEE
 MuSpxeMIxGYiC16UWrgpw0NHU3K+sPjhOGGw3JDEAhzl4u1kTT1k2Ea5O
 soAtypKh3nbdnlBB4SoQ2gdzIBXS4IA7hZbW3+w5MHRD4kMuVDoqyAWzo g==;
X-CSE-ConnectionGUID: O4fJLqKbReG2uaBft7Xcqg==
X-CSE-MsgGUID: XhlTeimoQWKFiR8YSjycow==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18227737"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18227737"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:58:07 -0700
X-CSE-ConnectionGUID: 0wxEy8eYTG+BC6HGBKk/UA==
X-CSE-MsgGUID: DcsGztPwTEqsOtUgkCLB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23422190"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:58:02 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return struct
 xe_reg
Date: Thu,  4 Apr 2024 15:38:25 +0530
Message-Id: <20240404100827.1109447-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404100827.1109447-1-karthik.poosa@intel.com>
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
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

Return struct xe_reg instead of reg.raw from xe_hwmon_get_reg
to have abstracted usage of struct xe_reg.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7e8caac838e0..2385f05d9504 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -79,46 +79,46 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 };
 
-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
+static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				      int channel)
 {
 	struct xe_device *xe = gt_to_xe(hwmon->gt);
-	struct xe_reg reg = XE_REG(0);
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
+			return PVC_GT0_PACKAGE_RAPL_LIMIT;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
+			return PCU_CR_PACKAGE_RAPL_LIMIT;
 		break;
 	case REG_PKG_POWER_SKU:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_POWER_SKU;
+			return PVC_GT0_PACKAGE_POWER_SKU;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_POWER_SKU;
+			return PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
 		if (xe->info.platform == XE_PVC)
-			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		else if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
+			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
 		break;
 	case REG_GT_PERF_STATUS:
 		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
-			reg = GT_PERF_STATUS;
+			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
+			return PCU_CR_PACKAGE_ENERGY_STATUS;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
 	}
 
-	return reg.raw;
+	return XE_REG(0);
 }
 
 static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
@@ -127,9 +127,9 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 {
 	struct xe_reg reg;
 
-	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
+	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
 
-	if (!reg.raw)
+	if (!XE_REG_IS_VALID(reg))
 		return;
 
 	switch (operation) {
@@ -400,7 +400,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 
 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
-	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
+	ret = XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
 
 	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
@@ -496,16 +496,19 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+				       channel)) ? 0664 : 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
+				       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
 		if (channel == CHANNEL_PKG)
 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 		break;
 	case hwmon_power_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -588,7 +591,8 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_in_input:
 	case hwmon_in_label:
-		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -612,7 +616,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_energy_input:
 	case hwmon_energy_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -763,7 +768,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
+	if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
 				     REG_READ32, &val_sku_unit, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-- 
2.25.1

