Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F48C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 12:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AED10E7CB;
	Thu, 26 Oct 2023 12:34:02 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1210E7D3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 12:33:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 14:33:25 +0200
Message-Id: <20231026123326.56044-9-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/15] more reverts
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

---
 drivers/gpu/drm/i915/display/intel_cursor.c   |  8 ++---
 drivers/gpu/drm/i915/display/intel_display.c  | 35 -------------------
 .../drm/i915/display/intel_display_types.h    |  4 ---
 .../drm/i915/display/skl_universal_plane.c    |  4 ---
 4 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 8ed8a623fa98..b342fad180ca 100644
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
index 1b66d5adcebe..2f012ea75fba 100644
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
@@ -7121,39 +7119,6 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
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
index 1861372077f0..e7d4cdfbd62d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2115,11 +2115,7 @@ intel_crtc_needs_color_update(const struct intel_crtc_state *crtc_state)
 
 static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	return i915_ggtt_offset(plane_state->ggtt_vma);
-#else
-	return plane_state->ggtt_vma->node.start;
-#endif
 }
 
 static inline struct intel_frontbuffer *
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7d91344ec1aa..5de0cff00e7d 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2454,15 +2454,11 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
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
2.40.1

