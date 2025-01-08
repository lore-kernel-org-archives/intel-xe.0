Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE6E77199
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 09:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AEF10E825;
	Wed,  8 Jan 2025 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPeCVwMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794D310E825
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736328258; x=1767864258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yO0I3cuacL3P7jn308s0xedkKHIB2k0p2V989WMQHgg=;
 b=EPeCVwMl513sGpBGY4wNBUbSJyvun4NVSKfvRkiB3tqDHKT19Pex7Aht
 95UGJ1zImbcFC3KBuzaFgRRbUov9sfhxTXm/mGIsDexkLAXKvJbaohTnD
 CKHDNYLGaBnUHJAqKCzpRZo1wStyx69mGwtb7e2ljnI4PK+hNU4DcNJtg
 Gg3IftCLgIzyAAq8qntCFlRUqT3Q5hSXFrGaIX+yWDACmfGs46Zashn/1
 12DuCnQmc61i2H7CrFQMDb72ycPPSEsB0BNVn8wSyAig8ND8/W1ki/VcG
 MIhOIPhUbxy9fzOYNIEvD7YcIHhmh5Zxjpq6deduBmniumsuswuZD2NTs Q==;
X-CSE-ConnectionGUID: yJs2jXWZTBe8hgyxBLVDOA==
X-CSE-MsgGUID: 1P25arSJRWqpOEbe26RGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="53959258"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="53959258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 01:24:18 -0800
X-CSE-ConnectionGUID: xsR+boNuTBSyvRe6adItxQ==
X-CSE-MsgGUID: aOShGEVqR5O3//B30Hf56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107067716"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 08 Jan 2025 01:24:15 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
Date: Wed,  8 Jan 2025 14:54:15 +0530
Message-Id: <20250108092415.289551-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add hwmon support for temp1_input and temp2_input attributes, which will
expose package and vram temperature in millidegree Celsius. With this in
place we can monitor temperature using lm-sensors tool.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 63 +++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d792a56f59ac..998cfb0ee1a6 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Package current voltage in millivolt.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 519dd1067a19..f5e5234857c1 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -34,6 +34,9 @@
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
+#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
+#define   TEMP_MASK				REG_GENMASK(7, 0)
+
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 0b0b49d850ae..8846eb9ce2a4 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -21,6 +21,8 @@
 #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
 #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
 #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
+#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
 #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
 #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index fde56dad3ab7..5b5c844adf4a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -6,6 +6,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <drm/drm_managed.h>
 #include "regs/xe_gt_regs.h"
@@ -20,6 +21,7 @@
 #include "xe_pm.h"
 
 enum xe_hwmon_reg {
+	REG_TEMP,
 	REG_PKG_RAPL_LIMIT,
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
@@ -39,6 +41,11 @@ enum xe_hwmon_channel {
 	CHANNEL_MAX,
 };
 
+enum xe_hwmon_temp {
+	TEMP_PKG,
+	TEMP_VRAM,
+};
+
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  */
@@ -84,6 +91,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	struct xe_device *xe = hwmon->xe;
 
 	switch (hwmon_reg) {
+	case REG_TEMP:
+		if (xe->info.platform == XE_BATTLEMAGE) {
+			if (channel == TEMP_PKG)
+				return BMG_PACKAGE_TEMPERATURE;
+			else if (channel == TEMP_VRAM)
+				return BMG_VRAM_TEMPERATURE;
+		} else if (xe->info.platform == XE_DG2) {
+			if (channel == TEMP_PKG)
+				return PCU_CR_PACKAGE_TEMPERATURE;
+			else if (channel == TEMP_VRAM)
+				return BMG_VRAM_TEMPERATURE;
+		}
+		break;
 	case REG_PKG_RAPL_LIMIT:
 		if (xe->info.platform == XE_BATTLEMAGE) {
 			if (channel == CHANNEL_PKG)
@@ -431,6 +451,7 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
@@ -506,6 +527,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static umode_t
+xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_label:
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+	u64 reg_val;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+
+		/* HW register value is in degrees Celsius, convert to millidegrees. */
+		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -667,6 +718,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	xe_pm_runtime_get(hwmon->xe);
 
 	switch (type) {
+	case hwmon_temp:
+		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
+		break;
 	case hwmon_power:
 		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
 		break;
@@ -699,6 +753,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	xe_pm_runtime_get(hwmon->xe);
 
 	switch (type) {
+	case hwmon_temp:
+		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
+		break;
 	case hwmon_power:
 		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
 		break;
@@ -752,6 +809,12 @@ static int xe_hwmon_read_label(struct device *dev,
 			       u32 attr, int channel, const char **str)
 {
 	switch (type) {
+	case hwmon_temp:
+		if (channel == TEMP_PKG)
+			*str = "pkg";
+		else if (channel == TEMP_VRAM)
+			*str = "vram";
+		return 0;
 	case hwmon_power:
 	case hwmon_energy:
 	case hwmon_curr:
-- 
2.34.1

