Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFFFCD98F6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 18:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922F510F3A1;
	Thu, 18 Jun 2026 18:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjZRr/sC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F72010F39B;
 Thu, 18 Jun 2026 18:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781807143; x=1813343143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHj8+yQzgAFMxn9l1v+qUrzM94pM7w7A0Dt/GyzNd2s=;
 b=fjZRr/sCJ2M22pnq6HRpchChqTcLgM2x1Hx+v+XzL//SqOZeWbPDx5OJ
 vGs9NLtPHK8TgNTNcbLsYcp3te65SXORu3JfbAFTGICKcEkMChrRUxWy5
 U4+VIewmGM+7+SotclTB0R2dfx/Ja5DqT6Nts1XUPIxUZPeUGmpGBi8aq
 k9Bo6ZBnwwT2NHMT/wxdcUJ+LgSctMnejXV3La9/MGp7MLmfE64CFANwt
 0HQdGGXuP3Zia47LQLr36Pj1kBXrnjMzOFMH6anzNAEb5aRDazD0IsYVP
 mJaFwOHDIv70eZsVBoZ3v7vcPC7WZMRU2XoL8Q3xshMGfmH6YRwHXjDjU Q==;
X-CSE-ConnectionGUID: 9UCXjKLUT/mlSMRDiSngZA==
X-CSE-MsgGUID: zZ/3+2htS5ebKtnNlw6STQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94044666"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="94044666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:25:26 -0700
X-CSE-ConnectionGUID: cwsy0vIhQZWz5DY99MnBLg==
X-CSE-MsgGUID: imwp+oxGRTOEbJaoIE+d7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="244273881"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2026 11:25:24 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] [RFC]: drm/i915/display: Fix NV12 ceiling division for
 bigjoiner case
Date: Thu, 18 Jun 2026 23:48:37 +0530
Message-ID: <20260618181837.687302-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

Commit 16df4cc63c58 ("drm/i915/display: Use ceiling division for NV12
UV surface offset calculation") computes the UV (chroma) surface
start/size as ceiling(half of Y plane start/size) directly from the
U16.16 fixed-point source rectangle:

        x = fp_16_16_to_int_ceil(fp_16_16_div2(src.x1));

For a single pipe the source coordinates are integers, so this is
correct.
(UV start = ceiling(half of Y plane start)).

With bigjoiner + a plane scaler the picture changes. The pipe boundary
is a fixed integer destination pixel, but the plane's position and the
scaler ratio are arbitrary, so drm_rect_clip_scaled() maps the seam back
to a *fractional* per-pipe source. For a 1280->2407 upscaled NV12 plane
crossing the seam:

        master src: width = 1204 * 1280/2407 = 640.265899, x1 = 0
        joiner src: width = 1203 * 1280/2407 = 639.734115, x1 = 640.265884

The luma path floors this to an integer (src.x1 >> 16 = 640), but the
UV path takes ceiling(640.265884 / 2) = ceil(320.13) = 321. The Y plane
then starts at column 640 while the UV plane starts at 321*2 = 642,
pushing the chroma read one column past the 640-wide chroma surface on
the joiner secondary:

        [CRTC:382:pipe C] PLANE ATS fault
        [CRTC:382:pipe C][PLANE:267:plane 1C] fault (CTL=0x81009400, ...)

The spec "Y plane start" is the integer pixel the luma surface actually
programs (640), not the pre-floor fixed-point value (640.27). Convert
the Y plane start/size to integer first - matching skl_check_main_surface()
- and then apply the ceiling. This is a no-op for the integer (non-joiner)
case and yields the correct, in-bounds chroma offset for the fractional
joiner seam:

                     before fix      after fix
        master 1B:   x=0  w=321      x=0   w=320   -> [0, 320)
        slave  1C:   x=321 w=320     x=320 w=320   -> [320, 640)

The two halves now tile the 640-wide chroma plane exactly and the ATS
fault is gone.

Assisted-by: GitHub-Copilot:Claude-Opus-4.8
Fixes: 16df4cc63c58 ("drm/i915/display: Use ceiling division for NV12 UV surface offset calculation")
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 33 ++++++++-----------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ad4bfff6903d..164b7d61c9a3 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2126,19 +2126,6 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	return 0;
 }
 
-
-/* Divide a U16.16 fixed-point value by 2, staying in fixed-point domain */
-static inline u32 fp_16_16_div2(u32 fp)
-{
-	return fp >> 1;
-}
-
-/* Convert a U16.16 fixed-point value to integer, rounding up */
-static inline int fp_16_16_to_int_ceil(u32 fp)
-{
-	return DIV_ROUND_UP(fp, 1 << 16);
-}
-
 static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
@@ -2154,14 +2141,20 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
 
 	/*
-	 * LNL+ UV surface start/size =
-	 * ceiling(half of Y plane start/size). Use ceiling division
-	 * unconditionally; it is a no-op for even values.
+	 * UV (chroma) start/size = ceiling(half of the *integer* Y plane
+	 * start/size), i.e. the value the luma surface programs (src >> 16),
+	 * not the raw U16.16. A bigjoiner seam mapped through the scaler can
+	 * give a fractional luma src; ceiling that directly would round the
+	 * chroma one column too far and read past the chroma surface.
 	 */
-	int x = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.x1));
-	int y = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.y1));
-	int w = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_width(&plane_state->uapi.src)));
-	int h = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_height(&plane_state->uapi.src)));
+	int luma_x = plane_state->uapi.src.x1 >> 16;
+	int luma_y = plane_state->uapi.src.y1 >> 16;
+	int luma_w = drm_rect_width(&plane_state->uapi.src) >> 16;
+	int luma_h = drm_rect_height(&plane_state->uapi.src) >> 16;
+	int x = DIV_ROUND_UP(luma_x, 2);
+	int y = DIV_ROUND_UP(luma_y, 2);
+	int w = DIV_ROUND_UP(luma_x + luma_w, 2) - x;
+	int h = DIV_ROUND_UP(luma_y + luma_h, 2) - y;
 	u32 offset;
 
 	/* FIXME not quite sure how/if these apply to the chroma plane */
-- 
2.45.2

