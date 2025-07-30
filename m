Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3EC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6BD10E12F;
	Wed, 30 Jul 2025 05:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeAGbxuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A732810E12F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854570; x=1785390570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i0yrgf7EtvcKzrsBohBbVvlmJ22ViXuy7QXZdT9iUds=;
 b=jeAGbxufbInRN3xODVEuo1Ji0yyvqV/ZS/2wKhbOK/ACbUmCG5XfZ9Yf
 I4pVLW2cpGtOSjzso09/GTZMcFKcgtbVGEh1sJEYrC0SvKHtPXdSKkmRk
 GAW2K5/Tv6XyB/Z4YGqeqAPLeZXRZj8kuOi80X5qcUaJuptlS3TL1d8lt
 6jv1e7iGUrP1/sWbIPEp/SkzOWlnDWQk+OTvsZJW4iRFKb0wfygVtdlz6
 PzBYeKNndvLORj/rrgKV8ZbD5WIb/Pd0m+stGjLdf3TuGYrtBCJt96O4O
 7O00VzAsZJaTnLyVVEGsGOcS1s9XshkIIefyeqFmIC9npDWXXaq0CPXZ6 Q==;
X-CSE-ConnectionGUID: Jv7pqk0ISOa+FCQAlMUAZQ==
X-CSE-MsgGUID: f6ZaqkT9SKiWHJcIOqN+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215595"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:30 -0700
X-CSE-ConnectionGUID: +5BiolL0Qg+kdbrp1Vi9mw==
X-CSE-MsgGUID: fjfcQeKDRNaTDJHZ+ZU+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240214"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:27 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 01/10] drm/xe: Handle errors from various components.
Date: Wed, 30 Jul 2025 11:18:05 +0530
Message-Id: <20250730054814.1376770-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

The GFX device reports two classes of errors: uncorrectable and
correctable. Depending on the severity uncorrectable errors are
further classified as non fatal and fatal. Driver will only handle
logging of errors and updating counters from various components within
the graphics device. Anything more will be handled at system level.

Correctable and NonFatal errors are reported as interrupts, bits in
the Master Interrupt Register will be used to convey the class of error.
Determine source of error (IP block) by reading the Device Error Source
Register (RW1C) that corresponds to the class of error being serviced

Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
the OS will perform a device warm reset which causes the driver to
reload. The error registers are sticky and the values are maintained
through a warm reset. We read these registers during the boot flow of the
driver and increment the respective error counters.

Bspec: 50875, 53073, 53074, 53075, 53076

v6
- Limit the implementation to DG2 and PVC.
- Limit the tile level logging to only PVC.
- Use xarray instead of array for error counters.
- Squash the fatal error reporting patch with this patch.
- use drm_dbg instead of drm_info to dump register values.
- use XE_HW_ERR_UNSPEC for error which are reported by leaf registers.
- use source_typeoferror_errorname convention for enum and error loging.
- Clean unused enums and there are no display supported ras error,
categorize them as unknown.
- Dont make xe_assign_hw_err_regs static.
- Use err_name_index_pair instead of err_msg_cntr_pair.(Aravind)

v7
- Ci fix

v8
- Avoid unnecessary write if reg is empty incase of DG2.

v9
- For reg being blank print error for DG2 too.
- Maintain order of headers.
- Make XE_HW_ERR_UNSPEC 0. (Aravind)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h        |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  13 +
 drivers/gpu/drm/xe/xe_device.c               |  13 +
 drivers/gpu/drm/xe/xe_device_types.h         |  10 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 258 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  50 ++++
 drivers/gpu/drm/xe/xe_irq.c                  |   1 +
 drivers/gpu/drm/xe/xe_tile.c                 |   2 +
 10 files changed, 352 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 42c6ca5b3f76..80eecd35e807 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -82,6 +82,7 @@ xe-y += xe_bb.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
+	xe_hw_error.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 13635e4331d4..086ec7584b1a 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -18,6 +18,7 @@
 #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
+#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   I2C_IRQ				REG_BIT(12)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 1926b4044314..00900d3821f7 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -9,6 +9,9 @@
 
 #define SOC_BASE				0x280000
 
+#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
+
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
new file mode 100644
index 000000000000..ba5480fb2789
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef XE_TILE_ERROR_REGS_H_
+#define XE_TILE_ERROR_REGS_H_
+
+#define _DEV_ERR_STAT_NONFATAL                         0x100178
+#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
+#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
+								_DEV_ERR_STAT_CORRECTABLE, \
+								_DEV_ERR_STAT_NONFATAL))
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d04a0ae018e6..e0625fa5b1ca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -875,6 +875,8 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	xe_init_hw_errors(xe);
+
 	err = xe_irq_install(xe);
 	if (err)
 		return err;
@@ -952,6 +954,15 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
+static void xe_hw_error_fini(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	int i;
+
+	for_each_tile(tile, xe, i)
+		xa_destroy(&tile->errors.hw_error);
+}
+
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -961,6 +972,8 @@ void xe_device_remove(struct xe_device *xe)
 	drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
+
+	xe_hw_error_fini(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 38c8329b4d2c..233c2751d09f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
+#include "xe_hw_error.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
@@ -206,6 +207,11 @@ struct xe_tile {
 
 	/** @debugfs: debugfs directory associated with this tile */
 	struct dentry *debugfs;
+
+	/** @errors: count of hardware errors reported for the tile */
+	struct tile_hw_errors {
+		struct xarray hw_error;
+	} errors;
 };
 
 /**
@@ -575,6 +581,10 @@ struct xe_device {
 	 */
 	atomic64_t global_total_pages;
 #endif
+	/** @hw_err_regs: list of hw error regs*/
+	struct hardware_errors_regs {
+		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
+	} hw_err_regs;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
new file mode 100644
index 000000000000..84830ad81813
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_hw_error.h"
+
+#include "regs/xe_regs.h"
+#include "regs/xe_irq_regs.h"
+#include "regs/xe_tile_error_regs.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+
+static const char *
+hardware_error_type_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "CORRECTABLE";
+	case HARDWARE_ERROR_NONFATAL:
+		return "NONFATAL";
+	case HARDWARE_ERROR_FATAL:
+		return "FATAL";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const struct err_name_index_pair dg2_err_stat_fatal_reg[] = {
+	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_FATAL_SGUNIT},
+	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
+	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair dg2_err_stat_nonfatal_reg[] = {
+	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_NONFATAL_SGUNIT},
+	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
+	[17 ... 19] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[20]        = {"MERT",			XE_HW_ERR_TILE_NONFATAL_MERT},
+	[21 ... 31] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair dg2_err_stat_correctable_reg[] = {
+	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
+	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
+	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
+	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_CORR_SGUNIT},
+	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
+	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
+	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_err_stat_fatal_reg[] = {
+	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         =  {"SGGI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGGI},
+	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9]         =  {"SGLI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGLI},
+	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[13]        =  {"SGCI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGCI},
+	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[16]        =  {"SOC ERROR",		XE_HW_ERR_TILE_UNSPEC},
+	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+	[20]        =  {"MERT Cmd Parity",	XE_HW_ERR_TILE_FATAL_MERT},
+	[21 ... 31] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_err_stat_nonfatal_reg[] = {
+	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         =  {"SGGI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGGI},
+	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9]         =  {"SGLI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGLI},
+	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[13]        =  {"SGCI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGCI},
+	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[16]        =  {"SOC",			XE_HW_ERR_TILE_UNSPEC},
+	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+	[20]        =  {"MERT Data Parity",	XE_HW_ERR_TILE_NONFATAL_MERT},
+	[21 ... 31] =  {"Undefined",            XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_err_stat_correctable_reg[] = {
+	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
+	[1 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
+	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
+	[9 ... 31]  =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
+};
+
+static void xe_assign_hw_err_regs(struct xe_device *xe)
+{
+	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
+
+	/* Error reporting is supported only for DG2 and PVC currently. */
+	if (xe->info.platform == XE_DG2) {
+		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
+		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
+		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
+	}
+
+	if (xe->info.platform == XE_PVC) {
+		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
+		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
+		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
+	}
+}
+
+static bool xe_platform_has_ras(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2)
+		return true;
+
+	return false;
+}
+
+static void
+xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
+{
+	unsigned long flags;
+	void *entry;
+
+	entry = xa_load(hw_error, index);
+	entry = xa_mk_value(xa_to_value(entry) + 1);
+
+	xa_lock_irqsave(hw_error, flags);
+	if (xa_is_err(__xa_store(hw_error, index, entry, GFP_ATOMIC)))
+		drm_err_ratelimited(drm,
+				    HW_ERR "Error reported by index %ld is lost\n", index);
+	xa_unlock_irqrestore(hw_error, flags);
+}
+
+static void
+xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct hardware_errors_regs *err_regs;
+	const struct err_name_index_pair *errstat;
+	unsigned long errsrc;
+	unsigned long flags;
+	const char *name;
+	u32 indx;
+	u32 errbit;
+
+	if (!xe_platform_has_ras(tile_to_xe(tile)))
+		return;
+
+	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
+	err_regs = &tile_to_xe(tile)->hw_err_regs;
+	errstat = err_regs->dev_err_stat[hw_err];
+	errsrc = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
+	if (!errsrc) {
+		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+				    "TILE%d reported DEV_ERR_STAT_REG_%s blank!\n",
+				    tile->id, hw_err_str);
+		goto unlock;
+	}
+
+	if (tile_to_xe(tile)->info.platform != XE_DG2)
+		drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+			"TILE%d reported DEV_ERR_STAT_REG_%s=0x%08lx\n",
+			tile->id, hw_err_str, errsrc);
+
+	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
+		name = errstat[errbit].name;
+		indx = errstat[errbit].index;
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
+		    tile_to_xe(tile)->info.platform != XE_DG2)
+			drm_warn(&tile_to_xe(tile)->drm,
+				 HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
+				 tile->id, name, hw_err_str, errbit);
+
+		else if (tile_to_xe(tile)->info.platform != XE_DG2)
+			drm_err_ratelimited(&tile_to_xe(tile)->drm,
+					    HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
+					    tile->id, name, hw_err_str, errbit);
+
+		if (indx != XE_HW_ERR_TILE_UNSPEC)
+			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
+					       &tile->errors.hw_error, indx);
+	}
+
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
+unlock:
+	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
+}
+
+/*
+ * XE Platforms adds three Error bits to the Master Interrupt
+ * Register to support error handling. These three bits are
+ * used to convey the class of error:
+ * FATAL, NONFATAL, or CORRECTABLE.
+ *
+ * To process an interrupt:
+ *       Determine source of error (IP block) by reading
+ *	 the Device Error Source Register (RW1C) that
+ *	 corresponds to the class of error being serviced
+ *	 and log the error.
+ */
+void
+xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
+{
+	enum hardware_error hw_err;
+
+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
+		if (master_ctl & XE_ERROR_IRQ(hw_err))
+			xe_hw_error_source_handler(tile, hw_err);
+	}
+}
+
+/*
+ * xe_process_hw_errors - checks for the occurrence of HW errors
+ *
+ * Fatal will result in a card warm reset and driver will be reloaded.
+ * This checks for the HW Errors that might have occurred in the
+ * previous boot of the driver.
+ */
+static void xe_process_hw_errors(struct xe_device *xe)
+{
+	struct xe_mmio *root_mmio = xe_root_tile_mmio(xe);
+
+	u32 dev_pcieerr_status, master_ctl;
+	struct xe_tile *tile;
+	int i;
+
+	dev_pcieerr_status = xe_mmio_read32(root_mmio, DEV_PCIEERR_STATUS);
+
+	for_each_tile(tile, xe, i) {
+		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
+			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
+
+		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
+		xe_hw_error_irq_handler(tile, master_ctl);
+		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
+	}
+	if (dev_pcieerr_status)
+		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
+}
+
+void xe_init_hw_errors(struct xe_device *xe)
+{
+	xe_assign_hw_err_regs(xe);
+	xe_process_hw_errors(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
new file mode 100644
index 000000000000..398e2a7f2ac6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef XE_HW_ERRORS_H_
+#define XE_HW_ERRORS_H_
+
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#define XE_RAS_REG_SIZE 32
+
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+/* Count of Correctable and Uncorrectable errors reported on tile */
+enum xe_tile_hw_errors {
+	XE_HW_ERR_TILE_UNSPEC = 0,
+	XE_HW_ERR_TILE_FATAL_SGGI,
+	XE_HW_ERR_TILE_FATAL_SGLI,
+	XE_HW_ERR_TILE_FATAL_SGUNIT,
+	XE_HW_ERR_TILE_FATAL_SGCI,
+	XE_HW_ERR_TILE_FATAL_MERT,
+	XE_HW_ERR_TILE_FATAL_UNKNOWN,
+	XE_HW_ERR_TILE_NONFATAL_SGGI,
+	XE_HW_ERR_TILE_NONFATAL_SGLI,
+	XE_HW_ERR_TILE_NONFATAL_SGUNIT,
+	XE_HW_ERR_TILE_NONFATAL_SGCI,
+	XE_HW_ERR_TILE_NONFATAL_MERT,
+	XE_HW_ERR_TILE_NONFATAL_UNKNOWN,
+	XE_HW_ERR_TILE_CORR_SGUNIT,
+	XE_HW_ERR_TILE_CORR_UNKNOWN,
+};
+
+struct err_name_index_pair {
+	const char *name;
+	const u32 index;
+};
+
+struct xe_device;
+struct xe_tile;
+
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_init_hw_errors(struct xe_device *xe);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5df5b8c2a3e4..1e9cfb8bb85d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -468,6 +468,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..b00c517e5559 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -91,6 +91,8 @@
  */
 static int xe_tile_alloc(struct xe_tile *tile)
 {
+	xa_init(&tile->errors.hw_error);
+
 	tile->mem.ggtt = xe_ggtt_alloc(tile);
 	if (!tile->mem.ggtt)
 		return -ENOMEM;
-- 
2.25.1

