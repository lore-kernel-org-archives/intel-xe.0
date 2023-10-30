Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D698C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C8B10E29E;
	Mon, 30 Oct 2023 11:48:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC23510E29E
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698666503; x=1730202503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mmSYeYSmxRHquAh2TEaTML6WhBcJdfWoLQYwtwNLwyk=;
 b=CxLAQ+PZTiOyy/fbv3IM9GcvKok+K1vmGUtbWuh1+ITJixMEWP8ccLDx
 1nBMwpEEcatShujUyOCdIwzMfoo+pRExLGscCRVETxkZKOObYUjU6kjVT
 o27XX84KY/i3TraoQBuAzEZOJfaUHEoHDlWVB33lFkTmfwOE0vdv8Gp4I
 g1XrfIPWxx3DfBE5Ctcbl1+W2AnBjXnnBuZM9Dk85LKDocplzY+jG9/nH
 V4ie0viSqbrjqBSUmdumte1HwQlhoqj1IvcV145EwZ+2ZOH2PSQyrGohf
 dkUJAC5d6Fj9DzGdx2Kc0N6HnO1wlmcGgYO+Lm763wS4r3gYwt4V6FiR6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="391917218"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="391917218"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="736713680"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="736713680"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:20 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 17:26:16 +0530
Message-Id: <20231030115618.1382200-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231030115618.1382200-1-badal.nilawar@intel.com>
References: <20231030115618.1382200-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/hwmon: Add kernel doc and refactor
 xe hwmon
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add kernel doc and refactor some of the hwmon functions, there is
no functionality change.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 201 +++++++++++++++-------------------
 1 file changed, 91 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9ac05994a967..9b7773441f62 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -26,9 +26,9 @@ enum xe_hwmon_reg {
 };
 
 enum xe_hwmon_reg_operation {
-	REG_READ,
-	REG_WRITE,
-	REG_RMW,
+	REG_READ32,
+	REG_RMW32,
+	REG_READ64,
 };
 
 /*
@@ -39,18 +39,32 @@ enum xe_hwmon_reg_operation {
 #define SF_VOLTAGE	1000		/* millivolts */
 #define SF_ENERGY	1000000		/* microjoules */
 
+/**
+ * struct xe_hwmon_energy_info - to accumulate energy
+ */
 struct xe_hwmon_energy_info {
+	/** @reg_val_prev: previous energy reg val */
 	u32 reg_val_prev;
-	long accum_energy;		/* Accumulated energy for energy1_input */
+	/** @accum_energy: accumulated energy */
+	long accum_energy;
 };
 
+/**
+ * struct xe_hwmon - xe hwmon data structure
+ */
 struct xe_hwmon {
+	/** @hwmon_dev: hwmon device for xe */
 	struct device *hwmon_dev;
+	/** @gt: primary gt */
 	struct xe_gt *gt;
-	struct mutex hwmon_lock; /* rmw operations*/
+	/** @hwmon_lock: lock for rmw operations */
+	struct mutex hwmon_lock;
+	/** @scl_shift_power: pkg power unit */
 	int scl_shift_power;
+	/** @scl_shift_energy: pkg energy unit */
 	int scl_shift_energy;
-	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
+	/** @ei: Energy info for energy1_input */
+	struct xe_hwmon_energy_info ei;
 };
 
 static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
@@ -95,49 +109,34 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 	return reg.raw;
 }
 
-static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				enum xe_hwmon_reg_operation operation, u32 *value,
-				u32 clr, u32 set)
+static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation, u64 *value,
+				 u32 clr, u32 set)
 {
 	struct xe_reg reg;
 
 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
 
 	if (!reg.raw)
-		return -EOPNOTSUPP;
+		return;
 
 	switch (operation) {
-	case REG_READ:
+	case REG_READ32:
 		*value = xe_mmio_read32(hwmon->gt, reg);
-		return 0;
-	case REG_WRITE:
-		xe_mmio_write32(hwmon->gt, reg, *value);
-		return 0;
-	case REG_RMW:
+		break;
+	case REG_RMW32:
 		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
-		return 0;
+		break;
+	case REG_READ64:
+		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
+		break;
 	default:
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
-		return -EOPNOTSUPP;
+		break;
 	}
 }
 
-static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
-				       enum xe_hwmon_reg hwmon_reg, u64 *value)
-{
-	struct xe_reg reg;
-
-	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
-
-	if (!reg.raw)
-		return -EOPNOTSUPP;
-
-	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
-
-	return 0;
-}
-
 #define PL1_DISABLE 0
 
 /*
@@ -146,42 +145,39 @@ static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
  * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
  * clamped values when read.
  */
-static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
+static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 {
-	u32 reg_val;
-	u64 reg_val64, min, max;
+	u64 reg_val, min, max;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
-		return 0;
+		return;
 	}
 
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
-	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
+	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0);
+	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
-	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
+	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
 	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
 
 	if (min && max)
 		*value = clamp_t(u64, *value, min, max);
-
-	return 0;
 }
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 {
-	u32 reg_val;
+	u64 reg_val;
 
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
 				     PKG_PWR_LIM_1_EN, 0);
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
 				     PKG_PWR_LIM_1_EN, 0);
 
 		if (reg_val & PKG_PWR_LIM_1_EN)
@@ -192,21 +188,19 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
 
 	return 0;
 }
 
-static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
+static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 {
-	u32 reg_val;
+	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
+	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
-
-	return 0;
 }
 
 /*
@@ -233,13 +227,11 @@ static void
 xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 {
 	struct xe_hwmon_energy_info *ei = &hwmon->ei;
-	u32 reg_val;
-
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	u64 reg_val;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
+	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
 			     &reg_val, 0, 0);
 
 	if (reg_val >= ei->reg_val_prev)
@@ -253,8 +245,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 				  hwmon->scl_shift_energy);
 
 	mutex_unlock(&hwmon->hwmon_lock);
-
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
@@ -284,16 +274,39 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
-static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
+static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
 {
-	u32 reg_val;
+	int ret;
+	u32 uval;
+
+	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+	if (ret)
+		return ret;
+
+	*value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				 scale_factor, POWER_SETUP_I1_SHIFT);
+	return ret;
+}
+
+static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
+{
+	int ret;
+	u32 uval;
+
+	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+
+	return ret;
+}
+
+static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
+{
+	u64 reg_val;
 
 	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ, &reg_val, 0, 0);
+			     REG_READ32, &reg_val, 0, 0);
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
-
-	return 0;
 }
 
 static umode_t
@@ -317,23 +330,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 static int
 xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_power_max_read(hwmon, val);
+		xe_hwmon_power_max_read(hwmon, val);
+		return 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_power_rated_max_read(hwmon, val);
-	case hwmon_power_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (!(uval & POWER_SETUP_I1_WATTS))
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		xe_hwmon_power_rated_max_read(hwmon, val);
 		return 0;
+	case hwmon_power_crit:
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -342,14 +347,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, val);
 	case hwmon_power_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -372,19 +374,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
 static int
 xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (uval & POWER_SETUP_I1_WATTS)
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_CURR, POWER_SETUP_I1_SHIFT);
-		return 0;
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -393,12 +385,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 static int
 xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -418,21 +407,13 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
 static int
 xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 {
-	int ret;
-
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
-
 	switch (attr) {
 	case hwmon_in_input:
-		ret = xe_hwmon_get_voltage(hwmon, val);
-		break;
+		xe_hwmon_get_voltage(hwmon, val);
+		return 0;
 	default:
-		ret = -EOPNOTSUPP;
+		return -EOPNOTSUPP;
 	}
-
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
-
-	return ret;
 }
 
 static umode_t
@@ -564,15 +545,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 {
 	struct xe_hwmon *hwmon = xe->hwmon;
 	long energy;
-	u32 val_sku_unit = 0;
-	int ret;
+	u64 val_sku_unit = 0;
 
-	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
 	/*
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (!ret) {
+	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
+		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				     REG_READ32, &val_sku_unit, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 	}
-- 
2.25.1

