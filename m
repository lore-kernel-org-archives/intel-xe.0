Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A407CC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B05110EC01;
	Tue, 13 Oct 2026 18:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D0710EA67
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917446; x=1823453446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fa0prvWx7kPrZWOxhnJtovyr3dh/NTaVk+Ifhfix6Ag=;
 b=N3jE2JqwwCt1CTnBpNZuxVqnu1Cg3JkrBCl8pOGEtj0OzOQmj8l/4zpV
 6VDhHUFZQxHsLiYtj9XRG5qYcAwUIm8sPO+BwpREAv+ni/z1iA9Qz7WNo
 WYXyn48yYN2J1pXpEdDcj1I1h9cAf7pmXx7vWpt0ILJR1DgjXY8VOFeFU
 u4oxFpq0nFjqJp215BWv9R7x0gD043rxJaNaht7rZN8Fn6T+ACSK1DGhO
 PLru2QE+U8rssXj/XesCO/x1ifYD+qp/z1sdA0XwYdX04xgKazhTHqFyO
 p8fZ+aNzwf7vsEGkrVh6MgsmNtSkogJ99TGkLqabRXebUgX/I/4wCEQ1h w==;
X-CSE-ConnectionGUID: ys6cvSdpTuCmueejvWh0ow==
X-CSE-MsgGUID: PYCqXZg7SV2mFMqKdsu6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545798"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:44 -0700
X-CSE-ConnectionGUID: lAES+4ScSX2wMisC95PFFw==
X-CSE-MsgGUID: QPTOiC6jQ6i/faVe6ZXXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596190"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:42 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 07/16] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
Date: Wed, 14 Oct 2026 00:19:30 +0530
Message-Id: <20261013184939.694945-8-karthik.poosa@intel.com>
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

Replace is_vram_ch_available() with a generalized is_temp_available()
that validates PKG, VRAM, per-channel VRAM, memory controller and PCIe
sensors using the new validity helpers. Rename the existing callers to
the new helper.

Use is_temp_available() from xe_hwmon_temp_is_visible() so attributes for
sensors that are not present are not exposed during hwmon registration.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 64 ++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 4463f32c8d8c..b2f18a32487c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1011,19 +1011,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
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
+		if (!mmio_temp_valid(hwmon, reg_val)) {
+			drm_dbg(&hwmon->xe->drm,
+				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
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
@@ -1033,14 +1053,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1048,14 +1067,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1063,7 +1081,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1072,13 +1091,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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

