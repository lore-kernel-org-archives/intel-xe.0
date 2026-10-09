Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA52CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8AE112065;
	Fri,  9 Oct 2026 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R99M90iT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4B112068;
 Fri,  9 Oct 2026 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542163; x=1823078163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ie0QOFJrGwftbOQgzAzbGYKpxcMm1ULvWucasqyrZvg=;
 b=R99M90iTrBF79Qn7O6Rq8otjHg9WifgXd9r0p23pZ2Mw9KfFSbojTf8f
 6rlwBgjgjbMtTGQg2cwkgOOwKqFqyBHH4x4QYAMoth02YuQLC4NlcgCdn
 LC2d8xHzo7LFQmxXDWFAABd7aB3+m0iT8QjS33S4YaTPYTUXpLBzA/nNP
 TNCmaLN4KcVmoS28QBLIoXCd6/Vwy0ejJVJQlQkxWs/NFc9Fs6lOUChJN
 YTydS1sXwrHzSxmnHfbtfNSh+UCnIL9j6+Pwr7eQlzAe2tVipV71hmAHf
 AlMnYcHQGAnMvbUNoS/ePAlWOkFSAjy6i/OXM+VCmQTGaX2+8MZB8n+0R Q==;
X-CSE-ConnectionGUID: eV2EubxxRuOktfY4kVS6vQ==
X-CSE-MsgGUID: lOabIv+XTUSir+e1eTVOqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219341"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:36:03 -0700
X-CSE-ConnectionGUID: hH/wQBMiRsC9mvDlYQ8Bag==
X-CSE-MsgGUID: z2ngXKjJTeGerEIhx0HL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399276"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:36:02 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 3/5] drm/i915/lt_phy: split out
 intel_lt_phy_pll_calc_state_from_table()
Date: Fri,  9 Oct 2026 10:35:49 +0000
Message-ID: <20261009103552.1864818-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009103552.1864818-1-mika.kahola@intel.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
MIME-Version: 1.0
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

The PLL table walk in intel_lt_phy_pll_calc_state() is only reachable
with a crtc_state. Split it into a helper taking the port clock and
lane count directly, and pass the output type in as is_dp/is_edp, like
intel_c10pll_calc_state_from_table() on the C10 side.

intel_lt_phy_pll_is_ssc_enabled() loses its crtc_state argument for the
same reason, matching intel_cx0pll_update_ssc().

No functional change.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 71 +++++++++++++--------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b01d..c626246b71f9 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1329,12 +1329,11 @@ intel_lt_phy_pll_tables_get(struct intel_crtc_state *crtc_state,
 }
 
 static bool
-intel_lt_phy_pll_is_ssc_enabled(struct intel_crtc_state *crtc_state,
-				struct intel_encoder *encoder)
+intel_lt_phy_pll_is_ssc_enabled(struct intel_encoder *encoder, bool is_dp)
 {
 	struct intel_display *display = to_intel_display(encoder);
 
-	if (intel_crtc_has_dp_encoder(crtc_state)) {
+	if (is_dp) {
 		if (intel_panel_use_ssc(display)) {
 			struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
@@ -1740,14 +1739,45 @@ intel_lt_phy_calc_port_clock(struct intel_display *display,
 	return clk;
 }
 
+static int
+intel_lt_phy_pll_calc_state_from_table(struct intel_encoder *encoder,
+				       const struct intel_lt_phy_pll_params *tables,
+				       bool is_dp, bool is_edp,
+				       int port_clock, int lane_count,
+				       struct intel_lt_phy_pll_state *pll_state)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	int i;
+
+	for (i = 0; tables[i].name; i++) {
+		int clock = intel_lt_phy_calc_port_clock(display, tables[i].state);
+
+		drm_WARN_ON(display->drm, !intel_dpll_clock_matches(clock, tables[i].clock_rate));
+		if (intel_dpll_clock_matches(port_clock, clock)) {
+			*pll_state = *tables[i].state;
+
+			if (is_edp)
+				pll_state->config[2] = 1;
+
+			pll_state->ssc_enabled = intel_lt_phy_pll_is_ssc_enabled(encoder, is_dp);
+			pll_state->lane_count = lane_count;
+
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 int
 intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 			    struct intel_encoder *encoder,
 			    struct intel_dpll_hw_state *hw_state)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
+	bool is_dp = intel_crtc_has_dp_encoder(crtc_state);
+	bool is_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
 	const struct intel_lt_phy_pll_params *tables;
-	int i;
+	int err;
 
 	memset(hw_state, 0, sizeof(*hw_state));
 
@@ -1755,30 +1785,19 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 	if (!tables)
 		return -EINVAL;
 
-	for (i = 0; tables[i].name; i++) {
-		int clock = intel_lt_phy_calc_port_clock(display, tables[i].state);
+	err = intel_lt_phy_pll_calc_state_from_table(encoder, tables, is_dp, is_edp,
+						     crtc_state->port_clock,
+						     crtc_state->lane_count,
+						     &hw_state->ltpll);
 
-		drm_WARN_ON(display->drm, !intel_dpll_clock_matches(clock, tables[i].clock_rate));
-		if (intel_dpll_clock_matches(crtc_state->port_clock, clock)) {
-			hw_state->ltpll = *tables[i].state;
-			if (intel_crtc_has_dp_encoder(crtc_state)) {
-				if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
-					hw_state->ltpll.config[2] = 1;
-			}
-			hw_state->ltpll.ssc_enabled =
-				intel_lt_phy_pll_is_ssc_enabled(crtc_state, encoder);
-			hw_state->ltpll.lane_count = crtc_state->lane_count;
-			return 0;
-		}
-	}
+	if (err == 0 || !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+		return err;
 
-	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
-		hw_state->ltpll.lane_count = crtc_state->lane_count;
-		return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
-							 crtc_state->port_clock);
-	}
+	/* For HDMI PLLs use the HDMI algorithm, if there are no precomputed tables */
+	hw_state->ltpll.lane_count = crtc_state->lane_count;
 
-	return -EINVAL;
+	return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
+						 crtc_state->port_clock);
 }
 
 void intel_lt_phy_tbt_pll_calc_state(struct intel_dpll_hw_state *hw_state)
-- 
2.43.0

