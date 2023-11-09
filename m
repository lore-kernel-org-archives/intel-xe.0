Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745AFC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2051C10E8CB;
	Thu,  9 Nov 2023 15:08:29 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723C110E8C4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:08:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:07:53 +0100
Message-Id: <20231109150759.44549-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
References: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/9] drm/i915/display: Revert all before
 remaining changes to make xe compile
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

    drm/xe/display: Allow scanout of bos that can be migrated to lmem
    drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base

Can probably be slightly ignored by squashing with next patch, at least
for intel_bo_to_drm_bo part.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_fb.c    |  9 ++--
 drivers/gpu/drm/i915/display/intel_fbdev.c | 48 ++++++++--------------
 2 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 1ce61245728a7..bf275b2692b8f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1964,10 +1964,10 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	if (!atomic_read(&front->bits))
 		return 0;
 
-	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
+	if (dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(false)))
 		goto flush;
 
-	ret = dma_resv_get_singleton(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false),
+	ret = dma_resv_get_singleton(obj->base.resv, dma_resv_usage_rw(false),
 				     &fence);
 	if (ret || !fence)
 		goto flush;
@@ -2227,9 +2227,8 @@ intel_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 
 	obj = gem_to_xe_bo(gem);
-	/* Require vram placement or dma-buf import */
-	if (IS_DGFX(i915) &&
-	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
+	/* Require vram exclusive objects, but allow dma-buf imports */
+	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
 	    obj->ttm.type != ttm_bo_type_sg) {
 		drm_gem_object_put(gem);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index b7976706bc681..28b9aa9d52c26 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -48,7 +48,6 @@
 #include "gem/i915_gem_mman.h"
 #else
 #include "xe_gt.h"
-#include "xe_ttm_stolen_mgr.h"
 #endif
 
 #include "i915_drv.h"
@@ -193,8 +192,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-	obj = ERR_PTR(-ENODEV);
 #ifdef I915
+	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
 						  I915_BO_ALLOC_CONTIGUOUS |
@@ -213,23 +212,11 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
 #else
-	if (!IS_DGFX(dev_priv)) {
-		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_PINNED_BIT);
-		if (!IS_ERR(obj))
-			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
-		else
-			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
-	}
-	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
-					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
-					  XE_BO_CREATE_PINNED_BIT);
-	}
+	/* XXX: Care about stolen? */
+	obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+				   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
 #endif
 
 	if (IS_ERR(obj)) {
@@ -365,23 +352,24 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	}
 
 #else
-	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
-		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
-			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
-		else
-			info->fix.smem_start =
-				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
+	/* XXX: Could be pure fiction.. */
+	if (obj->flags & XE_BO_CREATE_VRAM0_BIT) {
+		struct xe_gt *gt = to_gt(dev_priv);
+		bool lmem;
 
+		info->fix.smem_start =
+			(unsigned long)(gt->mem.vram.io_start + xe_bo_addr(obj, 0, 4096, &lmem));
 		info->fix.smem_len = obj->ttm.base.size;
+
 	} else {
-		/* XXX: Pure fiction, as the BO may not be physically accessible.. */
-		info->fix.smem_start = 0;
+		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+		info->fix.smem_start = pci_resource_start(pdev, 2) + xe_bo_ggtt_addr(obj);
 		info->fix.smem_len = obj->ttm.base.size;
 	}
 
-	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
-	vaddr = obj->vmap.vaddr_iomem;
+	/* TODO: ttm_bo_kmap? */
+	vaddr = obj->vmap.vaddr;
 #endif
 	if (IS_ERR(vaddr)) {
 		drm_err(&dev_priv->drm,
-- 
2.39.2

