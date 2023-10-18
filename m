Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A5CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 18:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76FB10E083;
	Wed, 18 Oct 2023 18:56:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48A010E083
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697655357; x=1729191357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QLFXnqwXt1f36YDk2FqCbtOQxNd0nrBYx/aSkAySMTc=;
 b=AC46405kZyW0Adgw+upXsgsecoZmSfAVFwrTTnlBO/GT8f6MLDxkeNSU
 yvoohgbBBvXst23GTTJi6nCGn5ldAMxYjF44zdiDYECuxgndgD0eQrJ6Y
 pvMcARAWfoIn4Z576howSjZPScV9yPvKmu/m+ojmdcvKojV8f4ZOfsW0C
 +IAYyrf/bhZm/7wSGpzlojYkSlmJVCDGvyU3sTAlQhkDY1F5faQLD44uo
 GAzoFs3JxkG0Gz0+TuAs9RAto4Za7KM0s5WAd3W41Oy67zT2GylAbKqlc
 z+Zmcn9FJnbDj1j0WQKQRw531MdDGoMy/Hu7Poo1EUwft8w60S7aW1N9a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388946337"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388946337"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900447215"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="900447215"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:53:50 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 00:33:39 +0530
Message-Id: <20231018190341.726098-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018190341.726098-1-badal.nilawar@intel.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg accesses to
 xe_hwmon_process_reg
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

Maintain single wrapper for 32 bit and 64 bit reg accesses

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 122 +++++++++++++---------------------
 1 file changed, 45 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9ac05994a967..08c7289723ae 100644
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
@@ -95,49 +95,34 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
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
@@ -146,42 +131,39 @@ static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
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
@@ -192,21 +174,19 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
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
@@ -233,13 +213,11 @@ static void
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
@@ -253,8 +231,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 				  hwmon->scl_shift_energy);
 
 	mutex_unlock(&hwmon->hwmon_lock);
-
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
@@ -284,16 +260,14 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
-static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
+static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
 {
-	u32 reg_val;
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
@@ -322,9 +296,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_power_max_read(hwmon, val);
+		xe_hwmon_power_max_read(hwmon, val);
+		return 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_power_rated_max_read(hwmon, val);
+		xe_hwmon_power_rated_max_read(hwmon, val);
+		return 0;
 	case hwmon_power_crit:
 		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
 		if (ret)
@@ -418,21 +394,13 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
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
@@ -564,15 +532,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
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

