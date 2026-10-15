Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9ECCC6B2F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 07:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBF61120E3;
	Thu, 15 Oct 2026 07:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F2F1120F5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 07:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792048571; x=1823584571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YzVD/nGUvNq8X55G7obCnS3vdD62t+0oVSmMlOVjkc=;
 b=N9R8xjDbAKjbWNfv03fjm32KxrT/uh/jvTmyNVGUDSbexPQgIKwt/iuq
 IoSXzCRn21uMb5/3jUFo7w7r4+fAhkfictfOKR5pxpHblmCjS5GrHYtiz
 pBzayVzghW3jNlDgKmQhF/KmO2NIo32mxGO8cU7HUf7lMN6cEcoW/ASBg
 mbojmTqevHQfTF4+n2k+b9u8fH+nFtASzc5IgR71EQFC9tuKppqsKSWWA
 JIDqBUP+w/LokdA54RKLlYOJ1PD/j0duQPzvQ324Wh/Xg0UbwbNJy8Tb9
 hRMVSzhxsWNFeMoA+7bQgOeojIEyoemr84+WjKJRGXumV1h+7FGglAr3U A==;
X-CSE-ConnectionGUID: XQlwNT1/Sq6OFzrgYhSoEA==
X-CSE-MsgGUID: PFHocRG5RLedSVG6o11RhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="707184"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="707184"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:16:11 -0700
X-CSE-ConnectionGUID: vWfpSzgeSaeStQ8kXLFV5g==
X-CSE-MsgGUID: iKvBbqOfShuE/fzsKsrKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1509051"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:16:09 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v14 15/16] drm/xe: Validate thermal sensor count before reads
Date: Thu, 15 Oct 2026 12:44:33 +0530
Message-Id: <20261015071434.1063785-16-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015071434.1063785-1-karthik.poosa@intel.com>
References: <20261015071434.1063785-1-karthik.poosa@intel.com>
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

Check that READ_THERMAL_CONFIG reports enough thermal entries for the
platform-specific MCTRL range and PCIe sensor index before reading
READ_THERMAL_DATA.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 44 ++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ef3b930d3483..221d7a3bd7dc 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -941,6 +941,17 @@ static int mbx_temp_decode(u8 value)
 	return (value & TEMP_MBX_SIGN) ? -temp : temp;
 }
 
+static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
+{
+	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
+		return CRI_TEMP_INDEX_PCIE;
+
+	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
+		return BMG_G21_TEMP_INDEX_PCIE;
+
+	return TEMP_INDEX_PCIE;
+}
+
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -956,7 +967,14 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
 	} else {
 		start = TEMP_INDEX_MCTRL;
-		end = hwmon->temp.count - 1;
+		end = min_t(int, hwmon->temp.count - 1, xe_hwmon_pcie_temp_index(hwmon));
+	}
+
+	if (end <= start || end > hwmon->temp.count) {
+		drm_warn(&hwmon->xe->drm,
+			 "memory controller range [%d, %d) is invalid for temperature count %d\n",
+			 start, end, hwmon->temp.count);
+		return -ENODATA;
 	}
 
 	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
@@ -988,30 +1006,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
-static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
-{
-	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
-		return CRI_TEMP_INDEX_PCIE;
-
-	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
-		return BMG_G21_TEMP_INDEX_PCIE;
-
-	return TEMP_INDEX_PCIE;
-}
-
 static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 data = 0;
+	int index;
 	int ret;
 
+	index = xe_hwmon_pcie_temp_index(hwmon);
+	if (index >= hwmon->temp.count) {
+		drm_warn(&hwmon->xe->drm,
+			 "PCIe temperature index %d out of range for temperature count %d\n",
+			 index, hwmon->temp.count);
+		return -ENODATA;
+	}
+
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
+						  index / sizeof(data)),
 						  &data, NULL);
 	if (ret)
 		return ret;
 
-	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
+	data >>= (index % sizeof(data)) * BITS_PER_BYTE;
 	data = REG_FIELD_GET(TEMP_MASK, data);
 	if (!mbx_temp_valid(hwmon, data)) {
 		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
-- 
2.25.1

