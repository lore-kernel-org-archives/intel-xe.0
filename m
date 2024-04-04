Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905A9CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40110112DA6;
	Thu,  4 Apr 2024 03:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8HwTF91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11421130D1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202266; x=1743738266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9wpDR4fse0El+vjjqjgdCXGsuYzvr4w0np8+SXobBHc=;
 b=n8HwTF91Q2m8Bsy7ZSn8Wi+OcAnf1eOXyhjdJbh2MITu/dI21AyohZeJ
 LOCNRHRtA2RyN6XDvCoU9r0VEr+hWeTskDaJpjAr66/EzAdgDl2PaRFoj
 UZJE6u84iUZfXe75g7dWF1xb4G1BUomz3YnqLYpd1+eDqCTyyLGUOl9ff
 2Vmza+WUTTOLLus4H6VRpl54cPYi4SjTpcnlMLuEQB2WrAxiR9IJDA5s1
 rmB+WorL0KkxybfLKmNq+R3Nwp9Yr4eeWklonXqIla4qTSCwYYHcEb8EX
 imWoAdbVHU9Xn3DrD8icobdhmZPUsfftdkca86DndcDF+VGxju+qP8cVU A==;
X-CSE-ConnectionGUID: uSnLOzoxT4ieSrHROI+dBA==
X-CSE-MsgGUID: z4LCPHQWQ0aPp0hU+0kOpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296502"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:26 -0700
X-CSE-ConnectionGUID: csCewWW2S8uK2t5Au0ITOA==
X-CSE-MsgGUID: LWYH60CRQfuoOvu4wzoLng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23405183"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:23 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Date: Thu,  4 Apr 2024 09:24:40 +0530
Message-Id: <20240404035441.965590-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404035441.965590-1-karthik.poosa@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
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

Return u64 from xe_hwmon_process_reg, instead of a void return,
input pointer and a bool return. (Lucas)

With this caller can directly assign return value to the variable without
need of explicit initialization and pass by reference.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 45 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2385f05d9504..114aadb54c8e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -121,31 +121,30 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				 enum xe_hwmon_reg_operation operation, u64 *value,
+static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation,
 				 u32 clr, u32 set, int channel)
 {
 	struct xe_reg reg;
 
 	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
-
 	if (!XE_REG_IS_VALID(reg))
-		return;
+		return 0;
 
 	switch (operation) {
 	case REG_READ32:
-		*value = xe_mmio_read32(hwmon->gt, reg);
+		return xe_mmio_read32(hwmon->gt, reg);
 		break;
 	case REG_RMW32:
-		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
+		return xe_mmio_rmw32(hwmon->gt, reg, clr, set);
 		break;
 	case REG_READ64:
-		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
+		return xe_mmio_read64_2x32(hwmon->gt, reg);
 		break;
 	default:
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
-		break;
+		return 0;
 	}
 }
 
@@ -163,7 +162,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 0, 0, channel);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
@@ -173,7 +172,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 0, 0, channel);
 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
@@ -194,9 +193,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 				     PKG_PWR_LIM_1_EN, 0, channel);
-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
 				     PKG_PWR_LIM_1_EN, 0, channel);
 
 		if (reg_val & PKG_PWR_LIM_1_EN) {
@@ -209,7 +208,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
@@ -220,7 +219,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, 0, 0, channel);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -251,8 +250,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
-			     &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
+			     0, 0, channel);
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -278,8 +277,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
-			     REG_READ32, &r, 0, 0, sensor_index);
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+			     REG_READ32, 0, 0, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -367,7 +366,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
@@ -483,8 +482,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
+			     REG_READ32, 0, 0, channel);
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
@@ -769,8 +768,8 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 * so read it once and store the shift values.
 	 */
 	if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
-		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
-				     REG_READ32, &val_sku_unit, 0, 0, 0);
+		val_sku_unit = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				     REG_READ32, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
-- 
2.25.1

