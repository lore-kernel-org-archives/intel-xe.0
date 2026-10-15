Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D674CCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7492112464;
	Thu, 15 Oct 2026 19:08:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1099B112459
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091332; x=1823627332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKU1G4oL913kboTsbeNwhJn+Cw+n3yR3MGkMgUx/nKE=;
 b=NbPuFYIW7jqJE3IG57W7m3DiXT4s3Jb5H9Ujg0xbBF6gaK+csZwtQu6u
 ab8CocRGOYfMC6rL1J0QZn3greY1pICc6T/qpfRAHPmP947ZHurJhenw6
 qMFS+ZcUHOIfUEk9dGQ88ehVJ/T6ou23dtrt+I+m5p3GCmQD/DO6JNKtF
 AJsL/pbJ2GCD66om3eachUH70z5l3sH1qLENUkBYc3btVReSpM8Mqbfxv
 k9oBGLQLR2AQsa/WXtF+dZTHjQ/3RNIG21ADPoH9vdFSzMSp8Tx5CGr3m
 GtcA8cG1qDZEadvH9rLqyN6vkXDw6Au4BiRL0oY1989cAn2AJQ3DFfAcP w==;
X-CSE-ConnectionGUID: /AxenZeTRp6zvdNAH0wUGA==
X-CSE-MsgGUID: 4kFr/c/jSDGmqiWJTbr0vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770370"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:51 -0700
X-CSE-ConnectionGUID: 75EB2iTYQwOIHkpiugjzcg==
X-CSE-MsgGUID: xrptgt1QShWInX5oED9fWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835234"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 4/9] drm/xe/hwmon: expose pwm[1-3]
Date: Fri, 16 Oct 2026 00:37:46 +0530
Message-Id: <20261015190751.1268916-5-karthik.poosa@intel.com>
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

Expose pwm[1-3] fan duty attributes through hwmon.

This enables reading and writing user PWM values (0..255) for each
available fan channel.

Update Xe hwmon ABI documentation for pwm[1-3].

This sysfs node can be used for manual control of fan speed,
irrespective of fan curve.

v2:
 - Use xe helpers for dmesg logs.
 - Avoid using hwmon->num_fans to get fan count in
   xe_hwmon_pwm_is_visible().

v3:
 - Set PWM directly through the user table; avoid initializing it from the
   stock table. (Soham)
 - Move the unused xe_hwmon_activate_user_fan_table() to the subsequent
   patch.
 - Fail pwmN reads when no value has been written, rather than activating
   the user table from the stock table.
 - Define MIN_FAN_CONTROL_POINTS as 2.
 - Use MIN_FAN_CONTROL_POINTS for PWM configuration. (Soham)
 - Use batched writes for configuring fan control points when setting pwmN.
 - Add and rephrase couple debug logs.
 - Update the hwmon documentation.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 170 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 3 files changed, 182 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 5ee68aefa485..ce17e9ca3ed8 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
+Date:           October 2026
+KernelVersion:  7.3
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
+                fan speed and 255 is 100% fan speed.
+
+                Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 32016c5d4770..a86ed741feb3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -8,6 +8,7 @@
 #include <linux/jiffies.h>
 #include <linux/types.h>
 #include <linux/units.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include "regs/xe_gt_regs.h"
@@ -153,6 +154,9 @@ enum fan_table_type {
 /* Maximum number of fan control points supported by each fan. */
 #define MAX_FAN_CONTROL_POINTS	(10)
 
+/* Minimum number of points required for a user fan table. */
+#define MIN_FAN_CONTROL_POINTS  (2)
+
 /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
 #define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
 						((POINT_NUM) & REG_GENMASK(30, 0)))
@@ -913,6 +917,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -1154,6 +1159,89 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 	return 0;
 }
 
+static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
+					enum fan_table_type table_type)
+{
+	int ret;
+
+	ret = xe_hwmon_pcode_read_fan_control(hwmon,
+					      (table_type == USER_FAN_TABLE) ?
+					      FSC_READ_USER_FAN_CONTROL_POINTS :
+					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+					      fan, point_count);
+	if (ret) {
+		xe_err(hwmon->xe, "failed to read fan %d %s point count, ret=%d\n", fan,
+		       (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
+		return ret;
+	}
+
+	if (*point_count > MAX_FAN_CONTROL_POINTS) {
+		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
+		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
+		       MAX_FAN_CONTROL_POINTS);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Temperature to set when setting the fan PWM with pwmN. */
+#define FIXED_PWM_TEMP	(1)
+
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
+	u32 point_count = 0;
+	u8 clamped_pwm;
+	int ret, i;
+
+	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
+	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
+
+	/*
+	 * Set the first fan control point in the user table to the clamped PWM value.
+	 * Use only the first fan control point for setting the PWM value.
+	 */
+
+	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
+		writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
+		writes[i].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, FIXED_PWM_TEMP + (i)) |
+					    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, clamped_pwm);
+		xe_dbg(hwmon->xe, "prepared fan control point %d with temp=%d, speed=%u\n", i,
+		       FIXED_PWM_TEMP + (i), clamped_pwm);
+	}
+
+	writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan);
+	writes[i].data = MIN_FAN_CONTROL_POINTS;
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, ARRAY_SIZE(writes));
+	if (ret) {
+		xe_err(hwmon->xe, "failed to write pwm %d for fan %d, ret=%d\n", pwm, fan, ret);
+		return ret;
+	}
+	xe_dbg(hwmon->xe, "applied fixed pwm %u for fan %d\n", clamped_pwm, fan);
+
+	/* Verify if the fan points are set */
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (ret && point_count == 0) {
+		xe_err(hwmon->xe, "pwm set verify failed for fan %d, ret=%d, point count=%u\n", fan,
+		       ret, point_count);
+		return ret;
+	}
+
+	/* Update the user fan table cache. */
+	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
+		fi->fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + (i);
+		fi->fan_table[USER_FAN_TABLE].fcp[i].speed = clamped_pwm;
+		xe_dbg(hwmon->xe, "fan %d user table cache point %d with temp=%d, speed=%u\n", fan,
+		       i, fi->fan_table[USER_FAN_TABLE].fcp[i].temp,
+			  fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
+	}
+	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
+
+	return 0;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -1774,6 +1862,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(channel))
+		return 0;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
 static int
 xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
 {
@@ -1828,6 +1930,67 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static int
+xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_hwmon_fan_info *fi;
+	int ret = 0;
+
+	if (channel < 0 || channel >= FAN_MAX)
+		return -EINVAL;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		/* Check if user fan table is set else activate it.*/
+		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
+			xe_warn(hwmon->xe, "pwm not set for fan %d\n", channel);
+			ret = -ENXIO;
+			goto unlock;
+		}
+		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
+		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
+static int
+xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
+{
+	int ret = 0;
+
+	if (channel < 0 || channel >= FAN_MAX)
+		return -EINVAL;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > U8_MAX) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret;
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -1854,6 +2017,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1883,6 +2049,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1901,6 +2069,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 32bac74c4281..80642bee0ac8 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -82,9 +82,12 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
+#define     FSC_WRITE_FAN_TABLE			0x1
 #define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
 #define     FSC_READ_FAN_TABLE			0x7
 #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
 #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
-- 
2.25.1

