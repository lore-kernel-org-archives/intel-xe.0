Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA88E10F92EB
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4510EA44;
	Tue, 31 Mar 2026 18:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGvx4a4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6386310EA44;
 Tue, 31 Mar 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774981520; x=1806517520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymfjpmZddyJ8X7dVgTwN+Kw/xQksGHXi59vIEAw6BBk=;
 b=eGvx4a4WIC69KeSPvO7bbFQ/Cj96VJg2+/iGRYEBDClMyl7NWGzrnz3c
 N9IspUuGAPG/HDoAT7n5zWz3DrLWyCH5IWyJIBMwKQIsI0r/jCm3rH5bR
 6I/mWqQYvLP5a+wbd01gJbKHs4sxfoywriG9vV4KJywU6Id9kFIMF9XKg
 9aRHBgCTJ/+RUjBp8vEcti5OqYrNCtdiNIWlg1gggAQD/71wGI7ozo7Rx
 3GI7ZF3Kub0KpN3T8ll5cXZvwxDmOcYQBwYZS9lghPoib5Nl1qMlYpbcF
 btokvs30Bp3+P47JIHfm8nNn+LXdIkxDQVVi7+SX5bt1p7Gug+VwjPacO w==;
X-CSE-ConnectionGUID: JzqfWugISKCJ44TFQ8CqDQ==
X-CSE-MsgGUID: 8XpTmMhESRSI2oC3RxKUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87081179"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="87081179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:25:19 -0700
X-CSE-ConnectionGUID: A94DM4LSReCtb509R09HPQ==
X-CSE-MsgGUID: NwlpDX61TfakktI1wmzrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="264373961"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 11:25:18 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/pfit: Prevent negative coordinates in center mode
Date: Tue, 31 Mar 2026 23:46:56 +0530
Message-Id: <20260331181656.77300-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

When the pipe_src width or height are greater than adjusted_mode hdisplay
and vdisplay, computed x and y offsets for center mode can be negative.
Writing negative values into the pch_fit registers result in a state error.
Add a check to clamp these values so that they are never negative.

v2: Compare in terms of pipe_src width and height.[Ville]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 6dda496190e0..0edd29eef6ad 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -186,6 +186,7 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -200,6 +201,16 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 
 	switch (conn_state->scaling_mode) {
 	case DRM_MODE_SCALE_CENTER:
+		if (adjusted_mode->crtc_hdisplay < pipe_src_w ||
+		    adjusted_mode->crtc_vdisplay < pipe_src_h) {
+			drm_dbg_kms(display->drm,
+				    "[CRTC:%d:%s] pfit center mode source (%dx%d) exceeds display (%dx%d)\n",
+				    crtc->base.base.id, crtc->base.name,
+				    width, height,
+				    adjusted_mode->crtc_hdisplay,
+				    adjusted_mode->crtc_vdisplay);
+			return -EINVAL;
+		}
 		width = pipe_src_w;
 		height = pipe_src_h;
 		x = (adjusted_mode->crtc_hdisplay - width + 1)/2;
-- 
2.25.1

