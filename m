Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B484FED2E7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429C710E9CC;
	Thu, 12 Mar 2026 08:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLcuYRmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A50E10E9C7;
 Thu, 12 Mar 2026 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302849; x=1804838849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+seerHgk+g1/9hchkfSHgsGDMr12zRcRCv4FFlrzlNQ=;
 b=NLcuYRmO3dLEuu0zu0NuhfgwS5NREFL6Twk5IF3jxJhfNbPmEUtcs85q
 C5tg/08SzGuUgaMyG0r7/r7S8CiqaiN78YBGg9b+LiuT6BTqSttr1ta2m
 9EChtF1xb8yAi397YJJr4jqo9D0LwjF+AB700fzZixsCkKhK9L9d849AY
 V4My8l/kdoyeIcFPSBjeBFF7v36eVh8u5GnFHOG01kFqwa011+tUK20Vm
 3IHVE6kig7rLTgl61WRJUErNaDEtWiSkRtnxTDdfmUVt5j/bDdcu4rzoS
 5mJ1LDj7ek80dYX3BCttgVUyyazjPnECAddEqbddiA1B4V0LZJaj8/NOR Q==;
X-CSE-ConnectionGUID: XGUDs+K9SkeEy9W3Lphmdg==
X-CSE-MsgGUID: 00Vba1QPRiyneal831/vBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013747"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:29 -0700
X-CSE-ConnectionGUID: 6jtSUyu1TBGDhUGlzxqiaQ==
X-CSE-MsgGUID: H9BnC56rQ2yYc2QLWLyhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206928"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:28 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [CI v3 23/24] drm/i915/lt_phy: Enable dpll framework for xe3plpd
Date: Thu, 12 Mar 2026 08:06:56 +0000
Message-ID: <20260312080657.2648265-24-mika.kahola@intel.com>
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

xe3plpd platform is supported by dpll framework remove a separate
check for hw comparison and rely solely on dpll framework
hw comparison.

Finally, all required hooks are now in place so initialize
PLL manager for xe3plpd platform and remove the redirections
to the legacy code paths for clock enable/disable as well as
state mismatch checks that are no longer needed.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 31 -------------------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  7 +++--
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  1 +
 4 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index fe024250d350..ebefa889bc8c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5285,7 +5285,7 @@ void intel_ddi_init(struct intel_display *display,
 	if (HAS_LT_PHY(display)) {
 		encoder->enable_clock = intel_mtl_pll_enable_clock;
 		encoder->disable_clock = intel_mtl_pll_disable_clock;
-		encoder->port_pll_type = intel_mtl_port_pll_type;
+		encoder->port_pll_type = icl_ddi_tc_port_pll_type;
 		if (intel_encoder_is_tc(encoder))
 			encoder->get_config = mtl_ddi_tc_phy_get_config;
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 26601ddc94cd..74a89f531698 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5057,23 +5057,6 @@ static bool allow_vblank_delay_fastset(const struct intel_crtc_state *old_crtc_s
 	       !intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_DSI);
 }
 
-static void
-pipe_config_lt_phy_pll_mismatch(struct drm_printer *p, bool fastset,
-				const struct intel_crtc *crtc,
-				const char *name,
-				const struct intel_lt_phy_pll_state *a,
-				const struct intel_lt_phy_pll_state *b)
-{
-	char *chipname = "LTPHY";
-
-	pipe_config_mismatch(p, fastset, crtc, name, chipname);
-
-	drm_printf(p, "expected:\n");
-	intel_lt_phy_dump_hw_state(p, a);
-	drm_printf(p, "found:\n");
-	intel_lt_phy_dump_hw_state(p, b);
-}
-
 bool
 intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			  const struct intel_crtc_state *pipe_config,
@@ -5188,16 +5171,6 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	} \
 } while (0)
 
-#define PIPE_CONF_CHECK_PLL_LT(name) do { \
-	if (!intel_lt_phy_pll_compare_hw_state(&current_config->name, \
-					       &pipe_config->name)) { \
-		pipe_config_lt_phy_pll_mismatch(&p, fastset, crtc, __stringify(name), \
-						&current_config->name, \
-						&pipe_config->name); \
-		ret = false; \
-	} \
-} while (0)
-
 #define PIPE_CONF_CHECK_TIMINGS(name) do {     \
 	PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
 	PIPE_CONF_CHECK_I(name.crtc_htotal); \
@@ -5424,10 +5397,6 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	if (display->dpll.mgr || HAS_GMCH(display))
 		PIPE_CONF_CHECK_PLL(dpll_hw_state);
 
-	/* FIXME convert MTL+ platforms over to dpll_mgr */
-	if (HAS_LT_PHY(display))
-		PIPE_CONF_CHECK_PLL_LT(dpll_hw_state.ltpll);
-
 	PIPE_CONF_CHECK_X(dsi_pll.ctrl);
 	PIPE_CONF_CHECK_X(dsi_pll.div);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 421767dd8367..f5d4f7146fbc 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4724,7 +4724,6 @@ static bool xe3plpd_compare_hw_state(const struct intel_dpll_hw_state *_a,
 	return intel_lt_phy_pll_compare_hw_state(a, b);
 }
 
-__maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
@@ -4750,9 +4749,11 @@ void intel_dpll_init(struct intel_display *display)
 
 	mutex_init(&display->dpll.lock);
 
-	if (DISPLAY_VER(display) >= 35 || display->platform.dg2)
-		/* No shared DPLLs on NVL or DG2; port PLLs are part of the PHY */
+	if (display->platform.dg2)
+		/* No shared DPLLs on DG2; port PLLs are part of the PHY */
 		dpll_mgr = NULL;
+	else if (DISPLAY_VER(display) >= 35)
+		dpll_mgr = &xe3plpd_pll_mgr;
 	else if (DISPLAY_VER(display) >= 14)
 		dpll_mgr = &mtl_pll_mgr;
 	else if (display->platform.alderlake_p)
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 5bbbc6182861..657ad5cb0eff 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -11,6 +11,7 @@
 #include "intel_ddi_buf_trans.h"
 #include "intel_de.h"
 #include "intel_display.h"
+#include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_dpll.h"
-- 
2.43.0

