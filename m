Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE8D185F0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D74710E1C2;
	Thu,  8 Jan 2026 12:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaYS7Yag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CF610E1C2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767877051; x=1799413051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlZ3Bzq/DYkqrZ78YUl2vLM2XF7NkV325NnsSJVzURw=;
 b=aaYS7YagjvL8+iYS+I0RihqS6Fk2Q7suAL9ax62HHdzi82+opvvnO9OZ
 Nq4DmaADp7cysHgLhSCoHH+ydv006wvpGy3ZWCr2fBoQipK7oW1gzBMEs
 2+7KNFD1C7wML7UpsBVHA/eTFZC+fStZsTx1yaW0S1CeeoWN7vR9jMJSD
 XmzCSkCx9ueWuG9lIsemEeU95oW35ESVpWLXM9OxAHhyXD+Cgw4w0lDYQ
 ugzFvM9vq0kCRpwiLzgkRZFSBgh+FajYXea7wGCwM4XEYISZQcmA61EF8
 +rys1s64Mje6Hh7jS+/FOx6wCtPHTtUkDM/Zk13DAh89gaPXNUTjVHVoi g==;
X-CSE-ConnectionGUID: Hz/odX45SDuOgKYtJLXBeg==
X-CSE-MsgGUID: mCGKmukRTTO1wbIaXOy77A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80361815"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="80361815"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:31 -0800
X-CSE-ConnectionGUID: GY7KD+OaRYaeMAyttoIfeQ==
X-CSE-MsgGUID: cSGnUDzxSouoyWy/ty6i1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202978409"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:28 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 2/4] drm/xe/hwmon: Expose memory controller temperature
Date: Thu,  8 Jan 2026 18:33:21 +0530
Message-Id: <20260108130323.426531-3-karthik.poosa@intel.com>
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

Expose GPU memory controller average temperature and its limits
under temp4_xxx.
Update Xe hwmon documentation for this.

v2:
 - Rephrase commit message. (Badal)
 - Update kernel version in Xe hwmon documentation. (Raag)

v3:
 - Update kernel version in Xe hwmon documentation.
 - Address review comments from Raag.
 - Remove obvious comments.
 - Remove redundant debug logs.
 - Remove unnecessary checks.
 - Avoid magic numbers.
 - Add new comments.
 - Use temperature sensors count to make memory controller visible.
 - Use temperature limits of package for memory controller.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 86 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  4 +
 3 files changed, 110 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index c3b367c42741..a9fcfa6f11b9 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -236,3 +236,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. VRAM critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller average temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index db00728c89e4..2bf5c9ac948a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -43,6 +43,7 @@ enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
+	CHANNEL_MCTRL,
 	CHANNEL_MAX,
 };
 
@@ -100,6 +101,11 @@ enum sensor_attr_power {
  */
 #define PL_WRITE_MBX_TIMEOUT_MS	(1)
 
+/*
+ * Maximum number of thermal sensors supported by hardware.
+ */
+#define MAX_THERMAL_SENSORS    (255)
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -130,6 +136,10 @@ struct xe_hwmon_thermal_info {
 		/** @data: temperature limits in dwords */
 		u32 data[(TEMP_LIMIT_MAX / sizeof(u32)) + ((TEMP_LIMIT_MAX % sizeof(u32)) ? 1 : 0)];
 	};
+	/** @count: no of temperature sensors available for the platform */
+	u8 count;
+	/** @value: value from each sensor, bit 7 is for sign and 6:0 for value */
+	s8 value[MAX_THERMAL_SENSORS];
 };
 
 /**
@@ -703,6 +713,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
 			   HWMON_T_MAX,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -718,15 +729,58 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	int ret = 0;
+	u32 val = 0;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
 			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+	if (ret)
+		return ret;
+
 	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
 		hwmon->temp.data[0], hwmon->temp.data[1]);
 
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
+			    &val, NULL);
+	if (ret)
+		return ret;
+
+	drm_dbg(&hwmon->xe->drm, "thermal config count %d\n", val);
+	hwmon->temp.count = val & TEMP_MASK;
+
 	return ret;
 }
 
+static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0, i = 0;
+	u32 *dword = (u32 *)hwmon->temp.value;
+	s16 average = 0;
+
+	for (i = 0; i < (hwmon->temp.count / sizeof(u32)); i++) {
+		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
+				    (dword + i), NULL);
+		if (ret)
+			return ret;
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
+	}
+
+	if (hwmon->temp.count % (sizeof(u32))) {
+		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
+				    (dword + i), NULL);
+		if (ret)
+			return ret;
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
+	}
+
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
+		average += hwmon->temp.value[i];
+
+	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
+	*val = average * MILLIDEGREE_PER_DEGREE;
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -831,6 +885,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -841,6 +897,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -855,7 +913,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
+		switch (channel) {
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
+		default:
+			return 0;
+		}
 	default:
 		return 0;
 	}
@@ -869,14 +936,22 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 	switch (attr) {
 	case hwmon_temp_input:
-		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+		switch (channel) {
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
 
-		/* HW register value is in degrees Celsius, convert to millidegrees. */
-		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+			/* HW register value is in degrees Celsius, convert to millidegrees. */
+			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+			break;
+		case CHANNEL_MCTRL:
+			return get_mc_temp(hwmon, val);
+		}
 		break;
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -887,6 +962,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_crit:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -1263,6 +1339,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
 			*str = "vram";
+		else if (channel == CHANNEL_MCTRL)
+			*str = "mctrl";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 6c84c1780fe9..fc8811a87741 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -67,6 +67,10 @@
 
 #define   PCODE_THERMAL_INFO			0x25
 #define     READ_THERMAL_LIMITS			0x0
+#define     READ_THERMAL_CONFIG			0x1
+#define     READ_THERMAL_DATA			0x2
+#define      TEMP_INDEX_MCTRL			0x2
+#define      TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
 
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
-- 
2.25.1

