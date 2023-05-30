Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C89C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9310E37E;
	Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2D10E379
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443657; x=1716979657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P3LeW0XPq7YBYt5/6RR1JDHaUZduepAGiH47XVOp5uk=;
 b=jqVbMjbaDqdJJD7YJ1HLOZ+1GavRCX0FOgs2fyrbmlLs8saUdLduw3xZ
 5FqWaoIh7fCDG9hAHL8OQZDAbgBrkV32CLuZiOjrHFEqCNlWWlIS5xIaz
 2IQGKbeDyF7S+MyStE1fB5ptLdueXBv+zDD8+Zv86djkEzzaPme2iLigF
 J93zQzLvN+jAi0G2egDigCuhc0TexDz0TPO0194F3KboUmgGD0WIwGa5R
 Cv68p3quxSgK72/l/W33N2HZivCyMIB9uCz8zbDcl6YjrQMBLRfCLRHV2
 o3ydLRR7jlmBLdipodibAowkX60n9iFdn10mEbkIhTv+cfpaJrIZU2Ndc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638368"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804772"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804772"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:09 +0300
Message-Id: <20230530104713.2570554-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/9] drivers/xe: Move Xe stolen memory
 handling away form fbc code
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

More correct place for Xe stolen memory handling details is in
xe_ttm_stolen_mgr. Move it there and add necessary defines into
i915_gem_stolen.h to satisfy fbc code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c      | 62 -----------------
 .../xe/compat-i915-headers/i915_gem_stolen.h  | 66 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  8 +++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |  1 +
 4 files changed, 75 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 90c48ccce1a7..19698ab117a1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -61,68 +61,6 @@
 #define i915_gem_stolen_node_offset(node) ((node)->start)
 #define i915_gem_stolen_node_size(node) ((node)->size)
 
-#else
-
-#include "xe_ttm_stolen_mgr.h"
-#include "xe_res_cursor.h"
-
-static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
-						       struct i915_stolen_fb *fb,
-						       u32 size, u32 align,
-						       u32 start, u32 end)
-{
-	struct xe_bo *bo;
-	int err;
-	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
-
-	bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
-					ttm_bo_type_kernel, flags);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		bo = NULL;
-		return err;
-	}
-	err = xe_bo_pin(bo);
-	xe_bo_unlock_vm_held(bo);
-
-	if (err) {
-		xe_bo_put(bo);
-		bo = NULL;
-	}
-
-	fb->bo = bo;
-
-	return err;
-}
-
-static int i915_gem_stolen_insert_node(struct xe_device *xe,
-				       struct i915_stolen_fb *fb, u32 size,
-				       u32 align)
-{
-	/* Not used on xe */
-	BUG_ON(1);
-	return -ENODEV;
-}
-
-static void i915_gem_stolen_remove_node(struct xe_device *xe,
-					struct i915_stolen_fb *fb)
-{
-	xe_bo_unpin_map_no_vm(fb->bo);
-	fb->bo = NULL;
-}
-
-#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
-#define i915_gem_stolen_node_allocated(fb) (!!(fb.bo))
-
-static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
-{
-	struct xe_res_cursor res;
-
-	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
-	return res.start;
-}
-
-#define i915_gem_stolen_node_size(fb) ((u64)((fb)->bo->ttm.base.size))
 #endif
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index b6eeeba1087b..a9020d408407 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -1,10 +1,76 @@
 #ifndef _I915_GEM_OBJECT_H_
 #define _I915_GEM_OBJECT_H_
 
+#include "xe_ttm_stolen_mgr.h"
+#include "xe_res_cursor.h"
+
 struct xe_bo;
 
 struct i915_stolen_fb {
 	struct xe_bo *bo;
 };
 
+static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
+						       struct i915_stolen_fb *fb,
+						       u32 size, u32 align,
+						       u32 start, u32 end)
+{
+	struct xe_bo *bo;
+	int err;
+	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
+
+	bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
+					ttm_bo_type_kernel, flags);
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
+#define i915_gem_stolen_node_allocated(fb) (!!(fb.bo))
+
+static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
+{
+	struct xe_res_cursor res;
+
+	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
+	return res.start;
+}
+
+#define i915_gem_stolen_area_address(xe) (xe_ttm_stolen_gpu_offset(xe))
+#define i915_gem_stolen_area_size(xe) (xe_ttm_stolen_size(xe))
+
+#define i915_gem_stolen_node_address(xe, fb) (xe_ttm_stolen_gpu_offset(xe) + \
+					 i915_gem_stolen_node_offset(fb))
+#define i915_gem_stolen_node_size(fb) ((u64)((fb)->bo->ttm.base.size))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index a3855870321f..2df059dd803b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -265,3 +265,11 @@ u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
 
 	return mgr->stolen_base;
 }
+
+u64 xe_ttm_stolen_size(struct xe_device *xe)
+{
+	struct xe_ttm_stolen_mgr *mgr =
+		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
+
+	return mgr->base.visible_size;
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 1777245ff810..48fed9a1ef95 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -17,5 +17,6 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
 bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
+u64 xe_ttm_stolen_size(struct xe_device *xe);
 
 #endif
-- 
2.34.1

