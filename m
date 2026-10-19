Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF5CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81610ED74;
	Mon, 19 Oct 2026 13:53:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DF210ED6F;
 Mon, 19 Oct 2026 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418030; x=1823954030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjtraQtHOCDzF2dX7Hn+UTUrvV3b53AWndOR7a/GvXM=;
 b=V/oOiGOCo7hJznIbVRTZ4BVqGVGWrBoT4Zr54DWXrzw1p/zOd+Kpy0Le
 37PwSpG+/Grsp65QghaXgYhz68851coYHbWf1Jp4F4ued0ZaWvo7rbYtT
 bCzN7oxur2Qy6q4NagdpdfbXPXc+1AyPuS0fXUkx/useUrDJ9bFjPGtfF
 /OYwOAtJT0jcckzv1Qsk5Y0w2KokXfE/VCjXbagtABTWj0LEQZ6d5OzAk
 /QIGujPF97QGDxbH9kC6Q2QtPgggti2X58PW3I3JZxT7CA4G5Okra+LO0
 GeSqi3AH3zPkBToASODfIZm6quTQZFjclsKMp+VlHaY6K/gI5CVP0w28V g==;
X-CSE-ConnectionGUID: ykdnaTW2RMeL61mrwgRcHQ==
X-CSE-MsgGUID: NiGo7+/aRGCUegfMEGZ1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085153"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:50 -0700
X-CSE-ConnectionGUID: Spg8EkJeQt2N6MGnzJLaLw==
X-CSE-MsgGUID: cKH5qh7LT5q0zEFBy/28vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844412"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/15] drm/i915/pfit: Check scaling factor on GMCH
Date: Mon, 19 Oct 2026 16:53:04 +0300
Message-ID: <20261019135309.23578-11-ville.syrjala@linux.intel.com>
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

Make sure the pfit scaling factor is legal on GMCH platforms.
For now we'll limit all platforms to upscaling only, even
though i965+ can actually downscale.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 63e5a656a33b..5c2e7fdb93cc 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -532,6 +532,42 @@ static void i9xx_scale_fullscreen(struct intel_crtc_state *crtc_state,
 	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
 }
 
+static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	const struct drm_rect *dst = &crtc_state->pfit.dst;
+	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
+	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
+	int hscale, vscale, max_scale;
+	struct drm_rect src;
+
+	max_scale = 0x10000;
+
+	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
+
+	hscale = drm_rect_calc_hscale(&src, dst, 0, max_scale);
+	if (hscale < 0) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] pfit horizontal downscaling (%d->%d) exceeds max (0x%x)\n",
+			    crtc->base.base.id, crtc->base.name,
+			    pipe_src_w, drm_rect_width(dst),
+			    max_scale);
+		return hscale;
+	}
+
+	vscale = drm_rect_calc_vscale(&src, dst, 0, max_scale);
+	if (vscale < 0) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] pfit vertical downscaling (%d->%d) exceeds max (0x%x)\n",
+			    crtc->base.base.id, crtc->base.name,
+			    pipe_src_h, drm_rect_height(dst),
+			    max_scale);
+		return vscale;
+	}
+
+	return 0;
+}
 static int i9xx_pfit_check_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -642,6 +678,10 @@ static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
 	if ((pfit_control & PFIT_ENABLE) == 0)
 		return 0;
 
+	ret = i9xx_pfit_check_scaling(crtc_state);
+	if (ret)
+		return ret;
+
 	ret = i9xx_pfit_check_timings(crtc_state);
 	if (ret)
 		return ret;
-- 
2.55.0

