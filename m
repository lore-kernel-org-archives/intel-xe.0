Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC459D26D99
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 20:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7786710E91A;
	Fri,  9 Jan 2026 20:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RU4a9rBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805E10E91A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767989457; x=1799525457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddl+GyKf0vJkXWmKxL7xxEk0LEvmXuCW4nF+9SK5jh4=;
 b=RU4a9rBFeFe2hjJSPjgCOPUdrB4M3eCSSnII3NuMGrMhJguKc64tNzwN
 3FUPyefxD8UDMYZCaFKEUntMG6pwRL5OEmk2j4rXYlRiFENCMDoWMYeeg
 dYLc7UrqAic8r3X4sU6vROyoUZ0mgPurPJwTVc3PYVZ2Vrna8TceVhO70
 VQ9RhvymqJuVIp0eOx7LOz/zI+rzt9LNj+0ZYgrUsCd7he5ra7Qfq1kvO
 MkAhscCjipHddiTUOPhPMaPV2sknmYF3kxbD0exfxOtHm9IO7yGHkGd9m
 krjAZrnhxncoTw8eFlmoxdbcyVd6TvO1WAx9nNXDxPIHIuERTrTIAqtFQ Q==;
X-CSE-ConnectionGUID: oM7v5Hs0QhWgIJoZaMfQwA==
X-CSE-MsgGUID: 3I0rOUD8S/aPNDtzALtNuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68377677"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68377677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:57 -0800
X-CSE-ConnectionGUID: LmQDc4dOQFGqtXtey8dt4Q==
X-CSE-MsgGUID: h1a5ifR1RE+TVu2QNBG9sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234245072"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:55 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
Date: Sat, 10 Jan 2026 01:46:44 +0530
Message-Id: <20260109201644.736483-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109201644.736483-1-karthik.poosa@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
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
 - Append labels with vram number.
 - Update kernel version in Xe hwmon documentation.

v3:
 - Add missing brackets in Xe hwmon documentation from vram sysfs.
 - Reorder BMG_VRAM_TEMPERATURE_N macro in xe_pcode_regs.h.
 - Add api to check if vram is available on the channel.

v4:
 - Improve VRAM label handling to eliminate temp variable by
   introducing a dedicated array vram_label in xe_hwmon_thermal_info.
 - Remove a magic number.
 - Change the label from vram_X to vram_ch_X.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 22 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 65 ++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)

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
index fb097607b86c..6627591c05b7 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -22,6 +22,9 @@
 #define BMG_FAN_2_SPEED				XE_REG(0x138170)
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
+#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + (n))
+#define   TEMP_MASK_VRAM_N			REG_GENMASK(30, 8)
+#define   TEMP_SIGN_MASK			BIT(31)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2bb67471b755..2403687a73fe 100644
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
 
@@ -106,6 +110,7 @@ enum sensor_attr_power {
 #define TEMP_INDEX_MCTRL	2
 #define PCIE_SENSOR_GROUP_ID	0x2
 #define PCIE_SENSOR_MASK	REG_GENMASK(31, 16)
+#define MAX_LABEL_SIZE		16
 
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
@@ -141,6 +146,8 @@ struct xe_hwmon_thermal_info {
 	u8 count;
 	/** @value: signed value from each sensor */
 	s8 value[U8_MAX];
+	/** @vram_label: vram label names */
+	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
 };
 
 /**
@@ -257,6 +264,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(((channel - CHANNEL_VRAM_N) *
+								sizeof(u32)));
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
@@ -716,6 +726,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
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
@@ -890,6 +916,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+{
+	struct xe_reg vram_ch_temp;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+
+	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
+		/* Create label only for available vram channel */
+		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
+			(channel - CHANNEL_VRAM_N));
+		return 1;
+	}
+	return 0;
+}
+
 static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			/*
+			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
+			 * and bits [7:0] for fraction
+			 */
+			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
+				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
+				 MILLIDEGREE_PER_DEGREE;
+			return 0;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
-			*str = "vram";
+			*str = "vram_avg";
 		else if (channel == CHANNEL_MCTRL)
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

