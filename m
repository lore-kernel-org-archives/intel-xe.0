Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A46ECC6B1D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B22810EF6D;
	Tue, 13 Oct 2026 18:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578BB10EC01
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917447; x=1823453447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHk7RMXBAtWb1CpEcF2q8IiK3YX6DvrkDp7BrF7mtV8=;
 b=TsOWl+JLv19KpoCjKWka6mQQFAzAvXrfLVGmWfgJ0A+qpL76pBzRkgVn
 eLegiRnD0fOQPUJ42UwgjagkUxHrWz9mcVPe4fIn7003lBxASkL1aYJhg
 3FgxMpk9ayfwvfVI4347DVHE/qbdNlzsl06+53rU340tg+4dCpPwQXgDK
 mHg/Cjm0ctuY3npdQEcI5nMLTKKdx2BI0Y+F54vb3Cdm26RjDnHPjdTHh
 IajFDUQRxBZFRPM2MtINda2dQKTkFkpjWRBvFM3DxskytFEjBcL2yzc/n
 OzO607uYBCc08FKNsStLUkD8V4SQtQafee0Lw8WoxKT+G2GqGumU/pUPU g==;
X-CSE-ConnectionGUID: lFAseS+0QTmvnMau0QProg==
X-CSE-MsgGUID: pEQZ0J4dSYaYRMbuwMX67w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545810"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:46 -0700
X-CSE-ConnectionGUID: t50125mETNePVHfnlgpDZg==
X-CSE-MsgGUID: hBdSDIPVTQW6M5fB9GV7Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596198"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:45 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 08/16] drm/xe/hwmon: Cache temperature availability to
 reduce probe time
Date: Wed, 14 Oct 2026 00:19:31 +0530
Message-Id: <20261013184939.694945-9-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013184939.694945-1-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
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
index b2f18a32487c..b6e2d20de2b7 100644
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
@@ -1011,7 +1013,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
-static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
+static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_reg reg;
@@ -1032,10 +1034,6 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 			return false;
 		}
 
-		if (channel >= CHANNEL_VRAM_N)
-			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
-				"vram_ch_%d", channel - CHANNEL_VRAM_N);
-
 		return true;
 	case CHANNEL_MCTRL:
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
@@ -1046,6 +1044,22 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
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
@@ -1055,11 +1069,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1069,11 +1083,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1081,7 +1095,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return (is_temp_available(hwmon, channel) &&
+			return (hwmon->temp.available[channel] &&
 				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
@@ -1094,7 +1108,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			return is_temp_available(hwmon, channel) ? 0444 : 0;
+			return hwmon->temp.available[channel] ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1642,8 +1656,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
-	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
-		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
+	xe_hwmon_init_temp_info(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
-- 
2.25.1

