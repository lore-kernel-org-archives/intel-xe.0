Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7933C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFA10EE0F;
	Wed, 26 Aug 2026 22:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHyClb+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AED10E500;
 Wed, 26 Aug 2026 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787784842; x=1819320842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d41BPcNrpTTqQMm7aFJcGMIVfSb0WAE0YMJddYe+ct8=;
 b=NHyClb+p98x3MA7uWEcFGd/lbbJsPFIngkvOyUaYFh0PGe96/bw0csdt
 1ep6Llm96SuvgJ591C29mtd24F5dQ9CvX0W5+K9aYuCwVV/qmfyRkf1Nl
 WndK2o3wgzGgcFWvSuFD/T1+hzUk2K+ji6AqePa3FdnprudqR8rFVgFaj
 s/zzI99F2iW+s7ViSPIqYl8wrGt+xtbT0z6vi5B9YXSapQDp9xbg6WfbD
 K8l2F3dt41N/WVnePlMjEPwy1WdvF7zWOalgiyjTs9pcxOam0Sh0YRqy2
 c8MDhSx1jUbxMotaUjWnd+B7tRy59LUz5Pz/t3PsozqrHdQL9+GX/4HHZ A==;
X-CSE-ConnectionGUID: hW/QeBCtTeKqtafW0mtwPw==
X-CSE-MsgGUID: x0hoeP1wSQmfQGfa2I4pCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223483"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87223483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:00 -0700
X-CSE-ConnectionGUID: VyXYWiSJSF63/94kGr2qxQ==
X-CSE-MsgGUID: 1B2R26FOR2eIM+BecsHi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272946049"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:53:57 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, pranay.samala@intel.com
Subject: [PATCH 1/4] drm/i915/hpd: plumb keep_hpd through irq reset
Date: Thu, 27 Aug 2026 01:53:34 +0300
Message-ID: <20260826225338.804902-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826225338.804902-1-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_irq_suspend() resets all display interrupt registers, including the
HPD enable/mask registers. When runtime suspending to D3hot with PME
armed, this leaves the display unable to generate the hotplug event that
would wake the device, so a plug goes unnoticed until something else
resumes it.

As we are going to support PME and avoid HPD polling during the runtime
suspend, we need a way to preserve the HPD related interrupt registers.
A keep_hpd flag is used for that purpose and the HPD related interrupt
registers are reset / preserved based on this flag. But we need to plug
this keep_hpd in the existing IRQ suspend / reset mechanism. At this
point this flag is set to false until the PME capability is implemented.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 46 +++++++++++++------
 .../gpu/drm/i915/display/intel_display_irq.h  |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               | 16 +++----
 drivers/gpu/drm/xe/display/xe_display.c       |  4 +-
 drivers/gpu/drm/xe/display/xe_display.h       |  4 +-
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 drivers/gpu/drm/xe/xe_irq.c                   | 18 +++++---
 drivers/gpu/drm/xe/xe_irq.h                   |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                    |  4 +-
 9 files changed, 59 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a59b75830bd1..26fc90ff7299 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1976,16 +1976,20 @@ static void _vlv_display_irq_reset(struct intel_display *display)
 	display->irq.vlv_imr_mask = ~0u;
 }
 
-static void vlv_display_irq_reset(struct intel_display *display)
+static void vlv_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
+	drm_WARN_ON(display->drm, keep_hpd);
+
 	spin_lock_irq(&display->irq.lock);
 	if (display->irq.vlv_display_irqs_enabled)
 		_vlv_display_irq_reset(display);
 	spin_unlock_irq(&display->irq.lock);
 }
 
-static void i9xx_display_irq_reset(struct intel_display *display)
+static void i9xx_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
+	drm_WARN_ON(display->drm, keep_hpd);
+
 	if (HAS_HOTPLUG(display)) {
 		i915_hotplug_interrupt_update(display, 0xffffffff, 0);
 		intel_de_rmw(display, PORT_HOTPLUG_STAT(display), 0, 0);
@@ -2177,8 +2181,10 @@ static void ibx_display_irq_reset(struct intel_display *display)
 		intel_de_write(display, SERR_INT, 0xffffffff);
 }
 
-static void ilk_display_irq_reset(struct intel_display *display)
+static void ilk_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
+	drm_WARN_ON(display->drm, keep_hpd);
+
 	irq_reset(display, DE_IRQ_REGS);
 	display->irq.ilk_de_imr_mask = ~0u;
 
@@ -2193,10 +2199,12 @@ static void ilk_display_irq_reset(struct intel_display *display)
 	ibx_display_irq_reset(display);
 }
 
-static void gen8_display_irq_reset(struct intel_display *display)
+static void gen8_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
 	enum pipe pipe;
 
+	drm_WARN_ON(display->drm, keep_hpd);
+
 	intel_de_write(display, EDP_PSR_IMR, 0xffffffff);
 	intel_de_write(display, EDP_PSR_IIR, 0xffffffff);
 
@@ -2212,13 +2220,14 @@ static void gen8_display_irq_reset(struct intel_display *display)
 		ibx_display_irq_reset(display);
 }
 
-static void gen11_display_irq_reset(struct intel_display *display)
+static void gen11_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
 
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
+	if (!keep_hpd)
+		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
 
 	if (DISPLAY_VER(display) >= 12) {
 		enum transcoder trans;
@@ -2250,13 +2259,20 @@ static void gen11_display_irq_reset(struct intel_display *display)
 	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
 	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
 
-	if (DISPLAY_VER(display) >= 14)
-		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
-	else
-		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
+	/*
+	 * When runtime suspending to D3hot with PME armed, leave the HPD
+	 * interrupt registers programmed so that a hotplug can still
+	 * generate the wake event. Everything else is reset as usual.
+	 */
+	if (!keep_hpd) {
+		if (DISPLAY_VER(display) >= 14)
+			irq_reset(display, PICAINTERRUPT_IRQ_REGS);
+		else
+			irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
 
-	if (INTEL_PCH_TYPE(display) >= PCH_ICP)
-		irq_reset(display, SDE_IRQ_REGS);
+		if (INTEL_PCH_TYPE(display) >= PCH_ICP)
+			irq_reset(display, SDE_IRQ_REGS);
+	}
 }
 
 void gen8_irq_power_well_post_enable(struct intel_display *display,
@@ -2542,7 +2558,7 @@ static void gen11_de_irq_postinstall(struct intel_display *display)
 }
 
 struct intel_display_irq_funcs {
-	void (*reset)(struct intel_display *display);
+	void (*reset)(struct intel_display *display, bool keep_hpd);
 	void (*postinstall)(struct intel_display *display);
 	void (*ack)(struct intel_display *display, struct intel_display_irq_state *state);
 	bool (*handler)(struct intel_display *display, const struct intel_display_irq_state *state);
@@ -2587,12 +2603,12 @@ static const struct intel_display_irq_funcs i915_display_irq_funcs = {
 	.handler = i915_display_irq_handler,
 };
 
-void intel_display_irq_reset(struct intel_display *display)
+void intel_display_irq_reset(struct intel_display *display, bool keep_hpd)
 {
 	if (!HAS_DISPLAY(display))
 		return;
 
-	display->irq.funcs->reset(display);
+	display->irq.funcs->reset(display, keep_hpd);
 }
 
 void intel_display_irq_postinstall(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 84446bf53401..106f6d979f71 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -64,7 +64,7 @@ struct intel_display_irq_state {
 	u32 pipe_stats[I915_MAX_PIPES];
 };
 
-void intel_display_irq_reset(struct intel_display *display);
+void intel_display_irq_reset(struct intel_display *display, bool keep_hpd);
 void intel_display_irq_postinstall(struct intel_display *display);
 void intel_display_irq_ack(struct intel_display *display, struct intel_display_irq_state *state);
 bool intel_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 932409b943ad..db53b6e82d8e 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -599,7 +599,7 @@ static void ilk_irq_reset(struct drm_i915_private *dev_priv)
 	struct intel_display *display = dev_priv->display;
 
 	/* The master interrupt enable is in DEIER, reset display irq first */
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 	gen5_gt_irq_reset(to_gt(dev_priv));
 }
 
@@ -612,7 +612,7 @@ static void valleyview_irq_reset(struct drm_i915_private *dev_priv)
 
 	gen5_gt_irq_reset(to_gt(dev_priv));
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 }
 
 static void gen8_irq_reset(struct drm_i915_private *dev_priv)
@@ -623,7 +623,7 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
 	gen8_master_intr_disable(intel_uncore_regs(uncore));
 
 	gen8_gt_irq_reset(to_gt(dev_priv));
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 	gen2_irq_reset(uncore, GEN8_PCU_IRQ_REGS);
 }
 
@@ -636,7 +636,7 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 	gen11_master_intr_disable(intel_uncore_regs(&dev_priv->uncore));
 
 	gen11_gt_irq_reset(gt);
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 
 	gen2_irq_reset(uncore, GEN11_GU_MISC_IRQ_REGS);
 	gen2_irq_reset(uncore, GEN8_PCU_IRQ_REGS);
@@ -654,7 +654,7 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 	for_each_gt(gt, dev_priv, i)
 		gen11_gt_irq_reset(gt);
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 
 	gen2_irq_reset(uncore, GEN11_GU_MISC_IRQ_REGS);
 	gen2_irq_reset(uncore, GEN8_PCU_IRQ_REGS);
@@ -674,7 +674,7 @@ static void cherryview_irq_reset(struct drm_i915_private *dev_priv)
 
 	gen2_irq_reset(uncore, GEN8_PCU_IRQ_REGS);
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 }
 
 static void ilk_irq_postinstall(struct drm_i915_private *dev_priv)
@@ -823,7 +823,7 @@ static void i915_irq_reset(struct drm_i915_private *dev_priv)
 	struct intel_display *display = dev_priv->display;
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 
 	gen2_error_reset(uncore, GEN2_ERROR_REGS);
 	gen2_irq_reset(uncore, GEN2_IRQ_REGS);
@@ -900,7 +900,7 @@ static void i965_irq_reset(struct drm_i915_private *dev_priv)
 	struct intel_display *display = dev_priv->display;
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, false);
 
 	gen2_error_reset(uncore, GEN2_ERROR_REGS);
 	gen2_irq_reset(uncore, GEN2_IRQ_REGS);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7b25c0814674..6f1f8e0b25b5 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -216,14 +216,14 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 		intel_opregion_asle_intr(display);
 }
 
-void xe_display_irq_reset(struct xe_device *xe)
+void xe_display_irq_reset(struct xe_device *xe, bool keep_hpd)
 {
 	struct intel_display *display = xe->display;
 
 	if (!xe->info.probe_display)
 		return;
 
-	intel_display_irq_reset(display);
+	intel_display_irq_reset(display, keep_hpd);
 }
 
 void xe_display_irq_postinstall(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 0babb50bfc77..19f313eba6fb 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,7 +34,7 @@ void xe_display_shutdown_late(struct xe_device *xe);
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
-void xe_display_irq_reset(struct xe_device *xe);
+void xe_display_irq_reset(struct xe_device *xe, bool keep_hpd);
 void xe_display_irq_postinstall(struct xe_device *xe);
 
 void xe_display_pm_suspend(struct xe_device *xe);
@@ -72,7 +72,7 @@ static inline void xe_display_shutdown_late(struct xe_device *xe) {}
 
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
 static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
-static inline void xe_display_irq_reset(struct xe_device *xe) {}
+static inline void xe_display_irq_reset(struct xe_device *xe, bool keep_hpd) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..2c586dd3e187 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1190,7 +1190,7 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	xe_display_shutdown(xe);
 
-	xe_irq_suspend(xe);
+	xe_irq_suspend(xe, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_shutdown(gt);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..eb240615455c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -644,7 +644,7 @@ static void vf_irq_reset(struct xe_device *xe)
 	}
 }
 
-static void xe_irq_reset(struct xe_device *xe)
+static void xe_irq_reset(struct xe_device *xe, bool keep_hpd)
 {
 	struct xe_tile *tile;
 	u8 id;
@@ -666,7 +666,7 @@ static void xe_irq_reset(struct xe_device *xe)
 
 	tile = xe_device_get_root_tile(xe);
 	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
-	xe_display_irq_reset(xe);
+	xe_display_irq_reset(xe, keep_hpd);
 	xe_i2c_irq_reset(xe);
 
 	/*
@@ -789,7 +789,7 @@ static void irq_uninstall(void *arg)
 	if (!atomic_xchg(&xe->irq.enabled, 0))
 		return;
 
-	xe_irq_reset(xe);
+	xe_irq_reset(xe, false);
 
 	if (xe_device_has_msix(xe))
 		xe_irq_msix_free(xe);
@@ -813,7 +813,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_hw_error_init(xe);
 
-	xe_irq_reset(xe);
+	xe_irq_reset(xe, false);
 
 	if (xe_device_has_msix(xe)) {
 		nvec = xe->irq.msix.nvec;
@@ -843,7 +843,7 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
 }
 
-void xe_irq_suspend(struct xe_device *xe)
+void xe_irq_suspend(struct xe_device *xe, bool keep_hpd)
 {
 	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
@@ -852,7 +852,7 @@ void xe_irq_suspend(struct xe_device *xe)
 		xe_irq_msix_synchronize_irq(xe);
 	else
 		xe_irq_msi_synchronize_irq(xe);
-	xe_irq_reset(xe); /* turn irqs off */
+	xe_irq_reset(xe, keep_hpd); /* turn irqs off */
 }
 
 void xe_irq_resume(struct xe_device *xe)
@@ -866,7 +866,11 @@ void xe_irq_resume(struct xe_device *xe)
 	 * 2. display is not yet resumed
 	 */
 	atomic_set(&xe->irq.enabled, 1);
-	xe_irq_reset(xe);
+	/*
+	 * Always a full reset here: once awake, HPD is delivered as a normal
+	 * interrupt again and the postinstall below re-arms that path.
+	 */
+	xe_irq_reset(xe, false);
 	xe_irq_postinstall(xe); /* turn irqs on */
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52..eb9eb2060ff5 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -16,7 +16,7 @@ struct xe_gt;
 
 int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
-void xe_irq_suspend(struct xe_device *xe);
+void xe_irq_suspend(struct xe_device *xe, bool keep_hpd);
 void xe_irq_resume(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..1488c4dfcc05 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -202,7 +202,7 @@ int xe_pm_suspend(struct xe_device *xe)
 			goto err_display;
 	}
 
-	xe_irq_suspend(xe);
+	xe_irq_suspend(xe, false);
 
 	xe_display_pm_suspend_late(xe);
 
@@ -639,7 +639,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 			goto out_resume;
 	}
 
-	xe_irq_suspend(xe);
+	xe_irq_suspend(xe, false);
 
 	xe_display_pm_runtime_suspend_late(xe);
 
-- 
2.43.0

