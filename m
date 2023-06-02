Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826EEC7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4623710E65C;
	Fri,  2 Jun 2023 10:43:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F7910E65B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702581; x=1717238581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=22hA9nIk/JUSKKtUua2W7qmhbDF/sik7Jfl+sjBYzns=;
 b=L6BsEeJwIwALy+NowQKBM7L5tPwc4Jn+laFH2bP4/nZV6GqsBkMeXGxX
 JiKdU2scogh2wM4SKrVm7/sKNEwN14t/8m4M/pCcZEYG74jQ4pilSfRRh
 X3KanfYLjkhiXoad60tf9yRfsopMqmSotiziPVotN/ZFVvX9WqHw0+K7i
 o92lo3cM9qmz1hwx4kLAxHu+Av8RQzwqekiCsWVzQAoagCuHIwlt+Eo9C
 hRk/9fGiCtQ8AUQUJa0Ojg1Q0BvZIM142JYuaiTp8yw2RHSBaEfHT5U3l
 mT5CxcFwWW3cFX2Kt2PMz9gCHYVTHRYH0PraKdssDz3K+SYhrVVn92+De w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215545"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237902"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237902"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:30 +0300
Message-Id: <20230602104237.1014684-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/10] Revert "drm/i915/display: Implement FBC
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

This reverts commit 6cd92ad14e89f2327aacf1c346874fb7db13925b.

As a part of clean-up we want to revert this patch and introduce required
changes as a set of patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 81 ++++++------------------
 1 file changed, 20 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 3dc9620552e9..2b00b7373c08 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -57,64 +57,27 @@
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
-		bo = NULL;
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
@@ -157,11 +120,8 @@ struct intel_fbc {
 	struct mutex lock;
 	unsigned int busy_bits;
 
-#ifdef I915
-	struct drm_mm_node compressed_fb, compressed_llb;
-#else
-	struct xe_bo *compressed_fb, *compressed_llb;
-#endif
+	struct drm_mm_node compressed_fb;
+	struct drm_mm_node compressed_llb;
 
 	enum intel_fbc_id id;
 
@@ -515,8 +475,7 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, DPFC_CB_BASE,
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+	intel_de_write(i915, DPFC_CB_BASE, fbc->compressed_fb.start);
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -567,8 +526,7 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id), fbc->compressed_fb.start);
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -788,6 +746,8 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = resource_size(&i915->dsm.stolen) - 8 * 1024 * 1024;
 	else
+#else
+	/* TODO */
 #endif
 		end = U64_MAX;
 
@@ -844,9 +804,9 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	int ret;
 
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_fb));
+		    drm_mm_node_allocated(&fbc->compressed_fb));
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_llb));
+		    drm_mm_node_allocated(&fbc->compressed_llb));
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
 		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
@@ -866,12 +826,12 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    i915_gem_stolen_compressed_size(fbc->compressed_fb), fbc->limit);
+		    fbc->compressed_fb.size, fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (drm_mm_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
 	if (i915_gem_stolen_initialized(i915))
@@ -899,9 +859,9 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (drm_mm_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (i915_gem_stolen_allocated(fbc->compressed_fb))
+	if (drm_mm_node_allocated(&fbc->compressed_fb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
 }
 
@@ -1109,8 +1069,7 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 	struct intel_fbc *fbc = plane->fbc;
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
-		intel_fbc_cfb_size(plane_state) <= fbc->limit *
-			i915_gem_stolen_compressed_size(fbc->compressed_fb);
+		intel_fbc_cfb_size(plane_state) <= fbc->compressed_fb.size * fbc->limit;
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
-- 
2.34.1

