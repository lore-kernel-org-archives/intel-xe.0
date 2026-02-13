Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E75BEDF154
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0392D10E7FA;
	Fri, 13 Feb 2026 12:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcU/NKWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDFD10E7F4;
 Fri, 13 Feb 2026 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985585; x=1802521585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+m+//L6irZYp1MTYXAqqfvu17e5IqJ4N2ejk7fObmxw=;
 b=EcU/NKWxabBNVTdITdT4ExZbNAnMF3k574XuLpbg/g00CmrLgHDEJzX/
 JN9uHdpF9LTOrKVKbigI1i8bX08NZJzHYIj8r6Upk8500xrwfjVmyeXpa
 v9YzK7HrGMWzwOxIyAVn88gaiHrPjSLm8aPo+xcxMp2QYL9Gamv5OMfPI
 b58aKM0DfaKdsZuk49ymyonOFvoS6fxLGhVjJHeCq6rUW6oafG6qDJpgx
 yFNfaWvWXyEPHPlHRGn1TyWT47Xm1xXz/trjuHBKvFVAVw5csiFvCBlIv
 ozY5eDELa8wel8C9Q2wycLpnaeiv0rmPSN0JF8x2T56tJpQfMJNnLPPYZ Q==;
X-CSE-ConnectionGUID: Zfm0UgVVSC2ZmpyFQlBkbQ==
X-CSE-MsgGUID: zQXpxf7BRHaUAUBZw0pAhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158111"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:25 -0800
X-CSE-ConnectionGUID: ZMAqCryRR5+RDptnx0x4Jg==
X-CSE-MsgGUID: BAXucs3zQCisMK7txN42VA==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:23 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 04/19] drm/i915/lt_phy: Add xe3plpd .compute_dplls hook
Date: Fri, 13 Feb 2026 12:26:00 +0000
Message-ID: <20260213122615.1083654-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213122615.1083654-1-mika.kahola@intel.com>
References: <20260213122615.1083654-1-mika.kahola@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dpll.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 13 ++--
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  4 +-
 4 files changed, 77 insertions(+), 7 deletions(-)

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
index f8cea06cfa27..48cb8be4c6ac 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1724,12 +1724,15 @@ intel_lt_phy_calc_port_clock(struct intel_display *display,
 
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
@@ -1739,19 +1742,19 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 
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
 			return 0;
 		}
 	}
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
-		return intel_lt_phy_calculate_hdmi_state(&crtc_state->dpll_hw_state.ltpll,
+		return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
 							 crtc_state->port_clock);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index db905668f86d..d720e3265e83 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -10,6 +10,7 @@
 
 struct intel_atomic_state;
 struct intel_display;
+struct intel_dpll_hw_state;
 struct intel_encoder;
 struct intel_crtc_state;
 struct intel_crtc;
@@ -20,7 +21,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
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

