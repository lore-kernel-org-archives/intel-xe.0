Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A785ECA9ED2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6730610E6F7;
	Tue, 13 Oct 2026 02:08:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633110E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791857284; x=1823393284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MvkIx5A1rv4IQcv0kN30EmAY+QY0awwU7w9njaLH56g=;
 b=j98l15aD2oDtyv+szNMFY+WN4KNf+kpejwAOXXWbEKT4pQi4MK6ZXjxA
 QX+glPN3+yym2FJ2VsiPWybYvfetHPTr0OVo3uJPkcFHKLE67P073FpTe
 8lfzy1Nur7fsJv0KcRpHjSOQFsNvhXVRP6Fac54g+ogrstG6MbDPI4fNS
 rHp+7ZfbcphHDDc/fsY+076bulxJ3jtMhnzW3RR2SilrY8WXNeu+iaFQp
 +pouZiFib80TRdIZPH/cxFo9CVZDmytjmzmY2QIhDYKWBGP1L4nlm6wq0
 TUEvTqCi+3ebeIkrc9Xv8fctnFqjUPh5eAEkk2TsjFtYBYOcAPit+7mGR g==;
X-CSE-ConnectionGUID: VfHZ7LT6SRG/eeeci7YDqQ==
X-CSE-MsgGUID: djZPv9dvQeeHBjG5RYwJkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="670220"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="670220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:04 -0700
X-CSE-ConnectionGUID: 78Jsjt2URoa2+NaAgEbsbQ==
X-CSE-MsgGUID: V3n8FLOsS7muibcN7gyA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369217"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:01 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 13/16] drm/xe/hwmon: add PCIe temperature support for CRI
Date: Tue, 13 Oct 2026 07:36:33 +0530
Message-Id: <20261013020636.447620-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013020636.447620-1-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
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

