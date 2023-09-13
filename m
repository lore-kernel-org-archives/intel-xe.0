Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F43CA5531
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 09:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC110E49A;
	Wed, 13 Sep 2023 09:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882C310E493
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694598895; x=1726134895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VinYk8bFqTACvdvVeVhPgbmRcYEiyI28QL6X8hFCISc=;
 b=AH9+/odmNdvZynoP4DYlH8nSiJhDOE79AbylfPbm0O/HJ//02KMfLAyT
 faO4rUE7PHd6h0Nsx2Yl67nYgiU5vGNIzqX2F3fNxue0iGubeQhUT3+ri
 0DD3ZCfEJlvRTk2IuSJaMU2ETd8jeW5iW7aur+j9bhZopWbMCwjQ65fDb
 1GxpGrIVXcsSjWdW9OzaagzNoObuZ8xLolP4BUYSCPI3Zi2qygkCrWOxH
 K4m6XUWlxGQXb3orYyANdosJBRQwkqrtVAAjdGEc0/XsftIVJbIY39B02
 nFgpLdUQ+InAH2yDP2p7C9U7LQyHk7QrQ8Lz8F4y/pGFu7RLrjN+3rOeW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409564886"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="409564886"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720749298"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720749298"
Received: from seanpaul-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.45.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:54:10 +0300
Message-Id: <20230913095412.3427407-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913095412.3427407-1-jouni.hogander@intel.com>
References: <20230913095412.3427407-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/5] drm/xe: Xe stolen memory handling for fbc
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

Add Xe stolen memory handling for fbc.

v3:
  - v2: Add parenthesis around parameter in i915_gem_stolen_node_allocated
v2:
  - define i915_gem_stolen_area_address/size as !WARN_ON(1)
  - squash common type addition into this patch

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 +
 .../xe/compat-i915-headers/i915_gem_stolen.h  | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index d629fd48a14c..6607c5a374cc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -15,6 +15,7 @@
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "i915_gem_stolen.h"
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
 #include "intel_uncore.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
new file mode 100644
index 000000000000..32f60258ded6
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -0,0 +1,79 @@
+#ifndef _I915_GEM_OBJECT_H_
+#define _I915_GEM_OBJECT_H_
+
+#include "xe_ttm_stolen_mgr.h"
+#include "xe_res_cursor.h"
+
+struct xe_bo;
+
+struct i915_stolen_fb {
+	struct xe_bo *bo;
+};
+
+static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
+						       struct i915_stolen_fb *fb,
+						       u32 size, u32 align,
+						       u32 start, u32 end)
+{
+	struct xe_bo *bo;
+	int err;
+	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
+
+	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
+				       NULL, size, start, end,
+				       ttm_bo_type_kernel, flags);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		bo = NULL;
+		return err;
+	}
+	err = xe_bo_pin(bo);
+	xe_bo_unlock_vm_held(bo);
+
+	if (err) {
+		xe_bo_put(fb->bo);
+		bo = NULL;
+	}
+
+	fb->bo = bo;
+
+	return err;
+}
+
+static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
+					      struct i915_stolen_fb *fb,
+					      u32 size, u32 align)
+{
+	/* Not used on xe */
+	BUG_ON(1);
+	return -ENODEV;
+}
+
+static inline void i915_gem_stolen_remove_node(struct xe_device *xe,
+					       struct i915_stolen_fb *fb)
+{
+	xe_bo_unpin_map_no_vm(fb->bo);
+	fb->bo = NULL;
+}
+
+#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
+#define i915_gem_stolen_node_allocated(fb) (!!((fb)->bo))
+
+static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
+{
+	struct xe_res_cursor res;
+
+	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
+	return res.start;
+}
+
+/* Used for < gen4. These are not supported by Xe */
+#define i915_gem_stolen_area_address(xe) (!WARN_ON(1))
+/* Used for gen9 specific WA. Gen9 is not supported by Xe */
+#define i915_gem_stolen_area_size(xe) (!WARN_ON(1))
+
+#define i915_gem_stolen_node_address(xe, fb) (xe_ttm_stolen_gpu_offset(xe) + \
+					 i915_gem_stolen_node_offset(fb))
+#define i915_gem_stolen_node_size(fb) ((u64)((fb)->bo->ttm.base.size))
+
+#endif
-- 
2.34.1

