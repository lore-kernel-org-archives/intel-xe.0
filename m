Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A42CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8E10FD10;
	Wed, 14 Oct 2026 11:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1171210FD2E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979178; x=1823515178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mM0IsnoyqH7eMl3xYyG2WuzHHwp1+bz37vV2XoWF2Xw=;
 b=dgX5RoeCqnqHdRKPoVy0lzd5tLLAAFaFJyygoqscC1wg9nfVY4b/7FDl
 Ub77KfrnIlM4mWt1kxZoEsavxAHEQB45waKeDvHpH1Y57Rx+6O8Z8/X4v
 a0A81uUHorfq5fYH9PEi8oLoPSpTLgsDg5ObbdUl6DpkitlhYGad0vFdj
 UiSgY1cu1x5yCqzL6Q+3gBzMCt5SuZZyGfW0o/GSj1wAtRritIG39XOBn
 Qz41uJBaM3+fwGKEQMn5sZibcLZcgn6At2M21WESz2rm8q2OJ5cIlj6TT
 M+NTsH/yMbXMhOlsI6ibK0KGGOMr7t39YpXU6vOLMfHsVSKbvKJQKvTOw g==;
X-CSE-ConnectionGUID: mA7Q6+FoQv2dJJ5m5oqTyw==
X-CSE-MsgGUID: DH0V3/KnQSa3fCZZNplmsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609620"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:28 -0700
X-CSE-ConnectionGUID: SqsrglTkRIq7qlxp+sqFzQ==
X-CSE-MsgGUID: xJJyy0DVRJe6YZ3NS8NSZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752216"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:25 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 15/16] drm/xe: Validate thermal sensor count before reads
Date: Wed, 14 Oct 2026 17:28:05 +0530
Message-Id: <20261014115806.831459-16-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014115806.831459-1-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
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
---

v2:
- Cap the memory controller sensor range at the PCIe sensor index so the
  PCIe temperature is not averaged into the memory controller temperature.

 drivers/gpu/drm/xe/xe_hwmon.c | 44 ++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 4249faf9fb39..4b9c18230ade 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -920,6 +920,17 @@ static int mbx_temp_decode(u8 value)
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
@@ -935,7 +946,14 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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
@@ -967,30 +985,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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

