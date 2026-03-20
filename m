Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8787D108B8E6
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE0410EAC7;
	Fri, 20 Mar 2026 09:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPcphN+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA3910EABC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774000445; x=1805536445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XeHeYtkYCtTmbs3zYtOKwC7xGOOMw/T4/0Kcot7xTG0=;
 b=BPcphN+y9yVcE77GCTazL3m963F4Rj3Q9r8bkdBWR0+gctQr65C0oVNQ
 jyp/9sqhakM+nNYaC4f2AqNPQ44eOOpvCC6Sk0MW9BfLtAmoDa5wr3uzV
 fCi0TLsIhGHSy9E+y49fs9eDMBkGc3jgCZ8I1T9H9umQdsqpe6gmCIiKx
 bn08vy4++bSiC2sPC0pu9grVwwR7MRPq/7P5WMvBpqjyA2EbdJ+LZWruD
 TlWjqHHIZUf6wvg4uRqhWuYcH8RpY8LwFaJ6B4/z8VT9qpTmvu3kZGq1p
 2Tt8882CI0T8CTrkas6rE1BmdRou3+O0oSLv1ZwxvbwDuo9GeJuuaCyex w==;
X-CSE-ConnectionGUID: yh2gfLalSDqCgcrzBmpJJA==
X-CSE-MsgGUID: e7iRFCuYQBKaRo7Up0f5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92469221"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92469221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:04 -0700
X-CSE-ConnectionGUID: UMIrTzgKQAKERhnms4cAhQ==
X-CSE-MsgGUID: swSyQT51Q7eFnAf/gQWkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227968131"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Anoop Vijay <anoop.c.vijay@intel.com>
Subject: [PATCH 1/5] drm/xe/xe_sysctrl: Add System controller patch
Date: Fri, 20 Mar 2026 15:55:56 +0530
Message-ID: <20260320102607.1017511-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260320102607.1017511-1-riana.tauro@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

DO NOT REVIEW. COMPILATION ONLY
This patch is from https://patchwork.freedesktop.org/series/159554/
Added only for Compilation.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  65 +++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 369 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 14 files changed, 751 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index dab979287a96..f9abaf687d46 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,8 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
+	xe_sysctrl.o \
+	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
new file mode 100644
index 000000000000..4cbde267ac44
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_ABI_H_
+#define _XE_SYSCTRL_ABI_H_
+
+#include <linux/types.h>
+
+/**
+ * DOC: System Controller ABI
+ *
+ * This header defines the Application Binary Interface (ABI) used by
+ * drm/xe to communicate with System Controller firmware on Intel Xe3p
+ * discrete GPU platforms.
+ *
+ * System Controller (sysctrl) is a firmware-managed entity on Intel
+ * dGPUs responsible for certain low-level platform management
+ * functions.
+ *
+ * Communication protocol:
+ *
+ * Communication uses a mailbox interface with messages composed of:
+ *
+ * - Application message header (struct xe_sysctrl_app_msg_hdr)
+ *   containing group_id, command, and version
+ * - Variable-length, command-specific payload
+ *
+ * Message header format:
+ *
+ * The 32-bit application message header is packed as:
+ *
+ * - Bits [7:0]   : Group ID identifying command group
+ * - Bits [15:8]  : Command identifier within group
+ * - Bits [23:16] : Command version for interface compatibility
+ * - Bits [31:24] : Reserved, must be zero
+ *
+ * This header defines firmware ABI message formats and constants shared
+ * between driver and System Controller firmware.
+ */
+
+/**
+ * struct xe_sysctrl_app_msg_hdr - Application layer message header
+ * @data: 32-bit header data
+ *
+ * Header structure for application-level messages.
+ */
+struct xe_sysctrl_app_msg_hdr {
+	u32 data;
+} __packed;
+
+#define SYSCTRL_HDR_GROUP_ID_MASK	GENMASK(7, 0)
+#define SYSCTRL_HDR_COMMAND_MASK	GENMASK(14, 8)
+#define SYSCTRL_HDR_COMMAND_MAX		0x7f
+#define SYSCTRL_HDR_IS_RESPONSE		BIT(15)
+#define SYSCTRL_HDR_RESERVED_MASK	GENMASK(23, 16)
+#define SYSCTRL_HDR_RESULT_MASK		GENMASK(31, 24)
+
+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
new file mode 100644
index 000000000000..59f3f3ec59a6
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_REGS_H_
+#define _XE_SYSCTRL_REGS_H_
+
+#include "xe_regs.h"
+
+#define SYSCTRL_BASE_OFFSET			0xdb000
+#define SYSCTRL_BASE				(SOC_BASE + SYSCTRL_BASE_OFFSET)
+#define SYSCTRL_MAILBOX_INDEX			0x03
+#define SYSCTRL_BAR_LENGTH			0x1000
+
+#define SYSCTRL_MB_CTRL				XE_REG(0x10)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY		REG_BIT(31)
+#define   SYSCTRL_MB_CTRL_IRQ			REG_BIT(30)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT		REG_BIT(29)
+#define   SYSCTRL_MB_CTRL_PARAM3_MASK		REG_GENMASK(28, 24)
+#define   SYSCTRL_MB_CTRL_PARAM2_MASK		REG_GENMASK(23, 16)
+#define   SYSCTRL_MB_CTRL_PARAM1_MASK		REG_GENMASK(15, 8)
+#define   SYSCTRL_MB_CTRL_COMMAND_MASK		REG_GENMASK(7, 0)
+#define   SYSCTRL_MB_CTRL_CMD			REG_FIELD_PREP(SYSCTRL_MB_CTRL_COMMAND_MASK, 5)
+
+#define SYSCTRL_MB_DATA0			XE_REG(0x14)
+#define SYSCTRL_MB_DATA1			XE_REG(0x18)
+#define SYSCTRL_MB_DATA2			XE_REG(0x1c)
+#define SYSCTRL_MB_DATA3			XE_REG(0x20)
+
+#define SYSCTRL_FRAME_PHASE			REG_BIT(24)
+#define SYSCTRL_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
+#define SYSCTRL_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
+#define SYSCTRL_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e77a3a3db73d..c70d4ae413a9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,6 +65,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_sysctrl_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 615218d775b1..150c76b2acaf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -27,6 +27,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
 #include "xe_validation.h"
 
@@ -196,6 +197,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -508,6 +511,9 @@ struct xe_device {
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..f5dd77b6680f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 8eee4fb1c57c..08386c5eca27 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -57,6 +57,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_sysctrl:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 01185f10a883..abdddd44a575 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -26,6 +26,7 @@
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_sysctrl.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
@@ -206,6 +207,8 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	xe_sysctrl_pm_suspend(xe);
+
 	drm_dbg(&xe->drm, "Device suspended\n");
 	xe_pm_block_end_signalling();
 
@@ -259,6 +262,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, true);
 
+	xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
@@ -618,6 +623,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	if (xe->d3cold.allowed)
+		xe_sysctrl_pm_suspend(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -670,6 +678,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
 
+	if (xe->d3cold.allowed)
+		xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
new file mode 100644
index 000000000000..d8f1f8cc2244
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_printk.h"
+#include "xe_soc_remapper.h"
+#include "xe_sriov.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+
+/**
+ * DOC: System Controller (sysctrl)
+ *
+ * System Controller (sysctrl) is a firmware-managed entity on Intel dGPUs
+ * responsible for selected low-level platform management functions.
+ * Communication between driver and System Controller is performed
+ * via a mailbox interface, enabling command and response exchange.
+ *
+ * This module provides initialization and support code for interacting
+ * with System Controller through the mailbox interface.
+ */
+static void sysctrl_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
+}
+
+/**
+ * xe_sysctrl_init() - Initialize System Controller subsystem
+ * @xe: xe device instance
+ *
+ * Entry point for System Controller initialization, called from xe_device_probe.
+ * This function checks platform support and initializes the system controller.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_sysctrl_init(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_sysctrl *sc = &xe->sc;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
+	if (ret)
+		return ret;
+
+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
+	if (!sc->mmio)
+		return -ENOMEM;
+
+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
+	sc->mmio->adj_offset = SYSCTRL_BASE;
+	sc->mmio->adj_limit = U32_MAX;
+
+	ret = devm_mutex_init(xe->drm.dev, &sc->cmd_lock);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_init(sc);
+
+	return 0;
+}
+
+/**
+ * xe_sysctrl_pm_suspend() - System Controller suspend handler
+ * @xe: xe device instance
+ *
+ * Invoked during system suspend (S3/S4) and runtime suspend to D3.
+ *
+ * The SoC remapper region is cleared automatically by hardware on D3
+ * cold entry. No action is required. This function is kept to preserve
+ * suspend/resume symmetry and provide a hook for future System Controller
+ * suspend handling.
+ */
+void xe_sysctrl_pm_suspend(struct xe_device *xe)
+{
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* SoC remapper region is disabled automatically on D3 cold entry; no action required. */
+}
+
+/**
+ * xe_sysctrl_pm_resume() - System Controller resume handler
+ * @xe: xe device instance
+ *
+ * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
+ * Restores SoC remapper configuration and reinitializes mailbox interface.
+ */
+void xe_sysctrl_pm_resume(struct xe_device *xe)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	xe_sysctrl_mailbox_init(sc);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
new file mode 100644
index 000000000000..a816feed8da6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_H_
+#define _XE_SYSCTRL_H_
+
+#include <linux/container_of.h>
+
+#include "xe_device_types.h"
+#include "xe_sysctrl_types.h"
+
+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
+{
+	return container_of(sc, struct xe_device, sc);
+}
+
+int xe_sysctrl_init(struct xe_device *xe);
+void xe_sysctrl_pm_suspend(struct xe_device *xe);
+void xe_sysctrl_pm_resume(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
new file mode 100644
index 000000000000..b10c8b7e0c40
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+struct xe_sysctrl_mailbox_msg_hdr {
+	__le32 data;
+} __packed;
+
+#define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
+	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_HDR_COMMAND(hdr) \
+	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
+	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_HDR_RESULT(hdr) \
+	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+
+static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
+				   unsigned int timeout_ms)
+{
+	int ret;
+
+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+				 timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
+				 unsigned int timeout_ms)
+{
+	int ret;
+
+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+			     timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
+			       size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
+
+	memcpy(val, frame, len);
+
+	for (i = 0; i < dw; i++)
+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
+
+	return 0;
+}
+
+static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
+			      size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
+
+	for (i = 0; i < dw; i++)
+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
+
+	memcpy(frame, val, len);
+
+	return 0;
+}
+
+static void sysctrl_clear_response(struct xe_sysctrl *sc)
+{
+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
+}
+
+static int sysctrl_prepare_command(struct xe_device *xe,
+				   u8 group_id, u8 command,
+				   const void *data_in, size_t data_in_len,
+				   u8 **mbox_cmd, size_t *cmd_size)
+{
+	struct xe_sysctrl_mailbox_msg_hdr *hdr;
+	size_t size;
+	u8 *buffer;
+
+	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
+
+	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
+		return -EINVAL;
+	}
+
+	size = sizeof(*hdr) + data_in_len;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
+	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
+				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
+
+	if (data_in && data_in_len)
+		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
+
+	*mbox_cmd = buffer;
+	*cmd_size = size;
+
+	return 0;
+}
+
+static int sysctrl_send_frames(struct xe_sysctrl *sc,
+			       const u8 *mbox_cmd,
+			       size_t cmd_size, unsigned int timeout_ms)
+{
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 ctrl_reg, total_frames, frame;
+	size_t bytes_sent, frame_size;
+
+	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
+
+	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
+		xe_err(xe, "sysctrl: Mailbox busy\n");
+		return -EBUSY;
+	}
+
+	sc->phase_bit ^= 1;
+	bytes_sent = 0;
+
+	for (frame = 0; frame < total_frames; frame++) {
+		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
+
+		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
+			sc->phase_bit = 0;
+			return -EIO;
+		}
+
+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
+			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
+			   REG_FIELD_PREP(SYSCTRL_FRAME_TOTAL_MASK, total_frames - 1) |
+			   SYSCTRL_MB_CTRL_CMD |
+			   (sc->phase_bit ? SYSCTRL_FRAME_PHASE : 0);
+
+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
+
+		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
+			sc->phase_bit = 0;
+			return -ETIMEDOUT;
+		}
+
+		bytes_sent += frame_size;
+	}
+
+	return 0;
+}
+
+static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
+				 size_t frame_size, unsigned int timeout_ms,
+				 bool *done)
+{
+	u32 curr_frame, total_frames, ctrl_reg;
+	struct xe_device *xe = sc_to_xe(sc);
+	int ret;
+
+	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
+		xe_err(xe, "sysctrl: Response frame timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
+	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
+	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
+
+	ret = sysctrl_read_frame(sc, out, frame_size);
+	if (ret)
+		return ret;
+
+	sysctrl_clear_response(sc);
+
+	if (curr_frame == total_frames)
+		*done = true;
+
+	return 0;
+}
+
+static int sysctrl_receive_frames(struct xe_sysctrl *sc,
+				  const struct xe_sysctrl_mailbox_msg_hdr *req,
+				  void *data_out, size_t data_out_len,
+				  size_t *rdata_len, unsigned int timeout_ms)
+{
+	struct xe_sysctrl_mailbox_msg_hdr *hdr;
+	struct xe_device *xe = sc_to_xe(sc);
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
+	size_t frame_size;
+	bool done = false;
+	int ret = 0;
+	u8 *out;
+
+	if (!buffer)
+		return -ENOMEM;
+
+	out = buffer;
+	while (!done && remain) {
+		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
+
+		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
+					    &done);
+		if (ret)
+			return ret;
+
+		remain -= frame_size;
+		out += frame_size;
+	}
+
+	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
+
+	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
+	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
+	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
+		xe_err(xe, "sysctrl: Response header mismatch\n");
+		return -EPROTO;
+	}
+
+	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
+		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
+		       XE_SYSCTRL_HDR_RESULT(hdr));
+		return -EIO;
+	}
+
+	memcpy(data_out, hdr + 1, data_out_len);
+	*rdata_len = out - buffer - sizeof(*hdr);
+
+	return 0;
+}
+
+static int sysctrl_send_command(struct xe_sysctrl *sc,
+				const u8 *mbox_cmd, size_t cmd_size,
+				void *data_out, size_t data_out_len,
+				size_t *rdata_len, unsigned int timeout_ms)
+{
+	const struct xe_sysctrl_mailbox_msg_hdr *hdr;
+	size_t received;
+	int ret;
+
+	ret = sysctrl_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
+	if (ret)
+		return ret;
+
+	if (!data_out || !rdata_len)
+		return 0;
+
+	hdr = (const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
+
+	ret = sysctrl_receive_frames(sc, hdr, data_out, data_out_len,
+				     &received, timeout_ms);
+	if (ret)
+		return ret;
+
+	*rdata_len = received;
+
+	return 0;
+}
+
+/**
+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
+ * @sc: System controller structure
+ *
+ * Initialize system controller mailbox interface for communication.
+ */
+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
+{
+	u32 ctrl_reg;
+
+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
+	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
+}
+
+/**
+ * xe_sysctrl_send_command() - Send mailbox command to System Controller
+ * @sc: System Controller instance
+ * @cmd: Command descriptor containing request header and payload buffers
+ * @rdata_len: Pointer to store actual response data length
+ *
+ * Sends a mailbox command to System Controller firmware using
+ * System Controller mailbox and waits for a response.
+ *
+ * Request payload is provided via @cmd->data_in and @cmd->data_in_len.
+ * If a response is expected, @cmd->data_out must point to a buffer of
+ * size @cmd->data_out_len supplied by caller.
+ *
+ * On success, @rdata_len is updated with number of valid response bytes
+ * returned by firmware, bounded by @cmd->data_out_len.
+ *
+ * Return: 0 on success, or negative errno on failure.
+ */
+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len)
+{
+	struct xe_device *xe = sc_to_xe(sc);
+	u8 group_id, command_code;
+	u8 *mbox_cmd = NULL;
+	size_t cmd_size = 0;
+	int ret;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	xe_assert(xe, xe->info.has_sysctrl);
+	xe_assert(xe, cmd->data_in || cmd->data_out);
+	xe_assert(xe, !cmd->data_in || cmd->data_in_len);
+	xe_assert(xe, !cmd->data_out || cmd->data_out_len);
+
+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
+
+	might_sleep();
+
+	ret = sysctrl_prepare_command(xe, group_id, command_code,
+				      cmd->data_in, cmd->data_in_len,
+				      &mbox_cmd, &cmd_size);
+	if (ret) {
+		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	guard(mutex)(&sc->cmd_lock);
+
+	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
+				   cmd->data_out, cmd->data_out_len, rdata_len,
+				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
+	if (ret)
+		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+
+	kfree(mbox_cmd);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
new file mode 100644
index 000000000000..91460be9e22c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_MAILBOX_H_
+#define _XE_SYSCTRL_MAILBOX_H_
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#include "abi/xe_sysctrl_abi.h"
+
+struct xe_sysctrl;
+struct xe_sysctrl_mailbox_command;
+
+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
+
+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
new file mode 100644
index 000000000000..89456aec6097
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_MAILBOX_TYPES_H_
+#define _XE_SYSCTRL_MAILBOX_TYPES_H_
+
+#include <linux/types.h>
+
+#include "abi/xe_sysctrl_abi.h"
+
+/**
+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command
+ */
+struct xe_sysctrl_mailbox_command {
+	/** @header: Application message header containing command information */
+	struct xe_sysctrl_app_msg_hdr header;
+
+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
+	void *data_in;
+
+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
+	size_t data_in_len;
+
+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
+	void *data_out;
+
+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
+	size_t data_out_len;
+};
+
+#define XE_SYSCTRL_MB_FRAME_SIZE	16
+#define XE_SYSCTRL_MB_MAX_FRAMES	64
+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
+	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
+
+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
new file mode 100644
index 000000000000..8217f6befe70
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_TYPES_H_
+#define _XE_SYSCTRL_TYPES_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct xe_mmio;
+
+/**
+ * struct xe_sysctrl - System Controller driver context
+ *
+ * This structure maintains the runtime state for System Controller
+ * communication. All fields are initialized during xe_sysctrl_init()
+ * and protected appropriately for concurrent access.
+ */
+struct xe_sysctrl {
+	/** @mmio: MMIO region for system control registers */
+	struct xe_mmio *mmio;
+
+	/** @cmd_lock: Mutex protecting mailbox command operations */
+	struct mutex cmd_lock;
+
+	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
+	bool phase_bit;
+};
+
+#endif
-- 
2.47.1

