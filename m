Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34DFCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400210E62D;
	Mon, 12 Oct 2026 13:05:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A83B10E5B5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791810328; x=1823346328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rvPCmLpR+AfozlBKvcdAAfx0q2SeUIgowA4tYKy+o8=;
 b=Z359vLrYjkxxEEHffaF9UkxOZVml72C3i5puY/a2D26Km6moj7L9KXIB
 s9qQN8vh63KMC7lYGY+vGiph/hx8yYDvfbKWwC/BB+ymaH3RRHQhpVMH5
 ISFp6wBNT8PqluCWmxmrEvWHIKvyiZ9ZsMZtP7NaY/NE3JuQL3mxjaInY
 MyLHBiD7aJ4hvT8PiTlX7lDNmWmP1v7XY3iUkKnK86DpSdJcxH119JeEZ
 PbA1DlbgF+yH2qemx2n2uZKsyS2vC+Zb3Pjb+An7NOfhUYzAEIItxzBx8
 3tFxbWbbUngqrSK0+vAaFdQO0T2qJo5c+rKkMRbyQSdcVMdNcePmnF9uq w==;
X-CSE-ConnectionGUID: vrizwkXnQDqA0GVWAt2XiA==
X-CSE-MsgGUID: iMp8M5iuQ4O5h01KxVNBpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527311"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527311"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:28 -0700
X-CSE-ConnectionGUID: Ahfc4AHjQuGXuiB7S0BoMQ==
X-CSE-MsgGUID: Xfaon3dnSkO0WW9erh/a6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2682027"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 13/16] drm/xe/hwmon: add PCIe temperature support for CRI
Date: Mon, 12 Oct 2026 18:33:59 +0530
Message-Id: <20261012130401.443473-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012130401.443473-1-karthik.poosa@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 28 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pcode_api.h |  2 --
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d66ae0b88126..6e3f1d873dee 100644
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
@@ -1016,21 +1019,30 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
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

