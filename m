Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C7CCF45CE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 20:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251C10E2D1;
	Mon, 12 Jan 2026 20:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3D6XaxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CA110E2D1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768249759; x=1799785759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X89zANQ7p+Z+lnqlPApDhR7PSgXux5ymURsBpe3Iw9Q=;
 b=V3D6XaxLfYrrHpa0Av2U5gBoi28NQbI1zVUiAmU3dNa3kLjr2bjuEWk/
 EOez2kDBVzwzpFjbfXAnmSkTzrAFDkUvi6HIGuShUXiF8RJP8KJsAny4a
 n5kR5xl2ff2s/bJ9G/NYU4y4k2i2erT51aeLDbmWaJkNBYFuXsUy2u7y2
 qpP7fcnBZqj5rbRd/PEcijaFeLuVEn4SGmghtmW4Gw70yIy7auuLxOohc
 +tJTcTkzBbulog4N8s4kaNrv0JvjregvOtYWylPm7jOF4Yj/UPZ3aPUXP
 yQt1NczET5Y5Q0w+WwdNb718XCdyJiGWJ/FspNpiQbz3MnvcbvqpQbqHb g==;
X-CSE-ConnectionGUID: h9fWot3HRjCAHuJbST7T4A==
X-CSE-MsgGUID: 5oaqTyleRNiaCp07DmoaGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80896113"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80896113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:19 -0800
X-CSE-ConnectionGUID: T/WV00jDTXWGRgl+wZqDJg==
X-CSE-MsgGUID: ynMcRY+ZQyucxKuQRlw0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204275625"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:17 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 1/4] drm/xe/hwmon: Expose temperature limits
Date: Tue, 13 Jan 2026 02:05:18 +0530
Message-Id: <20260112203521.1014388-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112203521.1014388-1-karthik.poosa@intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
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

Read temperature limits using pcode mailbox and expose shutdown
temperature limit as tempX_emergency, critical temperature limit as
tempX_crit and GPU max temperature limit as temp2_max.

Update Xe hwmon documentation with above entries.

v2:
 - Resolve a documentation warning.
 - Address below review comments from Raag.
 - Update date and kernel version in Xe hwmon documentation.
 - Remove explicit disable of has_mbx_thermal_info for unsupported
   platforms.
 - Remove unnecessary default case in switches.
 - Remove obvious comments.
 - Use TEMP_LIMIT_MAX to compute number of dwords needed in
   xe_hwmon_thermal_info.
 - Remove THERMAL_LIMITS_DWORDS macro.
 - Use has_mbx_thermal_info for checking thermal mailbox support.

v3:
 - Address below minor comments. (Raag)
 - Group new temperature attributes with existing temperature attributes
   as per channel index in Xe hwmon documentation.
 - Rename enums of xe_temp_limit to improve clarity.
 - Use DIV_ROUND_UP to calculate dwords needed for temperature limits.
 - Use return instead of breaks in xe_hwmon_temp_read.
 - Minor aesthetic refinements.

v4:
 - Remove a redundant break. (Raag)
 - Update drm_dbg to drm_warn to inform user of unavailability for
   thermal mailbox on expected platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 +++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 102 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 6 files changed, 148 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d9e2b17c6872..2b00ef13b6ad 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -109,6 +109,22 @@ Description:	RO. Package current voltage in millivolt.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
 Date:		March 2025
 KernelVersion:	6.15
@@ -117,6 +133,30 @@ Description:	RO. Package temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package maximum temperature limit in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
 Date:		March 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4dab3057f58d..f689766adcb1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -341,6 +341,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
+		u8 has_mbx_thermal_info:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ff2aea52ef75..7eb6a76fa217 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -53,6 +53,15 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+enum xe_temp_limit {
+	TEMP_LIMIT_PKG_SHUTDOWN,
+	TEMP_LIMIT_PKG_CRIT,
+	TEMP_LIMIT_MEM_SHUTDOWN,
+	TEMP_LIMIT_PKG_MAX,
+	TEMP_LIMIT_MEM_CRIT,
+	TEMP_LIMIT_MAX
+};
+
 /* Attribute index for powerX_xxx_interval sysfs entries */
 enum sensor_attr_power {
 	SENSOR_INDEX_PSYS_PL1,
@@ -111,6 +120,18 @@ struct xe_hwmon_fan_info {
 	u64 time_prev;
 };
 
+/**
+ * struct xe_hwmon_thermal_info - to store temperature data
+ */
+struct xe_hwmon_thermal_info {
+	union {
+		/** @limit: temperatures limits */
+		u8 limit[TEMP_LIMIT_MAX];
+		/** @data: temperature limits in dwords */
+		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
+	};
+};
+
 /**
  * struct xe_hwmon - xe hwmon data structure
  */
@@ -137,7 +158,8 @@ struct xe_hwmon {
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
 	u32 pl2_on_boot[CHANNEL_MAX];
-
+	/** @temp: Temperature info */
+	struct xe_hwmon_thermal_info temp;
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -677,8 +699,11 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL |
+			   HWMON_T_MAX,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
@@ -689,6 +714,19 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	NULL
 };
 
+static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
+			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
+		hwmon->temp.data[0], hwmon->temp.data[1]);
+
+	return ret;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -787,6 +825,31 @@ static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	switch (attr) {
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		default:
+			return 0;
+		}
+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
+		default:
+			return 0;
+		}
+	case hwmon_temp_max:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
+		default:
+			return 0;
+		}
 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
@@ -808,6 +871,36 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		/* HW register value is in degrees Celsius, convert to millidegrees. */
 		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
 		return 0;
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		case CHANNEL_VRAM:
+			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		case CHANNEL_VRAM:
+			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_temp_max:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1263,6 +1356,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	for (channel = 0; channel < FAN_MAX; channel++)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+
+	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
+		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
 }
 
 int xe_hwmon_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 673db1e82ec3..fa0a374d88f8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_fan_control = true,
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_i2c = true,
@@ -422,6 +423,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_sysctrl = true,
@@ -687,6 +689,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
+	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5f20f56571d1..20acc5349ee6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -48,6 +48,7 @@ struct xe_device_desc {
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_mbx_thermal_info:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
 	u8 has_pre_prod_wa:1;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 975892d6b230..dc8f241e5b9e 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -50,6 +50,9 @@
 #define	READ_PL_FROM_FW				0x1
 #define	READ_PL_FROM_PCODE			0x0
 
+#define   PCODE_THERMAL_INFO			0x25
+#define     READ_THERMAL_LIMITS			0x0
+
 #define   PCODE_LATE_BINDING			0x5C
 #define     GET_CAPABILITY_STATUS		0x0
 #define       V1_FAN_SUPPORTED			REG_BIT(0)
-- 
2.25.1

