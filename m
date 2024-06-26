Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9426C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C510E964;
	Wed, 26 Jun 2024 16:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dY8RMZ2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641F010E968
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719420950; x=1750956950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4pCpgKOwS/zXCym9ZU9QJBef7f8jOdpgalgmKG8JTM=;
 b=dY8RMZ2k48+cULsJ7Og+KQNVgH1NIGz7CIXfZf4rxkXT0vG21WsZkQxP
 pwdV/x4Pdl3xrHgD00u2msV8GXFEjEoZ26UnA/mDevLCIgxmEnoIUp49J
 DYwnt6YXVB8IYpKOw9xOZDZDwW8qQZTyKulNZ9soGnvWHjxHZ10RP/phi
 VhnE/n1wToyhvT4a+5Jo8siDtaUQ/W5BKTnwOl4RGJNZo3hYz5+O8/zzR
 nNi0UOB6IcJx8shPd13ZxpI3r/NMeYjZlZbmS3L/nDClHNuoZfsdtXwWy
 byV70nMfpjdTOv51bF13NL6jLuHUO3ZmzqxlhlLXuNdN3VA7NUepMyUAZ Q==;
X-CSE-ConnectionGUID: 2AWafzIDQ6OdGmkQRyIG8w==
X-CSE-MsgGUID: u1crgp0UQXCnAWuhq5tUyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="33962076"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="33962076"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:55:26 -0700
X-CSE-ConnectionGUID: Pvcj4rTxQGGhavM4Ta44Ig==
X-CSE-MsgGUID: wC0MBWgHQISfzrVRac93GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43959330"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:55:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 1/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Wed, 26 Jun 2024 22:37:46 +0530
Message-Id: <20240626170746.2926011-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626170746.2926011-1-karthik.poosa@intel.com>
References: <20240626170746.2926011-1-karthik.poosa@intel.com>
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

Remove xe_hwmon_process_reg as it is a umbrella function which can be
avoided (Lucas).

v2: Improve commit message. (Badal)

v3: Add couple of comments. (Lucas)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 89 ++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 222c651ee1f8..0c8ce09e5025 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -137,34 +137,6 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				 enum xe_hwmon_reg_operation operation, u64 *value,
-				 u32 clr, u32 set, int channel)
-{
-	struct xe_reg reg;
-
-	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
-
-	if (!xe_reg_is_valid(reg))
-		return;
-
-	switch (operation) {
-	case REG_READ32:
-		*value = xe_mmio_read32(hwmon->gt, reg);
-		break;
-	case REG_RMW32:
-		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
-		break;
-	case REG_READ64:
-		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
-		break;
-	default:
-		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
-			 operation);
-		break;
-	}
-}
-
 #define PL1_DISABLE 0
 
 /*
@@ -176,10 +148,25 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
 	u64 reg_val, min, max;
+	struct xe_device *xe = gt_to_xe(hwmon->gt);
+	struct xe_reg rapl_limit, pkg_power_sku;
+
+	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+	/*
+	 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
+	 * So not checking it again here.
+	 */
+	if (!xe_reg_is_valid(pkg_power_sku)) {
+		drm_warn(&xe->drm, "pkg_power_sku invalid\n");
+		*value = 0;
+		return;
+	}
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
@@ -189,7 +176,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read64_2x32(hwmon->gt, pkg_power_sku);
 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
@@ -205,16 +192,16 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 {
 	int ret = 0;
 	u64 reg_val;
+	struct xe_reg rapl_limit;
+
+	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-				     PKG_PWR_LIM_1_EN, 0, channel);
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
-				     PKG_PWR_LIM_1_EN, 0, channel);
-
+		reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
+		reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
 		if (reg_val & PKG_PWR_LIM_1_EN) {
 			ret = -EOPNOTSUPP;
 			goto unlock;
@@ -224,9 +211,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
+	reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
@@ -234,9 +220,15 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
+	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
+	/*
+	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
+	 * for this register can be skipped.
+	 * See xe_hwmon_power_is_visible.
+	 */
+	reg_val = xe_mmio_read32(hwmon->gt, reg);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -267,8 +259,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
-			     &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+							     channel));
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -294,8 +286,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
-			     REG_READ32, &r, 0, 0, sensor_index);
+	r = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -383,8 +374,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
-			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
+	r = xe_mmio_rmw32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
+			  PKG_PWR_LIM_1_TIME, rxy);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -499,8 +490,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel));
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
@@ -784,14 +774,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	long energy;
 	u64 val_sku_unit = 0;
 	int channel;
+	struct xe_reg pkg_power_sku_unit;
 
 	/*
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
-				     REG_READ32, &val_sku_unit, 0, 0, 0);
+	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
+	if (xe_reg_is_valid(pkg_power_sku_unit)) {
+		val_sku_unit = xe_mmio_read32(hwmon->gt, pkg_power_sku_unit);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
-- 
2.25.1

