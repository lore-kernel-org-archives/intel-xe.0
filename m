Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3BCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F53A113BCB;
	Fri,  5 Apr 2024 12:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRu23Yi9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3F113BCB
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321466; x=1743857466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nTm1eLIOshqhbf2R8pbZywjeG5aKUsDq1kQA+GR9hGo=;
 b=SRu23Yi9/ZpJ/HpFemppO/4q84WYcf9U0CTUVy5DjmV5L0lmaXfZlKdA
 8AlWsm8YsRKu5t21WtHnMSfP2AqWyDJCbIXVkhNdZhqrXwaJQfM0O3sL8
 8KiEWbJOHcAB3x5zSnBlhwhL49uiocwS3rRljpw1e8HWeW6hU9TL5lWFY
 A+8MGzRJD/cPXd4q/d0/eN4kMOjdJx1ocKUZgfz1iWm3iPJicvmXscXR5
 c6CxziJkDfdCKLWdwT8yq0DMIUa6yjkjK9UnAC/7CQwG/l5SGzhsdzeg5
 LNaDo/xUnDNkMH9abuboepeuQzVffcwM460FO+NJnR0hq3SVydfIEmkC0 Q==;
X-CSE-ConnectionGUID: 1Zs3uSTtQQSzTcO3/EPhJQ==
X-CSE-MsgGUID: XZdEWxfJRqCcKpCrr/Xv6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810076"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7810076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:06 -0700
X-CSE-ConnectionGUID: IxO+Azn4QeCj8xpN2EFDEg==
X-CSE-MsgGUID: QXFSl3jnRZKTFifDdiDhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23643864"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:03 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return struct
 xe_reg
Date: Fri,  5 Apr 2024 18:31:25 +0530
Message-Id: <20240405130127.1392426-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405130127.1392426-1-karthik.poosa@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
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

v2:
 - Use xe_reg_is_valid function instead of XE_REG_IS_VALID macro
   as it is removed.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7e8caac838e0..a3b2ec0d24d8 100644
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
+	if (!xe_reg_is_valid(reg))
 		return;
 
 	switch (operation) {
@@ -400,7 +400,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 
 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
-	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
+	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
 
 	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
@@ -496,16 +496,19 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+				       channel)) ? 0664 : 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
+				       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
 		if (channel == CHANNEL_PKG)
 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 		break;
 	case hwmon_power_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -588,7 +591,8 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_in_input:
 	case hwmon_in_label:
-		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -612,7 +616,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_energy_input:
 	case hwmon_energy_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -763,7 +768,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
+	if (xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
 				     REG_READ32, &val_sku_unit, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-- 
2.25.1

