Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5501C282D2
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADE010E4BD;
	Mon,  3 Mar 2025 17:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFfwG5d3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACE210E4BC
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023339; x=1772559339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9B+aIy+AuCIJZr/No9VnvLAWtrOBOGRlaupvnS3LXc=;
 b=NFfwG5d37hdc1zK2qIejduUul2XmR5DnSIWWGdmEN6J8tQJIPGfjsjKi
 KcbgpAMvjct4o0Dx1qFhb6GMlbbzxxm80kFaMnY4Va1kWy8+Sh8f1w/JC
 gfDKN4TBdOf72zMk7VramCsPuqUYImKqE7ke+y5tztN/Q7S1HjV4EMCs7
 GkKHeErJ0RBE8BJfRfcp2zz7OlxDoWBhgaBSt6rab9bUwRhmcbp4kWVWn
 2REqgvd0tVVZaQi2MBmn2+Z0/kViOtZjHqgm1bdTlUevFNTFA+yOlIk4u
 dWIfYqdyPtx2xNaQlcyN9ukZXpikjTw2q6kZ0WJaylvs/Fg+gmndEci2D g==;
X-CSE-ConnectionGUID: RXo6nlzDS2eQU0K0M22tQQ==
X-CSE-MsgGUID: /B8gIRO+QFKD4T2GcILKOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937519"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:39 -0800
X-CSE-ConnectionGUID: RG7m5WchSwuO/EUV/XwPyA==
X-CSE-MsgGUID: 0udLSryHSsG7o0JUQmKmqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101297"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/5] drm/xe: Add MI_MATH and ALU instruction definitions
Date: Mon,  3 Mar 2025 18:35:19 +0100
Message-Id: <20250303173522.1822-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

The command streamer implements an Arithmetic Logic Unit (ALU)
which supports basic arithmetic and logical operations on two
64-bit operands. Access to this ALU is thru the MI_MATH command
and sixteen General Purpose Register (GPR) 64-bit registers,
which are used as temporary storage.

Bspec: 45737, 60236 # MI
Bspec: 45525, 60132 # ALU
Bspec: 45533, 60309 # GPR
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/instructions/xe_alu_commands.h | 72 +++++++++++++++++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  4 ++
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_alu_commands.h b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
new file mode 100644
index 000000000000..c4321949f534
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_ALU_COMMANDS_H_
+#define _XE_ALU_COMMANDS_H_
+
+#include "instructions/xe_instr_defs.h"
+
+/* Instruction Opcodes */
+#define CS_ALU_OPCODE_NOOP			0x000
+#define CS_ALU_OPCODE_LOAD			0x080
+#define CS_ALU_OPCODE_LOADINV			0x480
+#define CS_ALU_OPCODE_LOAD0			0x081
+#define CS_ALU_OPCODE_LOAD1			0x481
+#define CS_ALU_OPCODE_ADD			0x100
+#define CS_ALU_OPCODE_SUB			0x101
+#define CS_ALU_OPCODE_AND			0x102
+#define CS_ALU_OPCODE_OR			0x103
+#define CS_ALU_OPCODE_XOR			0x104
+#define CS_ALU_OPCODE_STORE			0x180
+#define CS_ALU_OPCODE_STOREINV			0x580
+
+/* Instruction Operands */
+#define CS_ALU_OPERAND_REG(n)			REG_FIELD_PREP(GENMASK(3, 0), (n))
+#define CS_ALU_OPERAND_REG0			0x0
+#define CS_ALU_OPERAND_REG1			0x1
+#define CS_ALU_OPERAND_REG2			0x2
+#define CS_ALU_OPERAND_REG3			0x3
+#define CS_ALU_OPERAND_REG4			0x4
+#define CS_ALU_OPERAND_REG5			0x5
+#define CS_ALU_OPERAND_REG6			0x6
+#define CS_ALU_OPERAND_REG7			0x7
+#define CS_ALU_OPERAND_REG8			0x8
+#define CS_ALU_OPERAND_REG9			0x9
+#define CS_ALU_OPERAND_REG10			0xa
+#define CS_ALU_OPERAND_REG11			0xb
+#define CS_ALU_OPERAND_REG12			0xc
+#define CS_ALU_OPERAND_REG13			0xd
+#define CS_ALU_OPERAND_REG14			0xe
+#define CS_ALU_OPERAND_REG15			0xf
+#define CS_ALU_OPERAND_SRCA			0x20
+#define CS_ALU_OPERAND_SRCB			0x21
+#define CS_ALU_OPERAND_ACCU			0x31
+#define CS_ALU_OPERAND_ZF			0x32
+#define CS_ALU_OPERAND_CF			0x33
+#define CS_ALU_OPERAND_NA			0 /* N/A operand */
+
+/* Command Streamer ALU Instructions */
+#define CS_ALU_INSTR(opcode, op1, op2)		(REG_FIELD_PREP(GENMASK(31, 20), (opcode)) | \
+						 REG_FIELD_PREP(GENMASK(19, 10), (op1)) | \
+						 REG_FIELD_PREP(GENMASK(9, 0), (op2)))
+
+#define __CS_ALU_INSTR(opcode, op1, op2)	CS_ALU_INSTR(CS_ALU_OPCODE_##opcode, \
+							     CS_ALU_OPERAND_##op1, \
+							     CS_ALU_OPERAND_##op2)
+
+#define CS_ALU_INSTR_NOOP			__CS_ALU_INSTR(NOOP, NA, NA)
+#define CS_ALU_INSTR_LOAD(op1, op2)		__CS_ALU_INSTR(LOAD, op1, op2)
+#define CS_ALU_INSTR_LOADINV(op1, op2)		__CS_ALU_INSTR(LOADINV, op1, op2)
+#define CS_ALU_INSTR_LOAD0(op1)			__CS_ALU_INSTR(LOAD0, op1, NA)
+#define CS_ALU_INSTR_LOAD1(op1)			__CS_ALU_INSTR(LOAD1, op1, NA)
+#define CS_ALU_INSTR_ADD			__CS_ALU_INSTR(ADD, NA, NA)
+#define CS_ALU_INSTR_SUB			__CS_ALU_INSTR(SUB, NA, NA)
+#define CS_ALU_INSTR_AND			__CS_ALU_INSTR(AND, NA, NA)
+#define CS_ALU_INSTR_OR				__CS_ALU_INSTR(OR, NA, NA)
+#define CS_ALU_INSTR_XOR			__CS_ALU_INSTR(XOR, NA, NA)
+#define CS_ALU_INSTR_STORE(op1, op2)		__CS_ALU_INSTR(STORE, op1, op2)
+#define CS_ALU_INSTR_STOREINV(op1, op2)		__CS_ALU_INSTR(STOREINV, op1, op2)
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 526bad9d4bac..eba582058d55 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -32,6 +32,7 @@
 #define MI_BATCH_BUFFER_END		__MI_INSTR(0xA)
 #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
+#define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 4f372dc2cb89..659cf85fa3d6 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -184,6 +184,10 @@
 #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
 #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
 
+#define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) * 4)
+#define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
+#define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base), (n) * 2 + 1)
+
 #define VDBOX_CGCTL3F08(base)			XE_REG((base) + 0x3f08)
 #define   CG3DDISHRS_CLKGATE_DIS		REG_BIT(5)
 
-- 
2.47.1

