Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621CD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3B910E66C;
	Wed, 10 Dec 2025 06:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgC061BO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AB410E66D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347813; x=1796883813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Z0LA+Y6SAN/UiWzLDfbVUa5YkoZYZHnxWZg+7iJWjM=;
 b=YgC061BOTlrTRWgNrg5Y10wI+dXfXRK+7ymT2IQ/T2dS+D2hsxt3xLjO
 mFttyoypQzeLSpzH3cdB7/XRVWHvBafVAC6+lhuuUE6DAu1jzEtZdSIz5
 Zmz0Os/Hvbv00M4Pxk2cKIKGwj1zvTFA5XtUavXFeNTSU+63Ijt/2Dpyk
 doX9+dNbOor5KvLcXwYFdIi6CssunJJmfQX/wOO/BDGaeNcRX8N3IpWsl
 jjmvZl8qUdhrXvl9FKFsOqkTbEwLhntyzr+WEur1nGzSDoWIzUzkHc3pE
 cmv1skRCuGzKZhguXriAwspqc5grA+hZJQRPvbaxswcL80LzvccgsfhC8 g==;
X-CSE-ConnectionGUID: cUs+Mc3rTOmBUXQUeCM4RA==
X-CSE-MsgGUID: gVHPzKhXTKKZzRulXdP55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176020"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:32 -0800
X-CSE-ConnectionGUID: 730vZOruSae9JxBDA5NEoQ==
X-CSE-MsgGUID: p7LCl4aqTw6E1M+YWpVvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483821"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:29 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 5/7] drm/xe/hwmon: Expose memory controller temperature
Date: Wed, 10 Dec 2025 11:52:59 +0530
Message-Id: <20251210062301.4080549-6-karthik.poosa@intel.com>
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

Expose GPU memory controller temperatures under temp4_xxx.
Update Xe hwmon documentation for this.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 68 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
 3 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 60bc71ce9951..7e1765312696 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -228,3 +228,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. VRAM critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller average temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller shutodwn temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Memory controller critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e843021d13ec..783f6e40847c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -43,6 +43,7 @@ enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
+	CHANNEL_MCTRL,
 	CHANNEL_MAX,
 };
 
@@ -136,6 +137,8 @@ struct xe_hwmon_thermal_info {
 	};
 	/** @count: no of temperature sensors */
 	u8 count;
+	/** @value: value from each sensors S1.7 format. */
+	u8 value[MAX_THERMAL_SENSORS];
 };
 
 /**
@@ -708,6 +711,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_LABEL,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -747,7 +751,38 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	if (hwmon->temp.count > MAX_THERMAL_SENSORS)
 		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
 			 hwmon->temp.count, MAX_THERMAL_SENSORS);
+	return 0;
+}
 
+static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0, i = 0;
+
+	for (i = 0; i < (hwmon->temp.count / 4); i++) {
+		/* Read thermal data */
+		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
+				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
+			(u32)hwmon->temp.value[i * 4]);
+		if (ret)
+			return ret;
+	}
+	if (hwmon->temp.count % 4) {
+		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
+				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
+			(u32)hwmon->temp.value[i * 4]);
+		if (ret)
+			return ret;
+	}
+
+	*val = 0;
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count; i++) {
+		*val += (hwmon->temp.value[i] & TEMP_MASK_MAILBOX) *
+			((hwmon->temp.value[i] & 0x80) ? -1 : 1);
+	}
+	*val = (*val / hwmon->temp.count) * MILLIDEGREE_PER_DEGREE;
 	return 0;
 }
 
@@ -848,6 +883,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
+	long val = 0;
+
 	switch (attr) {
 	case hwmon_temp_emergency:
 		switch (channel) {
@@ -855,6 +892,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -865,13 +904,25 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
 		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
+		switch (channel) {
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+								channel)) ? 0444 : 0;
+		case CHANNEL_MCTRL:
+			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}
@@ -885,17 +936,29 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 	switch (attr) {
 	case hwmon_temp_input:
+		switch (channel) {
+		case CHANNEL_MCTRL:
+			return get_mc_temp(hwmon, val);
+		break;
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
 		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
 
 		/* HW register value is in degrees Celsius, convert to millidegrees. */
 		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
 		break;
+		default:
+			*val = 0;
+			return -EOPNOTSUPP;
+		}
+		break;
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -909,6 +972,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
+		case CHANNEL_MCTRL:
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -1278,6 +1342,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "pkg";
 		else if (channel == CHANNEL_VRAM)
 			*str = "vram";
+		else if (channel == CHANNEL_MCTRL)
+			*str = "mctrl_avg";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 16201da0cf6b..53d826e24273 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -69,6 +69,8 @@
 #define	READ_THERMAL_LIMITS			0x0
 #define	READ_THERMAL_CONFIG			0x1
 #define	READ_THERMAL_DATA			0x2
+#define TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
+#define TEMP_INDEX_MCTRL			0x2
 
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
-- 
2.25.1

