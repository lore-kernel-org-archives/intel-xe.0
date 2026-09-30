Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168ACA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 10:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E104510E5C2;
	Wed, 30 Sep 2026 10:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wn+1ODdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034CF10EB61;
 Wed, 30 Sep 2026 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790764481; x=1822300481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odP/QjNIWW8KaIuIWh7hRjgH+f7ISBOlMkqx9rD6EfQ=;
 b=Wn+1ODdjhwdHizYJY17jzHBDOLbYg8xratjrj3fr2fvvQBYGbTD8czaX
 KFTt6Fuq6fDf/AusdnLjZHMnZA5vHK0LktJrj61fXwbhIfWO56L0oRlO3
 fwjLZ1vS9XY5BDrKQZaS0KayhGLHgB120ik8m8Dgt6OWJxFEX4mgn6x/L
 6I0M6/ZOSSc+amuk+JL7Wjii6kwEJH+VQIctmmqPWmHnQxkzmtPf+pB6m
 /v/XNg3WNQMCV1SsQ4iQjNkbL6BrzAOG8ZhNsNEsvHgjXbFcjGjGWiMBj
 YKzuGC+yMWOiq+DACmR6VWJPxpV7Zoms8rNUF9hvRl+wbWK5/McLGlcfO Q==;
X-CSE-ConnectionGUID: hqgX2xadSbGqUXO8RrcRcw==
X-CSE-MsgGUID: w0tqL0gUSwmLY4P6oMTRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108985681"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="108985681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 03:34:40 -0700
X-CSE-ConnectionGUID: nrskc/s2R1ydVcPtr4V4Vg==
X-CSE-MsgGUID: R9H/ret+TRyW0jYNwmlMvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="272115252"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 03:34:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2] drm/i915/selftests: use intel_gtt_view_is_*() helpers more
Date: Wed, 30 Sep 2026 13:34:27 +0300
Message-ID: <20260930103427.883703-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c626ae37eed76d8b94333ba0202fdfe34ec88dd5.1789502902.git.jani.nikula@intel.com>
References: <c626ae37eed76d8b94333ba0202fdfe34ec88dd5.1789502902.git.jani.nikula@intel.com>
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

v2: Use view, not vma->gtt_view at the end (Sashiko)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 34 +++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index b16297a6a4e8..f918ae18c4e1 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -51,7 +51,7 @@ static bool assert_vma(struct i915_vma *vma,
 		ok = false;
 	}
 
-	if (vma->gtt_view.type != I915_GTT_VIEW_NORMAL) {
+	if (!intel_gtt_view_is_normal(&vma->gtt_view)) {
 		pr_err("VMA created with wrong type [%d]\n",
 		       vma->gtt_view.type);
 		ok = false;
@@ -533,12 +533,12 @@ assert_remapped(struct drm_i915_gem_object *obj,
 	return sg;
 }
 
-static unsigned int remapped_size(enum intel_gtt_view_type view_type,
+static unsigned int remapped_size(const struct intel_gtt_view *view,
 				  const struct intel_remapped_plane_info *a,
 				  const struct intel_remapped_plane_info *b)
 {
 
-	if (view_type == I915_GTT_VIEW_ROTATED)
+	if (intel_gtt_view_is_rotated(view))
 		return a->dst_stride * a->width + b->dst_stride * b->width;
 	else
 		return a->dst_stride * a->height + b->dst_stride * b->height;
@@ -606,11 +606,11 @@ static int igt_vma_rotate_remap(void *arg)
 			max_offset = max_pages - max_offset;
 
 			if (!plane_info[0].dst_stride)
-				plane_info[0].dst_stride = view.type == I915_GTT_VIEW_ROTATED ?
+				plane_info[0].dst_stride = intel_gtt_view_is_rotated(&view) ?
 									plane_info[0].height :
 									plane_info[0].width;
 			if (!plane_info[1].dst_stride)
-				plane_info[1].dst_stride = view.type == I915_GTT_VIEW_ROTATED ?
+				plane_info[1].dst_stride = intel_gtt_view_is_rotated(&view) ?
 									plane_info[1].height :
 									plane_info[1].width;
 
@@ -632,9 +632,9 @@ static int igt_vma_rotate_remap(void *arg)
 						goto out_object;
 					}
 
-					expected_pages = remapped_size(view.type, &plane_info[0], &plane_info[1]);
+					expected_pages = remapped_size(&view, &plane_info[0], &plane_info[1]);
 
-					if (view.type == I915_GTT_VIEW_ROTATED &&
+					if (intel_gtt_view_is_rotated(&view) &&
 					    vma->size != expected_pages * PAGE_SIZE) {
 						pr_err("VMA is wrong size, expected %lu, found %llu\n",
 						       PAGE_SIZE * expected_pages, vma->size);
@@ -642,7 +642,7 @@ static int igt_vma_rotate_remap(void *arg)
 						goto out_object;
 					}
 
-					if (view.type == I915_GTT_VIEW_REMAPPED &&
+					if (intel_gtt_view_is_remapped(&view) &&
 					    vma->size > expected_pages * PAGE_SIZE) {
 						pr_err("VMA is wrong size, expected %lu, found %llu\n",
 						       PAGE_SIZE * expected_pages, vma->size);
@@ -672,13 +672,13 @@ static int igt_vma_rotate_remap(void *arg)
 
 					sg = vma->pages->sgl;
 					for (n = 0; n < ARRAY_SIZE(view.rotated.plane); n++) {
-						if (view.type == I915_GTT_VIEW_ROTATED)
+						if (intel_gtt_view_is_rotated(&view))
 							sg = assert_rotated(obj, &view.rotated, n, sg);
 						else
 							sg = assert_remapped(obj, &view.remapped, n, sg);
 						if (IS_ERR(sg)) {
 							pr_err("Inconsistent %s VMA pages for plane %d: [(%d, %d, %d, %d, %d), (%d, %d, %d, %d, %d)]\n",
-							       view.type == I915_GTT_VIEW_ROTATED ?
+							       intel_gtt_view_is_rotated(&view) ?
 							       "rotated" : "remapped", n,
 							       plane_info[0].width,
 							       plane_info[0].height,
@@ -763,7 +763,7 @@ static bool assert_pin(struct i915_vma *vma,
 		ok = false;
 	}
 
-	if (view && view->type != I915_GTT_VIEW_NORMAL) {
+	if (view && !intel_gtt_view_is_normal(view)) {
 		if (memcmp(&vma->gtt_view, view, sizeof(*view))) {
 			pr_err("(%s) VMA mismatch upon creation!\n",
 			       name);
@@ -776,7 +776,7 @@ static bool assert_pin(struct i915_vma *vma,
 			ok = false;
 		}
 	} else {
-		if (vma->gtt_view.type != I915_GTT_VIEW_NORMAL) {
+		if (!intel_gtt_view_is_normal(&vma->gtt_view)) {
 			pr_err("Not the normal ggtt view! Found %d\n",
 			       vma->gtt_view.type);
 			ok = false;
@@ -1017,7 +1017,7 @@ static int igt_vma_remapped_gtt(void *arg)
 				goto out;
 
 			if (!plane_info[0].dst_stride)
-				plane_info[0].dst_stride = *t == I915_GTT_VIEW_ROTATED ?
+				plane_info[0].dst_stride = intel_gtt_view_is_rotated(&view) ?
 								 p->height : p->width;
 
 			vma = i915_gem_object_ggtt_pin(obj, &view, 0, 0, PIN_MAPPABLE);
@@ -1040,7 +1040,7 @@ static int igt_vma_remapped_gtt(void *arg)
 					unsigned int offset;
 					u32 val = y << 16 | x;
 
-					if (*t == I915_GTT_VIEW_ROTATED)
+					if (intel_gtt_view_is_rotated(&vma->gtt_view))
 						offset = (x * plane_info[0].dst_stride + y) * PAGE_SIZE;
 					else
 						offset = (y * plane_info[0].dst_stride + x) * PAGE_SIZE;
@@ -1057,7 +1057,7 @@ static int igt_vma_remapped_gtt(void *arg)
 				goto out;
 			}
 
-			GEM_BUG_ON(vma->gtt_view.type != I915_GTT_VIEW_NORMAL);
+			GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));
 
 			map = i915_vma_pin_iomap(vma);
 			i915_vma_unpin(vma);
@@ -1072,7 +1072,7 @@ static int igt_vma_remapped_gtt(void *arg)
 					u32 exp = y << 16 | x;
 					u32 val;
 
-					if (*t == I915_GTT_VIEW_ROTATED)
+					if (intel_gtt_view_is_rotated(&view))
 						src_idx = rotated_index(&view.rotated, 0, x, y);
 					else
 						src_idx = remapped_index(&view.remapped, 0, x, y);
@@ -1081,7 +1081,7 @@ static int igt_vma_remapped_gtt(void *arg)
 					val = ioread32(&map[offset / sizeof(*map)]);
 					if (val != exp) {
 						pr_err("%s VMA write test failed, expected 0x%x, found 0x%x\n",
-						       *t == I915_GTT_VIEW_ROTATED ? "Rotated" : "Remapped",
+						       intel_gtt_view_is_rotated(&view) ? "Rotated" : "Remapped",
 						       exp, val);
 						i915_vma_unpin_iomap(vma);
 						err = -EINVAL;
-- 
2.47.3

