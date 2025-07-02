Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD5C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B7D10E242;
	Wed,  2 Jul 2025 13:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5WiVWpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4317C10E242
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464030; x=1783000030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1g9HwWZtDo+PT28tPJgMtpHmdb/gDpms2EgD8juNbZ4=;
 b=Y5WiVWpHq0wKNpaZAyeMzyleMvLmjhmmZBTXmqAIkM0gNB14gXBZ9QK+
 fZ5E5BTanZP0eVFKiEILjpSqis9ODQWNwiSQknHGFSlTMCRvgpNgNHH1N
 mbpVJCQBnju1nids9gH0lZiLpujkUkyMWflqB4Hjzl0yANJSBJM5U+Oe+
 zfDSwAK5ojI7wt5X+lTSGIayt7pBanHjjJ0eGl5TgqKqxqgN3+W4AJNZb
 mQyxW0R5eyta64AE1T9pu2wTsAldrDODx9w8D35iocg0eymYFSKW3ITkg
 TYmTDtIbcQeaIRu+3ZAu2399SJM/7CpnDCyNLbsBxKTye41VDyenTmXrQ Q==;
X-CSE-ConnectionGUID: LHXvHt0+TuW+GysZn+BZbw==
X-CSE-MsgGUID: G8TiRGMCRpeP/F1ouZEypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186110"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:47:09 -0700
X-CSE-ConnectionGUID: 8UuEneX0Q3qF497GbZ8dAg==
X-CSE-MsgGUID: 0Gl5BDXtT7yekGXrwJ8IyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177756024"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:47:06 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v3 6/7] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Date: Wed,  2 Jul 2025 19:41:16 +0530
Message-ID: <20250702141118.3564242-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702141118.3564242-1-riana.tauro@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
 drivers/gpu/drm/xe/xe_device.c             | 11 +++-
 drivers/gpu/drm/xe/xe_device_types.h       |  3 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 70 +++++++++++++++++++++-
 5 files changed, 88 insertions(+), 5 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d6b680abc3ae..fbc50cebfc11 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1154,6 +1154,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  */
 void xe_device_declare_wedged(struct xe_device *xe)
 {
+	unsigned long recovery_method;
 	struct xe_gt *gt;
 	u8 id;
 
@@ -1169,6 +1170,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
+	/* Default recovery method */
+	recovery_method = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
+
+	if (xe_survivability_mode_is_runtime(xe))
+		recovery_method = DRM_WEDGE_RECOVERY_VENDOR;
+
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
@@ -1181,8 +1188,6 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe->drm.dev));
 
 		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
-				     NULL);
+		drm_dev_wedged_event(&xe->drm, recovery_method, NULL);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..5daf5ba6bf51 100644
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
index 0f2590839900..73c788fd0dee 100644
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
@@ -32,6 +43,58 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static void csc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_device *xe = tile_to_xe(tile);
+	int ret;
+
+	ret = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_RUNTIME);
+	if (ret)
+		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+
+	xe_device_declare_wedged(xe);
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
@@ -50,7 +113,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	/* TODO: Process errrors per source */
+	if (err_src & XE_CSC_ERROR)
+		csc_hw_error_handler(tile, hw_err);
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
@@ -101,8 +165,12 @@ static void process_hw_errors(struct xe_device *xe)
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

