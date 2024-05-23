Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048AC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 18:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA10810E154;
	Thu, 23 May 2024 18:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UscSiLAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC2110E154
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716488052; x=1748024052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6HB7JWDW/D2MqcLY7hmrefwJs1Ha8tmj4DKtDt7J9A=;
 b=UscSiLAGEUypAAP3/C7edx1nYVkRqCgrQWX7Nz59i6woPOdzHBmvr+zh
 DvGDy/Bx0PHZWi1AJqWE7NnwJboILSLrdeJ74L20GQf4pbvo12ZiH1G8I
 1UBBtxhFbL+5u3/c3hjcHh7kZbtmkBTcgcePHeHl5vWNji8d4jeTR1FDp
 g4rLTWcGNndeJjPqf5X1WLA20GCL//VTJpCuNJhBYCilxNTkQ5ccZKQh1
 5WgEOVT2YTdzB4NDxdE+woJpPwvcyhLaYq/CFExv9pdBaYxXkFecX0pex
 EcA3TX3MtdkKKVMxneZ8G4K6lUyS9iibXQNPASBqSu5ebAzdk43OmvFWn w==;
X-CSE-ConnectionGUID: wPVBfNbmQqKFHo9HPqjd2A==
X-CSE-MsgGUID: pbKXAjh5QoSko0X54jjWvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12947258"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12947258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 11:14:12 -0700
X-CSE-ConnectionGUID: ol+knp4yTRuAuLUxoXwAfQ==
X-CSE-MsgGUID: lCHd4vW0T3med7JfwP7cqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38605793"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 11:14:09 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 lucas.demarchi@intel.com, ashutosh.dixit@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Thu, 23 May 2024 23:55:40 +0530
Message-Id: <20240523182540.2777895-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523182540.2777895-1-karthik.poosa@intel.com>
References: <20240523182540.2777895-1-karthik.poosa@intel.com>
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

v2: Improve commit message (Badal).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 80 ++++++++++++++---------------------
 1 file changed, 31 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index dca275117232..4d8ee9cac068 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -121,34 +121,6 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
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
@@ -160,10 +132,21 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
 	u64 reg_val, min, max;
+	struct xe_device *xe = gt_to_xe(hwmon->gt);
+	struct xe_reg rapl_limit, pkg_power_sku;
+
+	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
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
@@ -173,7 +156,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read64_2x32(hwmon->gt, pkg_power_sku);
 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
@@ -189,16 +172,16 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
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
@@ -208,9 +191,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
+	reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
@@ -220,7 +202,8 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
+	/* REG_PKG_POWER_SKU validity is checked in visible, we need not check again here */
+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel));
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -251,8 +234,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
-			     &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+							     channel));
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -278,8 +261,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
-			     REG_READ32, &r, 0, 0, sensor_index);
+	r = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -367,8 +349,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
-			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
+	r = xe_mmio_rmw32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
+			  PKG_PWR_LIM_1_TIME, rxy);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -483,8 +465,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel));
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
@@ -768,14 +749,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
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

