Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD64CD1283
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 19:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E628F10FF6F;
	Wed, 27 Mar 2024 19:07:11 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371210FF6D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 19:07:02 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-test 5/8] drm/xe/display: Preparations for preallocating dpt bo
Date: Wed, 27 Mar 2024 20:07:06 +0100
Message-ID: <20240327190710.2359-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
References: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
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

The DPT bo should not be allocated when pinning, but in advance when
creating the framebuffer. Split allocation from bo pinning and GGTT
insertion.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 154 +++++++++++++++++++------
 1 file changed, 119 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2a50a7eaaa31..fcbc69c85106 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -76,47 +76,127 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
-static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
-			       const struct i915_gtt_view *view,
-			       struct i915_vma *vma)
+static struct xe_bo *xe_fb_dpt_alloc(struct intel_framebuffer *fb)
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
-	struct xe_ggtt *ggtt = tile0->mem.ggtt;
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
-	if (view->type == I915_GTT_VIEW_NORMAL)
+	if (!intel_fb_needs_pot_stride_remap(fb))
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
-	else if (view->type == I915_GTT_VIEW_REMAPPED)
-		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
-				 XE_PAGE_SIZE);
 	else
-		/* display uses 4K tiles instead of bytes here, convert to entries.. */
-		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
+		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
 				 XE_PAGE_SIZE);
 
 	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_VRAM0_BIT |
-					   XE_BO_CREATE_GGTT_BIT |
-					   XE_BO_PAGETABLE);
-	else
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_GGTT_BIT |
-					   XE_BO_PAGETABLE);
+		return xe_bo_create(xe, tile0, NULL, dpt_size,
+				    ttm_bo_type_kernel,
+				    XE_BO_CREATE_VRAM0_BIT |
+				    XE_BO_PAGETABLE);
+
+	dpt = xe_bo_create(xe, tile0, NULL, dpt_size,
+			   ttm_bo_type_kernel,
+			   XE_BO_CREATE_STOLEN_BIT |
+			   XE_BO_PAGETABLE);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_SYSTEM_BIT |
-					   XE_BO_CREATE_GGTT_BIT |
-					   XE_BO_PAGETABLE);
+		dpt = xe_bo_create(xe, tile0, NULL, dpt_size,
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_SYSTEM_BIT |
+				   XE_BO_PAGETABLE);
+
+	return dpt;
+}
+
+static void xe_fb_dpt_free(struct i915_vma *vma)
+{
+	xe_bo_put(vma->dpt);
+	vma->dpt = NULL;
+}
+
+static int xe_fb_dpt_map_ggtt(struct xe_bo *dpt)
+{
+	struct xe_device *xe = xe_bo_device(dpt);
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
+	struct xe_ggtt *ggtt = tile0->mem.ggtt;
+	u64 start = 0, end = U64_MAX;
+	u64 alignment = XE_PAGE_SIZE;
+	int err;
+
+	if (xe_bo_is_vram(dpt) && ggtt->flags & XE_GGTT_FLAGS_64K)
+		alignment = SZ_64K;
+
+	if (XE_WARN_ON(dpt->ggtt_node.size))
+		return -EINVAL;
+
+	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	err = mutex_lock_interruptible(&ggtt->lock);
+	if (err)
+		goto out_put;
+
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &dpt->ggtt_node, dpt->size,
+					  alignment, 0, start, end, 0);
+	if (!err)
+		xe_ggtt_map_bo(ggtt, dpt);
+	mutex_unlock(&ggtt->lock);
+
+out_put:
+	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	return err;
+}
+
+static int
+xe_fb_dpt_alloc_pinned(struct i915_vma *vma, struct intel_framebuffer *fb)
+{
+	struct xe_bo *dpt;
+	int err;
+
+	dpt = xe_fb_dpt_alloc(fb);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
+	vma->dpt = dpt;
+
+	err = ttm_bo_reserve(&dpt->ttm, true, false, NULL);
+	if (!err) {
+		err = xe_bo_validate(dpt, NULL, true);
+		if (!err)
+			err = xe_bo_vmap(dpt);
+		if (!err)
+			ttm_bo_pin(&dpt->ttm);
+		ttm_bo_unreserve(&dpt->ttm);
+	}
+	if (err)
+		xe_fb_dpt_free(vma);
+	return err;
+}
+
+static void xe_fb_dpt_unpin_free(struct i915_vma *vma)
+{
+	ttm_bo_reserve(&vma->dpt->ttm, false, false, NULL);
+	ttm_bo_unpin(&vma->dpt->ttm);
+	ttm_bo_unreserve(&vma->dpt->ttm);
+
+	xe_fb_dpt_free(vma);
+}
+
+static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
+			       const struct i915_gtt_view *view,
+			       struct i915_vma *vma)
+{
+	struct xe_device *xe = to_xe_device(fb->base.dev);
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
+	struct xe_ggtt *ggtt = tile0->mem.ggtt;
+	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
+	u32 size = bo->ttm.base.size;
+	int ret;
+
+	ret = xe_fb_dpt_alloc_pinned(vma, fb);
+	if (ret)
+		return ret;
+	dpt = vma->dpt;
+
+	/* Create GGTT mapping.. */
 	if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x;
 
@@ -151,9 +231,10 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 					  rot_info->plane[i].dst_stride);
 	}
 
-	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
-	return 0;
+	ret = xe_fb_dpt_map_ggtt(dpt);
+	if (ret)
+		xe_fb_dpt_unpin_free(vma);
+	return ret;
 }
 
 static void
@@ -281,7 +362,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
 	 */
-	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
+	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
 	if (ret)
 		goto err;
 
@@ -319,11 +400,14 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 
-	if (vma->dpt)
-		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+	if (vma->dpt) {
+		xe_ggtt_remove_bo(ggtt, vma->dpt);
+		xe_fb_dpt_unpin_free(vma);
+	} else {
+		if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
+		    vma->bo->ggtt_node.start != vma->node.start)
+			xe_ggtt_remove_node(ggtt, &vma->node, false);
+	}
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
-- 
2.43.0

