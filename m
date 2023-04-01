Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42419C76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA310F35C;
	Sat,  1 Apr 2023 00:21:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3566210F35D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308472; x=1711844472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6I6sRLj+nWJKne1S8JpRzqxSBfIFRUsgfOkoKunHkig=;
 b=AHmgpmeo5VAfViAyDyCKSDa2CzCq7L+yauRfC9cW0ffivPZek+D+4+Xj
 8a90rQRC0d+S/WNWUkXj8DkK0cyWJYQPHtJXZeOuLEpSdToF08zxB93JS
 1a8eaZESTwC9XUGCbywHTybFu4Wh3e+VGOYrkiS4vC8tWGOfYUK4jtSty
 5ng+dFbIkw8dW/p/zt8g6Vh/yrAqt9vJ+EG+UdCDgr+qoORrgn+xl2sQI
 T96uQU+V6NEyUMGuhizE1zRuXzsB0MleQEq6lh8iHATNjfLuvlViDYGkg
 4vskYbcKi/R9UXgZdEz7BpAKDX8ecLNG9PLiSiC94EKz3UeDKf09vvAAp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624213"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624213"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520547"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520547"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:21:04 -0700
Message-Id: <20230401002106.588656-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401002106.588656-1-matthew.d.roper@intel.com>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/8] drm/xe/irq: Drop remaining "gen11_"
 prefix from IRQ functions
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

The remaining "gen11_*" IRQ functions are common to all platforms
supported by the Xe driver.  Drop the unnecessary prefix.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 46 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 232047719328..d8f5985b1868 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -92,7 +92,7 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
 }
 
 static u32
-gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
+gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 {
 	u32 iir;
 
@@ -113,7 +113,7 @@ static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
 		xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
 }
 
-static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	u32 irqs, dmask, smask;
 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
@@ -180,7 +180,7 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	/* TODO: PCH */
 
-	gen11_gt_irq_postinstall(xe, gt);
+	gt_irq_postinstall(xe, gt);
 
 	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 
@@ -188,10 +188,10 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 }
 
 static u32
-gen11_gt_engine_identity(struct xe_device *xe,
-			 struct xe_gt *gt,
-			 const unsigned int bank,
-			 const unsigned int bit)
+gt_engine_identity(struct xe_device *xe,
+		   struct xe_gt *gt,
+		   const unsigned int bank,
+		   const unsigned int bit)
 {
 	u32 timeout_ts;
 	u32 ident;
@@ -224,7 +224,7 @@ gen11_gt_engine_identity(struct xe_device *xe,
 #define   OTHER_MEDIA_GUC_INSTANCE           16
 
 static void
-gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
+gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 {
 	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
@@ -238,9 +238,9 @@ gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 	}
 }
 
-static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
-				 u32 master_ctl, long unsigned int *intr_dw,
-				 u32 *identity)
+static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
+			   u32 master_ctl, long unsigned int *intr_dw,
+			   u32 *identity)
 {
 	unsigned int bank, bit;
 	u16 instance, intr_vec;
@@ -257,9 +257,8 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 			intr_dw[bank] =
 				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
 			for_each_set_bit(bit, intr_dw + bank, 32)
-				identity[bit] = gen11_gt_engine_identity(xe, gt,
-									 bank,
-									 bit);
+				identity[bit] = gt_engine_identity(xe, gt,
+								   bank, bit);
 			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
 					intr_dw[bank]);
 		}
@@ -270,8 +269,7 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
-				gen11_gt_other_irq_handler(gt, instance,
-							   intr_vec);
+				gt_other_irq_handler(gt, instance, intr_vec);
 				continue;
 			}
 
@@ -304,11 +302,11 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 		return IRQ_NONE;
 	}
 
-	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 
 	xe_display_irq_handler(xe, master_ctl);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
 
 	xelp_intr_enable(gt, false);
 
@@ -346,7 +344,7 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 
 static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
-	gen11_gt_irq_postinstall(xe, gt);
+	gt_irq_postinstall(xe, gt);
 
 	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
 
@@ -396,12 +394,12 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 		if (!xe_gt_is_media_type(gt))
 			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
-		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 	}
 
 	xe_display_irq_handler(xe, master_ctl);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
 
 	dg1_intr_enable(xe, false);
 
@@ -410,7 +408,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void gen11_gt_irq_reset(struct xe_gt *gt)
+static void gt_irq_reset(struct xe_gt *gt)
 {
 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
 	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
@@ -456,7 +454,7 @@ static void xelp_irq_reset(struct xe_gt *gt)
 {
 	xelp_intr_disable(gt);
 
-	gen11_gt_irq_reset(gt);
+	gt_irq_reset(gt);
 
 	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
 	mask_and_disable(gt, PCU_IRQ_OFFSET);
@@ -467,7 +465,7 @@ static void dg1_irq_reset(struct xe_gt *gt)
 	if (gt->info.id == 0)
 		dg1_intr_disable(gt_to_xe(gt));
 
-	gen11_gt_irq_reset(gt);
+	gt_irq_reset(gt);
 
 	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
 	mask_and_disable(gt, PCU_IRQ_OFFSET);
-- 
2.39.2

