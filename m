Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A229C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155E88C4C;
	Fri, 17 Jul 2026 04:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df/Isg87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32210E75C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261357; x=1815797357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iuIC4I3hoDWBHVK6fBp9XozddDC1w5mZ7ADubHRVPI=;
 b=df/Isg87NXE0nj38dUvBULR8LlV7tudTjY9v4QHK8OFtMNllrSULKN/H
 1AqYnovjqWw0eOQGhro+Hb7hLljnJPzAPKB0JZDoD//PJsWbVbZLOZzGu
 8DfKU0wbqUHgjSPI+stidqFGABTYKVky6ZBg7TMBqx/2e2NxnkB5TTrB8
 uLojGfCGkWzvBqET1ljHOYAv7OH1MgkMfBYlcLhVfp6wwCXc5HYXAcZRK
 hdjJNtu2Bhlrvnh+peUHYmcbKQzLR6qv1kjLgRgwJTxgfDhxmEn0RMu+V
 jMyj2sUQHTKUSncWLBSbR6hNayL9kdXRfd+GUqDtGnhZ50TmygXlzzyJD g==;
X-CSE-ConnectionGUID: /DbD92OaQAejzaGx6yay7A==
X-CSE-MsgGUID: kDfY4B3TSKGUwVMCLnpAFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129358"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:16 -0700
X-CSE-ConnectionGUID: J9iKaY13QNChshCamWWt8A==
X-CSE-MsgGUID: al2jeHisRcWeCmkJI+i7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538901"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:14 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
Date: Fri, 17 Jul 2026 09:47:52 +0530
Message-Id: <20260717041757.2759084-5-karthik.poosa@intel.com>
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

Expose pwm[1-3] fan duty attributes through hwmon.

This enables reading and writing user PWM values (0..255) for each
available fan channel.

Update Xe hwmon ABI documentation for pwm[1-3].

This sysfs node can be used for manual control of fan speed,
irrespective of fan curve.

v2:
 - Use xe helpers for dmesg logs.
 - Avoid use hwmon->num_fans to get fan count in xe_hwmon_pwm_is_visible().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 3 files changed, 242 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index ec0b94d76e22..7383898890aa 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
+Date:           July 2026
+KernelVersion:  7.2
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
+                fan speed and 255 is 100% fan speed.
+
+                Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 769f4d1da83e..d3379727b1a9 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
 	return 0;
 }
 
+static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
+					int table_type)
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
+	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
+	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
+
+	return 0;
+}
+
+static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 point, u8 temp,
+					 u8 speed)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
+			 FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
+	int ret;
+
+	ret = xe_pcode_write_timeout(root_tile,
+				     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan),
+				    (u32)user_fcp_raw, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+	if (ret)
+		xe_dbg(hwmon->xe,
+		       "failed to write fan %d user point %d temp %u, speed %u %%, ret=%d\n",
+		       fan, point, temp, speed, ret);
+
+	return ret;
+}
+
+static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					    bool is_full_speed, enum fan_table_type table_source)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	u32 point_count;
+	int ret;
+	int point;
+	struct fan_table *source_table = &fi->fan_table[table_source];
+
+	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
+	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
+
+	point_count = source_table->fan_control_point_count;
+
+	if (!point_count) {
+		xe_err(hwmon->xe,
+		       "fan %d %s table point count is 0, cannot activate user table\n", fan,
+		       (table_source == USER_FAN_TABLE) ? "user" : "stock");
+		return -ENODATA;
+	}
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = source_table->fcp[point].temp;
+		u8 speed = is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
+					    min_t(u32, fi->min_pwm, U8_MAX));
+
+		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
+		if (ret)
+			return ret;
+
+		if (table_source == STOCK_FAN_TABLE) {
+			/* Update user table cache with stock table values */
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
+		}
+		if (is_full_speed)
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
+	}
+
+	ret = xe_pcode_write_timeout(root_tile,
+				     PCODE_MBOX(FAN_SPEED_CONTROL,
+						FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
+				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
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
+	if (point_count != source_table->fan_control_point_count) {
+		xe_err(hwmon->xe, "fan %d user table point count mismatch, expected %u, got %u\n",
+		       fan, source_table->fan_control_point_count, point_count);
+		return -EIO;
+	}
+
+	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
+
+	return 0;
+}
+
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+	u8 clamped_pwm;
+	int ret;
+	int point;
+
+	/* Read user table fan point count, if it is not set, activate the user table */
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (ret)
+		return ret;
+
+	if (!point_count) {
+		xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", fan);
+		ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, STOCK_FAN_TABLE);
+		if (ret)
+			return ret;
+	}
+
+	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
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
+		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
+		return ret;
+	}
+	return 0;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
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
@@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
+	fi = &hwmon->fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		/* Check if user fan table is set else activate it.*/
+		if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
+			xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", channel);
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
+							       STOCK_FAN_TABLE);
+			if (ret)
+				return ret;
+		}
+		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
+						U8_MAX,	100);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
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
@@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 419ab4f416fa..5c5fdc650a97 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -84,9 +84,12 @@
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

