Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:18 -0500
Message-ID: <20230112222538.2000142-18-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 17/37] drm/xe: Allow fbdev to allocate stolen
 memory
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 55 ++++++++++++----------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 176e0e44a268..52dc33c5f6d8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -45,6 +45,7 @@
 #include "gem/i915_gem_lmem.h"
 #else
 #include "xe_gt.h"
+#include "xe_ttm_stolen_mgr.h"
 #endif
 
 #include "i915_drv.h"
@@ -171,8 +172,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-#ifdef I915
 	obj = ERR_PTR(-ENODEV);
+#ifdef I915
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
 						  I915_BO_ALLOC_CONTIGUOUS);
@@ -188,11 +189,22 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
 #else
-	/* XXX: Care about stolen? */
-	obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
-				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
-				   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
+	if (!IS_DGFX(dev_priv)) {
+		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
+					   XE_BO_CREATE_STOLEN_BIT |
+					   XE_BO_CREATE_PINNED_BIT);
+		if (!IS_ERR(obj))
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
+		else
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
+	}
+	if (IS_ERR(obj)) {
+		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
+					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+					  XE_BO_CREATE_PINNED_BIT);
+	}
 #endif
 
 	if (IS_ERR(obj)) {
@@ -317,33 +329,28 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		info->fix.smem_len = vma->size;
 	}
 	vaddr = i915_vma_pin_iomap(vma);
-
 #else
-	/* XXX: Could be pure fiction.. */
-	if (obj->flags & XE_BO_CREATE_VRAM0_BIT) {
-		struct xe_gt *gt = to_gt(dev_priv);
+	info->apertures->ranges[0].base = pci_resource_start(pdev, 2);
+	info->apertures->ranges[0].size = pci_resource_len(pdev, 2);
+	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
 		bool lmem;
 
-		info->apertures->ranges[0].base = gt->mem.vram.io_start;
-		info->apertures->ranges[0].size = gt->mem.vram.size;
+		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
+			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
+		else
+			info->fix.smem_start =
+				pci_resource_start(pdev, 2) +
+				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
 
-		info->fix.smem_start =
-			(unsigned long)(gt->mem.vram.io_start + xe_bo_addr(obj, 0, 4096, &lmem));
 		info->fix.smem_len = obj->ttm.base.size;
-
 	} else {
-		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-
-		info->apertures->ranges[0].base = pci_resource_start(pdev, 2);
-		info->apertures->ranges[0].size =
-			pci_resource_end(pdev, 2) - pci_resource_start(pdev, 2);
-
-		info->fix.smem_start = info->apertures->ranges[0].base + xe_bo_ggtt_addr(obj);
+		/* XXX: Pure fiction, as the BO may not be physically accessible.. */
+		info->fix.smem_start = 0;
 		info->fix.smem_len = obj->ttm.base.size;
 	}
 
-	/* TODO: ttm_bo_kmap? */
-	vaddr = obj->vmap.vaddr;
+	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
+	vaddr = obj->vmap.vaddr_iomem;
 #endif
 
 	if (IS_ERR(vaddr)) {
-- 
2.38.1


