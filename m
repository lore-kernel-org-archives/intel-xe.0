Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCFDD58E7A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4AD10E44F;
	Mon,  2 Mar 2026 08:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvM/NVKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5445810E44F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772439028; x=1803975028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rkN5DYq4oBtg0Gun6Fu299gs8CfcDir3MKSSdFcCz+Y=;
 b=bvM/NVKjo7LTZfbxTEA7QODUyFaA9lgpNMYsZuVyV/klcl92FXizZDsF
 s4yJf1Q2AUyHAjCPsvlXWwtMBy/yipbLZZxY62L6MuVrMjrlZb4xl2Qm/
 f4YwvNM1SDrNDQ1WJb4l4o1XtWTv74f0xjcJv16jLevHoPYUfeQ4hHR6C
 scn5bnd+Wq2T4MjWcB3ah2NrCmWARnr7/dgoNN1KT3KZckTh+16KX1S0+
 mU7TLnT7Ef/LG/fKvy5cheoYTIqJKBaleKEL1+Vmn/KrUZY2QQOR5TAxj
 70nMlaulPsJRgvVIeHgQ/2pwV/urg1W+RdWSBEVqLGox1UofpzRgCHCk6 Q==;
X-CSE-ConnectionGUID: bCX0bC6ZSyOoELoKzVg/iw==
X-CSE-MsgGUID: MRQbT2ApQe6OZqTX5OfWQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84790350"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84790350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:28 -0800
X-CSE-ConnectionGUID: iWY+3E90QYGPatYz2x2LZw==
X-CSE-MsgGUID: qmLznbkpT9WH5T7+y9BRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214079214"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:24 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 5/6] drm/xe/sysctrl: Add mailbox communication
 implementation
Date: Mon,  2 Mar 2026 00:10:07 -0800
Message-ID: <20260302081002.3275868-13-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
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

Adding mailbox communication layer for System Controller
interaction. The mailbox interface enables sending commands and
receiving responses from embedded System Controller.

Key features:
- Command/response protocol handling
- Timeout and error management
- Uses MKHI protocol headers defined in ABI

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt, Mike)
- Refactor MMIO access to use domain-specific accessor
- Add input validation and buffer overflow protection
- Add bounds checking for multi-frame operations
- Fix potential NULL pointer dereference

v5: (Umesh, Riana)
- Reset phase bit to 0 on error conditions
- Refactor mailbox receive path
- Updated xe_err messages for consistency

v6: (Matt)
- Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP

v8 (Matt, Michal):
- Reordered patches for logical flow
- Static functions renamed with short prefix
- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
- Added frame length validation and command overflow protection
- Use REG_FIELD_PREP for hardware registers
- Changed error format to %pe
- Removed unnecessary NULL checks and explicit zeros
- Fixed kernel-doc syntax
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 364 ++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 07e028fa50e8..1890bbd1b28d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2751fe25a6ff..365f73ef680d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -78,5 +78,7 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	xe_sysctrl_mailbox_init(sc);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
new file mode 100644
index 000000000000..0e154b6dcdc7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
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
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t size;
+	u8 *buffer;
+
+	xe_assert(xe, command <= MKHI_HDR_COMMAND_MAX);
+
+	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
+		return -EINVAL;
+	}
+
+	size = sizeof(*mkhi_hdr) + data_in_len;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command));
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
+			   REG_FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
+			   REG_FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
+			   SYSCTRL_MB_CTRL_MKHI_CMD |
+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
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
+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
+	curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);
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
+				  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
+				  void *data_out, size_t data_out_len,
+				  size_t *rdata_len, unsigned int timeout_ms)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	struct xe_device *xe = sc_to_xe(sc);
+	size_t remain = sizeof(*mkhi_hdr) + data_out_len;
+
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
+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
+
+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(mkhi_hdr) ||
+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
+	    XE_SYSCTRL_MKHI_HDR_COMMAND(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
+		xe_err(xe, "sysctrl: Response header mismatch\n");
+		return -EPROTO;
+	}
+
+	if (XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr) != 0) {
+		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
+		       XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr));
+		return -EIO;
+	}
+
+	memcpy(data_out, mkhi_hdr + 1, data_out_len);
+	*rdata_len = out - buffer - sizeof(*mkhi_hdr);
+
+	return 0;
+}
+
+static int sysctrl_send_command(struct xe_sysctrl *sc,
+				const u8 *mbox_cmd, size_t cmd_size,
+				void *data_out, size_t data_out_len,
+				size_t *rdata_len, unsigned int timeout_ms)
+{
+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
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
+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
+
+	ret = sysctrl_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
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
+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
+}
+
+/**
+ * xe_sysctrl_send_command() - Send command to System Controller via mailbox
+ * @sc: System Controller instance
+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
+ * @rdata_len: Pointer to store actual response data size (can be NULL)
+ *
+ * Send a command to the System Controller using MKHI protocol. Handles
+ * command preparation, fragmentation, transmission, and response reception.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len)
+{
+	struct xe_device *xe = sc_to_xe(sc);
+	u8 group_id, command_code;
+	u8 *mbox_cmd = NULL;
+	size_t cmd_size = 0;
+	int ret = 0;
+
+	xe_assert(xe, xe->info.has_sysctrl);
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
+	guard(xe_pm_runtime)(xe);
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
-- 
2.43.0

