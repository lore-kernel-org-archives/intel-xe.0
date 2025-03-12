Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C788C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 08:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639610E0C4;
	Wed, 12 Mar 2025 08:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lb8jefJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84D710E0C4
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741769980; x=1773305980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xHFXMC4XdYyPnSTcdKkRJtqGLDAR1acd6XUnfhFpNXw=;
 b=Lb8jefJ6vvjZZr/m0iYAd1SJ4WEdOPn9sBU0WbMIYoAqVAuyYy0ZOvX8
 K98IWnq61SFcOPY31gDX5i++9rJM8o6T9LVacjtjqnbhye2KR5rFemq/9
 y3GEoqZXWC27ZhseEveBitP6wT08N5s4jjnlcV9xzHP8wOmCnUL8MMXOF
 j6Yvp50tRsZ9VNVkF2MonqrXOpRphjENy76oodQWgtqHphhSH1NY0quH+
 SlYKlwjU1NovPSSPJDL03Y0a73nfhzqzhCIsCqW8cWxliGhB+KJLZzFa3
 sZCr6KwOUaQUcctB6V6SuGWhzKABXqyAM5Xfm62IU7l93HD9eb/wDQwty Q==;
X-CSE-ConnectionGUID: DoMKuSHATcGMzuVd249xew==
X-CSE-MsgGUID: CPRa+WZ7RRqki/C91fBwFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54209243"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="54209243"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:59:39 -0700
X-CSE-ConnectionGUID: rmSNRpJESIC5aHVukzPCVA==
X-CSE-MsgGUID: BGHeC5GURSmsnKsOxiOThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121060133"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 12 Mar 2025 01:59:36 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe/hwmon: expose fan speed
Date: Wed, 12 Mar 2025 14:29:09 +0530
Message-Id: <20250312085909.755073-1-raag.jadav@intel.com>
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

Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
which will expose fan speed of respective channels in RPM when supported
by hardware. With this in place we can monitor fan speed using lm-sensors
tool.

v2: Rely on platform checks instead of mailbox error (Aravind, Rodrigo)
v3: Introduce has_fan_control flag (Rodrigo)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 125 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   4 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 6 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 9bce281314df..adbb9bce15a5 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. VRAM temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
+Date:		March 2025
+KernelVersion:	6.14
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Fan 1 speed in RPM.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
+Date:		March 2025
+KernelVersion:	6.14
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Fan 2 speed in RPM.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
+Date:		March 2025
+KernelVersion:	6.14
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Fan 3 speed in RPM.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 8846eb9ce2a4..c7d5d782e3f9 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -21,6 +21,9 @@
 #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
 #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
 #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define BMG_FAN_1_SPEED				XE_REG(0x138140)
+#define BMG_FAN_2_SPEED				XE_REG(0x138170)
+#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..6bde5b5e45f9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -300,6 +300,8 @@ struct xe_device {
 		u8 has_atomic_enable_pte_bit:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_fan_control: Device supports fan control */
+		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 48d80ffdf7bb..eb293aec36a0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -5,6 +5,7 @@
 
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
+#include <linux/jiffies.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -27,6 +28,7 @@ enum xe_hwmon_reg {
 	REG_PKG_POWER_SKU_UNIT,
 	REG_GT_PERF_STATUS,
 	REG_PKG_ENERGY_STATUS,
+	REG_FAN_SPEED,
 };
 
 enum xe_hwmon_reg_operation {
@@ -42,6 +44,13 @@ enum xe_hwmon_channel {
 	CHANNEL_MAX,
 };
 
+enum xe_fan_channel {
+	FAN_1,
+	FAN_2,
+	FAN_3,
+	FAN_MAX,
+};
+
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  */
@@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+/**
+ * struct xe_hwmon_fan_info - to cache previous fan reading
+ */
+struct xe_hwmon_fan_info {
+	/** @reg_val_prev: previous fan reg val */
+	u32 reg_val_prev;
+	/** @time_prev: previous timestamp */
+	u64 time_prev;
+};
+
 /**
  * struct xe_hwmon - xe hwmon data structure
  */
@@ -79,6 +98,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @fi: Fan info for fanN_input */
+	struct xe_hwmon_fan_info fi[FAN_MAX];
 };
 
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
@@ -144,6 +165,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
 		}
 		break;
+	case REG_FAN_SPEED:
+		if (channel == FAN_1)
+			return BMG_FAN_1_SPEED;
+		else if (channel == FAN_2)
+			return BMG_FAN_2_SPEED;
+		else if (channel == FAN_3)
+			return BMG_FAN_3_SPEED;
+		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
@@ -454,6 +483,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
 	NULL
 };
 
@@ -480,6 +510,19 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+
+	/* Platforms that don't return correct value */
+	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
+		*uval = 2;
+		return 0;
+	}
+
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+}
+
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
 					 long *value, u32 scale_factor)
 {
@@ -705,6 +748,75 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static umode_t
+xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	u32 uval;
+
+	if (!hwmon->xe->info.has_fan_control)
+		return 0;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
+			return 0;
+
+		return channel < uval ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[channel];
+	u64 rotations, time_now, time;
+	u32 reg_val;
+	int ret = 0;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_FAN_SPEED, channel));
+	time_now = get_jiffies_64();
+
+	/*
+	 * HW register value is accumulated count of pulses from PWM fan with the scale
+	 * of 2 pulses per rotation.
+	 */
+	rotations = (reg_val - fi->reg_val_prev) / 2;
+
+	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
+	if (unlikely(!time)) {
+		ret = -EAGAIN;
+		goto unlock;
+	}
+
+	/*
+	 * Calculate fan speed in RPM by time averaging two subsequent readings in minutes.
+	 * RPM = number of rotations * msecs per minute / time in msecs
+	 */
+	*val = DIV_ROUND_UP_ULL(rotations * (MSEC_PER_SEC * 60), time);
+
+	fi->reg_val_prev = reg_val;
+	fi->time_prev = time_now;
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
+static int
+xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_fan_input:
+		return xe_hwmon_fan_input_read(hwmon, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -730,6 +842,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_energy:
 		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_fan:
+		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -765,6 +880,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_energy:
 		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
 		break;
+	case hwmon_fan:
+		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -842,7 +960,7 @@ static void
 xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
-	long energy;
+	long energy, fan_speed;
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
@@ -866,6 +984,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	for (channel = 0; channel < CHANNEL_MAX; channel++)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &energy);
+
+	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+	for (channel = 0; channel < FAN_MAX; channel++)
+		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
+			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 }
 
 static void xe_hwmon_mutex_destroy(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8b6658b214be..2eaee2476c65 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -62,6 +62,7 @@ struct xe_device_desc {
 	u8 is_dgfx:1;
 
 	u8 has_display:1;
+	u8 has_fan_control:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
@@ -322,6 +323,7 @@ static const struct xe_device_desc dg2_desc = {
 
 	DG2_FEATURES,
 	.has_display = true,
+	.has_fan_control = true,
 };
 
 static const __maybe_unused struct xe_device_desc pvc_desc = {
@@ -356,6 +358,7 @@ static const struct xe_device_desc bmg_desc = {
 	PLATFORM(BATTLEMAGE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_fan_control = true,
 	.has_heci_cscfi = 1,
 };
 
@@ -631,6 +634,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 2bae9afdbd35..e622ae17f08d 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -49,6 +49,9 @@
 /* Domain IDs (param2) */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
+#define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_READ_NUM_FANS			0x4
+
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
 #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
-- 
2.34.1

