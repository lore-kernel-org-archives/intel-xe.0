Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD16D3C526
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63310E669;
	Wed, 10 Dec 2025 06:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGaYO5ZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0734910E66D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347815; x=1796883815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKQGLrPz2PYpGGrGRvqmhrhz68juYvGXH4DLBjf4e8k=;
 b=VGaYO5ZJ4J4NXv4qX6UcoagsPln1EtCuJMWDVurKd91WNBfCeOLxeKdT
 UV8OoT3PMC7kYC5T+723k4sfdi5mz/e3rOda/07gfQWxPvmMLiVwZvsg+
 SUTnF/ilV4aDW/W6FyQ5KWibSb9FjDzKb92KSOjyry9jLljbtH8FeQHH6
 e6WD9PU9nNwwkArTNJuxrXAAnZFKzCBTl+FuCAbS1D9jXrpa398FyrWa6
 auBPYQdwLlCTu0b2K8vNa/yKEHhqM5h6WNGaHVxK/9FLLRPWNA7vr+Wxu
 fscgRRhKhaI3mqwYL4ZZ3QVZp8V4bxkFQlYT2z5T7UB100Wd01Vl1FxCD g==;
X-CSE-ConnectionGUID: 4neI14pyTjSZnsirD/tIBA==
X-CSE-MsgGUID: FrTwmn7lTzamwi4+v8xsbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176022"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:35 -0800
X-CSE-ConnectionGUID: vMEF1CqfTIK/GMnhLZs0OQ==
X-CSE-MsgGUID: ffaIuf5JRPWyNZkRCHw6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483827"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:33 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 6/7] drm/xe/hwmon: Expose GPU pcie temperature
Date: Wed, 10 Dec 2025 11:53:00 +0530
Message-Id: <20251210062301.4080549-7-karthik.poosa@intel.com>
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

Expose GPU PCIe temperature via hwmon sysfs temp5_xxx.
Update Xe hwmon sysfs documentation for this.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 44 +++++++++++++++++--
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 7e1765312696..befb8f4bdd6d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -252,3 +252,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Memory controller critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. PCIe temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. PCIe shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. PCIe critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 783f6e40847c..7b108bb025d9 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -44,6 +44,7 @@ enum xe_hwmon_channel {
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
+	CHANNEL_PCIE,
 	CHANNEL_MAX,
 };
 
@@ -712,6 +713,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -786,6 +788,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0;
+	u32 data = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, 2),
+			    &data, NULL);
+	drm_dbg(&hwmon->xe->drm, "thermal data for pcie ret %d, val 0x%x\n", ret, data);
+	if (ret)
+		return ret;
+
+	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
+		data >>= 8;
+	*val = (data & TEMP_MASK_MAILBOX) * MILLIDEGREE_PER_DEGREE;
+
+	if (data & 0x80)
+		*val = *val * -1;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -894,6 +918,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -906,6 +932,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -919,6 +947,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 								channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+			break;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -940,12 +971,15 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
 		break;
+		case CHANNEL_PCIE:
+			return get_pcie_temp(hwmon, val);
+		break;
 		case CHANNEL_PKG:
 		case CHANNEL_VRAM:
-		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
 
-		/* HW register value is in degrees Celsius, convert to millidegrees. */
-		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+			/* HW register value is in degrees Celsius, convert to millidegrees. */
+			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
 		break;
 		default:
 			*val = 0;
@@ -955,6 +989,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -969,6 +1004,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_crit:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -1344,6 +1380,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "vram";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl_avg";
+		else if (channel == CHANNEL_PCIE)
+			*str = "pcie";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

