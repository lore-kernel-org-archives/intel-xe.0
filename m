Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F09CD8C89
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF7D10EADE;
	Sun,  7 Jun 2026 17:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA46mWVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE74110EADE
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852807; x=1812388807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsplZNzTTtqBgFvK/EQRM8gACGe1hvjfnrhW4BYgle4=;
 b=hA46mWVSFzRoWLUGIuKAIhlO0NozGz4CeLG2n60/IrvH7o4eWSsqIbg9
 QEAQt5Bc0PjrEyobiKNEVIBPEXX+cR1vCQ+F3TdY3mRMbceLgq6vPemPW
 xjmO04q7CIlKPQ7uiSf7zU5KCU7geh+pWqvJOfv2RU/UH3SkXW2/rK2xt
 aroesCFzDm7/QtvS21NhJOdmu+TZqKnuv8BNAmqjqDAN9mm2kWH1yfw3t
 7Pj9U/PypLt8RoqMy72LCDg4P5w3J+6bbWfWKQkT0UhBfYNAZVBEoFc4/
 P2DNNCIsxgZSBtTSwUwoeoA//E/bE0h8BbEoLvl0Jnx3DPfj5C+/kVUjj g==;
X-CSE-ConnectionGUID: edzVgC++QvusTC+aIW+JrQ==
X-CSE-MsgGUID: /aSJ0M6yQiKM15PoRN7gsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737552"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737552"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:20:07 -0700
X-CSE-ConnectionGUID: Qmkr5R0ETceHJkyzLlLo5g==
X-CSE-MsgGUID: l5tvmmEGRai8rbM31mM6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521644"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:20:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 5/5] drm/xe/hwmon: Enable fan curve control support
Date: Sun,  7 Jun 2026 22:58:48 +0530
Message-Id: <20260607172848.2970580-6-karthik.poosa@intel.com>
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

Expose curve-point temperature and pwm controls via
pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
F is the fan number and P is the fan curve point number.
Each fan curve point has temperature and pwm sysfs.

Curve point writes are accepted only when pwm[1-3]_enable is set to 1
(manual user-table mode)

User writes update a cached user table. The table is programmed to
hardware when the last curve point is written (after both last-point
temp and pwm updates are observed).

Update Xe hwmon ABI documentation for pwm auto point temperature
attributes.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 692 ++++++++++++++++++
 2 files changed, 708 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index a8cf93908558..2619e0078067 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -334,3 +334,19 @@ Description:   RW. Fan control mode selector.
                user table control and value 2 to use firmware-controlled behavior.
 
                Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
+Date:          June 2026
+KernelVersion: 7.1
+Contact:       intel-xe@lists.freedesktop.org
+Description:   RW. Temperature in millidegree Celsius for each fan curve point.
+
+               Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
+Date:          June 2026
+KernelVersion: 7.1
+Contact:       intel-xe@lists.freedesktop.org
+Description:   RW. PWM duty value (0..255) for each fan curve point.
+
+               Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2aa66918b549..352243442255 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -777,8 +777,11 @@ static const struct attribute_group hwmon_attrgroup = {
 	.is_visible = xe_hwmon_attributes_visible,
 };
 
+static const struct attribute_group hwmon_curve_attrgroup;
+
 static const struct attribute_group *hwmon_groups[] = {
 	&hwmon_attrgroup,
+	&hwmon_curve_attrgroup,
 	NULL
 };
 
@@ -959,6 +962,60 @@ static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
 	return ret;
 }
 
+static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+	int point;
+	int ret;
+
+	if (!point_count)
+		return -ENODATA;
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
+		u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
+
+		/* Ensure fan control points are strictly increasing order */
+		if (point > 0) {
+			u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].temp;
+			u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].speed;
+
+			if (temp < prev_temp || speed < prev_speed) {
+				drm_dbg(&hwmon->xe->drm,
+					"fan %d invalid user point previous value > current %d: %u/%u prev=%u/%u\n",
+					fan, point, temp, speed, prev_temp, prev_speed);
+				return -EINVAL;
+			}
+		}
+
+		drm_dbg(&hwmon->xe->drm,
+			"committing fan %d user point %d temp %u, speed %u %%\n",
+			fan, point, temp, speed);
+		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
+		if (ret)
+			return ret;
+	}
+
+	drm_dbg(&hwmon->xe->drm,
+		"committing fan %d user table with %d points\n", fan, point_count);
+	ret = xe_pcode_write(root_tile,
+			     PCODE_MBOX(FAN_SPEED_CONTROL,
+					FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
+				point_count);
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
 static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 					    bool is_full_speed)
 {
@@ -1060,6 +1117,641 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	return 0;
 }
 
+static int xe_hwmon_get_user_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	int ret;
+
+	if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
+		ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false);
+		if (ret)
+			return ret;
+	}
+
+	*point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+
+	if (*point_count > MAX_FAN_CONTROL_POINTS) {
+		*point_count = MAX_FAN_CONTROL_POINTS;
+		drm_dbg(&hwmon->xe->drm,
+			"invalid fan %d user point count %d read from hw, setting to %d\n",
+			fan, *point_count, MAX_FAN_CONTROL_POINTS);
+	}
+	return *point_count ? 0 : -ENODATA;
+}
+
+#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
+#define XE_CURVE_FAN(idx)			((u8)(((idx) >> 8) & 0xff))
+#define XE_CURVE_POINT(idx)			((u8)((idx) & 0xff))
+
+static int xe_hwmon_decode_curve_index(int index, u8 *fan, u8 *point)
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
+static ssize_t
+xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+
+	struct xe_hwmon_fan_info *fi;
+	u8 fan;
+	u8 point;
+	u32 point_count;
+	u8 temp;
+	int ret;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	fi = &hwmon->fi[fan];
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	ret = xe_hwmon_get_user_fan_point_count(hwmon, fan, &point_count);
+	if (ret)
+		goto unlock;
+
+	if (point >= point_count) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
+	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return ret;
+}
+
+static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
+					  u32 point_count, u8 temp, u8 pwm)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	int ret;
+
+	if (temp) {
+		fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
+		if (point == (point_count - 1))
+			fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
+	} else {
+		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
+		if (point == (point_count - 1))
+			fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
+	}
+
+	/* Cache intermediate points and commit once the last point arrives. */
+	if (point == (point_count - 1) &&
+	    fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
+	    fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
+		ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
+		if (ret)
+			return ret;
+		fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
+		fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
+	}
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
+	u32 point_count;
+	u8 temp;
+	long val;
+	int ret;
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		drm_err(&hwmon->xe->drm,
+			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
+			fan, point);
+		return -EINVAL;
+	}
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
+
+	ret = xe_hwmon_get_user_fan_point_count(hwmon, fan, &point_count);
+	if (ret)
+		goto unlock;
+
+	if (point >= point_count) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	drm_dbg(&hwmon->xe->drm,
+		"updating fan %d point %d temp to %u, pwm %u\n", fan, point,
+		temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, temp, 0);
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
+
+	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
+	if (ret)
+		return ret;
+
+	fi = &hwmon->fi[fan];
+
+	guard(xe_pm_runtime)(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	ret = xe_hwmon_get_user_fan_point_count(hwmon, fan, &point_count);
+	if (ret)
+		goto unlock;
+
+	if (point >= point_count) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	ret = sysfs_emit(buf, "%u\n",
+			 DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[point].speed * U8_MAX,
+					   100));
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
+	u32 point_count;
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
+	fi = &hwmon->fi[fan];
+
+	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		drm_err(&hwmon->xe->drm,
+			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
+			fan, point);
+		return -EINVAL;
+	}
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
+
+	ret = xe_hwmon_get_user_fan_point_count(hwmon, fan, &point_count);
+	if (ret)
+		goto unlock;
+
+	if (point >= point_count) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	pwm = max_t(u8, pwm, fi->min_pwm);
+
+	drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
+		fan, point, pwm);
+	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, 0, pwm);
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
+
+	/* Temp/PWM pairs for each point. */
+	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
+	u32 fan = index / attrs_per_fan;
+	u32 local = index % attrs_per_fan;
+	u32 point_count;
+
+	if (!hwmon->xe->info.has_fan_control)
+		return 0;
+
+	if (fan >= hwmon->num_fans)
+		return 0;
+
+	point_count = max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
+			  hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
+
+	if (!point_count)
+		return 0;
+
+	if (local < MAX_FAN_CONTROL_POINTS)
+		return (local + 1) <= point_count ? attr->mode : 0;
+
+	if (local < (2 * MAX_FAN_CONTROL_POINTS))
+		return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
+			attr->mode : 0;
+
+	return 0;
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
-- 
2.25.1

