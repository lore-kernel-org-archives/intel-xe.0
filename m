Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7025FC761A6
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7F10EF73;
	Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3717A10EF78
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=90JJ0E/aUbL6zyf/gU8SUaplmacgVdKGb7HmZh850ZY=;
 b=LqH4+94Uj7E0bf4O0GoUHe/UHue6wcvIt1tD+iMhqzkxv4+WEy+l8bNn
 5S7D1d/SWFG0IntGN8XsjvbyxODc40OILsOa6gYKOsJ1LMvtD3wCGR8/Z
 BaY/h1gB9Mvh/b03qnh0yDj1cAg1mYtdiqiPtnaayHEG5WKZQ40QPay1Q
 n1oXnesLQgMnF2TN62tEGXROSWeFyGPn5mAw+eI38nCknii5P4OLYVz2y
 jigFYuHQK5h+fU93bApZrvD8DJGT2aSur+W+gV1xZ38aBCWUSZ40E2ZOc
 cvNi5hWmgQtjM6RFsUVAou8vBe6OcbEX0O9xGp3YEebnSSNnN6eFm7FoR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641483"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021796"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021796"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:24:00 -0700
Message-Id: <20230330182405.43993-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/8] drm/xe/irq: Drop IRQ_INIT and IRQ_RESET
 macros
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

It's no longer necessary to wrap these operations in macros; a simple
function will suffice.  Also switch to function names that more clearly
describe what operation is being performed:  unmask_and_enable() and
mask_and_disable().

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 63 +++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 74d7d999a383..bf097ba6a10b 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -35,39 +35,40 @@ static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 	xe_mmio_read32(gt, reg.reg);
 }
 
-static void irq_init(struct xe_gt *gt,
-		     i915_reg_t imr, u32 imr_val,
-		     i915_reg_t ier, u32 ier_val,
-		     i915_reg_t iir)
+/*
+ * Unmask and enable the specified interrupts.  Does not check current state,
+ * so any bits not specified here will become masked and disabled.
+ */
+static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
 {
-	assert_iir_is_zero(gt, iir);
+	/*
+	 * If we're just enabling an interrupt now, it shouldn't already
+	 * be raised in the IIR.
+	 */
+	assert_iir_is_zero(gt, IIR(irqregs));
+
+	xe_mmio_write32(gt, IER(irqregs).reg, bits);
+	xe_mmio_write32(gt, IMR(irqregs).reg, ~bits);
 
-	xe_mmio_write32(gt, ier.reg, ier_val);
-	xe_mmio_write32(gt, imr.reg, imr_val);
-	xe_mmio_read32(gt, imr.reg);
+	/* Posting read */
+	xe_mmio_read32(gt, IMR(irqregs).reg);
 }
-#define IRQ_INIT(gt, type, imr_val, ier_val) \
-	irq_init((gt), \
-		 IMR(type), imr_val, \
-		 IER(type), ier_val, \
-		 IIR(type))
-
-static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
-			   i915_reg_t ier)
+
+/* Mask and disable all interrupts. */
+static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
 {
-	xe_mmio_write32(gt, imr.reg, 0xffffffff);
-	xe_mmio_read32(gt, imr.reg);
+	xe_mmio_write32(gt, IMR(irqregs).reg, ~0);
+	/* Posting read */
+	xe_mmio_read32(gt, IMR(irqregs).reg);
 
-	xe_mmio_write32(gt, ier.reg, 0);
+	xe_mmio_write32(gt, IER(irqregs).reg, 0);
 
 	/* IIR can theoretically queue up two events. Be paranoid. */
-	xe_mmio_write32(gt, iir.reg, 0xffffffff);
-	xe_mmio_read32(gt, iir.reg);
-	xe_mmio_write32(gt, iir.reg, 0xffffffff);
-	xe_mmio_read32(gt, iir.reg);
+	xe_mmio_write32(gt, IIR(irqregs).reg, ~0);
+	xe_mmio_read32(gt, IIR(irqregs).reg);
+	xe_mmio_write32(gt, IIR(irqregs).reg, ~0);
+	xe_mmio_read32(gt, IIR(irqregs).reg);
 }
-#define IRQ_RESET(gt, type) \
-	irq_reset((gt), IMR(type), IIR(type), IER(type))
 
 static u32 gen11_intr_disable(struct xe_gt *gt)
 {
@@ -173,7 +174,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GEN11_GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -336,7 +337,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GEN11_GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -441,8 +442,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
-	IRQ_RESET(gt, PCU_IRQ_REGS);
+	mask_and_disable(gt, GU_MISC_IRQ_REGS);
+	mask_and_disable(gt, PCU_IRQ_REGS);
 }
 
 static void dg1_irq_reset(struct xe_gt *gt)
@@ -452,8 +453,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
-	IRQ_RESET(gt, PCU_IRQ_REGS);
+	mask_and_disable(gt, GU_MISC_IRQ_REGS);
+	mask_and_disable(gt, PCU_IRQ_REGS);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
-- 
2.39.2

