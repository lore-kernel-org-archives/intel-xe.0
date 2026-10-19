Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3698CCF2E7
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C94B10ED79;
	Mon, 19 Oct 2026 13:54:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812310ED79;
 Mon, 19 Oct 2026 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418044; x=1823954044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TiQhgk00ST1VTGxec7JIocEEPEdk4AiZTv5cUxXO7QI=;
 b=JmKwKJgj2sQdXhBROV9R4wrhx04XrTSmySadaYX3LcvZTg90pVY3tqv2
 oMSU2MmEr2evXsV0thEeISyeQCuTXfhmc4qv4GVE3lVJN0sTR7sTWt6U9
 lOgEIyvijQeN8gWut4N2P7w4nYd4RPeaHeS1o/+FDlGl8oTTf0toAg1RJ
 6yAMfYtJJ27tUphu4omOo2RBoCNABVwhokKjvpBxx+e01A3aqM2S8STJW
 H8QUNCk/jZsPzhQm99CAwlBij4RpI6G5/v3ah4XpeClEJ0MSb3kY+X9SQ
 D8snhewxL1pIdBKjMxVQWRb3xY/dadaYBfPamb4YxTAkfFtVi7UnFRa2w Q==;
X-CSE-ConnectionGUID: wOX94Jg9R1+macxg7X1xXA==
X-CSE-MsgGUID: ycTDs5UiTouUaEdAvjG4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1204584"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1204584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:54:04 -0700
X-CSE-ConnectionGUID: fEqwJXjzQ+GILS0z55oyQg==
X-CSE-MsgGUID: /srqDdVhSdKtWH58BCgLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2641390"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:54:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/15] drm/i915/pfit: Account for pfit downscaling in pixel
 rate on GMCH platforms
Date: Mon, 19 Oct 2026 16:53:08 +0300
Message-ID: <20261019135309.23578-15-ville.syrjala@linux.intel.com>
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

Now that we have crtc_state->pch.dst populated on GMCH platforms
we can use the existing ILK+ code to calculate the downscale
adjusted pixel rate correctly on GMCH platforms.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 23 +++++++-------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 200426bf0c59..6b813efff955 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2278,7 +2278,8 @@ static bool intel_crtc_supports_double_wide(const struct intel_crtc *crtc)
 		(crtc->pipe == PIPE_A || display->platform.i915g);
 }
 
-static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
+static unsigned int
+intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 {
 	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
 	struct drm_rect src;
@@ -2299,7 +2300,8 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 				   pixel_rate);
 }
 
-static u32 ilk_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
+static unsigned int
+intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
@@ -2345,19 +2347,10 @@ static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
 
 static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
-
-	if (HAS_GMCH(display)) {
-		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
-		crtc_state->pixel_rate =
-			crtc_state->hw.pipe_mode.crtc_clock;
-		crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
-	} else {
-		crtc_state->pixel_rate =
-			ilk_pipe_pixel_rate(crtc_state);
-		crtc_state->pixel_rate_cdclk =
-			ilk_pipe_pixel_rate_cdclk(crtc_state);
-	}
+	crtc_state->pixel_rate =
+		intel_pipe_pixel_rate(crtc_state);
+	crtc_state->pixel_rate_cdclk =
+		intel_pipe_pixel_rate_cdclk(crtc_state);
 }
 
 static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
-- 
2.55.0

