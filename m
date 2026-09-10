Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F05AC79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE0C10E61A;
	Thu, 10 Sep 2026 18:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXDGFCDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E672310E61A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064929; x=1820600929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iaEtkVUljFFF6OiWUI4QlbDo/nYphPn3Oh05+n9Tyco=;
 b=KXDGFCDWXIqkgqczFn5tcSOhX6O1bjUSGCbMe1G7Gt8BqYrf/tYNRkKx
 TTVcZOQ+UY99g24xOLE1GY5C53NRRozdc6dGKx1vWEcY8uZuGLPQCaoKo
 qAzzsBIH0XrGIZBnYv6+gm0nEoYgLVEjmcIOY82jhGnTjWGl6ew4FLBEt
 +hzTAE9UlcMXobO6vU4A0GIjVIyVAayzNnFXcCgeMuVOAvnmMsjbpeFZa
 xwmAMhRXUAecQwJcsdoZijTQMAQHjEnUi4xodKRJI1TOMkGuSuNUyo1KY
 Wx3VX6nzaw3nC0/CX4Mu9mz0tOqm8rvvH7vgUbWRjfLPKmTKJEp8O4mKb g==;
X-CSE-ConnectionGUID: 9mxJH64CSpGfqR6HMBE7tA==
X-CSE-MsgGUID: c+BUVebGReOqne+Rtlc1Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397571"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:49 -0700
X-CSE-ConnectionGUID: Nq4D0lYLQV6k92anOyltFQ==
X-CSE-MsgGUID: wmjBMmXMRSyaTHwEJ+2dJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296701018"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 1/5] drm/xe/hwmon: Detect unavailable temperature sensors
Date: Thu, 10 Sep 2026 23:57:52 +0530
Message-Id: <20260910182756.638830-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
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

Add is_temp_available() to validate sensor presence.
A temperature reading of 0xFFFFFFF on MMIO and 0xFF from mailbox on CRI
platforms indicates that the corresponding sensor is not present and
should be treated as unavailable.

Use this check from xe_hwmon_temp_is_visible() callback so that attributes
for unavailable sensors are not exposed during hwmon device registration.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
v2:
 - Address review comments from sashiko-bot@kernel.org.
 - Address review comments for Badal, Raag.
 - Update is_temp_valid() to check values based on mailbox or MMIO.
 - Add is_temp_is_visible().
 - Update is_vram_ch_available() to is_temp_available() to check if sensor
   is present.

v3:
 - Rephrase a debug log.

 drivers/gpu/drm/xe/xe_hwmon.c | 100 ++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..faed2f5da394 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -813,12 +813,20 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u32 value, bool is_mmio)
+{
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+		return value != (is_mmio ? U32_MAX : U8_MAX);
+
+	return value != 0;
+}
+
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 *dword = (u32 *)hwmon->temp.value;
+	int ret, i, count = 0;
 	s32 average = 0;
-	int ret, i;
 
 	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
@@ -828,11 +836,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+		if (!is_temp_valid(hwmon, hwmon->temp.value[i], false))
+			continue;
 		average += hwmon->temp.value[i];
+		count++;
+	}
+
+	if (!count) {
+		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
+		return -ENXIO;
+	}
+
+	average /= count;
+
+	if (val)
+		*val = average * MILLIDEGREE_PER_DEGREE;
 
-	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
-	*val = average * MILLIDEGREE_PER_DEGREE;
 	return 0;
 }
 
@@ -852,7 +872,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
 
 	data = REG_FIELD_GET(TEMP_MASK, data);
-	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+	if (!is_temp_valid(hwmon, data, false)) {
+		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
+		return -ENXIO;
+	}
+
+	if (val)
+		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
 
 	return 0;
 }
@@ -951,19 +977,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
-static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
-	int vram_id = channel - CHANNEL_VRAM_N;
-	struct xe_reg vram_reg;
+	struct xe_reg reg;
+	u32 reg_val;
 
-	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
-	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
-		return false;
+	switch (channel) {
+	case CHANNEL_PKG:
+	case CHANNEL_VRAM:
+	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+		if (!xe_reg_is_valid(reg))
+			return false;
+
+		reg_val = xe_mmio_read32(mmio, reg);
+		if (!is_temp_valid(hwmon, reg_val, true)) {
+			drm_dbg(&hwmon->xe->drm,
+				"channel %d temperautre unavailable, val 0x%x\n", channel, reg_val);
+			return false;
+		}
+
+		if (channel >= CHANNEL_VRAM_N)
+			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
+				"vram_ch_%d", channel - CHANNEL_VRAM_N);
 
-	/* Create label only for available vram channel */
-	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
-	return true;
+		return true;
+	case CHANNEL_MCTRL:
+		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
+	case CHANNEL_PCIE:
+		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
+	default:
+		return false;
+	}
 }
 
 static umode_t
@@ -973,14 +1019,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
-		case CHANNEL_VRAM:
-			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
+		case CHANNEL_VRAM:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return (is_vram_ch_available(hwmon, channel) &&
+			return (is_temp_available(hwmon, channel) &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
 		default:
 			return 0;
@@ -988,14 +1033,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_crit:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
-		case CHANNEL_VRAM:
-			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
+		case CHANNEL_VRAM:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return (is_vram_ch_available(hwmon, channel) &&
+			return (is_temp_available(hwmon, channel) &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1003,7 +1047,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1012,13 +1057,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_VRAM:
-			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
-								channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
+			return is_temp_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
-- 
2.25.1

