Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD92C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 16:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E3210E647;
	Tue,  4 Mar 2025 16:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfiwBc6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F210E647
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741105405; x=1772641405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FD2jkAY+1yYPyTjDzqn6NvoB12r0ywRPs7no7XvH+UQ=;
 b=TfiwBc6t5y16i040ZbHuMEILO49/2EJ+n00cZCSLBp/aeQMpa315P/aq
 rwzkoamqObSrwVIUJMQxmPnxz2SCoVYp9et6pSHOK2n58ybtX0K6UlAWQ
 VraZbmrsdeUtb+qvsgmk6vc4RJ8YPvmFuWnSAnTa3kYgz35wM+SstbMaE
 3BU+V7hRS+GxMqAaXiMTaSXB3lBrEas24+oJPKmrYK/RiJ31seWgWZyfS
 5enMJI5q/NRZmLys64lmoACrqm+L/N7H2vBSIeAth5z1ng+WL4/9eYf9A
 RcmxNa7euKA/dEt3pVnDd3ITC9IMkUfmzAU0SJKxC5qCXsAhi0gnLHVjK Q==;
X-CSE-ConnectionGUID: I96qY5hnQz2gwyliSc+E7g==
X-CSE-MsgGUID: 2c/LJ40uTQGlw1RylWwbcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41890965"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41890965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:23:25 -0800
X-CSE-ConnectionGUID: TSjYeWGkRaeAeEB9pY/TIw==
X-CSE-MsgGUID: v/zN8ZejRaq8+A2K18SWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118913154"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:23:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/5] drm/xe: Add MI_MATH and ALU instruction definitions
Date: Tue,  4 Mar 2025 17:23:07 +0100
Message-Id: <20250304162307.1866-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-3-michal.wajdeczko@intel.com>
References: <20250303173522.1822-3-michal.wajdeczko@intel.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2: also include ALU opcodes from Xe_HP/Xe2 (Matt)
---
 .../gpu/drm/xe/instructions/xe_alu_commands.h | 79 +++++++++++++++++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  4 +
 3 files changed, 84 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_alu_commands.h b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
new file mode 100644
index 000000000000..2987b10d3e16
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_alu_commands.h
@@ -0,0 +1,79 @@
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
+#define CS_ALU_OPCODE_FENCE_RD			0x001
+#define CS_ALU_OPCODE_FENCE_WR			0x002
+#define CS_ALU_OPCODE_LOAD			0x080
+#define CS_ALU_OPCODE_LOADINV			0x480
+#define CS_ALU_OPCODE_LOAD0			0x081
+#define CS_ALU_OPCODE_LOAD1			0x481
+#define CS_ALU_OPCODE_LOADIND			0x082
+#define CS_ALU_OPCODE_ADD			0x100
+#define CS_ALU_OPCODE_SUB			0x101
+#define CS_ALU_OPCODE_AND			0x102
+#define CS_ALU_OPCODE_OR			0x103
+#define CS_ALU_OPCODE_XOR			0x104
+#define CS_ALU_OPCODE_SHL			0x105
+#define CS_ALU_OPCODE_SHR			0x106
+#define CS_ALU_OPCODE_SAR			0x107
+#define CS_ALU_OPCODE_STORE			0x180
+#define CS_ALU_OPCODE_STOREINV			0x580
+#define CS_ALU_OPCODE_STOREIND			0x181
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

