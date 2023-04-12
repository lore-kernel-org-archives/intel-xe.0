Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20398C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F334C10E82A;
	Wed, 12 Apr 2023 14:26:00 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347D910E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309560; x=1712845560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7hqNOan6C5x2RdDKtut2yQlPGK3HfIyu0MRbxtGJVtA=;
 b=a0om5JoV4pKPqikrXLpGddkatOL/DEMmZxUfwxa0aYlUSDpyMf/BVlx2
 deXjVTtbsKTG9fnsad0l7vvtrvgkctev6ZT3nicIRSAqL6E7aTyH/Nj+f
 2VO7uNKnixKEs/MHAUmjWcVnrfDg2wyqvYEWoY7AiDCom5+RR+G92nlkY
 mWKMgU8ZEUeGFxNP+GyR2F/kocZibCVqxMw95nHo7Po60ykYc0Og2EuiE
 Dns5DKZFJ7cZiyDwugn1So7qtYfFxD5vDYqjcVJ5zrQ2H9clAw17MPcqm
 nVz39FTK6sExdfXyUceEbh4pqYMmDTNYY0vudHJImuQFNTJ8hb6bs/2M5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667743"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667743"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800358250"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800358250"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:51 +0300
Message-Id: <20230412142006.877109-27-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 26/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Just reduce them.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index eaa67be2ac75..69c2a381c527 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -134,7 +134,6 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state);
 static void bdw_set_pipe_misc(const struct intel_crtc_state *crtc_state);
 static void ilk_pfit_enable(const struct intel_crtc_state *crtc_state);
 
-#ifdef I915
 /* returns HPLL frequency in kHz */
 int vlv_get_hpll_vco(struct drm_i915_private *dev_priv)
 {
@@ -191,7 +190,6 @@ static void intel_update_czclk(struct drm_i915_private *dev_priv)
 	drm_dbg(&dev_priv->drm, "CZ clock rate: %d kHz\n",
 		dev_priv->czclk_freq);
 }
-#endif
 
 static bool is_hdr_mode(const struct intel_crtc_state *crtc_state)
 {
@@ -3021,7 +3019,6 @@ static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 		intel_de_read(dev_priv, PFIT_PGM_RATIOS);
 }
 
-#ifdef I915
 static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
@@ -3082,7 +3079,6 @@ static void chv_crtc_clock_get(struct intel_crtc *crtc,
 
 	pipe_config->port_clock = chv_calc_dpll_params(refclk, &clock);
 }
-#endif
 
 static enum intel_output_format
 bdw_get_pipe_misc_output_format(struct intel_crtc *crtc)
@@ -3187,7 +3183,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 	intel_get_pipe_src_size(crtc, pipe_config);
 
 	i9xx_get_pfit_config(pipe_config);
-#ifdef I915
+
 	if (DISPLAY_VER(dev_priv) >= 4) {
 		/* No way to read it out on pipes B and C */
 		if (IS_CHERRYVIEW(dev_priv) && crtc->pipe != PIPE_A)
@@ -3229,7 +3225,6 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 	else if (IS_VALLEYVIEW(dev_priv))
 		vlv_crtc_clock_get(crtc, pipe_config);
 	else
-#endif
 		i9xx_crtc_clock_get(crtc, pipe_config);
 
 	/*
@@ -8606,9 +8601,8 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_shared_dpll_init(i915);
 	intel_fdi_pll_freq_update(i915);
 
-#ifdef I915
 	intel_update_czclk(i915);
-#endif
+
 	intel_modeset_init_hw(i915);
 	intel_dpll_update_ref_clks(i915);
 
-- 
2.39.2

