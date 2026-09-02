Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1D2C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E917810E3FC;
	Wed,  2 Sep 2026 17:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM5fYDfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0F10E3FC
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371807; x=1819907807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rM3OXm6+9vL6SgwWGUNrYeEOL1zv968P7NOEQvxtTLw=;
 b=OM5fYDfUsNHubB5fpoPrHCA6AphS8lXAGWeb+5D/ImA9Dgm1JeHr4h/h
 tsGbhSIuamVFMgbzh92g81oFLr3Wl9FZHrDX55Q3bDs/abU+tgBH5J22+
 hBFGOdx7QXDMp01L3n1c+mLqKixNfnnmYgums9q21OuCIx7dWQ7jRzOG/
 eb4rJLHX4yVU3EJqZI6wwj2FqVpM7JZPlhLdsWNtVGEAcx3kthjTGQLC8
 WxpoJlNKtoTNqshhiaaPrDNFJKRi6qX4bt6SUA8kPBjxIKWeTnmbsrBgf
 5+TTwKDtj3vNqCsi+aL2blzICZlJrUwvQwhmEP3K6lMi3pxHTO91ePvcA A==;
X-CSE-ConnectionGUID: 0YZYfeKqRSCHL2DP7Mu3Ng==
X-CSE-MsgGUID: a6HDfuBiRgC9DQ/+mKjpkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76393487"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="76393487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:46 -0700
X-CSE-ConnectionGUID: BvUiPHL1QcG+Eb+HUor7jQ==
X-CSE-MsgGUID: X4u2mTn4QrWW4g7CP9g4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273638025"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:44 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/5] drm/xe/hwmon: Detect unavailable temperature sensors
Date: Wed,  2 Sep 2026 23:25:03 +0530
Message-Id: <20260902175507.3910573-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902175507.3910573-1-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
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

 drivers/gpu/drm/xe/xe_hwmon.c | 102 ++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..9433b47a19c8 100644
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
@@ -951,19 +977,41 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
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
 
-	/* Create label only for available vram channel */
-	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
-	return true;
+		reg_val = xe_mmio_read32(mmio, reg);
+		if (!is_temp_valid(hwmon, reg_val, true)) {
+			if (channel >= CHANNEL_VRAM_N)
+				drm_dbg(&hwmon->xe->drm,
+					"vram channel %d unavailable, val 0x%x\n",
+					channel - CHANNEL_VRAM_N, reg_val);
+			return false;
+		}
+
+		if (channel >= CHANNEL_VRAM_N)
+			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
+				"vram_ch_%d", channel - CHANNEL_VRAM_N);
+
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
@@ -973,14 +1021,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -988,14 +1035,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1003,7 +1049,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1012,13 +1059,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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

