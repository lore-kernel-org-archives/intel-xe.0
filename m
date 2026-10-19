Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9824CCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9338F10ECB3;
	Mon, 19 Oct 2026 13:00:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3CC10ECB3;
 Mon, 19 Oct 2026 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792414822; x=1823950822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIxv573kJR7r4dhLwh+r0UccFR5oGtT6tKI53A4UNiU=;
 b=LQHP63aCmwD0TkLxTjM9QhnPaQXpVX6piE6Uuok7p0awiz6i7DCh2DFk
 n0f7fF1tx1rdo2BL+Eyt0q5LZrWbKXCCv9uAT9b3wprBJPt28VBZQHNE+
 3MF1B9kBjw49jKkqWDufhcQcdOtF+S2JbWhPd932ns2DjSI5vEofg8Fy3
 dMicsj9CElC7KnKllDanUgdvJhL2SwshV/+zKHzXJHoT5ZD/53m5uoKWl
 vNJRqmykkn1ZXmwgj8AxsVepcU4uI1AOpp0R+vvDgudZ3sT++/VWe/4Qf
 sJia3cNXrT0VZQoJ6uqyBOE8hKXyjza9vtIItZoacUMofpbG98ZSwaisN Q==;
X-CSE-ConnectionGUID: MHiPAEnqROWurseWgNDPWg==
X-CSE-MsgGUID: h54PpNYORaSZWUL+/JAqiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095416"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095416"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:21 -0700
X-CSE-ConnectionGUID: fxOtBxA5QqWasa+EZPrrtw==
X-CSE-MsgGUID: jhIU+oMYQNSY0DcnAF6pkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2894003"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Drop bogus VLV/CHV VT-d stuff
Date: Mon, 19 Oct 2026 16:00:12 +0300
Message-ID: <20261019130014.8851-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
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

Apparently VLV and CHV don't support VT-d at all. Drop the
dead code and FIXMEs related to this.

And since intel_scanout_needs_vtd_wa() is never true
for VLV/CHV we can put the vtd_guard assignement into the
common code path in intel_sprite_plane_create(), which is
how intel_primary_plane_create() already does it as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c   |  7 -------
 drivers/gpu/drm/i915/display/intel_sprite.c | 13 +++----------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 0902b17d0269..bd5f2c74959a 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -816,15 +816,9 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
 				     const struct drm_framebuffer *fb,
 				     int color_plane)
 {
-	struct intel_display *display = to_intel_display(plane);
-
 	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
 		return 256 * 1024;
 
-	/* FIXME undocumented so not sure what's actually needed */
-	if (intel_scanout_needs_vtd_wa(display))
-		return 256 * 1024;
-
 	switch (fb->modifier) {
 	case I915_FORMAT_MOD_X_TILED:
 		return 4 * 1024;
@@ -1019,7 +1013,6 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 	else
 		plane->min_alignment = i9xx_plane_min_alignment;
 
-	/* FIXME undocumented for VLV/CHV so not sure what's actually needed */
 	if (intel_scanout_needs_vtd_wa(display))
 		plane->vtd_guard = 128;
 
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 2321bfbb8630..116c7faf3452 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1618,10 +1618,6 @@ intel_sprite_plane_create(struct intel_display *display,
 		plane->min_alignment = vlv_plane_min_alignment;
 		plane->min_cdclk = vlv_plane_min_cdclk;
 
-		/* FIXME undocumented for VLV/CHV so not sure what's actually needed */
-		if (intel_scanout_needs_vtd_wa(display))
-			plane->vtd_guard = 128;
-
 		if (display->platform.cherryview && pipe == PIPE_B) {
 			formats = chv_pipe_b_sprite_formats;
 			num_formats = ARRAY_SIZE(chv_pipe_b_sprite_formats);
@@ -1650,9 +1646,6 @@ intel_sprite_plane_create(struct intel_display *display,
 
 		plane->min_alignment = g4x_sprite_min_alignment;
 
-		if (intel_scanout_needs_vtd_wa(display))
-			plane->vtd_guard = 64;
-
 		formats = snb_sprite_formats;
 		num_formats = ARRAY_SIZE(snb_sprite_formats);
 
@@ -1669,9 +1662,6 @@ intel_sprite_plane_create(struct intel_display *display,
 		plane->min_alignment = g4x_sprite_min_alignment;
 		plane->min_cdclk = g4x_sprite_min_cdclk;
 
-		if (intel_scanout_needs_vtd_wa(display))
-			plane->vtd_guard = 64;
-
 		if (display->platform.sandybridge) {
 			formats = snb_sprite_formats;
 			num_formats = ARRAY_SIZE(snb_sprite_formats);
@@ -1685,6 +1675,9 @@ intel_sprite_plane_create(struct intel_display *display,
 		}
 	}
 
+	if (intel_scanout_needs_vtd_wa(display))
+		plane->vtd_guard = 64;
+
 	if (display->platform.cherryview && pipe == PIPE_B) {
 		supported_rotations =
 			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
-- 
2.55.0

