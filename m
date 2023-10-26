Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF9FC25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395D010E7F5;
	Thu, 26 Oct 2023 14:09:25 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7110E7F5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:09:23 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 16:09:11 +0200
Message-Id: <20231026140914.10649-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
 <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/15] drm/i915/display: Revert remaining changes
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_fb.c    | 81 +++---------------
 drivers/gpu/drm/i915/display/intel_fbdev.c | 95 ++--------------------
 2 files changed, 20 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 0366926e0d95..55bebebf2f61 100644
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
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 28b9aa9d52c2..31d0d695d567 100644
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
-- 
2.40.1

