Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E7CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC16112466;
	Thu, 15 Oct 2026 19:09:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211E112460
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091335; x=1823627335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CKTjPiavFJZSbrS+eapy+2bFXbt4VaXvnJEoa4rN144=;
 b=jeCs8HqTK4lL5MWKY4WR9tU+73TpPtFMB8JdZS/QSbGlYpHmJDy/QyA/
 4cI0VrNsHls4kBwuEVMGwgR5fBOQWZhimhpeNhBJWyTcOR+f3XLCfmoI8
 tQsh3bR/3xFH28JgfwA6gTA40JnfA4lsQ8U/tv/MPjnl8uAueNJTZpp85
 WQay6AiDP2YdZWQC7k9AsT5NO5OlHJQdz3GfoMT8eTgs1W1FhvjHaDWhB
 XlFD2PMxwztRSJXPnqv++CyXnaWs92KPGrB32gDFGiVL94/2D1FJNH36F
 HffB3dFIy2EsWFTfoUOLF7ZtxP2QdnzHCvuNOfeK8qp3NsvbaE7ntmlL+ w==;
X-CSE-ConnectionGUID: Er9kYnHFT7qI8u2dKHlr2Q==
X-CSE-MsgGUID: vZpdHPJXSBK404hKJqxvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770374"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:54 -0700
X-CSE-ConnectionGUID: xqRIdO/zRFSSik6LLizFag==
X-CSE-MsgGUID: 2d2Sz9jRRUGurdEGZKEf5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835243"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:52 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
Date: Fri, 16 Oct 2026 00:37:47 +0530
Message-Id: <20261015190751.1268916-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Expose pwm[1-3]_enable to control the fan operating mode through
the hwmon interface.
 
Mode 0 forces the fan to run at full speed.
Mode 1 enables user fan-table control.
Mode 2 restores firmware-controlled fan management.
 
Document pwm[1-3]_enable in the Xe hwmon ABI.

v2:
 - Use xe helpers for dmesg logs.
 - Update kernel version in Xe hwmon documentation.
 - Correct level of some dmesg logs.

v3:
 - Each pwm_enable mode now sets its own state; drop the redundant
   post-switch pwm_enable_mode/is_full_speed update. (Badal)
 - Fix misindented dead assignment in the stock-table branch.
 - Make error handling consistent across pwm_enable modes. (Badal)
 - Document the pwm[1-3] manual-mode write precondition in the ABI. (Badal)
 - Use xe_pcode_write() instead of the timeout variant api as it is not
   needed.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  15 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 156 +++++++++++++++++-
 2 files changed, 168 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index ce17e9ca3ed8..92c91c57b3f2 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -329,4 +329,19 @@ Contact:        intel-xe@lists.freedesktop.org
 Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
                 fan speed and 255 is 100% fan speed.
 
+                Writing requires the corresponding pwm[1-3]_enable to be set to
+                1 (manual user-table mode) first; otherwise the write is
+                rejected with -EINVAL.
+
                 Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
+Date:          September 2026
+KernelVersion: 7.3
+Contact:       intel-xe@lists.freedesktop.org
+Description:   RW. Fan control mode selector.
+
+               Use value 0 to run fans at full speed. Use value 1 to enable
+               user table control and value 2 to use firmware default behavior.
+
+               Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a86ed741feb3..c3d5c682768d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -139,6 +139,15 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum xe_fan_pwm_enable_mode {
+	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
+	XE_FAN_PWM_FULL_SPEED = 0,
+	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
+	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
+	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
+	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
+};
+
 enum fan_table_type {
 	/** @STOCK_FAN_TABLE: firmware-provided fan table */
 	STOCK_FAN_TABLE,
@@ -189,6 +198,10 @@ struct xe_hwmon_fan_info {
 	u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -917,7 +930,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1185,10 +1200,80 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
 	return 0;
 }
 
+static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					    bool is_full_speed, enum fan_table_type table_source)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
+	u32 point_count;
+	int ret;
+	int point;
+	struct fan_table *source_table = &fi->fan_table[table_source];
+
+	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
+	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
+
+	point_count = source_table->point_count;
+	if (!point_count || point_count > MAX_FAN_CONTROL_POINTS) {
+		xe_err(hwmon->xe,
+		       "fan %d %s table point count %d is invalid, cannot activate user table\n",
+		       fan, (table_source == USER_FAN_TABLE) ? "user" : "stock", point_count);
+		return -EINVAL;
+	}
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = source_table->fcp[point].temp;
+		u8 speed = is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
+					    min_t(u32, fi->min_pwm, U8_MAX));
+
+		writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
+		writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
+					FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
+	}
+
+	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+					      fan);
+	writes[point_count].data = point_count;
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, point_count + 1);
+	if (ret) {
+		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, ret);
+		return ret;
+	}
+
+	/* Verify if all the user points are set */
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (ret) {
+		xe_err(hwmon->xe,
+		       "failed to read fan %d user table point count, ret=%d\n", fan, ret);
+		return ret;
+	}
+	if (point_count != source_table->point_count) {
+		xe_err(hwmon->xe, "fan %d user table point count mismatch, expected %u, got %u\n",
+		       fan, source_table->point_count, point_count);
+		return -EIO;
+	}
+
+	if (table_source == STOCK_FAN_TABLE) {
+		for (point = 0; point < point_count; point++) {
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
+				source_table->fcp[point].temp;
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
+				is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
+							    min_t(u32, fi->min_pwm, U8_MAX));
+		}
+	}
+
+	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = is_full_speed;
+
+	return 0;
+}
+
 /* Temperature to set when setting the fan PWM with pwmN. */
 #define FIXED_PWM_TEMP	(1)
 
-static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, bool full_speed)
 {
 	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
 	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
@@ -1196,6 +1281,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	u8 clamped_pwm;
 	int ret, i;
 
+	if (!full_speed && fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n", fan);
+		return -EINVAL;
+	}
+
 	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
 	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
 
@@ -1239,6 +1329,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	}
 	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
 
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = full_speed;
 	return 0;
 }
 
@@ -1303,6 +1395,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
 		}
 
+		/* Set PWM enable mode to automatic i.e stock table in use. */
+		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
 						      &fi->min_pwm);
@@ -1870,6 +1965,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -1954,6 +2050,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
 		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
 		break;
+	case hwmon_pwm_enable:
+		*val = fi->pwm_enable_mode;
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -1967,11 +2066,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static int
 xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi;
 	int ret = 0;
 
 	if (channel < 0 || channel >= FAN_MAX)
 		return -EINVAL;
 
+	fi = &hwmon->fi[channel];
+
 	mutex_lock(&hwmon->hwmon_lock);
 
 	switch (attr) {
@@ -1980,12 +2083,59 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 			ret = -EINVAL;
 			break;
 		}
-		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
+		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val, false);
+		break;
+	case hwmon_pwm_enable:
+		if (val == XE_FAN_PWM_FULL_SPEED) {
+			ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, true);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"full speed enable for fan %d failed, ret=%d\n",
+					channel, ret);
+				break;
+			}
+		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
+			enum fan_table_type source = fi->fan_table[USER_FAN_TABLE].point_count ?
+				USER_FAN_TABLE : STOCK_FAN_TABLE;
+
+			/*
+			 * Manual fan speed control using user fan table.
+			 * If user fan table is not programmed, it would be initialized with
+			 * clamped stock points which allows manual control with some
+			 * default points.
+			 */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false, source);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to activate user fan table for fan %d, ret=%d\n",
+					channel, ret);
+				break;
+			}
+		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+			/* Switch to stock table specifying the user points to 0. */
+			ret = xe_pcode_write(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
+								   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+								   channel), 0);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to disable user fan table for fan %d, ret=%d\n",
+					channel, ret);
+				break;
+			}
+			xe_dbg(hwmon->xe,
+			       "automatic control enabled for fan %d using stock table\n",
+			       channel);
+			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+			fi->is_full_speed = false;
+		} else {
+			ret = -EINVAL;
+		}
 		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
 	}
+
 	mutex_unlock(&hwmon->hwmon_lock);
 
 	return ret;
-- 
2.25.1

