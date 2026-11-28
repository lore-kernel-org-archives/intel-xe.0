Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9B606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BabiL2bg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F47010E28D;
	Sat, 28 Nov 2026 05:58:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E55A10E26F
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845488; x=1827381488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeUUs7pr66WbOtbCp/Pumx+wBd3djdQTFpFIKmisTtY=;
 b=BabiL2bgORq/u8M7+EUXMudO4xT/qtnPQnP42latBcXHEjEB8oPdo9AM
 8qvp6RmGSQhs+b30ueWgT1TAzRoqC/24/sU7Y8ghIzyE5X/0BdndOKu1p
 TFgN2WgXlBJI+8xnPNm4Oi0EyybE9vwItePjzp9U7TzvgrTadHhAt65L5
 uoWP7jTyLXUHi8OdpqQ9ig8n+l3eiRvkbmQqrNfESyb49gpRS3J2O+MR9
 sck8ITktrktPO1P40hm5JUxEYRp714cQN/guPDzQOC4KxdfDXCsq+8KXY
 Ep20jDamCnwOdeXct7b0rcJEGZ+tcSXDueDECAb9uUpgoc4rQNTClyanf g==;
X-CSE-ConnectionGUID: ctH7jkVlTJCUbm0IvKE1IA==
X-CSE-MsgGUID: IymPL4q8TWCziRlTQx/r9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754896"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:07 -0800
X-CSE-ConnectionGUID: XE/hngSQTcOjTjx4eYklxA==
X-CSE-MsgGUID: nnoSCcpISlacrTuii+eN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304295"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:04 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 04/10] drm/xe/hwmon: Expose pwm[1-3]
Date: Sat, 28 Nov 2026 11:29:17 +0530
Message-Id: <20261128055923.3316956-5-karthik.poosa@intel.com>
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

Expose pwm[1-3] hwmon attributes for each available fan. Userspace can
read PWM values in the range 0..255 and set a manual fan speed
independently of the fan curve. Switching back to the stock curve is
added by a later patch.

Read active PWM from PMT on BMG. On other platforms, derive PWM from the
stock curve when no user table is active.

After writing the user table, read back its point count to verify
firmware accepted it. If verification fails, restore stock fan control.

Document pwm[1-3] in the Xe hwmon ABI.

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

v5:
 - Expose pwm[1-3] node only if stock table is valid.
 - Read current pwm from PMT for BMG and from stock table for other
   platforms when user table is not active.
 - Read back the user point count after every PWM table write and fall
   back to stock table when the count is not accepted.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 312 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 4 files changed, 329 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 9aa1cfac4f87..24e9eb595746 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -346,3 +346,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Target fan PWM duty value in the range 0..255, where 255
+		is 100% fan speed.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index fb5b5a8648ba..4fec057b2dd6 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -15,6 +15,11 @@
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
 
+#define BMG_FAN_PWM_PMT_OFFSET		(0x58)
+#define BMG_FAN1_PWM			REG_GENMASK64(15, 0)
+#define BMG_FAN2_PWM			REG_GENMASK64(31, 16)
+#define BMG_FAN3_PWM			REG_GENMASK64(47, 32)
+
 #define PUNIT_VERSION_OFFSET		0xA0
 
 #define XE_PMT_BASE_OFFSET		0xE0000
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5b7f3d67a70e..1e375613fe18 100644
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
@@ -923,6 +926,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -1167,6 +1171,118 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
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
+/*
+ * Set the fan to automatic mode by clearing the user fan table.
+ * This will make the firmware run the stock fan table.
+ */
+static int xe_hwmon_fan_set_auto(struct xe_hwmon *hwmon, u8 fan)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	int ret;
+
+	ret = xe_pcode_write(xe_device_get_root_tile(hwmon->xe),
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
+			     0);
+	if (ret)
+		return ret;
+
+	fi->fan_table[USER_FAN_TABLE].point_count = 0;
+
+	return 0;
+}
+
+/* Temperature to set when setting the fan PWM with pwm[1-3]. */
+#define FIXED_PWM_TEMP	1
+
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	int ret, write_ret, verify_ret, i;
+	u32 point_count = 0;
+	u8 speed;
+
+	/* Fan table speed are in percent. */
+	speed = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
+	speed = min_t(u32, speed, 100);
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
+	write_ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes,
+					 ARRAY_SIZE(writes));
+	if (write_ret)
+		xe_err(hwmon->xe, "failed to write pwm %u (%u%%) for fan %d, ret=%d\n",
+		       pwm, speed, fan, write_ret);
+	else
+		xe_dbg(hwmon->xe, "applied pwm %u (%u%%) for fan %d\n", pwm, speed, fan);
+
+	verify_ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (write_ret || verify_ret || point_count != MIN_FAN_CONTROL_POINTS) {
+		int failure_ret = write_ret ?: verify_ret ?: -EIO;
+
+		/* Firmware may have accepted only part of the user table. */
+		fi->fan_table[USER_FAN_TABLE].point_count = 0;
+		if (verify_ret || point_count != MIN_FAN_CONTROL_POINTS)
+			xe_err(hwmon->xe,
+			       "fan %d PWM table count verification failed: ret=%d, count=%u\n",
+			       fan, verify_ret, point_count);
+		ret = xe_hwmon_fan_set_auto(hwmon, fan);
+		if (ret)
+			xe_err(hwmon->xe, "failed to restore fan %d to auto mode  ret=%d\n",
+			       fan, ret);
+		return failure_ret;
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
 	int err = 0;
@@ -1788,6 +1904,21 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(hwmon, channel) ||
+	    !hwmon->fi[channel].fan_table[STOCK_FAN_TABLE].point_count)
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
@@ -1841,6 +1972,180 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+/**
+ * xe_hwmon_get_stock_table_pwm - Calculate PWM from the stock fan curve
+ * @hwmon: hwmon instance, with hwmon_lock held and runtime PM active
+ * @channel: fan channel
+ * @val: calculated PWM percentage
+ *
+ * Read package temperature and linearly interpolate the stock table. Temperatures
+ * outside the table range use the speed at the nearest endpoint.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int xe_hwmon_get_stock_table_pwm(struct xe_hwmon *hwmon, int channel, long *val)
+{
+	const struct fan_table *table = &hwmon->fi[channel].fan_table[STOCK_FAN_TABLE];
+	long temperature, pwm;
+	int point, ret;
+
+	lockdep_assert_held(&hwmon->hwmon_lock);
+
+	if (!table->point_count)
+		return -ENODATA;
+
+	ret = xe_hwmon_temp_read(hwmon, hwmon_temp_input, CHANNEL_PKG, &temperature);
+	if (ret)
+		return ret;
+
+	pwm = table->fcp[0].speed;
+	for (point = 1; point < table->point_count; point++) {
+		const struct fan_control_point *lower = &table->fcp[point - 1];
+		const struct fan_control_point *upper = &table->fcp[point];
+		long lower_temp = lower->temp * MILLIDEGREE_PER_DEGREE;
+		long upper_temp = upper->temp * MILLIDEGREE_PER_DEGREE;
+		long pwm_delta = upper->speed - lower->speed;
+
+		/* Find the bracketing points; temperatures outside the curve use endpoints. */
+		if (temperature <= lower_temp)
+			break;
+		if (temperature < upper_temp) {
+			pwm += DIV_ROUND_CLOSEST(pwm_delta * (temperature - lower_temp),
+						upper_temp - lower_temp);
+			break;
+		}
+		pwm = upper->speed;
+	}
+
+	*val = pwm;
+	xe_dbg(hwmon->xe, "fan %d stock table active PWM value: %ld\n", channel, pwm);
+	return 0;
+}
+
+/**
+ * xe_hwmon_get_pwm_from_pmt - Read active fan PWM from PMT telemetry
+ * @hwmon: hwmon instance, with hwmon_lock held and runtime PM active
+ * @channel: fan channel
+ * @val: raw PWM percentage returned by PMT
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int xe_hwmon_get_pwm_from_pmt(struct xe_hwmon *hwmon, int channel, long *val)
+{
+	u64 pmt_val;
+	u32 guid, pwm;
+	int ret;
+
+	lockdep_assert_held(&hwmon->hwmon_lock);
+
+	if (hwmon->xe->info.platform != XE_BATTLEMAGE)
+		return -EOPNOTSUPP;
+
+	ret = xe_vsec_get_guid(hwmon->xe, &guid);
+	if (ret)
+		return ret;
+
+	ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid, &pmt_val,
+				BMG_FAN_PWM_PMT_OFFSET, sizeof(pmt_val));
+	if (ret != sizeof(pmt_val))
+		return ret < 0 ? ret : -EIO;
+
+	switch (channel) {
+	case FAN_1:
+		pwm = REG_FIELD_GET64(BMG_FAN1_PWM, pmt_val);
+		break;
+	case FAN_2:
+		pwm = REG_FIELD_GET64(BMG_FAN2_PWM, pmt_val);
+		break;
+	case FAN_3:
+		pwm = REG_FIELD_GET64(BMG_FAN3_PWM, pmt_val);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	xe_dbg(hwmon->xe, "fan %d PMT active PWM value: %u\n", channel, pwm);
+
+	*val = pwm;
+	return 0;
+}
+
+static int
+xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_hwmon_fan_info *fi;
+	long pwm;
+	int ret = 0;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	fi = &hwmon->fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		/* If the user fan table is not populated, get active stock pwm */
+		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
+			xe_dbg(hwmon->xe, "user fan table not active for fan %d\n", channel);
+			switch (hwmon->xe->info.platform) {
+			case XE_BATTLEMAGE:
+				ret = xe_hwmon_get_pwm_from_pmt(hwmon, channel, &pwm);
+				break;
+			default:
+				ret = xe_hwmon_get_stock_table_pwm(hwmon, channel, &pwm);
+				break;
+			}
+			if (ret)
+				goto unlock;
+		} else {
+			/*
+			 * pwmN writes set every user-table point to the same speed,
+			 * so the first point gives the cached manual PWM percentage.
+			 */
+			pwm = fi->fan_table[USER_FAN_TABLE].fcp[0].speed;
+		}
+		if (pwm < 0 || pwm > 100) {
+			xe_err(hwmon->xe, "invalid PWM value %ld read for fan %d\n", pwm, channel);
+			ret = -ERANGE;
+			goto unlock;
+		}
+		/* Speed is cached in percent, so the 0..255 round trip may be off by a step. */
+		*val = DIV_ROUND_CLOSEST(pwm * U8_MAX, 100);
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
@@ -1867,6 +2172,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1896,6 +2204,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1914,6 +2224,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 2308e5464082..bf321ed19251 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -86,9 +86,12 @@
 #define     MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY 0x1
 
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

