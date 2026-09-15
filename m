Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F97C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4788A10E2D6;
	Tue, 15 Sep 2026 20:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2PxIOTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1B10E400;
 Tue, 15 Sep 2026 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502996; x=1821038996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQldg8P/kmQKirMlE2z1+mJBmnCSukuq6joLSGnXXg0=;
 b=n2PxIOTwm3DnhTRqc353gugmi6w3ysCYFYkE/idKGKxxhAwMqapt7O8p
 rbcYLtialHcJzFQjTReBfmSzSrH3OBokksaXqY2C8+fm4tKTZ4OT+416r
 JLKWjr3ri4eMPeNWTrEnOIrBuK7+lH1UCL2OWdwnIBO6IhGm7CP4SJZY+
 KIb41fpsVWzbH4Z8hBqnN+JC3eswlR5O40Dc8+LaEpqw2AAtK5tINk9i6
 G7GPSTWg9Qhy1X3FDc1NFHEMI6Vwgd0An8Igmp2h6aanfJXbFcgc8lXs7
 h6y15Uisd4DfJPJHUmcgOd+boIcSu0QcB28msqlc68DM3kJbDJ4keGkci w==;
X-CSE-ConnectionGUID: HppX/G42RW6dbqUaP+6jBQ==
X-CSE-MsgGUID: IUPRFxc6T7aMfLX4YlK81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89750699"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89750699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:55 -0700
X-CSE-ConnectionGUID: 6UHnLN7oTEu2t8SazTi7GQ==
X-CSE-MsgGUID: cGOuux5pTpCWLyIk40warA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270490570"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 07/10] drm/i915/vma: use intel_gtt_view_is_*() helpers more
Date: Tue, 15 Sep 2026 23:09:18 +0300
Message-ID: <9c0baac3b77ee47782d6cb4b17453e95d45f145f.1789502902.git.jani.nikula@intel.com>
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

