Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713ACC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A04F10EF80;
	Tue, 13 Oct 2026 18:51:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FE410EF80
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917463; x=1823453463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bj6PZeTMmsMi7ibkeAwHr00uy5zU44tqjlgl+aWn38M=;
 b=MVGMsWGSmTNFRhL6asRAi+ha7dbJnISt1KTyp+n83TeQ1/8mgLh/ue8G
 Gtc7mK5uRwgnslQ2T2fPoLlpJ11ww/j36lWinLV7+ESdjckiMQNKwhtcN
 /2rXn0pNERcxcGzyoU3+JgyrS121/rhY1krsy7HeGqrPykMszKK3Fbwkd
 0qEQGYQXoFCWKGuaJfuRkrXPOFry9FKRs1i5lf9KWMyycsxoacd+EFxC8
 EGQ13++GQlNliyQsSIqOxWQ20IiyNUpGAmATnzLCb/mguudaq9oCloDxw
 RRqiQ29yD4TQ5ieGHKAEnV3QS4N//ljyXxKxbj7AanNA27ZggNm2PJPf6 Q==;
X-CSE-ConnectionGUID: HrjW4jyeSMKmPZXGuU+T6Q==
X-CSE-MsgGUID: odMYYi5KQb+fXnLPZmOOzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545835"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545835"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:51:03 -0700
X-CSE-ConnectionGUID: vX9kfYQSR7mBTH7dQETDJw==
X-CSE-MsgGUID: Dx87/FLOTxGtfzysPF72Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596260"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:51:01 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 15/16] drm/xe: Validate thermal sensor count before reads
Date: Wed, 14 Oct 2026 00:19:38 +0530
Message-Id: <20261013184939.694945-16-karthik.poosa@intel.com>
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

Check that READ_THERMAL_CONFIG reports enough thermal entries for the
platform-specific MCTRL range and PCIe sensor index before reading
READ_THERMAL_DATA.

v2:
- Cap the memory controller sensor range at the PCIe sensor index so the
  PCIe temperature is not averaged into the memory controller temperature.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 44 ++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a54e3c52bd4a..d14c26e81167 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -904,6 +904,17 @@ static int mbx_temp_decode(u8 value)
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
@@ -917,7 +928,14 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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
@@ -949,30 +967,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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

