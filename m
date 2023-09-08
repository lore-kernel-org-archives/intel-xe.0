Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898AEEE57C2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B7F10E867;
	Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BCA10E863
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aFrKjP2HKMrNX7VdjvrWMZaYkcUll93rJGbFJ+8XzP4=;
 b=c8REeJh4RY9YY6L94tWDjh7HkdlxW5+5HXPz002NgKK62QNEF2Pk+VWR
 XPeeGBuM7R5aUssTGtx0Z2PuuUCHHtJCm6k8qeilriDcC4pDhEfrVbtTu
 vxc18FPCXNmJDukKWxQxPFugHBYfiH5+WjDrcDeUsjQruDFmxQgicaHnD
 x7KHObae60lnFbZMk0bxGf56UA13BbzypThshc/heUcoYA3IjOmcwzOxp
 ZV+2LLJfE0yoYTEoOr8MCZosH7pf0+f6EUbVc46t9gMaEijd+5bQaKgHP
 kuc1S5L2B4FPoM78RnFHbitEWM9yWUeFASFKdIJiu9WioPIWIPN9DKu3y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935387"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935387"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200711"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200711"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:34 -0700
Message-ID: <20230908042348.1592535-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/17] drm/xe/oa: Add registers and GPU commands
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

