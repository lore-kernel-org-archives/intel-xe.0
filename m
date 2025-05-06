Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59848C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 15:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9A110E6D2;
	Tue,  6 May 2025 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGii3kBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D8610E355
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746545499; x=1778081499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vUGtUL+FAnKi7jlGlx35jum+QAs3l/rjYWQQFlkEmaE=;
 b=bGii3kBvZ48jWzTH9GTPS3g3rKSQnaoBunKyLAXK0gj+5J9oB5kpSGbX
 qg4TeDAJxnHGLLrV2j0XIi9/uNUWfwGq3aoPDLiaJnBvy+qe5gS84fsxx
 JxGVAC2wr8tjW9MJoXgsQmgisyxorYTSBQJF1MShcwiNQEe89X8DG6liK
 fqFN46eYWd+/wh/nAVd5w+7/hJz6ssvjXTu6SQKTZ2496e8NJyyr/RX9K
 x/Dc3qaz/ENzxU7jdJHFfBLQtI/3p1oQm301wIsKVDvYcSwyF23mmg80n
 D3cqanUFcqsZQ2eg71BxxTF4XrWrqwsNcYGZk/+t251nCddlz3mhmmqwh g==;
X-CSE-ConnectionGUID: gJqw52AORzabvrYYnFdZtQ==
X-CSE-MsgGUID: UC9mvj7PQQGNAwiD/BCRiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58884989"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58884989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:28 -0700
X-CSE-ConnectionGUID: RFNK8uSuTTGIBpEq9Qmpew==
X-CSE-MsgGUID: PHu5SCtgTN220HLFOSvFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136656511"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:26 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 5/5] drm/xe/hwmon: Read energy status from PMT
Date: Tue,  6 May 2025 21:00:58 +0530
Message-Id: <20250506153058.1389470-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506153058.1389470-1-karthik.poosa@intel.com>
References: <20250506153058.1389470-1-karthik.poosa@intel.com>
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

v2:
 - Remove unused has_pmt_energy field. (Badal)
 - Use GENMASK to extract energy data. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  5 +--
 drivers/gpu/drm/xe/regs/xe_pmt.h        |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c           | 46 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vsec.c            |  4 +--
 drivers/gpu/drm/xe/xe_vsec.h            |  4 +++
 5 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c556a04670ee..c65d6ed470b5 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -18,12 +18,13 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
 
-#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
 #define BMG_FAN_1_SPEED				XE_REG(0x138140)
 #define BMG_FAN_2_SPEED				XE_REG(0x138170)
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
-#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+#define BMG_ENERGY_STATUS_PMT_OFFSET		(0x30)
+#define	ENERGY_PKG				REG_GENMASK64(31, 0)
+#define	ENERGY_CARD				REG_GENMASK64(63, 32)
 
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
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c0aa5587e855..a990f2c32449 100644
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
@@ -253,12 +255,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
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
@@ -441,9 +438,29 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
+	int ret = 0;
+
+	/* Energy is supported only for card and pkg */
+	if (channel > CHANNEL_PKG) {
+		*energy = 0;
+		return;
+	}
 
-	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
-							channel));
+	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
+		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
+					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+					&reg_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(reg_val));
+		drm_dbg(&hwmon->xe->drm, "energy from pmt, ch %d read from mbx 0x%016llx, ret %d\n",
+			channel, reg_val, ret);
+
+		if (channel == CHANNEL_PKG)
+			reg_val = REG_FIELD_GET64(ENERGY_PKG, reg_val);
+		else
+			reg_val = REG_FIELD_GET64(ENERGY_CARD, reg_val);
+	} else {
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+								channel));
+	}
 
 	if (reg_val >= ei->reg_val_prev)
 		ei->accum_energy += reg_val - ei->reg_val_prev;
@@ -919,11 +936,18 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
@@ -1268,4 +1292,4 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	return 0;
 }
-
+MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
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

