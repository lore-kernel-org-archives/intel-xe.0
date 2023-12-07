Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4704C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21DD10E7E6;
	Thu,  7 Dec 2023 05:23:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1FD10E7E7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926620; x=1733462620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i1XCrA7SNgeP7sccDonrv70tFS+uI7xFL172ABonFvo=;
 b=EnukAYreq0dh5Rqrkw6HumgAKGDZj+4tI/PC4JrqyoxfEO/TgTbvyUye
 R2bubvwsqDTJutrM0WYbWjuCTuLSF7o1YJmAEcGz/7Hxwj5y3BzQT2b2I
 KiLTFd2TB1cF5+jiRNavFXP4TJiEI6DXPTWGNFvzZ7fWyAaFkqbfec1T1
 OtFBqH2F5yyHQWylv5p2M41WQM457Xt52/JkNPckc9CXCdHWlk9AoAMRa
 pebQcSg95GlsheP6qnKzr8Vs8MevSv+zAjcJ5I+5ewDlb9rC6f9Jyh+QQ
 VvU4uWX9v0HreL5LE2ZuMN3tIfdJeQjvCrkxJGlxBLzTVAfXEcdy7bDcR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482081"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842086069"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842086069"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:38 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 07:22:52 +0200
Message-Id: <20231207052252.2092191-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207052252.2092191-1-jouni.hogander@intel.com>
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 9/9] fixup! drm/xe/display: Implement display
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

Add Xe specific code for intel_fb.c

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 74 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h | 24 ++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 87f3fca0c0ee..e6f98d807783 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -168,6 +168,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_display_misc.o \
 	display/xe_dsb_buffer.o \
 	display/intel_fbdev_fb.o \
+	display/intel_fb_bo.o \
 	display/ext/i915_irq.o \
 	display/ext/i915_utils.o
 
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
new file mode 100644
index 000000000000..b21da7b745a5
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <drm/drm_modeset_helper.h>
+
+#include "i915_drv.h"
+#include "intel_display_types.h"
+#include "intel_fb_bo.h"
+
+void intel_fb_bo_framebuffer_fini(struct xe_bo *bo)
+{
+	if (bo->flags & XE_BO_CREATE_PINNED_BIT) {
+		/* Unpin our kernel fb first */
+		xe_bo_lock(bo, false);
+		xe_bo_unpin(bo);
+		xe_bo_unlock(bo);
+	}
+	xe_bo_put(bo);
+}
+
+int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
+				 struct xe_bo *bo,
+				 struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_i915_private *i915 = to_i915(bo->ttm.base.dev);
+	int ret;
+
+	xe_bo_get(bo);
+
+	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
+	if (ret)
+		return ret;
+
+	if (!(bo->flags & XE_BO_SCANOUT_BIT)) {
+		/*
+		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
+		 * automatically set when creating FB. We cannot change caching
+		 * mode when the boect is VM_BINDed, so we can only set
+		 * coherency with display when unbound.
+		 */
+		if (XE_IOCTL_DBG(i915, !list_empty(&bo->ttm.base.gpuva.list))) {
+			ttm_bo_unreserve(&bo->ttm);
+			return -EINVAL;
+		}
+		bo->flags |= XE_BO_SCANOUT_BIT;
+	}
+	ttm_bo_unreserve(&bo->ttm);
+
+	return ret;
+}
+
+struct xe_bo *intel_fb_bo_lookup_valid_bo(struct drm_i915_private *i915,
+					  struct drm_file *filp,
+					  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_i915_gem_object *bo;
+	struct drm_gem_object *gem = drm_gem_object_lookup(filp, mode_cmd->handles[0]);
+
+	if (!gem)
+		return ERR_PTR(-ENOENT);
+
+	bo = gem_to_xe_bo(gem);
+	/* Require vram placement or dma-buf import */
+	if (IS_DGFX(i915) &&
+	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
+	    bo->ttm.type != ttm_bo_type_sg) {
+		drm_gem_object_put(gem);
+		return ERR_PTR(-EREMOTE);
+	}
+
+	return bo;
+}
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.h b/drivers/gpu/drm/xe/display/intel_fb_bo.h
new file mode 100644
index 000000000000..5d365b925b7a
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef __INTEL_FB_BO_H__
+#define __INTEL_FB_BO_H__
+
+struct drm_file;
+struct drm_mode_fb_cmd2;
+struct drm_i915_private;
+struct intel_framebuffer;
+struct xe_bo;
+
+void intel_fb_bo_framebuffer_fini(struct xe_bo *bo);
+int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
+				 struct xe_bo *bo,
+				 struct drm_mode_fb_cmd2 *mode_cmd);
+
+struct xe_bo *intel_fb_bo_lookup_valid_bo(struct drm_i915_private *i915,
+					  struct drm_file *filp,
+					  const struct drm_mode_fb_cmd2 *mode_cmd);
+
+#endif
-- 
2.34.1

