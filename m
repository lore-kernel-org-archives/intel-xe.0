Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F164CCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0261E10ECEE;
	Mon, 19 Oct 2026 13:00:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C58C10ECD0;
 Mon, 19 Oct 2026 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792414826; x=1823950826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vCQner5872qwjHjkGbjz4DQiUuZTscedOcL4UGW1PZ0=;
 b=e92S7zxtAK7RbOglltWC2F3KkmgMBuUBVLAtkKG/AbAC+uQ1gn5D+/HD
 45TWDnYB8oP7jcC6hndlortsJ45IrNQTarmgJ9EOIVWQHrfl6fBi2Kjui
 p1XAi8HHHNRujeAlGrqU/To+fne8TAltuXOQKlbhy0XDTjvtaGHsZoOD6
 gNAMUSpW6xASUDB8/WaYENeaNooTTx4GFD4cGtxtj3oJftW/zwOKi8s4T
 Q8jT0S3iFPIesXXRygWJmk1cD/WOiodtkkZrTYX09Y2MxMFG07uFexgkq
 Y3FlGQWAyAN+G3Bc0TYOriiDKki/MTUWTceH+bBNS/wFEcKKbNv4+fK0c Q==;
X-CSE-ConnectionGUID: WIqEH5HOTvWalM38RVWIHg==
X-CSE-MsgGUID: 6l+BF7cnQq+FUDASZmbLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095865"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095865"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:25 -0700
X-CSE-ConnectionGUID: sbFe6VBqRSijfqAO4BmRDQ==
X-CSE-MsgGUID: 3yp0Ri4bQjqiC9IeZP4qbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2526303"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:24 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Optimize VT-d w/a handling a bit
Date: Mon, 19 Oct 2026 16:00:13 +0300
Message-ID: <20261019130014.8851-3-ville.syrjala@linux.intel.com>
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

Since plane->min_alignment is already a vfunc we can skip
the runtime VT-d checks by simply providing a VT-d specific
implementation of the vfunc.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c   | 16 ++++++++++------
 drivers/gpu/drm/i915/display/intel_cursor.c | 20 ++++++++++++--------
 drivers/gpu/drm/i915/display/intel_sprite.c | 16 ++++++++++------
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index bd5f2c74959a..54e32b701770 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -830,18 +830,20 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
 	}
 }
 
+static unsigned int vtd_primary_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	return 256 * 1024;
+}
+
 static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
 					      const struct drm_framebuffer *fb,
 					      int color_plane)
 {
-	struct intel_display *display = to_intel_display(plane);
-
 	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
 		return 256 * 1024;
 
-	if (intel_scanout_needs_vtd_wa(display))
-		return 256 * 1024;
-
 	switch (fb->modifier) {
 	case I915_FORMAT_MOD_X_TILED:
 	case DRM_FORMAT_MOD_LINEAR:
@@ -1013,8 +1015,10 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 	else
 		plane->min_alignment = i9xx_plane_min_alignment;
 
-	if (intel_scanout_needs_vtd_wa(display))
+	if (intel_scanout_needs_vtd_wa(display)) {
+		plane->min_alignment = vtd_primary_min_alignment;
 		plane->vtd_guard = 128;
+	}
 
 	if (display->platform.i830 || display->platform.i845g) {
 		plane->update_arm = i830_plane_update_arm;
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 4afd275de86e..2f33a05bc76e 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -365,15 +365,17 @@ static unsigned int i85x_cursor_min_alignment(struct intel_plane *plane,
 	return 256; /* physical */
 }
 
+static unsigned int vtd_cursor_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	return 64 * 1024;
+}
+
 static unsigned int i9xx_cursor_min_alignment(struct intel_plane *plane,
 					      const struct drm_framebuffer *fb,
 					      int color_plane)
 {
-	struct intel_display *display = to_intel_display(plane);
-
-	if (intel_scanout_needs_vtd_wa(display))
-		return 64 * 1024;
-
 	return 4 * 1024; /* physical for i915/i945 */
 }
 
@@ -1188,15 +1190,17 @@ intel_cursor_plane_create(struct intel_display *display,
 		else
 			cursor->min_alignment = i9xx_cursor_min_alignment;
 
-		if (intel_scanout_needs_vtd_wa(display))
-			cursor->vtd_guard = 2;
-
 		cursor->update_arm = i9xx_cursor_update_arm;
 		cursor->disable_arm = i9xx_cursor_disable_arm;
 		cursor->get_hw_state = i9xx_cursor_get_hw_state;
 		cursor->check_plane = i9xx_check_cursor;
 	}
 
+	if (intel_scanout_needs_vtd_wa(display)) {
+		cursor->min_alignment = vtd_cursor_min_alignment;
+		cursor->vtd_guard = 2;
+	}
+
 	cursor->surf_offset = intel_cursor_surf_offset;
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 116c7faf3452..42153a79d97b 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -981,15 +981,17 @@ hsw_sprite_max_stride(struct intel_plane *plane,
 	return min(8192 * cpp, 16 * 1024);
 }
 
+static unsigned int vtd_sprite_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	return 128 * 1024;
+}
+
 static unsigned int g4x_sprite_min_alignment(struct intel_plane *plane,
 					     const struct drm_framebuffer *fb,
 					     int color_plane)
 {
-	struct intel_display *display = to_intel_display(plane);
-
-	if (intel_scanout_needs_vtd_wa(display))
-		return 128 * 1024;
-
 	return 4 * 1024;
 }
 
@@ -1675,8 +1677,10 @@ intel_sprite_plane_create(struct intel_display *display,
 		}
 	}
 
-	if (intel_scanout_needs_vtd_wa(display))
+	if (intel_scanout_needs_vtd_wa(display)) {
+		plane->min_alignment = vtd_sprite_min_alignment;
 		plane->vtd_guard = 64;
+	}
 
 	if (display->platform.cherryview && pipe == PIPE_B) {
 		supported_rotations =
-- 
2.55.0

