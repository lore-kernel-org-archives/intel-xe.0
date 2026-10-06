Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B2CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46EB10E2CF;
	Tue,  6 Oct 2026 03:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKpR0od4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523EF10E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791257827; x=1822793827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6SYx1ZKMJGEYkB8LMk3L0XXJp9kZ1QyeC8ArHkgk/ws=;
 b=oKpR0od42BdC4fO+ClUxAzhB/vEKt0kWvqO6V1n+tDzku6e9rYakFWZ4
 /1JNVreb6KLF7w89O0mbok2B6qyEWZmuO5UR8WDmhu14j8mqpeOA4R5WD
 cBlH61aBI5DkT6sYEJTnxO1s2/w9m0BQ62+mmTrQhOAL4Ncdxyuy0su80
 HTNIYTZuiVSLhM1VwGN3kLCjcTKwvr7vEEwQL7iAXF2g+Ft/ap3xXMoPs
 w8PkIoiowY+PDunZ1vWExwz8E/7gWaecF9eRNB/dP2qklLpXY/V29y9Qg
 ytAcEQ7rWTiXcF+Aal/Ivl2uEYmZ/XsfuRzjSIkXubrf6YGgJ4cbSye71 g==;
X-CSE-ConnectionGUID: pWV39Oi4TmGGVMWxaa8ykQ==
X-CSE-MsgGUID: zDvceB9vQECAfmqiGfKkiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427426"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94427426"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:37:07 -0700
X-CSE-ConnectionGUID: J3t/O44ISZSHzedAAwaAqg==
X-CSE-MsgGUID: vhbNDcoOR+Krx08xFEN/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273400987"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:37:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 13/15] drm/xe/hwmon: Get PCIe temperature sensor offset
 from xe info
Date: Tue,  6 Oct 2026 09:05:32 +0530
Message-Id: <20261006033534.3583967-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006033534.3583967-1-karthik.poosa@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
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

Store the PCIe temperature sensor byte offset in xe device info and derive
the thermal mailbox group and byte from it. Read the configured offset
inside get_pcie_temp().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c        | 14 ++++++++------
 drivers/gpu/drm/xe/xe_pci.c          |  4 ++++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |  2 --
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 161ba2b27f47..4b2da72ed136 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -164,6 +164,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @info.pcie_temp_sensor_offset: PCIe sensor byte offset in READ_THERMAL_DATA */
+		u8 pcie_temp_sensor_offset;
 
 		/*
 		 * Keep all flags below alphabetically sorted
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7fe3ba422cc8..54b2fd29ccbe 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1018,17 +1018,18 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 data = 0;
+	u32 group;
+	u32 byte;
 	int ret;
 
+	group = hwmon->xe->info.pcie_temp_sensor_offset / sizeof(data);
+	byte = hwmon->xe->info.pcie_temp_sensor_offset % sizeof(data);
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
@@ -1168,7 +1169,8 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
 	case CHANNEL_MCTRL:
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
 	case CHANNEL_PCIE:
-		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
+		return hwmon->temp.count &&
+		       !get_pcie_temp(hwmon, NULL);
 	default:
 		return false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e754668100cf..1cbd49933b2c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -421,6 +421,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
+	.pcie_temp_sensor_offset = 10,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_i2c = true,
@@ -793,6 +794,9 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.vram_flags = desc->vram_flags;
+	xe->info.pcie_temp_sensor_offset = desc->pcie_temp_sensor_offset;
+	if (xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
+		xe->info.pcie_temp_sensor_offset = 8;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ce0b0f6c5b18..a613bd4ed94c 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -34,6 +34,7 @@ struct xe_device_desc {
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
+	u8 pcie_temp_sensor_offset;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
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

