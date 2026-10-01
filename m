Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FD2CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA4110F74F;
	Thu,  1 Oct 2026 19:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTW55Z0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F2410F74F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884321; x=1822420321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0y8VU6hzqqdcalcAiQn6x8RxEUnyjiVWnR+FxyWzFCE=;
 b=eTW55Z0JdKCWkNd9kexV+nyNp8Qhe+rVXdl7W8Pp67r9EMaCBvZ5Wh55
 ZpiIKke5F9b97BRwXhEI7jJtQc6igWRB0rNRNxl2k6aPl9p+AxkKWrGRD
 x3TrFPGVotbDd85/4Ab4XIGytfickZKd+1XwNgwkdyMZbk9dEbJD108PO
 gU8pU/UFlDYygdz804xWkE53UUUsA5Rm9peA2ASN1r84rQ3ETYhA6WmRw
 U942GdrTTnn5n063KY6ZxjDU9vjdqFDES2nDTpg4euhSldsUeMdeQTC1h
 1MuI4yb+0mgqC0K47K8oWAsFkob5CjEWVmILgibBxD/5L/XmmP0c9ymmq g==;
X-CSE-ConnectionGUID: 6ebcEwDISyCnH+2gVkMa8w==
X-CSE-MsgGUID: iogt/SL9T6m+ku7BJgkgnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177977"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:58 -0700
X-CSE-ConnectionGUID: 52JuVDeFSoOfnAVtAAXZfw==
X-CSE-MsgGUID: rx514jE6R8uFzoUOxkylzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893868"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 13/15] drm/xe/hwmon: Get PCIe temperature sensor offset
 from xe info
Date: Fri,  2 Oct 2026 01:20:31 +0530
Message-Id: <20261001195033.3466205-14-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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
index a63a6b5d1d3c..edb2de6377c6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1011,17 +1011,18 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
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
@@ -1161,7 +1162,8 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
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

