Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11128C77B6E
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9261A10F35D;
	Sat,  1 Apr 2023 00:21:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343A310F35C
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308472; x=1711844472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4QnxqJtuISNBYJx4IrvNhtvUlnJTlctKETOlJZs0w6M=;
 b=gxRWVovOm+imh++LMRWq5jpkASugHnZO6oFzYZ+vdcOKnd91ukngUD9d
 NavR8xbkuugXwt3MQR+UM5G/3h2mA/HDw39qlooMa0028IqQ3on91v2nq
 ubc9tVktHdEvAsY7B5ON0c7kPJF1nz7qUVAv/nclb96BZVC7rLLfn5hRI
 sSDe4Mo7DS+UTpSnKY3E+d3sM87JIebCwX9xBdYQyOQyvWQ/LjTtNq6dA
 MB7P56fUNaml1V/uixqyscvblD4rylD2t/HbsPHl/EvSyg8YqtkZztYuC
 zC8MCvhUOlUIMUQsj0VRbrH1egN51KaSkqw2lK2yJoXSIU4hFbQF1StEt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624211"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624211"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520543"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520543"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:03 -0700
Message-Id: <20230401002106.588656-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/8] drm/xe/irq: Rename and clarify top-level
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 46 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index bfc78b5bf8ad..232047719328 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -78,7 +78,7 @@ static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
 	xe_mmio_read32(gt, IIR(irqregs).reg);
 }
 
-static u32 gen11_intr_disable(struct xe_gt *gt)
+static u32 xelp_intr_disable(struct xe_gt *gt)
 {
 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, 0);
 
@@ -106,7 +106,7 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 	return iir;
 }
 
-static inline void gen11_intr_enable(struct xe_gt *gt, bool stall)
+static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
 {
 	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, MASTER_IRQ);
 	if (stall)
@@ -176,7 +176,7 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,  ~0);
 }
 
-static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	/* TODO: PCH */
 
@@ -184,7 +184,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 
-	gen11_intr_enable(gt, true);
+	xelp_intr_enable(gt, true);
 }
 
 static u32
@@ -286,7 +286,11 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
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
@@ -294,9 +298,9 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	long unsigned int intr_dw[2];
 	u32 identity[32];
 
-	master_ctl = gen11_intr_disable(gt);
+	master_ctl = xelp_intr_disable(gt);
 	if (!master_ctl) {
-		gen11_intr_enable(gt, false);
+		xelp_intr_enable(gt, false);
 		return IRQ_NONE;
 	}
 
@@ -306,7 +310,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 
 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
 
-	gen11_intr_enable(gt, false);
+	xelp_intr_enable(gt, false);
 
 	xe_display_irq_enable(xe, gu_misc_iir);
 
@@ -350,6 +354,11 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
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
@@ -443,9 +452,9 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
 	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,		~0);
 }
 
-static void gen11_irq_reset(struct xe_gt *gt)
+static void xelp_irq_reset(struct xe_gt *gt)
 {
-	gen11_intr_disable(gt);
+	xelp_intr_disable(gt);
 
 	gen11_gt_irq_reset(gt);
 
@@ -470,13 +479,10 @@ static void xe_irq_reset(struct xe_device *xe)
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
@@ -488,10 +494,8 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 
 	if (GRAPHICS_VERx100(xe) >= 1210)
 		dg1_irq_postinstall(xe, gt);
-	else if (GRAPHICS_VER(xe) >= 11)
-		gen11_irq_postinstall(xe, gt);
 	else
-		drm_err(&xe->drm, "No interrupt postinstall hook");
+		xelp_irq_postinstall(xe, gt);
 
 	xe_display_irq_postinstall(xe, gt);
 }
@@ -509,10 +513,8 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
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

