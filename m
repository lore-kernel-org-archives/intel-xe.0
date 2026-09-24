Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4F9C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 10:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E0A10E0CF;
	Thu, 24 Sep 2026 10:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcWjdgJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA5010E9CD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790247093; x=1821783093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3dDXWmufgTKHoS1nVlPs84HBEuNBcahVk7foTDg4SOs=;
 b=dcWjdgJfnulFP7+Wa5eLCKu7jMJ7WTjI04YXjI84m3LenSsjz9CRpIoL
 /yy12DzbuaIVvztXmxPUr9VK4fDznMsVahYZylzD7wxwVSf2J3XEDUkD6
 pvH99tDm6ziHYbC0hTSFjB7eHJOCIiX7ccfcWgz02E/ZMCUKcaV4Euy5U
 MZx0AeIwSGgZDsGIJrGNFJNOciS4C3v6kCeF6GurvXfEBIRYA5i5cJBD9
 NXXJ+W0XNdKFEj90Io3yOTamB4OQAnINHw8jjLj9DxGs9lUUI4CbhAG7D
 7aFYcNrBjOVpCoMYjixNPKfq4tuL+7CYu3rteb2EEUCKrqq/wGfFX0ECx Q==;
X-CSE-ConnectionGUID: fhkrAngQQE+13aGmbYsEXg==
X-CSE-MsgGUID: S67I/i4xSEaMUpvCAOYvuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91032932"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91032932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:51:33 -0700
X-CSE-ConnectionGUID: BY8v/oCmQ++SGzdPtQu1sw==
X-CSE-MsgGUID: uRIUPu/TRPqWyNIDUzMfkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277750235"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:51:31 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 13/13] drm/xe/hwmon: Update PCIE temperature sensor
 offset for CRI
Date: Thu, 24 Sep 2026 16:20:00 +0530
Message-Id: <20260924105000.2627929-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924105000.2627929-1-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
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

On Crescent Island, the PCIe temperature sensor is reported in
READ_THERMAL_DATA group 5, byte 0. Add support for reading the sensor
from this mailbox location.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index fef2166989ba..f6860da0bf0c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -113,6 +113,9 @@ enum sensor_attr_power {
 #define CRI_TEMP_INDEX_MCTRL	16
 #define CRI_TEMP_MCTRL_COUNT	4
 
+/* On CRI the PCIe temperature is READ_THERMAL_DATA byte 20 (group 5, low byte). */
+#define CRI_PCIE_SENSOR_GROUP_ID	5
+
 /* Mailbox sentinel reported for an unavailable temperature sensor */
 #define TEMP_MBX_INVALID	0xFF
 
@@ -1012,16 +1015,21 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 group = PCIE_SENSOR_GROUP_ID;
 	u32 data = 0;
 	int ret;
 
+	/* CRI relocated the PCIe temperature to a different data group. */
+	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
+		group = CRI_PCIE_SENSOR_GROUP_ID;
+
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+						  group), &data, NULL);
 	if (ret)
 		return ret;
 
-	/* Sensor offset is different for G21 */
-	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
+	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21 &&
+	    hwmon->xe->info.platform != XE_CRESCENTISLAND)
 		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
 
 	data = REG_FIELD_GET(TEMP_MASK, data);
-- 
2.25.1

