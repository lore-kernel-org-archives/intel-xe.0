Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE46CD98EE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 05:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DAE10EDEB;
	Wed, 17 Jun 2026 05:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+wb1Un1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2F710EDEB;
 Wed, 17 Jun 2026 05:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781672977; x=1813208977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pvqD/LwyyT6DdEXrOSjkO6U5xoVebvxsqKnOIH30l4M=;
 b=S+wb1Un1V0FwnA54+jCiOwHSDDwzLXb4qNQGHZpFc09B6QaTnSfHueY4
 DpXCadqmV0Zs+d66sxEcojsjDRFiHm2Zfchm7/+fdCxpgFOhKCMqO+KI5
 Sa/m9qy8lgt2tTwUPfE0vPxKxNEgN9wdx+MPd9fJAP/NOuGLVTRHxvu7R
 efQmojiB2ar3Zoq9zaUp1ytg+4/dKYcjYrL6wp4sYgV500F9BonjtwYke
 rTvKWo87q/eU8K1dkw2fAJ78IjgGrCoUwaNewktFUKyan3FMpayWOqjYq
 zBg5EwOCel48SmCK+ppVUk/IvJDaIJEOr/U78SvujjanluzxDcfhWeodi w==;
X-CSE-ConnectionGUID: GosqJTv9SQSwkW1gwxXOVw==
X-CSE-MsgGUID: 9/Xu7ciXQc+mm5J1Llx+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82242287"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82242287"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 22:09:29 -0700
X-CSE-ConnectionGUID: eKPFmqgiScCB8GNbfKxQCA==
X-CSE-MsgGUID: wV5s5y0LRSWT/ssIy6MS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="247835869"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa008.jf.intel.com with ESMTP; 16 Jun 2026 22:09:28 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, suraj.kandpal@intel.com
Subject: [PATCH RESEND v2] drm/i915/display: Program TRANS_VTOTAL from mode
 vtotal
Date: Wed, 17 Jun 2026 10:28:50 +0530
Message-ID: <20260617045850.862100-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are monitors being sensitive to MSA and end up
blanking out when we override Vtotal, DP transcoder
uses TRANS_VTOTAL to derive MSA VTotal. Avoid overriding
crtc_vtotal to 1 on platform which supports VRR Timing
generator and always program VTOTAL from mode timing in
transcoder timing paths.

--v2:
- Remove write to crtc_state->hw.adjusted_mode.crtc_vtotal
during intel_vrr_get_config. (Ankit)
- Fix merge conflicts.

Bspec: 70001
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 -----------------
 drivers/gpu/drm/i915/display/intel_vrr.c     | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e76aa6c8dab6..42eb4c5bc9b6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2737,15 +2737,6 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
 		       HSYNC_START(adjusted_mode->crtc_hsync_start - 1) |
 		       HSYNC_END(adjusted_mode->crtc_hsync_end - 1));
 
-	/*
-	 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
-	 * bits are not required. Since the support for these bits is going to
-	 * be deprecated in upcoming platforms, avoid writing these bits for the
-	 * platforms that do not use legacy Timing Generator.
-	 */
-	if (intel_vrr_always_use_vrr_tg(display))
-		crtc_vtotal = 1;
-
 	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
 		       VACTIVE(crtc_vdisplay - 1) |
 		       VTOTAL(crtc_vtotal - 1));
@@ -2834,14 +2825,6 @@ void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
 	intel_de_write(display, TRANS_VSYNC(display, transcoder),
 		       VSYNC_START(adjusted_mode->crtc_vsync_start - 1) |
 		       VSYNC_END(adjusted_mode->crtc_vsync_end - 1));
-	/*
-	 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
-	 * bits are not required. Since the support for these bits is going to
-	 * be deprecated in upcoming platforms, avoid writing these bits for the
-	 * platforms that do not use legacy Timing Generator.
-	 */
-	if (intel_vrr_always_use_vrr_tg(display))
-		crtc_vtotal = 1;
 
 	/*
 	 * The double buffer latch point for TRANS_VTOTAL
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index cd380fe8fd01..5d9b11185296 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1102,16 +1102,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 			crtc_state->vrr.vmin += intel_vrr_vmin_flipline_offset(display);
 		}
 
-		/*
-		 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
-		 * bits are not filled. Since for these platforms TRAN_VMIN is always
-		 * filled with crtc_vtotal, use TRAN_VRR_VMIN to get the vtotal for
-		 * adjusted_mode.
-		 */
-		if (intel_vrr_always_use_vrr_tg(display))
-			crtc_state->hw.adjusted_mode.crtc_vtotal =
-				intel_vrr_vmin_vtotal(crtc_state);
-
 		if (HAS_AS_SDP(display)) {
 			trans_vrr_vsync =
 				intel_de_read(display,
-- 
2.48.1

