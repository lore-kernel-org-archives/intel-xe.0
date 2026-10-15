Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4B2CCA465
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70C112458;
	Thu, 15 Oct 2026 19:09:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED17112459
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091338; x=1823627338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IxwFS/E3pzg5KWC2VJSx+4qEKmGuwlhgeDETo/R2Rwc=;
 b=KoeAlCizigEfyjsBoZEFO2416nommBTemh90q4xneMb7tONmm5cWvR8i
 Q8mttQ4XDIuOH4Sl3l8C4xTLwGQNpNUIiqJy1E+aGp90yDORw2Daw9ygz
 E6tRfg1uDx7jsazji8iaXDhPDIoHg7wTrnPI0jGxdJZI63W3lYh36EE+D
 ed0SGvLoOLWhC1QHFQcUZQSYOtTbRNcsFtdmJBnOKiZbkrblRr6brQVth
 VGQ+YP8zA/pCggm63Td9+VOqNVzARYNb575VyHJo4kSj0awHYV06F0gDO
 W/UwuiwIGyOw9fHOSbarwBhSruz3WPSkmzgrpsCxGh2XpHDY20lHN5M8H g==;
X-CSE-ConnectionGUID: VqihoWHiTouCAo1tnnt1pQ==
X-CSE-MsgGUID: MynF9tyyQ0ezsLgr8dVXJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770377"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:57 -0700
X-CSE-ConnectionGUID: +eNGBn8LSYOSu88Ng0girQ==
X-CSE-MsgGUID: /VHq2hE+T+SXWy4JMfx/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835252"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 6/9] drm/xe/hwmon: Enable fan curve control support
Date: Fri, 16 Oct 2026 00:37:48 +0530
Message-Id: <20261015190751.1268916-7-karthik.poosa@intel.com>
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

Expose curve-point temperature and pwm controls via
pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
F is the fan number and P is the fan curve point number.
Each fan curve point has temperature and pwm sysfs.

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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c | 693 +++++++++++++++++++++++++++++++++-
 1 file changed, 692 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c3d5c682768d..de2adb56d15b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -193,6 +193,12 @@ struct xe_hwmon_fan_info {
 			/** @speed: fan speed in percentage */
 			u8 speed;
 		} fcp[MAX_FAN_CONTROL_POINTS];
+		/** @staged_fcp: curve supplied via sysfs but not yet committed */
+		struct fan_control_point staged_fcp[MAX_FAN_CONTROL_POINTS];
+		/** @temp_staged: bitmask of temperature fields supplied via sysfs */
+		u16 temp_staged;
+		/** @speed_staged: bitmask of PWM fields supplied via sysfs */
+		u16 speed_staged;
 	} fan_table[FAN_TABLE_MAX];
 	/** @max_rps: maximum fan RPS */
 	u32 max_rps;
@@ -899,8 +905,11 @@ static const struct attribute_group hwmon_attrgroup = {
 	.is_visible = xe_hwmon_attributes_visible,
 };
 
+static const struct attribute_group hwmon_curve_attrgroup;
+
 static const struct attribute_group *hwmon_groups[] = {
 	&hwmon_attrgroup,
+	&hwmon_curve_attrgroup,
 	NULL
 };
 
@@ -1200,6 +1209,74 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
 	return 0;
 }
 
+static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					  const struct fan_control_point *points, u32 point_count)
+{
+	/* The extra write is for the final write that sets the number of fan control points */
+	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
+	u32 accepted_count = 0;
+	int point;
+	int ret;
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
+		/* Ensure fan control points are strictly increasing order */
+		if (point > 0) {
+			u8 prev_temp = points[point - 1].temp;
+			u8 prev_speed = points[point - 1].speed;
+
+			if (temp < prev_temp || speed < prev_speed) {
+				xe_dbg(hwmon->xe,
+				       "fan %d invalid point prev > current %d: %u/%u prev=%u/%u\n",
+					fan, point, temp, speed, prev_temp, prev_speed);
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
+	xe_dbg(hwmon->xe, "committing fan %d user table with %d points\n", fan, point_count);
+
+	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+					      fan);
+	writes[point_count].data = point_count;
+
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, point_count + 1);
+	if (ret) {
+		xe_dbg(hwmon->xe,
+		       "failed to write fan %d user table count to %d, ret=%d\n", fan, point_count,
+		       ret);
+		return ret;
+	}
+
+	/* Verify if the user fan table was accepted correctly */
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &accepted_count, USER_FAN_TABLE);
+	if (ret)
+		return ret;
+
+	if (accepted_count != point_count) {
+		xe_err(hwmon->xe, "fan %d table count mismatch after commit, expected %u, got %u\n",
+		       fan, point_count, accepted_count);
+		return -EIO;
+	}
+
+	xe_dbg(hwmon->xe, "fan %d user table committed successfully with %d points\n", fan,
+	       point_count);
+	return 0;
+}
+
 static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 					    bool is_full_speed, enum fan_table_type table_source)
 {
@@ -1264,6 +1341,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	}
 
 	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
+	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
 	fi->is_full_speed = is_full_speed;
 
@@ -1328,12 +1407,622 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
 			  fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
 	}
 	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
+	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 
 	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
 	fi->is_full_speed = full_speed;
 	return 0;
 }
 
+#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
+#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
+#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
+
+static int
+xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
+{
+	u8 local_fan = XE_CURVE_FAN(index);
+	u8 local_point = XE_CURVE_POINT(index);
+
+	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
+		return -EINVAL;
+
+	*fan = local_fan;
+	*point = local_point;
+
+	return 0;
+}
+
+static inline enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
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
+	struct xe_hwmon_fan_info *fi;
+	u32 point_count;
+	u8 fan;
+	u8 point;
+	u8 temp;
+	int ret;
+	enum fan_table_type active_table;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[fan];
+	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
+
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
+	if (ret)
+		goto unlock;
+
+	/* Slots beyond the active curve can still be staged for the next curve. */
+	if (point >= point_count &&
+	    (active_table != USER_FAN_TABLE ||
+	    !(fi->fan_table[USER_FAN_TABLE].temp_staged & BIT(point))))
+		temp = 0;
+	else if (point >= point_count)
+		temp = fi->fan_table[USER_FAN_TABLE].staged_fcp[point].temp;
+	else
+		temp = fi->fan_table[active_table].fcp[point].temp;
+	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret;
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
+	if (point_count < MIN_FAN_CONTROL_POINTS)
+		return -EINVAL;
+
+	ret = xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, point_count);
+	if (ret)
+		return ret;
+
+	/* Publish the new curve only after firmware accepts its point count. */
+	memcpy(table->fcp, table->staged_fcp, point_count * sizeof(table->fcp[0]));
+	table->point_count = point_count;
+	table->temp_staged = 0;
+	table->speed_staged = 0;
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = false;
+	return 0;
+}
+
+static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
+{
+	long hw_val;
+
+	if (is_temp)
+		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
+	else
+		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
+
+	if (hw_val < 0 || hw_val > U8_MAX)
+		return -EINVAL;
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
+	u8 fan;
+	u8 point;
+	u8 temp;
+	long val;
+	int ret;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		drm_err(&hwmon->xe->drm,
+			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
+			fan, point);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	drm_dbg(&hwmon->xe->drm,
+		"staging fan %d point %d temp to %u\n", fan, point, temp);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, true, temp);
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
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
+	struct xe_hwmon_fan_info *fi;
+	u8 fan;
+	u8 point;
+	u32 point_count;
+	int ret;
+	enum fan_table_type active_table;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[fan];
+	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
+
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
+	if (ret)
+		goto unlock;
+
+	if (point >= point_count &&
+	    (active_table != USER_FAN_TABLE ||
+	    !(fi->fan_table[USER_FAN_TABLE].speed_staged & BIT(point))))
+		ret = sysfs_emit(buf, "0\n");
+	else
+		ret = sysfs_emit(buf, "%u\n",
+				 DIV_ROUND_CLOSEST((point >= point_count ?
+						    fi->fan_table[USER_FAN_TABLE].staged_fcp[point].speed :
+						    fi->fan_table[active_table].fcp[point].speed) * U8_MAX,
+						    100));
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret;
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
+	u8 fan;
+	u8 pwm;
+	int ret;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	ret = kstrtol(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		drm_err(&hwmon->xe->drm,
+			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
+			fan, point);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	/* Preserve zero for the (0, 0) end marker instead of clamping it. */
+	if (pwm)
+		pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
+
+	drm_dbg(&hwmon->xe->drm, "staging fan %d point %d pwm to %u\n",
+		fan, point, pwm);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, false, pwm);
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret ? ret : count;
+}
+
+static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 0));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 0));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 1));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 1));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 2));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 2));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 3));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 3));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 4));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 4));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 5));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 5));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 6));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 6));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 7));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 7));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 8));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 8));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(0, 9));
+static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(0, 9));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 0));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 0));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 1));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 1));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 2));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 2));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 3));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 3));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 4));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 4));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 5));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 5));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 6));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 6));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 7));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 7));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 8));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 8));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(1, 9));
+static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(1, 9));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 0));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 0));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 1));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 1));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 2));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 2));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 3));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 3));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 4));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 4));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 5));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 5));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 6));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 6));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 7));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 7));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 8));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 8));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
+			  xe_hwmon_pwm_auto_point_temp_show,
+			  xe_hwmon_pwm_auto_point_temp_store,
+			  XE_CURVE_IDX(2, 9));
+static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
+			  xe_hwmon_pwm_auto_point_pwm_show,
+			  xe_hwmon_pwm_auto_point_pwm_store,
+			  XE_CURVE_IDX(2, 9));
+
+static struct attribute *hwmon_curve_attributes[] = {
+	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
+	NULL
+};
+
+static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
+						 struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
+	u32 fan = index / attrs_per_fan;
+
+	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(fan))
+		return 0;
+
+	/* All slots must exist at registration, before the user curve has been staged. */
+	return attr->mode;
+}
+
+static const struct attribute_group hwmon_curve_attrgroup = {
+	.attrs = hwmon_curve_attributes,
+	.is_visible = xe_hwmon_curve_attributes_visible,
+};
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -2051,7 +2740,7 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
 		break;
 	case hwmon_pwm_enable:
-		*val = fi->pwm_enable_mode;
+		*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -2127,6 +2816,8 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 			       channel);
 			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
 			fi->is_full_speed = false;
+			fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
+			fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
 		} else {
 			ret = -EINVAL;
 		}
-- 
2.25.1

