Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F3FC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32D10E8CC;
	Fri,  1 Dec 2023 15:39:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3924110E096
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701445192; x=1732981192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7oXGaEjRBTSIvzLcLjS9GHvDNVJm7lK2UHbniAb8qE=;
 b=b4pjmpj9KoM6UXS0t/yPlnbserw0La89QAoPWcaA07BGXCzfmPt3p0vi
 S3tEhC73uk1Yt5cfeFRGMd+LAkhd7vHqPYkbUbms3izWvLvD9Rz5lrhH7
 7ct1TMCj6q0mWfUIyZpkI4l8rhQMrK35Palstx+rltGTZB32lpHvp/xBM
 HIm2uXmoxEmf0vZ7ZXmOImzRSLVmFs1YmnRKDG9ua3KWbJb34cM/0BIQh
 UWIYCeScsuXLNThUUITjgqjh9RkyPd1W3hf2fNzj4HUAe3kDFNNGXOQZd
 khG1G+eDqCtpL+0jnFOOEWjXgXgDwwP7tmYkTfIlLZVpJFOpfKJPb5Q1B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="533587"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="533587"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840224136"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="840224136"
Received: from wpastern-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.45.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:49 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 17:39:22 +0200
Message-Id: <20231201153923.3433110-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201153923.3433110-1-jouni.hogander@intel.com>
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/i915/display: split i915 specific code
 from intel_fbdev
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split out code from intel_fbdev that can not be share between i915 and
xe. Create new i915 specific source/header file intel_fbdev_fb.[ch] which
contains this code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231115090719.3210079-2-jouni.hogander@intel.com
(cherry picked from commit 80d20fd99124800749d605c733911a8d9da78e2b)
---
 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 ++--------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 115 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  21 ++++
 4 files changed, 146 insertions(+), 101 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 67242a884a3a..ab008f1a25fb 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -304,7 +304,8 @@ i915-$(CONFIG_ACPI) += \
 	display/intel_acpi.o \
 	display/intel_opregion.o
 i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
-	display/intel_fbdev.o
+	display/intel_fbdev.o \
+	display/intel_fbdev_fb.o
 
 # modesetting output/encoder code
 i915-y += \
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 31d0d695d567..b7e4b7830e45 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -43,7 +43,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
-#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_mman.h"
 
 #include "i915_drv.h"
@@ -51,6 +50,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
+#include "intel_fbdev_fb.h"
 #include "intel_frontbuffer.h"
 
 struct intel_fbdev {
@@ -146,65 +146,6 @@ static const struct fb_ops intelfb_ops = {
 	.fb_mmap = intel_fbdev_mmap,
 };
 
-static int intelfb_alloc(struct drm_fb_helper *helper,
-			 struct drm_fb_helper_surface_size *sizes)
-{
-	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
-	struct drm_framebuffer *fb;
-	struct drm_device *dev = helper->dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct drm_mode_fb_cmd2 mode_cmd = {};
-	struct drm_i915_gem_object *obj;
-	int size;
-
-	/* we don't do packed 24bpp */
-	if (sizes->surface_bpp == 24)
-		sizes->surface_bpp = 32;
-
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-
-	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
-				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-	size = PAGE_ALIGN(size);
-
-	obj = ERR_PTR(-ENODEV);
-	if (HAS_LMEM(dev_priv)) {
-		obj = i915_gem_object_create_lmem(dev_priv, size,
-						  I915_BO_ALLOC_CONTIGUOUS |
-						  I915_BO_ALLOC_USER);
-	} else {
-		/*
-		 * If the FB is too big, just don't use it since fbdev is not very
-		 * important and we should probably use that space with FBC or other
-		 * features.
-		 *
-		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
-		 */
-		if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
-			obj = i915_gem_object_create_stolen(dev_priv, size);
-		if (IS_ERR(obj))
-			obj = i915_gem_object_create_shmem(dev_priv, size);
-	}
-
-	if (IS_ERR(obj)) {
-		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
-		return PTR_ERR(obj);
-	}
-
-	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
-	if (IS_ERR(fb))
-		return PTR_ERR(fb);
-
-	ifbdev->fb = to_intel_framebuffer(fb);
-	return 0;
-}
-
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
@@ -213,7 +154,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -222,9 +162,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct i915_vma *vma;
 	unsigned long flags = 0;
 	bool prealloc = false;
-	void __iomem *vaddr;
 	struct drm_i915_gem_object *obj;
-	struct i915_gem_ww_ctx ww;
 	int ret;
 
 	mutex_lock(&ifbdev->hpd_lock);
@@ -245,12 +183,13 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		intel_fb = ifbdev->fb = NULL;
 	}
 	if (!intel_fb || drm_WARN_ON(dev, !intel_fb_obj(&intel_fb->base))) {
+		struct drm_framebuffer *fb;
 		drm_dbg_kms(&dev_priv->drm,
 			    "no BIOS fb, allocating a new one\n");
-		ret = intelfb_alloc(helper, sizes);
-		if (ret)
-			return ret;
-		intel_fb = ifbdev->fb;
+		fb = intel_fbdev_fb_alloc(helper, sizes);
+		if (IS_ERR(fb))
+			return PTR_ERR(fb);
+		intel_fb = ifbdev->fb = to_intel_framebuffer(fb);
 	} else {
 		drm_dbg_kms(&dev_priv->drm, "re-using BIOS fb\n");
 		prealloc = true;
@@ -283,49 +222,18 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	info->fbops = &intelfb_ops;
 
 	obj = intel_fb_obj(&intel_fb->base);
-	if (i915_gem_object_is_lmem(obj)) {
-		struct intel_memory_region *mem = obj->mm.region;
-
-		/* Use fbdev's framebuffer from lmem for discrete */
-		info->fix.smem_start =
-			(unsigned long)(mem->io_start +
-					i915_gem_object_get_dma_address(obj, 0));
-		info->fix.smem_len = obj->base.size;
-	} else {
-		/* Our framebuffer is the entirety of fbdev's system memory */
-		info->fix.smem_start =
-			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
-		info->fix.smem_len = vma->size;
-	}
-
-	for_i915_gem_ww(&ww, ret, false) {
-		ret = i915_gem_object_lock(vma->obj, &ww);
-
-		if (ret)
-			continue;
-
-		vaddr = i915_vma_pin_iomap(vma);
-		if (IS_ERR(vaddr)) {
-			drm_err(&dev_priv->drm,
-				"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
-			ret = PTR_ERR(vaddr);
-			continue;
-		}
-	}
 
+	ret = intel_fbdev_fb_fill_info(dev_priv, info, obj, vma);
 	if (ret)
 		goto out_unpin;
 
-	info->screen_base = vaddr;
-	info->screen_size = vma->size;
-
 	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
 
 	/* If the object is shmemfs backed, it will have given us zeroed pages.
 	 * If the object is stolen however, it will be full of whatever
 	 * garbage was left in there.
 	 */
-	if (!i915_gem_object_is_shmem(vma->obj) && !prealloc)
+	if (!i915_gem_object_is_shmem(obj) && !prealloc)
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
new file mode 100644
index 000000000000..717c3a3237c4
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_fb_helper.h>
+
+#include "gem/i915_gem_lmem.h"
+
+#include "i915_drv.h"
+#include "intel_display_types.h"
+#include "intel_fbdev_fb.h"
+
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+					     struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_framebuffer *fb;
+	struct drm_device *dev = helper->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_mode_fb_cmd2 mode_cmd = {};
+	struct drm_i915_gem_object *obj;
+	int size;
+
+	/* we don't do packed 24bpp */
+	if (sizes->surface_bpp == 24)
+		sizes->surface_bpp = 32;
+
+	mode_cmd.width = sizes->surface_width;
+	mode_cmd.height = sizes->surface_height;
+
+	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
+	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
+							  sizes->surface_depth);
+
+	size = mode_cmd.pitches[0] * mode_cmd.height;
+	size = PAGE_ALIGN(size);
+
+	obj = ERR_PTR(-ENODEV);
+	if (HAS_LMEM(dev_priv)) {
+		obj = i915_gem_object_create_lmem(dev_priv, size,
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_USER);
+	} else {
+		/*
+		 * If the FB is too big, just don't use it since fbdev is not very
+		 * important and we should probably use that space with FBC or other
+		 * features.
+		 *
+		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
+		 */
+		if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
+			obj = i915_gem_object_create_stolen(dev_priv, size);
+		if (IS_ERR(obj))
+			obj = i915_gem_object_create_shmem(dev_priv, size);
+	}
+
+	if (IS_ERR(obj)) {
+		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	fb = intel_framebuffer_create(obj, &mode_cmd);
+	i915_gem_object_put(obj);
+
+	return fb;
+}
+
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			     struct drm_i915_gem_object *obj, struct i915_vma *vma)
+{
+	struct i915_gem_ww_ctx ww;
+	void __iomem *vaddr;
+	int ret;
+
+	if (i915_gem_object_is_lmem(obj)) {
+		struct intel_memory_region *mem = obj->mm.region;
+
+		/* Use fbdev's framebuffer from lmem for discrete */
+		info->fix.smem_start =
+			(unsigned long)(mem->io_start +
+					i915_gem_object_get_dma_address(obj, 0));
+		info->fix.smem_len = obj->base.size;
+	} else {
+		struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+
+		/* Our framebuffer is the entirety of fbdev's system memory */
+		info->fix.smem_start =
+			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
+		info->fix.smem_len = vma->size;
+	}
+
+	for_i915_gem_ww(&ww, ret, false) {
+		ret = i915_gem_object_lock(vma->obj, &ww);
+
+		if (ret)
+			continue;
+
+		vaddr = i915_vma_pin_iomap(vma);
+		if (IS_ERR(vaddr)) {
+			drm_err(&i915->drm,
+				"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
+			ret = PTR_ERR(vaddr);
+			continue;
+		}
+	}
+
+	if (ret)
+		return ret;
+
+	info->screen_base = vaddr;
+	info->screen_size = intel_bo_to_drm_bo(obj)->size;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.h b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
new file mode 100644
index 000000000000..a395b2c65d33
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_FBDEV_FB_H__
+#define __INTEL_FBDEV_FB_H__
+
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+struct drm_i915_gem_object;
+struct drm_i915_private;
+struct fb_info;
+struct i915_vma;
+
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+					     struct drm_fb_helper_surface_size *sizes);
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			     struct drm_i915_gem_object *obj, struct i915_vma *vma);
+
+#endif
-- 
2.34.1

