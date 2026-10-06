Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C20CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91E10E10C;
	Tue,  6 Oct 2026 03:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNmMW62D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C2710E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791257818; x=1822793818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Oz0Umo7wTFkvppcZb0afi+WlMHh2Goy4Exh8YXzius=;
 b=BNmMW62DRN+PCZ5AgDwEqBxlYVgmZT+g3f8/VIxg2Hh9Lq2/Gl6aW/1C
 +490NrQ3iFwp0FvcM5Yx55Y35gFK2Ir9/wcNUMuBhtGHAWah56LBJcRVP
 n1+3thYwYnQqFPEpmhCTXJ8+9jbvjbFVclPhZoQNi0xMFV5vJH9E2GrrC
 sJ1JRsY+q/zFa3o4mFjd+Wk+mLSrEQPymfHGsaotIAxfq0dxo64IAA73n
 YFsEkcKh8SEHFdrEuz1xgn4D0M9AHLDTVvsO62wVBQ9JYmDYSZWf0CfOm
 gy1RJ7LnrhJZKB+HK5S+VAZhnQvpgpb3FFuSIa9l4LyrdCjQ80y/7RUqX A==;
X-CSE-ConnectionGUID: dkVg/eUmTJGj8BYJxrT/Dg==
X-CSE-MsgGUID: HZCJ2hHuQSmCbotUdErebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427415"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94427415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:58 -0700
X-CSE-ConnectionGUID: MdK1SGVzQD2W+HjosrZDuQ==
X-CSE-MsgGUID: XXqLvnkaR/mFJmqYDZ9PHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273400972"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:36:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 10/15] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
Date: Tue,  6 Oct 2026 09:05:29 +0530
Message-Id: <20261006033534.3583967-11-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006033534.3583967-1-karthik.poosa@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On CRI, derive the number of available VRAM temperature channels from the
CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
VRAM_CHANNELS_PER_MSU channels.
 
Increase the maximum supported VRAM channel count to 80 and use the
derived count to control VRAM sensor enumeration, channel access, and
VRAM label allocation. Add a has_fixed_vram_channels platform flag to
preserve the existing fixed-channel behavior on non-CRI platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   1 +
 drivers/gpu/drm/xe/xe_device_types.h    |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 164 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pci.c             |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
 5 files changed, 154 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index a969661f0c95..d9e4847dd68e 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -28,6 +28,7 @@
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
 #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
 #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
 #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index beb0ceaabb3f..161ba2b27f47 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -185,6 +185,8 @@ struct xe_device {
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
 		u8 has_fan_control:1;
+		/** @info.has_fixed_vram_channels: Device has fixed VRAM temperature channels */
+		u8 has_fixed_vram_channels:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index bafa175f8457..9d83d9d2286e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
-#define MAX_VRAM_CHANNELS      (16)
+#define MAX_VRAM_CHANNELS	80
+#define FIXED_VRAM_CHANNELS	16
+
+/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
+#define VRAM_CHANNELS_PER_MSU	4
 
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
@@ -48,6 +52,7 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
+	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
 	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
 	CHANNEL_MAX,
 };
@@ -144,18 +149,22 @@ struct xe_hwmon_thermal_info {
 		/** @data: temperature limits in dwords */
 		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
 	};
-	/** @count: no of temperature sensors available for the platform */
+	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
 	u8 count;
+	/** @vram_count: exclusive upper bound for VRAM temperature channel indices */
+	u8 vram_count;
 	/** @available: temperature sensor availability cached at registration */
 	bool available[CHANNEL_MAX];
+	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
+	u32 msu_mask;
 	union {
 		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
 		u8 value[U8_MAX + 1];
 		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
 		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
 	};
-	/** @vram_label: vram label names */
-	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
+	/** @vram_label: vram label names, dynamically allocated based on vram_count */
+	char (*vram_label)[MAX_LABEL_SIZE];
 };
 
 /**
@@ -269,6 +278,14 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 	return ret;
 }
 
+static bool xe_hwmon_vram_channel_enabled(const struct xe_hwmon *hwmon, int index)
+{
+	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
+		return hwmon->temp.msu_mask & BIT(index / VRAM_CHANNELS_PER_MSU);
+
+	return true;
+}
+
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
 				      int channel)
 {
@@ -281,14 +298,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return CRI_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return CRI_VRAM_TEMPERATURE;
-			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
+				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
 				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe->info.platform == XE_BATTLEMAGE) {
 			if (channel == CHANNEL_PKG)
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
-			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
+				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
 				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
@@ -800,6 +819,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -814,15 +897,37 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 config = 0;
 	int ret;
 
+	/*
+	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
+	 * set the count up front so those sensors stay visible even if the thermal
+	 * mailbox reads below fail.
+	 */
+	if (hwmon->xe->info.has_fixed_vram_channels)
+		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
+
+	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
+		hwmon->temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
+		hwmon->temp.vram_count = fls(hwmon->temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
+		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel bound %d\n",
+			hwmon->temp.msu_mask, hwmon->temp.vram_count);
+		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
+			drm_warn(&hwmon->xe->drm,
+				 "VRAM channel bound %d exceeds max %d, clamping\n",
+				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
+			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
+		}
+	}
+
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
 			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
 	if (ret)
 		return ret;
 
-	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
+	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%08x val1 0x%08x\n",
 		hwmon->temp.data[0], hwmon->temp.data[1]);
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
@@ -1031,6 +1136,14 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 		if (!xe_reg_is_valid(reg))
 			return false;
 
+		/*
+		 * On CRI, VRAM channel presence comes from the MSU enable mask
+		 * (applied in xe_hwmon_get_reg()); the temperature register's
+		 * 0xffffffff sentinel is not reliable for VRAM channels.
+		 */
+		if (hwmon->xe->info.platform == XE_CRESCENTISLAND && channel >= CHANNEL_VRAM_N)
+			return true;
+
 		reg_val = xe_mmio_read32(mmio, reg);
 		if (!mmio_temp_valid(hwmon, reg_val)) {
 			drm_dbg(&hwmon->xe->drm,
@@ -1048,20 +1161,31 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 	}
 }
 
-static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
+static int xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
 {
+	struct device *dev = hwmon->xe->drm.dev;
 	int channel;
 
 	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
 		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
 
+	/* vram_count is known only after reading thermal info above. */
+	if (hwmon->temp.vram_count) {
+		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
+						      MAX_LABEL_SIZE, GFP_KERNEL);
+		if (!hwmon->temp.vram_label)
+			return -ENOMEM;
+	}
+
 	for (channel = 0; channel < CHANNEL_MAX; channel++) {
 		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
-		if (hwmon->temp.available[channel] &&
-		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+		if (hwmon->temp.available[channel] && hwmon->temp.vram_label &&
+		    in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
 				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
 	}
+
+	return 0;
 }
 
 static umode_t
@@ -1557,8 +1681,10 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
-		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
+		else
+			return -EOPNOTSUPP;
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
@@ -1586,7 +1712,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 	.info = hwmon_info,
 };
 
-static void
+static int
 xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
@@ -1654,7 +1780,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
-	xe_hwmon_init_temp_info(hwmon);
+	return xe_hwmon_init_temp_info(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
@@ -1683,7 +1809,9 @@ int xe_hwmon_register(struct xe_device *xe)
 	hwmon->xe = xe;
 	xe->hwmon = hwmon;
 
-	xe_hwmon_get_preregistration_info(hwmon);
+	ret = xe_hwmon_get_preregistration_info(hwmon);
+	if (ret)
+		goto err_null_hwmon;
 
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
@@ -1693,10 +1821,14 @@ int xe_hwmon_register(struct xe_device *xe)
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
 		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
-		xe->hwmon = NULL;
-		return PTR_ERR(hwmon->hwmon_dev);
+		ret = PTR_ERR(hwmon->hwmon_dev);
+		goto err_null_hwmon;
 	}
 
 	return 0;
+
+err_null_hwmon:
+	xe->hwmon = NULL;
+	return ret;
 }
 MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 111d0aa45b10..e754668100cf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -417,6 +417,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_fixed_vram_channels = true,
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
@@ -798,6 +799,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_device_uid = desc->has_device_uid;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
+	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 15eedac8467a..ce0b0f6c5b18 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -43,6 +43,7 @@ struct xe_device_desc {
 	u8 has_device_uid:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
+	u8 has_fixed_vram_channels:1;
 	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
-- 
2.25.1

