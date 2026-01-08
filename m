Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D119D185F0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226810E704;
	Thu,  8 Jan 2026 12:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GX72bTGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58DE10E704
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767877059; x=1799413059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/yRQ5W/jaGqfd9bJRWo4gt3JLe0D/0MngjRmlI9X+k=;
 b=GX72bTGVYQ4uRMnjZSgY94x7ygJtO8QWOf2j9b/wFpDeBIiKN3mQs/wD
 O6UYarG4V2Mt+a4IKCGT5ikyT+cngm1u0cBB6SxqvGed0XSknGy4ctCWl
 668qMminhIPk/3yGXc/ZvSA20VFOtOxC9jqjxr2lqTH6hHAudrgTC0Im4
 CV2d25uidtU5/sG5eQyXvXdPZBqcaWCq8hpU1/EjZ3sfcJlWZSpaL5vmx
 bwhTy4QE5iC9EW4GN2bnhFvS4kJPtGR1UFYbyCsvUfPU/9Fx1kLrAVNbu
 4sDPiVTHqziKhlDLj6C86bcEpSN4RuZe5/Fbwur1Km/EGz9LkB9RvVbez Q==;
X-CSE-ConnectionGUID: KB8FMHbuQC6Zs0p/FuLUHQ==
X-CSE-MsgGUID: dufuiLNqRampjnayyynqJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80361822"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="80361822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:39 -0800
X-CSE-ConnectionGUID: ClhqvlkyQ+GQhAgobWDUbQ==
X-CSE-MsgGUID: Ge65PaLNTcevDYi5d8dBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202978424"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:37 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
Date: Thu,  8 Jan 2026 18:33:23 +0530
Message-Id: <20260108130323.426531-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260108130323.426531-1-karthik.poosa@intel.com>
References: <20260108130323.426531-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 68 +++++++++++++++++--
 3 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 6041805a5efc..4da405699571 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -284,3 +284,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM channel temperature in millidegree Celsius.
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
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM channel critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
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
index 317e30c4e1f1..561e71864f95 100644
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
 
@@ -257,6 +261,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(((channel - CHANNEL_VRAM_N) * 4));
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
@@ -716,6 +722,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_MAX,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -898,6 +920,18 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+{
+	struct xe_reg vram_ch_temp;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+
+	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+	if (xe_reg_is_valid(vram_ch_temp))
+		return (xe_mmio_read32(mmio, vram_ch_temp)) ? 1 : 0;
+
+	return 0;
+}
+
 static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -911,6 +945,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -924,6 +960,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -946,6 +984,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -974,6 +1014,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
+			break;
 		}
 		break;
 	case hwmon_temp_emergency:
@@ -984,6 +1034,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		}
@@ -996,6 +1047,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		}
@@ -1363,16 +1415,22 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	char temp[16] = {0};
+
 	switch (type) {
 	case hwmon_temp:
-		if (channel == CHANNEL_PKG)
+		if (channel == CHANNEL_PKG) {
 			*str = "pkg";
-		else if (channel == CHANNEL_VRAM)
-			*str = "vram";
-		else if (channel == CHANNEL_MCTRL)
+		} else if (channel == CHANNEL_VRAM) {
+			*str = "vram_avg";
+		} else if (channel == CHANNEL_MCTRL) {
 			*str = "mctrl";
-		else if (channel == CHANNEL_PCIE)
+		} else if (channel == CHANNEL_PCIE) {
 			*str = "pcie";
+		} else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
+			sprintf(temp, "vram_%d", (channel - CHANNEL_VRAM_N));
+			*str = temp;
+		}
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

