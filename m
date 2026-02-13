Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF4EDF15D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4AD10E819;
	Fri, 13 Feb 2026 12:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOVNXkFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9891810E814;
 Fri, 13 Feb 2026 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985598; x=1802521598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdQlVY7eCUUiSiCmBcnrLDMGL11Cg2Y+oCrmOTz8HrU=;
 b=kOVNXkFZgQXru59JiZscxprny/b/68hr+h4BAO0sxaZrkzMJiJrk48ij
 cSJBIkpFMFS9dFV6ihkREMGLiQpN7EtOZNfA9fMPiTvzbKlMD0CC6odkF
 kOy9DOFDttEdrHl17Pt2y4z/F23NGH897RrL5QRyMRDLfs5G2mbWlbEUt
 IJ/TRLL7q9CzCXkLuPJjboc82DMAP4f2EvbFqNKZrGUPPfZwHGpQjoslp
 5Zwpf2VGtPiCmsFk3wWqNxZcn9pQ2xLWmL/7XuJ8knBc1THau+M70cMov
 eMk0FC47AlkP0KQeZCwb6C6wOdpNFfhxn5psJh+NPNFkdNXq3vxXnXKDs Q==;
X-CSE-ConnectionGUID: V9VE4iGTQaOLehfRX9rpKw==
X-CSE-MsgGUID: PAC+lGlzROa/v+9vk6f3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158137"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:38 -0800
X-CSE-ConnectionGUID: FRtYzBBQRGeSfzzLa6wZ4w==
X-CSE-MsgGUID: U9dxtMb6TwqF9qWhJHI23A==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:36 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 16/19] drm/i915/lt_phy: Get encoder configuration for xe3plpd
 platform
Date: Fri, 13 Feb 2026 12:26:12 +0000
Message-ID: <20260213122615.1083654-17-mika.kahola@intel.com>
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

For DDI initialization get encoder configuration by reusing
MTL+ configuration.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 532d7d4e3b27..9f3c8cd02a33 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4244,21 +4244,6 @@ void intel_ddi_get_clock(struct intel_encoder *encoder,
 						     &crtc_state->dpll_hw_state);
 }
 
-static void xe3plpd_ddi_get_config(struct intel_encoder *encoder,
-				   struct intel_crtc_state *crtc_state)
-{
-	struct intel_display *display = to_intel_display(encoder);
-
-	intel_lt_phy_pll_readout_hw_state(encoder, &crtc_state->dpll_hw_state.ltpll);
-
-	if (crtc_state->dpll_hw_state.ltpll.tbt_mode)
-		crtc_state->port_clock = intel_mtl_tbt_calc_port_clock(encoder);
-	else
-		crtc_state->port_clock =
-			intel_lt_phy_calc_port_clock(display, &crtc_state->dpll_hw_state.ltpll);
-	intel_ddi_get_config(encoder, crtc_state);
-}
-
 static bool icl_ddi_tc_pll_is_tbt(const struct intel_dpll *pll)
 {
 	return pll->info->id == DPLL_ID_ICL_TBTPLL;
@@ -5302,7 +5287,10 @@ void intel_ddi_init(struct intel_display *display,
 		encoder->enable_clock = intel_xe3plpd_pll_enable_clock;
 		encoder->disable_clock = intel_xe3plpd_pll_disable_clock;
 		encoder->port_pll_type = intel_mtl_port_pll_type;
-		encoder->get_config = xe3plpd_ddi_get_config;
+		if (intel_encoder_is_tc(encoder))
+			encoder->get_config = mtl_ddi_tc_phy_get_config;
+		else
+			encoder->get_config = mtl_ddi_non_tc_phy_get_config;
 	} else if (DISPLAY_VER(display) >= 14) {
 		encoder->enable_clock = intel_mtl_pll_enable_clock;
 		encoder->disable_clock = intel_mtl_pll_disable_clock;
-- 
2.43.0

