Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B3EC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3746112AC4;
	Tue,  5 Mar 2024 13:12:57 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E71112ABD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 13:12:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 3/4] drm/xe: Do not perform GuC TLB invalidation for display
 GGTT
Date: Tue,  5 Mar 2024 14:12:49 +0100
Message-ID: <20240305131250.5330-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
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

There should be no need to invalidate GuC for display, and it adds
a lot of latency for pinning/unpinning.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 11 ++++++++---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  3 ++-
 drivers/gpu/drm/xe/xe_bo.h                    |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c                  | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  4 ++--
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..95595d2cf1dc 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -100,16 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_VRAM0_BIT |
+					   XE_BO_CREATE_GGTT_BIT |
+					   XE_BO_DISPLAY_GGTT_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
 	else
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_STOLEN_BIT |
+					   XE_BO_DISPLAY_GGTT_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_SYSTEM_BIT |
+					   XE_BO_DISPLAY_GGTT_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
@@ -201,6 +205,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 
 	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
+		goto out_unlock;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -238,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(ggtt);
+	xe_ggtt_invalidate(ggtt, true);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
@@ -321,7 +326,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.start != vma->node.start)
-		xe_ggtt_remove_node(ggtt, &vma->node);
+		xe_ggtt_remove_node(ggtt, &vma->node, true);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
@@ -381,4 +386,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 866d1dd6eeb4..79766b561d16 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -62,7 +62,8 @@ initial_plane_bo(struct xe_device *xe,
 	if (plane_config->size == 0)
 		return NULL;
 
-	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT | XE_BO_CREATE_GGTT_BIT;
+	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT |
+		XE_BO_CREATE_GGTT_BIT | XE_BO_DISPLAY_GGTT_BIT;
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..1290c17c10f9 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -45,6 +45,8 @@
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
 #define XE_BO_NEEDS_UC			BIT(14)
+#define XE_BO_DISPLAY_GGTT_BIT		BIT(15)
+
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 325337c38961..bda5055a2a18 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -211,7 +211,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
-	xe_ggtt_invalidate(ggtt);
+	xe_ggtt_invalidate(ggtt, false);
 	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
@@ -261,8 +261,12 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 }
 
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display)
 {
+	/* Nothing to invalidate for display */
+	if (display)
+		return;
+
 	/* Each GT in a tile has its own TLB to cache GGTT lookups */
 	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
@@ -388,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt);
+	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -433,7 +437,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display)
 {
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
@@ -442,7 +446,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	xe_ggtt_invalidate(ggtt);
+	xe_ggtt_invalidate(ggtt, display);
 
 	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
@@ -456,7 +460,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_node, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
 }
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 42705e1338e1..bc2a6379a2e9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -11,7 +11,7 @@
 struct drm_printer;
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
@@ -24,7 +24,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
 				       struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node);
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-- 
2.43.0

