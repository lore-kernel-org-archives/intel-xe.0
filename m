Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6E6C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 22:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD2510E1A0;
	Thu, 27 Apr 2023 22:33:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4263610E18D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682634786; x=1714170786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U11kzwhoBUT8D35drt7pvzFsIP9oHfbcDb7CXJqwlGU=;
 b=AXgKX2bJF0G4sGCFmW4sYaRgeCMiV5PFU5HwBWj3WaGhPgohmPGUii7v
 hSDMSF5KGjKkf1K/A9Kbgs24+hkUbtUxz8gjad6slG0XMcCT9oPCUvujF
 ojeIc82G2pIWi+Z7kMMkfp6kYIhwmqA46iJQr5nSUG2RvmBWpNV5sAqpk
 hvlyNtPIEhCjJVtWLI3j60gpSYhneZZa8IoD36GZLlyrnRqVrqa3y+cMW
 QPFmwbVgTCmw73zD8yaCB2wSWq8SyYnB6BQEdvFBtilq6fF8g2aKMJ7XT
 oVv2hbaseboq6YpmabjjvI6oIg6VS/ZZKhcc+3xmch+++RnRDXJG7N0p7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412950609"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="412950609"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727314332"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="727314332"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Apr 2023 15:32:49 -0700
Message-Id: <20230427223256.1432787-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427223256.1432787-1-lucas.demarchi@intel.com>
References: <20230427223256.1432787-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/10] drm/xe: Use REG_FIELD/REG_BIT for all
 regs/*.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Convert the macro declarations to the equivalent GENMASK and
and bitfield prep for all registers.

v2 (Matt Roper):
  - Fix wrong conversion of RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
  - Reorder fields of XEHP_SLICE_UNIT_LEVEL_CLKGATE for consistency
  - Simplify CTC_SOURCE_* by only defining CTC_SOURCE_DIVIDE_LOGIC
    as REG_BIT(0)

v3: Also remove DOP_CLOCK_GATE_ENABLE that is unused and wrongly defined

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++-----
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 58 ++++++++++--------------
 drivers/gpu/drm/xe/regs/xe_regs.h        | 12 ++---
 drivers/gpu/drm/xe/xe_gt_clock.c         | 19 ++++----
 4 files changed, 50 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 9d61f5941289..f1e75703e4bc 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -22,7 +22,7 @@
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 
 #define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
-#define   RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
+#define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
 
 #define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
@@ -54,7 +54,7 @@
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
 #define RING_MODE(base)				_MMIO((base) + 0x29c)
-#define   GFX_DISABLE_LEGACY_MODE		(1 << 3)
+#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
 #define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
 
@@ -68,17 +68,17 @@
 
 #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
 #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 1)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 2)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 3)
 #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
-#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
-#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
-#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
-#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
-#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
-#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
-#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
-#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
-#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
-#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	REG_GENMASK(1, 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_1		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_4		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 1)
+#define   RING_FORCE_TO_NONPRIV_RANGE_16	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 2)
+#define   RING_FORCE_TO_NONPRIV_RANGE_64	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 3)
 #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
 						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
 						 RING_FORCE_TO_NONPRIV_DENY)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 1cb63d747c6f..0538313848c9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -9,15 +9,13 @@
 #include "regs/xe_reg_defs.h"
 
 /* RPM unit config (Gen8+) */
-#define RPM_CONFIG0				_MMIO(0xd00)
-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
+#define RPM_CONFIG0					_MMIO(0xd00)
+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
-#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
-#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
+#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
 
 #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
 #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
@@ -39,15 +37,15 @@
 #define MCR_SELECTOR				_MMIO(0xfdc)
 #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
 #define   MCR_MULTICAST				REG_BIT(31)
-#define   MCR_SLICE(slice)			(((slice) & 0xf) << 27)
-#define   MCR_SLICE_MASK			MCR_SLICE(0xf)
-#define   MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
-#define   MCR_SUBSLICE_MASK			MCR_SUBSLICE(0x7)
+#define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
+#define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
+#define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
+#define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
 #define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
-#define   FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
+#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
 #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
 #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
@@ -59,12 +57,12 @@
 #define PS_INVOCATION_COUNT			_MMIO(0x2348)
 
 #define CS_CHICKEN1				_MMIO(0x2580)
-#define   PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
 #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
 #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
 #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
 #define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
 #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
+#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
 
 #define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
 #define GFX_CCS_AUX_NV				_MMIO(0x4208)
@@ -131,19 +129,18 @@
 
 #define	MIRROR_FUSE3				_MMIO(0x9118)
 #define   L3BANK_PAIR_COUNT			4
-#define   L3BANK_MASK				0x0F
+#define   L3BANK_MASK				REG_GENMASK(3, 0)
 /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
 #define   MAX_MSLICES				4
-#define   MEML3_EN_MASK				0x0F
+#define   MEML3_EN_MASK				REG_GENMASK(3, 0)
 
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				_MMIO(0x9114)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
 #define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
-#define   GT_VDBOX_DISABLE_MASK			0xff
-#define   GT_VEBOX_DISABLE_SHIFT		16
-#define   GT_VEBOX_DISABLE_MASK			(0x0f << GT_VEBOX_DISABLE_SHIFT)
+#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
+#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
 
 #define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
@@ -157,7 +154,6 @@
 
 #define MISCCPCTL				_MMIO(0x9424)
 #define   DOP_CLOCK_GATE_RENDER_ENABLE		REG_BIT(1)
-#define   DOP_CLOCK_GATE_ENABLE			REG_BIT((0)
 
 #define UNSLCGCTL9430				_MMIO(0x9430)
 #define   MSQDUNIT_CLKGATE_DIS			REG_BIT(3)
@@ -203,12 +199,12 @@
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
-#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
-#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
-#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
-#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
-#define   L3_CLKGATE_DIS			REG_BIT(16)
 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
+#define   L3_CLKGATE_DIS			REG_BIT(16)
+#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
+#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
+#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
+#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
 
 #define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
 #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
@@ -224,7 +220,7 @@
 #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
 
 #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
-#define   DFR_DISABLE				(1 << 9)
+#define   DFR_DISABLE				REG_BIT(9)
 
 #define RPNSWREQ				_MMIO(0xa008)
 #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
@@ -232,20 +228,16 @@
 #define RC_STATE				_MMIO(0xa094)
 
 #define PMINTRMSK				_MMIO(0xa168)
-#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
-#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
+#define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
+#define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
 
 #define FORCEWAKE_GT				_MMIO(0xa188)
 
 #define PG_ENABLE				_MMIO(0xa210)
 
-/* GPM unit config (Gen9+) */
 #define CTC_MODE				_MMIO(0xa26c)
-#define   CTC_SOURCE_PARAMETER_MASK		1
-#define   CTC_SOURCE_CRYSTAL_CLOCK		0
-#define   CTC_SOURCE_DIVIDE_LOGIC		1
-#define   CTC_SHIFT_PARAMETER_SHIFT		1
-#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
+#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
+#define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
 
 #define FORCEWAKE_RENDER			_MMIO(0xa278)
 #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index e6b81bcff91f..da1d5aa6cdb7 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -37,10 +37,10 @@
 #define XEHPC_BCS7_RING_BASE			0x3ec000
 #define XEHPC_BCS8_RING_BASE			0x3ee000
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
-#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
+#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
-#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
+#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
 #define FF_THREAD_MODE				_MMIO(0x20a0)
 #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
@@ -90,10 +90,8 @@
 #define   DG1_MSTR_TILE(t)			REG_BIT(t)
 
 #define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
 
 #define GGC					_MMIO(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 1b7d00284535..49625d49bdcc 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -17,13 +17,12 @@ static u32 read_reference_ts_freq(struct xe_gt *gt)
 	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
 	u32 base_freq, frac_freq;
 
-	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
-		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
+	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
+				  ts_override) + 1;
 	base_freq *= 1000000;
 
-	frac_freq = ((ts_override &
-		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
-		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
+	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
+				  ts_override);
 	frac_freq = 1000000 / (frac_freq + 1);
 
 	return base_freq + frac_freq;
@@ -35,9 +34,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	const u32 f24_mhz = 24000000;
 	const u32 f25_mhz = 25000000;
 	const u32 f38_4_mhz = 38400000;
-	u32 crystal_clock =
-		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
-		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
+	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
+					  rpm_config_reg);
 
 	switch (crystal_clock) {
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
@@ -62,7 +60,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	/* Assuming gen11+ so assert this assumption is correct */
 	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
-	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
+	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
 	} else {
 		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0.reg);
@@ -74,8 +72,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 		 * register increments from this frequency (it might
 		 * increment only every few clock cycle).
 		 */
-		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
-			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
+		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
 	}
 
 	gt->info.clock_freq = freq;
-- 
2.40.1

