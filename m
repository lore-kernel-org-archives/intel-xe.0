Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F8C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6278E10E7F9;
	Thu, 26 Oct 2023 14:09:32 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6110E7F8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:09:28 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 16:09:14 +0200
Message-Id: <20231026140914.10649-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
 <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/15] FIXME drm/i915/display: Make intel_fb.c
 code compatible with xe
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

Again there are a few changes between Xe and i915, but in general code is similar for both

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 85 +++++++++++++++++--------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 55bebebf2f61..c80656d44b17 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -17,6 +17,8 @@
 #include "intel_fb.h"
 #include "intel_frontbuffer.h"
 
+#include "gem/i915_gem_object.h"
+
 #define check_array_bounds(i915, a, i) drm_WARN_ON(&(i915)->drm, (i) >= ARRAY_SIZE(a))
 
 /*
@@ -737,7 +739,7 @@ intel_fb_align_height(const struct drm_framebuffer *fb,
 	return ALIGN(height, tile_height);
 }
 
-static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
+__maybe_unused static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 {
 	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
 			 INTEL_PLANE_CAP_TILING_MASK;
@@ -1657,10 +1659,10 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 		max_size = max(max_size, offset + size);
 	}
 
-	if (mul_u32_u32(max_size, tile_size) > obj->base.size) {
+	if (mul_u32_u32(max_size, tile_size) > intel_bo_to_drm_bo(obj)->size) {
 		drm_dbg_kms(&i915->drm,
 			    "fb too big for bo (need %llu bytes, have %zu bytes)\n",
-			    mul_u32_u32(max_size, tile_size), obj->base.size);
+			    mul_u32_u32(max_size, tile_size), intel_bo_to_drm_bo(obj)->size);
 		return -EINVAL;
 	}
 
@@ -1907,7 +1909,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->dev);
 
 	if (i915_gem_object_is_userptr(obj)) {
 		drm_dbg(&i915->drm,
@@ -1915,7 +1917,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 		return -EINVAL;
 	}
 
-	return drm_gem_handle_create(file, &obj->base, handle);
+	return drm_gem_handle_create(file, intel_bo_to_drm_bo(obj), handle);
 }
 
 struct frontbuffer_fence_cb {
@@ -1948,10 +1950,10 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	if (!atomic_read(&front->bits))
 		return 0;
 
-	if (dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(false)))
+	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
 		goto flush;
 
-	ret = dma_resv_get_singleton(obj->base.resv, dma_resv_usage_rw(false),
+	ret = dma_resv_get_singleton(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false),
 				     &fence);
 	if (ret || !fence)
 		goto flush;
@@ -1993,10 +1995,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = intel_bo_to_i915(obj);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
-	unsigned int tiling, stride;
+	unsigned int tiling = I915_TILING_NONE, stride = 0;
 	int ret = -EINVAL;
 	int i;
 
@@ -2004,6 +2006,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (!intel_fb->frontbuffer)
 		return -ENOMEM;
 
+#ifdef I915
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -2030,15 +2033,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		}
 	}
 
-	if (!drm_any_plane_has_format(&dev_priv->drm,
-				      mode_cmd->pixel_format,
-				      mode_cmd->modifier[0])) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
-			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
-		goto err;
-	}
-
 	/*
 	 * gen2/3 display engine uses the fence if present,
 	 * so the tiling mode must match the fb modifier exactly.
@@ -2049,6 +2043,36 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    "tiling_mode must match fb modifier exactly on gen2/3\n");
 		goto err;
 	}
+#else
+	ret = ttm_bo_reserve(&obj->ttm, true, false, NULL);
+	if (ret)
+		goto err;
+	ret = -EINVAL;
+
+	if (!(obj->flags & XE_BO_SCANOUT_BIT)) {
+		/*
+		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
+		 * automatically set when creating FB. We cannot change caching
+		 * mode when the object is VM_BINDed, so we can only set
+		 * coherency with display when unbound.
+		 */
+		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->ttm.base.gpuva.list))) {
+			ttm_bo_unreserve(&obj->ttm);
+			goto err;
+		}
+		obj->flags |= XE_BO_SCANOUT_BIT;
+	}
+	ttm_bo_unreserve(&obj->ttm);
+#endif
+
+	if (!drm_any_plane_has_format(&dev_priv->drm,
+				      mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		goto err;
+	}
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
 					 mode_cmd->modifier[0]);
@@ -2111,11 +2135,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-#ifdef I915
-		fb->obj[i] = &obj->base;
-#else
-		fb->obj[i] = &obj->ttm.base;
-#endif
+		fb->obj[i] = intel_bo_to_drm_bo(obj);
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
@@ -2163,23 +2183,32 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	struct drm_i915_gem_object *obj;
 	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
-	struct drm_i915_private *i915;
+	struct drm_i915_private *i915 = to_i915(dev);
+        struct drm_gem_object *gem = drm_gem_object_lookup(filp, mode_cmd.handles[0]);
 
-	obj = i915_gem_object_lookup(filp, mode_cmd.handles[0]);
-	if (!obj)
+	if (!gem)
 		return ERR_PTR(-ENOENT);
 
+	obj = to_intel_bo(gem);
+#ifdef I915
 	/* object is backed with LMEM for discrete */
-	i915 = to_i915(obj->base.dev);
 	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		drm_dbg_kms(&i915->drm, "framebuffer must reside in local memory\n");
 		return ERR_PTR(-EREMOTE);
 	}
+#else
+	/* Require vram placement or dma-buf import */
+	if (XE_IOCTL_DBG(i915, IS_DGFX(i915) && !xe_bo_can_migrate(obj, XE_PL_VRAM0) &&
+			       obj->ttm.type != ttm_bo_type_sg)) {
+		drm_gem_object_put(gem);
+		return ERR_PTR(-EREMOTE);
+	}
+#endif
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
+	drm_gem_object_put(gem);
 
 	return fb;
 }
-- 
2.40.1

