Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E79CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ECE10ED39;
	Mon, 19 Oct 2026 13:53:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E623710ED39;
 Mon, 19 Oct 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418008; x=1823954008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3xuUKMKgDtxlDi64ZWr0alic1zxyr04kplLChRBVRJk=;
 b=XhCp0naQ8vipFX3//KwZh9wfHBbKTK2CDfJL61aRfupSrCvuPFASjpa8
 s0cf+HzhjeJNfKBAkXvANx9CdgKqyfPcvfL7RcJnRUiKrAAC7FhSDRK2H
 mlS61eIMOSj8LtmO1BzCYUai3cwBV9dC9XDCWkhP4IsZb2A6R+Zfgujrv
 RmSKPHDnVsT6xP/aUmSj6p1nnmHpHEe5ATjL3+IA3QqNncrZJQP2mSslc
 8I2rDCy3Blr4pqAybGxBl1AOrActJWlWriVDo/W6W//GtLqIaGejWxvvy
 5uav8vwxPM46PuUOXQbRiYapHUBDJRVuEElm186lJ1sMPVfj2riG384fI g==;
X-CSE-ConnectionGUID: NFxIR91BQnOCuM2OcfWM6g==
X-CSE-MsgGUID: xiK0RDj/RmKTM8cd2AuXcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979691"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:28 -0700
X-CSE-ConnectionGUID: XkeZrTPTSIqsILbV/Cz3NA==
X-CSE-MsgGUID: ohAopJNxTJq747xcr2mWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418474"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:26 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/15] drm/i915/pfit: Introduce intel_pfit_get_config()
Date: Mon, 19 Oct 2026 16:52:58 +0300
Message-ID: <20261019135309.23578-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Introduce a new intel_pfit_get_config() wrapper to better
contain the pfit details inside intel_pfit.c.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++--------
 drivers/gpu/drm/i915/display/intel_pfit.c    | 16 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_pfit.h    |  3 +--
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d1440cc6dba4..79c4aff1c633 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3236,7 +3236,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 	intel_get_transcoder_timings(crtc, pipe_config);
 	intel_get_pipe_src_size(crtc, pipe_config);
 
-	i9xx_pfit_get_config(pipe_config);
+	intel_pfit_get_config(pipe_config);
 
 	i9xx_dpll_get_hw_state(crtc, &pipe_config->dpll_hw_state);
 
@@ -3586,7 +3586,7 @@ static bool ilk_get_pipe_config(struct intel_crtc *crtc,
 	intel_get_transcoder_timings(crtc, pipe_config);
 	intel_get_pipe_src_size(crtc, pipe_config);
 
-	ilk_pfit_get_config(pipe_config);
+	intel_pfit_get_config(pipe_config);
 
 	ret = true;
 
@@ -4153,12 +4153,8 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 			REG_FIELD_GET(HSW_IPS_LINETIME_MASK, tmp);
 
 	if (intel_display_power_get_in_set_if_enabled(display, &crtc->hw_readout_power_domains,
-						      POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe))) {
-		if (DISPLAY_VER(display) >= 9)
-			skl_scaler_get_config(pipe_config);
-		else
-			ilk_pfit_get_config(pipe_config);
-	}
+						      POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe)))
+		intel_pfit_get_config(pipe_config);
 
 	hsw_ips_get_config(pipe_config);
 
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index aa4a4d10d124..b4a201dc8f7b 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -638,7 +638,7 @@ void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write_fw(display, PF_WIN_SZ(pipe), 0);
 }
 
-void ilk_pfit_get_config(struct intel_crtc_state *crtc_state)
+static void ilk_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -724,7 +724,7 @@ static bool i9xx_has_pfit(struct intel_display *display)
 		display->platform.pineview || display->platform.mobile;
 }
 
-void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
+static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -751,3 +751,15 @@ void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
 	crtc_state->gmch_pfit.pgm_ratios =
 		intel_de_read(display, PFIT_PGM_RATIOS(display));
 }
+
+void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (HAS_GMCH(display))
+		i9xx_pfit_get_config(crtc_state);
+	else if (DISPLAY_VER(display) >= 9)
+		skl_scaler_get_config(crtc_state);
+	else
+		ilk_pfit_get_config(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.h b/drivers/gpu/drm/i915/display/intel_pfit.h
index c1bb0d1f344e..184e1932eae5 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.h
+++ b/drivers/gpu/drm/i915/display/intel_pfit.h
@@ -17,10 +17,9 @@ int intel_pfit_compute_config(struct intel_crtc_state *crtc_state,
 			      const struct drm_connector_state *conn_state);
 void ilk_pfit_enable(const struct intel_crtc_state *crtc_state);
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state);
-void ilk_pfit_get_config(struct intel_crtc_state *crtc_state);
 void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state);
 void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state);
-void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state);
+void intel_pfit_get_config(struct intel_crtc_state *crtc_state);
 enum drm_mode_status
 intel_pfit_mode_valid(struct intel_display *display,
 		      const struct drm_display_mode *mode,
-- 
2.55.0

