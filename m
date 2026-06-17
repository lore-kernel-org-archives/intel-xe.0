Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE26CD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 04:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2165510EDE6;
	Wed, 17 Jun 2026 04:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUUsIvUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE010E916;
 Wed, 17 Jun 2026 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781672157; x=1813208157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EQHgE5OFehfVc6fpZyoK0Zt70CyWEFds+8zcLMpa/mY=;
 b=UUUsIvUPYLt+A3uaXKgxz/4gLMcxV0zUw0tnBJVuEdI0lYHi+rM0MiLl
 EXwxfc5HnZsc8NCHRuN1iqCeik6mkg0/h3uaipQnCbSqvInPDITavOU5H
 Q/ygMZ903680RgDfiO4+6/alCas/PGEDbR/OaLyaPn8nhAXDQYjF2qpI+
 /j14fQLiYUsySk0SWe2IuXWoiu+hHOaGDVvh6b8snfPNVk6W7PEDMajAE
 Ob7ABcjkTo066poVTToArcRLUaRTq93wbNXAntZJUzyAsR8xOFdDm8Zeq
 6UibuQ3uqHY1hCy4FfHR011Ve7LxnXDz3MCjZ5sJRGh31THmhDX7z37lC A==;
X-CSE-ConnectionGUID: wkKhhrzBSYqMfqWjhizbUQ==
X-CSE-MsgGUID: TrEwB2B5SyWItjyErgiQJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93023809"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93023809"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:55:57 -0700
X-CSE-ConnectionGUID: y8Y8f412SNy29xXAwv5TDA==
X-CSE-MsgGUID: YKwlPhrjShehfxgWDKiufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="249869911"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2026 21:55:54 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, suraj.kandpal@intel.com
Subject: [PATCH RESEND v2] drm/i915/display: Program TRANS_VTOTAL from mode
 vtotal
Date: Wed, 17 Jun 2026 10:15:17 +0530
Message-ID: <20260617044517.844010-1-mitulkumar.ajitkumar.golani@intel.com>
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
index e2e4b00a8fa9..eb54f20b1859 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2731,15 +2731,6 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
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
 	intel_de_write(display, TRANS_VTOTAL(display, cpu_transcoder),
 		       VACTIVE(crtc_vdisplay - 1) |
 		       VTOTAL(crtc_vtotal - 1));
@@ -2826,14 +2817,6 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	intel_de_write(display, TRANS_VSYNC(display, cpu_transcoder),
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
index e03b5daac5be..bd90282b2ad2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1097,16 +1097,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
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

