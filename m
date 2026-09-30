Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEECCA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1A10F474;
	Wed, 30 Sep 2026 15:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASfZcW3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E1B10F47F;
 Wed, 30 Sep 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780435; x=1822316435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZT4s6s0C8jybVZDa8PnTrU7GdBwag7bTLNckxVIIJKA=;
 b=ASfZcW3pEa6SBUeZ8uK1RLG7o4dZNXs/x6AoSXnZwkSVPPAeAdMfQizA
 mpjmUW7adWdzPkX1C8AY7IC+9h7Vx27240IHSqH3yzHnYNQ9qsN351c89
 hPwgsAVSwx+TVRGO3E/Y1haJ5GkzhGqPVgl3iPdf44XcbomKcxILgzPfT
 jMt2qb3DAm/ZeUwhyAAV1T71godSexny/ujtBCP41FEFf+Dcd7MDZ9mtL
 HirKVfuwTtaIsAGAWZmS18olKQ/WRuTGohRUUmYsxCNutnbvAQ3p6Qush
 KBTA2sbSpC734+XUJ7BeebjvGfcUMXGhxxy3kVwk5mh8S+MRQlIFg9YBM Q==;
X-CSE-ConnectionGUID: Bp3+ngl3RZWt5ejHM3L/dA==
X-CSE-MsgGUID: C3uihwl9QvmR6jHdg4mVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107904930"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="107904930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:34 -0700
X-CSE-ConnectionGUID: 6D5uEyjbQ2e280a5P4k+gw==
X-CSE-MsgGUID: VHf3EUd6So6upHkyEdU/5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275752986"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v2 05/10] drm/xe/display: use intel_gtt_view_is_*() helpers more
Date: Wed, 30 Sep 2026 18:00:01 +0300
Message-ID: <e05bf916d46007f8e655beb6c31748a8f69e09f3.1790780340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
References: <cover.1790780340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

