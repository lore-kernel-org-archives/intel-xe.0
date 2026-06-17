Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB0CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 04:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F6110E916;
	Wed, 17 Jun 2026 04:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5DO1slR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9600510E916;
 Wed, 17 Jun 2026 04:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781671870; x=1813207870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zNv5Yyy5MCYsDI7KuC8LV+1J6+SawjX3jjEdGzM76Bw=;
 b=S5DO1slRLKRJ2Q1owFeDBLncst+GWzQotXesOBGfjNeO/NACgXKQ4wnB
 yITk4or1PWRR/VX3rmr2G2YZ8ubBJ+N8OO76ziU1NmP4txInx+k03zeif
 G5fppQIiQ9QnqayCxP6xo3UJQlsFlRpm30lHG/Ee8G/0NpKxNfh9tOiIs
 bgzmzZbsrXLVGSkNeHumjIeOMKDlNZBh3GZRD4qx68MGskAvEfy1whidD
 q0xnH2TWBwiu6YpFPUg3BYRfcsLf4/CdZ0bzQHwWCpO32Y/PQ3ZRvmjZ+
 WnIiNRtihoTy0dv+Ep97LT6FYsDaVqqBTY3V/yDXjgVWeMGWRhjk8KbD+ A==;
X-CSE-ConnectionGUID: vXegDHEMQ2m+6I0fOyR9Jg==
X-CSE-MsgGUID: TTkAef5zTcqq5qQEqo3MbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="85013598"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="85013598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:51:09 -0700
X-CSE-ConnectionGUID: jYKZm5tbQsWvxKE4p9Artg==
X-CSE-MsgGUID: 3Z5jPru1Th+zjGPX2tBAog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="251873257"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 16 Jun 2026 21:51:08 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, suraj.kandpal@intel.com
Subject: [PATCH v2] drm/i915/display: Program TRANS_VTOTAL from mode vtotal
Date: Wed, 17 Jun 2026 10:10:30 +0530
Message-ID: <20260617044030.843095-1-mitulkumar.ajitkumar.golani@intel.com>
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

