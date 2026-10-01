Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CF4CA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60810E466;
	Thu,  1 Oct 2026 19:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBuBOo2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783410E025
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884316; x=1822420316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pD55r3iJ3nUUcvVD2DMBIOvTtykHHL7u8ZzYZ2fKSZU=;
 b=DBuBOo2uFZ867QfoX4SkaH2/bN+4iFChV9pD80nF2B2YR3/R1DTn+moR
 tW6wvz9jca2SlxUikV0k3TAmLNX8sI6sLq5azuGQTbvTo4WBJ4/BAwZkM
 i/HtnfQ7XTSLfIbT3+g1CmoW7EjymcOLDB6ACwuZZuoUQqSqaJJDNJ3+D
 nBvLg5U/lSCnLtXuB3b6fYF3uCNxErBjbLQp6xf4NHvBiKhZayHE41CHx
 rb5qCJa5QzkGarCBeovYTAPuPeykTXhkxVqG5qg0cgleHSM+Va5mD6PQq
 S9j6/jQKq5lXH+wb1iKs7ZYU9LeGw1pchgF/hXW/AQay8h0qMXI4Rmr0b w==;
X-CSE-ConnectionGUID: Ck4C/6oaQamOT+8xf1lewg==
X-CSE-MsgGUID: Rnbmd7+YSJ+PWQRn2Yrt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177913"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177913"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:44 -0700
X-CSE-ConnectionGUID: Mcg4rioLRXKFkrzyGWM0Iw==
X-CSE-MsgGUID: 7BkxXP1jTJKe76HWrMlEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893813"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:41 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 08/15] drm/xe/hwmon: Cache temperature availability to
 reduce probe time
Date: Fri,  2 Oct 2026 01:20:26 +0530
Message-Id: <20261001195033.3466205-9-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

Avoid probing temperature sensor availability from the hwmon is_visible()
callback. For MCTRL and PCIe channels, that path can trigger repeated
blocking mailbox reads while sysfs attributes are being created, increasing
probe time and making attribute creation sensitive to transient failures.

Probe temperature availability once during preregistration and cache the
result for subsequent visibility checks.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 39 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 11d2413c3271..841868cb5e05 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -146,6 +146,8 @@ struct xe_hwmon_thermal_info {
 	};
 	/** @count: no of temperature sensors available for the platform */
 	u8 count;
+	/** @available: temperature sensor availability cached at registration */
+	bool available[CHANNEL_MAX];
 	union {
 		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
 		u8 value[U8_MAX + 1];
@@ -1001,7 +1003,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
-static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
+static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_reg reg;
@@ -1022,10 +1024,6 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 			return false;
 		}
 
-		if (channel >= CHANNEL_VRAM_N)
-			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
-				"vram_ch_%d", channel - CHANNEL_VRAM_N);
-
 		return true;
 	case CHANNEL_MCTRL:
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
@@ -1036,6 +1034,22 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 	}
 }
 
+static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
+{
+	int channel;
+
+	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
+		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
+
+	for (channel = 0; channel < CHANNEL_MAX; channel++) {
+		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
+		if (hwmon->temp.available[channel] &&
+		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
+				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
+	}
+}
+
 static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -1045,11 +1059,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
 		case CHANNEL_VRAM:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1059,11 +1073,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_PKG:
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
 		case CHANNEL_VRAM:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1071,7 +1085,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1084,7 +1098,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return is_temp_available(hwmon, channel) ? 0444 : 0;
+			return hwmon->temp.available[channel] ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1626,8 +1640,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
-	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
-		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
+	xe_hwmon_init_temp_info(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
-- 
2.25.1

