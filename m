Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20434CDB474
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 02:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2D10E35D;
	Wed, 18 Oct 2023 02:51:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A1010E35D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 02:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697597466; x=1729133466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DSZTyle+xPqjqZMxRSB+iMhWKdnZLwEmxJUGkSR+0RI=;
 b=CYB7UB9l8BP4Mh4sororka/6bij1H6jF4psFkZc8ZIwyja8DGE2am4cr
 f3vU6PtkNij+PTcFaMPibH2gZGeHUEmovU36UN/+gvFxRVjmmsdFubUBa
 UutqVWJ18FUj0NfqVCKW4GL8Ek66tkaAy5M1dFP2Xxtbqus9h5jEh/8gc
 q/Jf8om3ODwq5Q+F1asADeo4uqG58OO/sdEjpnQh206rkSxDcRZMVH2v1
 dVG1wGarknEPpCcD0HBf/JjCOU8jkZsdBvXGbVahcMWXQKAlKBVKuq+1o
 3JHEOATth/9gLdOdyjznn2RU/gLpU4NnpdsOPRR8pIgcRCt0wl2eC9Mqd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366180525"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="366180525"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 19:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="732967388"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="732967388"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 17 Oct 2023 19:51:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 08:27:39 +0530
Message-Id: <20231018025748.1225528-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
References: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 01/10] drm/xe: Handle errors from various
 components.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 ++
 drivers/gpu/drm/xe/xe_device.c               |  10 +
 drivers/gpu/drm/xe/xe_device_types.h         |  11 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 262 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  53 ++++
 drivers/gpu/drm/xe/xe_irq.c                  |   4 +
 drivers/gpu/drm/xe/xe_tile.c                 |   1 +
 9 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cee57681732d..ed772f440689 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -77,6 +77,7 @@ xe-y += xe_bb.o \
 	xe_heci_gsc.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
+	xe_hw_error.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2240cd157603..4b513636a5ff 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -57,6 +57,9 @@
 
 #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
 
+#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
+
 #define GU_CNTL					XE_REG(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
 
@@ -95,7 +98,7 @@
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
+#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
 
 #define PVC_RP_STATE_CAP			XE_REG(0x281014)
-
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
new file mode 100644
index 000000000000..db78d6687213
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef XE_TILE_ERROR_REGS_H_
+#define XE_TILE_ERROR_REGS_H_
+
+#include <linux/stddef.h>
+
+#define _DEV_ERR_STAT_NONFATAL                         0x100178
+#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
+#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
+								_DEV_ERR_STAT_CORRECTABLE, \
+								_DEV_ERR_STAT_NONFATAL))
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7f0ba744c73f..79685348cc69 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,8 +388,18 @@ static void xe_device_remove_display(struct xe_device *xe)
 	xe_display_driver_remove(xe);
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
+	xe_hw_error_fini(xe);
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 44d622d4cc3a..c4464dcef56f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -15,6 +15,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_gt_types.h"
+#include "xe_hw_error.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_pmu.h"
@@ -190,6 +191,11 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @errors: hardware errors reported for the tile */
+	struct tile_hw_errors {
+		struct xarray hw_error;
+	} errors;
 };
 
 /**
@@ -405,6 +411,11 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @hw_err_regs: list of hw error regs*/
+	struct hardware_errors_regs {
+		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
+	} hw_err_regs;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
new file mode 100644
index 000000000000..ac25072db6c0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_hw_error.h"
+
+#include "regs/xe_regs.h"
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
+void xe_assign_hw_err_regs(struct xe_device *xe)
+{
+	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
+
+	/* Error reporting is supported only for DG2 and
+	 * PVC currently. Error reporting support for other
+	 * platforms needs to be added later.
+	 */
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
+static bool xe_ras_enabled(struct xe_device *xe)
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
+	struct xe_gt *gt;
+	u32 indx;
+	u32 errbit;
+
+	if (!xe_ras_enabled(tile_to_xe(tile)))
+		return;
+
+	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
+	err_regs = &tile_to_xe(tile)->hw_err_regs;
+	errstat = err_regs->dev_err_stat[hw_err];
+	gt = tile->primary_gt;
+	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err));
+	if (!errsrc) {
+		if (tile_to_xe(tile)->info.platform == XE_DG2)
+			goto unlock;
+
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
+	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
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
+void xe_process_hw_errors(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_gt *root_gt = root_tile->primary_gt;
+
+	u32 dev_pcieerr_status, master_ctl;
+	struct xe_tile *tile;
+	int i;
+
+	dev_pcieerr_status = xe_mmio_read32(root_gt, DEV_PCIEERR_STATUS);
+
+	for_each_tile(tile, xe, i) {
+		struct xe_gt *gt = tile->primary_gt;
+
+		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
+			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
+
+		master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
+		xe_hw_error_irq_handler(tile, master_ctl);
+		xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
+	}
+	if (dev_pcieerr_status)
+		xe_mmio_write32(root_gt, DEV_PCIEERR_STATUS, dev_pcieerr_status);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
new file mode 100644
index 000000000000..e74dd6fc6faf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -0,0 +1,53 @@
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
+	XE_HW_ERR_TILE_FATAL_SGGI = 0,
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
+	XE_HW_ERR_TILE_UNSPEC,
+	XE_HW_ERROR_TILE_MAX,
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
+void xe_assign_hw_err_regs(struct xe_device *xe);
+void xe_process_hw_errors(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 61350ed32c61..8365a4cb0c45 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -444,6 +444,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
@@ -619,6 +620,9 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
+	xe_assign_hw_err_regs(xe);
+	xe_process_hw_errors(xe);
+
 	xe_irq_reset(xe);
 
 	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f65..3350a3bf4503 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -130,6 +130,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
+	xa_init(&tile->errors.hw_error);
 	xe_device_mem_access_get(tile_to_xe(tile));
 
 	err = tile_ttm_mgr_init(tile);
-- 
2.25.1

