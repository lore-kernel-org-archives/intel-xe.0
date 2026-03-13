Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A8105F7AF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8910EC43;
	Fri, 13 Mar 2026 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enkH8/Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F410EC43
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773412409; x=1804948409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4aY5Pm7WCcjCQG3+RQnqfoByMWFrXA+fgiNMSePHZA=;
 b=enkH8/Af7a82UbUiepNxfrwFADpxJFhf2qfWGQpXmdp2ADG0U8P5WAt5
 ykuvdl+oqgXuhrJbt/NbUljREP3X/m3KvU0eOI+K9C25Zc6v8/f0EKfMx
 7VzfZgQxawyoTJ0Nscrq2jyQYodQ+Wx0ykj7iPv66zAmPha8Rz7WP++/z
 Ty5EG6+s0CjLT8zA60PMsk1PYqycR5Jpph1SN+0C/X6ZLgMFCmUE5YcSm
 b2WLeG9zqb47rhXFImH2AI3oLkGrBiiIO9a58zkC+Wjgu3VxtBQoSQa8g
 jtMXlMk9p0zi/UcSSMsYU//HJKTUWejoCY9Fo0iog9My6VRE63CcBjUTG g==;
X-CSE-ConnectionGUID: QEZqqBQpRK+Q9WPJ/Wm8eg==
X-CSE-MsgGUID: 0YfxjkgKR8+qfbSOn2ILug==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="73536545"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="73536545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:29 -0700
X-CSE-ConnectionGUID: X6jrm6jBSJCaNVt2ZwC/Dg==
X-CSE-MsgGUID: idvhrPkMRGWskv8IWAd6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216084390"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:26 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v10 5/7] drm/xe/xe_sysctrl: Add System Controller mailbox
 communication support
Date: Fri, 13 Mar 2026 07:33:08 -0700
Message-ID: <20260313143303.2441609-14-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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

Add mailbox communication layer required for interacting with System
Controller firmware, enabling command submission and response handling.

This patch implements command/response handling logic, including error
and timeout handling.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

v8: (Matt, Michal)
- Reordered patches for logical flow
- Static functions renamed with short prefix
- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
- Added frame length validation and command overflow protection
- Use REG_FIELD_PREP for hardware registers
- Changed error format to %pe
- Removed unnecessary NULL checks and explicit zeros
- Fixed kernel-doc syntax

v9: (Umesh, Badal)
- Renamed MKHI to SCHI (System Controller Host Interface)
- Fixed kernel-doc syntax

v10: (Riana, Badal)
- Removed SCHI terminology and aligned to sysctrl mailbox naming
- Dropped redundant header includes and unused variable initialization
- Updated runtime PM guarding in xe_sysctrl_send_command() to use
  guard(xe_pm_runtime_noresume)
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 369 ++++++++++++++++++++++++
 3 files changed, 372 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cbe8b2f9c1e9..2358dd25ee40 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -124,6 +124,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index fd23f345d8c7..84e3b70043a1 100644
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
-- 
2.43.0

