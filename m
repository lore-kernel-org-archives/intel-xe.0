Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A26CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A90910F47B;
	Wed, 30 Sep 2026 15:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jk42SArS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDEF10F47B;
 Wed, 30 Sep 2026 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780443; x=1822316443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riL+bYvnaDtDDs135HlYkqOfKvdj69eoYC+wc4CxIX4=;
 b=jk42SArS3naq5+YKxi+vNYDHKmi55mB2Im4M66WBoA+MCTwm7sZLSbKU
 4mA4y0Wor4XCrFoaE7ClvD7MRXRzB6D2EpExqp/zygm9HcZaj/TWRcAeg
 BNEJJMkoQ4ui+/mjE+VUw3ULg3tF0rqm2yLmLdUbSzNn0xGavwkaSgPhR
 +d8EzisjE5sxlKi47zElSsJPiySvlfuzqwtPAeMQ+n6JykVsWMMBkhsfW
 19n/6JcOJjvT6Tpp8vo/UvHX7pz/xajAhOiWhYDtkn1wIPrK+j1UGrgiP
 k2p0G1NeKuSU9Ihn88mDCEi+6RsxmE/ju9Iim6y51EJ28+xABO8pCAx9u A==;
X-CSE-ConnectionGUID: W64IPwQBRJ6P32z3MnJIgA==
X-CSE-MsgGUID: kDVFjvi3RfqIO12OHXTo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90284191"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90284191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:43 -0700
X-CSE-ConnectionGUID: 1w0cHyxGQ3O+F3JHmRYLPg==
X-CSE-MsgGUID: 0avSq/gHTkqVHz2CLM+KvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275849609"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v2 07/10] drm/i915/vma: use intel_gtt_view_is_*() helpers more
Date: Wed, 30 Sep 2026 18:00:03 +0300
Message-ID: <5bc8331cab1d15855b378bd01c76fb0fc4be5c7f.1790780340.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/i915_vma.c | 36 +++++++++++----------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 61ddfa5d2895..16782d8579a8 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -179,9 +179,9 @@ vma_create(struct drm_i915_gem_object *obj,
 	INIT_LIST_HEAD(&vma->obj_link);
 	RB_CLEAR_NODE(&vma->obj_node);
 
-	if (view && view->type != I915_GTT_VIEW_NORMAL) {
+	if (view && !intel_gtt_view_is_normal(view)) {
 		vma->gtt_view = *view;
-		if (view->type == I915_GTT_VIEW_PARTIAL) {
+		if (intel_gtt_view_is_partial(view)) {
 			GEM_BUG_ON(range_overflows_t(u64,
 						     view->partial.offset,
 						     view->partial.size,
@@ -189,10 +189,10 @@ vma_create(struct drm_i915_gem_object *obj,
 			vma->size = view->partial.size;
 			vma->size <<= PAGE_SHIFT;
 			GEM_BUG_ON(vma->size > obj->base.size);
-		} else if (view->type == I915_GTT_VIEW_ROTATED) {
+		} else if (intel_gtt_view_is_rotated(view)) {
 			vma->size = intel_rotation_info_size(&view->rotated);
 			vma->size <<= PAGE_SHIFT;
-		} else if (view->type == I915_GTT_VIEW_REMAPPED) {
+		} else if (intel_gtt_view_is_remapped(view)) {
 			vma->size = intel_remapped_info_size(&view->remapped);
 			vma->size <<= PAGE_SHIFT;
 		}
@@ -1311,27 +1311,15 @@ __i915_vma_get_pages(struct i915_vma *vma)
 	 */
 	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
 
-	switch (vma->gtt_view.type) {
-	default:
-		GEM_BUG_ON(vma->gtt_view.type);
-		fallthrough;
-	case I915_GTT_VIEW_NORMAL:
-		pages = vma->obj->mm.pages;
-		break;
-
-	case I915_GTT_VIEW_ROTATED:
-		pages =
-			intel_rotate_pages(&vma->gtt_view.rotated, vma->obj);
-		break;
-
-	case I915_GTT_VIEW_REMAPPED:
-		pages =
-			intel_remap_pages(&vma->gtt_view.remapped, vma->obj);
-		break;
-
-	case I915_GTT_VIEW_PARTIAL:
+	if (intel_gtt_view_is_rotated(&vma->gtt_view)) {
+		pages = intel_rotate_pages(&vma->gtt_view.rotated, vma->obj);
+	} else if (intel_gtt_view_is_remapped(&vma->gtt_view)) {
+		pages = intel_remap_pages(&vma->gtt_view.remapped, vma->obj);
+	} else if (intel_gtt_view_is_partial(&vma->gtt_view)) {
 		pages = intel_partial_pages(&vma->gtt_view, vma->obj);
-		break;
+	} else {
+		GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));
+		pages = vma->obj->mm.pages;
 	}
 
 	if (IS_ERR(pages)) {
-- 
2.47.3

