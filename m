Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2F10A3D80
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 12:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B799B10E9CD;
	Thu, 26 Mar 2026 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgRaRxuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739BA10E9C9;
 Thu, 26 Mar 2026 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774526646; x=1806062646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=st+oW/ouZaRofclx9GCEVb3SIKz25UC5oLv8s2U65dk=;
 b=YgRaRxuHEQb1veCtk0/OJ0i6tUwQo+/m8ll+5iypz7PKdExY2/qSBlpi
 aoMnEivctb0BIiLHSbrDIt+T0cfZI25pMjxQBm6khHC+gXC154YwAo1OG
 rOYAbLh4Z3HeTLER0Q4tbdDq0Y2GHj4Ilh00dOes8Kfwu8IqB8A4reuLc
 6sbyOO1thVFs8CqKzPwHC7gq+6PbQSZvMNhfopR6O65HlryckXtlL+uPG
 wFx5dtIuArlBSPYKOyUkVKF9wRQlc2B5TOPKsk3Q6iN3MkulBMo50ugSt
 CRfzRkjibhFSGxuKC8J0VjxWfuqBoHKo/bcpGVHcDwR5XF8X8Sh5UaHi7 g==;
X-CSE-ConnectionGUID: 0lUfXLhaSpCBosFZZuAROg==
X-CSE-MsgGUID: u5i9DXrWR6aFaxCGw3vwOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86960541"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86960541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:04:06 -0700
X-CSE-ConnectionGUID: 9xDC4AmhSO+MBzfFkZBN/g==
X-CSE-MsgGUID: HTAS04XiQoyqjy5NC8ui2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224999443"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa008.jf.intel.com with ESMTP; 26 Mar 2026 05:04:05 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/3] drm/i915/display: Introduce skl_pipe_scaler_setup()
Date: Thu, 26 Mar 2026 17:30:28 +0530
Message-Id: <20260326120029.3409676-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260326120029.3409676-1-nemesa.garg@intel.com>
References: <20260326120029.3409676-1-nemesa.garg@intel.com>
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

As skl_pfit_enable and skl_scaler_setup_casf have similar logic for pipe
scaler registers so to avoid duplication introduce new helper
skl_pipe_scaler_setup. This helper consolidates common scaler setup
steps and is now called from both skl_pfit_enable() and
skl_scaler_setup_casf().

v2: Modify scaler_get_filter_select for casf.[Ankit]
    Modify commit message. [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 86 +++++++++++------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7c5cb188ebf0..6de4be353402 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -725,9 +725,16 @@ static void glk_program_nearest_filter_coefs(struct intel_display *display,
 			   GLK_PS_COEF_INDEX_SET(pipe, id, set), 0);
 }
 
-static u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter)
+static u32 skl_scaler_get_filter_select(const struct intel_crtc_state *crtc_state)
 {
-	if (filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR)
+	if (crtc_state->hw.casf_params.casf_enable)
+		return (PS_FILTER_PROGRAMMED |
+			PS_Y_VERT_FILTER_SELECT(0) |
+			PS_Y_HORZ_FILTER_SELECT(0) |
+			PS_UV_VERT_FILTER_SELECT(0) |
+			PS_UV_HORZ_FILTER_SELECT(0));
+
+	if (crtc_state->hw.scaling_filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR)
 		return (PS_FILTER_PROGRAMMED |
 			PS_Y_VERT_FILTER_SELECT(0) |
 			PS_Y_HORZ_FILTER_SELECT(0) |
@@ -752,48 +759,52 @@ static void skl_scaler_setup_filter(struct intel_display *display,
 	}
 }
 
-#define CASF_SCALER_FILTER_SELECT \
-	(PS_FILTER_PROGRAMMED | \
-	PS_Y_VERT_FILTER_SELECT(0) | \
-	PS_Y_HORZ_FILTER_SELECT(0) | \
-	PS_UV_VERT_FILTER_SELECT(0) | \
-	PS_UV_HORZ_FILTER_SELECT(0))
-
-void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+static void skl_pipe_scaler_setup(const struct intel_crtc_state *crtc_state,
+				  int width, int height, int x, int y)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct intel_display *display = to_intel_display(crtc);
-	struct drm_display_mode *adjusted_mode =
-	&crtc_state->hw.adjusted_mode;
-	struct intel_crtc_scaler_state *scaler_state =
+	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
-	struct drm_rect src, dest;
-	int id, width, height;
-	int x = 0, y = 0;
 	enum pipe pipe = crtc->pipe;
+	int id;
 	u32 ps_ctrl;
 
-	width = adjusted_mode->crtc_hdisplay;
-	height = adjusted_mode->crtc_vdisplay;
-
-	drm_rect_init(&dest, x, y, width, height);
-
-	width = drm_rect_width(&dest);
-	height = drm_rect_height(&dest);
 	id = scaler_state->scaler_id;
 
-	drm_rect_init(&src, 0, 0,
-		      drm_rect_width(&crtc_state->pipe_src) << 16,
-		      drm_rect_height(&crtc_state->pipe_src) << 16);
+	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
+		  skl_scaler_get_filter_select(crtc_state);
 
 	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
 
-	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
-		  CASF_SCALER_FILTER_SELECT;
+	skl_scaler_setup_filter(display, NULL, pipe, id, 0,
+				crtc_state->hw.scaling_filter);
 
 	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
+
 	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
 			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
+}
+
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	const struct intel_crtc_scaler_state *scaler_state =
+				&crtc_state->scaler_state;
+	struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	enum pipe pipe = crtc->pipe;
+	int width, height, x = 0, y = 0;
+	int id;
+
+	width = adjusted_mode->crtc_hdisplay;
+	height = adjusted_mode->crtc_vdisplay;
+
+	id = scaler_state->scaler_id;
+
+	skl_pipe_scaler_setup(crtc_state, width, height, x, y);
+
 	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
 			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
 }
@@ -814,7 +825,6 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	int hscale, vscale;
 	struct drm_rect src;
 	int id;
-	u32 ps_ctrl;
 
 	if (!crtc_state->pch_pfit.enabled)
 		return;
@@ -836,24 +846,14 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	uv_rgb_hphase = skl_scaler_calc_phase(1, hscale, false);
 	uv_rgb_vphase = skl_scaler_calc_phase(1, vscale, false);
 
-	id = scaler_state->scaler_id;
-
-	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
-		skl_scaler_get_filter_select(crtc_state->hw.scaling_filter);
-
-	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
-
-	skl_scaler_setup_filter(display, NULL, pipe, id, 0,
-				crtc_state->hw.scaling_filter);
+	skl_pipe_scaler_setup(crtc_state, width, height, x, y);
 
-	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
+	id = scaler_state->scaler_id;
 
 	intel_de_write_fw(display, SKL_PS_VPHASE(pipe, id),
 			  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vphase));
 	intel_de_write_fw(display, SKL_PS_HPHASE(pipe, id),
 			  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_hphase));
-	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
-			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
 	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
 			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
 }
@@ -905,7 +905,7 @@ skl_program_plane_scaler(struct intel_dsb *dsb,
 	}
 
 	ps_ctrl = PS_SCALER_EN | PS_BINDING_PLANE(plane->id) | scaler->mode |
-		skl_scaler_get_filter_select(plane_state->hw.scaling_filter);
+		skl_scaler_get_filter_select(crtc_state);
 
 	trace_intel_plane_scaler_update_arm(plane, scaler_id,
 					    crtc_x, crtc_y, crtc_w, crtc_h);
-- 
2.25.1

