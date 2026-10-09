Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D884CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E183D10F24D;
	Fri,  9 Oct 2026 12:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOAE9gGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057910F24D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791547498; x=1823083498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1WBbGX/sO3A4sKiDaAbcC5q6p34vKXtUIB8fQu/+/dc=;
 b=hOAE9gGNrhSg66OWC7GSL+3hBrAU0eQfyHSXUdfNd0J/Ygn3Ce/lNXaL
 BHdSLhIUelUe/MXPAXv6+phdg6K+XNbvdScF7uzNqIv63q1drbnUCSrBs
 yjOKxLRKo4CuGZfAGGVom1aaNV1EOzKYF4IM9VcoD4YaqiFA/vYkTcNUY
 LBZ0X1HCWNhTuge6ar2r6htryDciWIdMSxqTODKq8SogypKMr0fGoHVMK
 u20IF8hNBZjH3QHsKjOiswPZTyNpSU2wUXvD/on+mK9ToH+dfxloEkd2A
 R6q/mCdKEAQ9H9D/lz4NLyZa0azDf6FOX5r2tC4os5LToU70TEzENPbkX g==;
X-CSE-ConnectionGUID: DMC834ZeTcWiQTnnnHmuSw==
X-CSE-MsgGUID: lixZ4hEESlOoVuo1VEQ4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="372060"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="372060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:58 -0700
X-CSE-ConnectionGUID: 3YSK8WvaRVCM5MEpzbyCmQ==
X-CSE-MsgGUID: la2XRlIsTv6XK77eRwWwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="311947"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 13/14] drm/xe/hwmon: add PCIe temperature support for CRI
Date: Fri,  9 Oct 2026 17:33:34 +0530
Message-Id: <20261009120335.52973-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009120335.52973-1-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
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

Add the PCIe temperature sensor offset in READ_THERMAL_DATA for CRI.

Refactor PCIe temperature handling to use platform-specific sensor
indices and derive the mailbox group and byte offset from the sensor
index, eliminating special-case decoding logic.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pcode_api.h |  2 --
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7fe3ba422cc8..1c67e510dba5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -108,10 +108,13 @@ enum sensor_attr_power {
 
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
+#define TEMP_INDEX_PCIE		10
+#define BMG_G21_TEMP_INDEX_PCIE	8
 
 /* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
 #define CRI_TEMP_INDEX_MCTRL	16
 #define CRI_TEMP_MCTRL_COUNT	4
+#define CRI_TEMP_INDEX_PCIE	20
 
 /* Mailbox sentinel reported for an unavailable temperature sensor */
 #define TEMP_MBX_INVALID	0xFF
@@ -1014,21 +1017,34 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static u8 xe_hwmon_pcie_temp_index(struct xe_hwmon *hwmon)
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
 static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 data = 0;
+	u32 group;
+	u32 byte;
+	u8 index = xe_hwmon_pcie_temp_index(hwmon);
 	int ret;
 
+	group = index / sizeof(data);
+	byte = index % sizeof(data);
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+						  group), &data, NULL);
 	if (ret)
 		return ret;
 
-	/* Sensor offset is different for G21 */
-	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
-		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
-
+	data >>= byte * BITS_PER_BYTE;
 	data = REG_FIELD_GET(TEMP_MASK, data);
 	if (!mbx_temp_valid(hwmon, data)) {
 		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..00c4fc7d0124 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -58,8 +58,6 @@
 #define     READ_THERMAL_LIMITS			0x0
 #define     READ_THERMAL_CONFIG			0x1
 #define     READ_THERMAL_DATA			0x2
-#define       PCIE_SENSOR_GROUP_ID		0x2
-#define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
 
 #define   PCODE_LATE_BINDING			0x5C
 #define     GET_CAPABILITY_STATUS		0x0
-- 
2.25.1

