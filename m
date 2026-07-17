Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100DC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE9D10E3FB;
	Fri, 17 Jul 2026 04:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHZ6cCBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BD810E3FB
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261360; x=1815797360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NRHJAXDjDdlGL4aHiTSA6F8RiDNLZfy+V/VN8NUc9dY=;
 b=oHZ6cCBobQk9Uqd9ZIpONitNJE6tsuwjJc/wGo0/ypnjuh4KPNNbnTc2
 jYtdGkQKquVGQee8xvR0s2RYMU9Dn9veuwYDhT/aRyg6lYiKnwNTMyT7G
 HhVVpylIuCIAXmqlzxbqMpcO6eGUJRjeAGBYFs0OdTbg9Xir3Rc5yhJwX
 baRLoibvTu3GpjvMKqAdoqk6O7Vu/OV3gNmmPKTKxwPNVQdziXuXVhK9n
 EHBSv2JxKYt4CZe6cIrewVxboJF7kuqkPy3OsUULzaMOVbCt9DumsSi9d
 7FsdSMhFKnXE3pyEvbR+BYImxUHzUJ2a9IYkZZBCjN06whFJYEP6S/0mQ w==;
X-CSE-ConnectionGUID: JdnFkM05RbutTMGRwyUJ4w==
X-CSE-MsgGUID: U8ffggBsTeCw7K1PJYqgGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129362"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129362"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:20 -0700
X-CSE-ConnectionGUID: alE3HZS5TyuGqksMnQofeg==
X-CSE-MsgGUID: ZLlkZoJNQs+Iy0CIpc/ryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538907"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:18 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
Date: Fri, 17 Jul 2026 09:47:53 +0530
Message-Id: <20260717041757.2759084-6-karthik.poosa@intel.com>
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

Expose pwm[1-3]_enable for fan control mode selection.
Value of 0 runs fan at full speed.
A value of 1 keeps user fan-table control active, while value 2
switches back to firmware control.

Update Xe hwmon ABI documentation for pwm[1-3]_enable.

v2:
 - Use xe helpers for dmesg logs.
 - Update kernel version in Xe hwmon documentation.
 - Correct level of some dmesg logs.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 11 +++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 91 ++++++++++++++++++-
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 7383898890aa..effc7d38ce1f 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -330,3 +330,14 @@ Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
                 fan speed and 255 is 100% fan speed.
 
                 Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
+Date:          July 2026
+KernelVersion: 7.2
+Contact:       intel-xe@lists.freedesktop.org
+Description:   RW. Fan control mode selector.
+
+               Use value 0 to run fans at full speed. Use value 1 to enable
+               user table control and value 2 to use firmware default behavior.
+
+               Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d3379727b1a9..fa9dbadd5fd6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -123,6 +123,15 @@ struct xe_hwmon_energy_info {
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
@@ -169,6 +178,10 @@ struct xe_hwmon_fan_info {
 		u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -803,7 +816,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1033,7 +1048,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	}
 
 	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
-
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = is_full_speed;
 	return 0;
 }
 
@@ -1046,6 +1062,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	int ret;
 	int point;
 
+	if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+		xe_dbg(hwmon->xe, "fan %d manual table is not active, cannot set pwm\n", fan);
+		return -EINVAL;
+	}
+
 	/* Read user table fan point count, if it is not set, activate the user table */
 	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
 	if (ret)
@@ -1078,6 +1099,9 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
 		return ret;
 	}
+
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = false;
 	return 0;
 }
 
@@ -1134,6 +1158,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
 		}
 
+		/* Set PWM enable mode to automatic i.e stock table in use. */
+		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
 						      &fi->min_pwm);
@@ -1585,6 +1612,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -1669,6 +1697,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
 						U8_MAX,	100);
 		return 0;
+	case hwmon_pwm_enable:
+			*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1677,11 +1708,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
@@ -1692,10 +1727,62 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 		}
 		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
 		break;
+	case hwmon_pwm_enable:
+		if (val == XE_FAN_PWM_FULL_SPEED) {
+			/* Set fans at full speed. */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, true,
+							       STOCK_FAN_TABLE);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"full speed enable for fan %d failed, ret=%d\n",
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
+			/*
+			 * Manual fan speed control using user fan table.
+			 * If user fan table is not programmed, it would be initialized with
+			 * clamped stock points which allows manual control with some
+			 * default points.
+			 */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
+							       USER_FAN_TABLE);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to activate user fan table for fan %d, ret=%d\n",
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+			/* Switch to stock table specifying the user points to 0. */
+			ret = xe_pcode_write_timeout(root_tile,
+						     PCODE_MBOX(FAN_SPEED_CONTROL,
+								FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+								channel),
+						      0, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to disable user fan table for fan %d, ret=%d\n",
+					channel, ret);
+				break;
+			}
+			xe_dbg(hwmon->xe,
+			       "automatic control enabled for fan %d using stock table\n",
+			       channel);
+			       ret = 0;
+		} else {
+			ret = -EINVAL;
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
 	}
+
+	/* Update PWM enable mode and full speed status if no error occurred */
+	if (!ret && attr == hwmon_pwm_enable) {
+		fi->pwm_enable_mode = val;
+		fi->is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
+	}
+
 	mutex_unlock(&hwmon->hwmon_lock);
 
 	return ret;
-- 
2.25.1

