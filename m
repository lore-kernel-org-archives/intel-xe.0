Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF6CCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48F810ED7A;
	Mon, 19 Oct 2026 13:53:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5C10ED67;
 Mon, 19 Oct 2026 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418027; x=1823954027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r77tzC7onKf+scSVnEBwi/L7JF7+6ERP9SKDg+OYzI8=;
 b=XROZ53RhzbDUDZGFwHY44Tf1dhO5TQzL+p5rju5F5TllyfuAG2ct+7xp
 bgFXDGIdFCsYHLh1p7MKoMrvBx8hF0hSr7QVb+Eb6c5V2MIOuqPeI/Jkd
 KIi/515jOB+YVfvwRjJuci6ovqpLsoV8bfM8LH/uXMrBK/l9Zzs+WIk1E
 Ey/BZilvQu6YCpWdy+BJWvyWvcGqiJc4KaUVNkEWqzzj+ZhcgUZCOwwjX
 OyNhHjRMehMhoEa2aS53qBou9sMSlY0fDWPVrP3foYC/Pxnu6jQCuC9re
 b52SGF5YlHWKV/bjryT3ZIEJtwWg6ZybSbwbP8X73Qkh1Pl5S/EqiAGsK A==;
X-CSE-ConnectionGUID: A2nD7/w2S8qx7F13KCMRFw==
X-CSE-MsgGUID: P+NLG/GgTziDNGuXSdU4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085143"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:47 -0700
X-CSE-ConnectionGUID: 0hkYSnYzToepDGjULL1DDw==
X-CSE-MsgGUID: bX5ANS88Qf+6r2pnikqZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844407"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:44 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/15] drm/i915/pfit: Populate crtc_state->pfit.dst on GMCH
 platforms
Date: Mon, 19 Oct 2026 16:53:03 +0300
Message-ID: <20261019135309.23578-10-ville.syrjala@linux.intel.com>
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

Populate crtc_state->pfit.dst on GMCH platforms. Since
(unlike ILK+) we don't actually program the pfit window
coordinates to the hardware we need to compute the coordinates
based on the scaling factor the hardware will use (whether
that'll be the manually programmed thing on pre-i965 or
the automagic thing on i965+). As long as we do the computation
the same way .compute_config() and readout we'll get matching
results, which is important to the state checker.

Note that the automagic scaling factors on i965+ are slightly
weird in that only one of the scaling factors in the register
will read out correctly in the letterbox/pillabox modes. So
the readout will have to know which direction has the correct
information.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_crtc_state_dump.c  |  10 +-
 drivers/gpu/drm/i915/display/intel_pfit.c     | 231 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_pfit.h     |   2 +
 .../gpu/drm/i915/display/intel_pfit_regs.h    |   4 +-
 4 files changed, 184 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index f30d07bc6b07..9220c73d2f5e 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -355,11 +355,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   pipe_config->gmch_pfit.control,
 			   pipe_config->gmch_pfit.pgm_ratios,
 			   pipe_config->gmch_pfit.lvds_border_bits);
-	else
-		drm_printf(&p, "pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
-			   DRM_RECT_ARG(&pipe_config->pfit.dst),
-			   str_enabled_disabled(pipe_config->pfit.enabled),
-			   str_yes_no(pipe_config->pfit.force_thru));
+
+	drm_printf(&p, "pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
+		   DRM_RECT_ARG(&pipe_config->pfit.dst),
+		   str_enabled_disabled(pipe_config->pfit.enabled),
+		   str_yes_no(pipe_config->pfit.force_thru));
 
 	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
 		   pipe_config->pfit.casf.strength,
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 5d519f45adbe..63e5a656a33b 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -353,6 +353,35 @@ static u32 panel_fitter_scaling(u32 source, u32 target)
 	return DIV_ROUND_CLOSEST(source << 12, target);
 }
 
+static void i9xx_compute_pfit_dst(struct intel_crtc_state *crtc_state,
+				  u32 hscale, u32 vscale)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
+	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
+	int x, y, width, height;
+
+	/* don't explode if the hw state was gibberish */
+	if (hscale == 0)
+		hscale = 1 << 12;
+	if (vscale == 0)
+		vscale = 1 << 12;
+
+	width = DIV_ROUND_CLOSEST(pipe_src_w << 12, hscale);
+	height = DIV_ROUND_CLOSEST(pipe_src_h << 12, vscale);
+
+	width = min(width, adjusted_mode->crtc_hdisplay);
+	height = min(height, adjusted_mode->crtc_vdisplay);
+
+	x = DIV_ROUND_CLOSEST(adjusted_mode->crtc_hdisplay - width, 2);
+	y = DIV_ROUND_CLOSEST(adjusted_mode->crtc_vdisplay - height, 2);
+
+	crtc_state->pfit.enabled = true;
+
+	drm_rect_init(&crtc_state->pfit.dst, x, y, width, height);
+}
+
 static void i965_scale_aspect(struct intel_crtc_state *crtc_state,
 			      u32 *pfit_control)
 {
@@ -362,16 +391,54 @@ static void i965_scale_aspect(struct intel_crtc_state *crtc_state,
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
 	u32 scaled_width = adjusted_mode->crtc_hdisplay * pipe_src_h;
 	u32 scaled_height = pipe_src_w * adjusted_mode->crtc_vdisplay;
+	u32 hscale, vscale;
 
 	/* 965+ is easy, it does everything in hw */
-	if (scaled_width > scaled_height)
+	if (scaled_width > scaled_height) {
 		*pfit_control |= PFIT_ENABLE |
 			PFIT_SCALING_PILLAR;
-	else if (scaled_width < scaled_height)
+
+		vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+		hscale = vscale;
+
+		i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
+	} else if (scaled_width < scaled_height) {
 		*pfit_control |= PFIT_ENABLE |
 			PFIT_SCALING_LETTER;
-	else if (adjusted_mode->crtc_hdisplay != pipe_src_w)
+
+		hscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+		vscale = hscale;
+
+		i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
+	} else if (adjusted_mode->crtc_hdisplay != pipe_src_w) {
 		*pfit_control |= PFIT_ENABLE | PFIT_SCALING_AUTO;
+
+		hscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+		vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+
+		i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
+	}
+}
+
+static void i965_scale_fullscreen(struct intel_crtc_state *crtc_state,
+				  u32 *pfit_control)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
+	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
+	u32 hscale, vscale;
+
+	if (pipe_src_h == adjusted_mode->crtc_vdisplay &&
+	    pipe_src_w == adjusted_mode->crtc_hdisplay)
+		return;
+
+	*pfit_control |= PFIT_ENABLE | PFIT_SCALING_AUTO;
+
+	hscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+	vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+
+	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 }
 
 static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
@@ -383,7 +450,7 @@ static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
 	u32 scaled_width = adjusted_mode->crtc_hdisplay * pipe_src_h;
 	u32 scaled_height = pipe_src_w * adjusted_mode->crtc_vdisplay;
-	u32 bits;
+	u32 hscale, vscale;
 
 	/*
 	 * For earlier chips we have to calculate the scaling
@@ -396,14 +463,16 @@ static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
 
 		*border = LVDS_BORDER_ENABLE;
 		if (pipe_src_h != adjusted_mode->crtc_vdisplay) {
-			bits = panel_fitter_scaling(pipe_src_h,
-						    adjusted_mode->crtc_vdisplay);
+			vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+			hscale = vscale;
 
-			*pfit_pgm_ratios |= (PFIT_HORIZ_SCALE(bits) |
-					     PFIT_VERT_SCALE(bits));
+			*pfit_pgm_ratios |= (PFIT_HORIZ_SCALE(hscale) |
+					     PFIT_VERT_SCALE(vscale));
 			*pfit_control |= (PFIT_ENABLE |
 					  PFIT_VERT_INTERP_BILINEAR |
 					  PFIT_HORIZ_INTERP_BILINEAR);
+
+			i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 		}
 	} else if (scaled_width < scaled_height) { /* letter */
 		centre_vertically(adjusted_mode,
@@ -411,14 +480,16 @@ static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
 
 		*border = LVDS_BORDER_ENABLE;
 		if (pipe_src_w != adjusted_mode->crtc_hdisplay) {
-			bits = panel_fitter_scaling(pipe_src_w,
-						    adjusted_mode->crtc_hdisplay);
+			vscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+			hscale = vscale;
 
-			*pfit_pgm_ratios |= (PFIT_HORIZ_SCALE(bits) |
-					     PFIT_VERT_SCALE(bits));
+			*pfit_pgm_ratios |= (PFIT_HORIZ_SCALE(hscale) |
+					     PFIT_VERT_SCALE(vscale));
 			*pfit_control |= (PFIT_ENABLE |
 					  PFIT_VERT_INTERP_BILINEAR |
 					  PFIT_HORIZ_INTERP_BILINEAR);
+
+			i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 		}
 	} else {
 		/* Aspects match, Let hw scale both directions */
@@ -427,9 +498,40 @@ static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
 				  PFIT_HORIZ_AUTO_SCALE |
 				  PFIT_VERT_INTERP_BILINEAR |
 				  PFIT_HORIZ_INTERP_BILINEAR);
+
+		hscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+		vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+
+		i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 	}
 }
 
+static void i9xx_scale_fullscreen(struct intel_crtc_state *crtc_state,
+				  u32 *pfit_control, u32 *pfit_pgm_ratios,
+				  u32 *border)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
+	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
+	u32 hscale, vscale;
+
+	if (pipe_src_h == adjusted_mode->crtc_vdisplay &&
+	    pipe_src_w == adjusted_mode->crtc_hdisplay)
+		return;
+
+	*pfit_control |= (PFIT_ENABLE |
+			  PFIT_VERT_AUTO_SCALE |
+			  PFIT_HORIZ_AUTO_SCALE |
+			  PFIT_VERT_INTERP_BILINEAR |
+			  PFIT_HORIZ_INTERP_BILINEAR);
+
+	hscale = panel_fitter_scaling(pipe_src_w, adjusted_mode->crtc_hdisplay);
+	vscale = panel_fitter_scaling(pipe_src_h, adjusted_mode->crtc_vdisplay);
+
+	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
+}
+
 static int i9xx_pfit_check_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -478,27 +580,18 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
 	    adjusted_mode->crtc_vdisplay == pipe_src_h)
 		goto out;
 
-	/*
-	 * TODO: implement downscaling for i965+. Need to account
-	 * for downscaling in intel_crtc_compute_pixel_rate().
-	 */
-	if (adjusted_mode->crtc_hdisplay < pipe_src_w) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] pfit horizontal downscaling (%d->%d) not supported\n",
-			    crtc->base.base.id, crtc->base.name,
-			    pipe_src_w, adjusted_mode->crtc_hdisplay);
-		return -EINVAL;
-	}
-	if (adjusted_mode->crtc_vdisplay < pipe_src_h) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] pfit vertical downscaling (%d->%d) not supported\n",
-			    crtc->base.base.id, crtc->base.name,
-			    pipe_src_h, adjusted_mode->crtc_vdisplay);
-		return -EINVAL;
-	}
-
 	switch (conn_state->scaling_mode) {
 	case DRM_MODE_SCALE_CENTER:
+		if (adjusted_mode->crtc_hdisplay < pipe_src_w ||
+		    adjusted_mode->crtc_vdisplay < pipe_src_h) {
+			drm_dbg_kms(display->drm,
+				    "[CRTC:%d:%s] pfit center mode source (%dx%d) exceeds display (%dx%d)\n",
+				    crtc->base.base.id, crtc->base.name,
+				    pipe_src_w, pipe_src_h,
+				    adjusted_mode->crtc_hdisplay,
+				    adjusted_mode->crtc_vdisplay);
+			return -EINVAL;
+		}
 		/*
 		 * For centered modes, we have to calculate border widths &
 		 * heights and modify the values programmed into the CRTC.
@@ -516,21 +609,11 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
 					  &pfit_pgm_ratios, &border);
 		break;
 	case DRM_MODE_SCALE_FULLSCREEN:
-		/*
-		 * Full scaling, even if it changes the aspect ratio.
-		 * Fortunately this is all done for us in hw.
-		 */
-		if (pipe_src_h != adjusted_mode->crtc_vdisplay ||
-		    pipe_src_w != adjusted_mode->crtc_hdisplay) {
-			pfit_control |= PFIT_ENABLE;
-			if (DISPLAY_VER(display) >= 4)
-				pfit_control |= PFIT_SCALING_AUTO;
-			else
-				pfit_control |= (PFIT_VERT_AUTO_SCALE |
-						 PFIT_VERT_INTERP_BILINEAR |
-						 PFIT_HORIZ_AUTO_SCALE |
-						 PFIT_HORIZ_INTERP_BILINEAR);
-		}
+		if (DISPLAY_VER(display) >= 4)
+			i965_scale_fullscreen(crtc_state, &pfit_control);
+		else
+			i9xx_scale_fullscreen(crtc_state, &pfit_control,
+					      &pfit_pgm_ratios, &border);
 		break;
 	default:
 		MISSING_CASE(conn_state->scaling_mode);
@@ -716,19 +799,39 @@ static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 hscale, vscale, control, ratios;
 	enum pipe pipe;
-	u32 tmp;
 
-	tmp = intel_de_read(display, PFIT_CONTROL(display));
-	if (!(tmp & PFIT_ENABLE))
+	control = intel_de_read(display, PFIT_CONTROL(display));
+	if (!(control & PFIT_ENABLE))
 		return;
 
 	/* Check whether the pfit is attached to our pipe. */
-	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
+	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, control);
 	if (pipe != crtc->pipe)
 		return;
 
-	crtc_state->gmch_pfit.control = tmp;
+	crtc_state->gmch_pfit.control = control;
+
+	ratios = intel_de_read(display, PFIT_PGM_RATIOS(display));
+
+	switch (control & PFIT_SCALING_MASK) {
+	case PFIT_SCALING_LETTER:
+		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
+		vscale = hscale; /* PFIT_VERT_SCALE_MASK_965 contains garbage */
+		break;
+	case PFIT_SCALING_PILLAR:
+		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
+		hscale = vscale; /* PFIT_HORIZ_SCALE_MASK_965 contains garbage */
+		break;
+	case PFIT_SCALING_AUTO:
+	case PFIT_SCALING_PROGRAMMED:
+		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
+		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
+		break;
+	}
+
+	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 }
 
 static bool i9xx_has_pfit(struct intel_crtc *crtc)
@@ -748,18 +851,32 @@ static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	u32 tmp;
+	u32 hscale, vscale, control, ratios;
 
 	if (!i9xx_has_pfit(crtc))
 		return;
 
-	tmp = intel_de_read(display, PFIT_CONTROL(display));
-	if (!(tmp & PFIT_ENABLE))
+	control = intel_de_read(display, PFIT_CONTROL(display));
+	if (!(control & PFIT_ENABLE))
 		return;
 
-	crtc_state->gmch_pfit.control = tmp;
-	crtc_state->gmch_pfit.pgm_ratios =
-		intel_de_read(display, PFIT_PGM_RATIOS(display));
+	crtc_state->gmch_pfit.control = control;
+
+	ratios = intel_de_read(display, PFIT_AUTO_RATIOS(display));
+	if (control & PFIT_HORIZ_AUTO_SCALE)
+		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK, ratios);
+	if (control & PFIT_VERT_AUTO_SCALE)
+		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK, ratios);
+
+	ratios = intel_de_read(display, PFIT_PGM_RATIOS(display));
+	if ((control & PFIT_HORIZ_AUTO_SCALE) == 0)
+		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK, ratios);
+	if ((control & PFIT_VERT_AUTO_SCALE) == 0)
+		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK, ratios);
+
+	crtc_state->gmch_pfit.pgm_ratios = ratios;
+
+	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 }
 
 void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.h b/drivers/gpu/drm/i915/display/intel_pfit.h
index 184e1932eae5..f1162b37d407 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.h
+++ b/drivers/gpu/drm/i915/display/intel_pfit.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_PFIT_H__
 #define __INTEL_PFIT_H__
 
+#include <linux/types.h>
+
 enum drm_mode_status;
 struct drm_display_mode;
 struct drm_connector_state;
diff --git a/drivers/gpu/drm/i915/display/intel_pfit_regs.h b/drivers/gpu/drm/i915/display/intel_pfit_regs.h
index add8ce28004e..a83ac3b20ca3 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_pfit_regs.h
@@ -34,9 +34,11 @@
 #define   PFIT_HORIZ_SCALE_MASK		REG_GENMASK(15, 4) /* pre-965 */
 #define   PFIT_HORIZ_SCALE(x)		REG_FIELD_PREP(PFIT_HORIZ_SCALE_MASK, (x))
 #define   PFIT_VERT_SCALE_MASK_965	REG_GENMASK(28, 16) /* 965+ */
+#define   PFIT_VERT_SCALE_965(x)	REG_FIELD_PREP(PFIT_VERT_SCALE_MASK_965, (x))
 #define   PFIT_HORIZ_SCALE_MASK_965	REG_GENMASK(12, 0) /* 965+ */
+#define   PFIT_HORIZ_SCALE_965(x)	REG_FIELD_PREP(PFIT_HORIZ_SCALE_MASK_965, (x))
 
-#define PFIT_AUTO_RATIOS(dev_priv) _MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61238)
+#define PFIT_AUTO_RATIOS(dev_priv) _MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61238) /* pre-965 */
 
 /* CPU panel fitter */
 /* IVB+ has 3 fitters, 0 is 7x5 capable, the other two only 3x3 */
-- 
2.55.0

