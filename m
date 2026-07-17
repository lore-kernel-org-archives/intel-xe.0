Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D4CC4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDF210E4B0;
	Fri, 17 Jul 2026 15:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GClEqcNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786910E4B1;
 Fri, 17 Jul 2026 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302988; x=1815838988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lALvMABk6bXsEbFlOHAPSneuY1arTXVphxxpk1imNnE=;
 b=GClEqcNBhMdSPOMH0Veeg2hOhF/JDD7gg+OfkGcDP6QTMb7UG5Lmu2oy
 udHurmr7JKVT+hIJK7wbEcTKZOCgYg2E7q6qGT93Pl3WG5K5XQCRYqtuj
 9X5eq6VB8ikZYG4MKzE3F9h9sphpE2PLq9CUu35NZoJOhryMzSpTYTp4u
 OXJ8TRjY36p3AOMvMPaXSEMUB5vTISs9tAQ6YxcjkIEl0UmkT5JDzKxbd
 VlkHzZ8HhgmehnYgbBo52WvrmOM8OUPGeVGhVFmWuXTH10VAIj9Uq2lSY
 PIJUj73UmgvcBp0/TPaQDAU8JvNMZrXgvnRhLYUduGBschIGNI2Lgi4yt w==;
X-CSE-ConnectionGUID: t0YoCxGySdyWBPovxuvxxw==
X-CSE-MsgGUID: mI+ogSFHTHaUvgGjYw6M6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88876573"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88876573"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:08 -0700
X-CSE-ConnectionGUID: GFwlAJe9T8CP/poJQY1XDg==
X-CSE-MsgGUID: S9YMtroFSLyBL/oyZ+hDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286885332"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915: Use intel_parent_fb_pin_ggtt_pin() for BIOS FB
 pin
Date: Fri, 17 Jul 2026 18:42:37 +0300
Message-ID: <20260717154238.10792-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
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

Get rid of special BIOS FB pinning code and just use
intel_parent_fb_pin_ggtt_pin(). For now we'll ignore most
of the pin params here and just set up the bare minimum
(.view and .needs_fence).

Ideally we'd go even further and just use intel_plane_pin_fb()
here but that would require setting up the plane state before
doing the pin, not afterwards as is the case currently. That
would also require some extra cleanup of the plane state should
the pin fail. Leave that as a TODO for now.

The initial plane .setup() hook will be relegated to just
setting up the i915->preserve_bios_swizzle flag.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_initial_plane.c    | 20 +++++++++++++-
 drivers/gpu/drm/i915/i915_initial_plane.c     | 26 +++----------------
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +++----
 drivers/gpu/drm/xe/display/xe_fb_pin.h        | 12 ---------
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 25 ------------------
 include/drm/intel/display_parent_interface.h  |  5 +---
 6 files changed, 28 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 40afb3172cd1..7b5b895c10f7 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -140,7 +140,11 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	struct intel_initial_plane_config *plane_config = &all_plane_configs->config[crtc->pipe];
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->base.state);
+	struct intel_fb_pin_params pin_params = {};
 	struct drm_framebuffer *fb;
+	struct i915_vma *ggtt_vma = NULL;
+	int fence_id = -1;
+	u32 offset = 0;
 	int ret;
 
 	/*
@@ -160,10 +164,24 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	intel_fb_fill_view(to_intel_framebuffer(fb),
 			   plane_state->uapi.rotation, &plane_state->view);
 
-	ret = display->parent->initial_plane->setup(plane->base.state, plane_config, fb);
+	/* TODO just use intel_plane_pin_fb() */
+	pin_params.view = &plane_state->view.gtt;
+	pin_params.needs_fence = intel_plane_needs_fence(display);
+
+	ret = intel_parent_fb_pin_ggtt_pin(display,
+					   intel_fb_bo(fb), &pin_params,
+					   &ggtt_vma, &offset,
+					   intel_plane_needs_fence(display) ? &fence_id : NULL);
 	if (ret)
 		goto nofb;
 
+	if (display->parent->initial_plane->setup)
+		display->parent->initial_plane->setup(display->drm, fb->modifier);
+
+	plane_state->ggtt_vma = ggtt_vma;
+	plane_state->surf = offset;
+	plane_state->fence_id = fence_id;
+
 	plane_state->uapi.src_x = 0;
 	plane_state->uapi.src_y = 0;
 	plane_state->uapi.src_w = fb->width << 16;
diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index bbe5960b1b14..559e1b98ca2f 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -219,32 +219,12 @@ i915_free_initial_plane_obj(struct drm_gem_object *obj)
 	drm_gem_object_put(obj);
 }
 
-static int
-i915_initial_plane_setup(struct drm_plane_state *_plane_state,
-			 struct intel_initial_plane_config *plane_config,
-			 struct drm_framebuffer *fb)
+static void i915_initial_plane_setup(struct drm_device *drm, u64 modifier)
 {
-	struct intel_plane_state *plane_state = to_intel_plane_state(_plane_state);
-	struct drm_i915_private *dev_priv = to_i915(_plane_state->plane->dev);
-	struct drm_gem_object *obj = intel_fb_bo(fb);
-	struct i915_vma *vma;
+	struct drm_i915_private *dev_priv = to_i915(drm);
 
-	vma = i915_vma_instance(to_intel_bo(obj), &to_gt(dev_priv)->ggtt->vm, NULL);
-	if (IS_ERR(vma))
-		return PTR_ERR(vma);
-
-	__i915_vma_pin(vma);
-	plane_state->ggtt_vma = i915_vma_get(vma);
-	if (intel_plane_uses_fence(plane_state) &&
-	    i915_vma_pin_fence(vma) == 0 && vma->fence)
-		plane_state->fence_id = vma->fence->id;
-
-	plane_state->surf = i915_ggtt_offset(plane_state->ggtt_vma);
-
-	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
+	if (modifier != DRM_FORMAT_MOD_LINEAR)
 		dev_priv->preserve_bios_swizzle = true;
-
-	return 0;
 }
 
 const struct intel_display_initial_plane_interface i915_display_initial_plane_interface = {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 73469ea5f333..1b6a409d3e51 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -398,11 +398,11 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	kfree(vma);
 }
 
-int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
-		       const struct intel_fb_pin_params *pin_params,
-		       struct i915_vma **out_ggtt_vma,
-		       u32 *out_offset,
-		       int *out_fence_id)
+static int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
+			      const struct intel_fb_pin_params *pin_params,
+			      struct i915_vma **out_ggtt_vma,
+			      u32 *out_offset,
+			      int *out_fence_id)
 {
 	struct i915_vma *ggtt_vma;
 
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.h b/drivers/gpu/drm/xe/display/xe_fb_pin.h
index 20dd8a99a25f..8a42d4009f5d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.h
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.h
@@ -4,18 +4,6 @@
 #ifndef __XE_FB_PIN_H__
 #define __XE_FB_PIN_H__
 
-#include <linux/types.h>
-
-struct drm_gem_object;
-struct i915_vma;
-struct intel_fb_pin_params;
-
-int xe_fb_pin_ggtt_pin(struct drm_gem_object *obj,
-		       const struct intel_fb_pin_params *pin_params,
-		       struct i915_vma **out_ggtt_vma,
-		       u32 *out_offset,
-		       int *out_fence_id);
-
 extern const struct intel_display_fb_pin_interface xe_display_fb_pin_interface;
 
 #endif /* __XE_FB_PIN_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index d45ad2ba418c..d2861f727b57 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -130,32 +130,7 @@ xe_free_initial_plane_obj(struct drm_gem_object *obj)
 	xe_bo_unpin_map_no_vm(gem_to_xe_bo(obj));
 }
 
-static int
-xe_initial_plane_setup(struct drm_plane_state *_plane_state,
-		       struct intel_initial_plane_config *plane_config,
-		       struct drm_framebuffer *fb)
-{
-	struct intel_plane_state *plane_state = to_intel_plane_state(_plane_state);
-	struct i915_vma *vma;
-	struct intel_fb_pin_params pin_params = {
-		.view = &plane_state->view.gtt,
-	};
-	u32 offset;
-	int ret;
-
-	ret = xe_fb_pin_ggtt_pin(intel_fb_bo(fb), &pin_params, &vma, &offset, NULL);
-	if (ret)
-		return ret;
-
-	plane_state->ggtt_vma = vma;
-
-	plane_state->surf = offset;
-
-	return 0;
-}
-
 const struct intel_display_initial_plane_interface xe_display_initial_plane_interface = {
 	.alloc_obj = xe_alloc_initial_plane_obj,
 	.free_obj = xe_free_initial_plane_obj,
-	.setup = xe_initial_plane_setup,
 };
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 173c01d41385..de58e32b3368 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -10,10 +10,8 @@ enum vlv_iosf_sb_unit;
 struct dma_fence;
 struct drm_device;
 struct drm_file;
-struct drm_framebuffer;
 struct drm_gem_object;
 struct drm_mode_fb_cmd2;
-struct drm_plane_state;
 struct drm_scanout_buffer;
 struct fb_info;
 struct i915_gtt_view;
@@ -127,8 +125,7 @@ struct intel_display_hdcp_interface {
 struct intel_display_initial_plane_interface {
 	struct drm_gem_object *(*alloc_obj)(struct drm_device *drm, struct intel_initial_plane_config *plane_config);
 	void (*free_obj)(struct drm_gem_object *obj);
-	int (*setup)(struct drm_plane_state *plane_state, struct intel_initial_plane_config *plane_config,
-		     struct drm_framebuffer *fb);
+	void (*setup)(struct drm_device *drm, u64 modifier);
 };
 
 struct intel_display_irq_interface {
-- 
2.54.0

