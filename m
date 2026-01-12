Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50253CF45CD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 20:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1393910E422;
	Mon, 12 Jan 2026 20:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHuQDN8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585EF10E422
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768249765; x=1799785765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UD4pMCBBKkMegAeJG2cEa6sa9klZUj7Zdubxk8FJHHA=;
 b=ZHuQDN8si0mAalnCvjk0gYuRRZ/mWFC23MJFU6UvGgpzwLiC1IkLemex
 +W8U9PKbUWrBqxAU2FtuFr+jMBMEtuNh3n4mxh4BRpbfhad/coDztL6VT
 Qi8knBntHUeVJ/BmlHu1X3Yq28dCrsQqwBaHmIdoVID5xK5ybRanCx96h
 JaZB0Rb9sBrBcSYkxq3WngzdRTDxca5myU391IXrTiRdKBUj0vuOMARmW
 Q87wwGZd/EdiHUsLq5srSEn8IVHKm4lLrZW4revkJAFlubzmEsGaeYLix
 3N8s7nUIcMSsLGv+v/Bi6feyb7Xyd1L1zW7unhlmXaUXTKJLty0N2JSxc Q==;
X-CSE-ConnectionGUID: VEDiSr5mQMOYTQlYeKqlyw==
X-CSE-MsgGUID: uOooseMOQzub/s2RfRy++A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80896131"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80896131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:25 -0800
X-CSE-ConnectionGUID: /orkfJfqSSGeqj+d439log==
X-CSE-MsgGUID: xLz5jLvmRPOIUlYDwQIi5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204275657"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:24 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 3/4] drm/xe/hwmon: Expose GPU PCIe temperature
Date: Tue, 13 Jan 2026 02:05:20 +0530
Message-Id: <20260112203521.1014388-4-karthik.poosa@intel.com>
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

Expose GPU PCIe average temperature and its limits via hwmon sysfs entry
temp5_xxx.
Update Xe hwmon sysfs documentation for this.

v2: Update kernel version in Xe hwmon documentation. (Raag)

v3:
 - Address review comments from Raag.
 - Remove redundant debug log.
 - Update kernel version in Xe hwmon documentation. (Raag)

v4:
 - Address review comments from Raag.
 - Group new temperature attributes with existing temperature attributes
   as per channel index in Xe hwmon documentation.
 - Use TEMP_MASK instead of TEMP_MASK_MAILBOX.
 - Add PCIE_SENSOR_MASK which uses REG_FIELD_GET as replacement of
   PCIE_SENSOR_SHIFT.

v5:
 - Address review comments from Raag.
 - Use REG_FIELD_GET to get PCIe temperature.
 - Move PCIE_SENSOR_GROUP_ID and PCIE_SENSOR_MASK to xe_pcode_api.h
 - Cosmetic change.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
 3 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 550206885624..6e21bebf0e0d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -189,6 +189,30 @@ Description:	RO. Memory controller average temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
 Date:		March 2025
 KernelVersion:	6.16
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 51a2c23be99e..e8604e6300ac 100644
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
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL |
 			   HWMON_T_MAX,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -771,6 +773,27 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 data = 0;
+	int ret;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
+						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+	if (ret)
+		return ret;
+
+	/* Sensor offset is different for G21 */
+	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
+		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
+
+	data = REG_FIELD_GET(TEMP_MASK, data);
+	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -876,6 +899,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -887,6 +911,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -906,6 +931,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
 								channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -933,6 +959,8 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return 0;
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
+		case CHANNEL_PCIE:
+			return get_pcie_temp(hwmon, val);
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -940,6 +968,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -952,6 +981,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -1331,6 +1361,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "vram";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl";
+		else if (channel == CHANNEL_PCIE)
+			*str = "pcie";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index ad713a3e34e5..85cc7478b787 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -54,6 +54,8 @@
 #define     READ_THERMAL_LIMITS			0x0
 #define     READ_THERMAL_CONFIG			0x1
 #define     READ_THERMAL_DATA			0x2
+#define       PCIE_SENSOR_GROUP_ID		0x2
+#define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
 
 #define   PCODE_LATE_BINDING			0x5C
 #define     GET_CAPABILITY_STATUS		0x0
-- 
2.25.1

