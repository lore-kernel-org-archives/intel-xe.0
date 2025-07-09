Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D3C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281710E7A3;
	Wed,  9 Jul 2025 10:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFW5s/Au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D29410E7A5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752058575; x=1783594575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88dzansCTE4VOu5Y7h/bT05obYKo5/FtlKVxUmDOYpQ=;
 b=bFW5s/AuUTFE7qnOE8C2zXUBgJCtQc0A7LE5zwEnY9jzYqbdmo45qHIY
 1uabKyqrclBhafDLJ2jogvPN/SdDdvMNfm9kGe+Fky2QaTcoNC3E7eaTz
 T/VqqSYoKHG7eeXzBXVYpps6RHz5KzEgbwErGdkbwLQW7zNF9kBWoSkdg
 gQaGukPJrm3RoMtHwkS72o2qNVo+3ez35zUD0M9tDoGccgcns4+u7oP7T
 D3nDJHoYB0JRVb7untQkmqpXCE+I2E7urZBOFuQ9U/0PX2bcFDnhgEY0e
 LSZzwVeyr4aywOC31jOB7GphfQkyZVBK0BLCsg4Py0TQkBxBJL1cHlet5 g==;
X-CSE-ConnectionGUID: VwSDk73MRlCbRyoNTI/q9g==
X-CSE-MsgGUID: 91NsJi2iRYGRoVsaeijmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54288520"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54288520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:56:15 -0700
X-CSE-ConnectionGUID: 0pOUTpFoRQK7MgE+ew3duQ==
X-CSE-MsgGUID: ESE0yeDzT/qx60Zzefjixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192936473"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:56:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v4 8/9] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Date: Wed,  9 Jul 2025 16:50:20 +0530
Message-ID: <20250709112024.1053710-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250709112024.1053710-1-riana.tauro@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support to handle CSC firmware reported errors. When CSC firmware
errors are encoutered, a error interrupt is received by the GFX device as
a MSI interrupt.

Device Source control registers indicates the source of the error as CSC
The HEC error status register indicates that the error is firmware reported
Depending on the type of error, the error cause is written to the HEC
Firmware error register.

On encountering such CSC firmware errors, the graphics device is
non-recoverable from driver context. The only way to recover from these
errors is firmware flash. The device is then wedged and userspace is
notified with a drm uevent

v2: use vendor recovery method with
    runtime survivability (Christian, Rodrigo, Raag)

v3: move declare wedged to runtime survivability mode (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
 drivers/gpu/drm/xe/xe_device_types.h       |  3 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 68 +++++++++++++++++++++-
 4 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 9b66cc972a63..180be82672ab 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -13,6 +13,8 @@
 
 /* Definitions of GSC H/W registers, bits, etc */
 
+#define BMG_GSC_HECI1_BASE	0x373000
+
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index ed9b81fb28a0..c146b9ef44eb 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -6,10 +6,15 @@
 #ifndef _XE_HW_ERROR_REGS_H_
 #define _XE_HW_ERROR_REGS_H_
 
+#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
+#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
+
+#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
+
 #define DEV_ERR_STAT_NONFATAL			0x100178
 #define DEV_ERR_STAT_CORRECTABLE		0x10017c
 #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
 								  DEV_ERR_STAT_CORRECTABLE, \
 								  DEV_ERR_STAT_NONFATAL))
-
+#define   XE_CSC_ERROR				BIT(17)
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ca300338e8c2..283d5c88758e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -241,6 +241,9 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
+	/** @csc_hw_error_work: worker to report CSC HW errors */
+	struct work_struct csc_hw_error_work;
+
 	/** @pcode: tile's PCODE */
 	struct {
 		/** @pcode.lock: protecting tile's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 0f2590839900..7cc9b8a7fa1a 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,12 +3,16 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
 
 #include "xe_device.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_survivability_mode.h"
+
+#define  HEC_UNCORR_FW_ERR_BITS 4
 
 /* Error categories reported by hardware */
 enum hardware_error {
@@ -18,6 +22,13 @@ enum hardware_error {
 	HARDWARE_ERROR_MAX,
 };
 
+static const char * const hec_uncorrected_fw_errors[] = {
+	"Fatal",
+	"CSE Disabled",
+	"FD Corruption",
+	"Data Corruption"
+};
+
 static const char *hw_error_to_str(const enum hardware_error hw_err)
 {
 	switch (hw_err) {
@@ -32,6 +43,56 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static void csc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_device *xe = tile_to_xe(tile);
+	int ret;
+
+	ret = xe_survivability_mode_runtime_enable(xe);
+	if (ret)
+		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+}
+
+static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mmio *mmio = &tile->mmio;
+	u32 base, err_bit, err_src;
+	unsigned long fw_err;
+
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return;
+
+	/* Not supported in BMG */
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+		return;
+
+	base = BMG_GSC_HECI1_BASE;
+	lockdep_assert_held(&xe->irq.lock);
+	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
+	if (!err_src) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
+				    tile->id, hw_err_str);
+		return;
+	}
+
+	if (err_src & UNCORR_FW_REPORTED_ERR) {
+		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
+		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
+			drm_err_ratelimited(&xe->drm, HW_ERR
+					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
+					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
+					     err_bit);
+
+			schedule_work(&tile->csc_hw_error_work);
+		}
+	}
+
+	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
+}
+
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const char *hw_err_str = hw_error_to_str(hw_err);
@@ -50,7 +111,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	/* TODO: Process errrors per source */
+	if (err_src & XE_CSC_ERROR)
+		csc_hw_error_handler(tile, hw_err);
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
@@ -101,8 +163,12 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
+	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+
 	process_hw_errors(xe);
 }
-- 
2.47.1

