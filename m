Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC86FF510C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212E10E484;
	Tue,  7 Apr 2026 15:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEDlYIb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9301B10E484;
 Tue,  7 Apr 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577101; x=1807113101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMXUv+CGgnC3hwwibVcYtVU5jaz4QvRjnaIFdBIn1Wg=;
 b=bEDlYIb0AcdwmHVNpAc4E1wNdnDNh+sd2Zh+l1Abh5iKBGfAZ0MI6bDS
 SmqpRIYnOwS607fg6eiFHZBYv5NxH10AyRjf4A5yKxU4qeUo/WOYJDK2t
 9QE73deiXAJ41UbP6hRwLmyf6xAeV0f3xJKqIp9A+13ztZST6wppNVAz5
 j8Sj3/2rq94IVG+oHuXfjepTeEACK0uss3v+1EOHFlH8u+numE4JfS+zs
 J7aUqnqlbz32Fe5FIqdRBRES8Eq1l60EG1N54c9qfiM3S8l3g141swfUG
 TcfnJK5J+etaIMOKXfbjvG6fs+2YbEt78EQDgeFAKf34xDkI9pzs3XqHt Q==;
X-CSE-ConnectionGUID: vWZf1DsdQSWwCDJlftFrWw==
X-CSE-MsgGUID: ITD//Q1PTLmULU4VSdK99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76614831"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76614831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:40 -0700
X-CSE-ConnectionGUID: u2C3De0qTn6IdTa/9qQjiA==
X-CSE-MsgGUID: AILaNJC6TtC3GznKRHNrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="229876036"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/12] drm/i915/fb: Use intel_fb_needs_pot_stride_remap() in
 intel_fb_view_init()
Date: Tue,  7 Apr 2026 18:50:53 +0300
Message-ID: <20260407155053.32156-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
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

Replace the open coded intel_fb_needs_pot_stride_remap() check
inside intel_fb_view_init() with the real thing.

The current check doesn't have the intel_fb_uses_dpt() in there, but
that is the only situation when we use the remapped view, and thus
was always implied.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index ceed695d3ad4..c4af368deffd 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1627,13 +1627,14 @@ calc_plane_normal_size(const struct intel_framebuffer *fb, int color_plane,
 
 static void intel_fb_view_init(struct intel_display *display,
 			       struct intel_fb_view *view,
-			       enum i915_gtt_view_type view_type)
+			       enum i915_gtt_view_type view_type,
+			       const struct intel_framebuffer *fb)
 {
 	memset(view, 0, sizeof(*view));
 	view->gtt.type = view_type;
 
 	if (i915_gtt_view_is_remapped(&view->gtt) &&
-	    (display->platform.alderlake_p || DISPLAY_VER(display) >= 14))
+	    intel_fb_needs_pot_stride_remap(fb))
 		view->gtt.remapped.plane_alignment = SZ_2M / PAGE_SIZE;
 }
 
@@ -1699,16 +1700,19 @@ int intel_fill_fb_info(struct intel_display *display, struct intel_framebuffer *
 	int i, num_planes = fb->base.format->num_planes;
 	unsigned int tile_size = intel_tile_size(display);
 
-	intel_fb_view_init(display, &fb->normal_view, I915_GTT_VIEW_NORMAL);
+	intel_fb_view_init(display, &fb->normal_view,
+			   I915_GTT_VIEW_NORMAL, fb);
 
 	drm_WARN_ON(display->drm,
 		    intel_fb_supports_90_270_rotation(fb) &&
 		    intel_fb_needs_pot_stride_remap(fb));
 
 	if (intel_fb_supports_90_270_rotation(fb))
-		intel_fb_view_init(display, &fb->rotated_view, I915_GTT_VIEW_ROTATED);
+		intel_fb_view_init(display, &fb->rotated_view,
+				   I915_GTT_VIEW_ROTATED, fb);
 	if (intel_fb_needs_pot_stride_remap(fb))
-		intel_fb_view_init(display, &fb->remapped_view, I915_GTT_VIEW_REMAPPED);
+		intel_fb_view_init(display, &fb->remapped_view,
+				   I915_GTT_VIEW_REMAPPED, fb);
 
 	for (i = 0; i < num_planes; i++) {
 		struct fb_plane_view_dims view_dims;
@@ -1835,8 +1839,9 @@ static void intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 	u32 gtt_offset = 0;
 
 	intel_fb_view_init(display, &plane_state->view,
-			   drm_rotation_90_or_270(rotation) ? I915_GTT_VIEW_ROTATED :
-							      I915_GTT_VIEW_REMAPPED);
+			   drm_rotation_90_or_270(rotation) ?
+			   I915_GTT_VIEW_ROTATED : I915_GTT_VIEW_REMAPPED,
+			   intel_fb);
 
 	src_x = plane_state->uapi.src.x1 >> 16;
 	src_y = plane_state->uapi.src.y1 >> 16;
-- 
2.52.0

