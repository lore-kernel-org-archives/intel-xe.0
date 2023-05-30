Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BD2C7EE29
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08AC10E382;
	Tue, 30 May 2023 10:34:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6332410E37E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442893; x=1716978893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjhaJ2Niidt9hUXHObVUzT5K0ffooMFsycXpXxBVXZQ=;
 b=ZGLL1zsxhhm0l8vrHP6gI/5lCjIzvUEWjbkGEWT/E0ko63M7G7QaGm2o
 CZs0zHcLR6X9XDHd6zdjT8qsJVDOsmlx3IfifOrGZdn/Fdvetsggu2cEq
 HmbAH3sa9kxGM0egJC/tBeVfv3BdwilCDUHyqw3MM2zMLm5UraVJCO32j
 Syl/cbZ+TwO+Rnw/lUp2feRxcNdGgGDN4FKwYIaLU2e/y2ryEYdRAFJee
 prwsWoXMV3XUANG5dCNwjSV7gwgdysCnCsC9kuZgKWfBMYRe5i8vqb82s
 eLnHL+S7DRQiZd7Z3B5Ve/tOMI+OrGwxvzEsmbaweuan3pus5Hsu9t72j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378066"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226055"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226055"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:51 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:14 +0300
Message-Id: <20230530103420.2561722-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/9] drm/i915/fbc: Add common type for compressed
 fb to avoid ifdefs
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

Ass a preparation for Xe add a common type for fbc compressed fb and use it
from fbc code instead of underlying type directly. This way we can have
common type i915_stolen_fb which can be used for both i915 and Xe and we
can remove related ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c   | 61 ++++++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |  2 +
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 913db2ea5650..90c48ccce1a7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -58,62 +58,71 @@
 
 #define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
 #define i915_gem_stolen_node_allocated(node) drm_mm_node_allocated(&(node))
-#define i915_gem_stolen_node_offset(node) ((node).start)
-#define i915_gem_stolen_node_size(node) ((node).size)
+#define i915_gem_stolen_node_offset(node) ((node)->start)
+#define i915_gem_stolen_node_size(node) ((node)->size)
 
 #else
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
 
-static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align, u32 start, u32 end)
+static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
+						       struct i915_stolen_fb *fb,
+						       u32 size, u32 align,
+						       u32 start, u32 end)
 {
+	struct xe_bo *bo;
 	int err;
 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
 
-	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
+	bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
 					ttm_bo_type_kernel, flags);
-	if (IS_ERR(*bo)) {
-		err = PTR_ERR(*bo);
-		*bo = NULL;
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		bo = NULL;
 		return err;
 	}
-	err = xe_bo_pin(*bo);
-	xe_bo_unlock_vm_held(*bo);
+	err = xe_bo_pin(bo);
+	xe_bo_unlock_vm_held(bo);
 
 	if (err) {
-		xe_bo_put(*bo);
-		*bo = NULL;
+		xe_bo_put(bo);
+		bo = NULL;
 	}
 
+	fb->bo = bo;
+
 	return err;
 }
 
-static int i915_gem_stolen_insert_node(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align)
+static int i915_gem_stolen_insert_node(struct xe_device *xe,
+				       struct i915_stolen_fb *fb, u32 size,
+				       u32 align)
 {
 	/* Not used on xe */
 	BUG_ON(1);
 	return -ENODEV;
 }
 
-static void i915_gem_stolen_remove_node(struct xe_device *xe, struct xe_bo **bo)
+static void i915_gem_stolen_remove_node(struct xe_device *xe,
+					struct i915_stolen_fb *fb)
 {
-	xe_bo_unpin_map_no_vm(*bo);
-	*bo = NULL;
+	xe_bo_unpin_map_no_vm(fb->bo);
+	fb->bo = NULL;
 }
 
 #define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
-#define i915_gem_stolen_node_allocated(bo) (!!(bo))
+#define i915_gem_stolen_node_allocated(fb) (!!(fb.bo))
 
-static u32 i915_gem_stolen_node_offset(struct xe_bo *bo)
+static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
 {
 	struct xe_res_cursor res;
 
-	xe_res_first(bo->ttm.resource, 0, 4096, &res);
+	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
 	return res.start;
 }
 
-#define i915_gem_stolen_node_size(fb) ((u64)((fb)->ttm.base.size))
+#define i915_gem_stolen_node_size(fb) ((u64)((fb)->bo->ttm.base.size))
 #endif
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
@@ -156,11 +165,7 @@ struct intel_fbc {
 	struct mutex lock;
 	unsigned int busy_bits;
 
-#ifdef I915
-	struct drm_mm_node compressed_fb, compressed_llb;
-#else
-	struct xe_bo *compressed_fb, *compressed_llb;
-#endif
+	struct i915_stolen_fb compressed_fb, compressed_llb;
 
 	enum intel_fbc_id id;
 
@@ -515,7 +520,7 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, DPFC_CB_BASE,
-		       i915_gem_stolen_node_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -567,7 +572,7 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
-		       i915_gem_stolen_node_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -865,7 +870,7 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    i915_gem_stolen_node_size(fbc->compressed_fb), fbc->limit);
+		    i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
 
 	return 0;
 
@@ -1109,7 +1114,7 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
 		intel_fbc_cfb_size(plane_state) <= fbc->limit *
-			i915_gem_stolen_node_size(fbc->compressed_fb);
+			i915_gem_stolen_node_size(&fbc->compressed_fb);
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index d5005a39d130..3c084a1fcc73 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -12,6 +12,8 @@ struct drm_i915_private;
 struct drm_mm_node;
 struct drm_i915_gem_object;
 
+#define i915_stolen_fb drm_mm_node
+
 int i915_gem_stolen_insert_node(struct drm_i915_private *dev_priv,
 				struct drm_mm_node *node, u64 size,
 				unsigned alignment);
-- 
2.34.1

