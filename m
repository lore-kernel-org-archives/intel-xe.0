Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C3DC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513E10E45D;
	Mon,  7 Apr 2025 13:05:12 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A46710E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 13:05:08 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 12/14] drm/xe: Convert xe_fb_pin to use a callback for insertion
 into GGTT
Date: Mon,  7 Apr 2025 15:04:47 +0200
Message-ID: <20250407130449.1010470-13-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407130449.1010470-1-dev@lankhorst.se>
References: <20250407130449.1010470-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The rotation details belong in xe_fb_pin.c, while the operations involving
GGTT belong to xe_ggtt.c. As directly locking xe_ggtt etc results in
exposing all of xe_ggtt details anyway, create a special function that
allocates a ggtt_node, and allow display to populate it using a callback
as a compromise.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 107 +++++++++++--------------
 drivers/gpu/drm/xe/xe_ggtt.c           |  83 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h           |   9 ++-
 drivers/gpu/drm/xe/xe_ggtt_types.h     |   8 +-
 4 files changed, 123 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 9059b56bc23c8..5220e433d8a6e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -166,12 +166,13 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 }
 
 static void
-write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
+write_ggtt_rotated(struct xe_ggtt *ggtt, u32 *ggtt_ofs,
+		   u64 pte_flags,
+		   xe_ggtt_set_pte_fn write_pte,
+		   struct xe_bo *bo, u32 bo_ofs,
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	u32 column, row;
-	u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 
 	for (column = 0; column < width; column++) {
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
@@ -179,7 +180,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		for (row = 0; row < height; row++) {
 			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte | addr);
+			write_pte(ggtt, *ggtt_ofs, pte_flags | addr);
 			*ggtt_ofs += XE_PAGE_SIZE;
 			src_idx -= src_stride;
 		}
@@ -189,6 +190,28 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 	}
 }
 
+struct fb_rotate_args {
+	const struct i915_gtt_view *view;
+	struct xe_bo *bo;
+};
+
+static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				    u64 pte_flags, xe_ggtt_set_pte_fn write_pte, void *data)
+{
+	struct fb_rotate_args *args = data;
+	struct xe_bo *bo = args->bo;
+	const struct intel_rotation_info *rot_info = &args->view->rotated;
+	u32 ggtt_ofs = node->base.start;
+
+	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
+		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
+				   bo, rot_info->plane[i].offset,
+				   rot_info->plane[i].width,
+				   rot_info->plane[i].height,
+				   rot_info->plane[i].src_stride,
+				   rot_info->plane[i].dst_stride);
+}
+
 static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 				const struct i915_gtt_view *view,
 				struct i915_vma *vma,
@@ -199,70 +222,38 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
-	u32 align;
-	int ret;
-
-	/* TODO: Consider sharing framebuffer mapping?
-	 * embed i915_vma inside intel_framebuffer
-	 */
-	xe_pm_runtime_get_noresume(xe);
-	ret = mutex_lock_interruptible(&ggtt->lock);
-	if (ret)
-		goto out;
+	u32 align, size;
+	int ret = 0;
 
 	align = XE_PAGE_SIZE;
-	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
+	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		align = max_t(u32, align, SZ_64K);
 
+	/* Fast case, preallocated GGTT view? */
 	if (bo->ggtt_node[tile0->id] && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node[tile0->id];
-	} else if (view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
-
-		ret = xe_ggtt_node_insert_locked(vma->node, bo->size, align, 0);
-		if (ret) {
-			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
-		}
-
-		xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_NONE]);
-	} else {
-		u32 i, ggtt_ofs;
-		const struct intel_rotation_info *rot_info = &view->rotated;
-
-		/* display seems to use tiles instead of bytes here, so convert it back.. */
-		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
-
-		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
+		return 0;
+	}
 
-		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
-		if (ret) {
-			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
-		}
+	/* TODO: Consider sharing framebuffer mapping?
+	 * embed i915_vma inside intel_framebuffer
+	 */
+	xe_pm_runtime_get_noresume(xe);
 
-		ggtt_ofs = vma->node->base.start;
+	if (view->type == I915_GTT_VIEW_NORMAL)
+		size = bo->size;
+	else
+		/* display uses tiles instead of bytes here, so convert it back.. */
+		size = intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
 
-		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
-					   rot_info->plane[i].offset,
-					   rot_info->plane[i].width,
-					   rot_info->plane[i].height,
-					   rot_info->plane[i].src_stride,
-					   rot_info->plane[i].dst_stride);
-	}
+	vma->node = xe_ggtt_node_insert_transform(ggtt, bo, xe->pat.idx[XE_CACHE_NONE],
+						  ALIGN(size, align), align,
+						  view->type == I915_GTT_VIEW_NORMAL ?
+						  NULL : write_ggtt_rotated_node,
+						  &(struct fb_rotate_args){view, bo});
+	if (IS_ERR(vma->node))
+		ret = PTR_ERR(vma->node);
 
-out_unlock:
-	mutex_unlock(&ggtt->lock);
-out:
 	xe_pm_runtime_put(xe);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 674dfd6c1efd8..c7b6369a88a9e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -522,19 +522,7 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 	xe_ggtt_node_fini(node);
 }
 
-/**
- * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
- * @node: the &xe_ggtt_node to be inserted
- * @size: size of the node
- * @align: alignment constrain of the node
- * @mm_flags: flags to control the node behavior
- *
- * It cannot be called without first having called xe_ggtt_init() once.
- * To be used in cases where ggtt->lock is already taken.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
@@ -574,8 +562,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
  * or xe_ggtt_node_remove_balloon().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
- * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
+ * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_balloon() will
+ * ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -596,9 +584,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
  * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
  * @node: the &xe_ggtt_node to be freed
  *
- * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
- * this function needs to be called to free the %xe_ggtt_node struct
+ * If anything went wrong with either xe_ggtt_node_insert(), or
+ * xe_ggtt_node_insert_balloon(); and this @node is not going to be reused,
+ * then this function needs to be called to free the %xe_ggtt_node struct
  **/
 void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 {
@@ -626,10 +614,9 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
  * @bo: the &xe_bo to be mapped
  * @pat_index: Which pat_index to use.
  */
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-		    struct xe_bo *bo, u16 pat_index)
+static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			   struct xe_bo *bo, u16 pat_index)
 {
-
 	u64 start, pte;
 	struct xe_res_cursor cur;
 
@@ -682,6 +669,60 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_node_insert_transform - Insert a newly allocated &xe_ggtt_node into the GGTT
+ * @ggtt: the &xe_ggtt where the node will inserted/reserved.
+ * @bo: The bo to be transformed
+ * @pat_index: Which pat_index to use for the bo.
+ * @size: size of the node
+ * @align: required alignment for node
+ * @transform: transformation function that will populate the GGTT node, or NULL for linear mapping.
+ * @arg: Extra argument to pass to the transformation function.
+ *
+ * This function allows inserting a GGTT node with a custom transformation function.
+ * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ */
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+						   struct xe_bo *bo,
+						   u16 pat_index,
+						   u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return ERR_CAST(node);
+
+	if (mutex_lock_interruptible(&ggtt->lock) < 0) {
+		ret = -ERESTARTSYS;
+		goto err;
+	}
+
+	ret = xe_ggtt_node_insert_locked(node, size, align, 0);
+	if (ret)
+		goto err_unlock;
+
+	if (transform) {
+		u64 pte_flags = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+		transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_pte, arg);
+	} else {
+		xe_ggtt_map_bo(ggtt, node, bo, pat_index);
+	}
+
+
+	mutex_unlock(&ggtt->lock);
+	return node;
+
+err_unlock:
+	mutex_unlock(&ggtt->lock);
+err:
+	xe_ggtt_node_fini(node);
+	return ERR_PTR(ret);
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 9a11872e16d80..8b41d0f54d256 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,12 +23,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
-			       u32 size, u32 align, u32 mm_flags);
+struct xe_ggtt_node *
+xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+			      struct xe_bo *bo, u16 pat_index,
+			      u32 size, u32 align,
+			      xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..18b5466ae8e6f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -69,6 +69,11 @@ struct xe_ggtt_node {
 	bool invalidate_on_remove;
 };
 
+typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
+				     struct xe_ggtt_node *node,
+				     u64 pte_flags,
+				     xe_ggtt_set_pte_fn set_pte, void *arg);
 /**
  * struct xe_ggtt_pt_ops - GGTT Page table operations
  * Which can vary from platform to platform.
@@ -76,8 +81,9 @@ struct xe_ggtt_node {
 struct xe_ggtt_pt_ops {
 	/** @pte_encode_flags: Encode PTE flags for a given BO */
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
+
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	xe_ggtt_set_pte_fn ggtt_set_pte;
 };
 
 #endif
-- 
2.45.2

