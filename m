Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37F0CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663D10FFAD;
	Tue,  2 Apr 2024 19:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+QOhYSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2710FFAD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712085417; x=1743621417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+F1WCkE31LeM9JzHTfUydaaBiDbntxajb46RCvG5JTE=;
 b=m+QOhYSNbh2m311OM6RRDsUQDkcTxSmE1cYtlmI4hSvqReHWhDZf3FAe
 ov8ZQ48ZX/7KGNmtP0+SE5f6nIgFEl1fPKcJEFiF8f0fxeFAXce7ly7yF
 ipbiuAMDIYF3kZkzVFz2lkPp0E4OXN1PR+f+LQdeiVZm5rmJcj+wV6r/w
 ClANBInfqogaXD9CtoimsXbzny9ljr9YMq0yIDlrOWbrbTZhBwFKNEjuF
 ZwR7U70Gw1t/PFmpdVnCLGsdAzLP1wy0NjT1J6mr4TxGCG+6x62ZqHLys
 cMk3c89n4nRfp1MLMgKAbkDPF+Go4VRlICF9E+fuOspoIrzKkV4pDODRL A==;
X-CSE-ConnectionGUID: BNCTnmRaQmmVkaX1BfiuNg==
X-CSE-MsgGUID: JfMlhoDXTU2ufZkmd/Pt+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7210429"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7210429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:16:57 -0700
X-CSE-ConnectionGUID: wDM2S7vyQ8+Ygu6RMo0hCA==
X-CSE-MsgGUID: mNItmnswQuqvENHm0FjMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18285020"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:16:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4] drm/xe/hwmon: Update xe hwmon with couple of fixes
Date: Wed,  3 Apr 2024 00:57:24 +0530
Message-Id: <20240402192724.673747-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Address potential overflows in result of multiplication of two lower
precision (u32) operands before widening it to higher precision (u64).

Initialize variables which were being used uninitialized.

v2:
 - Rebase.
 - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
   With this change caller function need not initialize value to 0.

v3:
 - Update commit msg as per review comments (Rodrigo, Lucas).
 - Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
   and output xe_reg. This is to have abstracted usage of xe_reg. (Lucas)

v4:
 - Fix return of true for unsupported registers also in xe_hwmon_get_reg.
   Return false for those.

Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 61 +++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7e8caac838e0..4bc26bdb13d5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -79,46 +79,51 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 };
 
-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
+static bool xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+			     int channel, struct xe_reg *reg)
 {
 	struct xe_device *xe = gt_to_xe(hwmon->gt);
-	struct xe_reg reg = XE_REG(0);
+
+	*reg = XE_REG(0);
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
+			*reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
+			*reg = PCU_CR_PACKAGE_RAPL_LIMIT;
 		break;
 	case REG_PKG_POWER_SKU:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_POWER_SKU;
+			*reg = PVC_GT0_PACKAGE_POWER_SKU;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_POWER_SKU;
+			*reg = PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
 		if (xe->info.platform == XE_PVC)
-			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+			*reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		else if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
+			*reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
 		break;
 	case REG_GT_PERF_STATUS:
 		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
-			reg = GT_PERF_STATUS;
+			*reg = GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+			*reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
+			*reg = PCU_CR_PACKAGE_ENERGY_STATUS;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
 	}
 
-	return reg.raw;
+	if (reg->addr)
+		return true;
+
+	return false;
 }
 
 static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
@@ -127,10 +132,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 {
 	struct xe_reg reg;
 
-	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
-
-	if (!reg.raw)
+	if (!xe_hwmon_get_reg(hwmon, hwmon_reg, channel, &reg)) {
+		*value = 0;
 		return;
+	}
 
 	switch (operation) {
 	case REG_READ32:
@@ -143,6 +148,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
 		break;
 	default:
+		*value = 0;
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
 		break;
@@ -298,7 +304,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	 * As y can be < 2, we compute tau4 = (4 | x) << y
 	 * and then add 2 when doing the final right shift to account for units
 	 */
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 
 	/* val in hwmon interface units (millisec) */
 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
@@ -339,7 +345,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
 	if (val > max_win)
@@ -397,10 +403,11 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
+	struct xe_reg reg;
 
 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
-	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
+	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index, &reg) ? attr->mode : 0;
 
 	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
@@ -493,19 +500,20 @@ static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	u32 uval;
+	struct xe_reg reg;
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
+		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel, &reg) ? 0664 : 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
+		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel, &reg) ? 0444 : 0;
 	case hwmon_power_crit:
 		if (channel == CHANNEL_PKG)
 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 		break;
 	case hwmon_power_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
+		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel, &reg) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -585,10 +593,12 @@ xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 static umode_t
 xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
+	struct xe_reg reg;
+
 	switch (attr) {
 	case hwmon_in_input:
 	case hwmon_in_label:
-		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
+		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel, &reg) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -609,10 +619,12 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
+	struct xe_reg reg;
+
 	switch (attr) {
 	case hwmon_energy_input:
 	case hwmon_energy_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
+		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel, &reg) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -758,12 +770,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	long energy;
 	u64 val_sku_unit = 0;
 	int channel;
+	struct xe_reg reg;
 
 	/*
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
+	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0, &reg)) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
 				     REG_READ32, &val_sku_unit, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-- 
2.25.1

