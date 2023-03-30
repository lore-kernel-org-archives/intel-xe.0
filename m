Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747A0C77B6E
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D5A10EF80;
	Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03210EF79
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200674; x=1711736674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amQ0pXOqQ+bNYj9soGIhE4KnblkhPUCj0i+L8nbcQTM=;
 b=BGHEQO82unNTKLGylrxyQGVLXCl3h3LetONTHxZQo8fKX2AKaPO6uJhB
 lqKHIQcMhO8MG73WnoXfc4eM1uZNLEnK4rOowgZ40KjTX4+xF5wDwvhoo
 LM8fXFRFv2+wKUSvTzPGGbVTOREbDSm1wgI0QTUcfNxMlrYAUU3Zj5KPY
 jUGhmqlaq3cWYLrkobkUX/G2k5uMLMxEbeWhB8Eh3F8Zbc7GxAK+uaqoY
 rmP0B9CCVMQzt53USt3asrKA9/rDSuXVJJo09z7LJbRgNml09u9KNAzs0
 uxbfbuF8EAhB+kumh/HAsAT4kV8NABUBKjxelxI/dOMTgLxxsq0SZGBuy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641489"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021821"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021821"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:24:03 -0700
Message-Id: <20230330182405.43993-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/8] drm/xe/irq: Drop remaining "gen11_" prefix
 from IRQ functions
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

The remaining "gen11_*" IRQ functions are common to all platforms
supported by the Xe driver.  Drop the unnecessary prefix.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 46 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index de0c27c0a09c..9fac03b63e7e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -84,7 +84,7 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
 }
 
 static u32
-gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
+gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
 {
 	u32 iir;
 
@@ -105,7 +105,7 @@ static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
 		xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
 }
 
-static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	u32 irqs, dmask, smask;
 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
@@ -172,7 +172,7 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	/* TODO: PCH */
 
-	gen11_gt_irq_postinstall(xe, gt);
+	gt_irq_postinstall(xe, gt);
 
 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
 
@@ -180,10 +180,10 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
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
@@ -216,7 +216,7 @@ gen11_gt_engine_identity(struct xe_device *xe,
 #define   OTHER_MEDIA_GUC_INSTANCE           16
 
 static void
-gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
+gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 {
 	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
@@ -230,9 +230,9 @@ gen11_gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
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
@@ -249,9 +249,8 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
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
@@ -262,8 +261,7 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
-				gen11_gt_other_irq_handler(gt, instance,
-							   intr_vec);
+				gt_other_irq_handler(gt, instance, intr_vec);
 				continue;
 			}
 
@@ -296,11 +294,11 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 		return IRQ_NONE;
 	}
 
-	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 
 	xe_display_irq_handler(xe, master_ctl);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
 
 	xelp_intr_enable(gt, false);
 
@@ -338,7 +336,7 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 
 static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
-	gen11_gt_irq_postinstall(xe, gt);
+	gt_irq_postinstall(xe, gt);
 
 	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
 
@@ -388,12 +386,12 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 		if (!xe_gt_is_media_type(gt))
 			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
-		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 	}
 
 	xe_display_irq_handler(xe, master_ctl);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
 
 	dg1_intr_enable(xe, false);
 
@@ -402,7 +400,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void gen11_gt_irq_reset(struct xe_gt *gt)
+static void gt_irq_reset(struct xe_gt *gt)
 {
 	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
 	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
@@ -448,7 +446,7 @@ static void xelp_irq_reset(struct xe_gt *gt)
 {
 	xelp_intr_disable(gt);
 
-	gen11_gt_irq_reset(gt);
+	gt_irq_reset(gt);
 
 	mask_and_disable(gt, GU_MISC_IRQ_REGS);
 	mask_and_disable(gt, PCU_IRQ_REGS);
@@ -459,7 +457,7 @@ static void dg1_irq_reset(struct xe_gt *gt)
 	if (gt->info.id == 0)
 		dg1_intr_disable(gt_to_xe(gt));
 
-	gen11_gt_irq_reset(gt);
+	gt_irq_reset(gt);
 
 	mask_and_disable(gt, GU_MISC_IRQ_REGS);
 	mask_and_disable(gt, PCU_IRQ_REGS);
-- 
2.39.2

