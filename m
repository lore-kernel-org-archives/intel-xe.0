Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D6EE4993
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 08:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C8110E3FA;
	Wed, 23 Aug 2023 08:53:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A7610E3FC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692780785; x=1724316785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4yvqw7sHaSdSVi2mb8LOVgujOxD4pgVRE43c3XqMmc=;
 b=mQb9wql/5+ljrxKPNq6sglwe7OaoOqfFEBbuuIOsxG+AJDtZXvOoeVRb
 tyKzexSyCfOukiW1NPDzHe6LmqJIU93KPvQp7pXa5ZDoSPU3EAzyrDVGa
 5fybKTLH3WdAZDfyrC8Yz5CaK2uBaEM6GZ4XaTE7CIsA97grAwJFwtx/T
 Thn2wav0GgL/sa7DLeXUPF38WYijViJLCuQdJ+kbLv7w7h8I42Dzy9J06
 YV0FcH8t5Pwr/omNVLYYwtKvteVjwFZjASPMEmFjeNL7dVslx+nLFCuFV
 h3sjDft4fZPjQPAIOXxjF8HJrXKmjWFuaR/Q1RlpCGbeQ4tzZdTqA0/WS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377868501"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377868501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713497225"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="713497225"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 01:53:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 14:28:39 +0530
Message-Id: <20230823085842.1440523-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/4] drm/xe: Handle errors from various
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GFX device can generate numbers of classes of error under the new
infrastructure: correctable, non-fatal, and fatal errors.

The non-fatal and fatal error classes distinguish between levels of
severity for uncorrectable errors. Driver will only handle logging
of errors and updating counters from various components within the
graphics device. Anything more will be handled at system level.

For errors that will route as interrupts, three bits in the Master
Interrupt Register will be used to convey the class of error.

For each class of error: Determine source of error (IP block) by reading
the Device Error Source Register (RW1C) that
corresponds to the class of error being serviced.

Bspec: 50875, 53073, 53074, 53075

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   2 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 ++
 drivers/gpu/drm/xe/xe_device_types.h         |  11 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 211 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  64 ++++++
 drivers/gpu/drm/xe/xe_irq.c                  |   3 +
 7 files changed, 306 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 550cdfed729e..6290c8ce0e84 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -75,6 +75,7 @@ xe-y += xe_bb.o \
 	xe_guc_submit.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
+	xe_hw_error.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 39d7b0740bf0..e223975a5acf 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -88,7 +88,7 @@
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
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index dbb732e14606..4e4184977709 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
+#include "xe_hw_error.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
 
@@ -172,6 +173,11 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @tile_hw_errors: hardware errors reported for the tile */
+	struct tile_hw_errors {
+		unsigned long count[XE_TILE_HW_ERROR_MAX];
+	} errors;
 };
 
 /**
@@ -359,6 +365,11 @@ struct xe_device {
 	 */
 	struct task_struct *pm_callback_task;
 
+	/** @hardware_errors_regs: list of hw error regs*/
+	struct hardware_errors_regs {
+		const struct err_msg_cntr_pair *dev_err_stat[HARDWARE_ERROR_MAX];
+	} hw_err_regs;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
new file mode 100644
index 000000000000..357d0f962d91
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -0,0 +1,211 @@
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
+static const struct err_msg_cntr_pair dg2_err_stat_fatal_reg[] = {
+	[0]         = {"GT",			XE_TILE_HW_ERR_GT_FATAL},
+	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_FATAL},
+	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_FATAL},
+	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_FATAL},
+	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_FATAL},
+	[17 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair dg2_err_stat_nonfatal_reg[] = {
+	[0]         = {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
+	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_NONFATAL},
+	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_NONFATAL},
+	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_NONFATAL},
+	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL},
+	[17 ... 19] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[20]        = {"MERT",			XE_TILE_HW_ERR_MERT_NONFATAL},
+	[21 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+};
+
+static const struct err_msg_cntr_pair dg2_err_stat_correctable_reg[] = {
+	[0]         = {"GT",			XE_TILE_HW_ERR_GT_CORR},
+	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_CORR},
+	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_CORR},
+	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_CORR},
+	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_CORR},
+	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_CORR},
+	[17 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_CORR},
+};
+
+static const struct err_msg_cntr_pair pvc_err_stat_fatal_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_FATAL},
+	[1]         =  {"SGGI Cmd Parity",	XE_TILE_HW_ERR_SGGI_FATAL},
+	[2 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[8]         =  {"GSC error",		XE_TILE_HW_ERR_GSC_FATAL},
+	[9]         =  {"SGLI Cmd Parity",	XE_TILE_HW_ERR_SGLI_FATAL},
+	[10 ... 12] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[13]        =  {"SGCI Cmd Parity",	XE_TILE_HW_ERR_SGCI_FATAL},
+	[14 ... 15] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[16]        =  {"SOC ERROR",		XE_TILE_HW_ERR_SOC_FATAL},
+	[17 ... 19] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	[20]        =  {"MERT Cmd Parity",	XE_TILE_HW_ERR_MERT_FATAL},
+	[21 ... 31] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair pvc_err_stat_nonfatal_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
+	[1]         =  {"SGGI Data Parity",	XE_TILE_HW_ERR_SGGI_NONFATAL},
+	[2 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[8]         =  {"GSC",			XE_TILE_HW_ERR_GSC_NONFATAL},
+	[9]         =  {"SGLI Data Parity",	XE_TILE_HW_ERR_SGLI_NONFATAL},
+	[10 ... 12] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[13]        =  {"SGCI Data Parity",	XE_TILE_HW_ERR_SGCI_NONFATAL},
+	[14 ... 15] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[16]        =  {"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL},
+	[17 ... 19] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	[20]        =  {"MERT Data Parity",	XE_TILE_HW_ERR_MERT_NONFATAL},
+	[21 ... 31] =  {"Undefined",            XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+};
+
+static const struct err_msg_cntr_pair pvc_err_stat_correctable_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_CORR},
+	[1 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	[8]         =  {"GSC",			XE_TILE_HW_ERR_GSC_CORR},
+	[9 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+};
+
+static const struct err_msg_cntr_pair dev_err_stat_fatal_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_FATAL},
+	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair dev_err_stat_nonfatal_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
+	[1 ... 31]  =  {"Undefined",            XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+};
+
+static const struct err_msg_cntr_pair dev_err_stat_correctable_reg[] = {
+	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_CORR},
+	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
+};
+
+void xe_assign_hw_err_regs(struct xe_device *xe)
+{
+	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
+
+	if (xe->info.platform == XE_DG2) {
+		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
+		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
+		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
+	} else if (xe->info.platform == XE_PVC) {
+		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
+		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
+		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
+	} else {
+		/* For other platforms report only GT errors */
+		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
+		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dev_err_stat_nonfatal_reg;
+		dev_err_stat[HARDWARE_ERROR_FATAL] = dev_err_stat_fatal_reg;
+	}
+}
+
+static void
+xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct hardware_errors_regs *err_regs;
+	const struct err_msg_cntr_pair *errstat;
+	unsigned long errsrc;
+	unsigned long flags;
+	const char *errmsg;
+	struct xe_gt *mmio;
+	u32 indx;
+	u32 errbit;
+
+	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
+	err_regs = &tile_to_xe(tile)->hw_err_regs;
+	errstat = err_regs->dev_err_stat[hw_err];
+	mmio = tile->primary_gt;
+	errsrc = xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
+	if (!errsrc) {
+		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+				    "TILE%d detected DEV_ERR_STAT_REG_%s blank!\n",
+				    tile->id, hw_err_str);
+		goto unlock;
+	}
+
+	drm_info(&tile_to_xe(tile)->drm, HW_ERR
+		 "TILE%d DEV_ERR_STAT_REG_%s=0x%08lx\n", tile->id, hw_err_str, errsrc);
+
+	for_each_set_bit(errbit, &errsrc, 32) {
+		errmsg = errstat[errbit].errmsg;
+		indx = errstat[errbit].cntr_indx;
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+			drm_warn(&tile_to_xe(tile)->drm,
+				 HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
+				 tile->id, errmsg, hw_err_str, errbit);
+
+		else
+			drm_err_ratelimited(&tile_to_xe(tile)->drm,
+					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
+					    tile->id, errmsg, hw_err_str, errbit);
+		tile->errors.count[indx]++;
+	}
+
+	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
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
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
new file mode 100644
index 000000000000..c0c05b9130eb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -0,0 +1,64 @@
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
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+/* Count of  Correctable and Uncorrectable errors reported on tile */
+enum xe_tile_hw_errors {
+	XE_TILE_HW_ERR_GT_FATAL = 0,
+	XE_TILE_HW_ERR_SGGI_FATAL,
+	XE_TILE_HW_ERR_DISPLAY_FATAL,
+	XE_TILE_HW_ERR_SGDI_FATAL,
+	XE_TILE_HW_ERR_SGLI_FATAL,
+	XE_TILE_HW_ERR_SGUNIT_FATAL,
+	XE_TILE_HW_ERR_SGCI_FATAL,
+	XE_TILE_HW_ERR_GSC_FATAL,
+	XE_TILE_HW_ERR_SOC_FATAL,
+	XE_TILE_HW_ERR_MERT_FATAL,
+	XE_TILE_HW_ERR_SGMI_FATAL,
+	XE_TILE_HW_ERR_UNKNOWN_FATAL,
+	XE_TILE_HW_ERR_SGGI_NONFATAL,
+	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
+	XE_TILE_HW_ERR_SGDI_NONFATAL,
+	XE_TILE_HW_ERR_SGLI_NONFATAL,
+	XE_TILE_HW_ERR_GT_NONFATAL,
+	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
+	XE_TILE_HW_ERR_SGCI_NONFATAL,
+	XE_TILE_HW_ERR_GSC_NONFATAL,
+	XE_TILE_HW_ERR_SOC_NONFATAL,
+	XE_TILE_HW_ERR_MERT_NONFATAL,
+	XE_TILE_HW_ERR_SGMI_NONFATAL,
+	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
+	XE_TILE_HW_ERR_GT_CORR,
+	XE_TILE_HW_ERR_DISPLAY_CORR,
+	XE_TILE_HW_ERR_SGUNIT_CORR,
+	XE_TILE_HW_ERR_GSC_CORR,
+	XE_TILE_HW_ERR_SOC_CORR,
+	XE_TILE_HW_ERR_UNKNOWN_CORR,
+	XE_TILE_HW_ERROR_MAX,
+};
+
+struct err_msg_cntr_pair {
+	const char *errmsg;
+	const u32 cntr_indx;
+};
+
+struct xe_device;
+struct xe_tile;
+
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_assign_hw_err_regs(struct xe_device *xe);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 1dee3e832eb5..48b933234342 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -418,6 +418,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
@@ -572,6 +573,8 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
+	xe_assign_hw_err_regs(xe);
+
 	xe->irq.enabled = true;
 
 	xe_irq_reset(xe);
-- 
2.25.1

