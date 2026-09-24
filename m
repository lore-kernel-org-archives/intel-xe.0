Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D94C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF1E10E1F9;
	Thu, 24 Sep 2026 20:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3MjO7aS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319F510E1F9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283340; x=1821819340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DL0lTm4Lx4rb51EqUtnbkHoe3ZFiISho/MPan9tJuLk=;
 b=f3MjO7aS6a4PpuWxteTSG21IGIKZlyA0xbe1Xr1jC0RTyQHqZsnhJ61/
 XmwFJfu4It57Y5FqhMOc4RUHqJKgyqzj+0rcoyyDYNqlpVXK1D6IctVZD
 3lRn0pyBHjKlh3/+0D4H/m0Sm3eHzHzfABof4LK8WjKT20Un0JwPRwzC8
 0LgZLgp6B4/lAx/0ytfTL235vMeVFuvgHOHOnzwXrk6+Nrrhw3XoYXok5
 +puk7ttiMtz7gzb59LXiGO+wtYIRxzZCtlSQwCP7ardrrw2ZMDeAeEJ0f
 ScEXqJDuX7jIjxQZIBH0ap3jtrlnDTu3dGDHfH3DfYnlOwvQCQSsBs0Nn g==;
X-CSE-ConnectionGUID: UgOSXhDHS/GnR8iRpZTTnw==
X-CSE-MsgGUID: +2qf1YyKT4CtWpUN4RKUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886185"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886185"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:40 -0700
X-CSE-ConnectionGUID: RkqgGQRsTDOfIFqcU8CwzQ==
X-CSE-MsgGUID: tJlVB5g7RtiL7MP5nDfi6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347379"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:37 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 07/13] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
Date: Fri, 25 Sep 2026 02:24:23 +0530
Message-Id: <20260924205429.2846256-8-karthik.poosa@intel.com>
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

Replace is_vram_ch_available() with a generalized is_temp_available()
that validates PKG, VRAM, per-channel VRAM, memory controller and PCIe
sensors using the new validity helpers. Rename the existing callers to
the new helper.

Use is_temp_available() from xe_hwmon_temp_is_visible() so attributes for
sensors that are not present are not exposed during hwmon registration.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c | 64 ++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 4a7cf913e6c8..052b25a233d6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1002,19 +1002,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
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
@@ -1024,14 +1044,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1039,14 +1058,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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
@@ -1054,7 +1072,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_temp_max:
 		switch (channel) {
 		case CHANNEL_PKG:
-			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
+			return (is_temp_available(hwmon, channel) &&
+				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -1063,13 +1082,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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

