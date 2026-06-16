Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE92CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 07:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161710E88E;
	Tue, 16 Jun 2026 07:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+NdRnot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974B010E88A;
 Tue, 16 Jun 2026 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781596125; x=1813132125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gpwdHN/UeHj3EmW8+I4mXFeke+TXrK+/oJ9GD931vGc=;
 b=B+NdRnotfmL0tKXKWN2o3CX5jdMZO+ZuLgwajE8En7l3C8mB6poXO917
 Wx7ptEHpp14WfjucN0muYpyd/qpUBVRl423ZNVQhjaJaSpBbGQuqEs5d8
 ccJFkaMNVlE/0P6y2RxsQNI/+cXn8CIxMvgFJo5hInzibCXCQv7zA/v0D
 sgan69TQ56MYJwkNk7yLcFXOX879ADADRRl0MCv436ipI3Knvuxd47ORD
 /3Db5At93I/XSmg/TqQ0q5wyWs89t0cEjpQNIoqCATAIdeqhTERDWUJ9E
 oLRfKMLEwaRKKeKg/BVM2WvIk33YOD+S0uPyfKdxtt7PQxJYBmv3x2vfB A==;
X-CSE-ConnectionGUID: rbdA3fWkTEWFP5OreN2uNw==
X-CSE-MsgGUID: yxUbUP0rTtKFOmMI+cwNnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="105021057"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="105021057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 00:48:44 -0700
X-CSE-ConnectionGUID: ZSMxa4KtTzi6MweniUbN+A==
X-CSE-MsgGUID: bN4qTYEHSLSxB7m5gMulYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="271417598"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2026 00:48:42 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, suraj.kandpal@intel.com
Subject: [PATCH v1] drm/i915/display: Program TRANS_VTOTAL from mode vtotal
Date: Tue, 16 Jun 2026 13:08:05 +0530
Message-ID: <20260616073805.779362-1-mitulkumar.ajitkumar.golani@intel.com>
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

DP transcoder uses TRANS_VTOTAL to derive MSA VTotal. Avoid
overriding crtc_vtotal to 1 on platform which supports VRR
Timing generator and always program VTOTAL from mode timing
in transcoder timing paths.

Bspec: 70001
Fixes: 94f608992f8c ("drm/i915/display: Avoid use of VTOTAL.Vtotal bits")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 -----------------
 1 file changed, 17 deletions(-)

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
-- 
2.48.1

