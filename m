Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF42FEA807
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0F10E798;
	Wed, 25 Mar 2026 05:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lacGSqfJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC010E791;
 Wed, 25 Mar 2026 05:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414835; x=1805950835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aed7iwW/XFd17DeJUM2KP47nl+4XgU7R/L5eNYOwr+Y=;
 b=lacGSqfJwhbyStbvmFtCdaEDftbHVfhEVCniNmNAgLKWW9PUdxHhAks0
 QRrChn2zOVMU0Ke46lfDbHsZNOAq0+K2Md40gKaaova2s4O1DPowYvw0R
 MitvR6Q63fkWHsBtkmmgwMLz6cr+KKU96i31rdMJpaH5XCiEk2jZKrLyG
 wRrbWMrJFsbFcqq1wHheFjyycBDlngEbALKNsx5wm7qqTiMAzUet73D6Q
 zBb1HURNer/3n1ziDzk/SFV+hvj1stNzdAtcsnV1YgUNW3vnWPSjvCHpW
 y9Es4XvINhaQHa/K+Jkq9mYmLPqVaQzkX4wKbCf+rAGbjWiftEtOjPoRh Q==;
X-CSE-ConnectionGUID: yr+3tFcMQ+aHyHanzOLKHg==
X-CSE-MsgGUID: RJTOwWdbRfauC29+g1xOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922391"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922391"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:35 -0700
X-CSE-ConnectionGUID: RWiAVOedShCShG/6j8XmBg==
X-CSE-MsgGUID: I74NErPUQtawbjCJ4YvU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580955"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 22:00:32 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 26/26] drm/i915/writeback: Modify state verify function
Date: Wed, 25 Mar 2026 10:29:16 +0530
Message-Id: <20260325045916.984243-27-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

Modify the state verify functions to take into account the fact
that writeback does not need all the timings for it to be set.
Moreover there is no need for dpll state nor do we need to set
any sort of flags for it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 59 ++++++++++++--------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 741a7b467117..16b13ba3ec65 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5152,6 +5152,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	struct drm_printer p;
 	u32 exclude_infoframes = 0;
 	bool ret = true;
+	bool is_writeback =
+		intel_crtc_has_type(current_config, INTEL_OUTPUT_WRITEBACK);
 
 	if (fastset)
 		p = drm_dbg_printer(display->drm, DRM_UT_KMS, NULL);
@@ -5267,20 +5269,25 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 } while (0)
 
 #define PIPE_CONF_CHECK_TIMINGS(name) do {     \
-	PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
-	PIPE_CONF_CHECK_I(name.crtc_htotal); \
-	PIPE_CONF_CHECK_I(name.crtc_hblank_start); \
-	PIPE_CONF_CHECK_I(name.crtc_hblank_end); \
-	PIPE_CONF_CHECK_I(name.crtc_hsync_start); \
-	PIPE_CONF_CHECK_I(name.crtc_hsync_end); \
-	PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
-	if (!fastset || !allow_vblank_delay_fastset(current_config)) \
-		PIPE_CONF_CHECK_I(name.crtc_vblank_start); \
-	PIPE_CONF_CHECK_I(name.crtc_vsync_start); \
-	PIPE_CONF_CHECK_I(name.crtc_vsync_end); \
-	if (!fastset || !pipe_config->update_lrr) { \
-		PIPE_CONF_CHECK_I(name.crtc_vtotal); \
-		PIPE_CONF_CHECK_I(name.crtc_vblank_end); \
+	if (is_writeback) { \
+		PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
+		PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
+	} else { \
+		PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
+		PIPE_CONF_CHECK_I(name.crtc_htotal); \
+		PIPE_CONF_CHECK_I(name.crtc_hblank_start); \
+		PIPE_CONF_CHECK_I(name.crtc_hblank_end); \
+		PIPE_CONF_CHECK_I(name.crtc_hsync_start); \
+		PIPE_CONF_CHECK_I(name.crtc_hsync_end); \
+		PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
+		if (!fastset || !allow_vblank_delay_fastset(current_config)) \
+			PIPE_CONF_CHECK_I(name.crtc_vblank_start); \
+		PIPE_CONF_CHECK_I(name.crtc_vsync_start); \
+		PIPE_CONF_CHECK_I(name.crtc_vsync_end); \
+		if (!fastset || !pipe_config->update_lrr) { \
+			PIPE_CONF_CHECK_I(name.crtc_vtotal); \
+			PIPE_CONF_CHECK_I(name.crtc_vblank_end); \
+		} \
 	} \
 } while (0)
 
@@ -5409,10 +5416,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(pixel_multiplier);
 
-	PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-			      DRM_MODE_FLAG_INTERLACE);
+	if (!is_writeback)
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_INTERLACE);
 
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS)) {
+	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS) && !is_writeback) {
 		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
 				      DRM_MODE_FLAG_PHSYNC);
 		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
@@ -5463,6 +5471,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
 		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
 		PIPE_CONF_CHECK_I(hw.casf_params.strength);
+		if (!is_writeback)
+			PIPE_CONF_CHECK_I(pixel_rate);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
@@ -5485,28 +5495,31 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_BOOL(double_wide);
 
-	if (display->dpll.mgr)
+	if (display->dpll.mgr && !is_writeback)
 		PIPE_CONF_CHECK_P(intel_dpll);
 
 	/* FIXME convert everything over the dpll_mgr */
-	if (display->dpll.mgr || HAS_GMCH(display))
+	if ((display->dpll.mgr || HAS_GMCH(display)) && !is_writeback)
 		PIPE_CONF_CHECK_PLL(dpll_hw_state);
 
 	/* FIXME convert MTL+ platforms over to dpll_mgr */
-	if (HAS_LT_PHY(display))
+	if (HAS_LT_PHY(display) && !is_writeback)
 		PIPE_CONF_CHECK_PLL_LT(dpll_hw_state.ltpll);
 
 	PIPE_CONF_CHECK_X(dsi_pll.ctrl);
 	PIPE_CONF_CHECK_X(dsi_pll.div);
 
-	if (display->platform.g4x || DISPLAY_VER(display) >= 5)
+	if ((display->platform.g4x || DISPLAY_VER(display) >= 5) &&
+	    !is_writeback)
 		PIPE_CONF_CHECK_I(pipe_bpp);
 
-	if (!fastset || !pipe_config->update_m_n) {
+	if ((!fastset || !pipe_config->update_m_n) && !is_writeback) {
 		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_clock);
 		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_clock);
 	}
-	PIPE_CONF_CHECK_I(port_clock);
+
+	if (!is_writeback)
+		PIPE_CONF_CHECK_I(port_clock);
 
 	PIPE_CONF_CHECK_I(min_voltage_level);
 
-- 
2.34.1

