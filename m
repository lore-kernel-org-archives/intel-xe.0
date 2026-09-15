Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476AFC88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F4210E2CD;
	Tue, 15 Sep 2026 20:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0iSYkgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49110E2E1;
 Tue, 15 Sep 2026 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502989; x=1821038989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIyeNowj5nch7NC5RC1ugT9D5GlnRGMiGkir18JVmTQ=;
 b=P0iSYkgBMHUqegE0mDz0xLYBwEjl5GxavQAVfxy4dU6Dua939MhnySBK
 LiKvjyIcwyhiJQk3Xenfd7B1bi+tuqvoNIwcKygLfA6ouPq6Xk2JPgSw4
 4nhFQPpc4Zrt92/kqiwrg9990mDn2vsEQ3OwIjevY3OyUj9xMMlUnKmma
 JRcOsmGUmdW95u5n4pLE5/WopbBk/yCJdITq2j8q5vbmTaYrfUAL13Fvw
 oYiS7Nd4tIeZkn5v7iBJm6BSaRJkZvh6U9wIRx9MH6F7/Gmbe3fxr89V7
 7ZysWS89KT7gRu0b3nMfn/bII/3ssHFHhPyEYGhEVjoDG+dp6C6xPKKwr Q==;
X-CSE-ConnectionGUID: yt2uPeqjRaauGwwSjVAKUg==
X-CSE-MsgGUID: DK3ISGtJSCiGX2F42owYog==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89750687"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89750687"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:48 -0700
X-CSE-ConnectionGUID: dkKMtbyhSEKDgcdpjoIn8A==
X-CSE-MsgGUID: XVEkfkjtSSCh7u2LGjcqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270490545"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 05/10] drm/xe/display: use intel_gtt_view_is_*() helpers more
Date: Tue, 15 Sep 2026 23:09:16 +0300
Message-ID: <0a0ef74db9228dd3723d2dda704a3d544f131d6d.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
view type directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1402e76102fa..15fbd3fe6cbb 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -152,9 +152,9 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
 	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
-	if (view->type == I915_GTT_VIEW_NORMAL)
+	if (intel_gtt_view_is_normal(view))
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
-	else if (view->type == I915_GTT_VIEW_REMAPPED)
+	else if (intel_gtt_view_is_remapped(view))
 		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
 				 XE_PAGE_SIZE);
 	else
@@ -173,7 +173,7 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
-	if (view->type == I915_GTT_VIEW_NORMAL) {
+	if (intel_gtt_view_is_normal(view)) {
 		u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, XE_CACHE_NONE));
 		u32 x;
 
@@ -182,7 +182,7 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
 		}
-	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
+	} else if (intel_gtt_view_is_remapped(view)) {
 		write_dpt_remapped(bo, &view->remapped, &dpt->vmap);
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
@@ -275,7 +275,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 		align = max(align, SZ_64K);
 
 	/* Fast case, preallocated GGTT view? */
-	if (bo->ggtt_node[tile0->id] && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node[tile0->id] && intel_gtt_view_is_normal(view)) {
 		vma->node = bo->ggtt_node[tile0->id];
 		return 0;
 	}
@@ -283,7 +283,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	if (view->type == I915_GTT_VIEW_NORMAL)
+	if (intel_gtt_view_is_normal(view))
 		size = xe_bo_size(bo);
 	else
 		/* display uses tiles instead of bytes here, so convert it back.. */
@@ -292,7 +292,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, XE_CACHE_NONE));
 	vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte,
 						  ALIGN(size, align), align,
-						  view->type == I915_GTT_VIEW_NORMAL ?
+						  intel_gtt_view_is_normal(view) ?
 						  NULL : write_ggtt_rotated_node,
 						  &(struct fb_rotate_args){view, bo});
 	if (IS_ERR(vma->node))
-- 
2.47.3

