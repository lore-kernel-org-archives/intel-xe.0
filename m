Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7934FFED2E7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3661A10E9A6;
	Thu, 12 Mar 2026 08:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTH9E686";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7338710E9A4;
 Thu, 12 Mar 2026 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302827; x=1804838827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/LyqkIBp1+F7JybV2ywNKhGqFnKmllh0RcTSTWRPHsY=;
 b=fTH9E686tLtqIxzVatBO3HpyRqz0zumfoslstCjDQLo9R/7W1JcdHpL9
 CfbDU9JINcRoKVM44dOpLfiyNxQWthBesWqJPbJrtw/6SAuN5OlXGFnqW
 kUBB8ln6TBbjJ844FT9wusCd23/7ehDOkwqJvSfPI6W9NTqyMTtclkmCw
 PfzMCa6xyNQD+NNhoYidZ5W+/3i0RTS9gy50O8eX0XLXvYCxUx9Vy0YDR
 cxR0W7n0jvS7BxoA4vq4DlNzagSwZLGDalna3tMton0npML1HbRWFXUrC
 Gvw6TJiBtgnwAxb3itjYx0Mok9VC1fqUiqbuZSb5edcaQhYkahaFepoji g==;
X-CSE-ConnectionGUID: cV83A8bVTcO4/D5YL1tbig==
X-CSE-MsgGUID: P5KhPoVvScqdIcAP/0LxxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013721"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013721"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:07 -0700
X-CSE-ConnectionGUID: 3eOm8wfISbCyGiD75GD4sg==
X-CSE-MsgGUID: sWHIgIBkS8CR5aX4slu+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206809"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:06 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 06/24] drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
Date: Thu, 12 Mar 2026 08:06:39 +0000
Message-ID: <20260312080657.2648265-7-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add compute dpll hook for xe3plpd platform and bring
PLL state calculation to support PLL framework.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 17 +++--
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  3 +-
 4 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 8433e3ff0319..147baa777856 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1222,7 +1222,7 @@ static int xe3plpd_crtc_compute_clock(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(encoder);
 	int ret;
 
-	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder);
+	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder, &crtc_state->dpll_hw_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 4185c8e136da..58c24e2164ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4585,9 +4585,74 @@ static const struct dpll_info xe3plpd_plls[] = {
 	{}
 };
 
+static int xe3plpd_compute_non_tc_phy_dpll(struct intel_atomic_state *state,
+					   struct intel_crtc *crtc,
+					   struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	struct icl_port_dpll *port_dpll =
+		&crtc_state->icl_port_dplls[ICL_PORT_DPLL_DEFAULT];
+	int ret;
+
+	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder, &port_dpll->hw_state);
+	if (ret)
+		return ret;
+
+	/* this is mainly for the fastset check */
+	icl_set_active_port_dpll(crtc_state, ICL_PORT_DPLL_DEFAULT);
+
+	crtc_state->port_clock = intel_lt_phy_calc_port_clock(display, &port_dpll->hw_state.ltpll);
+
+	return 0;
+}
+
+static int xe3plpd_compute_tc_phy_dplls(struct intel_atomic_state *state,
+					struct intel_crtc *crtc,
+					struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	struct icl_port_dpll *port_dpll;
+	int ret;
+
+	/* TODO: Add state calculation for TBT PLL */
+
+	port_dpll = &crtc_state->icl_port_dplls[ICL_PORT_DPLL_MG_PHY];
+	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder, &port_dpll->hw_state);
+	if (ret)
+		return ret;
+
+	/* this is mainly for the fastset check */
+	if (old_crtc_state->intel_dpll &&
+	    old_crtc_state->intel_dpll->info->id == DPLL_ID_ICL_TBTPLL)
+		icl_set_active_port_dpll(crtc_state, ICL_PORT_DPLL_DEFAULT);
+	else
+		icl_set_active_port_dpll(crtc_state, ICL_PORT_DPLL_MG_PHY);
+
+	crtc_state->port_clock = intel_lt_phy_calc_port_clock(display, &port_dpll->hw_state.ltpll);
+
+	return 0;
+}
+
+static int xe3plpd_compute_dplls(struct intel_atomic_state *state,
+				 struct intel_crtc *crtc,
+				 struct intel_encoder *encoder)
+{
+	if (intel_encoder_is_tc(encoder))
+		return xe3plpd_compute_tc_phy_dplls(state, crtc, encoder);
+	else
+		return xe3plpd_compute_non_tc_phy_dpll(state, crtc, encoder);
+}
+
 __maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
+	.compute_dplls = xe3plpd_compute_dplls,
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 3e83ac775d84..ed5cfd6641b1 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1745,12 +1745,15 @@ intel_lt_phy_calc_port_clock(struct intel_display *display,
 
 int
 intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
-			    struct intel_encoder *encoder)
+			    struct intel_encoder *encoder,
+			    struct intel_dpll_hw_state *hw_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct intel_lt_phy_pll_params *tables;
 	int i;
 
+	memset(hw_state, 0, sizeof(*hw_state));
+
 	tables = intel_lt_phy_pll_tables_get(crtc_state, encoder);
 	if (!tables)
 		return -EINVAL;
@@ -1760,21 +1763,21 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 
 		drm_WARN_ON(display->drm, !intel_dpll_clock_matches(clock, tables[i].clock_rate));
 		if (intel_dpll_clock_matches(crtc_state->port_clock, clock)) {
-			crtc_state->dpll_hw_state.ltpll = *tables[i].state;
+			hw_state->ltpll = *tables[i].state;
 			if (intel_crtc_has_dp_encoder(crtc_state)) {
 				if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
-					crtc_state->dpll_hw_state.ltpll.config[2] = 1;
+					hw_state->ltpll.config[2] = 1;
 			}
-			crtc_state->dpll_hw_state.ltpll.ssc_enabled =
+			hw_state->ltpll.ssc_enabled =
 				intel_lt_phy_pll_is_ssc_enabled(crtc_state, encoder);
-			crtc_state->dpll_hw_state.ltpll.lane_count = crtc_state->lane_count;
+			hw_state->ltpll.lane_count = crtc_state->lane_count;
 			return 0;
 		}
 	}
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
-		crtc_state->dpll_hw_state.ltpll.lane_count = crtc_state->lane_count;
-		return intel_lt_phy_calculate_hdmi_state(&crtc_state->dpll_hw_state.ltpll,
+		hw_state->ltpll.lane_count = crtc_state->lane_count;
+		return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
 							 crtc_state->port_clock);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index db905668f86d..61ec0e5d8888 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -20,7 +20,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 void intel_lt_phy_pll_disable(struct intel_encoder *encoder);
 int
 intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
-			    struct intel_encoder *encoder);
+			    struct intel_encoder *encoder,
+			    struct intel_dpll_hw_state *hw_state);
 int intel_lt_phy_calc_port_clock(struct intel_display *display,
 				 const struct intel_lt_phy_pll_state *lt_state);
 void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
-- 
2.43.0

