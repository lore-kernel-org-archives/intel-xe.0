Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C1CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71AA10FD1A;
	Wed, 14 Oct 2026 11:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB2B10FD2D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979175; x=1823515175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q0m3ix6iIyTfASt4eC8XlVamlF0YDfIDtWfvaQ9TTY4=;
 b=VAxuVYvhZhhQbmeU11Kg7ctP3HRvkOsiW+sb6nToNT32fV2WeMrtKWrA
 YCKfINVs1R2RDE2vjPMgU+S4Uk4vyEXXX4CllTt/na/HJtFzNAyjXC9D+
 RZpIk5bgjfXRWGWCQZruBaKzxrnMV3nzDDlD+Hn1Mt3xcZkl7qM1v/gTd
 vH1Y+ijzYwNQcGWPUbzaa9Ef5p5EKSMSZvg9zqJjAUg42VnqwlYd3Vbqe
 cUk4+Ktqq0HHrmftpm3MhqcV7PQBui41iRzp7CYj4MCEzYAoqUasHZ3I+
 SXR/yXUeg/osEH7GyaPmnzusVxRzi4jLnuz2dalp+EOYERK98KaAP9JA2 A==;
X-CSE-ConnectionGUID: ipn6OI0PQlm1A/ew6yOphQ==
X-CSE-MsgGUID: GrfljvOuTuiq5r3Wv9eWXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609615"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609615"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:23 -0700
X-CSE-ConnectionGUID: bgnmIaUaTSquIaG5EMxw+Q==
X-CSE-MsgGUID: mnPEBgjqRnaT6I+4HnPnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752208"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:20 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 13/16] drm/xe/hwmon: add PCIe temperature support for CRI
Date: Wed, 14 Oct 2026 17:28:03 +0530
Message-Id: <20261014115806.831459-14-karthik.poosa@intel.com>
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

Add the PCIe temperature sensor offset in READ_THERMAL_DATA for CRI.

Refactor PCIe temperature handling to use platform-specific sensor
indices and derive the mailbox group and byte offset from the sensor
index, eliminating special-case decoding logic.

v2:
 - Remove variables group and byte variables in get_pcie_temp().
 - Change xe_hwmon_pcie_temp_index() to take a const struct xe_hwmon *.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 28 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pcode_api.h |  2 --
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index eef6560569ce..dfe9719fb3e2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -106,12 +106,15 @@ enum sensor_attr_power {
 
 #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
 
-/* Index of memory controller in READ_THERMAL_DATA output */
+/* Sensor byte indices in READ_THERMAL_DATA output for BMG. */
 #define TEMP_INDEX_MCTRL	2
+#define TEMP_INDEX_PCIE		10
+#define BMG_G21_TEMP_INDEX_PCIE	8
 
-/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
+/* Sensor byte indices in READ_THERMAL_DATA output for CRI. */
 #define CRI_TEMP_INDEX_MCTRL	16
 #define CRI_TEMP_MCTRL_COUNT	4
+#define CRI_TEMP_INDEX_PCIE	20
 
 /* Mailbox sentinel reported for an unavailable temperature sensor */
 #define TEMP_MBX_INVALID	0xFF
@@ -1034,21 +1037,30 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
-static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
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
+static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 data = 0;
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
+						  &data, NULL);
 	if (ret)
 		return ret;
 
-	/* Sensor offset is different for G21 */
-	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
-		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
-
+	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
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

