Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EACCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010B111B23F;
	Thu,  4 Apr 2024 09:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMJ8+CKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008F611B23F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712224692; x=1743760692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4DDwx8KZ3u+6XPv4UulEWolbg3Pb8TpxK/5bvKxhqA=;
 b=AMJ8+CKpON0GmOAVTzd3Wn6/fkFeDc8gohGubjAU8an210LiVCVuwaDz
 4QNx6XAsYtxge1w1zW3XOnCmcDFg62ohqBVjJtOGk7u2xCbh65Fi/e71F
 ejb+V8e4t3y9XyhD2ZUvn8LobiSct4vo6W9AOOGdicD3HRmwPWg7LAdn1
 AdR7NR3U7Zpm5SpbfF3uPp/Mc4lMTP4ySLdECOmvjy7PFDN7sR5CQOvjE
 /kzBoKEbWX17j1GUrcLrgKrJcE9u2gNJ7Znk0mwXrE6SZ5DCHUd8Fb4wF
 bch2YDy3b2sC9EcCZMGaPXgrBFVJdI2Vgo1Za+sowmmQlJfv2yit4kQnv g==;
X-CSE-ConnectionGUID: e5gvRd8vSq2ORfoBshmUMQ==
X-CSE-MsgGUID: ufXqTSg9SRaPNF7/0COFDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18227755"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18227755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:58:11 -0700
X-CSE-ConnectionGUID: JrFx5cm6QPi4mgbnbQZ7DQ==
X-CSE-MsgGUID: vzKYFMMoR1CFvPbORUe1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23422227"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:58:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Date: Thu,  4 Apr 2024 15:38:26 +0530
Message-Id: <20240404100827.1109447-4-karthik.poosa@intel.com>
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

Return u64 from xe_hwmon_process_reg, instead of a void return,
input pointer and a bool return.

With this caller can directly assign return value to the variable without
need of explicit initialization and pass by reference.

v2:
 - Fix checkpatch warnings.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 55 +++++++++++++++++------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2385f05d9504..e234321c165c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -121,31 +121,30 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				 enum xe_hwmon_reg_operation operation, u64 *value,
-				 u32 clr, u32 set, int channel)
+static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				enum xe_hwmon_reg_operation operation,
+				u32 clr, u32 set, int channel)
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
@@ -194,10 +193,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
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
@@ -209,8 +208,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
-			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
+				       PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
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
+				       0, 0, channel);
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -278,8 +277,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
-			     REG_READ32, &r, 0, 0, sensor_index);
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+				 REG_READ32, 0, 0, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -367,8 +366,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
-			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
+				 PKG_PWR_LIM_1_TIME, rxy, sensor_index);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -483,8 +482,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 {
 	u64 reg_val;
 
-	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
-			     REG_READ32, &reg_val, 0, 0, channel);
+	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
+				       REG_READ32, 0, 0, channel);
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
+						    REG_READ32, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
-- 
2.25.1

