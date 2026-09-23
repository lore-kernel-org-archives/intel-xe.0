Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790CAC98311
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2143D10F121;
	Wed, 23 Sep 2026 17:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEAtsG9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02A10F0D5;
 Wed, 23 Sep 2026 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790184574; x=1821720574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2t4It4eOn0l5wN96RK7smuc/C5dWm4dv1dBF0XC5UY=;
 b=SEAtsG9pxdf8x1xqm0dKBQgTYq4qQw9lLA0M3OtE+pUoR7uVDzEvVKyj
 RGttK9d9Xz1KAnI3aBcpF4g1A0+XLQRWGI2qf33kFkrIK+PakcG1of4Au
 +j+0YWj2fN50HvFrQLZnoBFL4YeXEWzSUoHEO5hSjBtigpAfWDELaId7p
 shd5Pg2nvht2ITCoSUqyFydyvN8qYaQvww+qaySzZCSD85SgK38bBGhcy
 d6l26UzQHy72NEA5O+wBz05tLt+NEXP5Ab+kCkPStR7eF/BxrK3rvOuZu
 XV3q/1DxgjS/1uLar83WRs2rvH45NvX6dbIcsWA8fvRjZt5CrZ/AkRoeb w==;
X-CSE-ConnectionGUID: xsvvwYS4Q0ifhLwZWwVpAQ==
X-CSE-MsgGUID: b5EVwwYwQP+m55u9hmA0wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91019975"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="91019975"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:29:34 -0700
X-CSE-ConnectionGUID: 90LDG/LNQ1unmH/4QUS0jg==
X-CSE-MsgGUID: vewO6V3rTo+Up0lAXpsbmA==
X-ExtLoop1: 1
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:29:33 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: [PATCH v3 1/3] drm/i915/display/fbc: Move intel_fbc_can_flip_nuke()
 higher up
Date: Wed, 23 Sep 2026 10:28:01 -0700
Message-Id: <20260923172803.1011636-2-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812215350.3753102-1-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
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

Move intel_fbc_can_flip_nuke() above __intel_fbc_prepare_dirty_rect()
to allow its usage in FBC dirty rectangle checks without introducing a
forward declaration.

No functional change.

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5694d20773f8..c6f9e6506f63 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1506,6 +1506,51 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
 		intel_fbc_is_cfb_ok(plane_state);
 }
 
+static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
+				    struct intel_crtc *crtc,
+				    struct intel_plane *plane)
+{
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_plane_state *old_plane_state =
+		intel_atomic_get_old_plane_state(state, plane);
+	const struct intel_plane_state *new_plane_state =
+		intel_atomic_get_new_plane_state(state, plane);
+	const struct drm_framebuffer *old_fb = old_plane_state->hw.fb;
+	const struct drm_framebuffer *new_fb = new_plane_state->hw.fb;
+
+	if (intel_crtc_needs_modeset(new_crtc_state))
+		return false;
+
+	if (!intel_fbc_is_ok(old_plane_state) ||
+	    !intel_fbc_is_ok(new_plane_state))
+		return false;
+
+	if (old_fb->format->format != new_fb->format->format)
+		return false;
+
+	if (old_fb->modifier != new_fb->modifier)
+		return false;
+
+	if (intel_fbc_plane_stride(old_plane_state) !=
+	    intel_fbc_plane_stride(new_plane_state))
+		return false;
+
+	if (intel_fbc_cfb_stride(old_plane_state) !=
+	    intel_fbc_cfb_stride(new_plane_state))
+		return false;
+
+	if (intel_fbc_cfb_size(old_plane_state) !=
+	    intel_fbc_cfb_size(new_plane_state))
+		return false;
+
+	if (intel_fbc_override_cfb_stride(old_plane_state) !=
+	    intel_fbc_override_cfb_stride(new_plane_state))
+		return false;
+
+	return true;
+}
+
 static void
 __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
 			       const struct intel_crtc_state *crtc_state)
@@ -1755,51 +1800,6 @@ int intel_fbc_min_cdclk(const struct intel_crtc_state *crtc_state)
 	return min_cdclk;
 }
 
-static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
-				    struct intel_crtc *crtc,
-				    struct intel_plane *plane)
-{
-	const struct intel_crtc_state *new_crtc_state =
-		intel_atomic_get_new_crtc_state(state, crtc);
-	const struct intel_plane_state *old_plane_state =
-		intel_atomic_get_old_plane_state(state, plane);
-	const struct intel_plane_state *new_plane_state =
-		intel_atomic_get_new_plane_state(state, plane);
-	const struct drm_framebuffer *old_fb = old_plane_state->hw.fb;
-	const struct drm_framebuffer *new_fb = new_plane_state->hw.fb;
-
-	if (intel_crtc_needs_modeset(new_crtc_state))
-		return false;
-
-	if (!intel_fbc_is_ok(old_plane_state) ||
-	    !intel_fbc_is_ok(new_plane_state))
-		return false;
-
-	if (old_fb->format->format != new_fb->format->format)
-		return false;
-
-	if (old_fb->modifier != new_fb->modifier)
-		return false;
-
-	if (intel_fbc_plane_stride(old_plane_state) !=
-	    intel_fbc_plane_stride(new_plane_state))
-		return false;
-
-	if (intel_fbc_cfb_stride(old_plane_state) !=
-	    intel_fbc_cfb_stride(new_plane_state))
-		return false;
-
-	if (intel_fbc_cfb_size(old_plane_state) !=
-	    intel_fbc_cfb_size(new_plane_state))
-		return false;
-
-	if (intel_fbc_override_cfb_stride(old_plane_state) !=
-	    intel_fbc_override_cfb_stride(new_plane_state))
-		return false;
-
-	return true;
-}
-
 static bool __intel_fbc_pre_update(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
-- 
2.34.1

