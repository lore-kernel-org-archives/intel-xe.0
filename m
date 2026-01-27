Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA32ED2D8FA
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 10:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BB410E05D;
	Tue, 27 Jan 2026 10:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QG2zsRhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179A810E05D
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511250; x=1801047250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZyLYyhcUlKnfMeW/WWFFP818HprCwgqdPQkGM4OdOY=;
 b=QG2zsRhOES7jf+n9jNCf//edgP4A0jSEX8mh3VpUv3NZd7sWwoeoKz3G
 jYwYMF0FFNFhO8+D73ODwAlZc79a671UvzoaHonEsjsWdP2Xg+yRbS3aK
 biDrjyA6jxn3eHwbStdbHkERJzfbZYt1HJJiRyWldGA/lESp2+lMijMsw
 PbSDwvMOkqE//jOfO3IOOimiIeZ38By/yIqVZ9S9+JkSVAKXjki5lrAgG
 OTOxScv7SHyyTPXX9bsO8rR6REaJB13w+wpenT/W43TMEx08/2i5977s3
 L8IICDYzfLujJXL4/iHOwHZoQcENTYK05i5Skjk7svJdOqrRUWJhF+M73 w==;
X-CSE-ConnectionGUID: 1rhVGFqRTNGaXJaJtcLXJg==
X-CSE-MsgGUID: BSQ8L7tBRjiOaiXsh0Ylsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70606745"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70606745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:54:09 -0800
X-CSE-ConnectionGUID: Z2pLCSZGRGSMWRIisPxTwQ==
X-CSE-MsgGUID: 2kSW4IoyRdS9kBT0uAbNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207965527"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:54:04 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v5 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Date: Tue, 27 Jan 2026 02:53:47 -0800
Message-ID: <20260127105347.2651751-11-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
References: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
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

Implement the System Controller mailbox communication layer:
- Low-level frame I/O operations
- Mailbox busy/ready state polling
- Command preparation and fragmentation
- Multi-frame send/receive with phase bit handling
- MKHI protocol header validation
- Public API for sending commands to System Controller

This provides the complete mailbox infrastructure for
communicating with System Controller firmware on Xe3p
dGPU platforms.

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
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 390 ++++++++++++++++++++++++
 1 file changed, 390 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
new file mode 100644
index 000000000000..3c4c619071e7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -0,0 +1,390 @@
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
+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
+					      unsigned int timeout_ms)
+{
+	int ret;
+
+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+				 timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
+					    unsigned int timeout_ms)
+{
+	int ret;
+
+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+			     timeout_ms * 1000, NULL, false);
+
+	return ret == 0;
+}
+
+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
+					  size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	memcpy(val, frame, len);
+
+	for (i = 0; i < dw; i++)
+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
+					 size_t len)
+{
+	static const struct xe_reg regs[] = {
+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
+	};
+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
+	u32 i;
+
+	for (i = 0; i < dw; i++)
+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
+
+	memcpy(frame, val, len);
+
+	return 0;
+}
+
+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
+{
+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
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
+	if (data_in_len > SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
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
+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc,
+					  const u8 *mbox_cmd,
+					  size_t cmd_size, unsigned int timeout_ms)
+{
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 ctrl_reg, total_frames, frame;
+	size_t bytes_sent, frame_size;
+
+	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
+
+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
+		xe_err(xe, "sysctrl: Mailbox busy\n");
+		return -EBUSY;
+	}
+
+	sc->phase_bit ^= 1;
+	bytes_sent = 0;
+
+	for (frame = 0; frame < total_frames; frame++) {
+		frame_size = min_t(size_t, cmd_size - bytes_sent, SYSCTRL_MB_FRAME_SIZE);
+
+		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
+			sc->phase_bit = 0;
+			return -EIO;
+		}
+
+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
+
+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
+
+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
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
+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc, void *out,
+					    size_t frame_size, unsigned int timeout_ms,
+					    bool *done)
+{
+	u32 curr_frame, total_frames, ctrl_reg;
+	struct xe_device *xe = sc_to_xe(sc);
+	int ret;
+
+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
+		xe_err(xe, "sysctrl: Response frame timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
+	curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);
+
+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_clear_response(sc);
+
+	if (curr_frame == total_frames)
+		*done = true;
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
+					     void *data_out, size_t data_out_len,
+					     size_t *rdata_len, unsigned int timeout_ms)
+{
+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	struct xe_device *xe = sc_to_xe(sc);
+	size_t frame_size, remain;
+	bool done = false;
+	u8 *out;
+	int ret = 0;
+
+	remain = sizeof(*mkhi_hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	out = buffer;
+	while (!done && remain) {
+		frame_size = min_t(size_t, remain, SYSCTRL_MB_FRAME_SIZE);
+
+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms,
+						       &done);
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
+	return ret;
+}
+
+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
+					   const u8 *mbox_cmd, size_t cmd_size,
+					   void *data_out, size_t data_out_len,
+					   size_t *rdata_len, unsigned int timeout_ms)
+{
+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
+	size_t received;
+	int ret;
+
+	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
+	if (ret)
+		return ret;
+
+	if (!data_out || !rdata_len)
+		return 0;
+
+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
+
+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
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
+	u32 ctrl_reg;
+
+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
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
+	struct xe_sysctrl *sc;
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
+	if (!xe->info.has_sysctrl)
+		return -ENODEV;
+
+	sc = &xe->sc;
+
+	if (!cmd) {
+		xe_err(xe, "sysctrl: Invalid command buffer\n");
+		return -EINVAL;
+	}
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
+	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
+					      cmd->data_out, cmd->data_out_len, rdata_len,
+					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
+	if (ret)
+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
+
+	kfree(mbox_cmd);
+
+	return ret;
+}
-- 
2.43.0

