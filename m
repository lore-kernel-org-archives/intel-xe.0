Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886C606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M3i7o7DM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0810E3DA;
	Sat, 28 Nov 2026 05:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DCB10E271
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845494; x=1827381494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atC8P1wJG0j2RcEz8OLhDhoHiqRsjV5MR1j5KgQo+88=;
 b=M3i7o7DMRVp2DxjOjdNlhvH+S56a7DXQEBkufVrQBarNtuJkY9xmCbYP
 3PRAZw8ceVXs92aPV2mpAQIsGqs+Qrh0zSTcnRJGPKlameAFHI8MC2Jfh
 GzQoG0VRD1dM+CmioMsnF0wkbVyHWyMsOcU2RBsk8pWXgaFoh6ZHrlbau
 sznx5G5zgIf6yagZ+R2rZ1qfHP5EkNvZRB7hZLFK9Dz7KMVtog9LpmNZX
 kckvvyiCy1C+etuJ/iAw3+NyLaI5Dz4rrrMjgcANpgQtGz1nGs+WKnD5A
 AQvd//xBXevpBN7dIGDxUVTM2bnE7p01dz/Qlfqbw6wuzbluB9B2ff+lS A==;
X-CSE-ConnectionGUID: NtWS5KFTSaKjTzeutu/66g==
X-CSE-MsgGUID: H0cR7l03SQq7ZfadkqDytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754899"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:14 -0800
X-CSE-ConnectionGUID: RNz2ogetT42F0xkoayCx2Q==
X-CSE-MsgGUID: 98FbAME2S863+WZVibjS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304317"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:11 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 06/10] drm/xe/hwmon: Enable fan curve control support
Date: Sat, 28 Nov 2026 11:29:19 +0530
Message-Id: <20261128055923.3316956-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
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

Expose curve-point temperature and pwm controls via
pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
F is the fan number and P is the fan curve point number.
Each fan curve point has a temperature and a pwm attribute.

Update Xe hwmon ABI documentation for pwm auto point temperature
attributes.

v2:
 - Use xe helpers for dmesg logs.
 - Update kernel version in Xe hwmon documentation.
 - Correct debug level of some dmesg logs.

v3:
 - Allow variable fan curve points from >=2 to MAX_FAN_CONTROL_POINTS.
 - Expose all MAX_FAN_CONTROL_POINTS fan-curve slots so users can extend
   a short fan table.
 - Stage temp/PWM pairs without changing the active curve. Commit at a
   (0, 0) end marker or after all MAX_FAN_CONTROL_POINTS pairs.
 - Write the points together, verify the firmware count, then update the
   active cache.

v4:
 - Use the two-argument IS_FAN_ENABLED() after rebase.
 - Fix kernel-doc for nested staged fan_table members.
 - Use "speed" for percent values and "pwm" only for the 0..255 sysfs
   value. (Soham)
 - Use u32 for the point index in xe_hwmon_commit_user_fan_table(). (Soham)
 - Fix comment to say curve points must not decrease. (Soham)
 - Add debug logs before -EINVAL returns. (Soham)
 - Drop inline from xe_hwmon_get_active_fan_table(). (Soham)
 - Use reverse xmas tree ordering for local variables. (Soham)
 - Rename xe_hwmon_get_u8_from_sysfs() to xe_hwmon_sysfs_to_hw_val().
   (Soham)
 - Use if/else if/else for value selection in pwm auto point show. (Soham)
 - Create the fan curve sensor attributes at probe time instead of 60
   static definitions. (Soham)
 - Clamp min PWM to 100% and reject pwm values above 100% speed.
 - Use xe helpers for logs in the auto point store functions.

v5:
 - Address review comments from Sashiko.
 - Remove min_pwm as it is not available.
 - Read back the user point count after curve programming and fall back
   to stock control when firmware does not accept it.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 429 ++++++++++++++++++++++++++++++++--
 1 file changed, 415 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f62a60e99140..866e54c82d27 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -174,6 +174,11 @@ enum fan_table_type {
 /* Minimum number of points required for a user fan table. */
 #define MIN_FAN_CONTROL_POINTS	2
 
+/* pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm for every curve point of a fan. */
+#define XE_CURVE_ATTRS_PER_FAN	(2 * MAX_FAN_CONTROL_POINTS)
+#define XE_CURVE_ATTRS		(FAN_MAX * XE_CURVE_ATTRS_PER_FAN)
+#define XE_CURVE_ATTR_NAME_LEN	sizeof("pwmN_auto_pointNN_temp")
+
 /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
 #define FCP_INDEX(table_type, point_num) (((u32)(table_type) << 31) | \
 						((u32)(point_num) & GENMASK(30, 0)))
@@ -201,6 +206,12 @@ struct xe_hwmon_fan_info {
 			/** @fan_table.fcp.speed: fan speed in percentage */
 			u8 speed;
 		} fcp[MAX_FAN_CONTROL_POINTS];
+		/** @fan_table.staged_fcp: curve supplied via sysfs but not yet committed */
+		struct fan_control_point staged_fcp[MAX_FAN_CONTROL_POINTS];
+		/** @fan_table.temp_staged: bitmask of temperature fields supplied via sysfs */
+		u16 temp_staged;
+		/** @fan_table.speed_staged: bitmask of speed fields supplied via sysfs */
+		u16 speed_staged;
 	} fan_table[FAN_TABLE_MAX];
 	/** @max_rps: maximum fan RPS */
 	u32 max_rps;
@@ -268,6 +279,16 @@ struct xe_hwmon {
 	u32 pl2_on_boot[CHANNEL_MAX];
 	/** @temp: Temperature info */
 	struct xe_hwmon_thermal_info temp;
+	/** @curve_sda: fan curve sensor attributes */
+	struct sensor_device_attribute curve_sda[XE_CURVE_ATTRS];
+	/** @curve_names: names of the fan curve sensor attributes */
+	char curve_names[XE_CURVE_ATTRS][XE_CURVE_ATTR_NAME_LEN];
+	/** @curve_attrs: NULL-terminated list of fan curve attributes */
+	struct attribute *curve_attrs[XE_CURVE_ATTRS + 1];
+	/** @curve_group: fan curve attribute group */
+	struct attribute_group curve_group;
+	/** @groups: NULL-terminated list of extra attribute groups */
+	const struct attribute_group *groups[3];
 };
 
 static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon, int channel)
@@ -912,11 +933,6 @@ static const struct attribute_group hwmon_attrgroup = {
 	.is_visible = xe_hwmon_attributes_visible,
 };
 
-static const struct attribute_group *hwmon_groups[] = {
-	&hwmon_attrgroup,
-	NULL
-};
-
 static const u32 hwmon_temp_config[CHANNEL_MAX + 1] = {
 	[CHANNEL_CARD] = HWMON_T_LABEL,
 	[CHANNEL_PKG] = HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT |
@@ -1245,6 +1261,79 @@ static int xe_hwmon_fan_set_auto(struct xe_hwmon *hwmon, u8 fan)
 	return ret;
 }
 
+static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					  const struct fan_control_point *points, u32 point_count)
+{
+	/* The extra write is for the final write that sets the number of fan control points */
+	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
+	u32 accepted_count = 0;
+	u32 point;
+	int ret, write_ret, verify_ret;
+
+	if (!point_count) {
+		xe_err(hwmon->xe, "no fan control points provided for fan %d\n", fan);
+		return -ENODATA;
+	}
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = points[point].temp;
+		u8 speed = points[point].speed;
+
+		/* Temperature and speed must not decrease from one point to the next. */
+		if (point > 0) {
+			u8 prev_temp = points[point - 1].temp;
+			u8 prev_speed = points[point - 1].speed;
+
+			if (temp < prev_temp || speed < prev_speed) {
+				xe_dbg(hwmon->xe,
+				       "fan %d point %u decreases: %u/%u%% after %u/%u%%\n",
+				       fan, point, temp, speed, prev_temp, prev_speed);
+				return -EINVAL;
+			}
+		}
+
+		/* Prepare the write for this fan control point */
+		writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE,
+						fan);
+		writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
+				FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
+	}
+
+	xe_dbg(hwmon->xe, "committing fan %d user table with %u points\n", fan, point_count);
+
+	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+					      fan);
+	writes[point_count].data = point_count;
+
+	write_ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes,
+					 point_count + 1);
+	if (write_ret)
+		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, write_ret);
+
+	verify_ret = xe_hwmon_get_fan_point_count(hwmon, fan, &accepted_count, USER_FAN_TABLE);
+	if (write_ret || verify_ret || accepted_count != point_count) {
+		int failure_ret = write_ret ?: verify_ret ?: -EIO;
+
+		hwmon->fi[fan].fan_table[USER_FAN_TABLE].point_count = 0;
+		if (verify_ret || accepted_count != point_count)
+			xe_err(hwmon->xe,
+			       "fan %d table count verification failed: ret=%d, expected=%u, got=%u\n",
+			       fan, verify_ret, point_count, accepted_count);
+		ret = xe_hwmon_fan_set_auto(hwmon, fan);
+		if (ret) {
+			hwmon->fi[fan].pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED;
+			hwmon->fi[fan].is_full_speed = false;
+			xe_err(hwmon->xe, "failed to restore fan %d to stock mode, ret=%d\n", fan,
+			       ret);
+		}
+		return failure_ret;
+	}
+
+	xe_dbg(hwmon->xe, "fan %d user table committed successfully with %u points\n", fan,
+	       point_count);
+	return 0;
+}
+
 static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 					    bool is_full_speed, enum fan_table_type table_source)
 {
@@ -1313,6 +1402,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
 	fi->pwm_enable_mode = is_full_speed ? XE_FAN_PWM_FULL_SPEED :
 					    XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 	fi->is_full_speed = is_full_speed;
 
 	return 0;
@@ -1384,6 +1475,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
 		       fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
 	}
 	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
+	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 
 	fi->pwm_enable_mode = full_speed ? XE_FAN_PWM_FULL_SPEED :
 					 XE_FAN_PWM_MANUAL_USER_TABLE;
@@ -1391,6 +1484,312 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
 	return 0;
 }
 
+#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
+#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
+#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
+
+static int
+xe_hwmon_decode_curve_index(struct xe_hwmon *hwmon, u32 index, u8 *fan, u8 *point)
+{
+	u8 local_fan = XE_CURVE_FAN(index);
+	u8 local_point = XE_CURVE_POINT(index);
+
+	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS) {
+		xe_dbg(hwmon->xe, "invalid fan curve index 0x%x: fan %u point %u\n",
+		       index, local_fan, local_point);
+		return -EINVAL;
+	}
+
+	*fan = local_fan;
+	*point = local_point;
+
+	return 0;
+}
+
+static enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
+{
+	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
+		return STOCK_FAN_TABLE;
+	else
+		return USER_FAN_TABLE;
+}
+
+static ssize_t
+xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	enum fan_table_type active_table;
+	struct xe_hwmon_fan_info *fi;
+	u32 point_count;
+	u8 point;
+	u8 temp;
+	int ret;
+	u8 fan;
+
+	ret = xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[fan];
+	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
+
+	point_count = fi->fan_table[active_table].point_count;
+
+	if (point >= point_count)
+		temp = 0;
+	else
+		temp = fi->fan_table[active_table].fcp[point].temp;
+	return sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
+}
+
+static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
+					  bool is_temp, u8 value)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct fan_table *table;
+	u32 point_count;
+	int ret;
+
+	table = &fi->fan_table[USER_FAN_TABLE];
+
+	if (is_temp) {
+		table->staged_fcp[point].temp = value;
+		table->temp_staged |= BIT(point);
+	} else {
+		table->staged_fcp[point].speed = value;
+		table->speed_staged |= BIT(point);
+	}
+
+	/* Wait for a complete prefix; (0, 0) ends the curve without becoming a point. */
+	for (point_count = 0; point_count < MAX_FAN_CONTROL_POINTS; point_count++) {
+		if (!(table->temp_staged & BIT(point_count)) ||
+		    !(table->speed_staged & BIT(point_count)))
+			return 0;
+		if (!table->staged_fcp[point_count].temp &&
+		    !table->staged_fcp[point_count].speed)
+			break;
+	}
+
+	if (point_count < MIN_FAN_CONTROL_POINTS) {
+		xe_dbg(hwmon->xe, "fan %d curve needs at least %d points, got %u\n",
+		       fan, MIN_FAN_CONTROL_POINTS, point_count);
+		ret = -EINVAL;
+		goto clear_staged;
+	}
+
+	ret = xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, point_count);
+	if (ret)
+		goto clear_staged;
+
+	/* Publish the new curve only after firmware accepts its point count. */
+	memcpy(table->fcp, table->staged_fcp, point_count * sizeof(table->fcp[0]));
+	table->point_count = point_count;
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = false;
+
+clear_staged:
+	table->temp_staged = 0;
+	table->speed_staged = 0;
+	return ret;
+}
+
+static int xe_hwmon_sysfs_to_hw_val(struct xe_hwmon *hwmon, long val, bool is_temp, u8 *out)
+{
+	long max = is_temp ? U8_MAX * MILLIDEGREE_PER_DEGREE : U8_MAX;
+	long hw_val;
+
+	if (val < 0 || val > max) {
+		xe_dbg(hwmon->xe, "%s value %ld out of range\n", is_temp ? "temp" : "pwm", val);
+		return -EINVAL;
+	}
+
+	/* Temperature is in degrees Celsius, speed in percent. */
+	if (is_temp)
+		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
+	else
+		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
+
+	if (!is_temp && val && !hw_val)
+		hw_val = 1;
+
+	*out = hw_val;
+
+	return 0;
+}
+
+static ssize_t
+xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	struct xe_hwmon_fan_info *fi;
+	long val;
+	u8 point;
+	u8 temp;
+	int ret;
+	u8 fan;
+
+	ret = xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = xe_hwmon_sysfs_to_hw_val(hwmon, val, true, &temp);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	guard(mutex)(&hwmon->hwmon_lock);
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE || fi->is_full_speed) {
+		xe_dbg(hwmon->xe, "pwm%d_enable not in manual mode; cannot update temp point %d\n",
+		       fan + 1, point + 1);
+		return -EINVAL;
+	}
+
+	xe_dbg(hwmon->xe, "staging fan %d point %d temp to %u\n", fan, point, temp);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, true, temp);
+
+	return ret ? ret : count;
+}
+
+static ssize_t
+xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	enum fan_table_type active_table;
+	struct xe_hwmon_fan_info *fi;
+	u32 point_count;
+	u8 point;
+	u8 speed;
+	int ret;
+	u8 fan;
+
+	ret = xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[fan];
+	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
+
+	point_count = fi->fan_table[active_table].point_count;
+
+	if (point >= point_count)
+		speed = 0;
+	else
+		speed = fi->fan_table[active_table].fcp[point].speed;
+	return sysfs_emit(buf, "%u\n", DIV_ROUND_CLOSEST(speed * U8_MAX, 100));
+}
+
+static ssize_t
+xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	struct xe_hwmon_fan_info *fi;
+	long val;
+	u8 point;
+	u8 speed;
+	int ret;
+	u8 fan;
+
+	ret = xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = xe_hwmon_sysfs_to_hw_val(hwmon, val, false, &speed);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	guard(mutex)(&hwmon->hwmon_lock);
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE || fi->is_full_speed) {
+		xe_dbg(hwmon->xe,
+		       "pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
+		       fan + 1, point + 1);
+		return -EINVAL;
+	}
+
+	xe_dbg(hwmon->xe, "staging fan %d point %d speed to %u%%\n", fan, point, speed);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, false, speed);
+
+	return ret ? ret : count;
+}
+
+static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
+						 struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	u32 fan = index / XE_CURVE_ATTRS_PER_FAN;
+
+	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(hwmon, fan))
+		return 0;
+
+	/* All slots must exist at registration, before the user curve has been staged. */
+	return attr->mode;
+}
+
+static void xe_hwmon_init_curve_attrs(struct xe_hwmon *hwmon)
+{
+	int fan, kind, point, i = 0;
+
+	/* Per fan: all temp points then all pwm points; is_visible relies on this layout. */
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		for (kind = 0; kind < 2; kind++) {
+			bool is_temp = !kind;
+
+			for (point = 0; point < MAX_FAN_CONTROL_POINTS; point++, i++) {
+				struct sensor_device_attribute *sda = &hwmon->curve_sda[i];
+
+				snprintf(hwmon->curve_names[i], XE_CURVE_ATTR_NAME_LEN,
+					 "pwm%d_auto_point%d_%s", fan + 1, point + 1,
+					 is_temp ? "temp" : "pwm");
+				sysfs_attr_init(&sda->dev_attr.attr);
+				sda->dev_attr.attr.name = hwmon->curve_names[i];
+				sda->dev_attr.attr.mode = 0644;
+				if (is_temp) {
+					sda->dev_attr.show = xe_hwmon_pwm_auto_point_temp_show;
+					sda->dev_attr.store = xe_hwmon_pwm_auto_point_temp_store;
+				} else {
+					sda->dev_attr.show = xe_hwmon_pwm_auto_point_pwm_show;
+					sda->dev_attr.store = xe_hwmon_pwm_auto_point_pwm_store;
+				}
+				sda->index = XE_CURVE_IDX(fan, point);
+				hwmon->curve_attrs[i] = &sda->dev_attr.attr;
+			}
+		}
+	}
+
+	hwmon->curve_group.attrs = hwmon->curve_attrs;
+	hwmon->curve_group.is_visible = xe_hwmon_curve_attributes_visible;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	int err = 0;
@@ -2184,14 +2583,6 @@ static int xe_hwmon_get_pwm_from_pmt(struct xe_hwmon *hwmon, int channel, long *
 	return 0;
 }
 
-static enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
-{
-	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
-		return STOCK_FAN_TABLE;
-	else
-		return USER_FAN_TABLE;
-}
-
 static int
 xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
@@ -2301,6 +2692,8 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 					channel, ret);
 				break;
 			}
+			fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+			fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
 			ret = xe_hwmon_fan_set_auto(hwmon, channel);
 			if (ret) {
@@ -2312,6 +2705,8 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 			xe_dbg(hwmon->xe,
 			       "automatic control enabled for fan %d using stock table\n",
 			       channel);
+			fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+			fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 		} else {
 			ret = -EINVAL;
 		}
@@ -2561,10 +2956,16 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
+	hwmon->groups[0] = &hwmon_attrgroup;
+	if (xe->info.has_fan_control) {
+		xe_hwmon_init_curve_attrs(hwmon);
+		hwmon->groups[1] = &hwmon->curve_group;
+	}
+
 	/*  hwmon_dev points to device hwmon<i> */
 	hwmon->hwmon_dev = hwmon_device_register_with_info(dev, "xe", hwmon,
 							   &hwmon_chip_info,
-							   hwmon_groups);
+							   hwmon->groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
 		ret = PTR_ERR(hwmon->hwmon_dev);
 		xe_log_err(xe, HWMON, ret, "Failed to register xe hwmon\n");
-- 
2.34.1

