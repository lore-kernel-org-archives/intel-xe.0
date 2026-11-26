Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDE8606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYTP6YsU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8530B11235A;
	Thu, 26 Nov 2026 11:57:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744FA11235A;
 Thu, 26 Nov 2026 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795694226; x=1827230226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hABMqElQ5sn1s9n7PwDTTM2lQQnLvIl4fa9XTCh2fV0=;
 b=TYTP6YsU3MFaiiOWQT5KhfdiX1NPtEbv2ZET1aPeFrLEp0YrshWiSdCv
 RBuMBF6mVHx762u87c8yIb9miIrwqWumq0ukxdgZZiZ2ggV+RVnvuIics
 zsS4bjcwQECRxVsVt6uTCk5NkiQrZeIY+2doz8NSgalPtrKPnn2GdBw20
 RjhUS+qZi0PGu1wdwNPxra+DwbIpSGqqBOKHDxEK5hyz0dNa7BrMLcz+T
 6EIYmMZMNj2mzT52plCadvc9FKB5eHWcx83twuaCgLPStwAJrZ+ktjoXp
 xrTIpuDalsYFzNbgc7I0KzzV01LdCzhjZFUu1Ec37KkZiOjJVWHRx6f8H A==;
X-CSE-ConnectionGUID: ovNShZaURJiSUsjjrOfPOA==
X-CSE-MsgGUID: bfbd/lI7TniBD5/K2vWxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4527190"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4527190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:57:06 -0800
X-CSE-ConnectionGUID: CfeXG4sjRwabTXmeAx7mug==
X-CSE-MsgGUID: So38/QvsQfqwRjoZfa8r+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12183176"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 03:57:04 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 1/2] Revert "drm/i915/cdclk: Deal with 2 PPC hscale issues
 when calculating min CDCLK"
Date: Thu, 26 Nov 2026 17:48:26 +0530
Message-ID: <20261126121827.1951200-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126121827.1951200-1-uma.shankar@intel.com>
References: <20261126121827.1951200-1-uma.shankar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit f69946f6d891aca1614233573741543b3bab4e6a.

The empirical "double the entire fractional part of hscale and
multiply by vscale" formula overestimates the min CDCLK. Bspec now
documents the actual 2 PPC downscale formula, which will be
implemented in a follow-up patch.

Conflicts resolved against the later GMCH pfit rework: the shared
intel_crtc_compute_pixel_rate() now simply uses the pipe pixel rate
as the CDCLK pixel rate again. GMCH platforms are 1 PPC, so nothing
changes for them.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 27 +--------
 drivers/gpu/drm/i915/display/intel_plane.c    | 55 -------------------
 drivers/gpu/drm/i915/display/intel_plane.h    |  5 --
 .../drm/i915/display/skl_universal_plane.c    |  6 +-
 4 files changed, 4 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 19caae633d29..3235bcbbf054 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2283,30 +2283,6 @@ intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 				   pixel_rate);
 }
 
-static unsigned int
-intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
-{
-	struct intel_display *display = to_intel_display(crtc_state);
-	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
-	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
-	struct drm_rect src;
-
-	/*
-	 * We only use IF-ID interlacing. If we ever use
-	 * PF-ID we'll need to adjust the pixel_rate here.
-	 */
-
-	if (!crtc_state->pfit.enabled)
-		return pixel_rate;
-
-	drm_rect_init(&src, 0, 0,
-		      drm_rect_width(&crtc_state->pipe_src) << 16,
-		      drm_rect_height(&crtc_state->pipe_src) << 16);
-
-	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
-					 pixel_rate, ppc);
-}
-
 static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
 					 const struct drm_display_mode *timings)
 {
@@ -2332,8 +2308,7 @@ static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->pixel_rate =
 		intel_pipe_pixel_rate(crtc_state);
-	crtc_state->pixel_rate_cdclk =
-		intel_pipe_pixel_rate_cdclk(crtc_state);
+	crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
 }
 
 static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d23de0f34e4b..82dcb1d87b5e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -265,50 +265,6 @@ unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				dst_w * dst_h);
 }
 
-static unsigned int hscale_cdclk(const struct drm_rect *src,
-				 const struct drm_rect *dst,
-				 unsigned int ppc)
-{
-	unsigned int hscale;
-
-	hscale = drm_rect_calc_hscale(src, dst, 0, INT_MAX);
-	hscale = max(hscale, 0x10000);
-
-	/*
-	 * Double the fractional part due to some 2 PPC granularity issue
-	 *
-	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
-	 * and rounding it down to a unit fraction. In practice that is
-	 * not sufficient, and we need a more aggressive CDCLK bump in
-	 * many cases. The updated formula was derived empirically.
-	 * This may need to be updated once we have better undestading
-	 * of what's happening in the hardware...
-	 */
-	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
-}
-
-static unsigned int vscale_cdclk(const struct drm_rect *src,
-				 const struct drm_rect *dst)
-{
-	unsigned int vscale;
-
-	vscale = drm_rect_calc_vscale(src, dst, 0, INT_MAX);
-	vscale = max(vscale, 0x10000);
-
-	return vscale;
-}
-
-unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
-				       const struct drm_rect *dst,
-				       unsigned int rate,
-				       unsigned int ppc)
-{
-	unsigned int hscale = hscale_cdclk(src, dst, ppc);
-	unsigned int vscale = vscale_cdclk(src, dst);
-
-	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
-}
-
 unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				    const struct intel_plane_state *plane_state)
 {
@@ -329,17 +285,6 @@ unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				   crtc_state->pixel_rate);
 }
 
-unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
-					  const struct intel_plane_state *plane_state)
-{
-	struct intel_display *display = to_intel_display(crtc_state);
-	unsigned int ppc = HAS_2PPC(display) ? 2 : 1;
-
-	return intel_adjusted_rate_cdclk(&plane_state->uapi.src,
-					 &plane_state->uapi.dst,
-					 crtc_state->pixel_rate_cdclk, ppc);
-}
-
 unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state,
 				   int color_plane)
diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
index dba2be24aae2..31a6229aea73 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_plane.h
@@ -29,13 +29,8 @@ bool intel_plane_can_async_flip(struct intel_plane *plane,
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate);
-unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
-				       const struct drm_rect *dst,
-				       unsigned int rate, unsigned int ppc);
 unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 				    const struct intel_plane_state *plane_state);
-unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
-					  const struct intel_plane_state *plane_state);
 
 unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index def4798f8502..4cd868d11ad6 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -267,7 +267,7 @@ bool icl_is_hdr_plane(struct intel_display *display, enum plane_id plane_id)
 static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
 
 	/* two pixels per clock */
 	return DIV_ROUND_UP(pixel_rate, 2);
@@ -291,7 +291,7 @@ glk_plane_ratio(const struct intel_plane_state *plane_state,
 static int glk_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
 	unsigned int num, den;
 
 	glk_plane_ratio(plane_state, &num, &den);
@@ -318,7 +318,7 @@ skl_plane_ratio(const struct intel_plane_state *plane_state,
 static int skl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
-	unsigned int pixel_rate = intel_plane_pixel_rate_cdclk(crtc_state, plane_state);
+	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
 	unsigned int num, den;
 
 	skl_plane_ratio(plane_state, &num, &den);
-- 
2.50.1

