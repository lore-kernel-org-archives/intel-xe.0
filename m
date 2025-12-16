Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AFBD5E136
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 11:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49010E8DE;
	Tue, 16 Dec 2025 11:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgE8ddc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEDE10E6E9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765885255; x=1797421255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6p/eCStURSzAafj0wxYYnCDspVgkw4NyCSW5qgOeqXs=;
 b=OgE8ddc+1+ZYM6NI/SFno2FRat6IXvt+kDaiNIFFoQFr01EReaYQeCyA
 0je5MSz4DUvJ/FFL/ULBoRJUHklQ4ZSQNRpuRdCl1DrTmzCnjW8Gfq27E
 Wq987pA869V85q34AOfq5sRVMqXMjGGrCSfaPNIfKha44QUe4sknACf4k
 GyqpTInDFMypPjkV+Q76UH7yj6mFVkc3VFXtqzo1m0tkx/lsMyqpWTKgR
 L9AJNRl9ArBdASroAPidEiyVGwtPsbihy+3T5+0GSH9w9Fh552BmeV1Mc
 7zhgMrM2NpkDnRF4bJ998uws8vEhn2xVRlyr3YRz6ntE52A19YHQ+3i0z g==;
X-CSE-ConnectionGUID: zngl4ILfQqG/DeNqj9scBg==
X-CSE-MsgGUID: lo56wmOnRUCFT+XbzEapFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70376749"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70376749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:55 -0800
X-CSE-ConnectionGUID: E7/iGXn5SVi6mYERU0c4tw==
X-CSE-MsgGUID: 9zZXUFJCQci7116FLvIVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197977873"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:53 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 4/4] drm/xe/hwmon: Expose individual vram temperature
Date: Tue, 16 Dec 2025 17:10:30 +0530
Message-Id: <20251216114030.226399-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216114030.226399-1-karthik.poosa@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 47 ++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 51a35fcfb393..b58a96b1857d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -284,3 +284,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_input
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Individual VRAM temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_emergency
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Individual VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_crit
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Individual VRAM critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index fb097607b86c..7c35e2605d2f 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -23,5 +23,7 @@
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
+#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + (n))
+#define TEMP_MASK_VRAM_N			REG_GENMASK(31, 8)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b8519c734b4e..8eb1dd8f4b2f 100644
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
 
@@ -256,6 +260,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(((channel % CHANNEL_VRAM_N) * 4));
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
@@ -715,6 +721,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
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
@@ -921,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -935,6 +960,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -958,6 +986,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -986,6 +1017,12 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			/* Temperature format here is S 31.23.8 */
+			*val = REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
+					     ((reg_val >> 31) ? -1 : 1) * MILLIDEGREE_PER_DEGREE;
+			break;
 		default:
 			*val = 0;
 			return -EOPNOTSUPP;
@@ -999,6 +1036,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_VRAM:
 		case CHANNEL_MCTRL:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -1014,6 +1052,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_VRAM:
 		case CHANNEL_MCTRL:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -1386,16 +1425,22 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	char temp[16] = {0};
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
-			*str = "vram";
+			*str = "vram_avg";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl_avg";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
+		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
+			sprintf(temp, "vram_%d", (channel - CHANNEL_VRAM_N));
+			*str = temp;
+		}
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

