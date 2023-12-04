Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B21CC10F05
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 06:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A03A10E165;
	Mon,  4 Dec 2023 06:50:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666710E165
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701672614; x=1733208614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XF7YBmTZ9DkOAdKiRXwRCXJMGiTsU2uXJ2POJ02c6IM=;
 b=CVc8TF7SvGO+UBMByu9MoIXv4Dc0Vpl3TsO7yPfQuz3OHQeckIAZ6DZ9
 VkoxrM5niQHqudgARj/GdL9ARdy+jmxFRljJXMQavWVKaCUpL64Us28hr
 xl1WPtwATQjRF7uFucM/CmI7vyxb0O4/mcdI+vIrof4wAV9zG+8xln7J5
 Z54pz+6aDNF6DBcdp6qBmqG0xpwtTVkf8ur1dxL5jPsrl7WdFhfnsr1C5
 5gpmtOQY03vm9HnpTNiQqB1fHI1uHkxzWZrEzGSpWH1kjyEKRoqe08FtM
 GEznkuMnNgoS+eimOTN2iiJglmEmMiS+BK0IhClBpmNiYWbv0zNJo3MN4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373880083"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="373880083"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836482876"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836482876"
Received: from martinro-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.46.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:12 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 08:49:32 +0200
Message-Id: <20231204064932.869215-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204064932.869215-1-jouni.hogander@intel.com>
References: <20231204064932.869215-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 9/9] fixup! drm/xe/display: Implement display
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
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 62 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h | 23 +++++++++
 3 files changed, 86 insertions(+)
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
index 000000000000..717da7a9eb84
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -0,0 +1,62 @@
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
+int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
+				 struct xe_bo *obj,
+				 struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_i915_private *i915 = to_i915(obj->ttm.base.dev);
+	int ret;
+
+	ret = ttm_bo_reserve(&obj->ttm, true, false, NULL);
+	if (ret)
+		return ret;
+
+	if (!(obj->flags & XE_BO_SCANOUT_BIT)) {
+		/*
+		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
+		 * automatically set when creating FB. We cannot change caching
+		 * mode when the object is VM_BINDed, so we can only set
+		 * coherency with display when unbound.
+		 */
+		if (XE_IOCTL_DBG(i915, !list_empty(&obj->ttm.base.gpuva.list))) {
+			ttm_bo_unreserve(&obj->ttm);
+			return -EINVAL;
+		}
+		obj->flags |= XE_BO_SCANOUT_BIT;
+	}
+	ttm_bo_unreserve(&obj->ttm);
+
+	return ret;
+}
+
+struct drm_i915_gem_object *
+intel_fb_bo_lookup_valid_bo(struct drm_i915_private *i915,
+			 struct drm_file *filp,
+			 const struct drm_mode_fb_cmd2 *user_mode_cmd)
+{
+	struct drm_i915_gem_object *obj;
+	struct drm_gem_object *gem = drm_gem_object_lookup(filp, user_mode_cmd->handles[0]);
+
+	if (!gem)
+		return ERR_PTR(-ENOENT);
+
+	obj = gem_to_xe_bo(gem);
+	/* Require vram placement or dma-buf import */
+	if (IS_DGFX(i915) &&
+	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
+	    obj->ttm.type != ttm_bo_type_sg) {
+		drm_gem_object_put(gem);
+		return ERR_PTR(-EREMOTE);
+	}
+
+	return obj;
+}
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.h b/drivers/gpu/drm/xe/display/intel_fb_bo.h
new file mode 100644
index 000000000000..f03b1532c674
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef __INTEL_FB_H__
+#define __INTEL_FB_H__
+
+struct drm_file;
+struct drm_mode_fb_cmd2;
+struct drm_i915_private;
+struct intel_framebuffer;
+struct xe_bo;
+
+int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
+				 struct xe_bo *bo,
+				 struct drm_mode_fb_cmd2 *mode_cmd);
+
+struct xe_bo *intel_fb_lookup_valid_bo(struct drm_i915_private *i915,
+				       struct drm_file *filp,
+				       const struct drm_mode_fb_cmd2 *user_mode_cmd);
+
+#endif
-- 
2.34.1

