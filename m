Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F035C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8710E0CB;
	Wed,  3 May 2023 13:10:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D8710E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119428; x=1714655428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XzaQl2HFDOmaO9fZ1IXhk4eWy2vWyAYqjmSicPg4wYM=;
 b=LcmiKu4K+uAup3WI4PUJlD5epVhIrqZgOUpD1gL01spH3lc9FBWxe4qQ
 C9+F/RHBFVUvJayelPii9kAVMylWtT5ZjLOYyjyiukLpGrTFdQriuTSkg
 xSY0Wr3fQAMXGeiHjUxPXtEfrEp7qMIfcYWIbDAvqkInhUzEPL4F6FTZR
 lG398qe6vv/svkrDZtUO7SVptlRozG7I/OhZR1znAVYNJOXre4xjKfN0D
 x+I74jyU/LVDjU+qxIzl5zRnxORCjOLDRutPmx29muc9v1Wi3Kxi744Ax
 go3dZj8bF2iq8dQwMljVJ4BTJnFkKH1eWjeS4ZTzusp6b3nZ6O/UqyBT1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434960691"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="434960691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820762265"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="820762265"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:50 +0300
Message-Id: <20230503131005.1602412-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/18] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove the dummy wrappers and use the uncore glue layer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 134 +++++++++++-----------
 1 file changed, 64 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 8a97c3f45620..744b00647ca6 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -35,7 +35,6 @@
 #include <drm/drm_drv.h>
 
 #include "icl_dsi_regs.h"
-#include "intel_de.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_fifo_underrun.h"
@@ -44,13 +43,8 @@
 #include "intel_psr.h"
 
 #include "i915_drv.h"
-#include "intel_de.h"
-
-#define intel_uncore_read(uncore, reg) intel_de_read(dev_priv, (reg))
-#define intel_uncore_read64(uncore, reg) intel_de_read64(dev_priv, (reg))
-#define intel_uncore_write(uncore, reg, value) intel_de_write(dev_priv, reg, value)
-#define intel_uncore_rmw(uncore, reg, clear, set) intel_de_rmw(dev_priv, reg, clear, set)
-#define intel_uncore_posting_read intel_uncore_read
+#include "i915_reg.h"
+#include "intel_uncore.h"
 
 static u32 raw_reg_read(void __iomem *base, i915_reg_t reg)
 {
@@ -68,16 +62,16 @@ static void raw_reg_write(void __iomem *base, i915_reg_t reg, u32 value)
 static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
 		    i915_reg_t iir, i915_reg_t ier)
 {
-	intel_uncore_write(dev_priv, imr, 0xffffffff);
-	intel_uncore_posting_read(dev_priv, imr);
+	intel_uncore_write(&dev_priv->uncore, imr, 0xffffffff);
+	intel_uncore_posting_read(&dev_priv->uncore, imr);
 
-	intel_uncore_write(dev_priv, ier, 0);
+	intel_uncore_write(&dev_priv->uncore, ier, 0);
 
 	/* IIR can theoretically queue up two events. Be paranoid. */
-	intel_uncore_write(dev_priv, iir, 0xffffffff);
-	intel_uncore_posting_read(dev_priv, iir);
-	intel_uncore_write(dev_priv, iir, 0xffffffff);
-	intel_uncore_posting_read(dev_priv, iir);
+	intel_uncore_write(&dev_priv->uncore, iir, 0xffffffff);
+	intel_uncore_posting_read(&dev_priv->uncore, iir);
+	intel_uncore_write(&dev_priv->uncore, iir, 0xffffffff);
+	intel_uncore_posting_read(&dev_priv->uncore, iir);
 }
 
 /*
@@ -85,7 +79,7 @@ static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
  */
 static void gen3_assert_iir_is_zero(struct xe_device *dev_priv, i915_reg_t reg)
 {
-	u32 val = intel_uncore_read(dev_priv, reg);
+	u32 val = intel_uncore_read(&dev_priv->uncore, reg);
 
 	if (val == 0)
 		return;
@@ -93,10 +87,10 @@ static void gen3_assert_iir_is_zero(struct xe_device *dev_priv, i915_reg_t reg)
 	drm_WARN(&dev_priv->drm, 1,
 		 "Interrupt register 0x%x is not zero: 0x%08x\n",
 		 reg.reg, val);
-	intel_uncore_write(dev_priv, reg, 0xffffffff);
-	intel_uncore_posting_read(dev_priv, reg);
-	intel_uncore_write(dev_priv, reg, 0xffffffff);
-	intel_uncore_posting_read(dev_priv, reg);
+	intel_uncore_write(&dev_priv->uncore, reg, 0xffffffff);
+	intel_uncore_posting_read(&dev_priv->uncore, reg);
+	intel_uncore_write(&dev_priv->uncore, reg, 0xffffffff);
+	intel_uncore_posting_read(&dev_priv->uncore, reg);
 }
 
 static void gen3_irq_init(struct xe_device *dev_priv,
@@ -106,9 +100,9 @@ static void gen3_irq_init(struct xe_device *dev_priv,
 {
 	gen3_assert_iir_is_zero(dev_priv, iir);
 
-	intel_uncore_write(xe, ier, ier_val);
-	intel_uncore_write(xe, imr, imr_val);
-	intel_uncore_posting_read(xe, imr);
+	intel_uncore_write(&dev_priv->uncore, ier, ier_val);
+	intel_uncore_write(&dev_priv->uncore, imr, imr_val);
+	intel_uncore_posting_read(&dev_priv->uncore, imr);
 }
 
 #define GEN8_IRQ_RESET_NDX(uncore, type, which) \
@@ -223,10 +217,10 @@ i915_hotplug_interrupt_update_locked(struct drm_i915_private *dev_priv,
 	lockdep_assert_held(&dev_priv->irq_lock);
 	drm_WARN_ON(&dev_priv->drm, bits & ~mask);
 
-	val = intel_uncore_read(dev_priv, PORT_HOTPLUG_EN);
+	val = intel_uncore_read(&dev_priv->uncore, PORT_HOTPLUG_EN);
 	val &= ~mask;
 	val |= bits;
-	intel_uncore_write(dev_priv, PORT_HOTPLUG_EN, val);
+	intel_uncore_write(&dev_priv->uncore, PORT_HOTPLUG_EN, val);
 }
 
 /**
@@ -276,8 +270,8 @@ static void bdw_update_pipe_irq(struct drm_i915_private *dev_priv,
 
 	if (new_val != dev_priv->de_irq_mask[pipe]) {
 		dev_priv->de_irq_mask[pipe] = new_val;
-		intel_uncore_write(dev_priv, GEN8_DE_PIPE_IMR(pipe), dev_priv->de_irq_mask[pipe]);
-		intel_uncore_posting_read(dev_priv, GEN8_DE_PIPE_IMR(pipe));
+		intel_uncore_write(&dev_priv->uncore, GEN8_DE_PIPE_IMR(pipe), dev_priv->de_irq_mask[pipe]);
+		intel_uncore_posting_read(&dev_priv->uncore, GEN8_DE_PIPE_IMR(pipe));
 	}
 }
 
@@ -538,7 +532,7 @@ static void hsw_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 				     enum pipe pipe)
 {
 	display_pipe_crc_irq_handler(dev_priv, pipe,
-				     intel_uncore_read(dev_priv, PIPE_CRC_RES_1_IVB(pipe)),
+				     intel_uncore_read(&dev_priv->uncore, PIPE_CRC_RES_1_IVB(pipe)),
 				     0, 0, 0, 0);
 }
 
@@ -551,8 +545,8 @@ static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 	if (ddi_hotplug_trigger) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_uncore_read(dev_priv, SHOTPLUG_CTL_DDI);
-		intel_uncore_write(dev_priv, SHOTPLUG_CTL_DDI, dig_hotplug_reg);
+		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, SHOTPLUG_CTL_DDI);
+		intel_uncore_write(&dev_priv->uncore, SHOTPLUG_CTL_DDI, dig_hotplug_reg);
 
 		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
 				   ddi_hotplug_trigger, dig_hotplug_reg,
@@ -563,8 +557,8 @@ static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 	if (tc_hotplug_trigger) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_uncore_read(dev_priv, SHOTPLUG_CTL_TC);
-		intel_uncore_write(dev_priv, SHOTPLUG_CTL_TC, dig_hotplug_reg);
+		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, SHOTPLUG_CTL_TC);
+		intel_uncore_write(&dev_priv->uncore, SHOTPLUG_CTL_TC, dig_hotplug_reg);
 
 		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
 				   tc_hotplug_trigger, dig_hotplug_reg,
@@ -588,8 +582,8 @@ static void gen11_hpd_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 	if (trigger_tc) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_uncore_read(dev_priv, GEN11_TC_HOTPLUG_CTL);
-		intel_uncore_write(dev_priv, GEN11_TC_HOTPLUG_CTL, dig_hotplug_reg);
+		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL);
+		intel_uncore_write(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL, dig_hotplug_reg);
 
 		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
 				   trigger_tc, dig_hotplug_reg,
@@ -600,8 +594,8 @@ static void gen11_hpd_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 	if (trigger_tbt) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_uncore_read(dev_priv, GEN11_TBT_HOTPLUG_CTL);
-		intel_uncore_write(dev_priv, GEN11_TBT_HOTPLUG_CTL, dig_hotplug_reg);
+		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL);
+		intel_uncore_write(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL, dig_hotplug_reg);
 
 		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
 				   trigger_tbt, dig_hotplug_reg,
@@ -691,8 +685,8 @@ gen8_de_misc_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 			else
 				iir_reg = EDP_PSR_IIR;
 
-			psr_iir = intel_uncore_read(dev_priv, iir_reg);
-			intel_uncore_write(dev_priv, iir_reg, psr_iir);
+			psr_iir = intel_uncore_read(&dev_priv->uncore, iir_reg);
+			intel_uncore_write(&dev_priv->uncore, iir_reg, psr_iir);
 
 			if (psr_iir)
 				found = true;
@@ -721,7 +715,7 @@ static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
 	 * Incase of dual link, TE comes from DSI_1
 	 * this is to check if dual link is enabled
 	 */
-	val = intel_uncore_read(dev_priv, TRANS_DDI_FUNC_CTL2(TRANSCODER_DSI_0));
+	val = intel_uncore_read(&dev_priv->uncore, TRANS_DDI_FUNC_CTL2(TRANSCODER_DSI_0));
 	val &= PORT_SYNC_MODE_ENABLE;
 
 	/*
@@ -733,7 +727,7 @@ static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
 	dsi_trans = (port == PORT_A) ? TRANSCODER_DSI_0 : TRANSCODER_DSI_1;
 
 	/* Check if DSI configured in command mode */
-	val = intel_uncore_read(dev_priv, DSI_TRANS_FUNC_CONF(dsi_trans));
+	val = intel_uncore_read(&dev_priv->uncore, DSI_TRANS_FUNC_CONF(dsi_trans));
 	val = val & OP_MODE_MASK;
 
 	if (val != CMD_MODE_NO_GATE && val != CMD_MODE_TE_GATE) {
@@ -742,7 +736,7 @@ static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
 	}
 
 	/* Get PIPE for handling VBLANK event */
-	val = intel_uncore_read(dev_priv, TRANS_DDI_FUNC_CTL(dsi_trans));
+	val = intel_uncore_read(&dev_priv->uncore, TRANS_DDI_FUNC_CTL(dsi_trans));
 	switch (val & TRANS_DDI_EDP_INPUT_MASK) {
 	case TRANS_DDI_EDP_INPUT_A_ON:
 		pipe = PIPE_A;
@@ -762,8 +756,8 @@ static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
 
 	/* clear TE in dsi IIR */
 	port = (te_trigger & DSI1_TE) ? PORT_B : PORT_A;
-	tmp = intel_uncore_read(dev_priv, DSI_INTR_IDENT_REG(port));
-	intel_uncore_write(dev_priv, DSI_INTR_IDENT_REG(port), tmp);
+	tmp = intel_uncore_read(&dev_priv->uncore, DSI_INTR_IDENT_REG(port));
+	intel_uncore_write(&dev_priv->uncore, DSI_INTR_IDENT_REG(port), tmp);
 }
 
 static u32 gen8_de_pipe_flip_done_mask(struct drm_i915_private *i915)
@@ -795,9 +789,9 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 	drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_DISPLAY(dev_priv));
 
 	if (master_ctl & GEN8_DE_MISC_IRQ) {
-		iir = intel_uncore_read(dev_priv, GEN8_DE_MISC_IIR);
+		iir = intel_uncore_read(&dev_priv->uncore, GEN8_DE_MISC_IIR);
 		if (iir) {
-			intel_uncore_write(dev_priv, GEN8_DE_MISC_IIR, iir);
+			intel_uncore_write(&dev_priv->uncore, GEN8_DE_MISC_IIR, iir);
 			ret = IRQ_HANDLED;
 			gen8_de_misc_irq_handler(dev_priv, iir);
 		} else {
@@ -807,9 +801,9 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 	}
 
 	if (DISPLAY_VER(dev_priv) >= 11 && (master_ctl & GEN11_DE_HPD_IRQ)) {
-		iir = intel_uncore_read(dev_priv, GEN11_DE_HPD_IIR);
+		iir = intel_uncore_read(&dev_priv->uncore, GEN11_DE_HPD_IIR);
 		if (iir) {
-			intel_uncore_write(dev_priv, GEN11_DE_HPD_IIR, iir);
+			intel_uncore_write(&dev_priv->uncore, GEN11_DE_HPD_IIR, iir);
 			ret = IRQ_HANDLED;
 			gen11_hpd_irq_handler(dev_priv, iir);
 		} else {
@@ -819,11 +813,11 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 	}
 
 	if (master_ctl & GEN8_DE_PORT_IRQ) {
-		iir = intel_uncore_read(dev_priv, GEN8_DE_PORT_IIR);
+		iir = intel_uncore_read(&dev_priv->uncore, GEN8_DE_PORT_IIR);
 		if (iir) {
 			bool found = false;
 
-			intel_uncore_write(dev_priv, GEN8_DE_PORT_IIR, iir);
+			intel_uncore_write(&dev_priv->uncore, GEN8_DE_PORT_IIR, iir);
 			ret = IRQ_HANDLED;
 
 			if (iir & gen8_de_port_aux_mask(dev_priv)) {
@@ -855,7 +849,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		if (!(master_ctl & GEN8_DE_PIPE_IRQ(pipe)))
 			continue;
 
-		iir = intel_uncore_read(dev_priv, GEN8_DE_PIPE_IIR(pipe));
+		iir = intel_uncore_read(&dev_priv->uncore, GEN8_DE_PIPE_IIR(pipe));
 		if (!iir) {
 			drm_err(&dev_priv->drm,
 				"The master control interrupt lied (DE PIPE)!\n");
@@ -863,7 +857,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		}
 
 		ret = IRQ_HANDLED;
-		intel_uncore_write(dev_priv, GEN8_DE_PIPE_IIR(pipe), iir);
+		intel_uncore_write(&dev_priv->uncore, GEN8_DE_PIPE_IIR(pipe), iir);
 
 		if (iir & GEN8_PIPE_VBLANK)
 			intel_handle_vblank(dev_priv, pipe);
@@ -892,9 +886,9 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		 * scheme also closed the SDE interrupt handling race we've seen
 		 * on older pch-split platforms. But this needs testing.
 		 */
-		iir = intel_uncore_read(dev_priv, SDEIIR);
+		iir = intel_uncore_read(&dev_priv->uncore, SDEIIR);
 		if (iir) {
-			intel_uncore_write(dev_priv, SDEIIR, iir);
+			intel_uncore_write(&dev_priv->uncore, SDEIIR, iir);
 			ret = IRQ_HANDLED;
 
 			if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
@@ -944,16 +938,16 @@ static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 	else
 		port = PORT_A;
 
-	tmp =  intel_uncore_read(dev_priv, DSI_INTR_MASK_REG(port));
+	tmp =  intel_uncore_read(&dev_priv->uncore, DSI_INTR_MASK_REG(port));
 	if (enable)
 		tmp &= ~DSI_TE_EVENT;
 	else
 		tmp |= DSI_TE_EVENT;
 
-	intel_uncore_write(dev_priv, DSI_INTR_MASK_REG(port), tmp);
+	intel_uncore_write(&dev_priv->uncore, DSI_INTR_MASK_REG(port), tmp);
 
-	tmp = intel_uncore_read(dev_priv, DSI_INTR_IDENT_REG(port));
-	intel_uncore_write(dev_priv, DSI_INTR_IDENT_REG(port), tmp);
+	tmp = intel_uncore_read(&dev_priv->uncore, DSI_INTR_IDENT_REG(port));
+	intel_uncore_write(&dev_priv->uncore, DSI_INTR_IDENT_REG(port), tmp);
 
 	return true;
 }
@@ -1006,11 +1000,11 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	intel_uncore_write(dev_priv, GEN11_DISPLAY_INT_CTL, 0);
+	intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL, 0);
 
 	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-		intel_uncore_write(dev_priv, TRANS_PSR_IMR(trans), 0xffffffff);
-		intel_uncore_write(dev_priv, TRANS_PSR_IIR(trans), 0xffffffff);
+		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IMR(trans), 0xffffffff);
+		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
 	}
 
 	for_each_pipe(dev_priv, pipe)
@@ -1162,12 +1156,12 @@ static void dg1_hpd_irq_setup(struct drm_i915_private *dev_priv)
 {
 	u32 val;
 
-	val = intel_uncore_read(dev_priv, SOUTH_CHICKEN1);
+	val = intel_uncore_read(&dev_priv->uncore, SOUTH_CHICKEN1);
 	val |= (INVERT_DDIA_HPD |
 		INVERT_DDIB_HPD |
 		INVERT_DDIC_HPD |
 		INVERT_DDID_HPD);
-	intel_uncore_write(dev_priv, SOUTH_CHICKEN1, val);
+	intel_uncore_write(&dev_priv->uncore, SOUTH_CHICKEN1, val);
 
 	icp_hpd_irq_setup(dev_priv);
 }
@@ -1176,7 +1170,7 @@ static void gen11_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
 {
 	u32 hotplug;
 
-	hotplug = intel_uncore_read(dev_priv, GEN11_TC_HOTPLUG_CTL);
+	hotplug = intel_uncore_read(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL);
 	hotplug &= ~(GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC1) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC2) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC3) |
@@ -1184,14 +1178,14 @@ static void gen11_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC5) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC6));
 	hotplug |= intel_hpd_hotplug_enables(dev_priv, gen11_hotplug_enables);
-	intel_uncore_write(dev_priv, GEN11_TC_HOTPLUG_CTL, hotplug);
+	intel_uncore_write(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL, hotplug);
 }
 
 static void gen11_tbt_hpd_detection_setup(struct drm_i915_private *dev_priv)
 {
 	u32 hotplug;
 
-	hotplug = intel_uncore_read(dev_priv, GEN11_TBT_HOTPLUG_CTL);
+	hotplug = intel_uncore_read(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL);
 	hotplug &= ~(GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC1) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC2) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC3) |
@@ -1199,7 +1193,7 @@ static void gen11_tbt_hpd_detection_setup(struct drm_i915_private *dev_priv)
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC5) |
 		     GEN11_HOTPLUG_CTL_ENABLE(HPD_PORT_TC6));
 	hotplug |= intel_hpd_hotplug_enables(dev_priv, gen11_hotplug_enables);
-	intel_uncore_write(dev_priv, GEN11_TBT_HOTPLUG_CTL, hotplug);
+	intel_uncore_write(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL, hotplug);
 }
 
 static void gen11_hpd_irq_setup(struct drm_i915_private *dev_priv)
@@ -1210,11 +1204,11 @@ static void gen11_hpd_irq_setup(struct drm_i915_private *dev_priv)
 	enabled_irqs = intel_hpd_enabled_irqs(dev_priv, dev_priv->display.hotplug.hpd);
 	hotplug_irqs = intel_hpd_hotplug_irqs(dev_priv, dev_priv->display.hotplug.hpd);
 
-	val = intel_uncore_read(dev_priv, GEN11_DE_HPD_IMR);
+	val = intel_uncore_read(&dev_priv->uncore, GEN11_DE_HPD_IMR);
 	val &= ~hotplug_irqs;
 	val |= ~enabled_irqs & hotplug_irqs;
-	intel_uncore_write(dev_priv, GEN11_DE_HPD_IMR, val);
-	intel_uncore_posting_read(dev_priv, GEN11_DE_HPD_IMR);
+	intel_uncore_write(&dev_priv->uncore, GEN11_DE_HPD_IMR, val);
+	intel_uncore_posting_read(&dev_priv->uncore, GEN11_DE_HPD_IMR);
 
 	gen11_tc_hpd_detection_setup(dev_priv);
 	gen11_tbt_hpd_detection_setup(dev_priv);
@@ -1301,7 +1295,7 @@ static void gen11_de_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	gen8_de_irq_postinstall(dev_priv);
 
-	intel_uncore_write(dev_priv, GEN11_DISPLAY_INT_CTL,
+	intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL,
 			   GEN11_DISPLAY_IRQ_ENABLE);
 }
 
-- 
2.39.2

