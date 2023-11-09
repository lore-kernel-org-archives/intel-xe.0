Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B3CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2C910E8C5;
	Thu,  9 Nov 2023 15:08:20 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645010E21C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:08:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:07:54 +0100
Message-Id: <20231109150759.44549-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
References: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/9] drm/i915/display: Revert remaining changes
 to make xe compile
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

Should be split out instead. This should effectively revert the complete
patch.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  8 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  8 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 35 -------
 .../drm/i915/display/intel_display_types.h    |  4 -
 drivers/gpu/drm/i915/display/intel_fb.c       | 81 +++-------------
 drivers/gpu/drm/i915/display/intel_fbc.c      | 13 ++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 95 ++-----------------
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  4 -
 .../drm/i915/display/skl_universal_plane.c    |  4 -
 10 files changed, 40 insertions(+), 219 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 14eeb42c9e2a3..ef553270c0796 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1069,10 +1069,10 @@ static int
 intel_prepare_plane_fb(struct drm_plane *_plane,
 		       struct drm_plane_state *_new_plane_state)
 {
-	struct intel_plane_state *new_plane_state =
-		to_intel_plane_state(_new_plane_state);
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
 	struct intel_plane *plane = to_intel_plane(_plane);
+	struct intel_plane_state *new_plane_state =
+		to_intel_plane_state(_new_plane_state);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_plane_state->uapi.state);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
@@ -1156,9 +1156,9 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 {
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(_old_plane_state);
-	__maybe_unused struct intel_atomic_state *state =
+	struct intel_atomic_state *state =
 		to_intel_atomic_state(old_plane_state->uapi.state);
-	__maybe_unused struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->dev);
 	struct drm_i915_gem_object *obj = intel_fb_obj(old_plane_state->hw.fb);
 
 	if (!obj)
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 8ed8a623fa98b..b342fad180ca5 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -30,17 +30,15 @@ static const u32 intel_cursor_formats[] = {
 
 static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 {
-	__maybe_unused struct drm_i915_private *dev_priv =
+	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
-	__maybe_unused const struct drm_framebuffer *fb = plane_state->hw.fb;
-	__maybe_unused const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
-#ifdef I915
 	if (DISPLAY_INFO(dev_priv)->cursor_needs_physical)
 		base = sg_dma_address(obj->mm.pages->sgl);
 	else
-#endif
 		base = intel_plane_ggtt_offset(plane_state);
 
 	return base + plane_state->view.color_plane[0].offset;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 82ff5309a0629..28992f368b383 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -42,10 +42,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 
-#ifdef I915
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
-#endif
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
@@ -7073,39 +7071,6 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 	intel_atomic_helper_free_state(i915);
 }
 
-#ifndef I915
-static int i915_gem_object_read_from_page(struct xe_bo *bo,
-					  u32 ofs, u64 *ptr, u32 size)
-{
-	struct ttm_bo_kmap_obj map;
-	void *virtual;
-	bool is_iomem;
-	int ret;
-
-	XE_WARN_ON(size != 8);
-
-	ret = xe_bo_lock(bo, true);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
-	if (ret)
-		goto out_unlock;
-
-	ofs &= ~PAGE_MASK;
-	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
-	if (is_iomem)
-		*ptr = readq((void __iomem *)(virtual + ofs));
-	else
-		*ptr = *(u64 *)(virtual + ofs);
-
-	ttm_bo_kunmap(&map);
-out_unlock:
-	xe_bo_unlock(bo);
-	return ret;
-}
-#endif
-
 static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b5e4b94c129b6..fa285c1f28223 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2111,11 +2111,7 @@ intel_crtc_needs_color_update(const struct intel_crtc_state *crtc_state)
 
 static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	return i915_ggtt_offset(plane_state->ggtt_vma);
-#else
-	return plane_state->ggtt_vma->node.start;
-#endif
 }
 
 static inline struct intel_frontbuffer *
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index bf275b2692b8f..f1cbd026f91f9 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_blend.h>
-#include <drm/drm_damage_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper.h>
 
@@ -17,17 +16,6 @@
 #include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_frontbuffer.h"
-#include "intel_frontbuffer.h"
-
-#ifdef I915
-/*
- * i915 requires obj->__do_not_access.base,
- * xe uses obj->ttm.base
- */
-#define ttm __do_not_access
-#else
-#include <drm/ttm/ttm_bo.h>
-#endif
 
 #define check_array_bounds(i915, a, i) drm_WARN_ON(&(i915)->drm, (i) >= ARRAY_SIZE(a))
 
@@ -749,7 +737,6 @@ intel_fb_align_height(const struct drm_framebuffer *fb,
 	return ALIGN(height, tile_height);
 }
 
-#ifdef I915
 static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 {
 	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
@@ -769,7 +756,6 @@ static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 		return I915_TILING_NONE;
 	}
 }
-#endif
 
 bool intel_fb_modifier_uses_dpt(struct drm_i915_private *i915, u64 modifier)
 {
@@ -1293,6 +1279,7 @@ static bool intel_plane_needs_remap(const struct intel_plane_state *plane_state)
 static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int color_plane,
 				      int plane_width, int *x, int *y)
 {
+	struct drm_i915_gem_object *obj = intel_fb_obj(&fb->base);
 	int ret;
 
 	ret = intel_fb_offset_to_xy(x, y, &fb->base, color_plane);
@@ -1316,15 +1303,13 @@ static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int co
 	 * fb layout agrees with the fence layout. We already check that the
 	 * fb stride matches the fence stride elsewhere.
 	 */
-#ifdef I915
-	if (color_plane == 0 && i915_gem_object_is_tiled(intel_fb_obj(&fb->base)) &&
+	if (color_plane == 0 && i915_gem_object_is_tiled(obj) &&
 	    (*x + plane_width) * fb->base.format->cpp[color_plane] > fb->base.pitches[color_plane]) {
 		drm_dbg_kms(fb->base.dev,
 			    "bad fb plane %d offset: 0x%x\n",
 			    color_plane, fb->base.offsets[color_plane]);
 		return -EINVAL;
 	}
-#endif
 
 	return 0;
 }
@@ -1672,10 +1657,10 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 		max_size = max(max_size, offset + size);
 	}
 
-	if (mul_u32_u32(max_size, tile_size) > obj->ttm.base.size) {
+	if (mul_u32_u32(max_size, tile_size) > obj->base.size) {
 		drm_dbg_kms(&i915->drm,
 			    "fb too big for bo (need %llu bytes, have %zu bytes)\n",
-			    mul_u32_u32(max_size, tile_size), obj->ttm.base.size);
+			    mul_u32_u32(max_size, tile_size), obj->base.size);
 		return -EINVAL;
 	}
 
@@ -1922,16 +1907,15 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-#ifdef I915
 	if (i915_gem_object_is_userptr(obj)) {
-		drm_dbg(fb->dev,
+		drm_dbg(&i915->drm,
 			"attempting to use a userptr for a framebuffer, denied\n");
 		return -EINVAL;
 	}
-#endif
 
-	return drm_gem_handle_create(file, &obj->ttm.base, handle);
+	return drm_gem_handle_create(file, &obj->base, handle);
 }
 
 struct frontbuffer_fence_cb {
@@ -2009,20 +1993,17 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->ttm.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
+	unsigned int tiling, stride;
 	int ret = -EINVAL;
 	int i;
-#ifdef I915
-	unsigned tiling, stride;
-#endif
 
 	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
 	if (!intel_fb->frontbuffer)
 		return -ENOMEM;
 
-#ifdef I915
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -2048,27 +2029,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			goto err;
 		}
 	}
-#else
-	ret = ttm_bo_reserve(&obj->ttm, true, false, NULL);
-	if (ret)
-		goto err;
-	ret = -EINVAL;
-
-	if (!(obj->flags & XE_BO_SCANOUT_BIT)) {
-		/*
-		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
-		 * automatically set when creating FB. We cannot change caching
-		 * mode when the object is VM_BINDed, so we can only set
-		 * coherency with display when unbound.
-		 */
-		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->ttm.base.gpuva.list))) {
-			ttm_bo_unreserve(&obj->ttm);
-			goto err;
-		}
-		obj->flags |= XE_BO_SCANOUT_BIT;
-	}
-	ttm_bo_unreserve(&obj->ttm);
-#endif
 
 	if (!drm_any_plane_has_format(&dev_priv->drm,
 				      mode_cmd->pixel_format,
@@ -2079,7 +2039,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
-#ifdef I915
 	/*
 	 * gen2/3 display engine uses the fence if present,
 	 * so the tiling mode must match the fb modifier exactly.
@@ -2090,7 +2049,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    "tiling_mode must match fb modifier exactly on gen2/3\n");
 		goto err;
 	}
-#endif
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
 					 mode_cmd->modifier[0]);
@@ -2103,7 +2061,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
-#ifdef I915
 	/*
 	 * If there's a fence, enforce that
 	 * the fb pitch and fence stride match.
@@ -2114,7 +2071,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    mode_cmd->pitches[0], stride);
 		goto err;
 	}
-#endif
 
 	/* FIXME need to adjust LINOFF/TILEOFF accordingly. */
 	if (mode_cmd->offsets[0] != 0) {
@@ -2207,36 +2163,23 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	struct drm_i915_gem_object *obj;
 	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
-	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_i915_private *i915;
 
-#ifdef I915
 	obj = i915_gem_object_lookup(filp, mode_cmd.handles[0]);
 	if (!obj)
 		return ERR_PTR(-ENOENT);
 
 	/* object is backed with LMEM for discrete */
+	i915 = to_i915(obj->base.dev);
 	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		drm_dbg_kms(&i915->drm, "framebuffer must reside in local memory\n");
 		return ERR_PTR(-EREMOTE);
 	}
-#else
-	struct drm_gem_object *gem = drm_gem_object_lookup(filp, mode_cmd.handles[0]);
-	if (!gem)
-		return ERR_PTR(-ENOENT);
-
-	obj = gem_to_xe_bo(gem);
-	/* Require vram exclusive objects, but allow dma-buf imports */
-	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
-	    obj->ttm.type != ttm_bo_type_sg) {
-		drm_gem_object_put(gem);
-		return ERR_PTR(-EREMOTE);
-	}
-#endif
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	drm_gem_object_put(&obj->ttm.base);
+	i915_gem_object_put(obj);
 
 	return fb;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 1152bd4cb8f84..15721fb2ef5d8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -453,7 +453,6 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 
 	intel_de_write(i915, DPFC_CB_BASE,
 		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
-
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -612,8 +611,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
+#ifdef I915
 	if (intel_gt_support_legacy_fencing(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
+#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
@@ -800,7 +801,6 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
 		    i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
-
 	return 0;
 
 err_llb:
@@ -978,7 +978,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	__maybe_unused struct drm_i915_private *i915 = to_i915(state->base.dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -993,7 +993,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-
+#ifdef I915
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
@@ -1002,6 +1002,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	if (plane_state->flags & PLANE_HAS_FENCE)
 		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
 	else
+#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1011,6 +1012,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1028,6 +1030,9 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
 		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
+#else
+	return true;
+#endif
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 28b9aa9d52c26..31d0d695d5671 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -43,12 +43,8 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
-#ifdef I915
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_mman.h"
-#else
-#include "xe_gt.h"
-#endif
 
 #include "i915_drv.h"
 #include "intel_display_types.h"
@@ -57,14 +53,6 @@
 #include "intel_fbdev.h"
 #include "intel_frontbuffer.h"
 
-#ifdef I915
-/*
- * i915 requires obj->__do_not_access.base,
- * xe uses obj->ttm.base
- */
-#define ttm __do_not_access
-#endif
-
 struct intel_fbdev {
 	struct drm_fb_helper helper;
 	struct intel_framebuffer *fb;
@@ -142,13 +130,9 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
 	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
-#ifdef I915
 	struct drm_i915_gem_object *obj = to_intel_bo(bo);
 
 	return i915_gem_fb_mmap(obj, vma);
-#else
-	return drm_gem_prime_mmap(bo, vma);
-#endif
 }
 
 static const struct fb_ops intelfb_ops = {
@@ -180,19 +164,14 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 
-#ifdef I915
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
-#else
-	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
-				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
-#endif
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-#ifdef I915
+
 	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
@@ -211,13 +190,6 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 		if (IS_ERR(obj))
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
-#else
-	/* XXX: Care about stolen? */
-	obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
-				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
-				   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
-#endif
 
 	if (IS_ERR(obj)) {
 		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
@@ -225,16 +197,10 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	}
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	if (IS_ERR(fb)) {
-#ifdef I915
-		i915_gem_object_put(obj);
-#else
-		xe_bo_unpin_map_no_vm(obj);
-#endif
+	i915_gem_object_put(obj);
+	if (IS_ERR(fb))
 		return PTR_ERR(fb);
-	}
 
-	drm_gem_object_put(&obj->ttm.base);
 	ifbdev->fb = to_intel_framebuffer(fb);
 	return 0;
 }
@@ -247,6 +213,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -257,10 +224,8 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	bool prealloc = false;
 	void __iomem *vaddr;
 	struct drm_i915_gem_object *obj;
-	int ret;
-#ifdef I915
 	struct i915_gem_ww_ctx ww;
-#endif
+	int ret;
 
 	mutex_lock(&ifbdev->hpd_lock);
 	ret = ifbdev->hpd_suspended ? -EAGAIN : 0;
@@ -318,7 +283,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	info->fbops = &intelfb_ops;
 
 	obj = intel_fb_obj(&intel_fb->base);
-#ifdef I915
 	if (i915_gem_object_is_lmem(obj)) {
 		struct intel_memory_region *mem = obj->mm.region;
 
@@ -328,8 +292,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 					i915_gem_object_get_dma_address(obj, 0));
 		info->fix.smem_len = obj->base.size;
 	} else {
-		struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
-
 		/* Our framebuffer is the entirety of fbdev's system memory */
 		info->fix.smem_start =
 			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
@@ -351,38 +313,11 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		}
 	}
 
-#else
-	/* XXX: Could be pure fiction.. */
-	if (obj->flags & XE_BO_CREATE_VRAM0_BIT) {
-		struct xe_gt *gt = to_gt(dev_priv);
-		bool lmem;
-
-		info->fix.smem_start =
-			(unsigned long)(gt->mem.vram.io_start + xe_bo_addr(obj, 0, 4096, &lmem));
-		info->fix.smem_len = obj->ttm.base.size;
-
-	} else {
-		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-
-		info->fix.smem_start = pci_resource_start(pdev, 2) + xe_bo_ggtt_addr(obj);
-		info->fix.smem_len = obj->ttm.base.size;
-	}
-
-	/* TODO: ttm_bo_kmap? */
-	vaddr = obj->vmap.vaddr;
-#endif
-	if (IS_ERR(vaddr)) {
-		drm_err(&dev_priv->drm,
-			"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
-		ret = PTR_ERR(vaddr);
-		goto out_unpin;
-	}
-
 	if (ret)
 		goto out_unpin;
 
 	info->screen_base = vaddr;
-	info->screen_size = obj->ttm.base.size;
+	info->screen_size = vma->size;
 
 	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
 
@@ -390,23 +325,14 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	 * If the object is stolen however, it will be full of whatever
 	 * garbage was left in there.
 	 */
-#ifdef I915
 	if (!i915_gem_object_is_shmem(vma->obj) && !prealloc)
-#else
-	/* XXX: Check stolen bit? */
-	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT) && !prealloc)
-#endif
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
 	drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
 		    ifbdev->fb->base.width, ifbdev->fb->base.height,
-#ifdef I915
 		    i915_ggtt_offset(vma));
-#else
-		    (u32)vma->node.start);
-#endif
 	ifbdev->vma = vma;
 	ifbdev->vma_flags = flags;
 
@@ -498,12 +424,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 			continue;
 		}
 
-		if (obj->ttm.base.size > max_size) {
+		if (obj->base.size > max_size) {
 			drm_dbg_kms(&i915->drm,
 				    "found possible fb from [PLANE:%d:%s]\n",
 				    plane->base.base.id, plane->base.name);
 			fb = to_intel_framebuffer(plane_state->uapi.fb);
-			max_size = obj->ttm.base.size;
+			max_size = obj->base.size;
 		}
 	}
 
@@ -777,13 +703,8 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	 * been restored from swap. If the object is stolen however, it will be
 	 * full of whatever garbage was left in there.
 	 */
-#ifdef I915
 	if (state == FBINFO_STATE_RUNNING &&
 	    !i915_gem_object_is_shmem(intel_fb_obj(&ifbdev->fb->base)))
-#else
-	if (state == FBINFO_STATE_RUNNING &&
-	    !(intel_fb_obj(&ifbdev->fb->base)->flags & XE_BO_CREATE_SYSTEM_BIT))
-#endif
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index d64ce5bfeca82..2ea37c0414a95 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -190,7 +190,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = intel_bo_to_i915((front->obj));
+	struct drm_i915_private *i915 = intel_bo_to_i915(front->obj);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -259,6 +259,7 @@ static void frontbuffer_release(struct kref *ref)
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
 	i915_ggtt_clear_scanout(obj);
+
 	ret = i915_gem_object_set_frontbuffer(obj, NULL);
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, ret);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
@@ -289,12 +290,12 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 			 frontbuffer_retire,
 			 I915_ACTIVE_RETIRE_SLEEPS);
 	INIT_WORK(&front->flush_work, intel_frontbuffer_flush_work);
+
 	spin_lock(&i915->display.fb_tracking.lock);
 	cur = i915_gem_object_set_frontbuffer(obj, front);
 	spin_unlock(&i915->display.fb_tracking.lock);
 	if (cur != front)
 		kfree(front);
-
 	return cur;
 }
 
@@ -337,7 +338,7 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	}
 
 	if (new) {
-		drm_WARN_ON(&intel_bo_to_i915(old->obj)->drm,
+		drm_WARN_ON(&intel_bo_to_i915(new->obj)->drm,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 00467d513e74d..abb51e8bb9200 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,10 +28,6 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#ifndef I915
-#include "xe_bo.h"
-#endif
-
 #include "i915_active_types.h"
 
 struct drm_i915_private;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 68eabe089aaf4..a24e66aa7ba44 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2453,15 +2453,11 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		fb->modifier = DRM_FORMAT_MOD_LINEAR;
 		break;
 	case PLANE_CTL_TILED_X:
-#ifdef I915
 		plane_config->tiling = I915_TILING_X;
-#endif
 		fb->modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_CTL_TILED_Y:
-#ifdef I915
 		plane_config->tiling = I915_TILING_Y;
-#endif
 		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 			if (DISPLAY_VER(dev_priv) >= 14)
 				fb->modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
-- 
2.39.2

