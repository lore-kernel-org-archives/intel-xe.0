Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD2C77B61
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119510E337;
	Sat,  1 Apr 2023 00:21:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7673010F35D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308471; x=1711844471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AxdRMd9csCnP+W7UCk9jWWyJlBZYuD/MxhxwQQWBsiw=;
 b=LAVg/2/LeTzwiBMwU4CnUb+OAa3nVbTWngYExalcE9iLMDgiEWZWx9me
 dOYFEq1fzFDYCbBtyCt5WLjBCKjG36kaekQQJjWcvdOJUEPnX96JUHJrF
 f6plaSkgJT+XStzKJ6zX0TlNyqx0s08dsJ3X7KPzOidIPe4Ef0/u2g9Vd
 wU7zm1J9QRIaK4D9GQxjSNADYpaWVQ5Eko6NOZ15ppQjbdgjqTQz8RwEw
 MEC16Xw05wjQiROrSxpSR0F1z/Vm5u9MXgT6OKizdmQHgD4Pkyfcy3PCZ
 i8tn4dMQOh0atkVFvvrhVO+gQ/xS16Aci9mIKT6c3A6VdBLFunWro9A69 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624207"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624207"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520531"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520531"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:00 -0700
Message-Id: <20230401002106.588656-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/8] drm/xe/irq: Add helpers to find
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For cases where IRQ_INIT and IRQ_RESET are used, the relevant interrupt
registers are always consecutive and ordered ISR, IMR, IIR, IER.  Adding
helpers to look these up from a base offset will let us eliminate some
of the CPP pasting and simplify other upcoming patches.

v2:
 - s/_REGS/_OFFSET/ for consistency.  (Lucas)
 - Move IMR/IIR/IER helpers into xe_irq.c; they aren't needed anywhere
   else.  (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 11 ++---------
 drivers/gpu/drm/xe/xe_irq.c       | 32 +++++++++++++++++++------------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index c1c829c23df1..be19b270c983 100644
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
+#define PCU_IRQ_OFFSET				0x444e0
+#define GU_MISC_IRQ_OFFSET			0x444f0
 #define   GEN11_GU_MISC_GSE			(1 << 27)
 
 #define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d8fde8caff1e..f3f43d41a1b5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -19,6 +19,14 @@
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 
+/*
+ * Interrupt registers for a unit are always consecutive and ordered
+ * ISR, IMR, IIR, IER.
+ */
+#define IMR(offset)				_MMIO(offset + 0x4)
+#define IIR(offset)				_MMIO(offset + 0x8)
+#define IER(offset)				_MMIO(offset + 0xc)
+
 static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 {
 	u32 val = xe_mmio_read32(gt, reg.reg);
@@ -48,9 +56,9 @@ static void irq_init(struct xe_gt *gt,
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
@@ -67,7 +75,7 @@ static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
 	xe_mmio_read32(gt, iir.reg);
 }
 #define IRQ_RESET(gt, type) \
-	irq_reset((gt), type##IMR, type##IIR, type##IER)
+	irq_reset((gt), IMR(type), IIR(type), IER(type))
 
 static u32 gen11_intr_disable(struct xe_gt *gt)
 {
@@ -90,9 +98,9 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 	if (!(master_ctl & GEN11_GU_MISC_IRQ))
 		return 0;
 
-	iir = xe_mmio_read32(gt, GEN11_GU_MISC_IIR.reg);
+	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET).reg);
 	if (likely(iir))
-		xe_mmio_write32(gt, GEN11_GU_MISC_IIR.reg, iir);
+		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET).reg, iir);
 
 	return iir;
 }
@@ -173,7 +181,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GU_MISC_IRQ_OFFSET, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -336,7 +344,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GU_MISC_IRQ_OFFSET, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -441,8 +449,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GEN11_GU_MISC_);
-	IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GU_MISC_IRQ_OFFSET);
+	IRQ_RESET(gt, PCU_IRQ_OFFSET);
 }
 
 static void dg1_irq_reset(struct xe_gt *gt)
@@ -452,8 +460,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	IRQ_RESET(gt, GEN11_GU_MISC_);
-	IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GU_MISC_IRQ_OFFSET);
+	IRQ_RESET(gt, PCU_IRQ_OFFSET);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
-- 
2.39.2

