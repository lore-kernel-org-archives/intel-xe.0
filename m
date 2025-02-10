Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5EBC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 10:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AAF10E166;
	Mon, 10 Feb 2025 10:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIzxD5Yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D34E10E166
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739181908; x=1770717908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lpONKBCS90aUuuLlB3T3efBlXnZUlngXAHIgLviq9po=;
 b=eIzxD5YtETfqduhtnrqx+vVi+tqZjaCRW2PNWrv0QIYthWM2UC/cAIzf
 +gFBe5G0Ngypo0dQqWoDPTDNtm1mHr2W5k6HMODhS68kUoRXZ7ciPPDK2
 OZdOWuQh04f12fUEpmR1GthRVcFiGKFA/sfqvF/X6SvC9Jn/Rkf9j1hvA
 CK0qe6B+GOMddlyNTCLq6YJvVH7Inlh60wc9J4GpoRyJavADWiQgv3upu
 lVI6snjjGQXkixv1PltWu8jO2KrRM2SCIbFB1g3+wiNdQr3L5qfU3kuOt
 9cQeT8Me8c9kIfMwADh83lcJ0xE9/j+kqRJHtmz03iLY6fpMbCGVSTx06 A==;
X-CSE-ConnectionGUID: Q9HVRptBQTirIKJkEXYRoQ==
X-CSE-MsgGUID: pEVN4K8fTn2tp3Td80CeYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="42596909"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="42596909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:05:08 -0800
X-CSE-ConnectionGUID: Yft6OvVsTpSsGRkZnQf6Qg==
X-CSE-MsgGUID: pmqXgqNjTN2Dcw8v8HFeqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="112779939"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 10 Feb 2025 02:05:04 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/hwmon: expose fan speed
Date: Mon, 10 Feb 2025 15:35:15 +0530
Message-Id: <20250210100515.2205584-1-raag.jadav@intel.com>
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

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 124 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 4 files changed, 153 insertions(+), 1 deletion(-)

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
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7f327e334212..f1f95655d9fb 100644
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
@@ -144,6 +165,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
 		}
 		break;
+	case REG_FAN_SPEED:
+		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
+			if (channel == FAN_1)
+				return BMG_FAN_1_SPEED;
+			else if (channel == FAN_2)
+				return BMG_FAN_2_SPEED;
+			else if (channel == FAN_3)
+				return BMG_FAN_3_SPEED;
+		}
+		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
@@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
 	NULL
 };
 
@@ -480,6 +512,14 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
+static int xe_hwmon_pcode_read_num_fans(const struct xe_hwmon *hwmon, u32 *uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
+			     FSC_READ_NUM_FANS, 0), uval, NULL);
+}
+
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
 					 long *value, u32 scale_factor)
 {
@@ -705,6 +745,77 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static umode_t
+xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	struct xe_device *xe = hwmon->xe;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		if (xe_hwmon_pcode_read_num_fans(hwmon, &uval))
+			return 0;
+
+		/* Platforms that don't return correct value */
+		if (xe->info.platform == XE_DG2)
+			uval = 2;
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
@@ -730,6 +841,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_energy:
 		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_fan:
+		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -765,6 +879,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_energy:
 		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
 		break;
+	case hwmon_fan:
+		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -843,7 +960,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_hwmon *hwmon = xe->hwmon;
-	long energy;
+	long energy, fan_speed;
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
@@ -867,6 +984,11 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
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

