Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491FEC4450F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0830D10E73B;
	Fri, 17 Jul 2026 04:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlTA+MTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD6E10E73B
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261349; x=1815797349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yMASj6aHheWsBu4MYXnn1360cQSDq9dBg3cTn5GMl4=;
 b=OlTA+MTIME46dLWPfsC8UGPSvzzPnncBSLN8Qn/XJrSRvColxDRe8X8M
 u3UndY1vU1hwz+NavEeaph1Xm4xYkt9LQ+LSN4/dcaZ4dSK5xf1d5e1gb
 yR8b8LYj5427M3aZh4G/ig7vcDY/MyT+dprx71HbtgZzWKmn/es5IfMSL
 zmAH19x8rlppjaJ8riMxgaLewBQXK6eg9XypW2X3VxwnyN80xeBCzAx38
 jvqAjuBXVnwWpnUp8R8x6olVarsKJJz4ZSp/BBB34kvXieOLac6K+q5/J
 KVc3DOZcMaHh3CxTJSyaChW2rRiXQWxrh6JeqLjwzgiGlsjR6N9rSUh+3 g==;
X-CSE-ConnectionGUID: eC+sejIqS4+g6WzK6PxwmQ==
X-CSE-MsgGUID: C/pKtMJ7TJaeWXspS++Jpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129345"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:09 -0700
X-CSE-ConnectionGUID: Qopvl4LpQ2WC8SxzNHDfGw==
X-CSE-MsgGUID: kHb+sTJmRxmOnNgA098LaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538872"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and table
 cache
Date: Fri, 17 Jul 2026 09:47:50 +0530
Message-Id: <20260717041757.2759084-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717041757.2759084-1-karthik.poosa@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
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

Initialize Xe hwmon fan-control support by detecting fan count,
reading stock fan control points and min PWM.

v2:
 - Avoid user table initialization during probe. (Badal)
 - Move unused code to appropriate patches.
 - Use xe helpers for dmesg logs.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
 2 files changed, 149 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..0a416e3e7b8c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -20,6 +20,7 @@
 #include "xe_pcode_api.h"
 #include "xe_sriov.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 #include "regs/xe_pmt.h"
 
@@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Maximum number of fan control points supported by each fan */
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
+						((POINT_NUM) & REG_GENMASK(30, 0)))
+
+/* PCODE operations timeout for fan control commands */
+#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
+
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * struct xe_hwmon_fan_info - cached fan telemetry and control state
+ *
+ * Each fan keeps the latest tachometer sampling state along with two fan
+ * tables: the stock table discovered from firmware and the user table managed
+ * by hwmon sysfs writes.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @fan_control_point_count: number of supported fan control points */
+		u8 fan_control_point_count;
+		struct fan_control_point {
+			/** @temp: temperature in degree celsius */
+			u8 temp;
+			/** @speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+	} fan_table[FAN_TABLE_MAX];
+	/** @min_pwm: minimum fan PWM */
+	u32 min_pwm;
 };
 
 /**
@@ -168,6 +205,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @num_fans: number of fans available */
+	u8 num_fans;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @boot_power_limit_read: is boot power limits read */
@@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+}
+
+static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
+{
+	u32 fan_mask = 0;
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon->xe->info.platform == XE_DG2) {
+		*num_fans = 2;
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &fan_mask);
+	if (ret) {
+		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
+		return ret;
+	}
+
+	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
+
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int point;
+	int fan;
+	int ret;
+
+	for (fan = 0; fan < hwmon->num_fans; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &stock_fcp_count);
+		if (ret) {
+			xe_err(hwmon->xe,
+			       "failed to read fan %d stock control point count, ret=%d\n",
+			       fan, ret);
+			return ret;
+		}
+		fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
+				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
+
+		xe_dbg(hwmon->xe, "fan %d stock points %u\n", fan,
+		       fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
+
+		/* Dump the stock fan control points for debugging purposes. */
+		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+			ret = xe_pcode_read_timeout(root_tile,
+						    PCODE_MBOX(FAN_SPEED_CONTROL,
+							       FSC_READ_FAN_TABLE, fan),
+						    &fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
+				       fan, point, ret);
+				continue;
+			}
+
+			/* Cache the stock fan control points in local structure for later use. */
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
+			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &fi->min_pwm);
+		if (ret) {
+			xe_err(hwmon->xe, "failed to read fan %d min PWM, ret=%d\n", fan, ret);
+			continue;
+		}
+
+		xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
 	if (!hwmon->xe->info.has_fan_control)
 		return 0;
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
-			return 0;
-
-		return channel < uval ? 0444 : 0;
+		return channel < hwmon->num_fans ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
+	u32 num_fans = 0;
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		/* Check if GPU firmware support mailbox power limits commands. */
@@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel < FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+	if (hwmon->xe->info.has_fan_control) {
+		xe_hwmon_get_num_fans(hwmon, &num_fans);
+
+		xe_info(hwmon->xe, "Number of fans detected: %u\n", num_fans);
+		hwmon->num_fans = num_fans;
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel < hwmon->num_fans; channel++)
+			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon->xe, "Fan control tables are not available\n");
+	}
 
 	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
 		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..669010f1e2d0 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -85,6 +85,11 @@
 
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_READ_FAN_MIN_PWM		0x8
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
-- 
2.25.1

