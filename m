Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881BCC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E57C10E61B;
	Thu, 10 Sep 2026 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhWG/kIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2788010E61B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064932; x=1820600932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYKALSlFmaZLdRsGIQgessBW62ZTB/E7YxUta0BMiA0=;
 b=WhWG/kIgzRbTg61fgEA9a5sy/LC44NEeE3ycwje4UxOX4mCH+Tu0H7vM
 ZvfIuZfvI6IGv+WFGrt+arrLN6GMyaHkpuVJ1K9lW6lUco1nRT0FxS66z
 lNS4ykOH9FLfpsRcbFWU19JKe/W1dkaG1+BJMisBmgv7PyPm21Bxq9hxT
 v8BqLMZZ5yRMoQF8WoXu/IegHtCO27cQqMQFyUa1Pm8ZPiTMne27R/PVG
 V1J+dFXJ3Jo6/iIGQJyjF2CcU+IiSnPjuFvdhL/DJ+9bfxbIM6ppq1YDb
 vl7LshAZacrVqLmjy+Nqcrbj68+ztato81Q6sYRGcNy0HLxERdV9MzJqB A==;
X-CSE-ConnectionGUID: QtDOnHEqTFut7Ovjmqe/jw==
X-CSE-MsgGUID: beFAZXfjRsyBpquqAX9zOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397575"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:52 -0700
X-CSE-ConnectionGUID: ZRcNoJFoTnaUeI3meXMLlg==
X-CSE-MsgGUID: SPU1/sSQSXmxw5sBK3de0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296701050"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/5] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
Date: Thu, 10 Sep 2026 23:57:53 +0530
Message-Id: <20260910182756.638830-3-karthik.poosa@intel.com>
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

Read the number of VRAM temperature sensor channels from the second byte
of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
exposing hwmon attributes for unavailable VRAM temperature sensors, while
retaining the maximum supported channel count on non-CRI platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

v2:
 - Address review comments from sashiko-bot@kernel.org.
 - Address review comments from Badal and Raag.
 - Update HWMON_CHANNEL_INFO() to supports maximum VRAM channels of CRI.

v3:
 - Address review comments from sashiko-bot@kernel.org.
 - Address review comments from Rodrigo.

 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 115 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |   1 +
 5 files changed, 115 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f88bacf63c83..74037a9c32f7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -178,6 +178,10 @@ struct xe_device {
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
 		u8 has_fan_control:1;
+		/*
+		 * @info.has_fixed_vram_channels: Device has fixed VRAM temperature channel count.
+		 */
+		u8 has_fixed_vram_channels:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index faed2f5da394..a60a6a731d88 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
-#define MAX_VRAM_CHANNELS      (16)
+#define MAX_VRAM_CHANNELS	80
+#define FIXED_VRAM_CHANNELS	16
 
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
@@ -48,6 +49,7 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
+	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
 	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
 	CHANNEL_MAX,
 };
@@ -142,12 +144,14 @@ struct xe_hwmon_thermal_info {
 		/** @data: temperature limits in dwords */
 		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
 	};
-	/** @count: no of temperature sensors available for the platform */
+	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
 	u8 count;
+	/** @vram_count: number of VRAM temperature sensors available for the platform */
+	u8 vram_count;
 	/** @value: signed value from each sensor */
 	s8 value[U8_MAX];
-	/** @vram_label: vram label names */
-	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
+	/** @vram_label: vram label names, dynamically allocated based on vram_count */
+	char (*vram_label)[MAX_LABEL_SIZE];
 };
 
 /**
@@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
-			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe->info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
@@ -777,6 +781,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
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
@@ -794,6 +862,14 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	u32 config = 0;
 	int ret;
 
+	/*
+	 * Fixed-channel platforms don't derive the VRAM count from the mailbox
+	 * config, so set it up front to keep the sensors visible even if a read
+	 * below fails.
+	 */
+	if (hwmon->xe->info.has_fixed_vram_channels)
+		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
+
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
 			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
 	if (ret)
@@ -810,6 +886,16 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
 	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
 
+	if (!hwmon->xe->info.has_fixed_vram_channels) {
+		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
+		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
+			drm_warn(&hwmon->xe->drm,
+				 "VRAM channel count %d exceeds max %d, clamping\n",
+				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
+			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
+		}
+	}
+
 	return ret;
 }
 
@@ -1505,7 +1591,7 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
-		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
@@ -1634,6 +1720,15 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	xe_hwmon_get_preregistration_info(hwmon);
 
+	if (hwmon->temp.vram_count) {
+		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
+						      MAX_LABEL_SIZE, GFP_KERNEL);
+		if (!hwmon->temp.vram_label) {
+			ret = -ENOMEM;
+			goto err_null_hwmon;
+		}
+	}
+
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
 	/*  hwmon_dev points to device hwmon<i> */
@@ -1642,10 +1737,14 @@ int xe_hwmon_register(struct xe_device *xe)
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
index 1e04e8ef2611..d98b240e1753 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -416,6 +416,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_fixed_vram_channels = true,
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
@@ -794,6 +795,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
+	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index fed509ff601e..87b8121b3e51 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -42,6 +42,7 @@ struct xe_device_desc {
 	u8 has_display:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
+	u8 has_fixed_vram_channels:1;
 	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..e1079eff72c6 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -57,6 +57,7 @@
 #define   PCODE_THERMAL_INFO			0x25
 #define     READ_THERMAL_LIMITS			0x0
 #define     READ_THERMAL_CONFIG			0x1
+#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
 #define     READ_THERMAL_DATA			0x2
 #define       PCIE_SENSOR_GROUP_ID		0x2
 #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
-- 
2.25.1

