Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3177606A329
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kN2qHkSO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B737112398;
	Thu, 26 Nov 2026 11:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A0E112392;
 Thu, 26 Nov 2026 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795694227; x=1827230227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VoKzoNnr0yENs1A86qL/e8vcLkZcY3jTOI2nOJb+jsk=;
 b=kN2qHkSOjRLjqlcCLKJprMUnHaNPo4/Nc8Zo5kYNOrOKU9El4x/YbovX
 gVZwxwptgt9C1GYyYa9V2xvP52+btL8/lokygSl6VweTwAiOZGLEsVFLL
 Wmxnqz+liMHfdfhukaPELvx1RNFws2nG63v3qzjl3QgxhQ5d8Ou+Wfa/t
 m8WrqKYRdtzsRse97Sa/25CNo6MczWxrY1G6q8MkWqruwGmi2onvuvoCD
 UVnvLHzCDt338BDaAuSqQ1wtXxrallpR+5/K0SzC3lKyAmNGm3prOSLZD
 Nm/rwIYNmaESBaZ2m8857CeIzxVuGLa/TaWJpM5JzGo07Xg+b9VU/pQhr w==;
X-CSE-ConnectionGUID: daKKkg9qSTeY7TC0kjoeww==
X-CSE-MsgGUID: KK5zjS0BSqKqEm+l3gUaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4527196"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4527196"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:57:07 -0800
X-CSE-ConnectionGUID: y7zSYhDnR4uRXv+HqEq81Q==
X-CSE-MsgGUID: 3T5FlU20Qc+yTFj5AanINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12183188"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 03:57:05 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 2/2] drm/i915/cdclk: Account for 2 PPC horizontal downscale
 inefficiency in min CDCLK
Date: Thu, 26 Nov 2026 17:48:27 +0530
Message-ID: <20261126121827.1951200-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126121827.1951200-1-uma.shankar@intel.com>
References: <20261126121827.1951200-1-uma.shankar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The horizontal scaler filter works at 2 PPC, but still needs a full
clock for a fractional shift of just one pixel. It doesn't shift by
two pixels and re-align the taps, so the extra clock doesn't average
out. Without accounting for this, CDCLK may end up too low for certain
horizontal downscale factors, which leads to underruns.

Implement the Bspec formula for the downscale amount, used for both
plane and pipe scalers when computing the min CDCLK:

  hscale_ppc = int(hscale) + min(1, ppc * frac(hscale))
  downscale  = max(hscale_ppc, hscale * vscale)

The fractional penalty is capped at one extra clock, and since the
scaler filters vertically first, it does not multiply with the
vertical downscale factor.

Platforms without 2 PPC (ppc == 1) are unaffected as the formula then
reduces to hscale * vscale.

Bspec: 68858
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 27 ++++++++++-
 drivers/gpu/drm/i915/display/intel_plane.c    | 45 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_plane.h    |  5 +++
 .../drm/i915/display/skl_universal_plane.c    |  6 +--
 4 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3235bcbbf054..19caae633d29 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2283,6 +2283,30 @@ intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 				   pixel_rate);
 }
 
+static unsigned int
+intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
+	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
+	struct drm_rect src;
+
+	/*
+	 * We only use IF-ID interlacing. If we ever use
+	 * PF-ID we'll need to adjust the pixel_rate here.
+	 */
+
+	if (!crtc_state->pfit.enabled)
+		return pixel_rate;
+
+	drm_rect_init(&src, 0, 0,
+		      drm_rect_width(&crtc_state->pipe_src) << 16,
+		      drm_rect_height(&crtc_state->pipe_src) << 16);
+
+	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
+					 pixel_rate, ppc);
+}
+
 static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
 					 const struct drm_display_mode *timings)
 {
@@ -2308,7 +2332,8 @@ static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->pixel_rate =
 		intel_pipe_pixel_rate(crtc_state);
-	crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
+	crtc_state->pixel_rate_cdclk =
+		intel_pipe_pixel_rate_cdclk(crtc_state);
 }
 
 static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 82dcb1d87b5e..16d653e3739e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -265,6 +265,40 @@ unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				dst_w * dst_h);
 }
 
+/*
+ * Bspec: 68858
+ *
+ * The horizontal filter works at 2 PPC but still needs a full clock
+ * for a fractional shift of just 1 pixel, so the fractional part of
+ * the horizontal downscale factor costs PPC times more (but at most
+ * one full extra clock). The scaler filters vertically first, so this
+ * inefficiency does not multiply with the vertical downscale factor:
+ *
+ * hscale_ppc = int(hscale) + min(1, ppc * frac(hscale))
+ * scale = max(hscale_ppc, hscale * vscale)
+ */
+unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
+				       const struct drm_rect *dst,
+				       unsigned int rate,
+				       unsigned int ppc)
+{
+	unsigned int hscale, vscale, hscale_ppc;
+	u64 scale;
+
+	hscale = drm_rect_calc_hscale(src, dst, 0, INT_MAX);
+	hscale = max(hscale, 0x10000);
+
+	vscale = drm_rect_calc_vscale(src, dst, 0, INT_MAX);
+	vscale = max(vscale, 0x10000);
+
+	hscale_ppc = (hscale & ~0xffff) + min(ppc * (hscale & 0xffff), 0x10000);
+
+	/* .32 fixed point */
+	scale = max((u64)hscale_ppc << 16, mul_u32_u32(hscale, vscale));
+
+	return DIV64_U64_ROUND_UP(rate * scale, 1ull << 32);
+}
+
 unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				    const struct intel_plane_state *plane_state)
 {
@@ -285,6 +319,17 @@ unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				   crtc_state->pixel_rate);
 }
 
+unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
+					  const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
+
+	return intel_adjusted_rate_cdclk(&plane_state->uapi.src,
+					 &plane_state->uapi.dst,
+					 crtc_state->pixel_rate_cdclk, ppc);
+}
+
 unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state,
 				   int color_plane)
diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
index 31a6229aea73..dba2be24aae2 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_plane.h
@@ -29,8 +29,13 @@ bool intel_plane_can_async_flip(struct intel_plane *plane,
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate);
+unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
+				       const struct drm_rect *dst,
+				       unsigned int rate, unsigned int ppc);
 unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				    const struct intel_plane_state *plane_state);
+unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
+					  const struct intel_plane_state *plane_state);
 
 unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4cd868d11ad6..def4798f8502 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -267,7 +267,7 @@ bool icl_is_hdr_plane(struct intel_display *display, enum plane_id plane_id)
 static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
 
 	/* two pixels per clock */
 	return DIV_ROUND_UP(pixel_rate, 2);
@@ -291,7 +291,7 @@ glk_plane_ratio(const struct intel_plane_state *plane_state,
 static int glk_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
 	unsigned int num, den;
 
 	glk_plane_ratio(plane_state, &num, &den);
@@ -318,7 +318,7 @@ skl_plane_ratio(const struct intel_plane_state *plane_state,
 static int skl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
 	unsigned int num, den;
 
 	skl_plane_ratio(plane_state, &num, &den);
-- 
2.50.1

