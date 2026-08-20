Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0A8C5DF87
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7210EFD8;
	Thu, 20 Aug 2026 10:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDR+C6jO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009E610EFD8;
 Thu, 20 Aug 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787223165; x=1818759165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+Fh6Eefn4Ofovv4xbjkAV4gZPLUBpiTEznB/RQgR5Q=;
 b=mDR+C6jOXJ6lu61CPUq/MjXY/VgDdL4X16w3NZIzpIX4pZnzxTenOnir
 ivET50qkd10Z7i4CvNEig64SKefG9zd7TCMA0+PFw2zUbiNLX/5eIyh/5
 2zhLDKpBC992FKvJNoXFf4uvQ6WIcdppMRAJHnVo64lWvlmMbRkLTGMaa
 Qyewqg+Kypa9O5wfSEvVOwZnvhJYLs0h24h5xgBVfmXBOsa+fd4o33t2W
 j4LEDC7dYxX1JxiSar7CLLCLEmsU9L4WmxzEwvc779PwTjElI68B+VhIe
 sRpRaYHpgdGJgZSvODXLdVIHXbpEEMgD4BNe3pzb3nOLXnMM9byFiD1fY A==;
X-CSE-ConnectionGUID: KakNNvq5SBCQlkDxhC4z0w==
X-CSE-MsgGUID: KB70L9sBTN+DxQfRWgGjtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98088181"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98088181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:52:45 -0700
X-CSE-ConnectionGUID: E5bzvyFzSguL21CeG8i9GA==
X-CSE-MsgGUID: DVWJumVCRuaIVMnzkVP1pA==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2026 03:52:43 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH for CI] drm/i915/xe: Restore plane GGTT mappings after
 D3cold/suspend
Date: Thu, 20 Aug 2026 10:52:41 +0000
Message-ID: <20260820105241.3606793-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

D3cold and suspend power down the GGTT translation hardware, but
nothing tells display about it. Planes that reuse their old ggtt_vma
instead of re-pinning -- the fast path in xe_fb_pin_reuse_vma(),
which cursor always takes -- never get new PTEs written. Come back
from D3cold and the vma points at garbage. Cursor plane throws GGTT/
ATS faults forever after.

Add an optional remap_vma hook to the fb_pin interface plus
intel_plane_resume_ggtt_mappings() to walk every plane's current
ggtt_vma and call it. Hook it up in xe's D3cold-exit path and in the
full resume path too, since i915 already does the equivalent
unconditionally via i915_ggtt_resume().

xe_ggtt_map_bo_unlocked() always remapped bo->ggtt_node[tile], which
is flat out wrong for framebuffers: __xe_pin_fb_vma_ggtt()'s slow
path (rotated views, no preallocated node) hands out a node that
never ends up in that array. Pass the node in explicitly instead of
guessing.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_parent.c  |  7 +++++++
 drivers/gpu/drm/i915/display/intel_parent.h  |  2 ++
 drivers/gpu/drm/i915/display/intel_plane.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_plane.h   |  1 +
 drivers/gpu/drm/xe/display/xe_display.c      |  7 +++++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c       | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_bo_evict.c             |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 |  9 ++++++---
 drivers/gpu/drm/xe/xe_ggtt.h                 |  2 +-
 include/drm/intel/display_parent_interface.h |  1 +
 10 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index ffc1f5e0518c..7ca950d7a32e 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -106,6 +106,13 @@ struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
 						  new_obj, new_view, out_offset);
 }
 
+void intel_parent_fb_pin_remap_vma(struct intel_display *display,
+				   struct i915_vma *ggtt_vma)
+{
+	if (display->parent->fb_pin->remap_vma)
+		display->parent->fb_pin->remap_vma(ggtt_vma);
+}
+
 void intel_parent_fb_pin_get_map(struct intel_display *display,
 				 struct i915_vma *vma, struct iosys_map *map)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index c817a826169c..b01c32f8150a 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -57,6 +57,8 @@ struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
 					       struct drm_gem_object *new_obj,
 					       const struct i915_gtt_view *new_view,
 					       u32 *out_offset);
+void intel_parent_fb_pin_remap_vma(struct intel_display *display,
+				   struct i915_vma *ggtt_vma);
 void intel_parent_fb_pin_get_map(struct intel_display *display,
 				 struct i915_vma *vma, struct iosys_map *map);
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d0f99a87c42e..78bd6d37294f 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -50,6 +50,7 @@
 #include "intel_cdclk.h"
 #include "intel_cursor.h"
 #include "intel_colorop.h"
+#include "intel_display.h"
 #include "intel_display_rps.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
@@ -1399,6 +1400,24 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 	}
 }
 
+/*
+ * D3cold/S3+ can power down the GGTT translation HW without the display
+ * code ever knowing -- re-validate every plane's cached ggtt_vma PTEs
+ * on resume, before anything tries to scan out through them again.
+ */
+void intel_plane_resume_ggtt_mappings(struct intel_display *display)
+{
+	struct intel_plane *plane;
+
+	for_each_intel_plane(display->drm, plane) {
+		const struct intel_plane_state *plane_state =
+			to_intel_plane_state(plane->base.state);
+
+		if (plane_state->ggtt_vma)
+			intel_parent_fb_pin_remap_vma(display, plane_state->ggtt_vma);
+	}
+}
+
 static int add_dma_resv_fences(struct dma_resv *resv,
 			       struct drm_plane_state *new_plane_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
index dba2be24aae2..7066f8461778 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_plane.h
@@ -99,5 +99,6 @@ bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
 int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 		       const struct intel_plane_state *old_plane_state);
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state);
+void intel_plane_resume_ggtt_mappings(struct intel_display *display);
 
 #endif /* __INTEL_PLANE_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7b25c0814674..014d00a4942b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -30,6 +30,7 @@
 #include "intel_fbdev.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
+#include "intel_plane.h"
 #include "skl_watermark.h"
 #include "xe_device.h"
 #include "xe_display_bo.h"
@@ -295,6 +296,9 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_display_driver_init_hw(display);
 
+	/* GGTT translation HW may have lost state across suspend; restore plane vmas. */
+	intel_plane_resume_ggtt_mappings(display);
+
 	intel_display_driver_pm_resume(display);
 }
 
@@ -335,6 +339,9 @@ static void xe_display_disable_d3cold(struct xe_device *xe)
 
 	intel_display_driver_init_hw(display);
 
+	/* D3cold power-cycles the GGTT translation HW; restore plane vmas. */
+	intel_plane_resume_ggtt_mappings(display);
+
 	intel_hpd_init(display);
 
 	if (intel_display_device_present(display))
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 73469ea5f333..97de9c9b584a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -476,6 +476,18 @@ xe_fb_pin_reuse_vma(struct i915_vma *old_ggtt_vma,
 	return NULL;
 }
 
+/* D3cold/S3+ power down the GGTT translation HW; restore this vma's PTEs on resume. */
+static void xe_fb_pin_remap_vma(struct i915_vma *ggtt_vma)
+{
+	struct xe_bo *bo = ggtt_vma->bo;
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe_bo_device(bo));
+
+	if (ggtt_vma->dpt)
+		return;
+
+	xe_ggtt_map_bo_unlocked(tile0->mem.ggtt, ggtt_vma->node, bo);
+}
+
 static void xe_fb_pin_get_map(struct i915_vma *vma, struct iosys_map *map)
 {
 	*map = vma->bo->vmap;
@@ -487,5 +499,6 @@ const struct intel_display_fb_pin_interface xe_display_fb_pin_interface = {
 	.dpt_pin = xe_fb_pin_dpt_pin,
 	.dpt_unpin = xe_fb_pin_dpt_unpin,
 	.reuse_vma = xe_fb_pin_reuse_vma,
+	.remap_vma = xe_fb_pin_remap_vma,
 	.get_map = xe_fb_pin_get_map,
 };
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..a1ea3ab337fe 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -205,7 +205,7 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 			if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
 				continue;
 
-			xe_ggtt_map_bo_unlocked(tile->mem.ggtt, bo);
+			xe_ggtt_map_bo_unlocked(tile->mem.ggtt, bo->ggtt_node[id], bo);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..7a4af29f84a2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -717,11 +717,14 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 /**
  * xe_ggtt_map_bo_unlocked - Restore a mapping of a BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
+ * @node: the &xe_ggtt_node to restore the mapping for
  * @bo: the &xe_bo to be mapped
  *
- * This is used to restore a GGTT mapping after suspend.
+ * This is used to restore a GGTT mapping after suspend. @node need not be
+ * @bo's own ggtt_node[] entry -- e.g. a display scanout vma may hold a
+ * separate node that was never inserted via xe_ggtt_insert_bo_at().
  */
-void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
@@ -729,7 +732,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 	mutex_lock(&ggtt->lock);
 	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
-	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pte);
+	xe_ggtt_map_bo(ggtt, node, bo, pte);
 	mutex_unlock(&ggtt->lock);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..db9be2d92517 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -31,7 +31,7 @@ xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
-void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end, struct drm_exec *exec);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index d7d06dcaa699..8877c0283445 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -105,6 +105,7 @@ struct intel_display_fb_pin_interface {
 				      struct drm_gem_object *new_obj,
 				      const struct i915_gtt_view *new_view,
 				      u32 *out_offset);
+	void (*remap_vma)(struct i915_vma *ggtt_vma); /* Optional */
 	void (*get_map)(struct i915_vma *vma, struct iosys_map *map);
 };
 
-- 
2.43.0

