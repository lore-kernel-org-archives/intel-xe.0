Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA7C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A288410E4F2;
	Wed, 15 Nov 2023 06:32:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B6310E4F0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029950; x=1731565950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TVDib7VZo+e4/G4Q24bTJ8b8XVCR0RX0Z56Ie4iRpD4=;
 b=N9p6L3R4/KMGpWn0oILAwoX2a+CIl0znGiIt7N3M+6SljmkgmSdeh/wC
 lewjv66/nHIfwbrjsgjglXklnDjfJvZUTCkwwKbrELLrML518a/5sl0qq
 jWVFzvCKZwHzN/tVWRsJAhcjShFIgQTWYjHpY8YcrQ5HfJKljHneKIRbe
 LW7FONxyQMwnMlZ7vb/b9ktMxVKCuVnMzTM33pZGTJb4gZLOK0GhMXQKX
 ELfLYtsrp+2OCJr+Y15+ZANwJZUJFFcR3u4Iu7i06xcy/32BHucrii3ZV
 KT+oRT6bM7IKaqxLT3CTQ7Mds3AL7534Met4YFJzcZ5/mvpOjgo/Gc93f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616495"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616495"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389744"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389744"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:28 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:03 +0200
Message-Id: <20231115063210.3112123-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/9] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel_fbdev changes from "FIXME: drm/i915/display: Remaining changes
to make xe compile" patch. We are about to introdouce common and i915/xe
specific implementation without any ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 95 ++--------------------
 1 file changed, 8 insertions(+), 87 deletions(-)

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
2.34.1

