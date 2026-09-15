Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D95C982C1
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411710E61B;
	Tue, 15 Sep 2026 20:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU4V/23p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDE310E60F;
 Tue, 15 Sep 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789503007; x=1821039007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mXH3C4SpuRhvjGYQgO+TFuoi95Us0lhT7Pc8LhA3w18=;
 b=HU4V/23pcEqmhHbN9AiZN12rATInFi9cJT9lJq5qGcwylHBohlrSoYN8
 7Cy5IuFZdQUnZTNzQbKB21ltxIf9FS0cwhAaVBzRUK2nx2pRKF4LXdPKq
 qUerFPEGuq1RP6zETIvk16A8bzySIHwCqd3GZZiscz+0f7pgyP5+uNnVi
 qWzrWAYHfQ/gY8RnH63omk8fdtbASC/jH+K6C4+6hOdAd2kbdKI7FnLrG
 Py3SqwJ+6z9VLUPu/ZKstIRZMOWNpeYKckn/4UEFXQvaREhORoJSzzyBe
 PyjeMmlhElOzyRP4SpnvPRM0DfA8TbAOcX/Ea3XbJugLoNtU0/vE15oBJ A==;
X-CSE-ConnectionGUID: Ad3B/hw/SHCS9wRGXS0dJQ==
X-CSE-MsgGUID: HGvVcw4YQaCg+cCZn2qx+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89750724"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89750724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:10:07 -0700
X-CSE-ConnectionGUID: CzQPR4UXSEy7TECczmXMXQ==
X-CSE-MsgGUID: ppIgzTiEQn+yIoBhsQ00yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270490637"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:10:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 10/10] drm/intel: rename I915_GTT_VIEW_* enumerations to
 INTEL_GTT_VIEW_*
Date: Tue, 15 Sep 2026 23:09:21 +0300
Message-ID: <989c6c8fb645f005fd7ea5777e26e3ce60c08d9f.1789502902.git.jani.nikula@intel.com>
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

Make the I915_GTT_VIEW_* enumerators less i915 specific, and rename them
INTEL_GTT_VIEW_*.

$ sed -i 's/I915_GTT_VIEW_/INTEL_GTT_VIEW_/g' -- $(git grep -l I915_GTT_VIEW_)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c   |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_mman.c  |  6 +++---
 drivers/gpu/drm/i915/i915_vma.h           |  8 ++++----
 drivers/gpu/drm/i915/i915_vma_types.h     | 10 +++++-----
 drivers/gpu/drm/i915/selftests/i915_vma.c | 12 ++++++------
 include/drm/intel/gtt_view_types.h        | 16 ++++++++--------
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index d1b4efa08bcc..9d71f594537f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1706,7 +1706,7 @@ int intel_fill_fb_info(struct intel_display *display, struct intel_framebuffer *
 	unsigned int tile_size = intel_tile_size(display);
 
 	intel_fb_view_init(display, &fb->normal_view,
-			   I915_GTT_VIEW_NORMAL, fb);
+			   INTEL_GTT_VIEW_NORMAL, fb);
 
 	drm_WARN_ON(display->drm,
 		    intel_fb_supports_90_270_rotation(fb) &&
@@ -1714,10 +1714,10 @@ int intel_fill_fb_info(struct intel_display *display, struct intel_framebuffer *
 
 	if (intel_fb_supports_90_270_rotation(fb))
 		intel_fb_view_init(display, &fb->rotated_view,
-				   I915_GTT_VIEW_ROTATED, fb);
+				   INTEL_GTT_VIEW_ROTATED, fb);
 	if (intel_fb_needs_pot_stride_remap(fb))
 		intel_fb_view_init(display, &fb->remapped_view,
-				   I915_GTT_VIEW_REMAPPED, fb);
+				   INTEL_GTT_VIEW_REMAPPED, fb);
 
 	for (i = 0; i < num_planes; i++) {
 		struct fb_plane_view_dims view_dims;
@@ -1845,7 +1845,7 @@ static void intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 
 	intel_fb_view_init(display, &plane_state->view,
 			   drm_rotation_90_or_270(rotation) ?
-			   I915_GTT_VIEW_ROTATED : I915_GTT_VIEW_REMAPPED,
+			   INTEL_GTT_VIEW_ROTATED : INTEL_GTT_VIEW_REMAPPED,
 			   intel_fb);
 
 	src_x = plane_state->uapi.src.x1 >> 16;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 055f8d3161da..6b337684dbfe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -206,7 +206,7 @@ compute_partial_view(const struct drm_i915_gem_object *obj,
 	if (i915_gem_object_is_tiled(obj))
 		chunk = roundup(chunk, tile_row_pages(obj) ?: 1);
 
-	view.type = I915_GTT_VIEW_PARTIAL;
+	view.type = INTEL_GTT_VIEW_PARTIAL;
 	view.partial.offset = rounddown(page_offset, chunk);
 	view.partial.size =
 		min_t(unsigned int, chunk,
@@ -214,7 +214,7 @@ compute_partial_view(const struct drm_i915_gem_object *obj,
 
 	/* If the partial covers the entire object, just create a normal VMA. */
 	if (chunk >= obj->base.size >> PAGE_SHIFT)
-		view.type = I915_GTT_VIEW_NORMAL;
+		view.type = INTEL_GTT_VIEW_NORMAL;
 
 	return view;
 }
@@ -407,7 +407,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
 		if (IS_ERR(vma) && vma != ERR_PTR(-EDEADLK)) {
 			flags = PIN_MAPPABLE;
-			view.type = I915_GTT_VIEW_PARTIAL;
+			view.type = INTEL_GTT_VIEW_PARTIAL;
 			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
 		}
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index a8a89bb0270c..b0aca10bf8e7 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -217,7 +217,7 @@ i915_vma_compare(struct i915_vma *vma,
 	if (cmp)
 		return cmp;
 
-	BUILD_BUG_ON(I915_GTT_VIEW_NORMAL != 0);
+	BUILD_BUG_ON(INTEL_GTT_VIEW_NORMAL != 0);
 	cmp = vma->gtt_view.type;
 	if (!view)
 		return cmp;
@@ -238,9 +238,9 @@ i915_vma_compare(struct i915_vma *vma,
 	 * we assert above that all branches have the same address, and that
 	 * each branch has a unique type/size.
 	 */
-	BUILD_BUG_ON(I915_GTT_VIEW_NORMAL >= I915_GTT_VIEW_PARTIAL);
-	BUILD_BUG_ON(I915_GTT_VIEW_PARTIAL >= I915_GTT_VIEW_ROTATED);
-	BUILD_BUG_ON(I915_GTT_VIEW_ROTATED >= I915_GTT_VIEW_REMAPPED);
+	BUILD_BUG_ON(INTEL_GTT_VIEW_NORMAL >= INTEL_GTT_VIEW_PARTIAL);
+	BUILD_BUG_ON(INTEL_GTT_VIEW_PARTIAL >= INTEL_GTT_VIEW_ROTATED);
+	BUILD_BUG_ON(INTEL_GTT_VIEW_ROTATED >= INTEL_GTT_VIEW_REMAPPED);
 	BUILD_BUG_ON(offsetof(typeof(*view), rotated) !=
 		     offsetof(typeof(*view), partial));
 	BUILD_BUG_ON(offsetof(typeof(*view), rotated) !=
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 8815421eaefb..95eaf68fdfae 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -112,10 +112,10 @@ static inline void assert_i915_gem_gtt_types(void)
 	 * we have to be careful that each branch has a unique size.
 	 */
 	switch ((enum intel_gtt_view_type)0) {
-	case I915_GTT_VIEW_NORMAL:
-	case I915_GTT_VIEW_PARTIAL:
-	case I915_GTT_VIEW_ROTATED:
-	case I915_GTT_VIEW_REMAPPED:
+	case INTEL_GTT_VIEW_NORMAL:
+	case INTEL_GTT_VIEW_PARTIAL:
+	case INTEL_GTT_VIEW_ROTATED:
+	case INTEL_GTT_VIEW_REMAPPED:
 		/* gcc complains if these are identical cases */
 		break;
 	}
@@ -231,7 +231,7 @@ struct i915_vma {
 	 * Support different GGTT views into the same object.
 	 * This means there can be multiple VMA mappings per object and per VM.
 	 * intel_gtt_view_type is used to distinguish between those entries.
-	 * The default one of zero (I915_GTT_VIEW_NORMAL) is default and also
+	 * The default one of zero (INTEL_GTT_VIEW_NORMAL) is default and also
 	 * assumed in GEM functions which take no ggtt view parameter.
 	 */
 	struct intel_gtt_view gtt_view;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index ca340a94f772..ace26dfaf55a 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -573,8 +573,8 @@ static int igt_vma_rotate_remap(void *arg)
 		{ }
 	}, *a, *b;
 	enum intel_gtt_view_type types[] = {
-		I915_GTT_VIEW_ROTATED,
-		I915_GTT_VIEW_REMAPPED,
+		INTEL_GTT_VIEW_ROTATED,
+		INTEL_GTT_VIEW_REMAPPED,
 		0,
 	}, *t;
 	const unsigned int max_pages = 64;
@@ -825,12 +825,12 @@ static int igt_vma_partial(void *arg)
 			for_each_prime_number_from(offset, 0, npages - sz) {
 				struct intel_gtt_view view;
 
-				view.type = I915_GTT_VIEW_PARTIAL;
+				view.type = INTEL_GTT_VIEW_PARTIAL;
 				view.partial.offset = offset;
 				view.partial.size = sz;
 
 				if (sz == npages)
-					view.type = I915_GTT_VIEW_NORMAL;
+					view.type = INTEL_GTT_VIEW_NORMAL;
 
 				vma = checked_vma_instance(obj, vm, &view);
 				if (IS_ERR(vma)) {
@@ -982,8 +982,8 @@ static int igt_vma_remapped_gtt(void *arg)
 		{ }
 	}, *p;
 	enum intel_gtt_view_type types[] = {
-		I915_GTT_VIEW_ROTATED,
-		I915_GTT_VIEW_REMAPPED,
+		INTEL_GTT_VIEW_ROTATED,
+		INTEL_GTT_VIEW_REMAPPED,
 		0,
 	}, *t;
 	struct drm_i915_gem_object *obj;
diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index d235a3ad50c3..b3ccd5b5a3f4 100644
--- a/include/drm/intel/gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -40,10 +40,10 @@ struct intel_remapped_info {
 } __packed;
 
 enum intel_gtt_view_type {
-	I915_GTT_VIEW_NORMAL = 0,
-	I915_GTT_VIEW_ROTATED = sizeof(struct intel_rotation_info),
-	I915_GTT_VIEW_PARTIAL = sizeof(struct intel_partial_info),
-	I915_GTT_VIEW_REMAPPED = sizeof(struct intel_remapped_info),
+	INTEL_GTT_VIEW_NORMAL = 0,
+	INTEL_GTT_VIEW_ROTATED = sizeof(struct intel_rotation_info),
+	INTEL_GTT_VIEW_PARTIAL = sizeof(struct intel_partial_info),
+	INTEL_GTT_VIEW_REMAPPED = sizeof(struct intel_remapped_info),
 };
 
 struct intel_gtt_view {
@@ -58,22 +58,22 @@ struct intel_gtt_view {
 
 static inline bool intel_gtt_view_is_normal(const struct intel_gtt_view *view)
 {
-	return view->type == I915_GTT_VIEW_NORMAL;
+	return view->type == INTEL_GTT_VIEW_NORMAL;
 }
 
 static inline bool intel_gtt_view_is_remapped(const struct intel_gtt_view *view)
 {
-	return view->type == I915_GTT_VIEW_REMAPPED;
+	return view->type == INTEL_GTT_VIEW_REMAPPED;
 }
 
 static inline bool intel_gtt_view_is_rotated(const struct intel_gtt_view *view)
 {
-	return view->type == I915_GTT_VIEW_ROTATED;
+	return view->type == INTEL_GTT_VIEW_ROTATED;
 }
 
 static inline bool intel_gtt_view_is_partial(const struct intel_gtt_view *view)
 {
-	return view->type == I915_GTT_VIEW_PARTIAL;
+	return view->type == INTEL_GTT_VIEW_PARTIAL;
 }
 
 #endif
-- 
2.47.3

