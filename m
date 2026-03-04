Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56693EF8FE2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682910E9F0;
	Wed,  4 Mar 2026 13:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAY7MA2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5D510E9EC;
 Wed,  4 Mar 2026 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630071; x=1804166071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uJxMR2q6JAfZya05X3Us3YguZXVa7gM/hB3/Qo93Z2g=;
 b=HAY7MA2WpJ0CYI41UPtOv19Peu5/cOjOSS12S0CpFism2SYyGIBlbtRw
 1NwYGS1WX1EH67LyS3HiwPY4JVtAWIa7+fyl5jRDVskaC3z+2uZmabxri
 RXPQeS1SXXgXBjafBYxD1WmrZAkUJH0SL7yOcWfoEIXE/kLuXgGu6wKCs
 HJRVU6XxX8sV3yyLpJigWj0DXAi501I2qYGHET2xeGkpZlmFLXQ8L44rr
 XrgOMrwALa2fuvRpUrrcFSlE8GC/u0gkVcOowCCAqki14fRY3+RoCuazU
 kLRxhK9fbeJuBXkuOkayjbSq9pEtduvebZm4xKqlZ9JxTdRSxN8OmamQt Q==;
X-CSE-ConnectionGUID: iRqoxh9XSV69scEHZfI7Tw==
X-CSE-MsgGUID: qCQhEuWjSgm3CszF8wVisg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293455"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:31 -0800
X-CSE-ConnectionGUID: 3w8qn5ZESGy8YoXIjhO1AA==
X-CSE-MsgGUID: fT68BNBHRQyHviWBBM6+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350755"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:30 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 04/24] drm/i915/lt_phy: Refactor LT PHY PLL handling to use
 explicit PLL state
Date: Wed,  4 Mar 2026 13:14:03 +0000
Message-ID: <20260304131423.1017821-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The LT PHY implementation currently pulls PLL and port_clock
information directly from the CRTC state. This ties the PHY
programming logic too tightly to the CRTC state and makes it
harder to clearly express the PHY’s own PLL configuration.

Introduce an explicit "struct intel_lt_phy_pll_state" argument
for the PHY functions and update callers accordingly.

No functional change is intended — this is a preparatory cleanup for
to bring LT PHY PLL handling as part of PLL framework.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 48 ++++++++++++---------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 8fe61cfdb706..ebdcab58df4a 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1178,7 +1178,8 @@ intel_lt_phy_lane_reset(struct intel_encoder *encoder,
 
 static void
 intel_lt_phy_program_port_clock_ctl(struct intel_encoder *encoder,
-				    const struct intel_crtc_state *crtc_state,
+				    const struct intel_lt_phy_pll_state *ltpll,
+				    int port_clock,
 				    bool lane_reversal)
 {
 	struct intel_display *display = to_intel_display(encoder);
@@ -1195,17 +1196,17 @@ intel_lt_phy_program_port_clock_ctl(struct intel_encoder *encoder,
 	 * but since the register bits still remain the same we use
 	 * the same definition
 	 */
-	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
-	    intel_hdmi_is_frl(crtc_state->port_clock))
+	if (encoder->type == INTEL_OUTPUT_HDMI &&
+	    intel_hdmi_is_frl(port_clock))
 		val |= XELPDP_DDI_CLOCK_SELECT_PREP(display, XELPDP_DDI_CLOCK_SELECT_DIV18CLK);
 	else
 		val |= XELPDP_DDI_CLOCK_SELECT_PREP(display, XELPDP_DDI_CLOCK_SELECT_MAXPCLK);
 
 	 /* DP2.0 10G and 20G rates enable MPLLA*/
-	if (crtc_state->port_clock == 1000000 || crtc_state->port_clock == 2000000)
+	if (port_clock == 1000000 || port_clock == 2000000)
 		val |= XELPDP_SSC_ENABLE_PLLA;
 	else
-		val |= crtc_state->dpll_hw_state.ltpll.ssc_enabled ? XELPDP_SSC_ENABLE_PLLB : 0;
+		val |= ltpll->ssc_enabled ? XELPDP_SSC_ENABLE_PLLB : 0;
 
 	intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port),
 		     XELPDP_LANE1_PHY_CLOCK_SELECT | XELPDP_FORWARD_CLOCK_UNGATE |
@@ -1248,10 +1249,12 @@ static u32 intel_lt_phy_get_dp_clock(u8 rate)
 
 static bool
 intel_lt_phy_config_changed(struct intel_encoder *encoder,
-			    const struct intel_crtc_state *crtc_state)
+			    const struct intel_lt_phy_pll_state *ltpll)
 {
+	struct intel_display *display = to_intel_display(encoder);
 	u8 val, rate;
 	u32 clock;
+	u32 port_clock = intel_lt_phy_calc_port_clock(display, ltpll);
 
 	val = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0,
 				LT_PHY_VDR_0_CONFIG);
@@ -1262,9 +1265,10 @@ intel_lt_phy_config_changed(struct intel_encoder *encoder,
 	 * using 1.62 Gbps clock since PHY PLL defaults to that
 	 * otherwise we always need to reconfigure it.
 	 */
-	if (intel_crtc_has_dp_encoder(crtc_state)) {
+	if (encoder->type == INTEL_OUTPUT_DP ||
+	    encoder->type == INTEL_OUTPUT_EDP) {
 		clock = intel_lt_phy_get_dp_clock(rate);
-		if (crtc_state->port_clock == 1620000 && crtc_state->port_clock == clock)
+		if (port_clock == 1620000 && port_clock == clock)
 			return false;
 	}
 
@@ -1759,41 +1763,41 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 
 static void
 intel_lt_phy_program_pll(struct intel_encoder *encoder,
-			 const struct intel_crtc_state *crtc_state)
+			 const struct intel_lt_phy_pll_state *ltpll)
 {
 	u8 owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
 	int i, j, k;
 
 	intel_lt_phy_write(encoder, owned_lane_mask, LT_PHY_VDR_0_CONFIG,
-			   crtc_state->dpll_hw_state.ltpll.config[0], MB_WRITE_COMMITTED);
+			   ltpll->config[0], MB_WRITE_COMMITTED);
 	intel_lt_phy_write(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_1_CONFIG,
-			   crtc_state->dpll_hw_state.ltpll.config[1], MB_WRITE_COMMITTED);
+			   ltpll->config[1], MB_WRITE_COMMITTED);
 	intel_lt_phy_write(encoder, owned_lane_mask, LT_PHY_VDR_2_CONFIG,
-			   crtc_state->dpll_hw_state.ltpll.config[2], MB_WRITE_COMMITTED);
+			   ltpll->config[2], MB_WRITE_COMMITTED);
 
 	for (i = 0; i <= 12; i++) {
 		intel_lt_phy_write(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_MSB(i),
-				   crtc_state->dpll_hw_state.ltpll.addr_msb[i],
+				   ltpll->addr_msb[i],
 				   MB_WRITE_COMMITTED);
 		intel_lt_phy_write(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_LSB(i),
-				   crtc_state->dpll_hw_state.ltpll.addr_lsb[i],
+				   ltpll->addr_lsb[i],
 				   MB_WRITE_COMMITTED);
 
 		for (j = 3, k = 0; j >= 0; j--, k++)
 			intel_lt_phy_write(encoder, INTEL_LT_PHY_LANE0,
 					   LT_PHY_VDR_X_DATAY(i, j),
-					   crtc_state->dpll_hw_state.ltpll.data[i][k],
+					   ltpll->data[i][k],
 					   MB_WRITE_COMMITTED);
 	}
 }
 
 static void
 intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
-			       const struct intel_crtc_state *crtc_state)
+			       const struct intel_lt_phy_pll_state *ltpll,
+			       u8 lane_count)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool lane_reversal = dig_port->lane_reversal;
-	u8 lane_count = crtc_state->lane_count;
 	bool is_dp_alt =
 		intel_tc_port_in_dp_alt_mode(dig_port);
 	enum intel_tc_pin_assignment tc_pin =
@@ -1895,7 +1899,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	intel_lt_phy_lane_reset(encoder, crtc_state->lane_count);
 
 	/* 2. Program PORT_CLOCK_CTL register to configure clock muxes, gating, and SSC. */
-	intel_lt_phy_program_port_clock_ctl(encoder, crtc_state, lane_reversal);
+	intel_lt_phy_program_port_clock_ctl(encoder, &crtc_state->dpll_hw_state.ltpll,
+					    crtc_state->port_clock, lane_reversal);
 
 	/* 3. Change owned PHY lanes power to Ready state. */
 	intel_lt_phy_powerdown_change_sequence(encoder, owned_lane_mask,
@@ -1905,12 +1910,12 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	 * 4. Read the PHY message bus VDR register PHY_VDR_0_Config check enabled PLL type,
 	 * encoded rate and encoded mode.
 	 */
-	if (intel_lt_phy_config_changed(encoder, crtc_state)) {
+	if (intel_lt_phy_config_changed(encoder, &crtc_state->dpll_hw_state.ltpll)) {
 		/*
 		 * 5. Program the PHY internal PLL registers over PHY message bus for the desired
 		 * frequency and protocol type
 		 */
-		intel_lt_phy_program_pll(encoder, crtc_state);
+		intel_lt_phy_program_pll(encoder, &crtc_state->dpll_hw_state.ltpll);
 
 		/* 6. Use the P2P transaction flow */
 		/*
@@ -2001,7 +2006,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	intel_lt_phy_powerdown_change_sequence(encoder, owned_lane_mask,
 					       XELPDP_P0_STATE_ACTIVE);
 
-	intel_lt_phy_enable_disable_tx(encoder, crtc_state);
+	intel_lt_phy_enable_disable_tx(encoder, &crtc_state->dpll_hw_state.ltpll,
+				       crtc_state->lane_count);
 	intel_lt_phy_transaction_end(encoder, wakeref);
 }
 
-- 
2.43.0

