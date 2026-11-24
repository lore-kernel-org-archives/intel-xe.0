Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6970F606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eh8nFUyy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAC010E754;
	Tue, 24 Nov 2026 05:46:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A626210E21F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499198; x=1827035198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=waDfOlcM3HgTaPY5UwRJraB4EVlps/k/Ba+EDl1iqvw=;
 b=eh8nFUyypgyfU4mpP3ijGVH/49213+Yi7fnIUtp1D8VFNbN1MV+L0kOY
 LVkNHK/BVV0uGY3bq8kAzvteRBdpj/Q+4iMJa2fUp9Df5fHYKLFKIvK0e
 d41+CjgE5Hub3371OjH49MAYc9K8PSsvgZC2uW/JuHLKXJ8TSCX+SCI2h
 oN9bmHTyIh459sR3L1/i0s5rEVZJ8Su0XtfmXJJ/+m6SKH+c4mzYg4l9M
 W/1bsgupC69/9sy9LaqPNgOHYuxLO8AQCOVMiAvo/AM3gnM5LxJe/VM5D
 khT1LA+tg+v/L0FVyTpHO8Bfo7Lyk342mml3R86zGZ0ciJoXuG97UVhJZ g==;
X-CSE-ConnectionGUID: /ZtHLqcuS4Wwakzmr4QuqA==
X-CSE-MsgGUID: G7k4aiOVQXug7xesxcv0xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222640"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:38 -0800
X-CSE-ConnectionGUID: t4Ar59WkSUKJM5K20I3PjA==
X-CSE-MsgGUID: AYFpKs/NQQa+WRcocwRWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354603"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:35 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 04/10] drm/xe/hwmon: Expose pwm[1-3]
Date: Tue, 24 Nov 2026 11:18:05 +0530
Message-Id: <20261124054811.798763-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose pwm[1-3] fan duty attributes through hwmon.

This enables reading and writing user PWM values (0..255) for each
available fan channel. It can be used for manual control of fan speed,
irrespective of fan curve. Switching back to the stock fan curve is
added in a later patch.

Update Xe hwmon ABI documentation for pwm[1-3].

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

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

v4:
 - Use tab indentation in ABI doc and MIN_FAN_CONTROL_POINTS. (Soham)
 - Drop unused linux/delay.h include. (Soham)
 - Clamp min PWM to 100% since fan table speed is in percent. (Soham)
 - Log both the requested pwm and the applied percentage. (Soham)
 - Fail the pwm write if pcode reports a user point count other than
   MIN_FAN_CONTROL_POINTS after the write. (Soham)
 - Drop redundant channel range checks in pwm read/write. (Soham)
 - Fix misleading comments and debug log alignment. (Soham)
 - Note that the 0..255 to percent round trip is lossy. (Soham)
 - Update ABI Date and KernelVersion to November 2026 and 7.5.
 - Document that pwm values below the fan minimum are raised to it.
 - Return -ENODATA and log at debug level when pwm has not been set.
 - Invalidate the cached user table when the pwm write or verify fails.
 - Clear point count on pcode read failure.
 - Drop unneeded parentheses in MIN_FAN_CONTROL_POINTS and FIXED_PWM_TEMP.
 - Document pcode user table write ordering.

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  10 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 165 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 3 files changed, 178 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 1d42ea0639f7..31348d65c89d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -321,3 +321,13 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Target fan PWM duty value in the range 0..255, where 255
+		is 100% fan speed. Values below the fan's minimum PWM are
+		raised to that minimum.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d06f9dc8a463..e892a6517334 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -157,6 +157,9 @@ enum fan_table_type {
 /* Maximum number of fan control points supported by each fan. */
 #define MAX_FAN_CONTROL_POINTS	10
 
+/* Minimum number of points required for a user fan table. */
+#define MIN_FAN_CONTROL_POINTS	2
+
 /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
 #define FCP_INDEX(table_type, point_num) (((u32)(table_type) << 31) | \
 						((u32)(point_num) & GENMASK(30, 0)))
@@ -917,6 +920,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -1159,6 +1163,91 @@ static void xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 	xe_info(hwmon->xe, "Number of fans detected: %u\n", hweight32(hwmon->fan_enable_mask));
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
+		*point_count = 0;
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
+#define FIXED_PWM_TEMP	1
+
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
+	u32 point_count = 0;
+	u8 speed;
+	int ret, i;
+
+	/* Fan table speed and min_pwm are in percent. */
+	speed = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
+	speed = max_t(u32, speed, min_t(u32, fi->min_pwm, 100));
+
+	/* Fan control needs at least two points; program them all at the same speed. */
+	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
+		writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
+		writes[i].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, FIXED_PWM_TEMP + i) |
+				 FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
+		xe_dbg(hwmon->xe, "prepared fan control point %d with temp=%d, speed=%u%%\n", i,
+		       FIXED_PWM_TEMP + i, speed);
+	}
+
+	/* pcode fills the user table from point 0 in write order; the count write commits it. */
+	writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan);
+	writes[i].data = MIN_FAN_CONTROL_POINTS;
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, ARRAY_SIZE(writes));
+	if (ret) {
+		/* pcode may hold a partial table now, so drop the stale cached value. */
+		fi->fan_table[USER_FAN_TABLE].point_count = 0;
+		xe_err(hwmon->xe, "failed to write pwm %u (%u%%) for fan %d, ret=%d\n",
+		       pwm, speed, fan, ret);
+		return ret;
+	}
+	xe_dbg(hwmon->xe, "applied pwm %u (%u%%) for fan %d\n", pwm, speed, fan);
+
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (ret || point_count != MIN_FAN_CONTROL_POINTS) {
+		fi->fan_table[USER_FAN_TABLE].point_count = 0;
+		xe_err(hwmon->xe, "pwm set verify failed for fan %d, ret=%d, point count=%u\n", fan,
+		       ret, point_count);
+		return ret ?: -EIO;
+	}
+
+	/* Update the user fan table cache. */
+	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
+		fi->fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + i;
+		fi->fan_table[USER_FAN_TABLE].fcp[i].speed = speed;
+		xe_dbg(hwmon->xe, "fan %d user table cache point %d with temp=%d, speed=%u%%\n",
+		       fan, i, fi->fan_table[USER_FAN_TABLE].fcp[i].temp,
+		       fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
+	}
+	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
+
+	return 0;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	int point;
@@ -1784,6 +1873,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(hwmon, channel))
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
@@ -1837,6 +1940,61 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static int
+xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_hwmon_fan_info *fi;
+	int ret = 0;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
+			xe_dbg(hwmon->xe, "pwm not set for fan %d\n", channel);
+			ret = -ENODATA;
+			goto unlock;
+		}
+		/* Speed is cached in percent, so the 0..255 round trip may be off by a step. */
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
@@ -1863,6 +2021,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1892,6 +2053,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1910,6 +2073,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index b8132db0e399..6e4878d965f2 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -82,9 +82,12 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
+#define     FSC_WRITE_FAN_TABLE			0x1
 #define     FSC_READ_MAX_FAN_RPS		0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
 #define     FSC_READ_FAN_TABLE			0x7
 #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
 #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
-- 
2.34.1

