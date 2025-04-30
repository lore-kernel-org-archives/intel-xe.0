Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D9C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 20:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C879110E124;
	Wed, 30 Apr 2025 20:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBvxGnrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278D10E124
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746045410; x=1777581410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vkEAAdJ8nFnAeaZDaKEyfND73sROrIr6OsPkk9j+1ew=;
 b=oBvxGnrN4qFYBIjOxpAcZssV5VFdoKMkthDtUsmKZ4vhSTl3aEhKr6m2
 CMi+oWGe6wEwRHYu7dw+D2U82yAnA01ddPQE6wyjweL4FsHT5mlBHiAZd
 9zCLybkGMX5CnklWXmJBBrNMbNXnVCHj1WjUWvzF1pAU8VD8bmcJa/G8D
 vYSClxBhShejGXBQ+pTPQtA7belN1NbAEtDVMC+fTr8L6lH/nEuHHlQUv
 bY371/QSixSXAZ2AL7h2/57fEccFBMTJswjtQDZke7x/0acqFMChYDfrf
 SB6z0tbWKHZJ1d+IZvrX51pWNiGTgk0kvFBN6rhzma7NJOJvhsKY2zPTA Q==;
X-CSE-ConnectionGUID: fnj+os/CQlWVoWP2f0MGeA==
X-CSE-MsgGUID: dDgGKXb4RUS20eSZd0Sn7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58712399"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="58712399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:49 -0700
X-CSE-ConnectionGUID: ouPf2uyARPSP+zte41rfog==
X-CSE-MsgGUID: 5MR8Z2v7QvuxrU3preBzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134112627"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 5/5] drm/xe/hwmon: Read energy status from PMT
Date: Thu,  1 May 2025 02:06:07 +0530
Message-Id: <20250430203607.926585-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430203607.926585-1-karthik.poosa@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
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

Read card and package energy status using pmt apis instead
of xe_mmio for supported platforms.
Enable Battlemage to read energy from PMT.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  3 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h        |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c           | 46 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |  3 ++
 drivers/gpu/drm/xe/xe_vsec.c            |  4 +--
 drivers/gpu/drm/xe/xe_vsec.h            |  4 +++
 7 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c7d5d782e3f9..487a01455f2a 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -20,14 +20,13 @@
 
 #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
 #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
-#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
 #define BMG_FAN_1_SPEED				XE_REG(0x138140)
 #define BMG_FAN_2_SPEED				XE_REG(0x138170)
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
-#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
 #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
+#define BMG_ENERGY_STATUS_PMT_OFFSET		(0x30)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index f45abcd96ba8..ad91f6fef6bb 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,6 +10,8 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
+#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2c8321eb41b9..cfac809dd7aa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -330,6 +330,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_pxp: Device has energy status in PMT */
+		u8 has_pmt_energy:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ada8c15829a3..349eb27d977b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -20,6 +20,8 @@
 #include "xe_pcode_api.h"
 #include "xe_sriov.h"
 #include "xe_pm.h"
+#include "xe_vsec.h"
+#include "regs/xe_pmt.h"
 
 enum xe_hwmon_reg {
 	REG_TEMP,
@@ -263,12 +265,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_BATTLEMAGE) {
-			if (channel == CHANNEL_PKG)
-				return BMG_PACKAGE_ENERGY_STATUS;
-			else
-				return BMG_PLATFORM_ENERGY_STATUS;
-		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
+		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
@@ -449,9 +446,29 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
+	int ret = 0;
 
-	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
-							channel));
+	/* Energy is supported only for card and pkg */
+	if (channel > CHANNEL_PKG) {
+		*energy = 0;
+		return;
+	}
+
+	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
+		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
+					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+					&reg_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(reg_val));
+		drm_dbg(&hwmon->xe->drm, "energy from pmt, ch %d read from mbx 0x%016llx, ret %d\n",
+			channel, reg_val, ret);
+
+		if (channel == CHANNEL_PKG)
+			reg_val &= 0xFFFFFFFF;
+		else
+			reg_val = reg_val >> 32;
+	} else {
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+								channel));
+	}
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -927,11 +944,18 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
+	long energy = 0;
+
 	switch (attr) {
 	case hwmon_energy_input:
 	case hwmon_energy_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
-				       channel)) ? 0444 : 0;
+		if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
+			xe_hwmon_energy_get(hwmon, channel, &energy);
+			return energy ? 0444 : 0;
+		} else {
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+					       channel)) ? 0444 : 0;
+		}
 	default:
 		return 0;
 	}
@@ -1278,4 +1302,4 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	return 0;
 }
-
+MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 95a2a458e8f7..f49452e4ef08 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -67,6 +67,7 @@ struct xe_device_desc {
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_pmt_energy:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
@@ -345,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_display = true,
 	.has_fan_control = true,
 	.has_mbx_power_limits = true,
+	.has_pmt_energy = true,
 	.has_heci_cscfi = 1,
 	.needs_scratch = true,
 };
@@ -588,6 +590,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
+	xe->info.has_pmt_energy = desc->has_pmt_energy;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b378848d3b7b..3e573b0b7ebd 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,8 +149,8 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
-static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
-			     u32 count)
+int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
+		      u32 count)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index 5777c53faec2..6d0db46d4700 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -4,8 +4,12 @@
 #ifndef _XE_VSEC_H_
 #define _XE_VSEC_H_
 
+#include "linux/types.h"
+#include "linux/pci.h"
+
 struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
+int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.25.1

