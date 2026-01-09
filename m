Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C25D26D9B
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 20:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8E410E947;
	Fri,  9 Jan 2026 20:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZDGDGv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B422710E947
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767989451; x=1799525451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SYVueJ6VjQa4JkLuGG1qQRI38aAQQV357/9Wp7WJ+c=;
 b=hZDGDGv+q6/u1I3Gqe9UbY8JIH4THjmqFcV+USSbKJp+0LuwxrlAYY6q
 JrqI0cGlMcwVwi1iwepsq7ZlBVl7pUhwRJXf+W74iuxRH2lRNrCGoWykP
 7SckB9SDRSVlHml+9ZQf3NzZxX4hsbYNGMKd4NWdTKBV4NHOqQL4iabXL
 ezugfqhsm9xUnR3zjLpwU9fy4rt1NEqg/q+exLNs0DJD0OAnmTSibx6iV
 5BL/BvYhB0gEg7QX4WCPhk5fJ6nf1Hj919BSFqz8G8/4gewnNLD5evt7D
 hKivCRxw6jP1GDK6DdnsSLBAz8zjl1Ns0RdXtPyEMe5AbE2sO2vIcp8jL g==;
X-CSE-ConnectionGUID: iH7dxGtYRPmQiBJqz2/srQ==
X-CSE-MsgGUID: r+hlgU8GSeGhdMxX+j2TyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68377672"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68377672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:51 -0800
X-CSE-ConnectionGUID: pT/YnwGnRGi8h+ZX0y9Rtg==
X-CSE-MsgGUID: RqZSDImfSb+O8HLOhoj0CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234245046"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:49 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 2/4] drm/xe/hwmon: Expose memory controller temperature
Date: Sat, 10 Jan 2026 01:46:42 +0530
Message-Id: <20260109201644.736483-3-karthik.poosa@intel.com>
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

Expose GPU memory controller average temperature and its limits under
temp4_xxx.
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

v4:
 - Address review comments from Raag.
 - Group new temperature attributes with existing temperature attributes
   as per channel index in Xe hwmon documentation.
 - Use DIV_ROUND_UP to calculate dwords needed for temperature limits.
 - Minor aesthetic refinements.
 - Remove unused TEMP_MASK_MAILBOX.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 79 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
 3 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 2b00ef13b6ad..550206885624 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -165,6 +165,30 @@ Description:	RO. VRAM temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller critical temperature in millidegree Celsius.
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
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller average temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
 Date:		March 2025
 KernelVersion:	6.16
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c9899d5f5306..a545e4674e99 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -43,6 +43,7 @@ enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
+	CHANNEL_MCTRL,
 	CHANNEL_MAX,
 };
 
@@ -100,6 +101,9 @@ enum sensor_attr_power {
  */
 #define PL_WRITE_MBX_TIMEOUT_MS	(1)
 
+/* Index of memory controller in READ_THERMAL_DATA output */
+#define TEMP_INDEX_MCTRL	(2)
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -130,6 +134,10 @@ struct xe_hwmon_thermal_info {
 		/** @data: temperature limits in dwords */
 		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
 	};
+	/** @count: no of temperature sensors available for the platform */
+	u8 count;
+	/** @value: signed value from each sensor */
+	s8 value[U8_MAX];
 };
 
 /**
@@ -703,6 +711,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL |
 			   HWMON_T_MAX,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -718,15 +727,50 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	int ret;
+	u32 config = 0;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
 			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+	if (ret)
+		return ret;
+
 	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
 		hwmon->temp.data[0], hwmon->temp.data[1]);
 
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
+			    &config, NULL);
+	if (ret)
+		return ret;
+
+	drm_dbg(&hwmon->xe->drm, "thermal config count %d\n", config);
+	hwmon->temp.count = config & TEMP_MASK;
+
 	return ret;
 }
 
+static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 *dword = (u32 *)hwmon->temp.value;
+	s32 average = 0;
+	int ret, i;
+
+	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
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
@@ -831,6 +875,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -840,6 +886,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -852,7 +900,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		}
 	case hwmon_temp_input:
 	case hwmon_temp_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
+		switch (channel) {
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+								channel)) ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return hwmon->temp.count ? 0444 : 0;
+		default:
+			return 0;
+		}
 	default:
 		return 0;
 	}
@@ -866,14 +923,23 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 	switch (attr) {
 	case hwmon_temp_input:
-		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+		switch (channel) {
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
 
-		/* HW register value is in degrees Celsius, convert to millidegrees. */
-		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
-		return 0;
+			/* HW register value is in degrees Celsius, convert to millidegrees. */
+			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		case CHANNEL_MCTRL:
+			return get_mc_temp(hwmon, val);
+		default:
+			return -EOPNOTSUPP;
+		}
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -885,6 +951,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_crit:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
@@ -1263,6 +1330,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
 			*str = "vram";
+		else if (channel == CHANNEL_MCTRL)
+			*str = "mctrl";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index dc8f241e5b9e..ad713a3e34e5 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -52,6 +52,8 @@
 
 #define   PCODE_THERMAL_INFO			0x25
 #define     READ_THERMAL_LIMITS			0x0
+#define     READ_THERMAL_CONFIG			0x1
+#define     READ_THERMAL_DATA			0x2
 
 #define   PCODE_LATE_BINDING			0x5C
 #define     GET_CAPABILITY_STATUS		0x0
-- 
2.25.1

