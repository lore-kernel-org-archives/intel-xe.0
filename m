Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B24C761A6
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FAD10F35D;
	Sat,  1 Apr 2023 00:21:35 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F5810F35B
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308471; x=1711844471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgmFCHot+42CDJdsy17Khfnb3Lw075d84Pf1JVeI3eg=;
 b=gXf0F8BHRioSLfy5fYCcZ5MAjqC69Lpr8QkMC10ADRbmv3BaSAK3WLQr
 aVTjYhGUncA/NJFId/YMDbYBttXgRgGJ4KtFkejPseehbFKPbt2W9Y5ZN
 NL48HCbhLfvNGBm4jTkRI30zaLSo87Xl4QsxZ2QLD6bbJ9i8P/BZZq6C8
 ZDHc84m0MEFNGIGZChV9jqYkZysX7enLuHKg+VPxojveOUziDyEJXfhLC
 J67ZiAp5vtUm4hRF1wm9tFLiEwHdwY43i79JKftwMHjVGiTBiu/X234L3
 LeDfS4bMPZa750KDi4QZ8Ry7iwsN6ZRPJUACXsNAPOsKeDCnguiAGtgCm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624210"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624210"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520540"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520540"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:02 -0700
Message-Id: <20230401002106.588656-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/8] drm/xe/irq: Drop unnecessary GEN11_ and
 GEN12_ register prefixes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Any interrupt registers that were introduced by platforms i915
considered to be "gen11" or "gen12" are present on all platforms that
the Xe driver supports; drop the unnecessary prefixes.

While working in the area, also convert a few open-coded bit
manipulations over to REG_BIT and REG_FIELD_GET notation.

v2:
 - Add missing renames in xe_display.c.  (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  42 +++++------
 drivers/gpu/drm/xe/regs/xe_regs.h    |  12 +--
 drivers/gpu/drm/xe/xe_display.c      |   4 +-
 drivers/gpu/drm/xe/xe_guc.c          |   6 +-
 drivers/gpu/drm/xe/xe_irq.c          | 109 +++++++++++++--------------
 5 files changed, 86 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f45251df5715..a8a37e6a45a3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -348,34 +348,34 @@
 #define GFX_FLSH_CNTL_GEN6			_MMIO(0x101008)
 #define   GFX_FLSH_CNTL_EN			(1 << 0)
 
-#define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
+#define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
 
-#define GEN11_GUC_SG_INTR_ENABLE		_MMIO(0x190038)
+#define GUC_SG_INTR_ENABLE			_MMIO(0x190038)
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
 #define   ENGINE0_MASK				REG_GENMASK(15, 0)
 
-#define GEN11_GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
+#define GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
 
-#define GEN11_INTR_IDENTITY_REG(x)		_MMIO(0x190060 + ((x) * 4))
-#define   GEN11_INTR_DATA_VALID			(1 << 31)
-#define   GEN11_INTR_ENGINE_INSTANCE(x)		(((x) & GENMASK(25, 20)) >> 20)
-#define   GEN11_INTR_ENGINE_CLASS(x)		(((x) & GENMASK(18, 16)) >> 16)
-#define   GEN11_INTR_ENGINE_INTR(x)		((x) & 0xffff)
+#define INTR_IDENTITY_REG(x)			_MMIO(0x190060 + ((x) * 4))
+#define   INTR_DATA_VALID			REG_BIT(31)
+#define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
+#define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
+#define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
 
-#define GEN11_RENDER_COPY_INTR_ENABLE		_MMIO(0x190030)
-#define GEN11_VCS_VECS_INTR_ENABLE		_MMIO(0x190034)
-#define GEN12_CCS_RSVD_INTR_ENABLE		_MMIO(0x190048)
-#define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
-#define GEN11_RCS0_RSVD_INTR_MASK		_MMIO(0x190090)
-#define GEN11_BCS_RSVD_INTR_MASK		_MMIO(0x1900a0)
-#define GEN11_VCS0_VCS1_INTR_MASK		_MMIO(0x1900a8)
-#define GEN11_VCS2_VCS3_INTR_MASK		_MMIO(0x1900ac)
-#define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
-#define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
-#define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
-#define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
-#define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
+#define RENDER_COPY_INTR_ENABLE			_MMIO(0x190030)
+#define VCS_VECS_INTR_ENABLE			_MMIO(0x190034)
+#define CCS_RSVD_INTR_ENABLE			_MMIO(0x190048)
+#define IIR_REG_SELECTOR(x)			_MMIO(0x190070 + ((x) * 4))
+#define RCS0_RSVD_INTR_MASK			_MMIO(0x190090)
+#define BCS_RSVD_INTR_MASK			_MMIO(0x1900a0)
+#define VCS0_VCS1_INTR_MASK			_MMIO(0x1900a8)
+#define VCS2_VCS3_INTR_MASK			_MMIO(0x1900ac)
+#define VECS0_VECS1_INTR_MASK			_MMIO(0x1900d0)
+#define GUC_SG_INTR_MASK			_MMIO(0x1900e8)
+#define GPM_WGBOXPERF_INTR_MASK			_MMIO(0x1900ec)
+#define CCS0_CCS1_INTR_MASK			_MMIO(0x190100)
+#define CCS2_CCS3_INTR_MASK			_MMIO(0x190104)
 #define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
 #define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
 #define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index be19b270c983..89b51857fd3d 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -78,13 +78,13 @@
 
 #define PCU_IRQ_OFFSET				0x444e0
 #define GU_MISC_IRQ_OFFSET			0x444f0
-#define   GEN11_GU_MISC_GSE			(1 << 27)
+#define   GU_MISC_GSE				REG_BIT(27)
 
-#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
-#define   GEN11_MASTER_IRQ			(1 << 31)
-#define   GEN11_GU_MISC_IRQ			(1 << 29)
-#define   GEN11_DISPLAY_IRQ			(1 << 16)
-#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
+#define GFX_MSTR_IRQ				_MMIO(0x190010)
+#define   MASTER_IRQ				REG_BIT(31)
+#define   GU_MISC_IRQ				REG_BIT(29)
+#define   DISPLAY_IRQ				REG_BIT(16)
+#define   GT_DW_IRQ(x)				REG_BIT(x)
 
 #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
 #define   DG1_MSTR_IRQ				REG_BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index e9b3997c4028..5fab5b9fbde0 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -275,7 +275,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 	if (!xe->info.enable_display)
 		return;
 
-	if (master_ctl & GEN11_DISPLAY_IRQ)
+	if (master_ctl & DISPLAY_IRQ)
 		gen11_display_irq_handler(xe);
 }
 
@@ -284,7 +284,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 	if (!xe->info.enable_display)
 		return;
 
-	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+	if (gu_misc_iir & GU_MISC_GSE)
 		intel_opregion_asle_intr(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 58b9841616e4..ee71b969bcbf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -561,12 +561,12 @@ static void guc_enable_irq(struct xe_guc *guc)
 		REG_FIELD_PREP(ENGINE0_MASK, GUC_INTR_GUC2HOST)  :
 		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg,
+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg,
 			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
 	if (xe_gt_is_media_type(gt))
-		xe_mmio_rmw32(gt, GEN11_GUC_SG_INTR_MASK.reg, events, 0);
+		xe_mmio_rmw32(gt, GUC_SG_INTR_MASK.reg, events, 0);
 	else
-		xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg, ~events);
+		xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg, ~events);
 }
 
 int xe_guc_enable_communication(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ed9d311b9b7e..bfc78b5bf8ad 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -80,7 +80,7 @@ static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
 
 static u32 gen11_intr_disable(struct xe_gt *gt)
 {
-	xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, 0);
+	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, 0);
 
 	/*
 	 * Now with master disabled, get a sample of level indications
@@ -88,7 +88,7 @@ static u32 gen11_intr_disable(struct xe_gt *gt)
 	 * New indications can and will light up during processing,
 	 * and will generate new interrupt after enabling master.
 	 */
-	return xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
+	return xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
 }
 
 static u32
@@ -96,7 +96,7 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 {
 	u32 iir;
 
-	if (!(master_ctl & GEN11_GU_MISC_IRQ))
+	if (!(master_ctl & GU_MISC_IRQ))
 		return 0;
 
 	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET).reg);
@@ -108,9 +108,9 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 
 static inline void gen11_intr_enable(struct xe_gt *gt, bool stall)
 {
-	xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, GEN11_MASTER_IRQ);
+	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, MASTER_IRQ);
 	if (stall)
-		xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
+		xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
 }
 
 static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
@@ -133,14 +133,14 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 	smask = irqs << 16;
 
 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
-	xe_mmio_write32(gt, GEN11_RENDER_COPY_INTR_ENABLE.reg, dmask);
-	xe_mmio_write32(gt, GEN11_VCS_VECS_INTR_ENABLE.reg, dmask);
+	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE.reg, dmask);
+	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE.reg, dmask);
 	if (ccs_mask)
-		xe_mmio_write32(gt, GEN12_CCS_RSVD_INTR_ENABLE.reg, smask);
+		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE.reg, smask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
-	xe_mmio_write32(gt, GEN11_RCS0_RSVD_INTR_MASK.reg, ~smask);
-	xe_mmio_write32(gt, GEN11_BCS_RSVD_INTR_MASK.reg, ~smask);
+	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK.reg, ~smask);
+	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK.reg, ~smask);
 	if (bcs_mask & (BIT(1)|BIT(2)))
 		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK.reg, ~dmask);
 	if (bcs_mask & (BIT(3)|BIT(4)))
@@ -149,31 +149,31 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK.reg, ~dmask);
 	if (bcs_mask & (BIT(7)|BIT(8)))
 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~dmask);
-	xe_mmio_write32(gt, GEN11_VCS0_VCS1_INTR_MASK.reg, ~dmask);
-	xe_mmio_write32(gt, GEN11_VCS2_VCS3_INTR_MASK.reg, ~dmask);
+	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg, ~dmask);
+	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg, ~dmask);
 	//if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
-	//	intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK, ~dmask);
+	//	intel_uncore_write(uncore, VCS4_VCS5_INTR_MASK, ~dmask);
 	//if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
-	//	intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK, ~dmask);
-	xe_mmio_write32(gt, GEN11_VECS0_VECS1_INTR_MASK.reg, ~dmask);
+	//	intel_uncore_write(uncore, VCS6_VCS7_INTR_MASK, ~dmask);
+	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg, ~dmask);
 	//if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
-	//	intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~dmask);
+	//	intel_uncore_write(uncore, VECS2_VECS3_INTR_MASK, ~dmask);
 	if (ccs_mask & (BIT(0)|BIT(1)))
-		xe_mmio_write32(gt, GEN12_CCS0_CCS1_INTR_MASK.reg, ~dmask);
+		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~dmask);
 	if (ccs_mask & (BIT(2)|BIT(3)))
-		xe_mmio_write32(gt,  GEN12_CCS2_CCS3_INTR_MASK.reg, ~dmask);
+		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK.reg, ~dmask);
 
 	/*
 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
 	 * is enabled/disabled.
 	 */
 	/* TODO: gt->pm_ier, gt->pm_imr */
-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
 
 	/* Same thing for GuC interrupts */
-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg, 0);
-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg,  ~0);
+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg, 0);
+	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,  ~0);
 }
 
 static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
@@ -182,7 +182,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -198,7 +198,7 @@ gen11_gt_engine_identity(struct xe_device *xe,
 
 	lockdep_assert_held(&xe->irq.lock);
 
-	xe_mmio_write32(gt, GEN11_IIR_REG_SELECTOR(bank).reg, BIT(bit));
+	xe_mmio_write32(gt, IIR_REG_SELECTOR(bank).reg, BIT(bit));
 
 	/*
 	 * NB: Specs do not specify how long to spin wait,
@@ -206,18 +206,17 @@ gen11_gt_engine_identity(struct xe_device *xe,
 	 */
 	timeout_ts = (local_clock() >> 10) + 100;
 	do {
-		ident = xe_mmio_read32(gt, GEN11_INTR_IDENTITY_REG(bank).reg);
-	} while (!(ident & GEN11_INTR_DATA_VALID) &&
+		ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank).reg);
+	} while (!(ident & INTR_DATA_VALID) &&
 		 !time_after32(local_clock() >> 10, timeout_ts));
 
-	if (unlikely(!(ident & GEN11_INTR_DATA_VALID))) {
+	if (unlikely(!(ident & INTR_DATA_VALID))) {
 		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
 			bank, bit, ident);
 		return 0;
 	}
 
-	xe_mmio_write32(gt, GEN11_INTR_IDENTITY_REG(bank).reg,
-			GEN11_INTR_DATA_VALID);
+	xe_mmio_write32(gt, INTR_IDENTITY_REG(bank).reg, INTR_DATA_VALID);
 
 	return ident;
 }
@@ -251,24 +250,24 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 	spin_lock(&xe->irq.lock);
 
 	for (bank = 0; bank < 2; bank++) {
-		if (!(master_ctl & GEN11_GT_DW_IRQ(bank)))
+		if (!(master_ctl & GT_DW_IRQ(bank)))
 			continue;
 
 		if (!xe_gt_is_media_type(gt)) {
 			intr_dw[bank] =
-				xe_mmio_read32(gt, GEN11_GT_INTR_DW(bank).reg);
+				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
 			for_each_set_bit(bit, intr_dw + bank, 32)
 				identity[bit] = gen11_gt_engine_identity(xe, gt,
 									 bank,
 									 bit);
-			xe_mmio_write32(gt, GEN11_GT_INTR_DW(bank).reg,
+			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
 					intr_dw[bank]);
 		}
 
 		for_each_set_bit(bit, intr_dw + bank, 32) {
-			class = GEN11_INTR_ENGINE_CLASS(identity[bit]);
-			instance = GEN11_INTR_ENGINE_INSTANCE(identity[bit]);
-			intr_vec = GEN11_INTR_ENGINE_INTR(identity[bit]);
+			class = INTR_ENGINE_CLASS(identity[bit]);
+			instance = INTR_ENGINE_INSTANCE(identity[bit]);
+			intr_vec = INTR_ENGINE_INTR(identity[bit]);
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
 				gen11_gt_other_irq_handler(gt, instance,
@@ -345,7 +344,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -373,7 +372,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 			continue;
 
 		if (!xe_gt_is_media_type(gt))
-			master_ctl = xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
+			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
 
 		/*
 		 * We might be in irq handler just when PCIe DPC is initiated
@@ -387,7 +386,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		}
 
 		if (!xe_gt_is_media_type(gt))
-			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
+			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
 		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 	}
 
@@ -408,14 +407,14 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
 	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
 
 	/* Disable RCS, BCS, VCS and VECS class engines. */
-	xe_mmio_write32(gt, GEN11_RENDER_COPY_INTR_ENABLE.reg,	 0);
-	xe_mmio_write32(gt, GEN11_VCS_VECS_INTR_ENABLE.reg,	 0);
+	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE.reg,	 0);
+	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE.reg,	 0);
 	if (ccs_mask)
-		xe_mmio_write32(gt, GEN12_CCS_RSVD_INTR_ENABLE.reg, 0);
+		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE.reg, 0);
 
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
-	xe_mmio_write32(gt, GEN11_RCS0_RSVD_INTR_MASK.reg,	~0);
-	xe_mmio_write32(gt, GEN11_BCS_RSVD_INTR_MASK.reg,	~0);
+	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK.reg,	~0);
+	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK.reg,	~0);
 	if (bcs_mask & (BIT(1)|BIT(2)))
 		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK.reg, ~0);
 	if (bcs_mask & (BIT(3)|BIT(4)))
@@ -424,24 +423,24 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
 		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK.reg, ~0);
 	if (bcs_mask & (BIT(7)|BIT(8)))
 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~0);
-	xe_mmio_write32(gt, GEN11_VCS0_VCS1_INTR_MASK.reg,	~0);
-	xe_mmio_write32(gt, GEN11_VCS2_VCS3_INTR_MASK.reg,	~0);
+	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg,	~0);
+	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg,	~0);
 //	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
-//		xe_mmio_write32(xe, GEN12_VCS4_VCS5_INTR_MASK.reg,   ~0);
+//		xe_mmio_write32(xe, VCS4_VCS5_INTR_MASK.reg,   ~0);
 //	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
-//		xe_mmio_write32(xe, GEN12_VCS6_VCS7_INTR_MASK.reg,   ~0);
-	xe_mmio_write32(gt, GEN11_VECS0_VECS1_INTR_MASK.reg,	~0);
+//		xe_mmio_write32(xe, VCS6_VCS7_INTR_MASK.reg,   ~0);
+	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg,	~0);
 //	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
-//		xe_mmio_write32(xe, GEN12_VECS2_VECS3_INTR_MASK.reg, ~0);
+//		xe_mmio_write32(xe, VECS2_VECS3_INTR_MASK.reg, ~0);
 	if (ccs_mask & (BIT(0)|BIT(1)))
-		xe_mmio_write32(gt, GEN12_CCS0_CCS1_INTR_MASK.reg, ~0);
+		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~0);
 	if (ccs_mask & (BIT(2)|BIT(3)))
-		xe_mmio_write32(gt,  GEN12_CCS2_CCS3_INTR_MASK.reg, ~0);
+		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK.reg, ~0);
 
-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg,	 0);
-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg,		~0);
+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg,	 0);
+	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,		~0);
 }
 
 static void gen11_irq_reset(struct xe_gt *gt)
-- 
2.39.2

