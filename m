Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D2D26D99
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 20:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137510E946;
	Fri,  9 Jan 2026 20:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd7HhZSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2610E946
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767989454; x=1799525454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iRuPqGeE9A7efPahVnpz7jeNdn8oy4GM+0EGkIAmJqs=;
 b=Sd7HhZSJxNZ34ehqGJINMaDIAOo4wEorer6sLQ3yZx2EwcFs0JbANzXF
 CR5rQ5rt+c0AYJmDuRhoekuds+6WpzfiET4N6FrmnjY2ROgKvMklYNZsI
 apliHzEOFa3rPv5Z8exqCaSPL2xUNof7TgpC+YKlx0WBoi/xCb3v/JAze
 AwGBJce8cKW0134spYhNZ8sw9EAlRWfRN1M50CiixrTlCd3XTj/kQjezn
 wwDDTSD/iaspvK3JFLx3YJ/cbxYQ4p8KNu8VAuGxsNEE9nZ98zdvlwtjJ
 Eod2o+eiz6Cbx/dm0sGuQyCC4KURsglxLFLz2nyHfs9Ai7qnBFqA/L/3w A==;
X-CSE-ConnectionGUID: h0SfeVYHQ32FuXhDEIkbyw==
X-CSE-MsgGUID: jCcrG4gxRrmcrqBbYemHGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68377675"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68377675"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:54 -0800
X-CSE-ConnectionGUID: hJoxmQkbRAacx1B4RmI3gA==
X-CSE-MsgGUID: EE3h/bZxSW2cFnK+zm8bpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234245058"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:52 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Date: Sat, 10 Jan 2026 01:46:43 +0530
Message-Id: <20260109201644.736483-4-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 36 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

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
index a545e4674e99..2bb67471b755 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -44,6 +44,7 @@ enum xe_hwmon_channel {
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
+	CHANNEL_PCIE,
 	CHANNEL_MAX,
 };
 
@@ -102,7 +103,9 @@ enum sensor_attr_power {
 #define PL_WRITE_MBX_TIMEOUT_MS	(1)
 
 /* Index of memory controller in READ_THERMAL_DATA output */
-#define TEMP_INDEX_MCTRL	(2)
+#define TEMP_INDEX_MCTRL	2
+#define PCIE_SENSOR_GROUP_ID	0x2
+#define PCIE_SENSOR_MASK	REG_GENMASK(31, 16)
 
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
@@ -712,6 +715,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL |
 			   HWMON_T_MAX,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -771,6 +775,27 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret;
+	u32 data = 0;
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
+	data &= TEMP_MASK;
+	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -876,6 +901,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -887,6 +913,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -906,6 +933,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
 								channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
@@ -933,6 +961,8 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return 0;
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
+		case CHANNEL_PCIE:
+			return get_pcie_temp(hwmon, val);
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -940,6 +970,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -952,6 +983,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -1332,6 +1364,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "vram";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl";
+		else if (channel == CHANNEL_PCIE)
+			*str = "pcie";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

