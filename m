Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86718CD37BB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC3210E642;
	Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiV6mJ6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBB10E63C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Umt+5CPlcTI5MMqAfvpXXKKooQCuP3JIfpgPSuOc7ek=;
 b=GiV6mJ6pK5ZbsCBnEgeBGMvZyrHPQPRbdCbGCYr12hAlyUyUtVERVOVR
 uZyZc3iSCIyDXjZtYFnRT6f33hovUKDwTaMJ/qjFsXxJViahpOD+Bdg3t
 4yGzbBc8t8fCX8SuDZ/H67Z+Z6JBe6wFmHryguckKwfTx75nIhetUMi4F
 WMeW7L67hnS9QbWmWMvOtET6eZscrBuDvT/9XnFynPrkCCd86gmzlxmhS
 u5tn4fhufqmoMiwlWvQFxnHzDZVQqR2tBm2zJ94p06WJSDQ1DUqlhO8qj
 FV6mfo/m16DkUkJhXxmLB0Uy5Xk/ompXAeCBC5jBEIswj+NcgG+16T01l A==;
X-CSE-ConnectionGUID: VPxxBVrPSAS5x70LF5HQAg==
X-CSE-MsgGUID: sYSv3Jy/SQymmtHnm51D1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904797"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: r789ByLMQGmBMq7CPs6pDQ==
X-CSE-MsgGUID: oWnaQEt2RBef5Xcsnv6qJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944224"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 10/43] drm/xe/irq: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:11 -0700
Message-ID: <20240904002100.2023834-55-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
MIME-Version: 1.0
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

Stop using GT pointers for register access.  This misusage has been
especially confusing in interrupt code because even though some of the
interrupts are related to GTs (or engines within GTs), the interrupt
registers themselves live outside the GT, in the sgunit.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 63 +++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5f2c368c35ad..baf393398d93 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -30,14 +30,14 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
-static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
+static void assert_iir_is_zero(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
 
 	if (val == 0)
 		return;
 
-	drm_WARN(&gt_to_xe(mmio)->drm, 1,
+	drm_WARN(&mmio->xe->drm, 1,
 		 "Interrupt register 0x%x is not zero: 0x%08x\n",
 		 reg.addr, val);
 	xe_mmio_write32(mmio, reg, 0xffffffff);
@@ -52,7 +52,7 @@ static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
  */
 static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	/*
 	 * If we're just enabling an interrupt now, it shouldn't already
@@ -70,7 +70,7 @@ static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
 /* Mask and disable all interrupts. */
 static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	xe_mmio_write32(mmio, IMR(irqregs), ~0);
 	/* Posting read */
@@ -87,7 +87,7 @@ static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
 
 static u32 xelp_intr_disable(struct xe_device *xe)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
 
@@ -103,7 +103,7 @@ static u32 xelp_intr_disable(struct xe_device *xe)
 static u32
 gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	u32 iir;
 
 	if (!(master_ctl & GU_MISC_IRQ))
@@ -118,7 +118,7 @@ gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
 
 static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
 	if (stall)
@@ -129,6 +129,7 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
 void xe_irq_enable_hwe(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 	u32 gsc_mask = 0;
@@ -155,35 +156,35 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 
 	if (!xe_gt_is_media_type(gt)) {
 		/* Enable interrupts for each engine class */
-		xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
+		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
 		if (ccs_mask)
-			xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
+			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
 
 		/* Unmask interrupts for each engine instance */
-		xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
-		xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
+		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
+		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
 		if (bcs_mask & (BIT(1)|BIT(2)))
-			xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
 		if (bcs_mask & (BIT(3)|BIT(4)))
-			xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
 		if (bcs_mask & (BIT(5)|BIT(6)))
-			xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
 		if (bcs_mask & (BIT(7)|BIT(8)))
-			xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
 		if (ccs_mask & (BIT(0)|BIT(1)))
-			xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
 		if (ccs_mask & (BIT(2)|BIT(3)))
-			xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
 	}
 
 	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
 		/* Enable interrupts for each engine class */
-		xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
+		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
 
 		/* Unmask interrupts for each engine instance */
-		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
-		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
-		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
+		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
+		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
+		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
 
 		/*
 		 * the heci2 interrupt is enabled via the same register as the
@@ -197,17 +198,17 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		}
 
 		if (gsc_mask) {
-			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, gsc_mask | heci_mask);
-			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~gsc_mask);
+			xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, gsc_mask | heci_mask);
+			xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~gsc_mask);
 		}
 		if (heci_mask)
-			xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
+			xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
 	}
 }
 
 static u32
 gt_engine_identity(struct xe_device *xe,
-		   struct xe_gt *mmio,
+		   struct xe_mmio *mmio,
 		   const unsigned int bank,
 		   const unsigned int bit)
 {
@@ -291,7 +292,7 @@ static void gt_irq_handler(struct xe_tile *tile,
 			   u32 *identity)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 	unsigned int bank, bit;
 	u16 instance, intr_vec;
 	enum xe_engine_class class;
@@ -376,7 +377,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 static u32 dg1_intr_disable(struct xe_device *xe)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	u32 val;
 
 	/* First disable interrupts */
@@ -394,7 +395,7 @@ static u32 dg1_intr_disable(struct xe_device *xe)
 
 static void dg1_intr_enable(struct xe_device *xe, bool stall)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
 	if (stall)
@@ -431,7 +432,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	}
 
 	for_each_tile(tile, xe, id) {
-		struct xe_gt *mmio = tile->primary_gt;
+		struct xe_mmio *mmio = &tile->mmio;
 
 		if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
 			continue;
@@ -474,7 +475,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 static void gt_irq_reset(struct xe_tile *tile)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
 						   XE_ENGINE_CLASS_COMPUTE);
@@ -547,7 +548,7 @@ static void dg1_irq_reset(struct xe_tile *tile)
 
 static void dg1_irq_reset_mstr(struct xe_tile *tile)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
 }
-- 
2.45.2

