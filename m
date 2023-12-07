Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE85C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8BD10E91A;
	Thu,  7 Dec 2023 15:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F147810E919
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701964711; x=1733500711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vrs7dXBpmIScDP3iopZBQ4m7BvrPH5QO+XFAeSsaSfs=;
 b=T4IKHzGrPnCX3lY/EjZfUPgSe13mcByv6/aPNCZRHXcehFkoyyd1fdcQ
 yftCqnQxpaqfo1RbKVNOmFzmMolsuNYZU+kJcQMDDYlIZWlVY7lw+5oXg
 IjAnFTZE5hgfgSM3+jGQsV3rUUiYLJHjX4xBK6kOmPJe/g1W2fBProXuy
 Ky0wXeKHmcvDE/jAFQgPgumMnebD5yAZYd5njgAV1iIb2sPMHRf7Stfv4
 8tnHYULSNaPIEvt2yUhpSuxsvM+Ka44nGgix8D/gi1JUDb30rJbRcUKoN
 J7TYa5fklig6vtqxvP3CwJkTVr0+Fhtb8fda1Vc/NX5jKRttyXuOiFQQF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384655284"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384655284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765151668"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765151668"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:29 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 2/9] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Date: Thu,  7 Dec 2023 17:58:08 +0200
Message-Id: <20231207155815.2467082-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove all the changes to intel_fb.c. We are about to introduce
implementation without any ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 98 +++++--------------------
 1 file changed, 17 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f7675284907f..77226ec00cb1 100644
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
 
@@ -1885,23 +1870,16 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
 	return intel_plane_check_stride(plane_state);
 }
 
-static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
-{
-	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
-
-	if (intel_fb_uses_dpt(fb))
-		intel_dpt_destroy(intel_fb->dpt_vm);
-}
-
 static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 
 	drm_framebuffer_cleanup(fb);
 
-	intel_frontbuffer_put(intel_fb->frontbuffer);
+	if (intel_fb_uses_dpt(fb))
+		intel_dpt_destroy(intel_fb->dpt_vm);
 
-	intel_user_framebuffer_destroy_vm(fb);
+	intel_frontbuffer_put(intel_fb->frontbuffer);
 
 	kfree(intel_fb);
 }
@@ -1911,16 +1889,15 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
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
@@ -1998,20 +1975,17 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
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
@@ -2037,27 +2011,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
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
@@ -2068,7 +2021,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
-#ifdef I915
 	/*
 	 * gen2/3 display engine uses the fence if present,
 	 * so the tiling mode must match the fb modifier exactly.
@@ -2079,7 +2031,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    "tiling_mode must match fb modifier exactly on gen2/3\n");
 		goto err;
 	}
-#endif
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
 					 mode_cmd->modifier[0]);
@@ -2092,7 +2043,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
-#ifdef I915
 	/*
 	 * If there's a fence, enforce that
 	 * the fb pitch and fence stride match.
@@ -2103,7 +2053,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    mode_cmd->pitches[0], stride);
 		goto err;
 	}
-#endif
 
 	/* FIXME need to adjust LINOFF/TILEOFF accordingly. */
 	if (mode_cmd->offsets[0] != 0) {
@@ -2173,7 +2122,8 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err_free_dpt:
-	intel_user_framebuffer_destroy_vm(fb);
+	if (intel_fb_uses_dpt(fb))
+		intel_dpt_destroy(intel_fb->dpt_vm);
 err:
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
@@ -2187,37 +2137,23 @@ intel_user_framebuffer_create(struct drm_device *dev,
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
-	/* Require vram placement or dma-buf import */
-	if (IS_DGFX(i915) &&
-	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
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
-- 
2.34.1

