Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5F9EDF159
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7294A10E81A;
	Fri, 13 Feb 2026 12:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Irpzxvs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCAA10E806;
 Fri, 13 Feb 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985599; x=1802521599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wu30ZU5NmKHI87FoE2wOua0i0t1RUgZRthFJNDvLUmc=;
 b=Irpzxvs2uWcYIsR4U3KhxXYwWuOPOKlly5P2eawIxnOeGpcNCXZbKo+x
 wnmPjZJioAgnUuG+HDrzUlu+h4wbQ7ijY8IHwdZRtUOK5bzUtbHHz1gZQ
 zPe+RFUK8XvSXNe5xrGzxd4EBEyVGQnNfaQIZqZq6uoa+t5baE71vVcCB
 S0mp4Ckchl4kXC4oUlsdNZnjh/vV7CbZkGYXAlgzdwdrgKRA9F51CVtB5
 bZXpkv6flKF9BaXGrOkkZPBwNOP/Q7zFuubPcKkhKT5o6liFtdS7qDRl/
 JMINjOfdx2a2bZ89gKLtbSiO2ovL1qRuQxAYpPRL9+zzJIEuLCoOxwRw2 A==;
X-CSE-ConnectionGUID: h3fnDFwmSJSoBx6ZSKALew==
X-CSE-MsgGUID: K4qLain+TfSPr1oDr9pDoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158138"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:39 -0800
X-CSE-ConnectionGUID: ytYLuvGkTf2PfCZsHjTu6w==
X-CSE-MsgGUID: glp33Ff0QTK2dJoKfK92kw==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:37 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 17/19] drm/i915/lt_phy: Add xe3plpd Thunderbolt pll hooks
Date: Fri, 13 Feb 2026 12:26:13 +0000
Message-ID: <20260213122615.1083654-18-mika.kahola@intel.com>
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

Add the PLL hooks for the TBT PLL on xe3plpd. These are simple stubs
similarly to the TBT PLL on earlier platforms, since this PLL is always
on from the display POV - so no PLL enable/disable programming is
required as opposed to the non-TBT PLLs - and the clocks for different
link rates are enabled/disabled at a different level, via the
intel_encoder::enable_clock()/disable_clock() interface.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 13 +++++++++++--
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  4 ++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 28c560417409..534cc691979f 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4618,6 +4618,13 @@ static void xe3plpd_pll_disable(struct intel_display *display,
 	intel_xe3plpd_pll_disable(encoder);
 }
 
+static const struct intel_dpll_funcs xe3plpd_tbt_pll_funcs = {
+	.enable = mtl_tbt_pll_enable,
+	.disable = mtl_tbt_pll_disable,
+	.get_hw_state = intel_lt_phy_tbt_pll_readout_hw_state,
+	.get_freq = mtl_tbt_pll_get_freq,
+};
+
 static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
 	.enable = xe3plpd_pll_enable,
 	.disable = xe3plpd_pll_disable,
@@ -4628,7 +4635,8 @@ static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
 static const struct dpll_info xe3plpd_plls[] = {
 	{ .name = "DPLL 0", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_DPLL0, },
 	{ .name = "DPLL 1", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_DPLL1, },
-	/* TODO: Add TBT */
+	{ .name = "TBT PLL", .funcs = &xe3plpd_tbt_pll_funcs, .id = DPLL_ID_ICL_TBTPLL,
+	  .is_alt_port_dpll = true, .always_on = true },
 	{ .name = "TC PLL 1", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL1, },
 	{ .name = "TC PLL 2", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL2, },
 	{ .name = "TC PLL 3", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL3, },
@@ -4671,7 +4679,8 @@ static int xe3plpd_compute_tc_phy_dplls(struct intel_atomic_state *state,
 	struct icl_port_dpll *port_dpll;
 	int ret;
 
-	/* TODO: Add state calculation for TBT PLL */
+	port_dpll = &crtc_state->icl_port_dplls[ICL_PORT_DPLL_DEFAULT];
+	intel_lt_phy_tbt_pll_calc_state(&port_dpll->hw_state);
 
 	port_dpll = &crtc_state->icl_port_dplls[ICL_PORT_DPLL_MG_PHY];
 	ret = intel_lt_phy_pll_calc_state(crtc_state, encoder, &port_dpll->hw_state);
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 68c63d680e23..052cbbd36397 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1767,6 +1767,13 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 	return -EINVAL;
 }
 
+void intel_lt_phy_tbt_pll_calc_state(struct intel_dpll_hw_state *hw_state)
+{
+	memset(hw_state, 0, sizeof(*hw_state));
+
+	hw_state->ltpll.tbt_mode = true;
+}
+
 static void
 intel_lt_phy_program_pll(struct intel_encoder *encoder,
 			 const struct intel_lt_phy_pll_state *ltpll)
@@ -2212,6 +2219,17 @@ static bool intel_lt_phy_pll_is_enabled(struct intel_encoder *encoder)
 			     intel_lt_phy_get_pclk_pll_request(lane);
 }
 
+bool intel_lt_phy_tbt_pll_readout_hw_state(struct intel_display *display,
+					   struct intel_dpll *pll,
+					   struct intel_dpll_hw_state *hw_state)
+{
+	memset(hw_state, 0, sizeof(*hw_state));
+
+	hw_state->ltpll.tbt_mode = true;
+
+	return true;
+}
+
 bool intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 				       struct intel_lt_phy_pll_state *pll_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 3838e9326773..1c2ec438cd10 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -26,6 +26,7 @@ int
 intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 			    struct intel_encoder *encoder,
 			    struct intel_dpll_hw_state *hw_state);
+void intel_lt_phy_tbt_pll_calc_state(struct intel_dpll_hw_state *hw_state);
 int intel_lt_phy_calc_port_clock(struct intel_display *display,
 				 const struct intel_lt_phy_pll_state *lt_state);
 void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
@@ -35,6 +36,9 @@ void intel_lt_phy_dump_hw_state(struct drm_printer *p,
 bool
 intel_lt_phy_pll_compare_hw_state(const struct intel_lt_phy_pll_state *a,
 				  const struct intel_lt_phy_pll_state *b);
+bool intel_lt_phy_tbt_pll_readout_hw_state(struct intel_display *display,
+					   struct intel_dpll *pll,
+					   struct intel_dpll_hw_state *hw_state);
 bool intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 				       struct intel_lt_phy_pll_state *pll_state);
 void intel_lt_phy_pll_state_verify(struct intel_atomic_state *state,
-- 
2.43.0

