Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB81EF8FE0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB410EA13;
	Wed,  4 Mar 2026 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhEPCeFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BEB10EA12;
 Wed,  4 Mar 2026 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630091; x=1804166091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYtC/mSCsrzquG6+OThVBWOR3bx1F9loFn+3/MVTM0Y=;
 b=QhEPCeFoi8IerV5I7XGuq06ZfFmvmU7e3YMSKZvxr0eiNKS9j1KXG6YW
 BcibC71kVzyb1Kq2FjOrm8/vtBmARxm1s9dncRONPYbj3SqmrmwGSg1E+
 xIaEmE9PGg0QueZj3002R82t6SxyJbRI6YNkM+24Bn0dDDs77Hva6Joac
 PIXxV+D2FOQhuLUpmt+mg51FwuR0iQGlXMg57lv23GkPQyX5LbLScK94t
 eFCB5b3oZcjE/EUWMgNnGUhMaVkJ/AoiBf9W5YioJ1g/uYdb/bguSXbDu
 Er9RsJRJwXsPrLsi+QwwnjS4g1MLNX8Zes08QDCsbm4cywW9mTe6udT9F Q==;
X-CSE-ConnectionGUID: 37t0kWAfQH2pzLXJZhB6mg==
X-CSE-MsgGUID: ayrRgrPMT7Sqi2yidH5OOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293485"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:51 -0800
X-CSE-ConnectionGUID: w/v38EMfTbuAFUjINAxK6A==
X-CSE-MsgGUID: 8wDaSeHWSguSMRWhPOHYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350867"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:50 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 21/24] drm/i915/lt_phy: Get encoder configuration for
 xe3plpd platform
Date: Wed,  4 Mar 2026 13:14:20 +0000
Message-ID: <20260304131423.1017821-22-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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
index 191ae7cf81fb..385d6b26693d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4243,21 +4243,6 @@ void intel_ddi_get_clock(struct intel_encoder *encoder,
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
@@ -5301,7 +5286,10 @@ void intel_ddi_init(struct intel_display *display,
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

