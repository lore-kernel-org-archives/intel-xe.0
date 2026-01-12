Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFBAC9EC7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 12:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62B10E3B9;
	Mon, 12 Jan 2026 12:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLchT+qH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B349F10E3B9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768219889; x=1799755889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3xPOEIqXRSLMZgzdabJ7eRwCI2sotWCmMc1xCrgoqE=;
 b=WLchT+qHflbS8JGwP8JskBPyevXbVV3BhXuOB+V3IDKAgm/HqKru6t8h
 lQejOw1fFF9WN9HfqUYnxkOG9zBnUFxXeF9lym0uWGoeb50g+jhpTvEmL
 sBsnF+jQ9B1FkwMTz6pGvqAwdaxK+e4ktfYSXbBUSRVqn5tIMCA98dy2h
 PQpPuVQPjPsgMbCgzoEgWwk+pU1K+sOeobnakT+ilNXcsbo2sBDFNj1i+
 Xf5rUFqEXn2KROjQ+L7RBAH5hnJWQahDrZusJxPRv09WngLNvyzkmkqkq
 LZZlECXmJLqgS8/abxg7DyACmIgvAkl9pXrY8IaMv9W89VmvFAmX0JmPS A==;
X-CSE-ConnectionGUID: OT7KHvmJR3eTdhkZmKcu/A==
X-CSE-MsgGUID: 0feRY+9KRPK1FjMBusBsxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69227228"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69227228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:11:29 -0800
X-CSE-ConnectionGUID: 7RRuLpOWS2ybC0EJ4FKPYQ==
X-CSE-MsgGUID: Dak4tagGSj+GF/EO7uPbVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204355667"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:11:26 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
Date: Mon, 12 Jan 2026 17:47:24 +0530
Message-Id: <20260112121724.951867-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112121724.951867-1-karthik.poosa@intel.com>
References: <20260112121724.951867-1-karthik.poosa@intel.com>
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

Expose individual VRAM temperature attributes.
Update Xe hwmon documentation for this entry.

v2:
 - Avoid using default switch case for VRAM individual temperatures.
 - Append labels with VRAM channel number.
 - Update kernel version in Xe hwmon documentation.

v3:
 - Add missing brackets in Xe hwmon documentation from VRAM channel sysfs.
 - Reorder BMG_VRAM_TEMPERATURE_N macro in xe_pcode_regs.h.
 - Add api to check if VRAM is available on the channel.

v4:
 - Improve VRAM label handling to eliminate temp variable by
   introducing a dedicated array vram_label in xe_hwmon_thermal_info.
 - Remove a magic number.
 - Change the label from vram_X to vram_ch_X.

v5:
 - Address review comments from Raag.
 - Change vram to VRAM in commit title and subject.
 - Refactor BMG_VRAM_TEMPERATURE_N macro.
 - Refactor is_vram_ch_available().
 - Rephrase a comment.
 - Check individual VRAM temperature limits in addition to VRAM
   availability in xe_hwmon_temp_is_visible. (Raag)
 - Move VRAM label change out of this patch.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 22 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 66 +++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 6e21bebf0e0d..55ab45f669ac 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -211,6 +211,28 @@ KernelVersion:	7.0
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. GPU PCIe temperature in millidegree Celsius.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM channel critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM channel shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM channel temperature in millidegree Celsius.
+
 		Only supported for particular Intel Xe graphics platforms.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index fb097607b86c..45f09f39df96 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -22,6 +22,9 @@
 #define BMG_FAN_2_SPEED				XE_REG(0x138170)
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
+#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + ((n) * (sizeof(u32))))
+#define   TEMP_MASK_VRAM_N			REG_GENMASK(30, 8)
+#define   TEMP_SIGN_MASK			BIT(31)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e8604e6300ac..b1737403a38b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,12 +39,16 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
+#define MAX_VRAM_CHANNELS      (16)
+
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
+	CHANNEL_VRAM_N,
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
 	CHANNEL_MAX,
 };
 
@@ -105,6 +109,9 @@ enum sensor_attr_power {
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
+/* Maximum characters in hwmon label name */
+#define MAX_LABEL_SIZE		16
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -139,6 +146,8 @@ struct xe_hwmon_thermal_info {
 	u8 count;
 	/** @value: signed value from each sensor */
 	s8 value[U8_MAX];
+	/** @vram_label: vram label names */
+	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
 };
 
 /**
@@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
@@ -714,6 +725,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_MAX,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -888,6 +915,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+	int vram_id = channel - CHANNEL_VRAM_N;
+	struct xe_reg vram_reg;
+
+	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
+		return false;
+
+	/* Create label only for available vram channel */
+	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
+	return true;
+}
+
 static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -901,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return (is_vram_ch_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -913,6 +958,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return (is_vram_ch_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -933,6 +981,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -961,6 +1011,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			/*
+			 * This temperature format is 24 bit [31:8] signed integer and 8 bits
+			 * [7:0] fraction.
+			 */
+			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
+				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
+				 MILLIDEGREE_PER_DEGREE;
+			return 0;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -972,6 +1032,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -985,6 +1046,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
@@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
+		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

