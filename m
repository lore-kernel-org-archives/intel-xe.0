Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873A7C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696D10E916;
	Thu,  7 Dec 2023 15:58:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C210E925
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701964726; x=1733500726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yAeal6Rkl9RG/ZvbU1c3ctI55KqdUNXk3FpGENg4pB4=;
 b=YAzgIkH5Uf+P+z1HF62/M9Fnu3K/Tve936E7jqhgZbJNPRkVrjFVV4SN
 +uhp6F3v4UR06q92uqbCr+44mD7jdFzNir5tLMV7BwZlOFAlVz/g6m1H0
 hKpmIjWsnnFV8Dnm/t3bOMWG7Ou49GlyMl8MFLWQqofINt+07udggvHNB
 Ei4lHfeiie+OjX8JHGZnAr32YlFVdyEQ5DHeUBu9trCMc7Tpey70zja9i
 Sdz2Ru2WFCrNxFmoYFIrfRU2CS/FNYMrOsOJDe9wE7tN/2ocSJInZMGtl
 d9kNICGa1Xvze2xieOEOdVV3LUoD9DkwPlOTJu6dcHnL5fkd15qM3n1JX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384655303"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384655303"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765151749"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765151749"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:58:45 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 9/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 17:58:15 +0200
Message-Id: <20231207155815.2467082-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add Xe specific code for intel_fb.c

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 74 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h | 24 ++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f7894ae68e00..537828655da9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -174,6 +174,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
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

