Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF81CD1299
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63447113BD1;
	Fri,  5 Apr 2024 12:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv6oAaDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737CD113BD3
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321470; x=1743857470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CaXWWU5rEDGKrUsxZFPzxIosS/4FH1pjPKawnENAjRw=;
 b=Vv6oAaDR6B12ff5MAyNcVQw3wkROchIIdM2S49wYDV5kIq8nmY0JvzOK
 4zl9qVLEhosI//6QJ6bsus0miDbUFMywdxDYdM3kfAvGKU1h8OdmaUSDs
 yDNte66DDL6/Yssx60HnvqNeswAcv5tI03KzUJ8N0xDcuqV53abZZkkv3
 7c1/QdZgE3XWhVwN5hF+0XQ2e6oB/p4/vUVptOrQFBwlCz0m14hqPrmE8
 +ylu+QeMAIKx0QI/MfMowDTL1pKA0zCokz/0UOoBMPFyLo6qgTigFBdav
 sK6Kj17PabRYofQQJTsw21ii3fANoLonj7bbDNmtx+Lm9xPeDRmmAjSvw Q==;
X-CSE-ConnectionGUID: P1JAMnV/T9yhH97Wy5Nhxg==
X-CSE-MsgGUID: e0xg9x7zS4uGnAmBpW3UwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810087"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7810087"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:09 -0700
X-CSE-ConnectionGUID: ebINhIoESY6JgeANbciqJg==
X-CSE-MsgGUID: nECI0WcNS3aTXWGnMqgfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23643868"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Date: Fri,  5 Apr 2024 18:31:26 +0530
Message-Id: <20240405130127.1392426-4-karthik.poosa@intel.com>
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

Return u64 from xe_hwmon_process_reg, instead of a void return.
u64* input pointer not needed with this change.

With this caller can directly assign return value to a variable without
need of explicit initialization and pass by reference.

v2:
 - Fix checkpatch warnings.

v3:
 - Rebase
 - Removed unncessary break statements.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 55 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a3b2ec0d24d8..19b32ff4615d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -121,8 +121,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				 enum xe_hwmon_reg_operation operation, u64 *value,
+static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation,
 				 u32 clr, u32 set, int channel)
 {
 	struct xe_reg reg;
@@ -130,22 +130,19 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
 
 	if (!xe_reg_is_valid(reg))
-		return;
+		return 0;
 
 	switch (operation) {
 	case REG_READ32:
-		*value = xe_mmio_read32(hwmon->gt, reg);
-		break;
+		return xe_mmio_read32(hwmon->gt, reg);
 	case REG_RMW32:
-		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
-		break;
+		return xe_mmio_rmw32(hwmon->gt, reg, clr, set);
 	case REG_READ64:
-		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
-		break;
+		return xe_mmio_read64_2x32(hwmon->gt, reg);
 	default:
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
-		break;
+		return 0;
 	}
 }
 
@@ -163,7 +160,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 0, 0, channel);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
@@ -173,7 +170,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 0, 0, channel);
 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
@@ -194,10 +191,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-				     PKG_PWR_LIM_1_EN, 0, channel);
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
-				     PKG_PWR_LIM_1_EN, 0, channel);
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
+					       PKG_PWR_LIM_1_EN, 0, channel);
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
+					       PKG_PWR_LIM_1_EN, 0, channel);
 
 		if (reg_val & PKG_PWR_LIM_1_EN) {
 			ret = -EOPNOTSUPP;
@@ -209,8 +206,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
+				       PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
@@ -220,7 +217,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, 0, 0, channel);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -251,8 +248,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
-			     &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
+				       0, 0, channel);
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -278,8 +275,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
-			     REG_READ32, &r, 0, 0, sensor_index);
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+				 REG_READ32, 0, 0, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -367,8 +364,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
-			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
+				 PKG_PWR_LIM_1_TIME, rxy, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -483,8 +480,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
+				       REG_READ32, 0, 0, channel);
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
@@ -769,8 +766,8 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 * so read it once and store the shift values.
 	 */
 	if (xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
-				     REG_READ32, &val_sku_unit, 0, 0, 0);
+		val_sku_unit = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+						    REG_READ32, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
-- 
2.25.1

