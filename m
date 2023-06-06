Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E18C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCEF10E33F;
	Tue,  6 Jun 2023 12:45:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1418F10E33F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055552; x=1717591552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G2qrE22XToeSnsC42vG74V1dDbkJ9nikoilckfWsqhU=;
 b=l9gwg/g41hWkXA9wLfvT0p932JgyYpu70wDst+WSihVNKhyZAsuidcfw
 b654gT1hL6s9HVC01nOceFXtGnZr+eR/9Gkw5MLdWHqCyPNxqeHCEPL26
 Ll8v3eM0jh0ne86dzzqUI8aQNXMZJwWh2giOY42Ba+IgQMCMFLato6XGu
 bObJlR1g0gapJ22lZ7C0epsv+bF1+wKyVFEfvm/fcpYhtPZX3KvzNcVgT
 qHyI4FtfbjZWBatEMoSDsJwAcGCSvZHxKlhYUcZsvlsXv3fZzbtD63whW
 phgCbhnP9wkaNq0/gt5YamPizmgrG5DLkG8u+/lK9Po7bqgceWDGp6lD3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297887"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063443"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063443"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:48 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:53 +0530
Message-Id: <20230606125057.838618-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606125057.838618-1-badal.nilawar@intel.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 2/6] drm/xe/hwmon: Expose power attributes
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose power_max (pl1) and power_rated_max (tdp) attributes

Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 342 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 6 files changed, 408 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
new file mode 100644
index 000000000000..54a7b668009e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -0,0 +1,22 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically seconds)
+		exceeds this limit. A read value of 0 means that the PL1
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 will enable the power limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RO. Card default power limit (default TDP setting).
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0f920175526e..9d888aae907e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -382,4 +382,8 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
new file mode 100644
index 000000000000..4ad473e69e27
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MCHBAR_REGS_H__
+#define _XE_MCHBAR_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+/*
+ * MCHBAR mirror.
+ *
+ * This mirrors the MCHBAR MMIO space whose location is determined by
+ * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
+ * every way.
+ */
+
+#define MCHBAR_MIRROR_BASE_SNB			0x140000
+
+#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
+#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
+
+#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
+#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
+#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
+#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+
+#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
+#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
+#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 65e5488dec82..8e248e806559 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -7,42 +7,358 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/types.h>
 
+#include "regs/xe_mchbar_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
 #include "xe_gt.h"
+#include "i915_drv.h"
+
+enum hwm_reg_name {
+	pkg_rapl_limit,
+	pkg_power_sku,
+	pkg_power_sku_unit,
+};
+
+enum hwm_reg_operation {
+	reg_read,
+	reg_write,
+	reg_rmw,
+};
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - voltage  - millivolts
+ * - power  - microwatts
+ */
+#define SF_VOLTAGE	1000
+#define SF_POWER	1000000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
 	struct device *hwmon_dev;
+	struct xe_gt *gt;
 	char name[12];
+	bool reset_in_progress;
+	wait_queue_head_t waitq;
 };
 
 struct xe_hwmon {
 	struct hwm_drvdata ddat;
 	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
+	int scl_shift_power;
 };
 
+struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
+{
+	switch (reg_name) {
+	case pkg_rapl_limit:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return PCU_CR_PACKAGE_RAPL_LIMIT;
+		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
+			return PVC_GT0_PACKAGE_RAPL_LIMIT;
+		else
+			return XE_REG(0);
+		break;
+	case pkg_power_sku:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return PCU_CR_PACKAGE_POWER_SKU;
+		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
+			return PVC_GT0_PACKAGE_POWER_SKU;
+		else
+			return XE_REG(0);
+		break;
+	case pkg_power_sku_unit:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
+		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
+			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+		else
+			return XE_REG(0);
+		break;
+	default:
+		break;
+	}
+
+	return XE_REG(0);
+}
+
+int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
+		      enum hwm_reg_operation operation, u32 *value,
+		      u32 clr, u32 set)
+{
+	struct xe_reg reg;
+	int ret = 0;
+
+	reg = hwm_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (operation) {
+	case reg_read:
+		*value = xe_mmio_read32(ddat->gt, reg);
+		break;
+	case reg_write:
+		xe_mmio_write32(ddat->gt, reg, *value);
+		break;
+	case reg_rmw:
+		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
+{
+	struct xe_reg reg;
+
+	reg = hwm_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	*value = xe_mmio_read64(ddat->gt, reg);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return 0;
+}
+
+#define PL1_DISABLE 0
+
+/*
+ * HW allows arbitrary PL1 limits to be set but silently clamps these values to
+ * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
+ * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
+ * clamped values when read. Write/read I1 also follows the same pattern.
+ */
+static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 reg_val;
+	u64 r, min, max;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
+	/* Check if PL1 limit is disabled */
+	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
+		*value = PL1_DISABLE;
+		xe_device_mem_access_put(gt_to_xe(ddat->gt));
+		return 0;
+	}
+
+	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
+	min = REG_FIELD_GET(PKG_MIN_PWR, r);
+	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+	max = REG_FIELD_GET(PKG_MAX_PWR, r);
+	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+
+	if (min && max)
+		*value = clamp_t(u64, *value, min, max);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+	return 0;
+}
+
+static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	DEFINE_WAIT(wait);
+	int ret = 0;
+	u32 nval;
+
+	/* Block waiting for GuC reset to complete when needed */
+	for (;;) {
+		mutex_lock(&hwmon->hwmon_lock);
+
+		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
+
+		if (!hwmon->ddat.reset_in_progress)
+			break;
+
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+
+		mutex_unlock(&hwmon->hwmon_lock);
+
+		schedule();
+	}
+	finish_wait(&ddat->waitq, &wait);
+	if (ret)
+		goto unlock;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
+	if (value == PL1_DISABLE) {
+		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+
+		if (nval & PKG_PWR_LIM_1_EN)
+			ret = -ENODEV;
+		goto exit;
+	}
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
+	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
+			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
+exit:
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return 0;
+}
+
+static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 reg_val;
+
+	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
+	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	return 0;
+}
+
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
 	NULL
 };
 
+static umode_t
+hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
+{
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_power_max:
+		return process_hwmon_reg(ddat, pkg_rapl_limit,
+					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
+	case hwmon_power_rated_max:
+		return process_hwmon_reg(ddat, pkg_power_sku,
+					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwm_power_max_read(ddat, val);
+	case hwmon_power_rated_max:
+		return hwm_power_rated_max_read(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwm_power_max_write(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	u32 r;
+
+	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
+					reg_read, &r, 0, 0))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	hwmon->ddat.reset_in_progress = true;
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
+			  PKG_PWR_LIM_1_EN, 0);
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	u32 r;
+
+	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
+					reg_read, &r, 0, 0))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
+			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
+
+	hwmon->ddat.reset_in_progress = false;
+	wake_up_all(&hwmon->ddat.waitq);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
 {
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+	int ret;
+
 	switch (type) {
+	case hwmon_power:
+		ret = hwm_power_is_visible(ddat, attr, channel);
+		break;
 	default:
-		return 0;
+		ret = 0;
 	}
+
+	return ret;
 }
 
 static int
 hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	 int channel, long *val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_power:
+		return hwm_power_read(ddat, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -52,7 +368,11 @@ static int
 hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	  int channel, long val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_power:
+		return hwm_power_write(ddat, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -70,8 +390,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
 };
 
 static void
-hwm_get_preregistration_info(struct xe_device *xe)
+hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 {
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 val_sku_unit = 0;
+	int ret;
+
+	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
+	/*
+	 * The contents of register pkg_power_sku_unit do not change,
+	 * so read it once and store the shift values.
+	 */
+	if (!ret)
+		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
@@ -96,15 +427,18 @@ void xe_hwmon_register(struct xe_device *xe)
 	ddat->hwmon = hwmon;
 	snprintf(ddat->name, sizeof(ddat->name), "xe");
 
-	hwm_get_preregistration_info(xe);
+	init_waitqueue_head(&ddat->waitq);
+
+	hwm_get_preregistration_info(ddat);
 
 	drm_dbg(&xe->drm, "Register HWMON interface\n");
 
-	/*  hwmon_dev points to device hwmon<i> */
+	/* hwmon_dev points to device hwmon<i> */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
 							 NULL);
+
 	if (IS_ERR(hwmon_dev)) {
 		xe->hwmon = NULL;
 		return;
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index a078eeb0a68b..a5dc693569c5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -14,9 +14,13 @@ struct xe_device;
 #if IS_REACHABLE(CONFIG_HWMON)
 void xe_hwmon_register(struct xe_device *xe);
 void xe_hwmon_unregister(struct xe_device *xe);
+void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
+void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
 #else
 static inline void xe_hwmon_register(struct xe_device *xe) { };
 static inline void xe_hwmon_unregister(struct xe_device *xe) { };
+static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
+static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
 #endif
 
 #endif /* __XE_HWMON_H__ */
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..9df5a3a85dc3 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_huc.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
+#include "xe_hwmon.h"
 
 static struct xe_gt *
 uc_to_gt(struct xe_uc *uc)
@@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 int xe_uc_init_hw(struct xe_uc *uc)
 {
 	int ret;
+	bool pl1en;
 
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
 		return 0;
 
+	/* Disable a potentially low PL1 power limit to allow freq to be raised */
+	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
+
 	ret = xe_uc_sanitize_reset(uc);
 	if (ret)
 		return ret;
@@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
+	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc);
 	XE_WARN_ON(ret);
-- 
2.25.1

