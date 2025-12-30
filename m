Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498F6EE0205
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 15:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727810E90C;
	Tue, 30 Dec 2025 15:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdp/C0kG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91BC10E90C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767107873; x=1798643873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rTquXCaQDethtw0eQCbK7X8Ky4wm6/PjxfcOySKDGxA=;
 b=kdp/C0kGPsfrBWNlo2Vk9ht3h/NBi5ZzNqZSoMkAGj8Uc48TEevrTrWL
 b3QgyilxdvDfw4z5Xj04TNRz26XugHJO1A5TqDUFAFDwHNWw09ClmGJ2r
 +qpK7QMSMU+6NKvfopM++qnO5vw+H5h3/0TkSMvzh+2YABCCa5fhGP3QU
 PsfB033yur4+va6yWXiL694mHBpv3qWKSozooOww0J09Kj7CDRQM0rboX
 IlyCP7XXWSqgnxKSgl3GDxhiEOHOIooJ2QNoE5OsLav34sTRYL7LT1zGF
 Y7cdBtCPT5wJYLuHMEIanUb0tKlWe/oGlYiTi+GJfEbnIuKzrxlEvm7Qj w==;
X-CSE-ConnectionGUID: RgdNXjoDSl+onKkouRZe6A==
X-CSE-MsgGUID: f1weexrdRXugluK6RT1qgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68586970"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68586970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 07:17:53 -0800
X-CSE-ConnectionGUID: 05NxU3knTmaecLp6mF8++Q==
X-CSE-MsgGUID: gLVd9d3ES1G9iHUsXrEJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="200874628"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 07:17:50 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v1 1/1] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Tue, 30 Dec 2025 07:17:23 -0800
Message-ID: <20251230151722.293657-4-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230151722.293657-3-anoop.c.vijay@intel.com>
References: <20251230151722.293657-3-anoop.c.vijay@intel.com>
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

Add a new system controller (sysctrl) component for Intel Xe3p dGPU platforms.

This component provides the foundational infrastructure for communication
with the System Controller firmware using MKHI protocol over a mailbox interface.

Key features introduced:
 - Detection and initialization of System Controller interface on Xe3p dGPU platforms
 - Mailbox communication with System Controller firmware
 - Fragmented message transfer for large command payloads

This implementation establishes the base for future System Controller feature
enablement and firmware command handling.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
 drivers/gpu/drm/xe/xe_device.c            |   5 +
 drivers/gpu/drm/xe/xe_device_types.h      |   6 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c           |  64 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h           |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 438 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  61 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h     |  25 ++
 11 files changed, 661 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3315f93a35b2..cd03e4c53127 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -121,6 +121,8 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
+	xe_sysctrl.o \
+	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
new file mode 100644
index 000000000000..b31b6e24c18e
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_REGS_H_
+#define _XE_SYSCTRL_REGS_H_
+
+#include "xe_regs.h"
+
+#define SYSCTRL_BASE_OFFSET		0xDB000
+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
+#define SYSCTRL_MAILBOX_INDEX		0x03
+#define SC_BAR_LENGTH			0x1000
+
+#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
+#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
+#define   SC_MB_CTRL_IRQ		REG_BIT(30)
+#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
+#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
+#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
+#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
+#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
+
+#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
+#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
+#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
+#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
+
+#define MKHI_FRAME_PHASE		REG_BIT(24)
+#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
+#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
+#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
+
+#define SC_MB_FRAME_SIZE		16
+#define SC_MB_MAX_FRAMES		64
+#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
+#define SC_MKHI_COMMAND			5
+
+#define SC_MB_DEFAULT_TIMEOUT_MS	500
+#define SC_MB_RETRY_TIMEOUT_MS		20
+#define SC_MB_POLL_INTERVAL_US		100
+
+#endif /* _XE_SYSCTRL_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e101d290b2a6..805d48dd954d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -66,6 +66,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
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
index a85be9ba175e..6295b2c35d4a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -29,6 +29,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
@@ -340,6 +341,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -606,6 +609,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..b6dc3030b673 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 57,
@@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5f20f56571d1..53e44a32883d 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -56,6 +56,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_sysctrl:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
new file mode 100644
index 000000000000..9f3e0b1db380
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sysctrl.h"
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_soc_remapper.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+
+static void xe_sysctrl_fini(void *arg)
+{
+	struct xe_sysctrl *sc = arg;
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+
+	if (!xe->soc_remapper.set_sysctrl_region)
+		return;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
+}
+
+/**
+ * xe_sysctrl_init - Initialize SC subsystem
+ * @xe: xe device instance
+ *
+ * Entry point for SC initialization, called from xe_device_probe().
+ * This function checks platform support and initializes the system controller.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_sysctrl_init(struct xe_device *xe)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return 0;
+
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
+	if (ret)
+		return ret;
+
+	if (!xe->soc_remapper.set_sysctrl_region)
+		return -ENODEV;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_init(sc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
new file mode 100644
index 000000000000..f1ad12656e48
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_H_
+#define _XE_SYSCTRL_H_
+
+struct xe_device;
+
+int xe_sysctrl_init(struct xe_device *xe);
+
+#endif /* _XE_SYSCTRL_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
new file mode 100644
index 000000000000..e9f4d4b13bb1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/errno.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+#include "regs/xe_sysctrl_regs.h"
+
+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
+					      unsigned int timeout_ms)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	int ret;
+
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), SC_MB_CTRL, bit_mask, bit_mask,
+				 timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
+					    unsigned int timeout_ms)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	int ret;
+
+	ret = xe_mmio_wait32(xe_root_tile_mmio(xe), SC_MB_CTRL, bit_mask, bit_mask,
+			     timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
+					  size_t len)
+{
+	static const struct xe_reg data_regs[] = {
+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
+	};
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	const u8 *bytes = frame;
+	u32 reg_data;
+	size_t i;
+
+	if (len == 0 || len > SC_MB_FRAME_SIZE) {
+		xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
+		reg_data = *(const u32 *)(bytes + i);
+		xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)], reg_data);
+	}
+
+	if (i < len) {
+		size_t remaining = len - i;
+		size_t j;
+
+		reg_data = 0;
+		for (j = 0; j < remaining; j++)
+			reg_data |= (u32)bytes[i + j] << (j * 8);
+
+		xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)], reg_data);
+	}
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
+					 size_t len)
+{
+	static const struct xe_reg data_regs[] = {
+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
+	};
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	u8 *bytes = frame;
+	u32 reg_data;
+	size_t i;
+
+	if (len == 0 || len > SC_MB_FRAME_SIZE) {
+		xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
+		reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)]);
+		*(u32 *)(bytes + i) = reg_data;
+	}
+
+	if (i < len) {
+		size_t remaining = len - i;
+		size_t j;
+
+		reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)]);
+
+		for (j = 0; j < remaining; j++)
+			bytes[i + j] = (reg_data >> (j * 8)) & 0xFF;
+	}
+
+	return 0;
+}
+
+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	u32 ctrl_reg;
+
+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
+	ctrl_reg &= ~SC_MB_CTRL_RUN_BUSY_OUT;
+	xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);
+}
+
+static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
+					      u8 group_id, u8 command,
+					       const void *data_in, size_t data_in_len,
+					       u8 **cmd_buffer, size_t *cmd_size)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t size;
+	u8 *buffer;
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+
+	size = sizeof(*mkhi_hdr) + data_in_len;
+	if (size > SC_MB_MAX_MESSAGE_SIZE) {
+		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
+		return -EINVAL;
+	}
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
+				      FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
+				      FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
+				      FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
+				      FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
+
+	if (data_in && data_in_len)
+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
+
+	*cmd_buffer = buffer;
+	*cmd_size = size;
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *cmd_buffer,
+					  size_t cmd_size, unsigned int timeout_ms)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	u32 ctrl_reg, total_frames, frame;
+	size_t bytes_sent, frame_size;
+
+	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
+
+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
+		xe_err(xe, "sysctrl: Mailbox busy\n");
+		return -EBUSY;
+	}
+
+	sc->phase_bit ^= 1;
+
+	bytes_sent = 0;
+
+	for (frame = 0; frame < total_frames; frame++) {
+		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
+
+		if (xe_sysctrl_mailbox_write_frame(sc, cmd_buffer + bytes_sent, frame_size)) {
+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
+			return -EIO;
+		}
+
+		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
+
+		xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);
+
+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
+			return -ETIMEDOUT;
+		}
+
+		bytes_sent += frame_size;
+	}
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,
+						  void *out,
+						  size_t frame_size,
+						  size_t *payload_bytes)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	u32 frame_data[4];
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
+	size_t hdr_size = sizeof(*resp_hdr);
+	size_t payload_size;
+	int ret;
+
+	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
+	if (ret)
+		return ret;
+
+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
+
+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req_hdr) ||
+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req_hdr)) {
+		xe_err(xe, "SC: Response header mismatch\n");
+		return -EPROTO;
+	}
+
+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
+		return -EIO;
+	}
+
+	payload_size = frame_size - hdr_size;
+	if (payload_size > 0)
+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
+
+	*payload_bytes = payload_size;
+
+	xe_sysctrl_mailbox_clear_response(sc);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
+					    void *out, size_t frame_size,
+					     unsigned int timeout_ms)
+{
+	int ret;
+
+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms))
+		return -ETIMEDOUT;
+
+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_clear_response(sc);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,
+					      void *data_out, size_t data_out_len,
+					      size_t *rdata_len, unsigned int timeout_ms)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	u32 ctrl_reg, total_frames, frame;
+	size_t hdr_size = sizeof(*mkhi_hdr);
+	u8 *out = data_out;
+	size_t received = 0;
+	size_t frame_size;
+	int ret;
+
+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
+
+	if (total_frames == 1)
+		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
+	else
+		frame_size = SC_MB_FRAME_SIZE;
+
+	ret = xe_sysctrl_mailbox_process_first_frame(sc, req_hdr, out, frame_size, &received);
+	if (ret)
+		return ret;
+
+	out += received;
+
+	for (frame = 1; frame < total_frames; frame++) {
+		size_t remaining = data_out_len - received;
+
+		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
+
+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
+		if (ret) {
+			xe_err(xe, "sysctrl: Response frame %u timeout\n", frame);
+			return ret;
+		}
+
+		received += frame_size;
+		out += frame_size;
+	}
+
+	*rdata_len = received;
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
+					   const u8 *cmd_buffer, size_t cmd_size,
+					    void *data_out, size_t data_out_len,
+					    size_t *rdata_len, unsigned int timeout_ms)
+{
+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t received;
+	int ret;
+
+	ret = xe_sysctrl_mailbox_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
+	if (ret)
+		return ret;
+
+	if (!data_out) {
+		if (rdata_len)
+			*rdata_len = 0;
+		return 0;
+	}
+
+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)cmd_buffer;
+
+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
+						&received, timeout_ms);
+	if (ret)
+		return ret;
+
+	if (rdata_len)
+		*rdata_len = received;
+
+	return 0;
+}
+
+/**
+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
+ * @handle: XE device handle
+ * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
+ * @rdata_len: Pointer to store actual response data size (can be NULL)
+ *
+ * Send a command to the System Controller using MKHI protocol. Handles
+ * command preparation, fragmentation, transmission, and response reception.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
+{
+	struct xe_device *xe = handle;
+	struct xe_sysctrl *sc = &xe->sc;
+	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
+	u8 *buffer = NULL;
+	size_t command_size = 0;
+	u8 group_id, command_code;
+	int ret = 0;
+
+	if (!xe || !cmd) {
+		if (xe)
+			xe_err(xe, "sysctrl: Invalid parameters\n");
+		return -EINVAL;
+	}
+
+	if (!xe->info.has_sysctrl)
+		return -ENODEV;
+
+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
+
+	if (!cmd->data_in && cmd->data_in_len) {
+		xe_err(xe, "sysctrl: Invalid input parameters\n");
+		return -EINVAL;
+	}
+
+	if (!cmd->data_out && cmd->data_out_len) {
+		xe_err(xe, "sysctrl: Invalid output parameters\n");
+		return -EINVAL;
+	}
+
+	might_sleep();
+
+	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
+						 cmd->data_in, cmd->data_in_len,
+						 &buffer, &command_size);
+	if (ret) {
+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
+		return ret;
+	}
+
+	xe_pm_runtime_get(xe);
+
+	guard(mutex)(&sc->cmd_lock);
+
+	ret = xe_sysctrl_mailbox_send_command(sc, buffer, command_size,
+					      cmd->data_out, cmd->data_out_len, rdata_len,
+					      SC_MB_DEFAULT_TIMEOUT_MS);
+	if (ret)
+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
+
+	xe_pm_runtime_put(xe);
+
+	kfree(buffer);
+
+	return ret;
+}
+
+/**
+ * xe_sysctrl_mailbox_init - Initialize the system controller mailbox state
+ * @sysctrl: System controller structure
+ */
+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
+{
+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
+	u32 ctrl_reg;
+
+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
+
+	xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
new file mode 100644
index 000000000000..6380d1d68f8f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __XE_SYSCTRL_MAILBOX_H__
+#define __XE_SYSCTRL_MAILBOX_H__
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+struct xe_sysctrl;
+
+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
+#define MKHI_HDR_IS_RESPONSE		BIT(15)
+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
+
+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
+	__le32 data;
+} __packed;
+
+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
+
+struct xe_sysctrl_mailbox_app_msg_hdr {
+	__le32 data;
+} __packed;
+
+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr)	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr)		FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+#define XE_SYSCTRL_APP_HDR_VERSION(hdr)		FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr)	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr)	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr)	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr)		FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+
+/**
+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
+ */
+struct xe_sysctrl_mailbox_command {
+	/** @header: Application message header containing command information */
+	struct xe_sysctrl_mailbox_app_msg_hdr header;
+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
+	void *data_in;
+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
+	size_t data_in_len;
+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
+	void *data_out;
+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
+	size_t data_out_len;
+};
+
+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
+
+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
new file mode 100644
index 000000000000..80e674cfa385
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_TYPES_H_
+#define _XE_SYSCTRL_TYPES_H_
+
+#include <linux/completion.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct xe_sysctrl - System Controller driver context
+ */
+struct xe_sysctrl {
+	/** @cmd_lock: Mutex protecting mailbox command operations */
+	struct mutex cmd_lock;
+
+	/** @phase_bit: MKHI message boundary phase toggle bit */
+	u32 phase_bit;
+};
+
+#endif /* _XE_SYSCTRL_TYPES_H_ */
-- 
2.43.0

