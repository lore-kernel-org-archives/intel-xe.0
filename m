Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1246C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBB910E818;
	Mon, 24 Aug 2026 18:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwJN7f0b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ECB10E818
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787596997; x=1819132997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6vsr91+0xrwmso8MD55+Gx2q1nDNE+o8W+yTI1d8ymk=;
 b=WwJN7f0bb1aYqaDntkQsLuRwxNspArgt34ApPpDNhOHe6jWc14s+8xhg
 e7LO6ocelTXHWsu98B1nTbFaCo5uSf5Mg4/nT+to8stTECpINPbuxjOUs
 h4yMyefMW/Gbq1CZiUmTEDsDFR/lSaiZ6Kav3amZxX+5rUAOsRrORrx1R
 qVMXlrq8CQP0EfAGMeHRrlFCgLz+z01MEv92WX8XzrA7c4pOYgLZmSnhj
 6wlIB1W8fg4xePdYG0GLmKoM5klVM3pXRM7U8sK9O6WaJwhHP5pnJ3Fgk
 DXzNr5l3zDQknJSHzgJxNUwNgKgpTvAnvjyc3VIZEaiMCvNzsQvuDMysN g==;
X-CSE-ConnectionGUID: zB9WsO5rTrWe2dPtWIqomQ==
X-CSE-MsgGUID: 9n4qb3qMRqiGcgi7u7JZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110841022"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="110841022"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:43:16 -0700
X-CSE-ConnectionGUID: EwcOMTpqR/+RU3wwj9L0EA==
X-CSE-MsgGUID: WveDpjhgR/2RSXkcn6i3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="262776637"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:43:13 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
Date: Tue, 25 Aug 2026 00:11:36 +0530
Message-Id: <20260824184137.2164727-7-karthik.poosa@intel.com>
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

Read the number of VRAM temperature sensor channels from the second byte
of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
exposing hwmon attributes for unavailable VRAM temperature sensors, while
retaining the maximum supported channel count on non-CRI platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 35 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2c4eba4b8f8f..6e7cb250e628 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
-#define MAX_VRAM_CHANNELS      (16)
+/* Maximum number of VRAM channels supported by Xe */
+#define MAX_VRAM_CHANNELS      (80)
 
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
@@ -144,10 +146,12 @@ struct xe_hwmon_thermal_info {
 	};
 	/** @count: no of temperature sensors available for the platform */
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
@@ -810,6 +814,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
 	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
 
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
+		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {
+			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
+				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
+			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
+		}
+	} else {
+		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */
+	}
+
 	return ret;
 }
 
@@ -988,6 +1003,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
 	u32 reg_val;
 	u8 temp;
 
+	if (vram_id >= hwmon->temp.vram_count)
+		return false;
+
 	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
 	if (!xe_reg_is_valid(vram_reg))
 		return false;
@@ -1516,7 +1534,7 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
-		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
@@ -1645,6 +1663,13 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	xe_hwmon_get_preregistration_info(hwmon);
 
+	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
+					      MAX_LABEL_SIZE, GFP_KERNEL);
+	if (!hwmon->temp.vram_label) {
+		xe->hwmon = NULL;
+		return -ENOMEM;
+	}
+
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
 	/*  hwmon_dev points to device hwmon<i> */
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

