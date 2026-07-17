Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8009AC4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FF110E4AA;
	Fri, 17 Jul 2026 15:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdekavhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750AE10E4AE;
 Fri, 17 Jul 2026 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302984; x=1815838984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UH83uaiFKpIjl8s11woaguelTbeLgbamZX7BgzgQpM8=;
 b=fdekavheAIkqQkcj44MyDHM5SU86jfUkQECZfsxFVoDyHfCHUzvVTavj
 sc3EJqySEbXNLqKUIibnMcBGPfkBgH53gEekrOwxfTdODrS7iedCkkQZ4
 GAkmraABATeXmTTG9d9/Mxz89ut0fYDO1j8lXk69LamCBRy36ZcqysCGs
 VB7uFDPs1CthQCbE7dVeUAXxjl35purqtJLZ82F1peKn6Za9+z1p3Ip1s
 64liy6Sp2qhUQjiDk8rLIxJI5OLdO8SRmTqcRYZi4Dm4nghbWNSWPERlS
 yt20TNIRb1digjRcXAX9Yybt5IIG80yye7YviWpmEqRkY4h0xmrxvH7Ze w==;
X-CSE-ConnectionGUID: lcgkNDhlTee/GoE/9YeDdw==
X-CSE-MsgGUID: Msw7Ey4CQv69ZI1w513suA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88797424"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88797424"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:03 -0700
X-CSE-ConnectionGUID: pur6aaN0RoC2j0r+lhmFIw==
X-CSE-MsgGUID: pyy0/RB1S7OhHPIvelCTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="261089178"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915: Move the BIOS FB intel_framebuffer_init() to
 the display code
Date: Fri, 17 Jul 2026 18:42:36 +0300
Message-ID: <20260717154238.10792-6-ville.syrjala@linux.intel.com>
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

Clean up the alloc_initial_plane_obj() interface by moving all
framebuffer stuff to the display side, and just pass the actual
gem object from the i915/xe code.

The xe_bo_create_pin_map_at_novm() disaster does require us to
introduce a new .free_obj() parent interface hook so that if the
FB init fail we can undo all the things that
xe_bo_create_pin_map_at_novm() did earlier. Once the framebuffer
has been initialized xe_display_bo_framebuffer_fini() is supposed
to take care of this cleanup. Although I think this is still
completely broken if intel_framebuffer_init() fails late enough
that it itself calls intel_bo_framebuffer_fini(). In that case
we'll end up doing the same cleanup twice, and I expect explosions.
The proper fix for this mess would be to either nuke
xe_bo_create_pin_map_at_novm() and do things in a more sane way,
or keep xe_bo_create_pin_map_at_novm() but have it construct
a special bo that does the appropriate cleanup from its own
.destroy() hook.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 -
 .../drm/i915/display/intel_initial_plane.c    | 43 ++++++++++-----
 drivers/gpu/drm/i915/i915_initial_plane.c     | 52 ++++--------------
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 54 ++++---------------
 include/drm/intel/display_parent_interface.h  |  2 +-
 5 files changed, 51 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 17336ad6d5e9..8772acfe4847 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -761,7 +761,6 @@ struct intel_plane_state {
 
 struct intel_initial_plane_config {
 	struct drm_framebuffer *fb;
-	struct i915_vma *vma;
 	int size;
 	u32 base;
 	u8 rotation;
diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 67e4bbbd0d6a..40afb3172cd1 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -4,6 +4,7 @@
 #include <linux/iopoll.h>
 
 #include <drm/drm_blend.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 #include <drm/intel/display_parent_interface.h>
 
@@ -67,11 +68,20 @@ intel_reuse_initial_plane_fb(struct intel_crtc *this,
 	return NULL;
 }
 
-static struct drm_gem_object *
-intel_alloc_initial_plane_obj(struct intel_display *display,
-			      struct intel_initial_plane_config *plane_config)
+static struct drm_framebuffer *
+intel_alloc_initial_plane_fb(struct intel_display *display,
+			     struct intel_initial_plane_config *plane_config)
 {
 	struct drm_framebuffer *fb = plane_config->fb;
+	struct drm_mode_fb_cmd2 mode_cmd = {
+		.pixel_format = fb->format->format,
+		.width = fb->width,
+		.height = fb->height,
+		.pitches[0] = fb->pitches[0],
+		.modifier[0] = fb->modifier,
+		.flags = DRM_MODE_FB_MODIFIERS,
+	};
+	struct drm_gem_object *obj;
 
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
@@ -106,7 +116,20 @@ intel_alloc_initial_plane_obj(struct intel_display *display,
 		return NULL;
 	}
 
-	return display->parent->initial_plane->alloc_obj(display->drm, plane_config);
+	obj = display->parent->initial_plane->alloc_obj(display->drm, plane_config);
+	if (!obj)
+		return NULL;
+
+	if (intel_framebuffer_init(to_intel_framebuffer(fb), obj,
+				   fb->format, &mode_cmd)) {
+		display->parent->initial_plane->free_obj(obj);
+		drm_dbg_kms(display->drm, "initial FB init failed\n");
+		return NULL;
+	}
+
+	drm_gem_object_put(obj);
+
+	return fb;
 }
 
 static void
@@ -127,13 +150,11 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	if (!plane_config->fb)
 		goto nofb;
 
-	if (intel_alloc_initial_plane_obj(display, plane_config)) {
-		fb = plane_config->fb;
-	} else {
+	fb = intel_alloc_initial_plane_fb(display, plane_config);
+	if (!fb)
 		fb = intel_reuse_initial_plane_fb(crtc, all_plane_configs);
-		if (!fb)
-			goto nofb;
-	}
+	if (!fb)
+		goto nofb;
 
 	plane_state->uapi.rotation = plane_config->rotation;
 	intel_fb_fill_view(to_intel_framebuffer(fb),
@@ -189,8 +210,6 @@ static void plane_config_fini(struct intel_display *display,
 
 		plane_config->fb = NULL;
 	}
-
-	display->parent->initial_plane->config_fini(plane_config);
 }
 
 void intel_initial_plane_config(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index bd5fd11fdc49..bbe5960b1b14 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -78,10 +78,11 @@ initial_plane_phys(struct drm_i915_private *i915,
 	return true;
 }
 
-static struct i915_vma *
-initial_plane_vma(struct drm_i915_private *i915,
-		  struct intel_initial_plane_config *plane_config)
+static struct drm_gem_object *
+i915_alloc_initial_plane_obj(struct drm_device *drm,
+			     struct intel_initial_plane_config *plane_config)
 {
+	struct drm_i915_private *i915 = to_i915(drm);
 	struct intel_memory_region *mem;
 	struct drm_i915_gem_object *obj;
 	struct drm_mm_node orig_mm = {};
@@ -203,7 +204,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 		    "Initial plane fb bound to 0x%x in the ggtt (original 0x%x)\n",
 		    i915_ggtt_offset(vma), plane_config->base);
 
-	return vma;
+	return &obj->base;
 
 err_obj:
 	if (drm_mm_node_allocated(&orig_mm))
@@ -212,39 +213,10 @@ initial_plane_vma(struct drm_i915_private *i915,
 	return NULL;
 }
 
-static struct drm_gem_object *
-i915_alloc_initial_plane_obj(struct drm_device *drm,
-			     struct intel_initial_plane_config *plane_config)
+static void
+i915_free_initial_plane_obj(struct drm_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(drm);
-	struct drm_mode_fb_cmd2 mode_cmd = {};
-	struct drm_framebuffer *fb = plane_config->fb;
-	struct i915_vma *vma;
-
-	vma = initial_plane_vma(i915, plane_config);
-	if (!vma)
-		return NULL;
-
-	mode_cmd.pixel_format = fb->format->format;
-	mode_cmd.width = fb->width;
-	mode_cmd.height = fb->height;
-	mode_cmd.pitches[0] = fb->pitches[0];
-	mode_cmd.modifier[0] = fb->modifier;
-	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
-
-	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   intel_bo_to_drm_bo(vma->obj),
-				   fb->format, &mode_cmd)) {
-		drm_dbg_kms(&i915->drm, "intel fb init failed\n");
-		goto err_vma;
-	}
-
-	plane_config->vma = vma;
-	return intel_bo_to_drm_bo(vma->obj);
-
-err_vma:
-	i915_vma_put(vma);
-	return NULL;
+	drm_gem_object_put(obj);
 }
 
 static int
@@ -275,14 +247,8 @@ i915_initial_plane_setup(struct drm_plane_state *_plane_state,
 	return 0;
 }
 
-static void i915_plane_config_fini(struct intel_initial_plane_config *plane_config)
-{
-	if (plane_config->vma)
-		i915_vma_put(plane_config->vma);
-}
-
 const struct intel_display_initial_plane_interface i915_display_initial_plane_interface = {
 	.alloc_obj = i915_alloc_initial_plane_obj,
+	.free_obj = i915_free_initial_plane_obj,
 	.setup = i915_initial_plane_setup,
-	.config_fini = i915_plane_config_fini,
 };
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 1aff8a8304b0..d45ad2ba418c 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -37,10 +37,11 @@ static bool need_pte_local(struct xe_device *xe)
 	return IS_DGFX(xe) || has_lmembar(xe);
 }
 
-static struct xe_bo *
-initial_plane_bo(struct xe_device *xe,
-		 struct intel_initial_plane_config *plane_config)
+static struct drm_gem_object *
+xe_alloc_initial_plane_obj(struct drm_device *drm,
+			   struct intel_initial_plane_config *plane_config)
 {
+	struct xe_device *xe = to_xe_device(drm);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo;
 	resource_size_t phys_base;
@@ -120,42 +121,13 @@ initial_plane_bo(struct xe_device *xe,
 		return NULL;
 	}
 
-	return bo;
-}
-
-static struct drm_gem_object *
-xe_alloc_initial_plane_obj(struct drm_device *drm,
-			   struct intel_initial_plane_config *plane_config)
-{
-	struct xe_device *xe = to_xe_device(drm);
-	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
-	struct drm_framebuffer *fb = plane_config->fb;
-	struct xe_bo *bo;
-
-	mode_cmd.pixel_format = fb->format->format;
-	mode_cmd.width = fb->width;
-	mode_cmd.height = fb->height;
-	mode_cmd.pitches[0] = fb->pitches[0];
-	mode_cmd.modifier[0] = fb->modifier;
-	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
-
-	bo = initial_plane_bo(xe, plane_config);
-	if (!bo)
-		return NULL;
-
-	if (intel_framebuffer_init(to_intel_framebuffer(fb),
-				   &bo->ttm.base, fb->format, &mode_cmd)) {
-		drm_dbg_kms(&xe->drm, "intel fb init failed\n");
-		goto err_bo;
-	}
-	/* Reference handed over to fb */
-	xe_bo_put(bo);
-
 	return &bo->ttm.base;
+}
 
-err_bo:
-	xe_bo_unpin_map_no_vm(bo);
-	return NULL;
+static void
+xe_free_initial_plane_obj(struct drm_gem_object *obj)
+{
+	xe_bo_unpin_map_no_vm(gem_to_xe_bo(obj));
 }
 
 static int
@@ -179,17 +151,11 @@ xe_initial_plane_setup(struct drm_plane_state *_plane_state,
 
 	plane_state->surf = offset;
 
-	plane_config->vma = vma;
-
 	return 0;
 }
 
-static void xe_plane_config_fini(struct intel_initial_plane_config *plane_config)
-{
-}
-
 const struct intel_display_initial_plane_interface xe_display_initial_plane_interface = {
 	.alloc_obj = xe_alloc_initial_plane_obj,
+	.free_obj = xe_free_initial_plane_obj,
 	.setup = xe_initial_plane_setup,
-	.config_fini = xe_plane_config_fini,
 };
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 26aed8878b16..173c01d41385 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -126,9 +126,9 @@ struct intel_display_hdcp_interface {
 
 struct intel_display_initial_plane_interface {
 	struct drm_gem_object *(*alloc_obj)(struct drm_device *drm, struct intel_initial_plane_config *plane_config);
+	void (*free_obj)(struct drm_gem_object *obj);
 	int (*setup)(struct drm_plane_state *plane_state, struct intel_initial_plane_config *plane_config,
 		     struct drm_framebuffer *fb);
-	void (*config_fini)(struct intel_initial_plane_config *plane_config);
 };
 
 struct intel_display_irq_interface {
-- 
2.54.0

