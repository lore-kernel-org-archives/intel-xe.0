Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD31C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713F10E342;
	Mon, 23 Jun 2025 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O73KFoed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466310E2C2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671472; x=1782207472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DOsZCCPSYtcL9B0HOH60v54BsV5FzFN2UElC6wNJT64=;
 b=O73KFoedZEeFPxI9rV2mhLz+J610tQc/PSKSADANtzXO+5d4C4rjJsTS
 DoYe1+ek8iwEnsHw75NozhtXYJ/yah9/4ciJoiqJF/PECNRN5J3XliXSt
 aC2TWcN+Nc3RPsmWLsOhCbb2K8U4U/KkkLJMATUkPgYo9yfKU/72b/BWU
 tBG3ab9xgH5k7vDK+VFIL4N7m+5E9wkX8Rs4PrFD7OLqFrJMQR6bYLPW/
 fgpzFJJPLfE+YKl2tMbqrC0Xh87k4bzgfbkOFJUWBfKJYIbK1XqJWyZMO
 Ixo1hPo674z+1tF9EyjRSTfLX03g7gTB5Z2Cj9uP5aWstS4qTibzPkuMs Q==;
X-CSE-ConnectionGUID: Tx6tdF94R7KWRHeQiXdlkA==
X-CSE-MsgGUID: f5Y4YHs9R4adp2NaDoMbDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740334"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:52 -0700
X-CSE-ConnectionGUID: J8ZbWjtGRl++kdr0lo3FwA==
X-CSE-MsgGUID: 6R3vwxu8TyaOmX9KjKU3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152057646"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:08 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH v2 4/5] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Date: Mon, 23 Jun 2025 15:31:07 +0530
Message-ID: <20250623100109.1086459-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250623100109.1086459-1-riana.tauro@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
 drivers/gpu/drm/xe/xe_device_types.h       |  3 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 65 +++++++++++++++++++++-
 4 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 7702364b65f1..fcb6003f3226 100644
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
index d898238e8994..c5b297e25019 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -240,6 +240,9 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
+	/** @csc_hw_error_work: worker to report CSC HW errors */
+	struct work_struct csc_hw_error_work;
+
 	/** @pcode: tile's PCODE */
 	struct {
 		/** @pcode.lock: protecting tile's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 0f2590839900..ad1e244ea612 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
 
@@ -10,6 +11,8 @@
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 
+#define  HEC_UNCORR_FW_ERR_BITS 4
+
 /* Error categories reported by hardware */
 enum hardware_error {
 	HARDWARE_ERROR_CORRECTABLE = 0,
@@ -18,6 +21,13 @@ enum hardware_error {
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
@@ -32,6 +42,54 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static void csc_hw_error_work(struct work_struct *work)
+{
+	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_device *xe = tile_to_xe(tile);
+
+	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_FW_FLASH);
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
@@ -50,7 +108,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		goto unlock;
 	}
 
-	/* TODO: Process errrors per source */
+	if (err_src & XE_CSC_ERROR)
+		csc_hw_error_handler(tile, hw_err);
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
 
@@ -101,8 +160,12 @@ static void process_hw_errors(struct xe_device *xe)
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

