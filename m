Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7737FC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5036F10E443;
	Tue, 14 Nov 2023 13:05:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050E510E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967112; x=1731503112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jV5yRbskBQKBKfz/e+PsHvf/8cxfczeZ413z67Jt0pM=;
 b=mZXUVLB0TQVURpfGNkn2d3Fq0fSqLsPZkf1j7AldbZsLQ1odBlJnzepw
 CkHN6TIegs0g3u9s6icdjnlH7Zwo3sK5uT/9/ZqPZX2QFdX+T9tfRQFgT
 W3YifPOWiIeHZ2ptwIZnZnWC36pRUzdGOg5W/bQ2X66PJi3p4baFgJ1Dt
 DPFabvJE/npzTnj5VouoU1IQqPvPW/toNn+78g8TVoPan21eBOiao9/VP
 9MWXQydySyfSQkMpCYD7DyAUHbVbdSq8CTfRGhtrItzcDfdHP+N9Lw/OW
 /DnDuuSrPUsfK3wU5DknYEIjislWKILCt/xS51fV/onJaSuB+XOoV+8/L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565364"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778944"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778944"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:10 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:38 +0200
Message-Id: <20231114130443.2503708-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/9] fixup! drm/xe/display: Implement display
 support
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

Add xe specific code for intel_fbdev.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 101 ++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_fbdev_fb.h |  21 ++++
 3 files changed, 123 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..e122d6f226e8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -152,6 +152,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/xe_display_misc.o \
+	display/intel_fbdev_fb.o \
 	display/ext/i915_irq.o \
 	display/ext/i915_utils.o
 
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
new file mode 100644
index 000000000000..b0e440a01281
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -0,0 +1,101 @@
+#include <drm/drm_fb_helper.h>
+
+#ifdef I915
+#include "gem/i915_gem_lmem.h"
+#else
+#include "xe_gt.h"
+#include "xe_ttm_stolen_mgr.h"
+#endif
+
+#include "i915_drv.h"
+#include "intel_display_types.h"
+
+struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
+			 struct drm_fb_helper_surface_size *sizes)
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
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
+	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
+							  sizes->surface_depth);
+
+	size = mode_cmd.pitches[0] * mode_cmd.height;
+	size = PAGE_ALIGN(size);
+	obj = ERR_PTR(-ENODEV);
+
+	if (!IS_DGFX(dev_priv)) {
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
+					   NULL, size,
+					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
+					   XE_BO_CREATE_STOLEN_BIT |
+					   XE_BO_CREATE_PINNED_BIT);
+		if (!IS_ERR(obj))
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
+		else
+			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
+	}
+	if (IS_ERR(obj)) {
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
+					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
+					  XE_BO_CREATE_PINNED_BIT);
+	}
+
+	if (IS_ERR(obj)) {
+		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
+		fb = ERR_PTR(-ENOMEM);
+		goto err;
+	}
+
+	fb = intel_framebuffer_create(obj, &mode_cmd);
+	if (IS_ERR(fb)) {
+		xe_bo_unpin_map_no_vm(obj);
+		goto err;
+	}
+
+	drm_gem_object_put(intel_bo_to_drm_bo(obj));
+	return fb;
+
+err:
+	return fb;
+}
+
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+
+	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
+		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
+			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
+		else
+			info->fix.smem_start =
+				pci_resource_start(pdev, 2) +
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
+
+		info->fix.smem_len = obj->ttm.base.size;
+	} else {
+		/* XXX: Pure fiction, as the BO may not be physically accessible.. */
+		info->fix.smem_start = 0;
+		info->fix.smem_len = obj->ttm.base.size;
+	}
+	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
+
+	info->screen_base = obj->vmap.vaddr_iomem;
+	info->screen_size = intel_bo_to_drm_bo(obj)->size;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.h b/drivers/gpu/drm/xe/display/intel_fbdev_fb.h
new file mode 100644
index 000000000000..ea186772e0bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.h
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
+			 struct drm_fb_helper_surface_size *sizes);
+int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
+			      struct drm_i915_gem_object *obj, struct i915_vma *vma);
+
+#endif
-- 
2.34.1

