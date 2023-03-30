Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA09CC6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07B410EF79;
	Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177B10EF73
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200673; x=1711736673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMaIMi4uRF+00W3oMjfAMH7bEOlSFxPqPfi8eY61Zug=;
 b=lVwjzY8zIwriOzmqD6wLfWznt0LWJ+o1qTOEznKTjWbGb4irhXphGUiO
 TIQn5bCQnhS6lAJ2BJPV8Mz41QWqTPJcVKIu3ySkU9IhQHH1Kxx2Xnz2/
 KLM86oZ5ZMaC+KB58MX8jN5012+mjDoGbnvvOpTZkPWzWsd9MS1VEa2wi
 FHAT4/aOxOjl/CNOJTkM8bgZz10BEe1JiQURVK7T414wHTxPd+gVSfsTT
 /oflDDzZoZ7bDP/gVGxK/vjw6FWQjA1W/f2oYl4tXghKZC2Jh4A5srFQ9
 nVymPhyG34xMAdh1j/6UCVscpIy7Zd9RYUdGKpCknsStjGOhVIc9u3P7m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641477"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021779"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021779"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:23:58 -0700
Message-Id: <20230330182405.43993-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/8] drm/xe/irq: Drop gen3_ prefixes
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

"Gen" terminology should be avoided in the Xe driver and "gen3" refers
to platforms that are 9 (!!) graphics generations earlier than the
oldest supported by the Xe driver, so this prefix really doesn't make
sense.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 42 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 529b42d9c9af..d8fde8caff1e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -19,7 +19,7 @@
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 
-static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
+static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 {
 	u32 val = xe_mmio_read32(gt, reg.reg);
 
@@ -35,24 +35,24 @@ static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 	xe_mmio_read32(gt, reg.reg);
 }
 
-static void gen3_irq_init(struct xe_gt *gt,
-			  i915_reg_t imr, u32 imr_val,
-			  i915_reg_t ier, u32 ier_val,
-			  i915_reg_t iir)
+static void irq_init(struct xe_gt *gt,
+		     i915_reg_t imr, u32 imr_val,
+		     i915_reg_t ier, u32 ier_val,
+		     i915_reg_t iir)
 {
-	gen3_assert_iir_is_zero(gt, iir);
+	assert_iir_is_zero(gt, iir);
 
 	xe_mmio_write32(gt, ier.reg, ier_val);
 	xe_mmio_write32(gt, imr.reg, imr_val);
 	xe_mmio_read32(gt, imr.reg);
 }
-#define GEN3_IRQ_INIT(gt, type, imr_val, ier_val) \
-	gen3_irq_init((gt), \
-		      type##IMR, imr_val, \
-		      type##IER, ier_val, \
-		      type##IIR)
+#define IRQ_INIT(gt, type, imr_val, ier_val) \
+	irq_init((gt), \
+		 type##IMR, imr_val, \
+		 type##IER, ier_val, \
+		 type##IIR)
 
-static void gen3_irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
+static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
 			   i915_reg_t ier)
 {
 	xe_mmio_write32(gt, imr.reg, 0xffffffff);
@@ -66,8 +66,8 @@ static void gen3_irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
 	xe_mmio_write32(gt, iir.reg, 0xffffffff);
 	xe_mmio_read32(gt, iir.reg);
 }
-#define GEN3_IRQ_RESET(gt, type) \
-	gen3_irq_reset((gt), type##IMR, type##IIR, type##IER)
+#define IRQ_RESET(gt, type) \
+	irq_reset((gt), type##IMR, type##IIR, type##IER)
 
 static u32 gen11_intr_disable(struct xe_gt *gt)
 {
@@ -173,8 +173,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 
 	gen11_gt_irq_postinstall(xe, gt);
 
-	GEN3_IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE,
-		      GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	gen11_intr_enable(gt, true);
 }
@@ -337,8 +336,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	gen11_gt_irq_postinstall(xe, gt);
 
-	GEN3_IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE,
-		      GEN11_GU_MISC_GSE);
+	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
 
 	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
@@ -443,8 +441,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	GEN3_IRQ_RESET(gt, GEN11_GU_MISC_);
-	GEN3_IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GEN11_GU_MISC_);
+	IRQ_RESET(gt, GEN8_PCU_);
 }
 
 static void dg1_irq_reset(struct xe_gt *gt)
@@ -454,8 +452,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
 
 	gen11_gt_irq_reset(gt);
 
-	GEN3_IRQ_RESET(gt, GEN11_GU_MISC_);
-	GEN3_IRQ_RESET(gt, GEN8_PCU_);
+	IRQ_RESET(gt, GEN11_GU_MISC_);
+	IRQ_RESET(gt, GEN8_PCU_);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
-- 
2.39.2

