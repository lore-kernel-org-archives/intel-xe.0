Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99D0C07524
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E832410E453;
	Tue, 14 Nov 2023 13:05:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2710E44F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967110; x=1731503110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0dkws8Ig16HKKeJxHIi2GLVZvlHpfjiQcm+BtqmqqJw=;
 b=M7R54aYlmAYuVQMJAgyQ2F6n+q9r4++8Uexa9VQbXDZ/7gwF83gWpG8s
 0dA2JIBG7D4nG06HYhH8Jlj8CMGNYuEukleY7QHef4rZmntDKBErQD8B9
 DtFZ7ayeI7xwdZP4tUKeUcF2ULotnO/t2/YwdEJ0ft37U8usCWJaZMSXE
 15Wd9iZSCUA88LE/AC0fN0HWk0IAQgoEIFFQXQ1W5JSRuYUaMFOXQS/xO
 tbPZOq0n7KQ/vwtoR1gIfxOF5s6E1w4TqNq+VHD4He0UA83mvIfPeh+/z
 jzJtaqXIpuEGi+s1YpxDNOnxU91D1uJSW0Ab8BSOwUiRXVSkDUyW3KDvp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565357"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778936"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778936"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:08 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:37 +0200
Message-Id: <20231114130443.2503708-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/9] drm/i915/display: split i915 specific
 code from intel_fbdev
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

v2: Add missing forward declarations into intel_fbdev_fb.h

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 ++--------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 116 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  21 ++++
 4 files changed, 147 insertions(+), 101 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3c26e9ae3722..401fc5778843 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -302,7 +302,8 @@ i915-$(CONFIG_ACPI) += \
 	display/intel_acpi.o \
 	display/intel_opregion.o
 i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
-	display/intel_fbdev.o
+	display/intel_fbdev.o \
+	display/intel_fbdev_fb.o
 
 # modesetting output/encoder code
 i915-y += \
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 31d0d695d567..252f254345a2 100644
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
+		struct intel_framebuffer *fb;
 		drm_dbg_kms(&dev_priv->drm,
 			    "no BIOS fb, allocating a new one\n");
-		ret = intelfb_alloc(helper, sizes);
-		if (ret)
-			return ret;
-		intel_fb = ifbdev->fb;
+		fb = to_intel_framebuffer(intel_fbdev_fb_alloc(helper, sizes));
+		if (IS_ERR(fb))
+			return PTR_ERR(fb);
+		intel_fb = ifbdev->fb = fb;
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
index 000000000000..288ca4ec09d8
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: MIT
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
+	if (IS_ERR(fb))
+		return fb;
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
index 000000000000..d4976874239f
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
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

