Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E7CC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2DA10F78E;
	Thu, 24 Sep 2026 20:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo1l9f7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94810E1F9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283343; x=1821819343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjOH2Ebvxe7LvszJ0+dH9MQKZWDWsRVyAKXfBLt+i0g=;
 b=Mo1l9f7X1mZC2/f12c/lCQKVn/aX0lerJRnsn5C+xityQ2U8b6VRbWjd
 McNTDRUglOnvK93WYI/Pb3S4CfhfPra8nwk6O8IqZOiPaBAzv3quaN4eS
 Q9FH0tdWBQmL/6rJvO6ErCXvF4q1IwQ6bvUYz68MHC5F8m/qydK2DhCy/
 E99eQiEGvGXe1vJRZmx5ScFs3VhFpAoGyKZFDcQIhffND8vSb/cksO4MW
 86VAQEE27Qum15WmZbuSMiXZ6AmyWOY2DOu99EnKzfjfIg/h/BebuOhg5
 d63H8BslMD3uqfSWyh3He4typu24rfj9jTHSMdzcgzaxB8c5kHAACHwRe g==;
X-CSE-ConnectionGUID: zJI6oG1BShOUL1bmEm4dtA==
X-CSE-MsgGUID: f+5pEcoORXGUmGlWvoKhCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886190"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:43 -0700
X-CSE-ConnectionGUID: FPUzf2yMSAW59p0kp7nylw==
X-CSE-MsgGUID: JhZHyLBTTpCxqqn28pSfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347406"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:40 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 08/13] drm/xe/hwmon: Cache temperature availability to
 reduce probe time
Date: Fri, 25 Sep 2026 02:24:24 +0530
Message-Id: <20260924205429.2846256-9-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924205429.2846256-1-karthik.poosa@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c | 39 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 052b25a233d6..92280248f1e9 100644
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
@@ -1002,7 +1004,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
-static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
+static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_reg reg;
@@ -1023,10 +1025,6 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 			return false;
 		}
 
-		if (channel >= CHANNEL_VRAM_N)
-			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
-				"vram_ch_%d", channel - CHANNEL_VRAM_N);
-
 		return true;
 	case CHANNEL_MCTRL:
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
@@ -1037,6 +1035,22 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
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
@@ -1046,11 +1060,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1060,11 +1074,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1072,7 +1086,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1085,7 +1099,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return is_temp_available(hwmon, channel) ? 0444 : 0;
+			return hwmon->temp.available[channel] ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1627,8 +1641,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
-	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
-		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
+	xe_hwmon_init_temp_info(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
-- 
2.25.1

