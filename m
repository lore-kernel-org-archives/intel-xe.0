Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF5606A31F
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDbOSemL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0710E3E4;
	Sat, 28 Nov 2026 05:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6EA10E28D
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845491; x=1827381491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YT0kPzhM2xeA9an+5rqGj20FbTRnovrszK1+d2NCb6g=;
 b=IDbOSemL4QF56gK1eL7hsQr8LW69buqsIwEJJCigfthSqD9lU0vvqssE
 VLQ1P4neeTA2EgR331G5i8QS2tyZM8rUtfvjJfcjyUqgltf1Ntp0zS+Tv
 43ckatLMmAPrVZ04B4MvXxbr+lcCK0Kz3Na9f5zr+vh7Qv+fzYASEGUCO
 k7SRcaUYqmDulRjsRUk/PidQQBhopJ+nAH7s4IyglO3C0Hu7vCCGhsNqo
 3zZzbRsfpWMutmcSjRmwb2ufzfJaS/9VgRKBp34/ZyYlbC2PeoqQa0k9T
 LDSJTSSS717xnK00r6Esj5yhgc9CqFdd5lHuO0I4b5p6E1U/zZD+XUf2T Q==;
X-CSE-ConnectionGUID: s2QgdV5uT/OyPk++aTcGJg==
X-CSE-MsgGUID: tGkKvBZTSterA8H+iS3RaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754898"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:11 -0800
X-CSE-ConnectionGUID: aj2VISdmT1mRunlqfcJ7iQ==
X-CSE-MsgGUID: gBDSU135Sb+2SUkecIUEfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304308"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:08 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 05/10] drm/xe/hwmon: Expose pwm[1-3]_enable
Date: Sat, 28 Nov 2026 11:29:18 +0530
Message-Id: <20261128055923.3316956-6-karthik.poosa@intel.com>
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

v4:
 - Rebase on reworked pwm[1-3] patch.
 - Clamp min PWM to 100% when activating the user table, since fan
   table speed is in percent.
 - Drop redundant channel range check in pwm write.
 - Use tab indentation and update Date and KernelVersion to November
   2026 and 7.5 in the pwm[1-3]_enable ABI entry.

v5:
 - Address review comments from sashiko.
 - Avoid returning pwm[1-3]_enable as XE_FAN_PWM_MANUAL_USER_TABLE, when
   setting to full speed mode. (sashiko)
 - Set default pwm[1-3]_enable to XE_FAN_PWM_AUTO_STOCK_TABLE after
   probe. (sashiko)
 - Make pwm[1-3]_enable visible only if stock fan table has valid point
   count.
 - Add flag XE_FAN_PWM_UNINITIALIZED.
 - Verify user point counts after table activation and auto-mode writes.
 - Fall back to the stock table if firmware does not accept a table.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  15 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 201 +++++++++++++++++-
 2 files changed, 207 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 24e9eb595746..be1c325fcc9b 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -354,4 +354,19 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RW. Target fan PWM duty value in the range 0..255, where 255
 		is 100% fan speed.
 
+		Writing requires the corresponding pwm[1-3]_enable to be set to
+		1 (manual user-table mode) first; otherwise the write is
+		rejected with -EINVAL.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Fan control mode selector.
+
+		Use value 0 to run fans at full speed. Use value 1 to enable
+		user table control and value 2 to use firmware default behavior.
+
 		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1e375613fe18..f62a60e99140 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -139,6 +139,20 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+/**
+ * enum xe_fan_pwm_enable_mode - fan PWM enable modes
+ */
+enum xe_fan_pwm_enable_mode {
+	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
+	XE_FAN_PWM_FULL_SPEED = 0,
+	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
+	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
+	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
+	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
+	/** @XE_FAN_PWM_UNINITIALIZED: fan control mode is not established */
+	XE_FAN_PWM_UNINITIALIZED = 0xff,
+};
+
 /**
  * enum fan_table_type - fan table types tracked per fan
  */
@@ -190,6 +204,10 @@ struct xe_hwmon_fan_info {
 	} fan_table[FAN_TABLE_MAX];
 	/** @max_rps: maximum fan RPS */
 	u32 max_rps;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -926,7 +944,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1176,6 +1196,7 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
 {
 	int ret;
 
+	*point_count = 0;
 	ret = xe_hwmon_pcode_read_fan_control(hwmon,
 					      (table_type == USER_FAN_TABLE) ?
 					      FSC_READ_USER_FAN_CONTROL_POINTS :
@@ -1211,9 +1232,88 @@ static int xe_hwmon_fan_set_auto(struct xe_hwmon *hwmon, u8 fan)
 			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
 			     0);
 	if (ret)
-		return ret;
+		goto fail;
 
 	fi->fan_table[USER_FAN_TABLE].point_count = 0;
+	fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+	fi->is_full_speed = false;
+	return 0;
+
+fail:
+	fi->pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED;
+	fi->is_full_speed = false;
+	return ret;
+}
+
+static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					    bool is_full_speed, enum fan_table_type table_source)
+{
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
+	u32 expected_count, point_count;
+	int ret, write_ret, verify_ret;
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
+	expected_count = point_count;
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = source_table->fcp[point].temp;
+		u8 speed = is_full_speed ? 100 : min_t(u8, source_table->fcp[point].speed, 100);
+
+		writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
+		writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
+					FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
+	}
+
+	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+					      fan);
+	writes[point_count].data = point_count;
+	write_ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes,
+					 point_count + 1);
+	if (write_ret)
+		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, write_ret);
+
+	verify_ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+	if (write_ret || verify_ret || point_count != expected_count) {
+		int failure_ret = write_ret ?: verify_ret ?: -EIO;
+
+		fi->fan_table[USER_FAN_TABLE].point_count = 0;
+		if (verify_ret || point_count != expected_count)
+			xe_err(hwmon->xe,
+			       "fan %d user table count misatch: ret=%d, expected=%u, got=%u\n",
+			       fan, verify_ret, expected_count, point_count);
+		ret = xe_hwmon_fan_set_auto(hwmon, fan);
+		if (ret)
+			xe_err(hwmon->xe, "failed to restore fan %d to stock mode, ret=%d\n", fan,
+			       ret);
+		return failure_ret;
+	}
+
+	if (table_source == STOCK_FAN_TABLE) {
+		for (point = 0; point < point_count; point++) {
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
+				source_table->fcp[point].temp;
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
+				is_full_speed ? 100 : min_t(u8, source_table->fcp[point].speed,
+							    100);
+		}
+	}
+
+	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
+	fi->pwm_enable_mode = is_full_speed ? XE_FAN_PWM_FULL_SPEED :
+					    XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = is_full_speed;
 
 	return 0;
 }
@@ -1221,7 +1321,7 @@ static int xe_hwmon_fan_set_auto(struct xe_hwmon *hwmon, u8 fan)
 /* Temperature to set when setting the fan PWM with pwm[1-3]. */
 #define FIXED_PWM_TEMP	1
 
-static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, bool full_speed)
 {
 	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
 	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
@@ -1229,6 +1329,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	u32 point_count = 0;
 	u8 speed;
 
+	if (!full_speed && fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n", fan);
+		return -EINVAL;
+	}
+
 	/* Fan table speed are in percent. */
 	speed = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
 	speed = min_t(u32, speed, 100);
@@ -1280,6 +1385,9 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	}
 	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
 
+	fi->pwm_enable_mode = full_speed ? XE_FAN_PWM_FULL_SPEED :
+					 XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = full_speed;
 	return 0;
 }
 
@@ -1299,6 +1407,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		if (!IS_FAN_ENABLED(hwmon, fan))
 			continue;
 
+		fi->pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED;
+		fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
+
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
 						      &fi->max_rps);
 		if (ret) {
@@ -1352,6 +1463,8 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		memcpy(fi->fan_table[STOCK_FAN_TABLE].fcp, stock_fcp,
 		       stock_fcp_count * sizeof(stock_fcp[0]));
 		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
+		if (fi->pwm_enable_mode == XE_FAN_PWM_UNINITIALIZED)
+			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
 	}
 	return err;
 }
@@ -1913,6 +2026,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -2018,7 +2132,7 @@ static int xe_hwmon_get_stock_table_pwm(struct xe_hwmon *hwmon, int channel, lon
 	}
 
 	*val = pwm;
-	xe_dbg(hwmon->xe, "fan %d stock table active PWM value: %ld\n", channel, pwm);
+	xe_dbg(hwmon->xe, "fan %d: active pwm value from stock table cache: %ld\n", channel, pwm);
 	return 0;
 }
 
@@ -2064,12 +2178,20 @@ static int xe_hwmon_get_pwm_from_pmt(struct xe_hwmon *hwmon, int channel, long *
 		return -EOPNOTSUPP;
 	}
 
-	xe_dbg(hwmon->xe, "fan %d PMT active PWM value: %u\n", channel, pwm);
+	xe_dbg(hwmon->xe, "fan %d: active pwm from PMT: %u\n", channel, pwm);
 
 	*val = pwm;
 	return 0;
 }
 
+static enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
+{
+	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
+		return STOCK_FAN_TABLE;
+	else
+		return USER_FAN_TABLE;
+}
+
 static int
 xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
@@ -2084,8 +2206,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	switch (attr) {
 	case hwmon_pwm_input:
 		/* If the user fan table is not populated, get active stock pwm */
-		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
-			xe_dbg(hwmon->xe, "user fan table not active for fan %d\n", channel);
+		if (xe_hwmon_get_active_fan_table(hwmon, channel) == STOCK_FAN_TABLE) {
+			xe_dbg(hwmon->xe, "getting active pwm for fan %d from stock table\n",
+			       channel);
 			switch (hwmon->xe->info.platform) {
 			case XE_BATTLEMAGE:
 				ret = xe_hwmon_get_pwm_from_pmt(hwmon, channel, &pwm);
@@ -2094,13 +2217,18 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 				ret = xe_hwmon_get_stock_table_pwm(hwmon, channel, &pwm);
 				break;
 			}
-			if (ret)
+			if (ret) {
+				xe_err(hwmon->xe, "failed to get active pwm for fan %d, ret=%d\n",
+				       channel, ret);
 				goto unlock;
+			}
 		} else {
 			/*
 			 * pwmN writes set every user-table point to the same speed,
 			 * so the first point gives the cached manual PWM percentage.
 			 */
+			xe_dbg(hwmon->xe, "getting active pwm for fan %d from user table cache\n",
+			       channel);
 			pwm = fi->fan_table[USER_FAN_TABLE].fcp[0].speed;
 		}
 		if (pwm < 0 || pwm > 100) {
@@ -2112,6 +2240,13 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		*val = DIV_ROUND_CLOSEST(pwm * U8_MAX, 100);
 		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
 		break;
+	case hwmon_pwm_enable:
+		if (fi->pwm_enable_mode == XE_FAN_PWM_UNINITIALIZED) {
+			ret = -ENODATA;
+			break;
+		}
+		*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -2125,8 +2260,11 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static int
 xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
+	struct xe_hwmon_fan_info *fi;
 	int ret = 0;
 
+	fi = &hwmon->fi[channel];
+
 	mutex_lock(&hwmon->hwmon_lock);
 
 	switch (attr) {
@@ -2135,7 +2273,48 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
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
+			ret = xe_hwmon_fan_set_auto(hwmon, channel);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to switch fan %d to automatic stock control, ret=%d\n",
+					channel, ret);
+				break;
+			}
+			xe_dbg(hwmon->xe,
+			       "automatic control enabled for fan %d using stock table\n",
+			       channel);
+		} else {
+			ret = -EINVAL;
+		}
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -2350,6 +2529,7 @@ int xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 	struct xe_hwmon *hwmon;
+	int fan;
 	int ret;
 
 	/* hwmon is available only for dGfx */
@@ -2364,6 +2544,9 @@ int xe_hwmon_register(struct xe_device *xe)
 	if (!hwmon)
 		return -ENOMEM;
 
+	for (fan = 0; fan < FAN_MAX; fan++)
+		hwmon->fi[fan].pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED;
+
 	ret = devm_mutex_init(dev, &hwmon->hwmon_lock);
 	if (ret)
 		return ret;
-- 
2.34.1

