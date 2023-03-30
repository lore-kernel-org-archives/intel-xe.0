Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3573C77B70
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C380010EF82;
	Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD210EF78
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Elz8Exg0QKh/0npreRyDF7pwmghv97dkwkub+9X33c=;
 b=TFxjWrqJW7/WOMZRuOj78+9v8PyjSARaablU6A38jsbRaZTkkp8hTne8
 glM2CS6OK4Vj7MthPmumY7MFJ6FacjGH0wGjhF0uA/DytONqojddLCaMi
 JxKZtN4zUmSIbU30dc6RRUEJ1JvBDCLZJuLxe9ilylfBASqhQxvClJ5ps
 kWByZeY25TkfpDZ2maPNPIj3PTfuLh2MgMU+uIPy9ZaiOZpVQgE4Q7fDv
 F7KQRIMoMbpJe74TVE+f24iAvS1kDkjrHbHraAengQTz7QFJZbiv/LBef
 H2zzCZcPELa8edlD0mseM3JHPj2DCHPNlTE10RwgIXLc3OQgrlfj7Lhd8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641487"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641487"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021811"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021811"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:24:02 -0700
Message-Id: <20230330182405.43993-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/8] drm/xe/irq: Rename and clarify top-level
 interrupt handling routines
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

Platforms supported by the Xe driver handle top-level interrupts in one
of two ways:
 - Xe_LP platforms only have a "graphics master" register and lack a
   "master tile" register, so top-level interrupt detection and
   enable/disable happens in the graphics master.
 - Xe_LP+ (aka DG1) and beyond have a "master tile" interrupt register
   that controls the enable/disable of top-level interrupts and must
   also be consulted to determine which tiles have received interrupts
   before the driver moves on the process the graphics master register.

For functions that are only relevant to the first set of platforms,
rename the function prefix to Xe_LP since "gen11" doesn't make sense in
the Xe driver.  Also add some comments briefly describing the two
top-level handlers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 46 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b1b94ba43b3f..de0c27c0a09c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -70,7 +70,7 @@ static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
 	xe_mmio_read32(gt, IIR(irqregs).reg);
 }
 
-static u32 gen11_intr_disable(struct xe_gt *gt)
+static u32 xelp_intr_disable(struct xe_gt *gt)
 {
 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, 0);
 
@@ -98,7 +98,7 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 	return iir;
 }
 
-static inline void gen11_intr_enable(struct xe_gt *gt, bool stall)
+static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
 {
 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, MASTER_IRQ);
 	if (stall)
@@ -168,7 +168,7 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,  ~0);
 }
 
-static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	/* TODO: PCH */
 
@@ -176,7 +176,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
 
-	gen11_intr_enable(gt, true);
+	xelp_intr_enable(gt, true);
 }
 
 static u32
@@ -278,7 +278,11 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 	spin_unlock(&xe->irq.lock);
 }
 
-static irqreturn_t gen11_irq_handler(int irq, void *arg)
+/*
+ * Top-level interrupt handler for Xe_LP platforms (which did not have
+ * a "master tile" interrupt register.
+ */
+static irqreturn_t xelp_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);	/* Only 1 GT here */
@@ -286,9 +290,9 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	long unsigned int intr_dw[2];
 	u32 identity[32];
 
-	master_ctl = gen11_intr_disable(gt);
+	master_ctl = xelp_intr_disable(gt);
 	if (!master_ctl) {
-		gen11_intr_enable(gt, false);
+		xelp_intr_enable(gt, false);
 		return IRQ_NONE;
 	}
 
@@ -298,7 +302,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 
 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
 
-	gen11_intr_enable(gt, false);
+	xelp_intr_enable(gt, false);
 
 	xe_display_irq_enable(xe, gu_misc_iir);
 
@@ -342,6 +346,11 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		dg1_intr_enable(xe, true);
 }
 
+/*
+ * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
+ * a "master tile" interrupt register which must be consulted before the
+ * "graphics master" interrupt register.
+ */
 static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
@@ -435,9 +444,9 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,		~0);
 }
 
-static void gen11_irq_reset(struct xe_gt *gt)
+static void xelp_irq_reset(struct xe_gt *gt)
 {
-	gen11_intr_disable(gt);
+	xelp_intr_disable(gt);
 
 	gen11_gt_irq_reset(gt);
 
@@ -462,13 +471,10 @@ static void xe_irq_reset(struct xe_device *xe)
 	u8 id;
 
 	for_each_gt(gt, xe, id) {
-		if (GRAPHICS_VERx100(xe) >= 1210) {
+		if (GRAPHICS_VERx100(xe) >= 1210)
 			dg1_irq_reset(gt);
-		} else if (GRAPHICS_VER(xe) >= 11) {
-			gen11_irq_reset(gt);
-		} else {
-			drm_err(&xe->drm, "No interrupt reset hook");
-		}
+		else
+			xelp_irq_reset(gt);
 	}
 
 	xe_display_irq_reset(xe);
@@ -480,10 +486,8 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 
 	if (GRAPHICS_VERx100(xe) >= 1210)
 		dg1_irq_postinstall(xe, gt);
-	else if (GRAPHICS_VER(xe) >= 11)
-		gen11_irq_postinstall(xe, gt);
 	else
-		drm_err(&xe->drm, "No interrupt postinstall hook");
+		xelp_irq_postinstall(xe, gt);
 
 	xe_display_irq_postinstall(xe, gt);
 }
@@ -501,10 +505,8 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 {
 	if (GRAPHICS_VERx100(xe) >= 1210) {
 		return dg1_irq_handler;
-	} else if (GRAPHICS_VER(xe) >= 11) {
-		return gen11_irq_handler;
 	} else {
-		return NULL;
+		return xelp_irq_handler;
 	}
 }
 
-- 
2.39.2

