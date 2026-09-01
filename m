Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D1C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 12:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155D10EACE;
	Tue,  1 Sep 2026 12:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7ROL5kh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AE410ECBF;
 Tue,  1 Sep 2026 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788265593; x=1819801593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EGkfFGYd1lhFdaZQkeErV1s4+rnKyBc/EQbTyLxDdgA=;
 b=P7ROL5khx5g0ZIsHpVwugpcK8mNc2/DNfc1HgqUfPKu1D7+NDh3KPPuD
 LHjRO+vHiSr9jnoMMojE9zr7cXjaIib+IwSB160VOtwNTAGnjDmPHHJ9b
 WcK7nOKlCH7ZR1sRy95YE88aJdc3n5hXctkBFMmTPgCUzmS6hSWqkFGcs
 7fQJd1MhDNrBte49bqGlRntj/hkAKmCbmlEL1C0xot2P9CmZHPd9YjDy5
 SwGFZDdRHA9JjZ4h2f4Zd6RuVZNIH9Pp/QUoa+207xK4LuQgLrQoK9n6i
 S2rjFQvp3BHtCxELUhcPPOkZphtkdbX79sDRZ98m7nLQKKhEdPf+IK1ib Q==;
X-CSE-ConnectionGUID: rTKtL3seSKKdoKjZOxI0EA==
X-CSE-MsgGUID: cHDTXFnTTZe+ocWhOSbZNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106064562"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="106064562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 05:26:33 -0700
X-CSE-ConnectionGUID: VsOEuijlSRm/8eyWy00MRA==
X-CSE-MsgGUID: GYsvvWlXRtaRyvnOjLJYMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265368141"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 05:26:31 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: uma.shankar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [DO_NOT_REVIEW v2 1/2] drm/i915/color: Add color pipeline support for
 SDR planes
Date: Tue,  1 Sep 2026 17:32:53 +0530
Message-ID: <20260901120254.629261-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
References: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
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

This patch is a squashed version of series [1]

https://lore.kernel.org/intel-gfx/20260804123107.2256124-1-chaitanya.kumar.borah@intel.com/

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 76 +++++++++++++++----
 .../drm/i915/display/intel_color_pipeline.c   | 30 ++++++--
 .../drm/i915/display/intel_display_limits.h   |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_plane.c    | 53 ++++++++++++-
 .../drm/i915/display/skl_universal_plane.c    | 42 ++++++----
 6 files changed, 163 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 87ced9f6ff40..f1df0f9ba762 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3998,25 +3998,17 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 }
 
 static void
-xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
-				 const struct intel_plane_state *plane_state)
+xelpd_load_hdr_post_csc_lut(struct intel_display *display,
+			    struct intel_dsb *dsb,
+			    enum pipe pipe,
+			    enum plane_id plane,
+			    const struct drm_color_lut32 *post_csc_lut)
 {
-	struct intel_display *display = to_intel_display(plane_state);
-	const struct drm_plane_state *state = &plane_state->uapi;
-	enum pipe pipe = to_intel_plane(state->plane)->pipe;
-	enum plane_id plane = to_intel_plane(state->plane)->id;
-	const struct drm_color_lut32 *post_csc_lut = plane_state->hw.gamma_lut->data;
 	int i, lut_size = 32;
 	u32 lut_val;
 
-	if (!icl_is_hdr_plane(display, plane))
-		return;
-
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
 			   PLANE_PAL_PREC_AUTO_INCREMENT);
-	/* TODO: Add macro */
-	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
-			   PLANE_PAL_PREC_AUTO_INCREMENT);
 
 	for (i = 0; i < lut_size + 3; i++) {
 		if (post_csc_lut) {
@@ -4036,8 +4028,62 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 	}
 
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-	intel_de_write_dsb(display, dsb,
-			   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
+}
+
+static void
+xelpd_load_sdr_post_csc_lut(struct intel_display *display,
+			    struct intel_dsb *dsb,
+			    enum pipe pipe,
+			    enum plane_id plane,
+			    const struct drm_color_lut32 *post_csc_lut)
+{
+	int i, lut_size = 32;
+	u32 lut_val;
+
+	/*
+	 * First 3 planes are HDR, so reduce by 3 to get to the right
+	 * SDR plane offset
+	 */
+	plane = plane - 3;
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+	for (i = 0; i < lut_size + 3; i++) {
+		if (post_csc_lut) {
+			if (i < lut_size)
+				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 16);
+			/* else duplicate last lut_val */
+		} else {
+			if (i < lut_size)
+				lut_val = (i * ((1 << 16) - 1)) / (lut_size - 1);
+			else
+				lut_val = 1 << 16;
+		}
+
+		intel_de_write_dsb(display, dsb,
+				   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+				   lut_val);
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+}
+
+static void
+xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
+				 const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_plane_state *state = &plane_state->uapi;
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	const struct drm_color_lut32 *post_csc_lut = plane_state->hw.gamma_lut ?
+		plane_state->hw.gamma_lut->data : NULL;
+
+	if (icl_is_hdr_plane(display, plane))
+		xelpd_load_hdr_post_csc_lut(display, dsb, pipe, plane, post_csc_lut);
+	else
+		xelpd_load_sdr_post_csc_lut(display, dsb, pipe, plane, post_csc_lut);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 6cf8080ee800..38cfd6ed585d 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -43,6 +43,19 @@ static const enum intel_color_block hdr_plane_pipeline[] = {
 	INTEL_PLANE_CB_POST_CSC_LUT,
 };
 
+static const enum intel_color_block sdr_plane_yuv_pipeline[] = {
+	INTEL_PLANE_CB_CSC_FF,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+};
+
+static const u64 intel_plane_supported_csc_ff =
+		BIT(DRM_COLOROP_FM_YCBCR601_FULL_RGB) |
+		BIT(DRM_COLOROP_FM_YCBCR601_LIMITED_RGB) |
+		BIT(DRM_COLOROP_FM_YCBCR709_FULL_RGB) |
+		BIT(DRM_COLOROP_FM_YCBCR709_LIMITED_RGB) |
+		BIT(DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB) |
+		BIT(DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB);
+
 static bool plane_has_3dlut(struct intel_display *display, enum pipe pipe,
 			    struct drm_plane *plane)
 {
@@ -92,6 +105,12 @@ struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct drm_plane *p
 							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		break;
+	case INTEL_PLANE_CB_CSC_FF:
+		ret = drm_plane_colorop_fixed_matrix_init(dev, &colorop->base, plane,
+							  &intel_colorop_funcs,
+							  intel_plane_supported_csc_ff,
+							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		break;
 	default:
 		drm_err(plane->dev, "Invalid colorop id [%d]", id);
 		ret = -EINVAL;
@@ -126,9 +145,12 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	if (plane_has_3dlut(display, pipe, plane)) {
 		pipeline = xe3plpd_primary_plane_pipeline;
 		pipeline_len = ARRAY_SIZE(xe3plpd_primary_plane_pipeline);
-	} else {
+	} else if (icl_is_hdr_plane(display, to_intel_plane(plane)->id)) {
 		pipeline = hdr_plane_pipeline;
 		pipeline_len = ARRAY_SIZE(hdr_plane_pipeline);
+	} else {
+		pipeline = sdr_plane_yuv_pipeline;
+		pipeline_len = ARRAY_SIZE(sdr_plane_yuv_pipeline);
 	}
 
 	for (i = 0; i < pipeline_len; i++) {
@@ -155,17 +177,11 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
 int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 {
-	struct drm_device *dev = plane->dev;
-	struct intel_display *display = to_intel_display(dev);
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] = {};
 	int len = 0;
 	int ret = 0;
 	int i;
 
-	/* Currently expose pipeline only for HDR planes */
-	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
-		return 0;
-
 	/* Add pipeline consisting of transfer functions */
 	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index ea89473c177f..7ba7360c574e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -169,6 +169,7 @@ enum aux_ch {
 enum intel_color_block {
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_CSC_FF,
 	INTEL_PLANE_CB_POST_CSC_LUT,
 	INTEL_PLANE_CB_3DLUT,
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5f0fe18c0614..bc350f678857 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -683,6 +683,7 @@ struct intel_plane_state {
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
 		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut, *lut_3d;
+		bool csc_ff_enable;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d0f99a87c42e..25ca049009ef 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -462,6 +462,42 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
 	return false;
 }
 
+static u32
+fixedmatrix_colorop_to_encoding(enum drm_colorop_fixed_matrix_type fm_type)
+{
+	switch (fm_type) {
+	case DRM_COLOROP_FM_YCBCR709_FULL_RGB:
+	case DRM_COLOROP_FM_YCBCR709_LIMITED_RGB:
+		return DRM_COLOR_YCBCR_BT709;
+
+	case DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB:
+	case DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB:
+		return DRM_COLOR_YCBCR_BT2020;
+
+	case DRM_COLOROP_FM_YCBCR601_FULL_RGB:
+	case DRM_COLOROP_FM_YCBCR601_LIMITED_RGB:
+	default:
+		return DRM_COLOR_YCBCR_BT601;
+	}
+}
+
+static u32
+fixedmatrix_colorop_to_range(enum drm_colorop_fixed_matrix_type fm_type)
+{
+	switch (fm_type) {
+	case DRM_COLOROP_FM_YCBCR601_FULL_RGB:
+	case DRM_COLOROP_FM_YCBCR709_FULL_RGB:
+	case DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB:
+		return DRM_COLOR_YCBCR_FULL_RANGE;
+
+	case DRM_COLOROP_FM_YCBCR601_LIMITED_RGB:
+	case DRM_COLOROP_FM_YCBCR709_LIMITED_RGB:
+	case DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB:
+	default:
+		return DRM_COLOR_YCBCR_LIMITED_RANGE;
+	}
+}
+
 static void
 intel_plane_color_copy_uapi_to_hw_state(struct intel_atomic_state *state,
 					struct intel_plane_state *plane_state,
@@ -474,6 +510,7 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_atomic_state *state,
 	struct drm_property_blob *blob;
 	struct intel_crtc_state *new_crtc_state = state ?
 		intel_atomic_get_new_crtc_state(state, crtc) : NULL;
+	enum drm_colorop_fixed_matrix_type fm_type;
 	bool changed = false;
 	int i = 0;
 
@@ -485,11 +522,23 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_atomic_state *state,
 	while (iter_colorop) {
 		for_each_new_colorop_in_state(&state->base, colorop, new_colorop_state, i) {
 			if (new_colorop_state->colorop == iter_colorop) {
-				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
 				intel_colorop = to_intel_colorop(colorop);
-				changed |= intel_plane_colorop_replace_blob(plane_state,
+				if (intel_colorop->id == INTEL_PLANE_CB_CSC_FF) {
+					fm_type = new_colorop_state->fixed_matrix_type;
+
+					plane_state->hw.csc_ff_enable =
+						!new_colorop_state->bypass;
+					plane_state->hw.color_encoding =
+						fixedmatrix_colorop_to_encoding(fm_type);
+					plane_state->hw.color_range =
+						fixedmatrix_colorop_to_range(fm_type);
+				} else {
+					blob = new_colorop_state->bypass ?
+						NULL : new_colorop_state->data;
+					changed |= intel_plane_colorop_replace_blob(plane_state,
 									    intel_colorop,
 									    blob);
+				}
 			}
 		}
 		iter_colorop = iter_colorop->next;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 5cda1ab90e40..0f604bdb4c62 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1245,37 +1245,47 @@ static u32 glk_plane_color_ctl_crtc(const struct intel_crtc_state *crtc_state)
 	return plane_color_ctl;
 }
 
-static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
+static u32 glk_plane_color_ctl_input_csc(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	u32 plane_color_ctl = 0;
+	bool color_pipeline = !!plane_state->uapi.color_pipeline;
+	bool needs_csc = color_pipeline ? plane_state->hw.csc_ff_enable : fb->format->is_yuv;
+	u32 ctl = 0;
 
-	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
-	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
+	if (!needs_csc)
+		return 0;
 
-	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
+	if (!icl_is_hdr_plane(display, plane->id)) {
 		switch (plane_state->hw.color_encoding) {
 		case DRM_COLOR_YCBCR_BT709:
-			plane_color_ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
 			break;
 		case DRM_COLOR_YCBCR_BT2020:
-			plane_color_ctl |=
-				PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
 			break;
 		default:
-			plane_color_ctl |=
-				PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
 		}
-		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
-			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
-	} else if (fb->format->is_yuv) {
-		plane_color_ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
-		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
-			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
+	} else {
+		ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
 	}
 
+	if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
+		ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
+
+	return ctl;
+}
+
+static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
+{
+	u32 plane_color_ctl = 0;
+
+	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
+	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
+	plane_color_ctl |= glk_plane_color_ctl_input_csc(plane_state);
+
 	if (plane_state->force_black)
 		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
 
-- 
2.50.1

