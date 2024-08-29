Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61BECA0EC0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356D10E79B;
	Thu, 29 Aug 2024 22:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPxQ0LIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509E210E79A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 22:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724969189; x=1756505189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z19XatrijAA2Py1ClUusZgpQZbIH1i2NawzneIcbG3M=;
 b=dPxQ0LIFD/Ir5RfQY5ASJuJ3XSnj0CzBB0ZWiMjQCAcUli1e9A6nGHS5
 wNEb+NcYh4EPFRhFShoHkDLyaDx3daeyD1nqXk4JKM/EgTQSlmvoGT6u4
 nSuB5hBvyCdPSt+YLL7K2b7dR6I8gx7Y9rHv5ZIijVTTInxeaiNQ2O5iE
 aFFVXsD5tu7/Q3Gd3jaVsS0d0sijSnBIDNUIKbaInrVJW7LNy6MMfnwfZ
 QysTm8oqvisJ4UIR0N6S3LU02gvC3y4OE10iBngnor+DFdDpT0IAFBQKl
 HwCUjKUVdNRN49qhwbGR9mrH+9kNN++KOTwRlwAFQJitk2mAw4hy9jRir A==;
X-CSE-ConnectionGUID: VOpG6PBeSb6n11a0tdv1Cw==
X-CSE-MsgGUID: dIsq9gwdRHu9cMXV9NgWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23737583"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23737583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
X-CSE-ConnectionGUID: 4oZfJ3yNSyW7q6GBMALrCw==
X-CSE-MsgGUID: DQD3PRHKTSaWBFrFzEEDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63555972"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/hwmon: Treat hwmon as a per-device concept
Date: Thu, 29 Aug 2024 15:06:22 -0700
Message-ID: <20240829220619.789159-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829220619.789159-4-matthew.d.roper@intel.com>
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
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

There's only one instance of hwmon per device, and MMIO access to it is
always done through the root tile.  The code has been passing around a
pointer to the root tile's primary GT, which is confusing since this
isn't really a GT-level concept.  Replace that pointer with an xe_device
pointer and use xe_root_mmio_gt(xe) to get a pointer when we need to do
register MMIO.  This makes things easier to follow, and also cleans up
the code in preparation for a much larger MMIO register access overhaul
that's coming soon.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 95 +++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 98e3ec08279e..aa11728e7e79 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -12,7 +12,6 @@
 #include "regs/xe_mchbar_regs.h"
 #include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
@@ -65,8 +64,8 @@ struct xe_hwmon_energy_info {
 struct xe_hwmon {
 	/** @hwmon_dev: hwmon device for xe */
 	struct device *hwmon_dev;
-	/** @gt: primary gt */
-	struct xe_gt *gt;
+	/** @xe: Xe device */
+	struct xe_device *xe;
 	/** @hwmon_lock: lock for rw attributes*/
 	struct mutex hwmon_lock;
 	/** @scl_shift_power: pkg power unit */
@@ -82,7 +81,7 @@ struct xe_hwmon {
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
 				      int channel)
 {
-	struct xe_device *xe = gt_to_xe(hwmon->gt);
+	struct xe_device *xe = hwmon->xe;
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
@@ -148,8 +147,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
 	u64 reg_val, min, max;
-	struct xe_device *xe = gt_to_xe(hwmon->gt);
+	struct xe_device *xe = hwmon->xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
 
 	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -166,7 +166,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
+	reg_val = xe_mmio_read32(mmio, rapl_limit);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
@@ -176,7 +176,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	reg_val = xe_mmio_read64_2x32(hwmon->gt, pkg_power_sku);
+	reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
@@ -190,6 +190,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
 {
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	int ret = 0;
 	u64 reg_val;
 	struct xe_reg rapl_limit;
@@ -200,10 +201,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
-		reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
-		reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
+		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
+		reg_val = xe_mmio_read32(mmio, rapl_limit);
 		if (reg_val & PKG_PWR_LIM_1_EN) {
-			drm_warn(&gt_to_xe(hwmon->gt)->drm, "PL1 disable is not supported!\n");
+			drm_warn(&hwmon->xe->drm, "PL1 disable is not supported!\n");
 			ret = -EOPNOTSUPP;
 		}
 		goto unlock;
@@ -212,7 +213,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
-	reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
+	reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
 
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
@@ -221,6 +222,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
 	u64 reg_val;
 
@@ -229,7 +231,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 	 * for this register can be skipped.
 	 * See xe_hwmon_power_is_visible.
 	 */
-	reg_val = xe_mmio_read32(hwmon->gt, reg);
+	reg_val = xe_mmio_read32(mmio, reg);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -257,11 +259,12 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 static void
 xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 {
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
-	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
-							     channel));
+	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+							channel));
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -279,19 +282,20 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 				 char *buf)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 	int sensor_index = to_sensor_dev_attr(attr)->index;
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	r = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
+	r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
 	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
@@ -319,6 +323,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 				  const char *buf, size_t count)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	u32 x, y, rxy, x_w = 2; /* 2 bits */
 	u64 tau4, r, max_win;
 	unsigned long val;
@@ -371,16 +376,16 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	r = xe_mmio_rmw32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
+	r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
 			  PKG_PWR_LIM_1_TIME, rxy);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	return count;
 }
@@ -406,11 +411,11 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	return ret;
 }
@@ -435,20 +440,24 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 };
 
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
-static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
+static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+
 	/* Avoid Illegal Subcommand error */
-	if (gt_to_xe(gt)->info.platform == XE_DG2)
+	if (hwmon->xe->info.platform == XE_DG2)
 		return -ENXIO;
 
-	return xe_pcode_read(gt_to_tile(gt), PCODE_MBOX(PCODE_POWER_SETUP,
+	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
 			     uval, NULL);
 }
 
-static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
+static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 {
-	return xe_pcode_write(gt_to_tile(gt), PCODE_MBOX(PCODE_POWER_SETUP,
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+
+	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
@@ -461,7 +470,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+	ret = xe_hwmon_pcode_read_i1(hwmon, &uval);
 	if (ret)
 		goto unlock;
 
@@ -481,7 +490,7 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 	mutex_lock(&hwmon->hwmon_lock);
 
 	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
-	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
@@ -489,9 +498,10 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 
 static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *value)
 {
+	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
 	u64 reg_val;
 
-	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel));
+	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel));
 	/* HW register value in units of 2.5 millivolt */
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
@@ -510,7 +520,7 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 				       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
 		if (channel == CHANNEL_PKG)
-			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 		break;
 	case hwmon_power_label:
@@ -563,10 +573,10 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_curr_crit:
-			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
 				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	case hwmon_curr_label:
-			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
 				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0444;
 		break;
 	default:
@@ -654,7 +664,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
 	int ret;
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	switch (type) {
 	case hwmon_power:
@@ -674,7 +684,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	}
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	return ret;
 }
@@ -686,7 +696,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	switch (type) {
 	case hwmon_power:
@@ -706,7 +716,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	return ret;
 }
@@ -718,7 +728,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(hwmon->xe);
 
 	switch (type) {
 	case hwmon_power:
@@ -732,7 +742,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(hwmon->xe);
 
 	return ret;
 }
@@ -771,6 +781,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 static void
 xe_hwmon_get_preregistration_info(struct xe_device *xe)
 {
+	struct xe_gt *mmio = xe_root_mmio_gt(xe);
 	struct xe_hwmon *hwmon = xe->hwmon;
 	long energy;
 	u64 val_sku_unit = 0;
@@ -783,7 +794,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 */
 	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
 	if (xe_reg_is_valid(pkg_power_sku_unit)) {
-		val_sku_unit = xe_mmio_read32(hwmon->gt, pkg_power_sku_unit);
+		val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
@@ -828,8 +839,8 @@ void xe_hwmon_register(struct xe_device *xe)
 	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
 		return;
 
-	/* primary GT to access device level properties */
-	hwmon->gt = xe->tiles[0].primary_gt;
+	/* There's only one instance of hwmon per device */
+	hwmon->xe = xe;
 
 	xe_hwmon_get_preregistration_info(xe);
 
-- 
2.45.2

