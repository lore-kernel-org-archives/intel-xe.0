Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0D7C7EE25
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 13:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230B10E206;
	Tue, 16 May 2023 13:33:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD3810E1F0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684243979; x=1715779979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHIxIxxRKyI+RRBlgEHUPVzRS0Z5WCJhScvqwxe6R5Q=;
 b=N7XvoZLwO2+MfXaQSRnwfoUkAc5knWle4CxbJVPlhieu6y83rskWo+dc
 svCBISlA4WGNElJ7E4CthdLC1nM0HPEfzlw0MwkwqW2XeeEKTPq1SEpsl
 5Z5SYWVOLqu/KK+lDAXL5C1Cqv6Z6+rbwm+3z9Wol+/6PiNOaYIfINzl7
 XDMaRNPjmtnBqyZwdiKvLKO5uYUlBg2PxGglXGqcs4gJkArAWNJOYm9Vy
 J+Syy0nWBhVvoa3+t8A0ZUQw9koFcaszgtF1BPWzz78pyy85/xEAGZ/P6
 mFG1jNYUIKhe9wcgkCr0ieHBF8dhi1m0Wz/VHR63Hu5c9DPi5txtfKsLW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="336023307"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="336023307"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 06:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031282135"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="1031282135"
Received: from khach-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.69])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 06:32:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:32:34 +0300
Message-Id: <20230516133234.2778034-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516133234.2778034-1-jani.nikula@intel.com>
References: <20230516133234.2778034-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use hotplug irq code from i915 display/intel_hotplug_irq.c instead of
copy-paste.

For now, need to add ilk_update_display_irq() and bdw_update_port_irq()
to xe display/ext/i915_irq.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 579 ++----------------
 drivers/gpu/drm/xe/display/ext/i915_irq.h     |  11 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
 5 files changed, 58 insertions(+), 540 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b6c41cd7dbe3..5418281b4f89 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -178,6 +178,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdmi.o \
 	i915-display/intel_hotplug.o \
+	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \
 	i915-display/intel_lspcon.o \
 	i915-display/intel_modeset_setup.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ddc0ad39b154..74e6f063f741 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -101,6 +101,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define HAS_DSC(xe) ((xe)->info.display.has_dsc)
 #define HAS_CUR_FBC(xe) (xe || 1)
 #define HAS_DOUBLE_BUFFERED_M_N(xe) ((xe) || 1)
+#define I915_HAS_HOTPLUG(xe) (true)
 #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
 					      IS_ALDERLAKE_S(dev_priv))
 #define DISPLAY_VER(xe) ((xe)->info.display.ver)
diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index afde97b6faa6..a0f22bd52549 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -34,17 +34,18 @@
 
 #include <drm/drm_drv.h>
 
+#include "i915_drv.h"
+#include "i915_reg.h"
 #include "icl_dsi_regs.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
+#include "intel_dp_aux.h"
 #include "intel_fifo_underrun.h"
 #include "intel_hotplug.h"
+#include "intel_hotplug_irq.h"
 #include "intel_lpe_audio.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
-
-#include "i915_drv.h"
-#include "i915_reg.h"
 #include "intel_uncore.h"
 
 static u32 raw_reg_read(void __iomem *base, i915_reg_t reg)
@@ -149,55 +150,6 @@ static inline void pmu_irq_stats(struct drm_i915_private *i915,
 {
 }
 
-typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
-typedef u32 (*hotplug_enables_func)(struct intel_encoder *encoder);
-typedef u32 (*hotplug_mask_func)(enum hpd_pin pin);
-
-static const u32 hpd_gen11[HPD_NUM_PINS] = {
-	[HPD_PORT_TC1] = GEN11_TC_HOTPLUG(HPD_PORT_TC1) | GEN11_TBT_HOTPLUG(HPD_PORT_TC1),
-	[HPD_PORT_TC2] = GEN11_TC_HOTPLUG(HPD_PORT_TC2) | GEN11_TBT_HOTPLUG(HPD_PORT_TC2),
-	[HPD_PORT_TC3] = GEN11_TC_HOTPLUG(HPD_PORT_TC3) | GEN11_TBT_HOTPLUG(HPD_PORT_TC3),
-	[HPD_PORT_TC4] = GEN11_TC_HOTPLUG(HPD_PORT_TC4) | GEN11_TBT_HOTPLUG(HPD_PORT_TC4),
-	[HPD_PORT_TC5] = GEN11_TC_HOTPLUG(HPD_PORT_TC5) | GEN11_TBT_HOTPLUG(HPD_PORT_TC5),
-	[HPD_PORT_TC6] = GEN11_TC_HOTPLUG(HPD_PORT_TC6) | GEN11_TBT_HOTPLUG(HPD_PORT_TC6),
-};
-
-static const u32 hpd_icp[HPD_NUM_PINS] = {
-	[HPD_PORT_A] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_A),
-	[HPD_PORT_B] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_B),
-	[HPD_PORT_C] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_C),
-	[HPD_PORT_TC1] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC1),
-	[HPD_PORT_TC2] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC2),
-	[HPD_PORT_TC3] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC3),
-	[HPD_PORT_TC4] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC4),
-	[HPD_PORT_TC5] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC5),
-	[HPD_PORT_TC6] = SDE_TC_HOTPLUG_ICP(HPD_PORT_TC6),
-};
-
-static const u32 hpd_sde_dg1[HPD_NUM_PINS] = {
-	[HPD_PORT_A] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_A),
-	[HPD_PORT_B] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_B),
-	[HPD_PORT_C] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_C),
-	[HPD_PORT_D] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_D),
-	[HPD_PORT_TC1] = SDE_TC_HOTPLUG_DG2(HPD_PORT_TC1),
-};
-
-static void intel_hpd_init_pins(struct drm_i915_private *dev_priv)
-{
-	struct intel_hotplug *hpd = &dev_priv->display.hotplug;
-
-	hpd->hpd = hpd_gen11;
-
-	if ((INTEL_PCH_TYPE(dev_priv) < PCH_DG1) &&
-	    (!HAS_PCH_SPLIT(dev_priv) || HAS_PCH_NOP(dev_priv)))
-		return;
-
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
-		hpd->pch_hpd = hpd_sde_dg1;
-	else
-		hpd->pch_hpd = hpd_icp;
-}
-
 static void
 intel_handle_vblank(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
@@ -206,42 +158,49 @@ intel_handle_vblank(struct drm_i915_private *dev_priv, enum pipe pipe)
 	drm_crtc_handle_vblank(&crtc->base);
 }
 
-/* For display hotplug interrupt */
-static inline void
-i915_hotplug_interrupt_update_locked(struct drm_i915_private *dev_priv,
-				     u32 mask,
-				     u32 bits)
+void ilk_update_display_irq(struct drm_i915_private *dev_priv,
+			    u32 interrupt_mask, u32 enabled_irq_mask)
 {
-	u32 val;
+	u32 new_val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	drm_WARN_ON(&dev_priv->drm, bits & ~mask);
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
+
+	new_val = dev_priv->irq_mask;
+	new_val &= ~interrupt_mask;
+	new_val |= (~enabled_irq_mask & interrupt_mask);
 
-	val = intel_uncore_read(&dev_priv->uncore, PORT_HOTPLUG_EN);
-	val &= ~mask;
-	val |= bits;
-	intel_uncore_write(&dev_priv->uncore, PORT_HOTPLUG_EN, val);
+	if (new_val != dev_priv->irq_mask &&
+	    !drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv))) {
+		dev_priv->irq_mask = new_val;
+		intel_uncore_write(&dev_priv->uncore, DEIMR, dev_priv->irq_mask);
+		intel_uncore_posting_read(&dev_priv->uncore, DEIMR);
+	}
 }
 
-/**
- * i915_hotplug_interrupt_update - update hotplug interrupt enable
- * @dev_priv: driver private
- * @mask: bits to update
- * @bits: bits to enable
- * NOTE: the HPD enable bits are modified both inside and outside
- * of an interrupt context. To avoid that read-modify-write cycles
- * interfer, these bits are protected by a spinlock. Since this
- * function is usually not called from a context where the lock is
- * held already, this function acquires the lock itself. A non-locking
- * version is also available.
- */
-void i915_hotplug_interrupt_update(struct drm_i915_private *dev_priv,
-				   u32 mask,
-				   u32 bits)
+void bdw_update_port_irq(struct drm_i915_private *dev_priv,
+			 u32 interrupt_mask, u32 enabled_irq_mask)
 {
-	spin_lock_irq(&dev_priv->irq_lock);
-	i915_hotplug_interrupt_update_locked(dev_priv, mask, bits);
-	spin_unlock_irq(&dev_priv->irq_lock);
+	u32 new_val;
+	u32 old_val;
+
+	lockdep_assert_held(&dev_priv->irq_lock);
+
+	drm_WARN_ON(&dev_priv->drm, enabled_irq_mask & ~interrupt_mask);
+
+	if (drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv)))
+		return;
+
+	old_val = intel_uncore_read(&dev_priv->uncore, GEN8_DE_PORT_IMR);
+
+	new_val = old_val;
+	new_val &= ~interrupt_mask;
+	new_val |= (~enabled_irq_mask & interrupt_mask);
+
+	if (new_val != old_val) {
+		intel_uncore_write(&dev_priv->uncore, GEN8_DE_PORT_IMR, new_val);
+		intel_uncore_posting_read(&dev_priv->uncore, GEN8_DE_PORT_IMR);
+	}
 }
 
 /**
@@ -287,11 +246,12 @@ void bdw_disable_pipe_irq(struct drm_i915_private *i915,
 	bdw_update_pipe_irq(i915, pipe, bits, 0);
 }
 
-static void ibx_display_interrupt_update(struct drm_i915_private *dev_priv,
-					 u32 interrupt_mask,
-					 u32 enabled_irq_mask)
+void ibx_display_interrupt_update(struct drm_i915_private *dev_priv,
+				  u32 interrupt_mask,
+				  u32 enabled_irq_mask)
 {
 	u32 sdeimr = intel_uncore_read(&dev_priv->uncore, SDEIMR);
+
 	sdeimr &= ~interrupt_mask;
 	sdeimr |= (~enabled_irq_mask & interrupt_mask);
 
@@ -343,142 +303,6 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 	BUG_ON(1); /* Not to be called */
 }
 
-
-static bool gen11_port_hotplug_long_detect(enum hpd_pin pin, u32 val)
-{
-	switch (pin) {
-	case HPD_PORT_TC1:
-	case HPD_PORT_TC2:
-	case HPD_PORT_TC3:
-	case HPD_PORT_TC4:
-	case HPD_PORT_TC5:
-	case HPD_PORT_TC6:
-		return val & GEN11_HOTPLUG_CTL_LONG_DETECT(pin);
-	default:
-		return false;
-	}
-}
-
-static bool icp_ddi_port_hotplug_long_detect(enum hpd_pin pin, u32 val)
-{
-	switch (pin) {
-	case HPD_PORT_A:
-	case HPD_PORT_B:
-	case HPD_PORT_C:
-	case HPD_PORT_D:
-		return val & SHOTPLUG_CTL_DDI_HPD_LONG_DETECT(pin);
-	default:
-		return false;
-	}
-}
-
-static bool icp_tc_port_hotplug_long_detect(enum hpd_pin pin, u32 val)
-{
-	switch (pin) {
-	case HPD_PORT_TC1:
-	case HPD_PORT_TC2:
-	case HPD_PORT_TC3:
-	case HPD_PORT_TC4:
-	case HPD_PORT_TC5:
-	case HPD_PORT_TC6:
-		return val & ICP_TC_HPD_LONG_DETECT(pin);
-	default:
-		return false;
-	}
-}
-
-/*
- * Get a bit mask of pins that have triggered, and which ones may be long.
- * This can be called multiple times with the same masks to accumulate
- * hotplug detection results from several registers.
- *
- * Note that the caller is expected to zero out the masks initially.
- */
-static void intel_get_hpd_pins(struct drm_i915_private *dev_priv,
-			       u32 *pin_mask, u32 *long_mask,
-			       u32 hotplug_trigger, u32 dig_hotplug_reg,
-			       const u32 hpd[HPD_NUM_PINS],
-			       bool long_pulse_detect(enum hpd_pin pin, u32 val))
-{
-	enum hpd_pin pin;
-
-	BUILD_BUG_ON(BITS_PER_TYPE(*pin_mask) < HPD_NUM_PINS);
-
-	for_each_hpd_pin(pin) {
-		if ((hpd[pin] & hotplug_trigger) == 0)
-			continue;
-
-		*pin_mask |= BIT(pin);
-
-		if (long_pulse_detect(pin, dig_hotplug_reg))
-			*long_mask |= BIT(pin);
-	}
-
-	drm_dbg(&dev_priv->drm,
-		"hotplug event received, stat 0x%08x, dig 0x%08x, pins 0x%08x, long 0x%08x\n",
-		hotplug_trigger, dig_hotplug_reg, *pin_mask, *long_mask);
-
-}
-
-static u32 intel_hpd_enabled_irqs(struct drm_i915_private *dev_priv,
-				  const u32 hpd[HPD_NUM_PINS])
-{
-	struct intel_encoder *encoder;
-	u32 enabled_irqs = 0;
-
-	for_each_intel_encoder(&dev_priv->drm, encoder)
-		if (dev_priv->display.hotplug.stats[encoder->hpd_pin].state == HPD_ENABLED)
-			enabled_irqs |= hpd[encoder->hpd_pin];
-
-	return enabled_irqs;
-}
-
-static u32 intel_hpd_hotplug_irqs(struct drm_i915_private *dev_priv,
-				  const u32 hpd[HPD_NUM_PINS])
-{
-	struct intel_encoder *encoder;
-	u32 hotplug_irqs = 0;
-
-	for_each_intel_encoder(&dev_priv->drm, encoder)
-		hotplug_irqs |= hpd[encoder->hpd_pin];
-
-	return hotplug_irqs;
-}
-
-static u32 intel_hpd_hotplug_mask(struct drm_i915_private *i915,
-				  hotplug_mask_func hotplug_mask)
-{
-	enum hpd_pin pin;
-	u32 hotplug = 0;
-
-	for_each_hpd_pin(pin)
-		hotplug |= hotplug_mask(pin);
-
-	return hotplug;
-}
-
-static u32 intel_hpd_hotplug_enables(struct drm_i915_private *i915,
-				     hotplug_enables_func hotplug_enables)
-{
-	struct intel_encoder *encoder;
-	u32 hotplug = 0;
-
-	for_each_intel_encoder(&i915->drm, encoder)
-		hotplug |= hotplug_enables(encoder);
-
-	return hotplug;
-}
-
-static void gmbus_irq_handler(struct drm_i915_private *dev_priv)
-{
-	wake_up_all(&dev_priv->display.gmbus.wait_queue);
-}
-
-static void dp_aux_irq_handler(struct drm_i915_private *dev_priv)
-{
-	wake_up_all(&dev_priv->display.gmbus.wait_queue);
-}
-
 #if defined(CONFIG_DEBUG_FS)
 static void display_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 					 enum pipe pipe,
@@ -548,80 +372,6 @@ static void hsw_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 				     0, 0, 0, 0);
 }
 
-static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
-{
-	u32 ddi_hotplug_trigger = pch_iir & SDE_DDI_HOTPLUG_MASK_ICP;
-	u32 tc_hotplug_trigger = pch_iir & SDE_TC_HOTPLUG_MASK_ICP;
-	u32 pin_mask = 0, long_mask = 0;
-
-	if (ddi_hotplug_trigger) {
-		u32 dig_hotplug_reg;
-
-		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, SHOTPLUG_CTL_DDI);
-		intel_uncore_write(&dev_priv->uncore, SHOTPLUG_CTL_DDI, dig_hotplug_reg);
-
-		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
-				   ddi_hotplug_trigger, dig_hotplug_reg,
-				   dev_priv->display.hotplug.pch_hpd,
-				   icp_ddi_port_hotplug_long_detect);
-	}
-
-	if (tc_hotplug_trigger) {
-		u32 dig_hotplug_reg;
-
-		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, SHOTPLUG_CTL_TC);
-		intel_uncore_write(&dev_priv->uncore, SHOTPLUG_CTL_TC, dig_hotplug_reg);
-
-		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
-				   tc_hotplug_trigger, dig_hotplug_reg,
-				   dev_priv->display.hotplug.pch_hpd,
-				   icp_tc_port_hotplug_long_detect);
-	}
-
-	if (pin_mask)
-		intel_hpd_irq_handler(dev_priv, pin_mask, long_mask);
-
-	if (pch_iir & SDE_GMBUS_ICP)
-		gmbus_irq_handler(dev_priv);
-}
-
-static void gen11_hpd_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
-{
-	u32 pin_mask = 0, long_mask = 0;
-	u32 trigger_tc = iir & GEN11_DE_TC_HOTPLUG_MASK;
-	u32 trigger_tbt = iir & GEN11_DE_TBT_HOTPLUG_MASK;
-
-	if (trigger_tc) {
-		u32 dig_hotplug_reg;
-
-		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL);
-		intel_uncore_write(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL, dig_hotplug_reg);
-
-		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
-				   trigger_tc, dig_hotplug_reg,
-				   dev_priv->display.hotplug.hpd,
-				   gen11_port_hotplug_long_detect);
-	}
-
-	if (trigger_tbt) {
-		u32 dig_hotplug_reg;
-
-		dig_hotplug_reg = intel_uncore_read(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL);
-		intel_uncore_write(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL, dig_hotplug_reg);
-
-		intel_get_hpd_pins(dev_priv, &pin_mask, &long_mask,
-				   trigger_tbt, dig_hotplug_reg,
-				   dev_priv->display.hotplug.hpd,
-				   gen11_port_hotplug_long_detect);
-	}
-
-	if (pin_mask)
-		intel_hpd_irq_handler(dev_priv, pin_mask, long_mask);
-	else
-		drm_err(&dev_priv->drm,
-			"Unexpected DE HPD interrupt 0x%08x\n", iir);
-}
-
 static u32 gen8_de_port_aux_mask(struct drm_i915_private *dev_priv)
 {
 	u32 mask;
@@ -833,7 +583,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 			ret = IRQ_HANDLED;
 
 			if (iir & gen8_de_port_aux_mask(dev_priv)) {
-				dp_aux_irq_handler(dev_priv);
+				intel_dp_aux_irq_handler(dev_priv);
 				found = true;
 			}
 
@@ -1074,202 +824,6 @@ void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
 	intel_synchronize_irq(dev_priv);
 }
 
-static u32 icp_ddi_hotplug_mask(enum hpd_pin hpd_pin)
-{
-	switch (hpd_pin) {
-	case HPD_PORT_A:
-	case HPD_PORT_B:
-	case HPD_PORT_C:
-	case HPD_PORT_D:
-		return SHOTPLUG_CTL_DDI_HPD_ENABLE(hpd_pin);
-	default:
-		return 0;
-	}
-}
-
-static u32 icp_ddi_hotplug_enables(struct intel_encoder *encoder)
-{
-	return icp_ddi_hotplug_mask(encoder->hpd_pin);
-}
-
-static u32 icp_tc_hotplug_mask(enum hpd_pin hpd_pin)
-{
-	switch (hpd_pin) {
-	case HPD_PORT_TC1:
-	case HPD_PORT_TC2:
-	case HPD_PORT_TC3:
-	case HPD_PORT_TC4:
-	case HPD_PORT_TC5:
-	case HPD_PORT_TC6:
-		return ICP_TC_HPD_ENABLE(hpd_pin);
-	default:
-		return 0;
-	}
-}
-
-static u32 icp_tc_hotplug_enables(struct intel_encoder *encoder)
-{
-	return icp_tc_hotplug_mask(encoder->hpd_pin);
-}
-
-static void icp_ddi_hpd_detection_setup(struct drm_i915_private *dev_priv)
-{
-	intel_uncore_rmw(&dev_priv->uncore, SHOTPLUG_CTL_DDI,
-			 intel_hpd_hotplug_mask(dev_priv, icp_ddi_hotplug_mask),
-			 intel_hpd_hotplug_enables(dev_priv, icp_ddi_hotplug_enables));
-}
-
-static void icp_ddi_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-
-	intel_uncore_rmw(&dev_priv->uncore, SHOTPLUG_CTL_DDI,
-			 icp_ddi_hotplug_mask(encoder->hpd_pin),
-			 icp_ddi_hotplug_enables(encoder));
-}
-
-static void icp_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
-{
-	intel_uncore_rmw(&dev_priv->uncore, SHOTPLUG_CTL_TC,
-			 intel_hpd_hotplug_mask(dev_priv, icp_tc_hotplug_mask),
-			 intel_hpd_hotplug_enables(dev_priv, icp_tc_hotplug_enables));
-}
-
-static void icp_tc_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-
-	intel_uncore_rmw(&dev_priv->uncore, SHOTPLUG_CTL_TC,
-			 icp_tc_hotplug_mask(encoder->hpd_pin),
-			 icp_tc_hotplug_enables(encoder));
-}
-
-static void icp_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	icp_ddi_hpd_enable_detection(encoder);
-	icp_tc_hpd_enable_detection(encoder);
-}
-
-static void icp_hpd_irq_setup(struct drm_i915_private *dev_priv)
-{
-	u32 hotplug_irqs, enabled_irqs;
-
-	enabled_irqs = intel_hpd_enabled_irqs(dev_priv, dev_priv->display.hotplug.pch_hpd);
-	hotplug_irqs = intel_hpd_hotplug_irqs(dev_priv, dev_priv->display.hotplug.pch_hpd);
-
-	if (INTEL_PCH_TYPE(dev_priv) <= PCH_TGP)
-		intel_uncore_write(&dev_priv->uncore, SHPD_FILTER_CNT, SHPD_FILTER_CNT_500_ADJ);
-
-	ibx_display_interrupt_update(dev_priv, hotplug_irqs, enabled_irqs);
-
-	icp_ddi_hpd_detection_setup(dev_priv);
-	icp_tc_hpd_detection_setup(dev_priv);
-}
-
-static u32 gen11_hotplug_mask(enum hpd_pin hpd_pin)
-{
-	switch (hpd_pin) {
-	case HPD_PORT_TC1:
-	case HPD_PORT_TC2:
-	case HPD_PORT_TC3:
-	case HPD_PORT_TC4:
-	case HPD_PORT_TC5:
-	case HPD_PORT_TC6:
-		return GEN11_HOTPLUG_CTL_ENABLE(hpd_pin);
-	default:
-		return 0;
-	}
-}
-
-static u32 gen11_hotplug_enables(struct intel_encoder *encoder)
-{
-	return gen11_hotplug_mask(encoder->hpd_pin);
-}
-
-static void dg1_hpd_invert(struct drm_i915_private *dev_priv)
-{
-	u32 val = (INVERT_DDIA_HPD |
-		   INVERT_DDIB_HPD |
-		   INVERT_DDIC_HPD |
-		   INVERT_DDID_HPD);
-	intel_uncore_rmw(&dev_priv->uncore, SOUTH_CHICKEN1, 0, val);
-}
-
-static void dg1_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-
-	dg1_hpd_invert(i915);
-	icp_hpd_enable_detection(encoder);
-}
-
-static void dg1_hpd_irq_setup(struct drm_i915_private *dev_priv)
-{
-	dg1_hpd_invert(dev_priv);
-	icp_hpd_irq_setup(dev_priv);
-}
-
-static void gen11_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
-{
-	intel_uncore_rmw(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL,
-			 intel_hpd_hotplug_mask(dev_priv, gen11_hotplug_mask),
-			 intel_hpd_hotplug_enables(dev_priv, gen11_hotplug_enables));
-}
-
-static void gen11_tc_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-
-	intel_uncore_rmw(&dev_priv->uncore, GEN11_TC_HOTPLUG_CTL,
-			 gen11_hotplug_mask(encoder->hpd_pin),
-			 gen11_hotplug_enables(encoder));
-}
-
-static void gen11_tbt_hpd_detection_setup(struct drm_i915_private *dev_priv)
-{
-	intel_uncore_rmw(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL,
-			 intel_hpd_hotplug_mask(dev_priv, gen11_hotplug_mask),
-			 intel_hpd_hotplug_enables(dev_priv, gen11_hotplug_enables));
-}
-
-static void gen11_tbt_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-
-	intel_uncore_rmw(&dev_priv->uncore, GEN11_TBT_HOTPLUG_CTL,
-			 gen11_hotplug_mask(encoder->hpd_pin),
-			 gen11_hotplug_enables(encoder));
-}
-
-static void gen11_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-
-	gen11_tc_hpd_enable_detection(encoder);
-	gen11_tbt_hpd_enable_detection(encoder);
-
-	if (INTEL_PCH_TYPE(i915) >= PCH_ICP)
-		icp_hpd_enable_detection(encoder);
-}
-
-static void gen11_hpd_irq_setup(struct drm_i915_private *dev_priv)
-{
-	u32 hotplug_irqs, enabled_irqs;
-
-	enabled_irqs = intel_hpd_enabled_irqs(dev_priv, dev_priv->display.hotplug.hpd);
-	hotplug_irqs = intel_hpd_hotplug_irqs(dev_priv, dev_priv->display.hotplug.hpd);
-
-	intel_uncore_rmw(&dev_priv->uncore, GEN11_DE_HPD_IMR, hotplug_irqs,
-			 ~enabled_irqs & hotplug_irqs);
-	intel_uncore_posting_read(&dev_priv->uncore, GEN11_DE_HPD_IMR);
-
-	gen11_tc_hpd_detection_setup(dev_priv);
-	gen11_tbt_hpd_detection_setup(dev_priv);
-
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
-		icp_hpd_irq_setup(dev_priv);
-}
-
 static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	u32 de_pipe_masked = gen8_de_pipe_fault_mask(dev_priv) |
@@ -1363,38 +917,6 @@ void gen11_display_irq_postinstall(struct drm_i915_private *dev_priv)
 	gen11_de_irq_postinstall(dev_priv);
 }
 
-struct intel_hotplug_funcs {
-	/* Enable HPD sense and interrupts for all present encoders */
-	void (*hpd_irq_setup)(struct drm_i915_private *i915);
-	/* Enable HPD sense for a single encoder */
-	void (*hpd_enable_detection)(struct intel_encoder *encoder);
-};
-
-#define HPD_FUNCS(platform)					 \
-static const struct intel_hotplug_funcs platform##_hpd_funcs = { \
-	.hpd_irq_setup = platform##_hpd_irq_setup,		 \
-	.hpd_enable_detection = platform##_hpd_enable_detection, \
-}
-
-HPD_FUNCS(dg1);
-HPD_FUNCS(gen11);
-HPD_FUNCS(icp);
-#undef HPD_FUNCS
-
-void intel_hpd_enable_detection(struct intel_encoder *encoder)
-{
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-
-	if (i915->display.funcs.hotplug)
-		i915->display.funcs.hotplug->hpd_enable_detection(encoder);
-}
-
-void intel_hpd_irq_setup(struct drm_i915_private *i915)
-{
-	if (i915->display_irqs_enabled && i915->display.funcs.hotplug)
-		i915->display.funcs.hotplug->hpd_irq_setup(i915);
-}
-
 void intel_display_irq_init(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
@@ -1402,10 +924,6 @@ void intel_display_irq_init(struct drm_i915_private *dev_priv)
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	intel_hpd_init_pins(dev_priv);
-
-	intel_hpd_init_early(dev_priv);
-
 	dev->vblank_disable_immediate = true;
 
 	/* Most platforms treat the display irq block as an always-on
@@ -1418,12 +936,7 @@ void intel_display_irq_init(struct drm_i915_private *dev_priv)
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		dev_priv->display_irqs_enabled = false;
 
-	if (HAS_PCH_DG2(dev_priv))
-		dev_priv->display.funcs.hotplug = &icp_hpd_funcs;
-	else if (HAS_PCH_DG1(dev_priv))
-		dev_priv->display.funcs.hotplug = &dg1_hpd_funcs;
-	else if (DISPLAY_VER(dev_priv) >= 11)
-		dev_priv->display.funcs.hotplug = &gen11_hpd_funcs;
+	intel_hotplug_irq_init(dev_priv);
 }
 
 void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.h b/drivers/gpu/drm/xe/display/ext/i915_irq.h
index c64926a5a919..829b3dd55096 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.h
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.h
@@ -40,18 +40,17 @@ static inline void valleyview_disable_display_irqs(struct drm_i915_private *dev_
 {
 }
 
-void intel_hpd_enable_detection(struct intel_encoder *encoder);
-void intel_hpd_irq_setup(struct drm_i915_private *i915);
-void i915_hotplug_interrupt_update(struct drm_i915_private *dev_priv,
-				   u32 mask,
-				   u32 bits);
-
+void ilk_update_display_irq(struct drm_i915_private *dev_priv,
+			    u32 interrupt_mask, u32 enabled_irq_mask);
 void ilk_enable_display_irq(struct drm_i915_private *i915, u32 bits);
 void ilk_disable_display_irq(struct drm_i915_private *i915, u32 bits);
 
+void bdw_update_port_irq(struct drm_i915_private *i915, u32 interrupt_mask, u32 enabled_irq_mask);
 void bdw_enable_pipe_irq(struct drm_i915_private *i915, enum pipe pipe, u32 bits);
 void bdw_disable_pipe_irq(struct drm_i915_private *i915, enum pipe pipe, u32 bits);
 
+void ibx_display_interrupt_update(struct drm_i915_private *i915,
+				  u32 interrupt_mask, u32 enabled_irq_mask);
 void ibx_enable_display_interrupt(struct drm_i915_private *i915, u32 bits);
 void ibx_disable_display_interrupt(struct drm_i915_private *i915, u32 bits);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6490a04614ce..cbd18b839236 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -307,7 +307,11 @@ struct xe_device {
 	struct drm_atomic_state *modeset_restore_state;
 	struct list_head global_obj_list;
 
-	u32 de_irq_mask[I915_MAX_PIPES];
+	union {
+		/* only to allow build, not used functionally */
+		u32 irq_mask;
+		u32 de_irq_mask[I915_MAX_PIPES];
+	};
 	bool display_irqs_enabled;
 	u32 enabled_irq_mask;
 
-- 
2.39.2

