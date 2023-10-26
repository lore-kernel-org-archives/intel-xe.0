Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85411C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A7610E7FA;
	Thu, 26 Oct 2023 14:09:35 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732810E7F8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:09:26 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 16:09:13 +0200
Message-Id: <20231026140914.10649-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
 <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/15] FIXME drm/i915/display: Minimal changes to
 fbdev to make xe work
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

BO creation, allocation and placement is slightly different from i915 vs xe.

This is one of the few times we cannot hide between macros,
so make the most of it. :)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 79 +++++++++++++++++++---
 1 file changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 31d0d695d567..f6cef1302cd2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -45,6 +45,7 @@
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_mman.h"
+#include "gem/i915_gem_object.h"
 
 #include "i915_drv.h"
 #include "intel_display_types.h"
@@ -173,6 +174,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	size = PAGE_ALIGN(size);
 
 	obj = ERR_PTR(-ENODEV);
+#ifdef I915
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
 						  I915_BO_ALLOC_CONTIGUOUS |
@@ -185,11 +187,35 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 		 *
 		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
 		 */
-		if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
+		if (!(IS_METEORLAKE(dev_priv)) &&
+		    size * 2 < i915_gem_stolen_area_size(dev_priv))
 			obj = i915_gem_object_create_stolen(dev_priv, size);
 		if (IS_ERR(obj))
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
+#else
+	/*
+	 * The semantics for xe_bo_create_pin_map are different from those
+	 * of i915_gem_object_create_*(), and need to be destroyed with
+	 * xe_bo_unpin_map_no_vm().
+	 */
+	if (!IS_DGFX(dev_priv) && !IS_METEORLAKE(dev_priv) &&
+	    size * 2 < i915_gem_stolen_area_size(dev_priv)) {
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
+					   NULL, size, ttm_bo_type_kernel,
+					   XE_BO_CREATE_STOLEN_BIT |
+					   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
+		if (!IS_ERR(obj))
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
+		else
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
+	}
+	if (IS_ERR(obj))
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
+					   NULL, size, ttm_bo_type_kernel,
+					   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
+					   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
+#endif
 
 	if (IS_ERR(obj)) {
 		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
@@ -197,10 +223,18 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	}
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
-	if (IS_ERR(fb))
+	if (IS_ERR(fb)) {
+#ifdef I915
+		i915_gem_object_put(obj);
+#else
+		/* undo pin/map, or we get a WARN */
+		xe_bo_unpin_map_no_vm(obj);
+#endif
 		return PTR_ERR(fb);
+	}
 
+	/* reference transferred to fb */
+	drm_gem_object_put(intel_bo_to_drm_bo(obj));
 	ifbdev->fb = to_intel_framebuffer(fb);
 	return 0;
 }
@@ -213,7 +247,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -224,8 +257,10 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	bool prealloc = false;
 	void __iomem *vaddr;
 	struct drm_i915_gem_object *obj;
-	struct i915_gem_ww_ctx ww;
 	int ret;
+#ifdef I915
+	struct i915_gem_ww_ctx ww;
+#endif
 
 	mutex_lock(&ifbdev->hpd_lock);
 	ret = ifbdev->hpd_suspended ? -EAGAIN : 0;
@@ -283,6 +318,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	info->fbops = &intelfb_ops;
 
 	obj = intel_fb_obj(&intel_fb->base);
+#ifdef I915
 	if (i915_gem_object_is_lmem(obj)) {
 		struct intel_memory_region *mem = obj->mm.region;
 
@@ -292,6 +328,8 @@ static int intelfb_create(struct drm_fb_helper *helper,
 					i915_gem_object_get_dma_address(obj, 0));
 		info->fix.smem_len = obj->base.size;
 	} else {
+		struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
+
 		/* Our framebuffer is the entirety of fbdev's system memory */
 		info->fix.smem_start =
 			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
@@ -312,12 +350,35 @@ static int intelfb_create(struct drm_fb_helper *helper,
 			continue;
 		}
 	}
+#else
+	if (obj->flags & XE_BO_CREATE_STOLEN_BIT) {
+		info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
+	} else {
+		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+		info->fix.smem_start = pci_resource_start(pdev, 2);
+		if (obj->flags & XE_BO_CREATE_VRAM0_BIT)
+			info->fix.smem_start += xe_bo_addr(obj, 0, XE_PAGE_SIZE);
+		else
+			info->fix.smem_start += xe_bo_ggtt_addr(obj);
+	}
+	info->fix.smem_len = obj->ttm.base.size;
+
+	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
+	vaddr = obj->vmap.vaddr_iomem;
+#endif
+	if (IS_ERR(vaddr)) {
+		drm_err(&dev_priv->drm,
+			"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
+		ret = PTR_ERR(vaddr);
+		goto out_unpin;
+	}
 
 	if (ret)
 		goto out_unpin;
 
 	info->screen_base = vaddr;
-	info->screen_size = vma->size;
+	info->screen_size = intel_bo_to_drm_bo(obj)->size;
 
 	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
 
@@ -325,7 +386,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	 * If the object is stolen however, it will be full of whatever
 	 * garbage was left in there.
 	 */
-	if (!i915_gem_object_is_shmem(vma->obj) && !prealloc)
+	if (!i915_gem_object_is_shmem(obj) && !prealloc)
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
@@ -424,12 +485,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 			continue;
 		}
 
-		if (obj->base.size > max_size) {
+		if (intel_bo_to_drm_bo(obj)->size > max_size) {
 			drm_dbg_kms(&i915->drm,
 				    "found possible fb from [PLANE:%d:%s]\n",
 				    plane->base.base.id, plane->base.name);
 			fb = to_intel_framebuffer(plane_state->uapi.fb);
-			max_size = obj->base.size;
+			max_size = intel_bo_to_drm_bo(obj)->size;
 		}
 	}
 
-- 
2.40.1

