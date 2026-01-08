Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDBAD185F0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234B410E706;
	Thu,  8 Jan 2026 12:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ES78mwlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606810E706
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767877055; x=1799413055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YiMuaz9J6PHi+q0Svm9YHihsrMarVB8BtEaOrMLgRGI=;
 b=ES78mwlCu3utkpokoiUpc/4LQstVzevOSHnPWvaLVLaiR1kqVmph80aJ
 tPuICbS11BqG6myOarqseJZYEkim4zaCa604RVCrPjcI4/kYQ2n0qMp8K
 azsXVah0ybAaLqK4fYIEEZ7VgScq5xL9n1TMWrXRxKuphFziYWUFkD+o4
 YqI0jhuipKxXat++ny8hHbhkklu2Z6vcOGv7PlpQtKVnNOl5VfanpR/3A
 GGXfKF49k0RMPWx5Whxa1lq9txjBc879YTRNaextYaF+lirNbXu0C0qG/
 I/iO17/jfv436Zx4iIr3prW+Gml5J4gOxY7KuNRzd+fi7/LzsLr07DPcg w==;
X-CSE-ConnectionGUID: AkVCOzjyQmOX3flJqFxJdA==
X-CSE-MsgGUID: bQulY11KSFGd80g4JAM4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80361818"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="80361818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:34 -0800
X-CSE-ConnectionGUID: WE0Udd21RFe6iTpbI6WgtA==
X-CSE-MsgGUID: CffGvOdNSDSa44d83M3Qvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202978416"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:57:32 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Date: Thu,  8 Jan 2026 18:33:22 +0530
Message-Id: <20260108130323.426531-4-karthik.poosa@intel.com>
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

Expose GPU PCIe average temperature and its limits via hwmon
sysfs temp5_xxx.
Update Xe hwmon sysfs documentation for this.

v2: Update kernel version in Xe hwmon documentation. (Raag)

v3:
 - Address review comments from Raag.
 - Remove redundant debug log.
 - Update kernel version in Xe hwmon documentation. (Raag)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |  4 ++-
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index a9fcfa6f11b9..6041805a5efc 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -260,3 +260,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Memory controller critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe temperature in millidegree Celsius.
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
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2bf5c9ac948a..317e30c4e1f1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -44,6 +44,7 @@ enum xe_hwmon_channel {
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
+	CHANNEL_PCIE,
 	CHANNEL_MAX,
 };
 
@@ -714,6 +715,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
 			   HWMON_T_MAX,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -781,6 +783,27 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0;
+	u32 data = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
+						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+	if (ret)
+		return ret;
+
+	/* Sensor offset is different for G21 */
+	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
+		data >>= PCIE_SENSOR_SHIFT;
+
+	data &= TEMP_MASK_MAILBOX;
+	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -886,6 +909,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -898,6 +922,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -919,6 +944,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
 					       channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -946,12 +972,15 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
+		case CHANNEL_PCIE:
+			return get_pcie_temp(hwmon, val);
 		}
 		break;
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -963,6 +992,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -1341,6 +1371,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "vram";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl";
+		else if (channel == CHANNEL_PCIE)
+			*str = "pcie";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index fc8811a87741..dd7635bbc4e7 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -70,7 +70,9 @@
 #define     READ_THERMAL_CONFIG			0x1
 #define     READ_THERMAL_DATA			0x2
 #define      TEMP_INDEX_MCTRL			0x2
-#define      TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
+#define      TEMP_MASK_MAILBOX			REG_GENMASK8(7, 0)
+#define      PCIE_SENSOR_GROUP_ID		0x2
+#define      PCIE_SENSOR_SHIFT			16
 
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
-- 
2.25.1

