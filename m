Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C3C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524ED10E140;
	Tue, 30 May 2023 10:47:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F54B10E134
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443652; x=1716979652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=umixa0o1+5nqUbZaj6I7lPKeZtAJTpXj0GWa8Jy7ugM=;
 b=QnbMOlLcQBogz1cTB9qrK9jXP97JXCizQkK7Ml3AkQUe21TT2qAq53Ns
 pmHpy3L2yKiHOLQw39U2b0+FIYvq4VfLhQ8yFxKMvcNzslsOe6VHm3b1o
 wHIEIFqiUgcnwEVcpOI2Qjr3yUD6MV1krhb7qF8EWasOYe8MSUDXoWl/Q
 Shs0AreG+Qwe8QhNH4Y741dwzADU5kOASC+iX9Phk05SsNPsZULV1CWW+
 H56ydYMRsPKGSvUccyFbDFV6PJmcuJ8iKGO0sEIXfvQojDsNOd+gtR/U5
 FXqzMvHBxSl1/tva9d46cxH3m1HSYRUe593QE+s6ySnuV+Z6wltQ3WUr+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638344"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638344"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804747"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804747"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:05 +0300
Message-Id: <20230530104713.2570554-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/9] fixup! drm/i915/display: Implement FBC
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

Unify naming convention. Now all functions to query information on stolen
node are using prefix i915_gem_stolen_node.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 9dc7083fe974..913db2ea5650 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -57,9 +57,9 @@
 #ifdef I915
 
 #define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
-#define i915_gem_stolen_allocated(node) drm_mm_node_allocated(&(node))
-#define i915_gem_stolen_compressed_offset(node) ((node).start)
-#define i915_gem_stolen_compressed_size(node) ((node).size)
+#define i915_gem_stolen_node_allocated(node) drm_mm_node_allocated(&(node))
+#define i915_gem_stolen_node_offset(node) ((node).start)
+#define i915_gem_stolen_node_size(node) ((node).size)
 
 #else
 
@@ -103,9 +103,9 @@ static void i915_gem_stolen_remove_node(struct xe_device *xe, struct xe_bo **bo)
 }
 
 #define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
-#define i915_gem_stolen_allocated(bo) (!!(bo))
+#define i915_gem_stolen_node_allocated(bo) (!!(bo))
 
-static u32 i915_gem_stolen_compressed_offset(struct xe_bo *bo)
+static u32 i915_gem_stolen_node_offset(struct xe_bo *bo)
 {
 	struct xe_res_cursor res;
 
@@ -113,7 +113,7 @@ static u32 i915_gem_stolen_compressed_offset(struct xe_bo *bo)
 	return res.start;
 }
 
-#define i915_gem_stolen_compressed_size(fb) ((u64)((fb)->ttm.base.size))
+#define i915_gem_stolen_node_size(fb) ((u64)((fb)->ttm.base.size))
 #endif
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
@@ -515,7 +515,7 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, DPFC_CB_BASE,
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -567,7 +567,7 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -843,9 +843,9 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	int ret;
 
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_fb));
+		    i915_gem_stolen_node_allocated(fbc->compressed_fb));
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_llb));
+		    i915_gem_stolen_node_allocated(fbc->compressed_llb));
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
 		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
@@ -865,12 +865,12 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    i915_gem_stolen_compressed_size(fbc->compressed_fb), fbc->limit);
+		    i915_gem_stolen_node_size(fbc->compressed_fb), fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
 	if (i915_gem_stolen_initialized(i915))
@@ -898,9 +898,9 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (i915_gem_stolen_allocated(fbc->compressed_fb))
+	if (i915_gem_stolen_node_allocated(fbc->compressed_fb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
 }
 
@@ -1109,7 +1109,7 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
 		intel_fbc_cfb_size(plane_state) <= fbc->limit *
-			i915_gem_stolen_compressed_size(fbc->compressed_fb);
+			i915_gem_stolen_node_size(fbc->compressed_fb);
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
-- 
2.34.1

