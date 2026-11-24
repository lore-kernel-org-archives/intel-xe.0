Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80703606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3843jhq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD410E51F;
	Tue, 24 Nov 2026 05:46:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C7010E3C2
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499201; x=1827035201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=agUoThJwQtZfr+eaY6EgaPcKP6dHZAQtZi5MNJmwjBI=;
 b=N3843jhqDrZtEKQpCRKy6z4ofajsoR7glJdRB2Ernyxz03rB6zcN4lDa
 mUFqM9wNZAmGldZO8chKXMWn8HzHjD5dVmjSKshtGaKevJrUFCj05f285
 +ZyWvH0z9WnZmw+YF1D1vNoZHycXvBEy/Fzx8d68vrPaD4QpqL90OYf9C
 lxVQ/To0NM1k7MrC4XIZa88SWntBQ3IzVj9jceQGTAnfBFMpmEpg77L5a
 bFczaM3Fhx+v4vnX3uSio4SwnaNiSy2nHVVkWjZqqcyHyq1zszotXywB+
 IFW561SvWqQNkEiGZC0WvxuJo6cgrqCRCuCUkFqJoFmLUpndVzgxI0/Eq w==;
X-CSE-ConnectionGUID: 1akBGI4TRe2IxNYa65J/Wg==
X-CSE-MsgGUID: i2fuPbBsTjaymvPKtpNlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222645"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:41 -0800
X-CSE-ConnectionGUID: MdOkV5Y6SuWFtKXSbg6wag==
X-CSE-MsgGUID: jUb1/dLAThKi7c/hECP3hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354607"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:38 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 05/10] drm/xe/hwmon: Expose pwm[1-3]_enable
Date: Tue, 24 Nov 2026 11:18:06 +0530
Message-Id: <20261124054811.798763-6-karthik.poosa@intel.com>
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

Expose pwm[1-3]_enable to control the fan operating mode through
the hwmon interface.

Mode 0 forces the fan to run at full speed.
Mode 1 enables user fan-table control.
Mode 2 restores firmware-controlled fan management.

Document pwm[1-3]_enable in the Xe hwmon ABI.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

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

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  15 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 158 +++++++++++++++++-
 2 files changed, 170 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 31348d65c89d..b9e7003d7d80 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -330,4 +330,19 @@ Description:	RW. Target fan PWM duty value in the range 0..255, where 255
 		is 100% fan speed. Values below the fan's minimum PWM are
 		raised to that minimum.
 
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
index e892a6517334..b7e13e5d13ff 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -139,6 +139,18 @@ struct xe_hwmon_energy_info {
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
+};
+
 /**
  * enum fan_table_type - fan table types tracked per fan
  */
@@ -192,6 +204,10 @@ struct xe_hwmon_fan_info {
 	u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -920,7 +936,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1190,10 +1208,80 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
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
+					    min_t(u32, fi->min_pwm, 100));
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
+							    min_t(u32, fi->min_pwm, 100));
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
 #define FIXED_PWM_TEMP	1
 
-static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, bool full_speed)
 {
 	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
 	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
@@ -1201,6 +1289,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	u8 speed;
 	int ret, i;
 
+	if (!full_speed && fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
+		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n", fan);
+		return -EINVAL;
+	}
+
 	/* Fan table speed and min_pwm are in percent. */
 	speed = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
 	speed = max_t(u32, speed, min_t(u32, fi->min_pwm, 100));
@@ -1245,6 +1338,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	}
 	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
 
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = full_speed;
 	return 0;
 }
 
@@ -1320,6 +1415,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
 			continue;
 
+		/* Set PWM enable mode to automatic i.e stock table in use. */
+		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
 						      &fi->min_pwm);
@@ -1881,6 +1979,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -1961,6 +2060,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
 		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
 		break;
+	case hwmon_pwm_enable:
+		*val = fi->pwm_enable_mode;
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -1974,8 +2076,12 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static int
 xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi;
 	int ret = 0;
 
+	fi = &hwmon->fi[channel];
+
 	mutex_lock(&hwmon->hwmon_lock);
 
 	switch (attr) {
@@ -1984,7 +2090,53 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
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
-- 
2.34.1

