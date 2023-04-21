Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C69BC7EE25
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5210EF22;
	Fri, 21 Apr 2023 22:33:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07D610E118
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116394; x=1713652394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUjLSU7ajHhy1izCwmfvNR4alPYgnQHBB2lrTiIKMf4=;
 b=ghX5MRNBNzeHw2L6DbqYMNGrUMCGYRODip1f7iWttW7q8Ik0JmsHgJK1
 kTkdkkH0OiIYXhK6bg+uRpzlVnzaUgsk6KAqU7H8h02YRupyZHaxTDJZ4
 CIADBeTAQaaMwDVEhb46JNxK93XNBPAfJY9cY9+iX0xn6w6bvKCDhdK0B
 Y8jJNpEyQi/oPEA6dyAjTloJ5nk14p9gx7ZhOEXbrV8IzRDPxCd/oIhJk
 fJRDaYn5Mk7D2YS5W8GnDJcbmZNgL2JfPJYo53B5IlbYzdAPEpC/D2rIG
 4h25bGU65TN64EYDeUDALeoFS9YZBQu+80YkBz6Cu6kATUnLMKjmgKoC+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693749"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693749"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913756"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:51 -0700
Message-Id: <20230421223258.128781-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/17] drm/xe: Use REG_FIELD/REG_BIT for all
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++------
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 53 +++++++++++-------------
 drivers/gpu/drm/xe/regs/xe_regs.h        | 12 +++---
 drivers/gpu/drm/xe/xe_gt_clock.c         | 17 ++++----
 4 files changed, 48 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index bfcb0e9a6d4c..938055f75492 100644
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
index 0908224737dc..4076d903b20e 100644
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
+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 4)
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
@@ -203,9 +200,9 @@
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
-#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
-#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
-#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
+#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
+#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
+#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
 #define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
 #define   L3_CLKGATE_DIS			REG_BIT(16)
 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
@@ -225,7 +222,7 @@
 #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
 
 #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
-#define   DFR_DISABLE				(1 << 9)
+#define   DFR_DISABLE				REG_BIT(9)
 
 #define RPNSWREQ				_MMIO(0xa008)
 #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
@@ -233,20 +230,18 @@
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
+#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
+#define   CTC_SOURCE_PARAMETER_MASK		REG_BIT(0)
 #define   CTC_SOURCE_CRYSTAL_CLOCK		0
 #define   CTC_SOURCE_DIVIDE_LOGIC		1
-#define   CTC_SHIFT_PARAMETER_SHIFT		1
-#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
 
 #define FORCEWAKE_RENDER			_MMIO(0xa278)
 #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
@@ -350,7 +345,7 @@
 #define GT_GFX_RC6				_MMIO(0x138108)
 
 #define GFX_FLSH_CNTL				_MMIO(0x101008)
-#define   GFX_FLSH_CNTL_EN			(1 << 0)
+#define   GFX_FLSH_CNTL_EN			REG_BIT(0)
 
 #define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
 
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
index 1b7d00284535..384a47d3c3eb 100644
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
2.39.0

