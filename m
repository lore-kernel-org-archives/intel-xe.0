Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83D8C9832A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463A10FBBF;
	Fri, 25 Sep 2026 17:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLrXaEra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434F310FBAF;
 Fri, 25 Sep 2026 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790357903; x=1821893903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2t4It4eOn0l5wN96RK7smuc/C5dWm4dv1dBF0XC5UY=;
 b=mLrXaEraPrfJKAcMDrK9MScfhDU9onetY6wMbXP1OR559gtuIiQfXYG0
 m+f4ge1KOI9bz5w2bXRAN5XO8hwWqFcZ8lxIASCnwoH3RiPDVRnzubm2d
 UBm5RMp+hOr5L+R6/nkbnMXN+wiKXboQYvmst30MbrNWEJpim0Vf8/RWI
 Nj8MaPPsWTsp7cFSL0/6ZY0b8YYWEnMFfbr5hAmyP8/uDJcwQUuwwlvrO
 DqpQlmVVeJT1yMVtcY0P15lEXsTFEvZiyxUTISMWrq1TZVAN6+AA1Nb7M
 ve8r4j522ok0AVlpKUyn2Q+Kv70YrgzBkvuiGKyGKG0edGKUb5AmhW5jQ A==;
X-CSE-ConnectionGUID: ZonN6H6rQHCSz17g3Tl3xg==
X-CSE-MsgGUID: nGQBIb+FTXOs8APh5T0a1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116677961"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="116677961"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:23 -0700
X-CSE-ConnectionGUID: zYTDWC2oQbmHXyL2NWPvQg==
X-CSE-MsgGUID: tKvGCBxMTOiySWF70LuvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="270874880"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:23 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: [PATCH v4 1/3] drm/i915/display/fbc: Move intel_fbc_can_flip_nuke()
 higher up
Date: Fri, 25 Sep 2026 10:36:56 -0700
Message-Id: <20260925173658.1042048-2-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925173658.1042048-1-austin.hu@intel.com>
References: <20260925173658.1042048-1-austin.hu@intel.com>
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

