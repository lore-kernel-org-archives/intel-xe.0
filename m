Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AAEC76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E9D10F363;
	Sat,  1 Apr 2023 00:21:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0FB10E337
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308471; x=1711844471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/WAinm1FzkqA44mf7kiCpEwP19Gybdu95t50mBLgH4=;
 b=Xjm2OVITK2Y1zMwlv6qjJ6kFbwgTC6dfcQeAwWzvo+ddPyk0zPRxFveG
 gBKdjOCIPne2ybTW9gaM/A6WtSAqMcvr0TcaPcm3gh/EQ6664hfThomcV
 7LZg4EMI7IcaEd5FSHK7j//fLAWjQWT/Vx6cGwk53Jg7zYpc0xGoMGpag
 FtE2y/J92xwWVAHl3SkizF8fm3z/oH0ziKQAWpZ9fWrQF4/d7yuRoQDRC
 Amz2PKQg/RCoiskNChau/ztL7N5mvNkJJtPdMicdtc5YSZ+Lz8/oqdKLN
 UJn2+B3csanGh1fj/WtDF5MG7Mostx1YXW2oYbQlw2eQcAEIayrL+/5ws Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624209"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624209"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520535"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520535"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:01 -0700
Message-Id: <20230401002106.588656-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/8] drm/xe/irq: Drop IRQ_INIT and IRQ_RESET
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
index f3f43d41a1b5..ed9d311b9b7e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -43,39 +43,40 @@ static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
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
@@ -181,7 +182,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GU_MISC_IRQ_OFFSET, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GEN11_GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -344,7 +345,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GU_MISC_IRQ_OFFSET, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GEN11_GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -449,8 +450,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GU_MISC_IRQ_OFFSET);
-	IRQ_RESET(gt, PCU_IRQ_OFFSET);
+	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
+	mask_and_disable(gt, PCU_IRQ_OFFSET);
 }
 
 static void dg1_irq_reset(struct xe_gt *gt)
@@ -460,8 +461,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GU_MISC_IRQ_OFFSET);
-	IRQ_RESET(gt, PCU_IRQ_OFFSET);
+	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
+	mask_and_disable(gt, PCU_IRQ_OFFSET);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
-- 
2.39.2

