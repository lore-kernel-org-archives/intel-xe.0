Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE71C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7F610F300;
	Wed,  2 Sep 2026 17:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNNz9fuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4910F300
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371809; x=1819907809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DOM9clHgbP8keNzatyD+SBkCMgT1sLorm5U82UGVvXc=;
 b=bNNz9fuJuNE19qE3qeEq9wL8tfyR9s3KAPoirrEe+u9WSnlDrkVQ62wq
 u6Xp1Cpn3GAMaDRLqAW1q/TRZsgCU0BF+pxnXsp6oij77i1UGX0dpIBxz
 LyxbXfb4EWGOS5NOaTnhtCRy/pyJUElG++YVr3ovv+/uH/KUeUWk5oYh2
 95T1iNgPusJnUstyafaRbcD+2XcFWHQIxSWka0LhmXqx7xruK1o8VIL83
 wAZZQpQQuZcsogXJAHLwedqzpwlyMQ14e/LO8X/B+4m0d1+MJfJ2wBGef
 B9Xp9v53oDKtghFpCqLV8xNj1MeXBDvW1MB6cJWoyHp/9H/RU+IxYCGLY A==;
X-CSE-ConnectionGUID: bnIBTXUQQluOrjlDlSOsCA==
X-CSE-MsgGUID: HOwO+NYwT0eKIwUrDbZubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76393488"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="76393488"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:49 -0700
X-CSE-ConnectionGUID: tYv3OUWVR96pLexWE5F20w==
X-CSE-MsgGUID: /xnAraMOR0yZMo3EigtlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273638032"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:47 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/5] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
Date: Wed,  2 Sep 2026 23:25:04 +0530
Message-Id: <20260902175507.3910573-3-karthik.poosa@intel.com>
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

 drivers/gpu/drm/xe/xe_hwmon.c     | 102 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pcode_api.h |   1 +
 2 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9433b47a19c8..a7c04c25e1c2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
-#define MAX_VRAM_CHANNELS      (16)
+#define XE_MAX_VRAM_CHANNELS	(80)
+#define BMG_MAX_VRAM_CHANNELS	(16)
 
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
@@ -48,7 +49,8 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
-	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
+	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + XE_MAX_VRAM_CHANNELS - 1,
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
@@ -810,6 +878,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
 	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
 
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
+		if (hwmon->temp.vram_count > XE_MAX_VRAM_CHANNELS) {
+			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
+				 hwmon->temp.vram_count, XE_MAX_VRAM_CHANNELS);
+			hwmon->temp.vram_count = XE_MAX_VRAM_CHANNELS;
+		}
+	} else {
+		hwmon->temp.vram_count = BMG_MAX_VRAM_CHANNELS;
+	}
+
 	return ret;
 }
 
@@ -1507,7 +1586,7 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "mctrl";
 		else if (channel == CHANNEL_PCIE)
 			*str = "pcie";
-		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
 			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
@@ -1636,6 +1715,15 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	xe_hwmon_get_preregistration_info(hwmon);
 
+	if (hwmon->temp.vram_count) {
+		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
+						      MAX_LABEL_SIZE, GFP_KERNEL);
+		if (!hwmon->temp.vram_label) {
+			xe->hwmon = NULL;
+			return -ENOMEM;
+		}
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

