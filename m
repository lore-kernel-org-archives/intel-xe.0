Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE6AD2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0885510E666;
	Wed, 10 Dec 2025 06:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6DzU9uh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36E10E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347819; x=1796883819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Sm3oTv5qIyiXLflXUp1SSjFq2xDgdZW1/A65iQlwgE=;
 b=Y6DzU9uhk45pZqekezrKSKPZ5sUaPw/9qdQT/pslJc/KWyksar7r+Z7p
 fMfPvW1ayogXsz9O4WkPtoL8JcjoCmsEizu5wAN5+Pj2CkYHKPoYo0OID
 R5nNiF8QLsRMDKNEmxWesNpZs1xyGFtO7D74IdZ7iksnlYPExPBL4REBP
 SqjgFk3EUbVClT5zN29Bp6REFixJm0NnYuDCM8SLur44Qo0dY9f4yLg9a
 4pWVtxGf9w6mqm/M0ntHEifXazliL3lPupTEcMtI4WvsRZbcrgvMAolMt
 x1v1RVooNvlU4WwUFteu7k5OniACUE4z/6eVSSyh3ifxnDjlYIvzw+hfQ A==;
X-CSE-ConnectionGUID: LdXoM+1fQmytmAVUXtszAw==
X-CSE-MsgGUID: ophbB7x4TYSYASKf5qmRIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176028"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:38 -0800
X-CSE-ConnectionGUID: X7vFIrfSQtaLDPePlbmDXg==
X-CSE-MsgGUID: 0kgG/kr4QXa4LDr17cq4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483833"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:36 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 7/7] drm/xe/hwmon: Expose individual vram temperature
Date: Wed, 10 Dec 2025 11:53:01 +0530
Message-Id: <20251210062301.4080549-8-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251210062301.4080549-1-karthik.poosa@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 77 ++++++++++++++++---
 3 files changed, 91 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index befb8f4bdd6d..563888d96ccd 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -276,3 +276,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. PCIe critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_input
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Individual VRAM temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Individual VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_crit
+Date:		December 2025
+KernelVersion:	6.18
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
index 7b108bb025d9..d77ed403e258 100644
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
@@ -714,6 +720,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
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
@@ -921,7 +943,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
-			return 0;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+						       channel)) ? 0444 : 0;
+			else
+				return 0;
 		}
 		break;
 	case hwmon_temp_crit:
@@ -935,7 +961,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
-			return 0;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+						       channel)) ? 0444 : 0;
+			else
+				return 0;
 		}
 		break;
 	case hwmon_temp_input:
@@ -951,7 +981,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
-			return 0;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+				return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+						       channel)) ? 0444 : 0;
+			else
+				return 0;
 		}
 		break;
 	default:
@@ -977,28 +1011,40 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		case CHANNEL_PKG:
 		case CHANNEL_VRAM:
 			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
-
 			/* HW register value is in degrees Celsius, convert to millidegrees. */
 			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
 		break;
 		default:
-			*val = 0;
-			return -EOPNOTSUPP;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
+				reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP,
+										channel));
+				/* Temperature format here is S 31.23.8 */
+				*val = REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
+				       ((reg_val >> 31) ? -1 : 1) * MILLIDEGREE_PER_DEGREE;
+			} else {
+				*val = 0;
+				return -EOPNOTSUPP;
+			}
 		}
 		break;
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_PCIE:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
-		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
-			*val = 0;
-			return -EOPNOTSUPP;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
+				*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] *
+				       MILLIDEGREE_PER_DEGREE;
+			} else {
+				*val = 0;
+				return -EOPNOTSUPP;
+			}
 		}
 		break;
 	case hwmon_temp_crit:
@@ -1012,8 +1058,13 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
-			*val = 0;
-			return -EOPNOTSUPP;
+			if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
+				*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] *
+				       MILLIDEGREE_PER_DEGREE;
+			} else {
+				*val = 0;
+				return -EOPNOTSUPP;
+			}
 		}
 		break;
 	default:
@@ -1377,11 +1428,13 @@ static int xe_hwmon_read_label(struct device *dev,
 		if (channel == CHANNEL_PKG)
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
-			*str = "vram";
+			*str = "vram_total";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl_avg";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
+		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
+			*str = "vram";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

