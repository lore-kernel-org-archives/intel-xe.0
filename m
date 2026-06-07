Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33958CD8C89
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB41510EAE0;
	Sun,  7 Jun 2026 17:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAYsquUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEC510EAE0
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852800; x=1812388800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8TLSbQUXip3l0GyRZ4Zf6zUMDUHZrtc8GnQ7IvKSaeE=;
 b=LAYsquUXtY164IfAEOCYvmEeG0BUI9kwuMqwUZDBKog6qnueHx3BI5fc
 fAaNXGTLudDLlLSvc5kngnNu61U5uI4b8eSvMbO+Mt2AlMZLWUGVcu5KB
 Cr0bDIkVAhRWynbLfAYxC1roL8GrXDvXcsAEWPDMQ6XFEd2WeO7brRFni
 6n52VKVHa4ccTUSbuMrk/7Y1Md2hHoSGSyxr1Utjaliy6Y022U28IanrU
 Ma6lQFkxaeRm+pYAZVO8sFoNGjq6WDtj0Q4hN1KAhGHwSr2oPWwnVihva
 zM/oFca8J7DoGOWAzl40V96+U6Jk4PzcEFRzFTWJkLJtitjVEJHWtlJDu w==;
X-CSE-ConnectionGUID: mG6LBVR1Rv27yuHhpF4VrQ==
X-CSE-MsgGUID: wTinhgwMTTy9AJlCehI/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737543"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:20:00 -0700
X-CSE-ConnectionGUID: 0X9/qbDoSgymCJ3rdn24kw==
X-CSE-MsgGUID: 6OMNZWeDQRqman+wlkroEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521612"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:58 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 3/5] drm/xe/hwmon: expose pwm[1-3]
Date: Sun,  7 Jun 2026 22:58:46 +0530
Message-Id: <20260607172848.2970580-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260607172848.2970580-1-karthik.poosa@intel.com>
References: <20260607172848.2970580-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 157 ++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 557e0f68aba6..58086eb2beda 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -314,3 +314,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
+Date:           June 2026
+KernelVersion:  7.1
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
+                fan speed and 255 is 100% fan speed.
+
+                Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5548d0a3df66..c00d36e3fbe5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -815,6 +815,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -1008,6 +1009,55 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	return 0;
 }
 
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+	u8 clamped_pwm;
+	int ret;
+	int point;
+
+	if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+		drm_dbg(&hwmon->xe->drm,
+			"fan %d manual table is not active, cannot set pwm\n", fan);
+		return -EINVAL;
+	}
+
+	if (!point_count) {
+		drm_dbg(&hwmon->xe->drm,
+			"fan %d user table has no control points, cannot set pwm\n", fan);
+		return -ENODATA;
+	}
+
+	pwm = (pwm * 100) / U8_MAX;
+	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
+
+		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, clamped_pwm);
+		if (ret)
+			return ret;
+
+		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
+	}
+
+	ret = xe_pcode_write(root_tile,
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
+			     point_count);
+	if (ret) {
+		drm_dbg(&hwmon->xe->drm,
+			"failed to update fan %d user table count, ret=%d\n", fan, ret);
+		return ret;
+	}
+
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = false;
+
+	return 0;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -1548,6 +1598,33 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	u32 num_fans = 0;
+	int ret;
+
+	if (!hwmon->xe->info.has_fan_control)
+		return 0;
+
+	ret = xe_hwmon_get_num_fans(hwmon, &num_fans);
+	if (ret) {
+		drm_dbg(&hwmon->xe->drm,
+			"failed to read fan count for pwm visibility, ret=%d\n", ret);
+		return 0;
+	}
+
+	if (channel >= num_fans)
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
@@ -1602,6 +1679,79 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static int
+xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_hwmon_fan_info *fi;
+
+	if (channel < 0 || channel >= FAN_MAX)
+		return -EINVAL;
+
+	fi = &hwmon->fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
+			*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
+									U8_MAX,	100);
+		} else {
+			drm_dbg(&hwmon->xe->drm,
+				"Fan %d control points unavailable; cannot read PWM\n",	channel);
+			return -ENODATA;
+		}
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
+{
+	struct xe_hwmon_fan_info *fi;
+	int ret = 0;
+
+	if (channel < 0 || channel >= FAN_MAX)
+		return -EINVAL;
+
+	fi = &hwmon->fi[channel];
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > U8_MAX) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE ||
+		    fi->is_full_speed) {
+			drm_dbg(&hwmon->xe->drm,
+				"fan %d not in manual table mode; cannot set PWM.",
+				channel);
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	/* Update PWM enable mode and full speed status if no error occurred */
+	if (!ret) {
+		fi->pwm_enable_mode = val;
+		fi->is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
+	}
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret;
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -1628,6 +1778,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1657,6 +1810,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1675,6 +1830,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.25.1

