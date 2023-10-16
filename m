Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF71CDB482
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99A10E225;
	Mon, 16 Oct 2023 16:35:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0564710E210
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697474103; x=1729010103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0TwANNNZJGFJUiGUPpnWG+luj8rmmB76fLqvOkmwILY=;
 b=XHyy+ganDE9gMs55y4zlY9fZAcMyFa50uMTwcRpwlKiA6jRqLIiFrDx2
 j8vk8S/9GwT0LF3SPkvkfU/XIz0D/Bn9FrZp8QHPLp0PiOhFycO1mQy6P
 eHW5eQbHMk7ZIV0d9xKIf7H353KTrgTzpEYtPDs5S7YPN6R18+jrfS213
 k1mRraKGHbBaLh9hxVcwx/OYzgbGIWFFRSiwWrFEkZHirx+2irufCtrUE
 wfdq3VkwhLRyVfFIZEIyFwgboBNWT1RVO1gAGoNdvq/xTHNxXHmC38xKz
 zeGJdhhca01FJClAHfe7rgBgURONZn9GLqyvXXPRV1WzPsHUxSM6NxJHh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452051247"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="452051247"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="790865606"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="790865606"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 09:34:54 -0700
Message-ID: <20231016163449.1300701-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016163449.1300701-8-matthew.d.roper@intel.com>
References: <20231016163449.1300701-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/6] drm/xe: Extract MI_* instructions to
 their own header
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extracting the common MI_* instructions that can be used with any engine
to their own header will make it easier as we add additional engine
instructions in upcoming patches.

Also, since the majority of GPU instructions (both MI and non-MI) have
a "length" field in bits 7:0 of the instruction header, a common define
is added for that.  Instruction-specific length fields are still defined
for special case instructions that have larger/smaller length fields.

v2:
 - Use "instr" instead of "inst" as the short form of "instruction"
   everywhere.  (Lucas)
 - Include xe_reg_defs.h instead of the i915 compat header.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/xe/instructions/xe_instr_defs.h   | 31 ++++++++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  | 58 +++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     | 41 -------------
 drivers/gpu/drm/xe/xe_bb.c                    |  1 +
 drivers/gpu/drm/xe/xe_execlist.c              |  1 +
 drivers/gpu/drm/xe/xe_gt.c                    |  1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  1 +
 drivers/gpu/drm/xe/xe_migrate.c               |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  3 +-
 9 files changed, 96 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_instr_defs.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
new file mode 100644
index 000000000000..a7ec46395786
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_INSTR_DEFS_H_
+#define _XE_INSTR_DEFS_H_
+
+#include "regs/xe_reg_defs.h"
+
+/*
+ * The first dword of any GPU instruction is the "instruction header."  Bits
+ * 31:29 identify the general type of the command and determine how exact
+ * opcodes and sub-opcodes will be encoded in the remaining bits.
+ */
+#define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
+#define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
+
+/*
+ * Most (but not all) instructions have a "length" field in the instruction
+ * header.  The value expected is the total number of dwords for the
+ * instruction, minus two.
+ *
+ * Some instructions have length fields longer or shorter than 8 bits, but
+ * those are rare.  This definition can be used for the common case where
+ * the length field is from 7:0.
+ */
+#define XE_INSTR_LEN_MASK		GENMASK(7, 0)
+#define XE_INSTR_NUM_DW(x)		REG_FIELD_PREP(XE_INSTR_LEN_MASK, (x) - 2)
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
new file mode 100644
index 000000000000..753ebf1efa78
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MI_COMMANDS_H_
+#define _XE_MI_COMMANDS_H_
+
+#include "instructions/xe_instr_defs.h"
+
+/*
+ * MI (Memory Interface) commands are supported by all GT engines.  They
+ * provide general memory operations and command streamer control.  MI commands
+ * have a command type of 0x0 (MI_COMMAND) in bits 31:29 of the instruction
+ * header dword and a specific MI opcode in bits 28:23.
+ */
+
+#define MI_OPCODE			REG_GENMASK(28, 23)
+#define MI_SUBOPCODE			REG_GENMASK(22, 17)  /* used with MI_EXPANSION */
+
+#define __MI_INSTR(opcode) \
+	(XE_INSTR_MI | REG_FIELD_PREP(MI_OPCODE, opcode))
+
+#define MI_NOOP				__MI_INSTR(0x0)
+#define MI_USER_INTERRUPT		__MI_INSTR(0x2)
+#define MI_ARB_CHECK			__MI_INSTR(0x5)
+
+#define MI_ARB_ON_OFF			__MI_INSTR(0x8)
+#define   MI_ARB_ENABLE			REG_BIT(0)
+#define   MI_ARB_DISABLE		0x0
+
+#define MI_BATCH_BUFFER_END		__MI_INSTR(0xA)
+#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
+#define   MI_SDI_GGTT			REG_BIT(22)
+#define   MI_SDI_LEN_DW			GENMASK(9, 0)
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
+#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
+					 REG_BIT(21))
+
+#define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
+#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
+#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
+#define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
+#define   MI_LRI_FORCE_POSTED		REG_BIT(12)
+
+#define MI_FLUSH_DW			__MI_INSTR(0x26)
+#define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
+#define   MI_INVALIDATE_TLB		REG_BIT(18)
+#define   MI_FLUSH_DW_CCS		REG_BIT(16)
+#define   MI_FLUSH_DW_OP_STOREDW	REG_BIT(14)
+#define   MI_FLUSH_DW_LEN_DW		REG_GENMASK(5, 0)
+#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 4 - 2)
+#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
+#define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
+
+#define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 8c2e0da694d8..4402f72481dc 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -8,45 +8,6 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define INSTR_CLIENT_SHIFT      29
-#define   INSTR_MI_CLIENT       0x0
-#define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
-
-#define MI_INSTR(opcode, flags) \
-	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
-
-#define MI_NOOP			MI_INSTR(0, 0)
-#define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
-
-#define MI_ARB_ON_OFF		MI_INSTR(0x08, 0)
-#define   MI_ARB_ENABLE			(1<<0)
-#define   MI_ARB_DISABLE		(0<<0)
-
-#define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
-#define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
-#define   MI_SDI_GGTT		REG_BIT(22)
-#define   MI_SDI_NUM_DW(x)	((x) + 1)
-#define   MI_SDI_NUM_QW(x)	(REG_BIT(21) | (2 * (x) + 1))
-
-#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
-#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
-#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
-#define   MI_LRI_LENGTH			GENMASK(5, 0)
-#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
-#define   MI_LRI_FORCE_POSTED		(1<<12)
-
-#define MI_FLUSH_DW		MI_INSTR(0x26, 0)
-#define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
-#define   MI_INVALIDATE_TLB		(1<<18)
-#define   MI_FLUSH_DW_CCS		(1<<16)
-#define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
-#define   MI_FLUSH_DW_USE_GTT		(1<<2)
-#define   MI_FLUSH_LENGTH		GENMASK(5, 0)
-#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 2)
-#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 3)
-
-#define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
-
 #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
 #define   SRC_ACCESS_TYPE_SHIFT		21
 #define   DST_ACCESS_TYPE_SHIFT		20
@@ -106,6 +67,4 @@
 #define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 
-#define MI_ARB_CHECK            MI_INSTR(0x05, 0)
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index f871ba82bc9b..7c124475c428 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -5,6 +5,7 @@
 
 #include "xe_bb.h"
 
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 5be7f53f023a..811b81c39002 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a42ee3b9b8c7..74e1f47bd401 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 81463bd5e490..a04867131839 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,7 @@
 
 #include "xe_lrc.h"
 
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 716f72ba8cd6..b4baecde60e6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -13,6 +13,7 @@
 #include <drm/xe_drm.h>
 
 #include "generated/xe_wa_oob.h"
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
 #include "tests/xe_test.h"
 #include "xe_assert.h"
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index da13cc7ba6af..58676f4b989f 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -6,6 +6,7 @@
 #include "xe_ring_ops.h"
 
 #include "generated/xe_wa_oob.h"
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
@@ -91,7 +92,7 @@ static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
 
 static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 {
-	dw[i++] = MI_BATCH_BUFFER_START | ppgtt_flag;
+	dw[i++] = MI_BATCH_BUFFER_START | ppgtt_flag | XE_INSTR_NUM_DW(3);
 	dw[i++] = lower_32_bits(batch_addr);
 	dw[i++] = upper_32_bits(batch_addr);
 
-- 
2.41.0

