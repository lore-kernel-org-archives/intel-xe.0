Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A80C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3856E10E712;
	Wed,  2 Jul 2025 13:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njzOCpEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2310E713
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464026; x=1783000026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=10GPsk6mVJsoTz93Rw9K1tQu25+E4KyPtot5m5w9oTs=;
 b=njzOCpEBqz6j38mwtevPmiW3DANURT71uQdLyX/fnXh/OB9iVMlk5rfK
 a5eK+z+QvxnuoyPCzfr3VXNOY6tb5eGwRtbKwoIwqlNmOXI7mybcn1GtD
 xcfHR9o18oJf3uY11DXHr0D2SxHsRbE+jEisdCX4wfIUHPnC32QwrPTle
 A2GwAm3OTGB+A7dB+NuuUGvySEufs5mq2vWP81AA07Zy1b2J+SlBjrYcJ
 1p/T/Ezigt3W8K2UOz0o0vUEiQ54lm2hoLUeG+2JYipV/UykR6ax8lEoE
 pSMlc/q5NbA2BnfHobZAVETTKLrYnyqxKPiBJwCM/4ZTJFp/Ia98Fn4mr Q==;
X-CSE-ConnectionGUID: Ogv4+IsfTSCxwfCYWDI1WQ==
X-CSE-MsgGUID: U0mRS/kGTwSW5Iq3IWp9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186096"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:47:06 -0700
X-CSE-ConnectionGUID: I2aseEinRMaUgZ7ERBnIwg==
X-CSE-MsgGUID: gPKMlbSrQi2tup1W1HHb3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177756011"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:47:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 5/7] drm/xe: Add support to handle hardware errors
Date: Wed,  2 Jul 2025 19:41:15 +0530
Message-ID: <20250702141118.3564242-6-riana.tauro@intel.com>
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

Gfx device reports two classes of errors: uncorrectable and
correctable. Depending on the severity uncorrectable errors are
further classified as non fatal and fatal

Correctable and non-fatal errors are reported as MSI's and bits in
the Master Interrupt Register indicate the class of the error.
The source of the error is then read from the Device Error Source
Register. Fatal errors are reported as PCIe errors
When a PCIe error is asserted, the OS will perform a device warm reset
which causes the driver to reload. The error registers are sticky
and the values are maintained through a warm reset

Add basic support to handle these errors

Bspec: 50875, 53073, 53074, 53075, 53076

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 108 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
 drivers/gpu/drm/xe/xe_irq.c                |   4 +
 6 files changed, 144 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d97e5b63f4e..fea8ee3b0785 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
+	xe_hw_error.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
new file mode 100644
index 000000000000..ed9b81fb28a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_HW_ERROR_REGS_H_
+#define _XE_HW_ERROR_REGS_H_
+
+#define DEV_ERR_STAT_NONFATAL			0x100178
+#define DEV_ERR_STAT_CORRECTABLE		0x10017c
+#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
+								  DEV_ERR_STAT_CORRECTABLE, \
+								  DEV_ERR_STAT_NONFATAL))
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index f0ecfcac4003..2758b64cec9e 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -18,6 +18,7 @@
 #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
+#define   ERROR_IRQ(x)				REG_BIT(26 + (x))
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
new file mode 100644
index 000000000000..0f2590839900
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "regs/xe_hw_error_regs.h"
+#include "regs/xe_irq_regs.h"
+
+#include "xe_device.h"
+#include "xe_hw_error.h"
+#include "xe_mmio.h"
+
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+static const char *hw_error_to_str(const enum hardware_error hw_err)
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
+static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+	unsigned long flags;
+	u32 err_src;
+
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return;
+
+	spin_lock_irqsave(&xe->irq.lock, flags);
+	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
+	if (!err_src) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
+				    tile->id, hw_err_str);
+		goto unlock;
+	}
+
+	/* TODO: Process errrors per source */
+
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
+
+unlock:
+	spin_unlock_irqrestore(&xe->irq.lock, flags);
+}
+
+/**
+ * xe_hw_error_irq_handler - irq handling for hw errors
+ * @tile: tile instance
+ * @master_ctl: value read from master interrupt register
+ *
+ * Xe platforms add three error bits to the master interrupt register to support error handling.
+ * These three bits are used to convey the class of error FATAL, NONFATAL, or CORRECTABLE.
+ * To process the interrupt, determine the source of error by reading the Device Error Source
+ * Register that corresponds to the class of error being serviced.
+ */
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
+{
+	enum hardware_error hw_err;
+
+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
+		if (master_ctl & ERROR_IRQ(hw_err))
+			hw_error_source_handler(tile, hw_err);
+}
+
+/*
+ * Process hardware errors during boot
+ */
+static void process_hw_errors(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u32 master_ctl;
+	u8 id;
+
+	for_each_tile(tile, xe, id) {
+		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
+		xe_hw_error_irq_handler(tile, master_ctl);
+		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
+	}
+}
+
+/**
+ * xe_hw_error_init - Initialize hw errors
+ * @xe: xe device instance
+ *
+ * Initialize and process hw errors
+ */
+void xe_hw_error_init(struct xe_device *xe)
+{
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+	process_hw_errors(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
new file mode 100644
index 000000000000..d86e28c5180c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef XE_HW_ERROR_H_
+#define XE_HW_ERROR_H_
+
+#include <linux/types.h>
+
+struct xe_tile;
+struct xe_device;
+
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_hw_error_init(struct xe_device *xe);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5362d3174b06..24ccf3bec52c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -18,6 +18,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_hw_error.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_pxp.h"
@@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
@@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
 	int nvec = 1;
 	int err;
 
+	xe_hw_error_init(xe);
+
 	xe_irq_reset(xe);
 
 	if (xe_device_has_msix(xe)) {
-- 
2.47.1

