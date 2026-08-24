Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7176C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B2610E820;
	Mon, 24 Aug 2026 18:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIBGEyxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE6110E820
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787596991; x=1819132991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kPdsWW/caMbNsqFNRu9u3A3QjYjZeWuSavjnPkK4qY=;
 b=mIBGEyxSd9mrUvUkagg69UTbYkkKkZ3QsUbuGm/GNoXrLuhRQTYyo1IU
 wgY6BDUxQTo8LOHcgrU+i32S8tGhAJvZ9bf9pi8osGFGPDhJ2W4Em/3yu
 SOb2stQGPNGZ6TCSDxI8JW9Yn2pg5Anf0phmcnSAR15Rua/lOi8aw+N39
 jgnc47qf3AV/98KvUcodRRmcCLfqxXHuLt6UeHpytGzlNLOhFBn/TihSc
 iFRjeVlI3OaJKMJXsWI1FDn50D7+n3QwUWoxU/f5+y1o7z0GGFYqTI+cS
 zqZ9xrg2U6mYpnIotrNUICvN9f2nu8cjxjjcNjRj31JH/EpJvvpLqNDpz w==;
X-CSE-ConnectionGUID: dYay32KdQhaFVJUtZa38lA==
X-CSE-MsgGUID: EiyjxIQXQ/mSTQ6h8jBBFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110841015"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="110841015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:43:10 -0700
X-CSE-ConnectionGUID: 2hwRvWzBR7ShfKhjvhognw==
X-CSE-MsgGUID: b9YAqHdlSua0R5WdLLyxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="262776617"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:43:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
Date: Tue, 25 Aug 2026 00:11:35 +0530
Message-Id: <20260824184137.2164727-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824184137.2164727-1-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
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

Add is_temp_valid() to validate sensor presence.
A temperature reading of 0xFF on CRI platforms indicates that the
corresponding sensor is not present and should be treated as unavailable.

Use this check from xe_hwmon_temp_is_visible() callback so that attributes
for unavailable sensors are not exposed during hwmon device registration.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..2c4eba4b8f8f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -813,12 +813,21 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 value)
+{
+	/* Value of 0xFF indicates unavailable sensor for platforms from CRI. */
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+		return value != U8_MAX;
+	else
+		return value != 0;
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
@@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
-		average += hwmon->temp.value[i];
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
+			average += hwmon->temp.value[i];
+			count++;
+		} else {
+			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
+				i, hwmon->temp.value[i]);
+		}
+	}
+
+	if (!count) {
+		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");
+		return -ENXIO;
+	}
+
+	average /= count;
+	if (val)
+		*val = average * MILLIDEGREE_PER_DEGREE;
 
-	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
-	*val = average * MILLIDEGREE_PER_DEGREE;
 	return 0;
 }
 
@@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
 
 	data = REG_FIELD_GET(TEMP_MASK, data);
-	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+	if (!is_temp_valid(hwmon, data)) {
+		drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, val 0x%x\n", data);
+		return -ENXIO;
+	}
+
+	if (val)
+		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
 
 	return 0;
 }
@@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	int vram_id = channel - CHANNEL_VRAM_N;
 	struct xe_reg vram_reg;
+	u32 reg_val;
+	u8 temp;
 
 	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
-	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
+	if (!xe_reg_is_valid(vram_reg))
 		return false;
 
+	reg_val = xe_mmio_read32(mmio, vram_reg);
+	temp = REG_FIELD_GET(TEMP_MASK, reg_val);
+	if (!is_temp_valid(hwmon, temp)) {
+		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
+			reg_val);
+		return false;
+	}
+
 	/* Create label only for available vram channel */
 	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
 	return true;
@@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
+			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			return (is_vram_ch_available(hwmon, channel) &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
@@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_VRAM:
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
 		case CHANNEL_MCTRL:
+			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
+			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			return (is_vram_ch_available(hwmon, channel) &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
@@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_label:
 		switch (channel) {
 		case CHANNEL_PKG:
-		case CHANNEL_VRAM:
-			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
-								channel)) ? 0444 : 0;
+		case CHANNEL_VRAM: {
+			struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+			struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+			u32 reg_val;
+			u8 temp;
+
+			if (!xe_reg_is_valid(reg))
+				return 0;
+
+			reg_val = xe_mmio_read32(mmio, reg);
+			temp = REG_FIELD_GET(TEMP_MASK, reg_val);
+
+			return is_temp_valid(hwmon, temp) ? 0444 : 0;
+		}
 		case CHANNEL_MCTRL:
+			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_PCIE:
-			return hwmon->temp.count ? 0444 : 0;
+			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
-- 
2.25.1

