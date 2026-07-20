Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018A1C4452E
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982FB10E9F5;
	Mon, 20 Jul 2026 16:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="I4cdi1xg";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C608D10E9ED;
 Mon, 20 Jul 2026 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564046;
 bh=hmj4HKcsRj0jY0d2wjNlT4Bq/AHy8mEzSs6+FAaoqq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I4cdi1xgmDgLhquJa92MEa2FYJGGpdhZCnNmGdxwD28PJF24VrMWar4jlOzT0inLX
 h88yyihX2xTdoDeQc7WI8d7/dFFjfiOp/rlrRn07NmNLMrikRPMnGwEehUtT9k53su
 ddsDB5o6w39DyZOIxtGk5hZyOxfWRWjB0aOPBuYCY3lKRLEPd2+FXldhfUYEIXZnYk
 lCtCT0+Qi0Qa38XnaeHWbOxWUe3q98PCvX9bdWxoSaxMFO9pLqybV2GzObRPz8U61/
 HUV5s9ejgZkrtt45TBWBGkKLnaeTqtUlLH3tQAvhKLrzBye2k6kSYpkeXbv2iweARt
 0M4b8gbRm6SEw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 11/11] drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
Date: Mon, 20 Jul 2026 18:15:03 +0200
Message-ID: <20260720161451.384968-24-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pull the "do we want to use stolen for the BIOS FB?" checks into
a new intel_bo_fbdev_bios_fb_takeover() helper, and defer that
decision until we're ready to reallocate the fbdev FB. This way
even if we don't want to ultimately use the BIOS FB we'll keep
the plane enabled until the replacement FB is ready. Should
hopefully result in fewer display blinks during boot.

Additionally, on some platforms this allows us to re-create the
framebuffer when stolen memory is not suitable, using the blitter
engine to copy the contents to system memory without causing
any flickering by not preserving the stolen memory allocation.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bo.c       |  7 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 68 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_bo.c                | 14 +++-
 drivers/gpu/drm/i915/i915_bo.h                |  6 --
 drivers/gpu/drm/i915/i915_initial_plane.c     | 14 ----
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 56 ++++++++++++++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  8 ---
 include/drm/intel/display_parent_interface.h  |  1 +
 10 files changed, 134 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index 8ecdbb7e39f3d..878c62cb48b4f 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -92,6 +92,13 @@ u32 intel_bo_fbdev_pitch_align(struct intel_display *display, u32 stride)
 	return display->parent->bo->fbdev_pitch_align(stride);
 }
 
+struct drm_gem_object *intel_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj)
+{
+	struct intel_display *display = to_intel_display(obj->dev);
+
+	return display->parent->bo->fbdev_bios_fb_takeover(obj);
+}
+
 struct drm_gem_object *intel_bo_fbdev_create(struct intel_display *display, int size)
 {
 	return display->parent->bo->fbdev_create(display->drm, size);
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index 348f7fa669608..0410ee9c6d2e1 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -34,6 +34,7 @@ struct drm_gem_object *intel_bo_framebuffer_lookup(struct intel_display *display
 						   const struct drm_mode_fb_cmd2 *user_mode_cmd);
 
 u32 intel_bo_fbdev_pitch_align(struct intel_display *display, u32 stride);
+struct drm_gem_object *intel_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj);
 struct drm_gem_object *intel_bo_fbdev_create(struct intel_display *display, int size);
 void intel_bo_fbdev_destroy(struct drm_gem_object *obj);
 int intel_bo_fbdev_fill_info(struct drm_gem_object *obj, struct fb_info *info,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index db0e36dd8722f..aac35b1ec0306 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -225,11 +225,11 @@ static void intel_fbdev_fill_mode_cmd(struct intel_display *display,
 
 static struct intel_framebuffer *
 __intel_fbdev_fb_alloc(struct intel_display *display,
-		       struct drm_fb_helper_surface_size *sizes)
+		       struct drm_fb_helper_surface_size *sizes,
+		       struct drm_gem_object *obj)
 {
 	struct drm_mode_fb_cmd2 mode_cmd = {};
 	struct drm_framebuffer *fb;
-	struct drm_gem_object *obj;
 	int size;
 
 	intel_fbdev_fill_mode_cmd(display, sizes, &mode_cmd);
@@ -262,32 +262,68 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
 
 }
 
-static bool bios_fb_ok(const struct intel_framebuffer *fb,
-		       const struct drm_fb_helper_surface_size *sizes)
+static struct intel_framebuffer *
+__intel_fbdev_fb_realloc(struct intel_display *display,
+			 const struct drm_framebuffer *orig_fb,
+			 struct drm_gem_object *obj)
+{
+	struct drm_framebuffer *new_fb;
+	struct drm_mode_fb_cmd2 mode_cmd = {
+		.flags = DRM_MODE_FB_MODIFIERS,
+		.width = orig_fb->width,
+		.height = orig_fb->height,
+		.pitches[0] = orig_fb->pitches[0],
+		.offsets[0] = orig_fb->offsets[0],
+		.pixel_format = orig_fb->format->format,
+		.modifier[0] = orig_fb->modifier,
+	};
+
+	new_fb = intel_framebuffer_create(obj, orig_fb->format, &mode_cmd);
+
+	if (IS_ERR(new_fb)) {
+		intel_bo_fbdev_destroy(obj);
+		return ERR_CAST(new_fb);
+	}
+
+	drm_gem_object_put(obj);
+	return to_intel_framebuffer(new_fb);
+}
+
+static struct intel_framebuffer *bios_fb_pick(struct intel_framebuffer *fb,
+					      const struct drm_fb_helper_surface_size *sizes)
 {
 	struct intel_display *display = to_intel_display(fb->base.dev);
 	int width = fb->base.width;
 	int height = fb->base.height;
 	int depth = fb->base.format->depth;
 	int bpp = fb->base.format->cpp[0] * 8;
+	struct drm_gem_object *new;
 
 	if (sizes->fb_width > width || sizes->fb_height > height) {
 		drm_dbg_kms(display->drm,
 			    "BIOS fb too small (%dx%d), we require (%dx%d), releasing it\n",
 			    width, height, sizes->fb_width, sizes->fb_height);
-		return false;
+		return NULL;
 	}
 
 	if (sizes->surface_depth != depth || sizes->surface_bpp != bpp) {
 		drm_dbg_kms(display->drm,
 			    "BIOS fb using wrong depth/bpp (%d/%d), we require (%d/%d), releasing it\n",
 			    depth, bpp, sizes->surface_depth, sizes->surface_bpp);
-		return false;
+		return NULL;
 	}
 
-	return true;
+	new = intel_bo_fbdev_bios_fb_takeover(fb->base.obj[0]);
+	if (IS_ERR(new))
+		return ERR_CAST(new);
+	if (fb->base.obj[0] == new)
+		return fb;
+
+	/* Different object, re-create an intel_framebuffer around it */
+	return __intel_fbdev_fb_realloc(display, &fb->base, new);
 }
 
+
 int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				   struct drm_fb_helper_surface_size *sizes)
 {
@@ -305,9 +341,19 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	ifbdev->fb = NULL;
 
-	if (fb && !bios_fb_ok(fb, sizes)) {
-		drm_framebuffer_put(&fb->base);
-		fb = NULL;
+	if (fb) {
+		struct intel_framebuffer *bios_fb =
+			bios_fb_pick(fb, sizes);
+
+		if (IS_ERR(bios_fb)) {
+			drm_dbg_kms(display->drm, "Re-using BIOS fb failed (%pe).", bios_fb);
+			bios_fb = NULL;
+		}
+
+		if (fb != bios_fb) {
+			drm_framebuffer_put(&fb->base);
+			fb = bios_fb;
+		}
 	}
 
 	wakeref = intel_display_rpm_get(display);
@@ -316,7 +362,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		drm_dbg_kms(display->drm,
 			    "no BIOS fb, allocating a new one\n");
 
-		fb = __intel_fbdev_fb_alloc(display, sizes);
+		fb = __intel_fbdev_fb_alloc(display, sizes, NULL);
 		if (IS_ERR(fb)) {
 			ret = PTR_ERR(fb);
 			goto out_unlock;
diff --git a/drivers/gpu/drm/i915/i915_bo.c b/drivers/gpu/drm/i915/i915_bo.c
index 559341103ca7d..fe11c0be81013 100644
--- a/drivers/gpu/drm/i915/i915_bo.c
+++ b/drivers/gpu/drm/i915/i915_bo.c
@@ -150,7 +150,7 @@ static u32 i915_bo_fbdev_pitch_align(u32 stride)
 	return ALIGN(stride, 64);
 }
 
-bool i915_bo_fbdev_prefer_stolen(struct drm_i915_private *i915, unsigned int size)
+static bool i915_bo_fbdev_prefer_stolen(struct drm_i915_private *i915, unsigned int size)
 {
 	/* Skip stolen on MTL as Wa_22018444074 mitigation. */
 	if (IS_METEORLAKE(i915))
@@ -164,6 +164,17 @@ bool i915_bo_fbdev_prefer_stolen(struct drm_i915_private *i915, unsigned int siz
 	return i915->dsm.usable_size >= size * 2;
 }
 
+static struct drm_gem_object *i915_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->dev);
+
+	if (HAS_LMEM(i915) ||
+	    i915_bo_fbdev_prefer_stolen(i915, obj->size))
+		return obj;
+
+	return ERR_PTR(-EIO);
+}
+
 static struct drm_gem_object *i915_bo_fbdev_create(struct drm_device *drm, int size)
 {
 	struct drm_i915_private *i915 = to_i915(drm);
@@ -262,6 +273,7 @@ const struct intel_display_bo_interface i915_display_bo_interface = {
 	.framebuffer_fini = i915_bo_framebuffer_fini,
 	.framebuffer_lookup = i915_bo_framebuffer_lookup,
 #if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+	.fbdev_bios_fb_takeover = i915_bo_fbdev_bios_fb_takeover,
 	.fbdev_create = i915_bo_fbdev_create,
 	.fbdev_destroy = i915_bo_fbdev_destroy,
 	.fbdev_fill_info = i915_bo_fbdev_fill_info,
diff --git a/drivers/gpu/drm/i915/i915_bo.h b/drivers/gpu/drm/i915/i915_bo.h
index 39ba62696550e..57255d052dd9a 100644
--- a/drivers/gpu/drm/i915/i915_bo.h
+++ b/drivers/gpu/drm/i915/i915_bo.h
@@ -4,12 +4,6 @@
 #ifndef __I915_BO_H__
 #define __I915_BO_H__
 
-#include <linux/types.h>
-
-struct drm_i915_private;
-
-bool i915_bo_fbdev_prefer_stolen(struct drm_i915_private *i915, unsigned int size);
-
 extern const struct intel_display_bo_interface i915_display_bo_interface;
 
 #endif /* __I915_BO_H__ */
diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 98858a78e46a3..d7792b65ec150 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -12,7 +12,6 @@
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 
-#include "i915_bo.h"
 #include "i915_drv.h"
 #include "i915_initial_plane.h"
 
@@ -102,19 +101,6 @@ initial_plane_vma(struct drm_i915_private *i915,
 			mem->min_page_size);
 	size -= base;
 
-	/*
-	 * If the FB is too big, just don't use it since fbdev is not very
-	 * important and we should probably use that space with FBC or other
-	 * features.
-	 */
-	if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
-	    IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-	    mem == i915->mm.stolen_region &&
-	    !i915_bo_fbdev_prefer_stolen(i915, size)) {
-		drm_dbg_kms(&i915->drm, "Initial FB size exceeds half of stolen, discarding\n");
-		return NULL;
-	}
-
 	obj = i915_gem_object_create_region_at(mem, phys_base, size,
 					       I915_BO_ALLOC_USER |
 					       I915_BO_PREALLOC);
diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index d78d893210c4f..188796ae85933 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -9,6 +9,7 @@
 #include "intel_fb.h"
 #include "xe_bo.h"
 #include "xe_display_bo.h"
+#include "xe_migrate.h"
 #include "xe_pxp.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_wa.h"
@@ -120,7 +121,7 @@ static u32 xe_display_bo_fbdev_pitch_align(u32 stride)
 	return ALIGN(stride, XE_PAGE_SIZE);
 }
 
-bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
+static bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 {
 	struct ttm_resource_manager *stolen;
 
@@ -152,6 +153,58 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 	return stolen->size >= (size * 2) >> PAGE_SHIFT;
 }
 
+static struct drm_gem_object *xe_display_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj)
+{
+	struct xe_bo *orig_bo = gem_to_xe_bo(obj), *copy_bo;
+	struct xe_device *xe = xe_bo_device(orig_bo);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	int err;
+
+	if (IS_DGFX(xe) ||
+	    xe_display_bo_fbdev_prefer_stolen(xe, xe_bo_size(orig_bo)))
+		return obj;
+
+	copy_bo = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), xe_bo_size(orig_bo),
+					    ttm_bo_type_kernel,
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,
+					    false);
+	if (IS_ERR(copy_bo))
+		return ERR_CAST(copy_bo);
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		struct dma_fence *fence;
+
+		drm_exec_lock_obj(&exec, &orig_bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+
+		drm_exec_lock_obj(&exec, &copy_bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+
+		err = dma_resv_reserve_fences(orig_bo->ttm.base.resv, 1);
+		if (err)
+			break;
+
+		err = dma_resv_reserve_fences(copy_bo->ttm.base.resv, 1);
+		if (err)
+			break;
+
+		fence = xe_migrate_copy(xe_device_get_root_tile(xe)->migrate, orig_bo, copy_bo,
+					orig_bo->ttm.resource, copy_bo->ttm.resource, false);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			break;
+		}
+
+		dma_resv_add_fence(copy_bo->ttm.base.resv, fence, DMA_RESV_USAGE_KERNEL);
+		dma_resv_add_fence(orig_bo->ttm.base.resv, fence, DMA_RESV_USAGE_BOOKKEEP);
+		return &copy_bo->ttm.base;
+	}
+
+	xe_bo_unpin_map_no_vm(copy_bo);
+	return ERR_PTR(err);
+}
+
 static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm, int size)
 {
 	struct xe_device *xe = to_xe_device(drm);
@@ -214,6 +267,7 @@ const struct intel_display_bo_interface xe_display_bo_interface = {
 	.framebuffer_fini = xe_display_bo_framebuffer_fini,
 	.framebuffer_lookup = xe_display_bo_framebuffer_lookup,
 #if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+	.fbdev_bios_fb_takeover = xe_display_bo_fbdev_bios_fb_takeover,
 	.fbdev_create = xe_display_bo_fbdev_create,
 	.fbdev_destroy = xe_display_bo_fbdev_destroy,
 	.fbdev_fill_info = xe_display_bo_fbdev_fill_info,
diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.h b/drivers/gpu/drm/xe/display/xe_display_bo.h
index c72056884ff41..6879c104b0b1f 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.h
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.h
@@ -4,12 +4,6 @@
 #ifndef __XE_DISPLAY_BO_H__
 #define __XE_DISPLAY_BO_H__
 
-#include <linux/types.h>
-
-struct xe_device;
-
-bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size);
-
 extern const struct intel_display_bo_interface xe_display_bo_interface;
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 1366b68f43fc2..a3dbd402c94e7 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -14,7 +14,6 @@
 #include "intel_display_types.h"
 
 #include "xe_bo.h"
-#include "xe_display_bo.h"
 #include "xe_display_vma.h"
 #include "xe_fb_pin.h"
 #include "xe_ggtt.h"
@@ -90,13 +89,6 @@ initial_plane_bo(struct xe_device *xe,
 
 		flags |= XE_BO_FLAG_STOLEN;
 		phys_base -= xe_ttm_stolen_gpu_offset(xe);
-
-		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
-		    !xe_display_bo_fbdev_prefer_stolen(xe, plane_config->size)) {
-			drm_info(&xe->drm, "Initial FB size exceeds half of stolen, discarding\n");
-			return NULL;
-		}
 	}
 
 	original_ggtt_node = xe_ggtt_reserve_area(tile0->mem.ggtt, base, size);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index de395df9ca301..b218f8ecbe22a 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -58,6 +58,7 @@ struct intel_display_bo_interface {
 						     struct drm_file *filp,
 						     const struct drm_mode_fb_cmd2 *user_mode_cmd);
 #if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+	struct drm_gem_object *(*fbdev_bios_fb_takeover)(struct drm_gem_object *obj);
 	struct drm_gem_object *(*fbdev_create)(struct drm_device *drm, int size);
 	void (*fbdev_destroy)(struct drm_gem_object *obj);
 	int (*fbdev_fill_info)(struct drm_gem_object *obj, struct fb_info *info, struct i915_vma *vma);
-- 
2.53.0

