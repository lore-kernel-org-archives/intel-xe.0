Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5695CCCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DBD11245C;
	Thu, 15 Oct 2026 19:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701111244F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091323; x=1823627323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3dk8PwWyIWN2ZXWjXyW0sLu8GX9zR6cjZRAEYvj88E=;
 b=PhDNvAO5Hl2ZuBGLcqlz7gIGkdZAolIppW3ZHnmatVLJuJUd3lIkX70c
 GD/wovjTWmjXm43wJyATKraeFjwHMi1eIHpetlgI0p18czPG5UDP7JCHs
 lXrDicJhlBrRPYf9UJbruWs/F4r6koosum0HsuI9wkx8EYmU6faKdnUhw
 kTSAlf4BYpDPPUj0U4riB2VodnlNGuMDEPZjrJe8HmwhYdt8F6HvESFK6
 OshSPZPDWARRuK4Hu4wbZC30HKgZqyyz/vmoZuWuM15W3XnKMASDVXrlx
 JJUITtP515JJ/2haxTUDicLBaS6GFAhaFVdVw/2f06Fc7RIOpSfc36yem g==;
X-CSE-ConnectionGUID: 2MxgB7U9RIuVV3vu/KFfOQ==
X-CSE-MsgGUID: D+cXq+50TrqYKLpxYSMyKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770356"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:44 -0700
X-CSE-ConnectionGUID: D/hdBTzISdiw0r2Q1CXJBQ==
X-CSE-MsgGUID: MNXFs/FlQZG2UiM25gisLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835216"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:40 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and table
 cache
Date: Fri, 16 Oct 2026 00:37:43 +0530
Message-Id: <20261015190751.1268916-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
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

v3:
 - Rebase.
 - Refine a few debug log messages and comments.
 - Update xe_hwmon_read_fan_control_info() to return on any stock table
   read failures.
 - Avoid returning when num_fans is 0 in
   xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
   initialization is not skipped.
 - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as default
   timeout itself is now 10ms.
 - Use xe_pcode_read() instead of xe_pcode_read_timeout().
 - Rename fan_control_point_count to point_count in struct fan_table.
 - Resolve kgdoc warnings.
 - Add valid check for stock table fan point count.
 - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
   fans. This avoids assuming contiguous fan indices and allows masks with
   gaps to be represented correctly in the hwmon interface.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
 2 files changed, 157 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42acfeb8818c..f2bd20f8b0a2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -21,6 +21,7 @@
 #include "xe_pcode_api.h"
 #include "xe_sriov.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 #include "regs/xe_pmt.h"
 
@@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
+#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
+
+/* Maximum number of fan control points supported by each fan. */
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
+						((POINT_NUM) & REG_GENMASK(30, 0)))
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
+		/** @point_count: number of fan control points */
+		u8 point_count;
+		/** @fcp: array of fan control points */
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
@@ -193,6 +231,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @fan_enable_mask: bitmask of available fans */
+	u32 fan_enable_mask;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
@@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL);
+}
+
+static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
+{
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon->xe->info.platform == XE_DG2) {
+		hwmon->fan_enable_mask = GENMASK(1, 0);
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
+					      &hwmon->fan_enable_mask);
+	if (ret) {
+		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
+		return ret;
+	}
+
+	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
+	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
+		xe_warn(hwmon->xe, "fan enable mask exceeds maximum supported fans\n");
+		return -EINVAL;
+	}
+
+	xe_info(hwmon->xe, "Number of fans detected: %u\n",
+		hweight32(hwmon->fan_enable_mask));
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
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+
+		if (!IS_FAN_ENABLED(fan))
+			continue;
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &stock_fcp_count);
+		if (ret) {
+			xe_err(hwmon->xe,
+			       "failed to read fan %d stock table point count, ret=%d\n",
+			       fan, ret);
+			return ret;
+		}
+
+		if (!stock_fcp_count || stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
+			xe_warn(hwmon->xe,
+				"fan %d stock table point count %u is invalid\n",
+				fan, stock_fcp_count);
+			return -EINVAL;
+		}
+
+		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
+		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan,
+		       fi->fan_table[STOCK_FAN_TABLE].point_count);
+
+		/* Cache the stock fan table for later use. */
+		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
+								  FSC_READ_FAN_TABLE, fan),
+					    &fcp, NULL);
+			if (ret) {
+				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
+				       fan, point, ret);
+				fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
+				return ret;
+			}
+
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u\n",
+			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &fi->min_pwm);
+		if (ret)
+			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
+		else
+			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
+		return IS_FAN_ENABLED(channel) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel < FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+	if (hwmon->xe->info.has_fan_control) {
+		xe_hwmon_get_fan_enable_mask(hwmon);
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel < FAN_MAX; channel++)
+			if (IS_FAN_ENABLED(channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon->xe, "Fan control tables are not available\n");
+	}
 	return xe_hwmon_init_temp_info(hwmon);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 00c4fc7d0124..0349b24a8259 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -83,6 +83,11 @@
 
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

