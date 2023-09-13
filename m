Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D550CCA5536
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 09:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D24A10E497;
	Wed, 13 Sep 2023 09:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271410E496
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694598890; x=1726134890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hwiDYm/cvx0iUz0L5GfFN66/1ERVYWIPKierdJnZZXs=;
 b=BqEyt1FOyuPO+ClsNn554qkW2ASJHu5O0LU7Ut/UYgDAE264qiDYOTbj
 v4foxfxK8mdJTZ4bQBXo+nlRkoDyHYzMOebjGYe4yu+J7NW2lrtIMt2Kl
 9khVgB+pv+B0HpbWql465K+VJXBq6KomlfW6YtKxSDhfA70dvc1xIjDFE
 T/OhzGCHHbRh1p6qKpq/RCnh4V0e0DjFPg/FXzGX/X87cFo2gpjA60sYO
 M8XQ2nhnTJr/jJ+1zLe0dHw0hd8Elt/7zdDUREVK37iLV+0N6Rr68vn/X
 dTP1P8036hBHs9Adi+M28foWa+K9qpCrSrLj8pqXTLSRqvayYTq34TfIV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409564883"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="409564883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720749289"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720749289"
Received: from seanpaul-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.45.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:54:08 +0300
Message-Id: <20230913095412.3427407-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913095412.3427407-1-jouni.hogander@intel.com>
References: <20230913095412.3427407-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/5] Revert "drm/i915/display: Implement FBC
 support"
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

This reverts commit 62074302224cee194f642a811a2b70687fe2e6cc.

As a part of clean-up we want to revert this patch and introduce required
changes as a set of patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 57 ++++--------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 66c8aed07bbc..b0e676069677 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -59,64 +59,27 @@
 #ifdef I915
 
 #define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
-#define i915_gem_stolen_allocated(node) drm_mm_node_allocated(&(node))
-#define i915_gem_stolen_compressed_offset(node) ((node).start)
-#define i915_gem_stolen_compressed_size(node) ((node).size)
 
 #else
 
-#include "xe_ttm_stolen_mgr.h"
-#include "xe_res_cursor.h"
-
-static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align, u32 start, u32 end)
+/* No stolen memory support in xe yet */
+static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)
 {
-	int err;
-	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
-
-	*bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
-					NULL, size, start, end,
-					ttm_bo_type_kernel, flags);
-	if (IS_ERR(*bo)) {
-		err = PTR_ERR(*bo);
-		*bo = NULL;
-		return err;
-	}
-	err = xe_bo_pin(*bo);
-	xe_bo_unlock_vm_held(*bo);
-
-	if (err) {
-		xe_bo_put(*bo);
-		*bo = NULL;
-	}
-
-	return err;
+	return -ENODEV;
 }
 
-static int i915_gem_stolen_insert_node(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align)
+static int i915_gem_stolen_insert_node(struct xe_device *xe, void *ptr, u32 size, u32 align)
 {
-	/* Not used on xe */
-	BUG_ON(1);
+	XE_WARN_ON(1);
 	return -ENODEV;
 }
 
-static void i915_gem_stolen_remove_node(struct xe_device *xe, struct xe_bo **bo)
+static void i915_gem_stolen_remove_node(struct xe_device *xe, void *ptr)
 {
-	xe_bo_unpin_map_no_vm(*bo);
-	*bo = NULL;
 }
 
-#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
-#define i915_gem_stolen_allocated(bo) (!!(bo))
+#define i915_gem_stolen_initialized(xe) ((xe) && 0)
 
-static u32 i915_gem_stolen_compressed_offset(struct xe_bo *bo)
-{
-	struct xe_res_cursor res;
-
-	xe_res_first(bo->ttm.resource, 0, 4096, &res);
-	return res.start;
-}
-
-#define i915_gem_stolen_compressed_size(fb) ((u64)((fb)->ttm.base.size))
 #endif
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
@@ -159,11 +122,7 @@ struct intel_fbc {
 	struct mutex lock;
 	unsigned int busy_bits;
 
-#ifdef I915
 	struct i915_stolen_fb compressed_fb, compressed_llb;
-#else
-	struct xe_bo *compressed_fb, *compressed_llb;
-#endif
 
 	enum intel_fbc_id id;
 
@@ -791,6 +750,8 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = i915_gem_stolen_area_size(i915) - 8 * 1024 * 1024;
 	else
+#else
+	/* TODO */
 #endif
 		end = U64_MAX;
 
-- 
2.34.1

