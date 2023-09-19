Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A04FCE79AB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77F710E28D;
	Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7445110E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140179; x=1726676179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aFrKjP2HKMrNX7VdjvrWMZaYkcUll93rJGbFJ+8XzP4=;
 b=boNZwPvPwlyaVLRW1UQpKl6cFN+ZIl5ymwozCECJkDSXrZuUAB73WG9X
 Xv9hTar543sW4ytil57xK6yzvoOH7jHpKYPbvd4e2IFN7A9SWf0M436gq
 hLAjikoy6S4+FSZwPj33zgf4VsA0bX1RatuKyCK3+GU1/WY8juenTWkHT
 g7Hd1P377NDPaOezHEzTw6lmgFvI+ebosxjBnBiZ0ISJTlXNAYbAfq0ua
 wu+2RcUF0huUHCjtd60ra8JKwOyouxLmPGTmR9IFWwAPGL3PdYj9PY1bA
 M/wFMrpWX6gvEc2AmjU7cIW6BSqP75gwLGJuf9hFtFV2X/KniIIJUNqe1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913531"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016508"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016508"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:31 -0700
Message-ID: <20230919161049.2307855-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/21] drm/xe/oa: Add registers and GPU commands
 used by OA
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

Add registers and GPU commands used by OA in subsequent patches. The xe oa
code programs OA units which generate performance data. The code also
submits command buffers to change hardware engine context images and
implement waits.

v2: Remove unused registers (used by noa wait) (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   2 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  13 ++
 drivers/gpu/drm/xe/regs/xe_oa_regs.h      | 173 ++++++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 692213d09ceaa..c12d23526f6ba 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -115,6 +115,8 @@
 #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
 #define	  EL_CTRL_LOAD				REG_BIT(0)
 
+#define GEN8_RING_CS_GPR(base, n)		XE_REG((base) + 0x600 + (n) * 8)
+
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 12120dd37aa2a..f74cab662ad5b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -14,6 +14,7 @@
 
 #define MI_INSTR(opcode, flags) \
 	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
+#define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
 
 #define MI_NOOP			MI_INSTR(0, 0)
 #define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
@@ -23,12 +24,19 @@
 #define   MI_ARB_DISABLE		(0<<0)
 
 #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
+
 #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
+#define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
 
 #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_FORCE_POSTED		(1<<12)
+#define   IS_MI_LRI_CMD(x)		(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
+
+#define MI_STORE_REGISTER_MEM	MI_INSTR(0x24, 1)
+#define   MI_SRM_LRM_GLOBAL_GTT		REG_BIT(22)
 
 #define MI_FLUSH_DW		MI_INSTR(0x26, 1)
 #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
@@ -37,7 +45,12 @@
 #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
 #define   MI_FLUSH_DW_USE_GTT		(1<<2)
 
+#define MI_LOAD_REGISTER_MEM	MI_INSTR(0x29, 1)
+
+#define MI_LOAD_REGISTER_REG	MI_INSTR(0x2A, 1)
+
 #define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
+#define   MI_BATCH_PREDICATE         REG_BIT(15) /* HSW+ on RCS only*/
 
 #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
 #define   SRC_ACCESS_TYPE_SHIFT		21
diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
new file mode 100644
index 0000000000000..0b378cb7a6ddb
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_OA_REGS__
+#define __XE_OA_REGS__
+
+#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
+#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
+
+#define HALF_SLICE_CHICKEN2 XE_REG_MCR(0xe180)
+#define   GEN8_ST_PO_DISABLE	REG_BIT(13)
+
+#define GEN7_ROW_CHICKEN2		XE_REG(0xe4f4)
+#define GEN8_ROW_CHICKEN		XE_REG_MCR(0xe4f0)
+#define   STALL_DOP_GATING_DISABLE	REG_BIT(5)
+#define   GEN12_DISABLE_DOP_GATING	REG_BIT(0)
+
+#define RPM_CONFIG1			XE_REG(0xd04)
+#define   GEN10_GT_NOA_ENABLE		REG_BIT(9)
+
+#define WAIT_FOR_RC6_EXIT XE_REG(0x20cc)
+#define   HSW_WAIT_FOR_RC6_EXIT_ENABLE	REG_BIT(0)
+
+#define EU_PERF_CNTL0 XE_REG(0xe458)
+#define EU_PERF_CNTL4 XE_REG(0xe45c)
+#define EU_PERF_CNTL1 XE_REG(0xe558)
+#define EU_PERF_CNTL5 XE_REG(0xe55c)
+#define EU_PERF_CNTL2 XE_REG(0xe658)
+#define EU_PERF_CNTL6 XE_REG(0xe65c)
+#define EU_PERF_CNTL3 XE_REG(0xe758)
+
+#define OABUFFER_SIZE_MASK	REG_GENMASK(5, 3)
+#define OABUFFER_SIZE_128K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 0)
+#define OABUFFER_SIZE_256K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 1)
+#define OABUFFER_SIZE_512K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 2)
+#define OABUFFER_SIZE_1M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 3)
+#define OABUFFER_SIZE_2M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 4)
+#define OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
+#define OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
+#define OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
+
+#define GEN12_OA_TLB_INV_CR XE_REG(0xceec)
+
+/* Gen12 OAR unit */
+#define GEN12_OAR_OACONTROL XE_REG(0x2960)
+#define  GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT 1
+#define  GEN12_OAR_OACONTROL_COUNTER_ENABLE	REG_BIT(0)
+
+#define GEN8_OACTXCONTROL XE_REG(0x2360)
+#define  GEN8_OA_COUNTER_RESUME			REG_BIT(0)
+
+#define GEN12_OACTXCONTROL(base) XE_REG((base) + 0x360)
+#define GEN12_OAR_OASTATUS XE_REG(0x2968)
+
+/* Gen12 OAG unit */
+#define GEN12_OAG_OAHEADPTR XE_REG(0xdb00)
+#define  GEN12_OAG_OAHEADPTR_MASK 0xffffffc0
+#define GEN12_OAG_OATAILPTR XE_REG(0xdb04)
+#define  GEN12_OAG_OATAILPTR_MASK 0xffffffc0
+
+#define GEN12_OAG_OABUFFER XE_REG(0xdb08)
+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_MASK  (0x7)
+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_SHIFT (3)
+#define  GEN12_OAG_OABUFFER_MEMORY_SELECT     REG_BIT(0) /* 0: PPGTT, 1: GGTT */
+
+#define GEN12_OAG_OAGLBCTXCTRL XE_REG(0x2b28)
+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_PERIOD_SHIFT 2
+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_ENABLE	REG_BIT(1)
+#define  GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME	REG_BIT(0)
+
+#define GEN12_OAG_OACONTROL XE_REG(0xdaf4)
+#define  GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT 2
+#define  GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
+
+#define GEN12_OAG_OA_DEBUG XE_REG(0xdaf8)
+#define  GEN12_OAG_OA_DEBUG_INCLUDE_CLK_RATIO		REG_BIT(6)
+#define  GEN12_OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS	REG_BIT(5)
+#define  GEN12_OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS	REG_BIT(2)
+#define  GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
+
+#define GEN12_OAG_OASTATUS XE_REG(0xdafc)
+#define  GEN12_OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
+#define  GEN12_OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
+#define  GEN12_OAG_OASTATUS_REPORT_LOST		REG_BIT(0)
+
+#define GDT_CHICKEN_BITS    XE_REG(0x9840)
+#define   GT_NOA_ENABLE	    0x00000080
+
+#define GEN12_SQCNT1				XE_REG(0x8718)
+#define   GEN12_SQCNT1_PMON_ENABLE		REG_BIT(30)
+#define   GEN12_SQCNT1_OABPC			REG_BIT(29)
+
+/* Gen12 OAM unit */
+#define GEN12_OAM_HEAD_POINTER_OFFSET   (0x1a0)
+#define  GEN12_OAM_HEAD_POINTER_MASK    0xffffffc0
+
+#define GEN12_OAM_TAIL_POINTER_OFFSET   (0x1a4)
+#define  GEN12_OAM_TAIL_POINTER_MASK    0xffffffc0
+
+#define GEN12_OAM_BUFFER_OFFSET         (0x1a8)
+#define  GEN12_OAM_BUFFER_SIZE_MASK     (0x7)
+#define  GEN12_OAM_BUFFER_SIZE_SHIFT    (3)
+#define  GEN12_OAM_BUFFER_MEMORY_SELECT REG_BIT(0) /* 0: PPGTT, 1: GGTT */
+
+#define GEN12_OAM_CONTEXT_CONTROL_OFFSET              (0x1bc)
+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_PERIOD_SHIFT 2
+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_ENABLE       REG_BIT(1)
+#define  GEN12_OAM_CONTEXT_CONTROL_COUNTER_RESUME     REG_BIT(0)
+
+#define GEN12_OAM_CONTROL_OFFSET                (0x194)
+#define  GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT 1
+#define  GEN12_OAM_CONTROL_COUNTER_ENABLE       REG_BIT(0)
+
+#define GEN12_OAM_DEBUG_OFFSET                      (0x198)
+#define  GEN12_OAM_DEBUG_BUFFER_SIZE_SELECT         REG_BIT(12)
+#define  GEN12_OAM_DEBUG_INCLUDE_CLK_RATIO          REG_BIT(6)
+#define  GEN12_OAM_DEBUG_DISABLE_CLK_RATIO_REPORTS  REG_BIT(5)
+#define  GEN12_OAM_DEBUG_DISABLE_GO_1_0_REPORTS     REG_BIT(2)
+#define  GEN12_OAM_DEBUG_DISABLE_CTX_SWITCH_REPORTS REG_BIT(1)
+
+#define GEN12_OAM_STATUS_OFFSET            (0x19c)
+#define  GEN12_OAM_STATUS_COUNTER_OVERFLOW REG_BIT(2)
+#define  GEN12_OAM_STATUS_BUFFER_OVERFLOW  REG_BIT(1)
+#define  GEN12_OAM_STATUS_REPORT_LOST      REG_BIT(0)
+
+#define GEN12_OAM_MMIO_TRG_OFFSET	(0x1d0)
+
+#define GEN12_OAM_MMIO_TRG(base) \
+	XE_REG((base) + GEN12_OAM_MMIO_TRG_OFFSET)
+
+#define GEN12_OAM_HEAD_POINTER(base) \
+	XE_REG((base) + GEN12_OAM_HEAD_POINTER_OFFSET)
+#define GEN12_OAM_TAIL_POINTER(base) \
+	XE_REG((base) + GEN12_OAM_TAIL_POINTER_OFFSET)
+#define GEN12_OAM_BUFFER(base) \
+	XE_REG((base) + GEN12_OAM_BUFFER_OFFSET)
+#define GEN12_OAM_CONTEXT_CONTROL(base) \
+	XE_REG((base) + GEN12_OAM_CONTEXT_CONTROL_OFFSET)
+#define GEN12_OAM_CONTROL(base) \
+	XE_REG((base) + GEN12_OAM_CONTROL_OFFSET)
+#define GEN12_OAM_DEBUG(base) \
+	XE_REG((base) + GEN12_OAM_DEBUG_OFFSET)
+#define GEN12_OAM_STATUS(base) \
+	XE_REG((base) + GEN12_OAM_STATUS_OFFSET)
+
+#define GEN12_OAM_CEC0_0_OFFSET		(0x40)
+#define GEN12_OAM_CEC7_1_OFFSET		(0x7c)
+#define GEN12_OAM_CEC0_0(base) \
+	XE_REG((base) + GEN12_OAM_CEC0_0_OFFSET)
+#define GEN12_OAM_CEC7_1(base) \
+	XE_REG((base) + GEN12_OAM_CEC7_1_OFFSET)
+
+#define GEN12_OAM_STARTTRIG1_OFFSET	(0x00)
+#define GEN12_OAM_STARTTRIG8_OFFSET	(0x1c)
+#define GEN12_OAM_STARTTRIG1(base) \
+	XE_REG((base) + GEN12_OAM_STARTTRIG1_OFFSET)
+#define GEN12_OAM_STARTTRIG8(base) \
+	XE_REG((base) + GEN12_OAM_STARTTRIG8_OFFSET)
+
+#define GEN12_OAM_REPORTTRIG1_OFFSET	(0x20)
+#define GEN12_OAM_REPORTTRIG8_OFFSET	(0x3c)
+#define GEN12_OAM_REPORTTRIG1(base) \
+	XE_REG((base) + GEN12_OAM_REPORTTRIG1_OFFSET)
+#define GEN12_OAM_REPORTTRIG8(base) \
+	XE_REG((base) + GEN12_OAM_REPORTTRIG8_OFFSET)
+
+#define GEN12_OAM_PERF_COUNTER_B0_OFFSET	(0x84)
+#define GEN12_OAM_PERF_COUNTER_B(base, idx) \
+	XE_REG((base) + GEN12_OAM_PERF_COUNTER_B0_OFFSET + 4 * (idx))
+
+#endif /* __XE_OA_REGS__ */
-- 
2.41.0

