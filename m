Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E6ACD8C89
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3E10EADE;
	Sun,  7 Jun 2026 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDseRiNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F146810EADC
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852793; x=1812388793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvWxMAHoTNs63dNAsIhrteGhll2da8ZEsZghzmXFaRc=;
 b=EDseRiNg2lbdTBDDmvPkFYVq/AUJJK8kWt/4lYMwJG8wka0MsqP9irTz
 cpXf5uc9I8GN/TfMC8i2WO8KQXlquqdZhuvf7lK9lA7PEmZt+GX8CPlPr
 EhoWsqOCiqeC6vDSM03Rq/vGmqE2caZzV2AO/DfPU0wJt/UmWsh+Ez9Sv
 TXoYqjqGMh6wKIe1vVZAEi8B12bg7BLLuDiB6fj7kSZE+9mz3R+gTGSqj
 9zW1+7kty79JxEonSqxXszobzI9KVsPbj4ImRhez0xpeKhv/ciN7SHn//
 GXYGxBVUJURcLF0FYbAlxTxlAXgztZFww25oKjHG3xLavGQcVuuxMuGEQ w==;
X-CSE-ConnectionGUID: TXNaCHSUTraP/ylsnxFjEA==
X-CSE-MsgGUID: 4k25THAHQ06k9zwtpgYQAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737541"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:53 -0700
X-CSE-ConnectionGUID: 5JXucSPlSAazcTob0utilQ==
X-CSE-MsgGUID: SZcWtkhARh65UrXtwhbXtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521597"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 1/5] drm/xe/hwmon: initialize fan-control backend and table
 cache
Date: Sun,  7 Jun 2026 22:58:44 +0530
Message-Id: <20260607172848.2970580-2-karthik.poosa@intel.com>
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

Initialize Xe hwmon fan-control support by detecting fan count,
reading stock fan control points and min PWM, and caching per-fan state.
Seed the user fan table from stock values (with min-PWM clamping)
to prepare for later fan table programming and mode switching.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 287 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pcode_api.h |   8 +
 2 files changed, 277 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..8d9ddbbc95ef 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -122,14 +122,53 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum xe_fan_pwm_enable_mode {
+	XE_FAN_PWM_FULL_SPEED = 0,
+	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
+	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
+};
+
+enum fan_table_type {
+	STOCK_FAN_TABLE,
+	USER_FAN_TABLE,
+	FAN_TABLE_MAX,
+};
+
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
+						((POINT_NUM) & REG_GENMASK(30, 0)))
+
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * struct xe_hwmon_fan_info - Hold all fans related	info.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @fan_control_point_count: number of supported fan control points */
+		u32 fan_control_point_count;
+		struct fan_control_point {
+			/** @temp: temperature in degree celsius */
+			u8 temp;
+			/** @speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+		/** @last_point_temp_valid: last user temperature point was written */
+		bool last_point_temp_valid;
+		/** @last_point_speed_valid: last user PWM point was written */
+		bool last_point_speed_valid;
+	} fan_table[FAN_TABLE_MAX];
+	/** @min_pwm: minimum fan PWM */
+	u32 min_pwm;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -168,6 +207,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @num_fans: number of fans */
+	u8 num_fans;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @boot_power_limit_read: is boot power limits read */
@@ -180,6 +221,15 @@ struct xe_hwmon {
 	struct xe_hwmon_thermal_info temp;
 };
 
+static inline struct fan_table *
+xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
+{
+	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
+		return &hwmon->fi[fan].fan_table[STOCK_FAN_TABLE];
+	else
+		return &hwmon->fi[fan].fan_table[USER_FAN_TABLE];
+}
+
 static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
 {
 	if (hwmon->boot_power_limit_read) {
@@ -856,17 +906,213 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num), uval, NULL);
+}
+
+static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
+{
+	u32 fan_mask = 0;
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon->xe->info.platform == XE_DG2) {
+		*num_fans = 2;
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &fan_mask);
+	if (ret)
+		return ret;
+
+	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
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
+	ret = xe_pcode_write(root_tile,
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan),
+			     (u32)user_fcp_raw);
+	if (ret)
+		drm_dbg(&hwmon->xe->drm,
+			"failed to write fan %d user point %d temp %u, speed %u %%, ret=%d\n",
+			fan, point, temp, speed, ret);
+
+	return ret;
+}
+
+static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
+					    bool is_full_speed)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+	u32 point_count;
+	int ret;
+	int point;
+	struct fan_table *ft = xe_hwmon_get_active_fan_table(hwmon, fan);
+	bool is_user_table_active = ft != &fi->fan_table[STOCK_FAN_TABLE];
+
+	drm_dbg(&hwmon->xe->drm,
+		"activating fan %d user table from %s table\n", fan, is_user_table_active ?
+		"user" : "stock");
+
+	point_count = ft->fan_control_point_count;
+
+	if (!point_count)
+		return -ENODATA;
+
+	for (point = 0; point < point_count; point++) {
+		u8 temp = ft->fcp[point].temp;
+		u8 speed = is_full_speed ? 100 : max_t(u8, ft->fcp[point].speed,
+					    min_t(u32, fi->min_pwm, U8_MAX));
+
+		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
+		if (ret)
+			return ret;
+
+		/* Initialize the user table when activating from stock. */
+		if (!is_user_table_active) {
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
+		}
+	}
+
+	ret = xe_pcode_write(root_tile,
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
+			     point_count);
+	if (ret) {
+		drm_dbg(&hwmon->xe->drm,
+			"failed to activate fan %d user table, ret=%d\n", fan, ret);
+		return ret;
+	}
+
+	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
+	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi->is_full_speed = is_full_speed;
+
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int fan;
+	int point;
+	int ret;
+
+	for (fan = 0; fan < hwmon->num_fans; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &stock_fcp_count);
+		if (!ret)
+			fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
+				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
+		else
+			drm_dbg(&hwmon->xe->drm,
+				"failed to read fan %d stock control point count, ret=%d\n",
+				fan, ret);
+
+		drm_dbg(&hwmon->xe->drm,
+			"fan %d stock points %u\n",
+			fan,
+			fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
+
+		/* Dump all the stock fan control points for debugging purposes. */
+		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+			ret = xe_pcode_read(root_tile,
+					    PCODE_MBOX(FAN_SPEED_CONTROL,
+						       FSC_READ_FAN_TABLE, fan),
+					    &fcp, NULL);
+			if (ret) {
+				drm_dbg(&hwmon->xe->drm,
+					"failed to read fan %d stock point %d, ret=%d\n",
+					fan, point, ret);
+				continue;
+			}
+
+			/* Cache the stock fan control points in local structure for later use. */
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			drm_dbg(&hwmon->xe->drm,
+				"fan %d stock point %d: temp %u C, speed %u %%\n",
+				fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+				fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Set PWM enable mode to automatic i.e stock table in use. */
+		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &fi->min_pwm);
+		if (ret) {
+			drm_dbg(&hwmon->xe->drm,
+				"failed to read fan %d min PWM, ret=%d\n", fan, ret);
+			continue;
+		}
+
+		drm_dbg(&hwmon->xe->drm, "fan %d min PWM %u\n", fan, fi->min_pwm);
+
+		/*
+		 * Initialize user table same as stock table during initialization so that it will
+		 * be ready for use.
+		 */
+		ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false);
+		if (ret) {
+			drm_dbg(&hwmon->xe->drm,
+				"failed to initialize fan %d user table, ret=%d\n", fan, ret);
+			continue;
+		}
+
+		/* Read back user table after initialization for local cache sync. */
+		for (point = 0;
+		     point < fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(USER_FAN_TABLE, point);
+			ret = xe_pcode_read(root_tile,
+					    PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_FAN_TABLE, fan),
+					    &fcp, NULL);
+			if (ret) {
+				drm_dbg(&hwmon->xe->drm,
+					"failed to read back fan %d user point %d, ret=%d\n",
+					fan, point, ret);
+					continue;
+				}
+
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			drm_dbg(&hwmon->xe->drm,
+				"fan %d user point %d: temp %u C, speed %u %%\n",
+				fan, point, fi->fan_table[USER_FAN_TABLE].fcp[point].temp,
+				fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
+		}
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1279,17 +1525,9 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
-	if (!hwmon->xe->info.has_fan_control)
-		return 0;
-
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
-			return 0;
-
-		return channel < uval ? 0444 : 0;
+		return channel < hwmon->num_fans ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1476,6 +1714,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
+	u32 num_fans = 0;
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		/* Check if GPU firmware support mailbox power limits commands. */
@@ -1531,10 +1770,22 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel < FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+	/* Get number of fans */
+	hwmon->num_fans = 0;
+	if (hwmon->xe->info.has_fan_control) {
+		if (xe_hwmon_get_num_fans(hwmon, &num_fans))
+			drm_info(&hwmon->xe->drm, "Number of fans detected: %u\n", num_fans);
+
+		hwmon->num_fans = num_fans;
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel < hwmon->num_fans; channel++)
+			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			drm_warn(&hwmon->xe->drm, "Fan control tables are not available\n");
+	}
 
 	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
 		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..84384f1b0257 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -84,7 +84,15 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
+#define     FSC_WRITE_FAN_TABLE			0x1
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_READ_FAN_MIN_PWM		0x8
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
-- 
2.25.1

