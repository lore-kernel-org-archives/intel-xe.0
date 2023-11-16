Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A73EC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95410E0FE;
	Thu, 16 Nov 2023 06:42:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06E10E0FE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116953; x=1731652953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbxGB4f1NQa32RyHcMaooAnmXE8VlcT8s6UO7cgPORI=;
 b=P1yam6YSyIboNrL0Sg5eD7GmpLTNtjnXq5AgJK2Yp3QAxsKfwYRc0Khy
 Z8htLj+61piAdTiZ/AmxlpoNkx4hC4Ci6eWMOetG/oG5bLCmmqLlQ2mdQ
 FTH2risXkmPeKQE4mSeYIIJrf4HJ4aKK4SdJMezKgd2hOze0ZyJwvpVmK
 em+dFtNmzjLBwcJCBGS/9/NCiWCM1qnL3kzQEFSX+qdbcRf2XKacxG1Pf
 L3I7To5xWd5Ktz5FcTnyVoMbswtpfbjK2jqh8UMUzkE+1wulww0mwfKgA
 II+HhAW5oshmmhTUIncA8duhATNgxomWsLvf1wGTcR8ifu/I2COMLz8KS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422802"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422802"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216803"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216803"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:31 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:45 +0200
Message-Id: <20231116064145.3969338-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/8] fixup! drm/xe/display: Implement display
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
index cc203e852c2c..41d92014a45c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -154,6 +154,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_display_rps.o \
 	display/xe_display_misc.o \
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

