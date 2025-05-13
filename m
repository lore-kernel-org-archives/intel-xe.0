Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604F2C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 04:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C310E4EA;
	Tue, 13 May 2025 04:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx1USCmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8FA10E4EA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 04:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747111670; x=1778647670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+FF+CpLxDnAunPmJEMgs2Sw3YG+KTCTJkq+IgJ/jfM=;
 b=Fx1USCmBTIbDln1fiVirbPVR2NTFUGSlpZPky3Au0pcf0/QRi35MVg/g
 FSmGYwAW2FVxXDxxWHzKQCNkBjYUNV7NLE/wpWPxFQ1kwPtdhVCj+JSP/
 hTxyfy+vgerUba0MCwZHXXbTlJtWjDdKie1+1w6TFm+ZUYsJP8e0FwYwX
 Den9vgN0PVj+HW52L/8PkRGHGBvIEQMQmW3rAHOYCReo73RgKlw+TLVO+
 LK77ZNLOpds6m1CWXB90AhZFOQMuS+o9Gahv4h5cb7K+FLwUInwCszcWo
 2f6Al1hqTP8LpSvmyK5P+KW5G+FUzPXs/upkMkVaHbzzlHZnI0dZpt4Td Q==;
X-CSE-ConnectionGUID: q4mU3hQOR8+FgMIiatrXzA==
X-CSE-MsgGUID: 6J9hw1jNSWix0BiTivEQVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60271241"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="60271241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:50 -0700
X-CSE-ConnectionGUID: E1P9atGUQlW9ljuXnDE1Bg==
X-CSE-MsgGUID: Rl0PHMBoQwuC5GsK7LpccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137484578"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:48 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 1/5] drm/xe/hwmon: Add support to manage power limits
 though mailbox
Date: Tue, 13 May 2025 10:17:24 +0530
Message-Id: <20250513044728.630455-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513044728.630455-1-karthik.poosa@intel.com>
References: <20250513044728.630455-1-karthik.poosa@intel.com>
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

Add support to manage power limits using pcode mailbox commands
for supported platforms.

v2:
 - Address review comments. (Badal)
 - Use mailbox commands instead of registers to manage power limits
   for BMG.
 - Clamp the maximum power limit to BIOS default value.

v3:
 - Clamp power limit in write also for platforms with mailbox support.

v4:
 - Remove unnecessary debug prints. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: e90f7a58e659 ("drm/xe/hwmon: Add HWMON support for BMG")
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h  |   4 -
 drivers/gpu/drm/xe/xe_device_types.h     |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 380 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c              |   5 +
 drivers/gpu/drm/xe/xe_pcode.c            |  11 +
 drivers/gpu/drm/xe/xe_pcode.h            |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h        |   7 +
 8 files changed, 318 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index f5e5234857c1..5394a1373a6b 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -38,10 +38,10 @@
 #define   TEMP_MASK				REG_GENMASK(7, 0)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
-#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
-#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
-#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
-#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
-#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
+#define   PWR_LIM_VAL				REG_GENMASK(14, 0)
+#define   PWR_LIM_EN				REG_BIT(15)
+#define   PWR_LIM_TIME				REG_GENMASK(23, 17)
+#define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
+#define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
 
 #endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c7d5d782e3f9..c556a04670ee 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -18,16 +18,12 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
 
-#define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
-#define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
 #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
 #define BMG_FAN_1_SPEED				XE_REG(0x138140)
 #define BMG_FAN_2_SPEED				XE_REG(0x138170)
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
-#define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
 #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
-#define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f81be293b260..043515f8c068 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -326,6 +326,10 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
+		/** @info.has_mbx_power_limits: Device has support to manage power limits using
+		 * pcode mailbox commands.
+		 */
+		u8 has_mbx_power_limits:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index eb293aec36a0..c951a11758c0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -51,6 +51,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+/*
+ * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
+ * not supported and below are SKU units to be used.
+ */
+#define PWR_UNIT	0x3
+#define ENERGY_UNIT	0xe
+#define TIME_UNIT	0xa
+
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  */
@@ -60,6 +68,18 @@ enum xe_fan_channel {
 #define SF_ENERGY	1000000		/* microjoules */
 #define SF_TIME		1000		/* milliseconds */
 
+/*
+ * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
+ */
+#define PL1_HWMON_ATTR	hwmon_power_max
+
+#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
+
+/*
+ * Timeout for power limit write mailbox command.
+ */
+#define PL_WRITE_MBX_TIMEOUT_MS	(1)
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -100,8 +120,80 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
+	/** @boot_power_limit_read: is boot power limits read */
+	bool boot_power_limit_read;
+	/** pl1_on_boot: power limit PL1 on boot */
+	u32 pl1_on_boot[CHANNEL_MAX];
 };
 
+static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
+					   u32 *uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 val0 = 0, val1 = 0;
+	int ret = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+						  (channel == CHANNEL_CARD) ?
+						  READ_PSYSGPU_POWER_LIMIT :
+						  READ_PACKAGE_POWER_LIMIT,
+						  hwmon->boot_power_limit_read ?
+						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
+						  &val0, &val1);
+
+	if (ret) {
+		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+			channel, val0, val1, ret);
+		*uval = 0;
+		return ret;
+	}
+
+	/* return the value only if limit is enabled */
+	if (attr == PL1_HWMON_ATTR)
+		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
+	else if (attr == hwmon_power_label)
+		*uval = (val0 & PWR_LIM_EN) ? 1 : 0;
+	else
+		*uval = 0;
+
+	return ret;
+}
+
+static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
+					    u32 uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 val0, val1;
+	int ret = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+						  (channel == CHANNEL_CARD) ?
+						  READ_PSYSGPU_POWER_LIMIT :
+						  READ_PACKAGE_POWER_LIMIT,
+						  hwmon->boot_power_limit_read ?
+						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
+						  &val0, &val1);
+
+	if (ret)
+		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+			channel, val0, val1, ret);
+
+	if (attr == PL1_HWMON_ATTR)
+		val0 = uval;
+	else
+		return -EIO;
+
+	ret = xe_pcode_write64_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+							     (channel == CHANNEL_CARD) ?
+							     WRITE_PSYSGPU_POWER_LIMIT :
+							     WRITE_PACKAGE_POWER_LIMIT, 0),
+							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
+	if (ret)
+		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+			channel, val0, val1, ret);
+	return ret;
+}
+
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
 				      int channel)
 {
@@ -122,29 +214,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 		}
 		break;
 	case REG_PKG_RAPL_LIMIT:
-		if (xe->info.platform == XE_BATTLEMAGE) {
-			if (channel == CHANNEL_PKG)
-				return BMG_PACKAGE_RAPL_LIMIT;
-			else
-				return BMG_PLATFORM_POWER_LIMIT;
-		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
+		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
 			return PVC_GT0_PACKAGE_RAPL_LIMIT;
-		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
+		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
 			return PCU_CR_PACKAGE_RAPL_LIMIT;
-		}
 		break;
 	case REG_PKG_POWER_SKU:
-		if (xe->info.platform == XE_BATTLEMAGE)
-			return BMG_PACKAGE_POWER_SKU;
-		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
 			return PVC_GT0_PACKAGE_POWER_SKU;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
 			return PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
-		if (xe->info.platform == XE_BATTLEMAGE)
-			return BMG_PACKAGE_POWER_SKU_UNIT;
-		else if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_PVC)
 			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		else if (xe->info.platform == XE_DG2)
 			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
@@ -181,7 +263,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-#define PL1_DISABLE 0
+#define PL_DISABLE 0
 
 /*
  * HW allows arbitrary PL1 limits to be set but silently clamps these values to
@@ -189,67 +271,83 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
  * clamped values when read.
  */
-static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
+static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
 	u64 reg_val, min, max;
 	struct xe_device *xe = hwmon->xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
-	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+	mutex_lock(&hwmon->hwmon_lock);
 
-	/*
-	 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
-	 * So not checking it again here.
-	 */
-	if (!xe_reg_is_valid(pkg_power_sku)) {
-		drm_warn(&xe->drm, "pkg_power_sku invalid\n");
-		*value = 0;
-		return;
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
+	} else {
+		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+		/*
+		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
+		 * So not checking it again here.
+		 */
+		if (!xe_reg_is_valid(pkg_power_sku)) {
+			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
+			*value = 0;
+			goto unlock;
+		}
+		reg_val = xe_mmio_read32(mmio, rapl_limit);
 	}
 
-	mutex_lock(&hwmon->hwmon_lock);
-
-	reg_val = xe_mmio_read32(mmio, rapl_limit);
-	/* Check if PL1 limit is disabled */
-	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
-		*value = PL1_DISABLE;
+	/* Check if PL limits are disabled. */
+	if (!(reg_val & PWR_LIM_EN)) {
+		*value = PL_DISABLE;
+		drm_warn(&hwmon->xe->drm, "%s disabled for channel %d !, val 0x%016llx\n",
+			 PWR_ATTR_TO_STR(attr), channel, reg_val);
 		goto unlock;
 	}
 
-	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
-	reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
-	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
-	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
-	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
-	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
-
-	if (min && max)
-		*value = clamp_t(u64, *value, min, max);
+	/* For platforms with mailbox power limit support clamping would be done by pcode. */
+	if (!hwmon->xe->info.has_mbx_power_limits) {
+		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
+		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
+		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
+		min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+		max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+		if (min && max)
+			*value = clamp_t(u64, *value, min, max);
+	}
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 }
 
-static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
+static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	int ret = 0;
-	u64 reg_val;
+	u32 reg_val;
 	struct xe_reg rapl_limit;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 
-	mutex_lock(&hwmon->hwmon_lock);
+	/* Disable Power Limit and verify, as limit cannot be disabled on all platforms. */
+	if (value == PL_DISABLE) {
+		if (hwmon->xe->info.has_mbx_power_limits) {
+			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
+				PWR_ATTR_TO_STR(attr), channel);
+			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
+			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
+		} else {
+			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
+			reg_val = xe_mmio_read32(mmio, rapl_limit);
+		}
 
-	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
-	if (value == PL1_DISABLE) {
-		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
-		reg_val = xe_mmio_read32(mmio, rapl_limit);
-		if (reg_val & PKG_PWR_LIM_1_EN) {
-			drm_warn(&hwmon->xe->drm, "PL1 disable is not supported!\n");
+		if (reg_val & PWR_LIM_EN) {
+			drm_warn(&hwmon->xe->drm, "Power limit disable is not supported!\n");
 			ret = -EOPNOTSUPP;
 		}
 		goto unlock;
@@ -257,26 +355,50 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
-	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
-	reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
+	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
+	/*
+	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
+	 * pcode clamp.
+	 */
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
+			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
+			drm_dbg(&hwmon->xe->drm, "Clamping power limit to firmware default 0x%x\n",
+				reg_val);
+		}
+	}
+
+	if (hwmon->xe->info.has_mbx_power_limits)
+		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
+	else
+		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
+					reg_val);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
 }
 
-static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
+static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
+					  long *value)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
-	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
-	u64 reg_val;
+	u32 reg_val;
+
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		/* PL1 is rated max if supported. */
+		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
+	} else {
+		/*
+		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
+		 * for this register can be skipped.
+		 * See xe_hwmon_power_is_visible.
+		 */
+		struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+		reg_val = xe_mmio_read32(mmio, reg);
+	}
 
-	/*
-	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
-	 * for this register can be skipped.
-	 * See xe_hwmon_power_is_visible.
-	 */
-	reg_val = xe_mmio_read32(mmio, reg);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 }
@@ -330,23 +452,35 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int sensor_index = to_sensor_dev_attr(attr)->index;
+	int channel = to_sensor_dev_attr(attr)->index;
+	u32 power_attr = PL1_HWMON_ATTR;
+	int ret = 0;
 
 	xe_pm_runtime_get(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
+		if (ret) {
+			drm_err(&hwmon->xe->drm,
+				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
+				channel, power_attr, r, ret);
+			r = 0;
+		}
+	} else {
+		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
+	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
 	xe_pm_runtime_put(hwmon->xe);
 
-	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
-	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
+	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
 
 	/*
-	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
+	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
 	 *     = (4 | x) << (y - 2)
 	 *
 	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
@@ -373,14 +507,15 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u64 tau4, r, max_win;
 	unsigned long val;
 	int ret;
-	int sensor_index = to_sensor_dev_attr(attr)->index;
+	int channel = to_sensor_dev_attr(attr)->index;
+	u32 power_attr = PL1_HWMON_ATTR;
 
 	ret = kstrtoul(buf, 0, &val);
 	if (ret)
 		return ret;
 
 	/*
-	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12.
+	 * Max HW supported tau in '(1 + (x / 4)) * power(2,y)' format, x = 0, y = 0x12.
 	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds.
 	 *
 	 * The ideal scenario is for PKG_MAX_WIN to be read from the PKG_PWR_SKU register.
@@ -400,11 +535,13 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
-	if (val > max_win)
+	if (val > max_win) {
+		drm_warn(&hwmon->xe->drm, "power_interval invalid val 0x%lx\n", val);
 		return -EINVAL;
+	}
 
 	/* val in hw units */
-	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
+	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
 
 	/*
 	 * Convert val to 1.x * power(2,y)
@@ -419,14 +556,21 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 		x = (val - (1ul << y)) << x_w >> y;
 	}
 
-	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
+			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
 
 	xe_pm_runtime_get(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
-			  PKG_PWR_LIM_1_TIME, rxy);
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
+		r = (r & ~PWR_LIM_TIME) | rxy;
+		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
+	} else {
+		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
+				  PWR_LIM_TIME, rxy);
+	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -435,6 +579,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	return count;
 }
 
+/* PSYS PL1 */
 static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
 			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
@@ -455,10 +600,19 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
+	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	u32 power_attr = PL1_HWMON_ATTR;
+	u32 uval;
 
 	xe_pm_runtime_get(hwmon->xe);
 
-	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
+		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
+	} else {
+		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+						       channel)) ? attr->mode : 0;
+	}
 
 	xe_pm_runtime_put(hwmon->xe);
 
@@ -604,19 +758,27 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+		if (hwmon->xe->info.has_mbx_power_limits) {
+			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
+			return (uval) ? 0664 : 0;
+		} else {
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
 				       channel)) ? 0664 : 0;
+		}
 	case hwmon_power_rated_max:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
-				       channel)) ? 0444 : 0;
+		if (hwmon->xe->info.has_mbx_power_limits)
+			return 0;
+		else
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
+					       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
-		if (channel == CHANNEL_PKG)
-			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
-				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
-		break;
 	case hwmon_power_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
-				       channel)) ? 0444 : 0;
+		if (channel == CHANNEL_PKG) {
+			xe_hwmon_pcode_read_i1(hwmon, &uval);
+			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
+				0444 : 0644 : 0;
+		}
+		break;
 	default:
 		return 0;
 	}
@@ -628,10 +790,10 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
-		xe_hwmon_power_max_read(hwmon, channel, val);
+		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
-		xe_hwmon_power_rated_max_read(hwmon, channel, val);
+		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_crit:
 		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
@@ -645,7 +807,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_power_max_write(hwmon, channel, val);
+		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
 		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
 	default:
@@ -965,18 +1127,42 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
 
-	/*
-	 * The contents of register PKG_POWER_SKU_UNIT do not change,
-	 * so read it once and store the shift values.
-	 */
-	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
-	if (xe_reg_is_valid(pkg_power_sku_unit)) {
-		val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
-		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
-		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		/* Check if card firmware support mailbox power limits commands. */
+		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
+						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+						    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
+			drm_warn(&hwmon->xe->drm,
+				 "Failed to read power limits, check card firmware !\n");
+		} else {
+			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
+			/* Write default limits to read from pcode from now on. */
+			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
+							 CHANNEL_CARD,
+							 hwmon->pl1_on_boot[CHANNEL_CARD]);
+			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
+							 CHANNEL_PKG,
+							 hwmon->pl1_on_boot[CHANNEL_PKG]);
+			hwmon->scl_shift_power = PWR_UNIT;
+			hwmon->scl_shift_energy = ENERGY_UNIT;
+			hwmon->scl_shift_time = TIME_UNIT;
+			hwmon->boot_power_limit_read = true;
+		}
+	} else {
+		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
+		/*
+		 * The contents of register PKG_POWER_SKU_UNIT do not change,
+		 * so read it once and store the shift values.
+		 */
+		pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
+		if (xe_reg_is_valid(pkg_power_sku_unit)) {
+			val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
+			hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+			hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+			hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
+		}
 	}
-
 	/*
 	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
 	 * first value of the energy register read
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 024175cfe61e..ac4beaed58ff 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -66,6 +66,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
+	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
@@ -306,6 +307,7 @@ static const struct xe_device_desc dg2_desc = {
 	DG2_FEATURES,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_mbx_power_limits = false,
 };
 
 static const __maybe_unused struct xe_device_desc pvc_desc = {
@@ -317,6 +319,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.has_heci_gscfi = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
+	.has_mbx_power_limits = false,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -342,6 +345,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_mbx_power_limits = true,
 	.has_heci_cscfi = 1,
 	.needs_scratch = true,
 };
@@ -584,6 +588,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
+	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index cf955b3ed52c..9189117fe825 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -109,6 +109,17 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
 	return err;
 }
 
+int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
+{
+	int err;
+
+	mutex_lock(&tile->pcode.lock);
+	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
+	mutex_unlock(&tile->pcode.lock);
+
+	return err;
+}
+
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index ba33991d72a7..de38f44f3201 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -18,6 +18,9 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
+int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
+			     u32 data1, int timeout);
+
 #define xe_pcode_write(tile, mbox, val) \
 	xe_pcode_write_timeout(tile, mbox, val, 1)
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 127d4d26c4cf..de2277d77b65 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -43,6 +43,13 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define	READ_PSYSGPU_POWER_LIMIT		0x6
+#define	WRITE_PSYSGPU_POWER_LIMIT		0x7
+#define	READ_PACKAGE_POWER_LIMIT		0x8
+#define	WRITE_PACKAGE_POWER_LIMIT		0x9
+#define	READ_PL_FROM_BIOS			0x1
+#define	READ_PL_FROM_PCODE			0x0
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
-- 
2.25.1

