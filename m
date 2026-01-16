Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BD9D4A61D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BD110E082;
	Fri, 16 Jan 2026 09:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXRDJFen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E917610E83E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768556210; x=1800092210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3qBOEO8KU+LIkfWyTTfhX8Yce/W1XbDA279zl9y7qU=;
 b=ZXRDJFenO8KW92104uSy4FlqKJ2LS+npTBghhkLa0d3OA+YjXilVNHJX
 DWdOOk2uTsnrltbQNbq4mUZwAFMIkb1m/mQmgc3e+8y1OnbEWnl+BFSDN
 DDzaiU6M35kYoVqUbvfYRjOIg/aPTpncxgswGzHGbSDBmKIZz5Xs+NGSz
 JNd9ILElTcqGXI1QGiA0FFoZCKDQbPX2BmGFwGO/BkKkOLandalCjh9SC
 dPlBIQ3DoO1ZoB0ifxqx1pQzXWU3RL5Al4Nj4dU7qeWNIOYGbm1GKOJrg
 fr88I90SaecgGwkcr98pA74Y6AxXZEDr2/HgxrdQY8a1cc5FVAqGWJEXC A==;
X-CSE-ConnectionGUID: 6vg4G3nYRDeacEluBM6uig==
X-CSE-MsgGUID: JyBQ0Y7vTnGPUUaXPtTbkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80174985"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80174985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:36:50 -0800
X-CSE-ConnectionGUID: XViYXiO7QTqj5pZMXAHj3A==
X-CSE-MsgGUID: wD/I8EKhR0+kqkQUi8sHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205619590"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 01:36:48 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/4] drm/xe/sysctrl: Add System Controller
Date: Fri, 16 Jan 2026 15:03:30 +0530
Message-ID: <20260116093432.914040-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116093432.914040-1-raag.jadav@intel.com>
References: <20260116093432.914040-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Do not review, CI only.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  44 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  70 +++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 429 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  23 +
 12 files changed, 666 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3a6a707638b5..ff567fa58119 100644
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
index 000000000000..e0b630654fe3
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
@@ -0,0 +1,44 @@
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
+#define SYSCTRL_BASE_OFFSET		0xDB000
+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
+#define SYSCTRL_MAILBOX_INDEX		0x03
+#define SYSCTRL_BAR_LENGTH		0x1000
+
+#define SYSCTRL_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY	REG_BIT(31)
+#define   SYSCTRL_MB_CTRL_IRQ		REG_BIT(30)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
+#define   SYSCTRL_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
+#define   SYSCTRL_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
+#define   SYSCTRL_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
+#define   SYSCTRL_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
+
+#define SYSCTRL_MB_DATA0		XE_REG(SYSCTRL_BASE + 0x14)
+#define SYSCTRL_MB_DATA1		XE_REG(SYSCTRL_BASE + 0x18)
+#define SYSCTRL_MB_DATA2		XE_REG(SYSCTRL_BASE + 0x1C)
+#define SYSCTRL_MB_DATA3		XE_REG(SYSCTRL_BASE + 0x20)
+
+#define MKHI_FRAME_PHASE		REG_BIT(24)
+#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
+#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
+#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
+
+#define SYSCTRL_MB_FRAME_SIZE		16
+#define SYSCTRL_MB_MAX_FRAMES		64
+#define SYSCTRL_MB_MAX_MESSAGE_SIZE	(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
+#define SYSCTRL_MKHI_COMMAND		5
+
+#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+#define SYSCTRL_MB_RETRY_TIMEOUT_MS	20
+#define SYSCTRL_MB_POLL_INTERVAL_US	100
+
+#endif /* _XE_SYSCTRL_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 495310a624b5..b45048803531 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -988,6 +989,10 @@ int xe_device_probe(struct xe_device *xe)
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
index f689766adcb1..4cb2a2c427cd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -29,6 +29,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
@@ -361,6 +362,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -627,6 +630,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 09189ff3da44..26b3ede9657b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -428,6 +428,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 57,
@@ -703,6 +704,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 20acc5349ee6..0027024072b1 100644
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
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
new file mode 100644
index 000000000000..8daab7703247
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_soc_remapper.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+
+/**
+ * DOC: System Controller (sysctrl)
+ *
+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
+ * responsible for managing various low-level platform functions. Communication
+ * between the driver and the System Controller occurs via a mailbox interface,
+ * enabling the exchange of commands and responses.
+ *
+ * This module provides initialization routines and helper functions to interact
+ * with the System Controller through the mailbox.
+ */
+
+static void xe_sysctrl_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
+}
+
+/**
+ * xe_sysctrl_init - Initialize System Controller subsystem
+ * @xe: xe device instance
+ *
+ * Entry point for System Controller initialization, called from xe_device_probe.
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
+	if (!xe->soc_remapper.set_sysctrl_region)
+		return -ENODEV;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
+	if (ret)
+		return ret;
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
index 000000000000..ee7826fe4c98
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
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
index 000000000000..97fe3498fcc7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/container_of.h>
+#include <linux/errno.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+#include "xe_sysctrl_types.h"
+
+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
+#define MKHI_HDR_IS_RESPONSE		BIT(15)
+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
+
+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+
+static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
+{
+	return container_of(sc, struct xe_device, sc);
+}
+
+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_device *xe, u32 bit_mask,
+					      unsigned int timeout_ms)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret;
+
+	ret = xe_mmio_wait32_not(mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+				 timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_device *xe, u32 bit_mask,
+					    unsigned int timeout_ms)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret;
+
+	ret = xe_mmio_wait32(mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+			     timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static int xe_sysctrl_mailbox_write_frame(struct xe_device *xe, const void *frame,
+					  size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	memcpy(val, frame, len);
+
+	for (i = 0; i < dw; i++)
+		xe_mmio_write32(mmio, regs[i], val[i]);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_read_frame(struct xe_device *xe, void *frame,
+					 size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	for (i = 0; i < dw; i++)
+		val[i] = xe_mmio_read32(mmio, regs[i]);
+
+	memcpy(frame, val, len);
+
+	return 0;
+}
+
+static void xe_sysctrl_mailbox_clear_response(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	xe_mmio_rmw32(mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
+}
+
+static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
+					      u8 group_id, u8 command,
+					      const void *data_in, size_t data_in_len,
+					      u8 **mbox_cmd, size_t *cmd_size)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t size;
+	u8 *buffer;
+
+	size = sizeof(*mkhi_hdr) + data_in_len;
+	if (size > SYSCTRL_MB_MAX_MESSAGE_SIZE) {
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
+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
+				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
+				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
+				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
+
+	if (data_in && data_in_len)
+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
+
+	*mbox_cmd = buffer;
+	*cmd_size = size;
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_send_frames(struct xe_device *xe,
+					  const u8 *mbox_cmd,
+					  size_t cmd_size, unsigned int timeout_ms)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 ctrl_reg, total_frames, frame;
+	struct xe_sysctrl *sc = &xe->sc;
+	size_t bytes_sent, frame_size;
+
+	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
+
+	if (!xe_sysctrl_mailbox_wait_bit_clear(xe, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
+		xe_err(xe, "sysctrl: Mailbox busy\n");
+		return -EBUSY;
+	}
+
+	sc->phase_bit ^= 1;
+	bytes_sent = 0;
+
+	for (frame = 0; frame < total_frames; frame++) {
+		frame_size = min(cmd_size - bytes_sent, (size_t)SYSCTRL_MB_FRAME_SIZE);
+
+		if (xe_sysctrl_mailbox_write_frame(xe, mbox_cmd + bytes_sent, frame_size)) {
+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
+			sc->phase_bit ^= 1;
+			return -EIO;
+		}
+
+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
+
+		xe_mmio_write32(mmio, SYSCTRL_MB_CTRL, ctrl_reg);
+
+		if (!xe_sysctrl_mailbox_wait_bit_clear(xe, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
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
+static int xe_sysctrl_mailbox_process_first_frame(struct xe_device *xe,
+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
+						  void *out,
+						  size_t frame_size,
+						  size_t *payload_bytes)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
+	size_t hdr_size = sizeof(*resp_hdr);
+	size_t payload_size;
+	u32 frame_data[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)];
+	int ret;
+
+	ret = xe_sysctrl_mailbox_read_frame(xe, frame_data, frame_size);
+	if (ret)
+		return ret;
+
+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
+
+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
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
+	xe_sysctrl_mailbox_clear_response(xe);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_process_frame(struct xe_device *xe,
+					    void *out, size_t frame_size,
+					    unsigned int timeout_ms)
+{
+	int ret;
+
+	if (!xe_sysctrl_mailbox_wait_bit_set(xe, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
+		xe_err(xe, "sysctrl: Response frame timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = xe_sysctrl_mailbox_read_frame(xe, out, frame_size);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_clear_response(xe);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_receive_frames(struct xe_device *xe,
+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
+					     void *data_out, size_t data_out_len,
+					     size_t *rdata_len, unsigned int timeout_ms)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	size_t hdr_size = sizeof(*mkhi_hdr);
+	u32 ctrl_reg, total_frames, frame;
+	size_t received = 0;
+	u8 *out = data_out;
+	size_t frame_size;
+	int ret = 0;
+
+	if (!xe_sysctrl_mailbox_wait_bit_set(xe, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ctrl_reg = xe_mmio_read32(mmio, SYSCTRL_MB_CTRL);
+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
+
+	if (total_frames == 1)
+		frame_size = min(hdr_size + data_out_len, (size_t)SYSCTRL_MB_FRAME_SIZE);
+	else
+		frame_size = SYSCTRL_MB_FRAME_SIZE;
+
+	ret = xe_sysctrl_mailbox_process_first_frame(xe, req, out, frame_size, &received);
+	if (ret)
+		return ret;
+
+	out += received;
+
+	for (frame = 1; frame < total_frames; frame++) {
+		size_t remaining = data_out_len - received;
+
+		frame_size = min_t(size_t, remaining, SYSCTRL_MB_FRAME_SIZE);
+
+		ret = xe_sysctrl_mailbox_process_frame(xe, out, frame_size, timeout_ms);
+		if (ret)
+			break;
+
+		received += frame_size;
+		out += frame_size;
+	}
+
+	*rdata_len = received;
+
+	return ret;
+}
+
+static int xe_sysctrl_mailbox_send_command(struct xe_device *xe,
+					   const u8 *mbox_cmd, size_t cmd_size,
+					   void *data_out, size_t data_out_len,
+					   size_t *rdata_len, unsigned int timeout_ms)
+{
+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t received;
+	int ret;
+
+	ret = xe_sysctrl_mailbox_send_frames(xe, mbox_cmd, cmd_size, timeout_ms);
+	if (ret)
+		return ret;
+
+	if (!data_out || !rdata_len)
+		return 0;
+
+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
+
+	ret = xe_sysctrl_mailbox_receive_frames(xe, mkhi_hdr, data_out, data_out_len,
+						&received, timeout_ms);
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
+	struct xe_device *xe = sc_to_xe(sc);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 ctrl_reg;
+
+	ctrl_reg = xe_mmio_read32(mmio, SYSCTRL_MB_CTRL);
+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
+
+	xe_mmio_rmw32(mmio, SYSCTRL_MB_CTRL, MKHI_FRAME_PHASE, 0);
+}
+
+/**
+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
+ * @xe: XE device instance
+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
+ * @rdata_len: Pointer to store actual response data size (can be NULL)
+ *
+ * Send a command to the System Controller using MKHI protocol. Handles
+ * command preparation, fragmentation, transmission, and response reception.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_sysctrl_send_command(struct xe_device *xe,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+	u8 group_id, command_code;
+	u8 *mbox_cmd = NULL;
+	size_t cmd_size = 0;
+	int ret = 0;
+
+	if (!xe) {
+		pr_err("sysctrl: Invalid device handle\n");
+		return -EINVAL;
+	}
+
+	if (!cmd) {
+		xe_err(xe, "sysctrl: Invalid command buffer\n");
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
+	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
+						 cmd->data_in, cmd->data_in_len,
+						 &mbox_cmd, &cmd_size);
+	if (ret) {
+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
+		return ret;
+	}
+
+	guard(xe_pm_runtime)(xe);
+
+	guard(mutex)(&sc->cmd_lock);
+
+	ret = xe_sysctrl_mailbox_send_command(xe, mbox_cmd, cmd_size,
+					      cmd->data_out, cmd->data_out_len, rdata_len,
+					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
+	if (ret)
+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
+
+	kfree(mbox_cmd);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
new file mode 100644
index 000000000000..750b7528bab2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __XE_SYSCTRL_MAILBOX_H__
+#define __XE_SYSCTRL_MAILBOX_H__
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+struct xe_sysctrl;
+struct xe_device;
+struct xe_sysctrl_mailbox_command;
+
+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
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
+int xe_sysctrl_send_command(struct xe_device *xe,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len);
+
+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
new file mode 100644
index 000000000000..1f315ad1b996
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __XE_SYSCTRL_MAILBOX_TYPES_H__
+#define __XE_SYSCTRL_MAILBOX_TYPES_H__
+
+#include <linux/types.h>
+
+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_mailbox_app_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_mailbox_command {
+	/** @header: Application message header containing command information */
+	struct xe_sysctrl_mailbox_app_msg_hdr header;
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
+#endif /* __XE_SYSCTRL_MAILBOX_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
new file mode 100644
index 000000000000..88a34967688b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -0,0 +1,23 @@
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

