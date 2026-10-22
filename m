Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC5606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lTIhmyvP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C402112501;
	Thu, 22 Oct 2026 11:56:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571E6112501;
 Thu, 22 Oct 2026 11:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670161; x=1824206161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xvSOPoAnZKrNxpxytFzZV0xabqtaK4mkwajGtotXec=;
 b=lTIhmyvPKao84U8gQQ8XoLCVp5bg3JYODu6GRbIAvEvU+Qu3rAmXO3SX
 oUDxpvKD409Za5PBPBlKTDnjP7Y2z0u3JKMoozNQ1uZq4yMAHdm3tZWQz
 JWPKr7ZvCUMJXD7cFWfF1pcIo1/h6jMCYBLKpqQtrUrHtpqybB09iHFjv
 Czc9ELaonSOkuT4tMhUjUUTZd4veNyVIUG0hChOuxLxVGniRg/XmGwXdw
 u8YAvSRLRhr9kZBF2ouArlEDklSRCPwgmM0XhXMwzx+csxn9f5p+F6HgS
 Sb74wpd7Mui0ncW/HARPjfHnLu8b6xhdARSVVDYicnPaPQ1DM2YCQ9YHI Q==;
X-CSE-ConnectionGUID: UWVJzlkISvOYZ28ULjeYlw==
X-CSE-MsgGUID: 3H2YITEtQLCqu6GQGJ+dEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1426729"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1426729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:00 -0700
X-CSE-ConnectionGUID: mIiH7d7sS/ShJvnHLm2aEg==
X-CSE-MsgGUID: g9Yt8nQwRc6eyhHaxDp4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3395958"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:55:59 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Use intel_de_{read,
 write})fw() in BDW+ irq handlers
Date: Thu, 22 Oct 2026 14:55:46 +0300
Message-ID: <20261022115548.32678-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Turns out MMIO is incredibly expensive on MTL+. A single
MMIO read can take 1-3 us depending on the specific platform.
Writes are a bit less bad, taking "only" 500-700 ns.
The plan is to bring over the unclaimed register detection
from i915 to xe, and that will bracket each non-fw() MMIO
access with two additional FPGA_DBG MMIO reads. That would
push the cost of a single intel_de_read() to nearly 10 us on
the worst platform (LNL), which seems like a bad idea in
performance sensitive parts.

So let's start using intel_de_{read,write}_fw() in the BDW+
irq handlers to avoid that extra cost there.

On xe LNL+ we do lose the wakelock get/put around these
accesses. I don't think we should be getting pipe/etc.
interrupts while in DC5/6 so this *should* be fine. If
that turns out to be a bad assumption we might want to
switch to eg. doing a single wakelock get/put around the
whole display irq handler.

On i915 this has a few extra functional changes:
- We lose the unclaimed register detection from irq handlers.
  To avoid the complete loss of coverage we may want to
  consider doing manual unclaimed checks around bigger blocks
  of _fw() register acceses (irq handlers, atomic commit
  register writes)
- uncore.lock no longer serializes these register accesses.
  The affected platforms should not have any issues with
  parallel accesses to the same cacheline, so the lock isn't
  needed

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 62 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc.c      |  6 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 18 +++---
 3 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 8ce30112de97..d2d45767bfd2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -206,15 +206,15 @@ void bdw_update_port_irq(struct intel_display *display,
 	if (drm_WARN_ON(display->drm, !intel_parent_irq_enabled(display)))
 		return;
 
-	old_val = intel_de_read(display, GEN8_DE_PORT_IMR);
+	old_val = intel_de_read_fw(display, GEN8_DE_PORT_IMR);
 
 	new_val = old_val;
 	new_val &= ~interrupt_mask;
 	new_val |= (~enabled_irq_mask & interrupt_mask);
 
 	if (new_val != old_val) {
-		intel_de_write(display, GEN8_DE_PORT_IMR, new_val);
-		intel_de_posting_read(display, GEN8_DE_PORT_IMR);
+		intel_de_write_fw(display, GEN8_DE_PORT_IMR, new_val);
+		intel_de_posting_read_fw(display, GEN8_DE_PORT_IMR);
 	}
 }
 
@@ -244,8 +244,8 @@ static void bdw_update_pipe_irq(struct intel_display *display,
 
 	if (new_val != display->irq.de_pipe_imr_mask[pipe]) {
 		display->irq.de_pipe_imr_mask[pipe] = new_val;
-		intel_de_write(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
-		intel_de_posting_read(display, GEN8_DE_PIPE_IMR(pipe));
+		intel_de_write_fw(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
+		intel_de_posting_read_fw(display, GEN8_DE_PIPE_IMR(pipe));
 	}
 }
 
@@ -1274,7 +1274,7 @@ gen8_de_misc_irq_handler(struct intel_display *display, u32 iir)
 		}
 
 		if (iir & XELPDP_RM_TIMEOUT) {
-			u32 val = intel_de_read(display, RM_TIMEOUT_REG_CAPTURE);
+			u32 val = intel_de_read_fw(display, RM_TIMEOUT_REG_CAPTURE);
 			drm_warn(display->drm, "Register Access Timeout = 0x%x\n", val);
 			found = true;
 		}
@@ -1297,7 +1297,7 @@ gen8_de_misc_irq_handler(struct intel_display *display, u32 iir)
 			else
 				iir_reg = EDP_PSR_IIR;
 
-			psr_iir = intel_de_rmw(display, iir_reg, 0, 0);
+			psr_iir = intel_de_rmw_fw(display, iir_reg, 0, 0);
 
 			if (psr_iir)
 				found = true;
@@ -1326,7 +1326,7 @@ static void gen11_dsi_te_interrupt_handler(struct intel_display *display,
 	 * Incase of dual link, TE comes from DSI_1
 	 * this is to check if dual link is enabled
 	 */
-	val = intel_de_read(display, TRANS_DDI_FUNC_CTL2(display, TRANSCODER_DSI_0));
+	val = intel_de_read_fw(display, TRANS_DDI_FUNC_CTL2(display, TRANSCODER_DSI_0));
 	val &= PORT_SYNC_MODE_ENABLE;
 
 	/*
@@ -1338,7 +1338,7 @@ static void gen11_dsi_te_interrupt_handler(struct intel_display *display,
 	dsi_trans = (port == PORT_A) ? TRANSCODER_DSI_0 : TRANSCODER_DSI_1;
 
 	/* Check if DSI configured in command mode */
-	val = intel_de_read(display, DSI_TRANS_FUNC_CONF(dsi_trans));
+	val = intel_de_read_fw(display, DSI_TRANS_FUNC_CONF(dsi_trans));
 	val = val & OP_MODE_MASK;
 
 	if (val != CMD_MODE_NO_GATE && val != CMD_MODE_TE_GATE) {
@@ -1347,7 +1347,7 @@ static void gen11_dsi_te_interrupt_handler(struct intel_display *display,
 	}
 
 	/* Get PIPE for handling VBLANK event */
-	val = intel_de_read(display, TRANS_DDI_FUNC_CTL(display, dsi_trans));
+	val = intel_de_read_fw(display, TRANS_DDI_FUNC_CTL(display, dsi_trans));
 	switch (val & TRANS_DDI_EDP_INPUT_MASK) {
 	case TRANS_DDI_EDP_INPUT_A_ON:
 		pipe = PIPE_A;
@@ -1383,7 +1383,7 @@ static void gen8_read_and_ack_pch_irqs(struct intel_display *display, u32 *pch_i
 	u32 pica_ier = 0;
 
 	*pica_iir = 0;
-	*pch_iir = intel_de_read(display, SDEIIR);
+	*pch_iir = intel_de_read_fw(display, SDEIIR);
 	if (!*pch_iir)
 		return;
 
@@ -1395,15 +1395,15 @@ static void gen8_read_and_ack_pch_irqs(struct intel_display *display, u32 *pch_i
 	if (*pch_iir & SDE_PICAINTERRUPT) {
 		drm_WARN_ON(display->drm, INTEL_PCH_TYPE(display) < PCH_MTL);
 
-		pica_ier = intel_de_rmw(display, PICAINTERRUPT_IER, ~0, 0);
-		*pica_iir = intel_de_read(display, PICAINTERRUPT_IIR);
-		intel_de_write(display, PICAINTERRUPT_IIR, *pica_iir);
+		pica_ier = intel_de_rmw_fw(display, PICAINTERRUPT_IER, ~0, 0);
+		*pica_iir = intel_de_read_fw(display, PICAINTERRUPT_IIR);
+		intel_de_write_fw(display, PICAINTERRUPT_IIR, *pica_iir);
 	}
 
-	intel_de_write(display, SDEIIR, *pch_iir);
+	intel_de_write_fw(display, SDEIIR, *pch_iir);
 
 	if (pica_ier)
-		intel_de_write(display, PICAINTERRUPT_IER, pica_ier);
+		intel_de_write_fw(display, PICAINTERRUPT_IER, pica_ier);
 }
 
 static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
@@ -1414,9 +1414,9 @@ static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 	drm_WARN_ON_ONCE(display->drm, !HAS_DISPLAY(display));
 
 	if (master_ctl & GEN8_DE_MISC_IRQ) {
-		iir = intel_de_read(display, GEN8_DE_MISC_IIR);
+		iir = intel_de_read_fw(display, GEN8_DE_MISC_IIR);
 		if (iir) {
-			intel_de_write(display, GEN8_DE_MISC_IIR, iir);
+			intel_de_write_fw(display, GEN8_DE_MISC_IIR, iir);
 			gen8_de_misc_irq_handler(display, iir);
 		} else {
 			drm_err_ratelimited(display->drm,
@@ -1425,9 +1425,9 @@ static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 	}
 
 	if (DISPLAY_VER(display) >= 11 && (master_ctl & GEN11_DE_HPD_IRQ)) {
-		iir = intel_de_read(display, GEN11_DE_HPD_IIR);
+		iir = intel_de_read_fw(display, GEN11_DE_HPD_IIR);
 		if (iir) {
-			intel_de_write(display, GEN11_DE_HPD_IIR, iir);
+			intel_de_write_fw(display, GEN11_DE_HPD_IIR, iir);
 			gen11_hpd_irq_handler(display, iir);
 		} else {
 			drm_err_ratelimited(display->drm,
@@ -1436,11 +1436,11 @@ static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 	}
 
 	if (master_ctl & GEN8_DE_PORT_IRQ) {
-		iir = intel_de_read(display, GEN8_DE_PORT_IIR);
+		iir = intel_de_read_fw(display, GEN8_DE_PORT_IIR);
 		if (iir) {
 			bool found = false;
 
-			intel_de_write(display, GEN8_DE_PORT_IIR, iir);
+			intel_de_write_fw(display, GEN8_DE_PORT_IIR, iir);
 
 			if (iir & gen8_de_port_aux_mask(display)) {
 				intel_dp_aux_irq_handler(display);
@@ -1505,7 +1505,7 @@ static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 		if (!(master_ctl & GEN8_DE_PIPE_IRQ(pipe)))
 			continue;
 
-		iir = intel_de_read(display, GEN8_DE_PIPE_IIR(pipe));
+		iir = intel_de_read_fw(display, GEN8_DE_PIPE_IIR(pipe));
 		if (!iir) {
 			drm_err_ratelimited(display->drm,
 					    "The master control interrupt lied (DE PIPE %c)!\n",
@@ -1513,7 +1513,7 @@ static void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 			continue;
 		}
 
-		intel_de_write(display, GEN8_DE_PIPE_IIR(pipe), iir);
+		intel_de_write_fw(display, GEN8_DE_PIPE_IIR(pipe), iir);
 
 		if (iir & GEN8_PIPE_VBLANK)
 			intel_handle_vblank(display, pipe);
@@ -1596,9 +1596,9 @@ u32 gen11_gu_misc_irq_ack(struct intel_display *display, const u32 master_ctl)
 
 	intel_display_rpm_assert_block(display);
 
-	iir = intel_de_read(display, GEN11_GU_MISC_IIR);
+	iir = intel_de_read_fw(display, GEN11_GU_MISC_IIR);
 	if (likely(iir))
-		intel_de_write(display, GEN11_GU_MISC_IIR, iir);
+		intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir);
 
 	intel_display_rpm_assert_unblock(display);
 
@@ -1621,11 +1621,11 @@ static bool gen11_display_irq_handler(struct intel_display *display,
 	 * GEN11_DISPLAY_INT_CTL has same format as GEN8_MASTER_IRQ
 	 * for the display related bits.
 	 */
-	disp_ctl = intel_de_read(display, GEN11_DISPLAY_INT_CTL);
+	disp_ctl = intel_de_read_fw(display, GEN11_DISPLAY_INT_CTL);
 
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
+	intel_de_write_fw(display, GEN11_DISPLAY_INT_CTL, 0);
 	gen8_de_irq_handler(display, disp_ctl);
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, GEN11_DISPLAY_IRQ_ENABLE);
+	intel_de_write_fw(display, GEN11_DISPLAY_INT_CTL, GEN11_DISPLAY_IRQ_ENABLE);
 
 	intel_display_rpm_assert_unblock(display);
 
@@ -1786,9 +1786,9 @@ static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 	else
 		port = PORT_A;
 
-	intel_de_rmw(display, DSI_INTR_MASK_REG(port), DSI_TE_EVENT, enable ? 0 : DSI_TE_EVENT);
+	intel_de_rmw_fw(display, DSI_INTR_MASK_REG(port), DSI_TE_EVENT, enable ? 0 : DSI_TE_EVENT);
 
-	intel_de_rmw(display, DSI_INTR_IDENT_REG(port), 0, 0);
+	intel_de_rmw_fw(display, DSI_INTR_IDENT_REG(port), 0, 0);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 80d2dd1391c8..56e831b2a826 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1775,8 +1775,8 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
 	u32 tmp = 0, int_vector;
 
 	if (DISPLAY_VER(display) >= 20) {
-		tmp = intel_de_read(display, PIPEDMC_INTERRUPT(pipe));
-		intel_de_write(display, PIPEDMC_INTERRUPT(pipe), tmp);
+		tmp = intel_de_read_fw(display, PIPEDMC_INTERRUPT(pipe));
+		intel_de_write_fw(display, PIPEDMC_INTERRUPT(pipe), tmp);
 
 		if (tmp & PIPEDMC_FLIPQ_PROG_DONE) {
 			spin_lock(&display->drm->event_lock);
@@ -1808,7 +1808,7 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
 				crtc->base.base.id, crtc->base.name);
 	}
 
-	int_vector = intel_de_read(display, PIPEDMC_STATUS(pipe)) & PIPEDMC_INT_VECTOR_MASK;
+	int_vector = intel_de_read_fw(display, PIPEDMC_STATUS(pipe)) & PIPEDMC_INT_VECTOR_MASK;
 	if (tmp == 0 && int_vector != 0)
 		drm_err(display->drm, "[CRTC:%d:%s] PIPEDMC interrupt vector 0x%x\n",
 			crtc->base.base.id, crtc->base.name, int_vector);
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 539fd555edce..913fcd2a1723 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -529,8 +529,8 @@ void xelpdp_pica_irq_handler(struct intel_display *display, u32 iir)
 
 		pin_mask |= BIT(pin);
 
-		val = intel_de_read(display, XELPDP_PORT_HOTPLUG_CTL(pin));
-		intel_de_write(display, XELPDP_PORT_HOTPLUG_CTL(pin), val);
+		val = intel_de_read_fw(display, XELPDP_PORT_HOTPLUG_CTL(pin));
+		intel_de_write_fw(display, XELPDP_PORT_HOTPLUG_CTL(pin), val);
 
 		if (val & (XELPDP_DP_ALT_HPD_LONG_DETECT | XELPDP_TBT_HPD_LONG_DETECT))
 			long_mask |= BIT(pin);
@@ -563,7 +563,7 @@ void icp_irq_handler(struct intel_display *display, u32 pch_iir)
 
 		/* Locking due to DSI native GPIO sequences */
 		spin_lock(&display->irq.lock);
-		dig_hotplug_reg = intel_de_rmw(display, SHOTPLUG_CTL_DDI, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, SHOTPLUG_CTL_DDI, 0, 0);
 		spin_unlock(&display->irq.lock);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
@@ -575,7 +575,7 @@ void icp_irq_handler(struct intel_display *display, u32 pch_iir)
 	if (tc_hotplug_trigger) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_de_rmw(display, SHOTPLUG_CTL_TC, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, SHOTPLUG_CTL_TC, 0, 0);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
 				   tc_hotplug_trigger, dig_hotplug_reg,
@@ -600,7 +600,7 @@ void spt_irq_handler(struct intel_display *display, u32 pch_iir)
 	if (hotplug_trigger) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_de_rmw(display, PCH_PORT_HOTPLUG, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, PCH_PORT_HOTPLUG, 0, 0);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
 				   hotplug_trigger, dig_hotplug_reg,
@@ -611,7 +611,7 @@ void spt_irq_handler(struct intel_display *display, u32 pch_iir)
 	if (hotplug2_trigger) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_de_rmw(display, PCH_PORT_HOTPLUG2, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, PCH_PORT_HOTPLUG2, 0, 0);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
 				   hotplug2_trigger, dig_hotplug_reg,
@@ -644,7 +644,7 @@ void bxt_hpd_irq_handler(struct intel_display *display, u32 hotplug_trigger)
 {
 	u32 dig_hotplug_reg, pin_mask = 0, long_mask = 0;
 
-	dig_hotplug_reg = intel_de_rmw(display, PCH_PORT_HOTPLUG, 0, 0);
+	dig_hotplug_reg = intel_de_rmw_fw(display, PCH_PORT_HOTPLUG, 0, 0);
 
 	intel_get_hpd_pins(display, &pin_mask, &long_mask,
 			   hotplug_trigger, dig_hotplug_reg,
@@ -663,7 +663,7 @@ void gen11_hpd_irq_handler(struct intel_display *display, u32 iir)
 	if (trigger_tc) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_de_rmw(display, GEN11_TC_HOTPLUG_CTL, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, GEN11_TC_HOTPLUG_CTL, 0, 0);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
 				   trigger_tc, dig_hotplug_reg,
@@ -674,7 +674,7 @@ void gen11_hpd_irq_handler(struct intel_display *display, u32 iir)
 	if (trigger_tbt) {
 		u32 dig_hotplug_reg;
 
-		dig_hotplug_reg = intel_de_rmw(display, GEN11_TBT_HOTPLUG_CTL, 0, 0);
+		dig_hotplug_reg = intel_de_rmw_fw(display, GEN11_TBT_HOTPLUG_CTL, 0, 0);
 
 		intel_get_hpd_pins(display, &pin_mask, &long_mask,
 				   trigger_tbt, dig_hotplug_reg,
-- 
2.55.0

