Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860F6C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4780410F472;
	Thu, 24 Sep 2026 11:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAa4sWHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE3410F476
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790248407; x=1821784407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3dDXWmufgTKHoS1nVlPs84HBEuNBcahVk7foTDg4SOs=;
 b=iAa4sWHBS7tA44gUUrMjFmGLURjcz/Bd45Gji8/Enh/x1/qC0VLMmFko
 pgT7YMhfKGmbWmBKXPR6vETi1j0huwoD8PB8kMkBJF8qUH2YzEw/btwhU
 0u3GyJqq6zARf31YwCdyLXJ7T+9be65bfjzAGatHMY/fDX2HQPKrImLSJ
 toDg6BhmkU7k3Wq+3qpYWP2VL871WmMBa06m2SAkJXEgmBkHWkTPSTovv
 95fon3faQjC5Bw5MHnvocZOwdLiXNFadKuBhCsUDrzLhtjdqirQHsNBl1
 Kp6Y/YjIe74mO3vuQeeIcs9U0fADmcwRQT26447gzDfaODA0SvbaRYw6Z A==;
X-CSE-ConnectionGUID: yeMnz9CfR/6Tx8lEOR6s/g==
X-CSE-MsgGUID: Nxyulln4QyKENtWqWVuwNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101187750"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="101187750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:27 -0700
X-CSE-ConnectionGUID: svHoS6thScayRXUJaNVwtA==
X-CSE-MsgGUID: TnZzho2pRhyUhnmFZQOL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277394849"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:13:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 13/13] drm/xe/hwmon: Update PCIE temperature sensor offset
 for CRI
Date: Thu, 24 Sep 2026 16:41:56 +0530
Message-Id: <20260924111156.2628915-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924111156.2628915-1-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
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

