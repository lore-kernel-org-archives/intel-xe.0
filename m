Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F55EC77B60
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B819310EF7D;
	Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5910EF73
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZGNIL7trCNY40AHiA8laLqPs4lHUZ0vg7db0xJ7+hA=;
 b=AgCWLQ1zv3YN/WQkUqcP+zRl3ddg3KMyPf1Dasc7k2Dr9kvu26gb1dcl
 jg9QhPnwuft1XbfYS35xNTpQTRMIRo65yMjlpKTV+mHvFncPIGQVLFfoP
 Y8jCOFDy5yBskoVH47LypijAS49/iOrbu7edLmEuG3NwdRKZktl2zodXt
 wdQTuR0ZBk7sKoGDhPfLmif3g6/DYJpc/ffdEb3qw+fFAdlxjcURfDhJA
 5IFnawzCpeRYePE9s3K9o5w/ERXrp0CkZEmPewLxRGT0VHF9g4XvJPUGY
 AbsqVdsbsLV/gDPDcRyS/7FNeAAffqEqcwQcju8t+lnn0T64YqdupLWSX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641480"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021788"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021788"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:23:59 -0700
Message-Id: <20230330182405.43993-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/8] drm/xe/irq: Add helpers to find
 ISR/IIR/IMR/IER registers
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

For cases where IRQ_INIT and IRQ_RESET are used, the relevant interrupt
registers are always consecutive and ordered ISR, IMR, IIR, IER.  Adding
helpers to look these up from a base offset will let us eliminate some
of the CPP pasting and simplify other upcoming patches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h |  8 ++++++++
 drivers/gpu/drm/xe/regs/xe_regs.h     | 11 ++---------
 drivers/gpu/drm/xe/xe_irq.c           | 24 ++++++++++++------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index b5c25e31b889..7ff3aa9322af 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -8,4 +8,12 @@
 
 #include "compat-i915-headers/i915_reg_defs.h"
 
+/*
+ * Interrupt registers for a unit are always consecutive and ordered
+ * ISR, IMR, IIR, IER.
+ */
+#define IMR(offset)				_MMIO(offset + 0x4)
+#define IIR(offset)				_MMIO(offset + 0x8)
+#define IER(offset)				_MMIO(offset + 0xc)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index c1c829c23df1..ffe5d726e196 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -76,15 +76,8 @@
 
 #define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
 
-#define GEN8_PCU_ISR				_MMIO(0x444e0)
-#define GEN8_PCU_IMR				_MMIO(0x444e4)
-#define GEN8_PCU_IIR				_MMIO(0x444e8)
-#define GEN8_PCU_IER				_MMIO(0x444ec)
-
-#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
-#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
-#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
-#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
+#define PCU_IRQ_REGS				0x444e0
+#define GU_MISC_IRQ_REGS			0x444f0
 #define   GEN11_GU_MISC_GSE			(1 << 27)
 
 #define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d8fde8caff1e..74d7d999a383 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -48,9 +48,9 @@ static void irq_init(struct xe_gt *gt,
 }
 #define IRQ_INIT(gt, type, imr_val, ier_val) \
 	irq_init((gt), \
-		 type##IMR, imr_val, \
-		 type##IER, ier_val, \
-		 type##IIR)
+		 IMR(type), imr_val, \
+		 IER(type), ier_val, \
+		 IIR(type))
 
 static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
 			   i915_reg_t ier)
@@ -67,7 +67,7 @@ static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
 	xe_mmio_read32(gt, iir.reg);
 }
 #define IRQ_RESET(gt, type) \
-	irq_reset((gt), type##IMR, type##IIR, type##IER)
+	irq_reset((gt), IMR(type), IIR(type), IER(type))
 
 static u32 gen11_intr_disable(struct xe_gt *gt)
 {
@@ -90,9 +90,9 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 	if (!(master_ctl & GEN11_GU_MISC_IRQ))
 		return 0;
 
-	iir = xe_mmio_read32(gt, GEN11_GU_MISC_IIR.reg);
+	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_REGS).reg);
 	if (likely(iir))
-		xe_mmio_write32(gt, GEN11_GU_MISC_IIR.reg, iir);
+		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_REGS).reg, iir);
 
 	return iir;
 }
@@ -173,7 +173,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -336,7 +336,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -441,8 +441,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GEN11_GU_MISC_);
-	IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
+	IRQ_RESET(gt, PCU_IRQ_REGS);
 }
 
 static void dg1_irq_reset(struct xe_gt *gt)
@@ -452,8 +452,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GEN11_GU_MISC_);
-	IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
+	IRQ_RESET(gt, PCU_IRQ_REGS);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
-- 
2.39.2

