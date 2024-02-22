Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E659EC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 18:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953C910EA1E;
	Thu, 22 Feb 2024 18:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yue1RpM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7109D10EA1E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708627217; x=1740163217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+UVW640FylllZnHUwrB/OUAGGLMkM/ma41ZafhH0wJw=;
 b=Yue1RpM4YAA4pOe+wZzdPWX++MbuTj6S8ii1BQPhE7exLncQd6UEI2xA
 kNH6qP+78i7/fFN1AXSelGV6+nDLFyFlrrWIwVWR7A554b03juKpF4NxI
 fPsTGb4oMOqGsXqjPAs75HYCi3Q1sNGe8KrzNu5GnIHvC6VqpzcyxRWML
 aOAO2eHHZ8D3lCMt+ud2DYDrCKyYgCxxQSL9dq11hHV6UsNaXm8qrSfBc
 n/ebUf70GThSpl0pMtkYWlIUA0AP1SYv7KmEmJQ5TWIIU3p/40nS2RR27
 MAuEZbCTZeG0tShNP/NXdWL9nu8lW+scCh/6b17h4aKojCI+qRlmCW0cU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3005350"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3005350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 10:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10169963"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 10:40:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Add LRC parsing for more GPU instructions
Date: Thu, 22 Feb 2024 10:40:08 -0800
Message-ID: <20240222184009.6857-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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

The LRCs on some of our newer platforms appear to contain a few GPU
instructions that weren't handled in our LRC parser.  Add the relevant
instruction names and opcodes so that our debugfs LRC dumps will
properly indicate what these are.

Bspec: 55866, 64848, 46931
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../xe/instructions/xe_gfx_state_commands.h   | 18 +++++++++++
 .../drm/xe/instructions/xe_gfxpipe_commands.h |  3 ++
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |  1 +
 drivers/gpu/drm/xe/xe_lrc.c                   | 31 +++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
new file mode 100644
index 000000000000..dca62af5a5d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GFX_STATE_COMMANDS_H_
+#define _XE_GFX_STATE_COMMANDS_H_
+
+#include "instructions/xe_instr_defs.h"
+
+#define GFX_STATE_OPCODE			REG_GENMASK(28, 26)
+
+#define GFX_STATE_CMD(opcode) \
+	(XE_INSTR_GFX_STATE | REG_FIELD_PREP(GFX_STATE_OPCODE, opcode))
+
+#define STATE_WRITE_INLINE			GFX_STATE_CMD(0x0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
index 8e6dd061f2ae..31d28a67ef6a 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
@@ -47,6 +47,8 @@
 #define GPGPU_CSR_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x4)
 #define STATE_COMPUTE_MODE			GFXPIPE_COMMON_CMD(0x1, 0x5)
 #define CMD_3DSTATE_BTD				GFXPIPE_COMMON_CMD(0x1, 0x6)
+#define STATE_SYSTEM_MEM_FENCE_ADDRESS		GFXPIPE_COMMON_CMD(0x1, 0x9)
+#define STATE_CONTEXT_DATA_BASE_ADDRESS		GFXPIPE_COMMON_CMD(0x1, 0xB)
 
 #define CMD_3DSTATE_VF_STATISTICS		GFXPIPE_SINGLE_DW_CMD(0x0, 0xB)
 
@@ -71,6 +73,7 @@
 #define CMD_3DSTATE_WM				GFXPIPE_3D_CMD(0x0, 0x14)
 #define CMD_3DSTATE_CONSTANT_VS			GFXPIPE_3D_CMD(0x0, 0x15)
 #define CMD_3DSTATE_CONSTANT_GS			GFXPIPE_3D_CMD(0x0, 0x16)
+#define CMD_3DSTATE_CONSTANT_PS			GFXPIPE_3D_CMD(0x0, 0x17)
 #define CMD_3DSTATE_SAMPLE_MASK			GFXPIPE_3D_CMD(0x0, 0x18)
 #define CMD_3DSTATE_CONSTANT_HS			GFXPIPE_3D_CMD(0x0, 0x19)
 #define CMD_3DSTATE_CONSTANT_DS			GFXPIPE_3D_CMD(0x0, 0x1A)
diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
index 04179b2a48e1..fd2ce7ace510 100644
--- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
@@ -17,6 +17,7 @@
 #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
 #define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
 #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
+#define   XE_INSTR_GFX_STATE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
 
 /*
  * Most (but not all) instructions have a "length" field in the instruction
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8c85e90220de..2c876eb1fd6b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -7,6 +7,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gfxpipe_commands.h"
+#include "instructions/xe_gfx_state_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_lrc_layout.h"
@@ -1045,6 +1046,8 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	MATCH(GPGPU_CSR_BASE_ADDRESS);
 	MATCH(STATE_COMPUTE_MODE);
 	MATCH3D(3DSTATE_BTD);
+	MATCH(STATE_SYSTEM_MEM_FENCE_ADDRESS);
+	MATCH(STATE_CONTEXT_DATA_BASE_ADDRESS);
 
 	MATCH3D(3DSTATE_VF_STATISTICS);
 
@@ -1069,6 +1072,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	MATCH3D(3DSTATE_WM);
 	MATCH3D(3DSTATE_CONSTANT_VS);
 	MATCH3D(3DSTATE_CONSTANT_GS);
+	MATCH3D(3DSTATE_CONSTANT_PS);
 	MATCH3D(3DSTATE_SAMPLE_MASK);
 	MATCH3D(3DSTATE_CONSTANT_HS);
 	MATCH3D(3DSTATE_CONSTANT_DS);
@@ -1161,6 +1165,31 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	}
 }
 
+static int dump_gfx_state_command(struct drm_printer *p,
+				  struct xe_gt *gt,
+				  u32 *dw,
+				  int remaining_dw)
+{
+	u32 numdw = instr_dw(*dw);
+	u32 opcode = REG_FIELD_GET(GFX_STATE_OPCODE, *dw);
+
+	/*
+	 * Make sure we haven't mis-parsed a number of dwords that exceeds the
+	 * remaining size of the LRC.
+	 */
+	if (xe_gt_WARN_ON(gt, numdw > remaining_dw))
+		numdw = remaining_dw;
+
+	switch (*dw & (XE_INSTR_GFX_STATE | GFX_STATE_OPCODE)) {
+	MATCH(STATE_WRITE_INLINE);
+
+	default:
+		drm_printf(p, "[%#010x] unknown GFX_STATE command (opcode=%#x), likely %d dwords\n",
+			   *dw, opcode, numdw);
+		return numdw;
+	}
+}
+
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class hwe_class)
@@ -1185,6 +1214,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
 			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
 		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE) {
 			num_dw = dump_gfxpipe_command(p, gt, dw, remaining_dw);
+		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFX_STATE) {
+			num_dw = dump_gfx_state_command(p, gt, dw, remaining_dw);
 		} else {
 			num_dw = min(instr_dw(*dw), remaining_dw);
 			drm_printf(p, "[%#10x] Unknown instruction of type %#x, likely %d dwords\n",
-- 
2.43.0

