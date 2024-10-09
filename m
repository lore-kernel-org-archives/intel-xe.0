Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF442CEDD89
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05210E6F4;
	Wed,  9 Oct 2024 12:51:14 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ECA10E6EF
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:51:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 4/6] drm/xe: Convert xe_fb_pin to use a callback for
 insertion into GGTT
Date: Wed,  9 Oct 2024 14:51:12 +0200
Message-ID: <20241009125114.412624-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
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

The rotation details belong in xe_fb_pin.c, while the operations involving
GGTT belong to xe_ggtt.c. As directly locking xe_ggtt etc results in
exposing all of xe_ggtt details anyway, create a special function that
allocates a ggtt_node, and allow display to populate it using a callback
as a compromise.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 124 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_ggtt.c           |  59 ++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h           |   3 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h     |   9 +-
 4 files changed, 107 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 79dbbbe03c7f6..ec1dd356f26b4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -159,7 +159,10 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 }
 
 static void
-write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
+write_ggtt_rotated(struct xe_ggtt *ggtt, u32 *ggtt_ofs,
+		   xe_ggtt_pte_encode_bo_fn pte_encode_bo,
+		   xe_ggtt_set_pte_fn write_pte,
+		   struct xe_bo *bo, u32 bo_ofs,
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -169,10 +172,10 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte);
+			write_pte(ggtt, *ggtt_ofs, pte);
 			*ggtt_ofs += XE_PAGE_SIZE;
 			src_idx -= src_stride;
 		}
@@ -182,6 +185,36 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 	}
 }
 
+struct fb_rotate_args {
+	const struct i915_gtt_view *view;
+	struct xe_bo *bo;
+};
+
+static void write_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			    xe_ggtt_pte_encode_bo_fn pte_encode_bo,
+			    xe_ggtt_set_pte_fn write_pte, void *data)
+{
+	struct fb_rotate_args *args = data;
+	struct xe_bo *bo = args->bo;
+	u32 ggtt_ofs = node->base.start;
+
+	if (args->view->type == I915_GTT_VIEW_NORMAL) {
+		u16 pat_index = xe_bo_device(bo)->pat.idx[XE_CACHE_NONE];
+
+		for (u32 ofs = 0; ofs < bo->size; ofs += XE_PAGE_SIZE)
+			write_pte(ggtt, ggtt_ofs + ofs, pte_encode_bo(bo, ofs, pat_index));
+	} else {
+		const struct intel_rotation_info *rot_info = &args->view->rotated;
+		for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
+			write_ggtt_rotated(ggtt, &ggtt_ofs, pte_encode_bo, write_pte,
+					bo, rot_info->plane[i].offset,
+					rot_info->plane[i].width,
+					rot_info->plane[i].height,
+					rot_info->plane[i].src_stride,
+					rot_info->plane[i].dst_stride);
+	}
+}
+
 static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 				const struct i915_gtt_view *view,
 				struct i915_vma *vma)
@@ -190,78 +223,37 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u32 align;
-	int ret;
-
-	/* TODO: Consider sharing framebuffer mapping?
-	 * embed i915_vma inside intel_framebuffer
-	 */
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
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
 	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
-	} else if (view->type == I915_GTT_VIEW_NORMAL) {
-		u32 x, size = bo->ttm.base.size;
-
-		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
-
-		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
-		if (ret) {
-			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
-		}
-
-		for (x = 0; x < size; x += XE_PAGE_SIZE) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
-							      xe->pat.idx[XE_CACHE_NONE]);
-
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
-		}
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
+	vma->node = xe_ggtt_node_insert_transform(ggtt, ALIGN(size, align), align,
+						  write_ggtt_node,
+						  &(struct fb_rotate_args){view, bo});
+	if (IS_ERR(vma->node))
+		ret = PTR_ERR(vma->node);
 
-out_unlock:
-	mutex_unlock(&ggtt->lock);
-out:
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c9fa9d15b69de..93c903db6d1f5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -502,19 +502,7 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
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
@@ -546,6 +534,41 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_insert_transform - Insert a newly allocated &xe_ggtt_node into the GGTT
+ * @ggtt: the &xe_ggtt where the node will inserted/reserved.
+ * @size: size of the node
+ * @align: required alignment for node
+ * @transform: transformation function that will populate the GGTT node.
+ * @arg: Extra argument to pass to the transformation functino.
+ *
+ * This function allows inserting a GGTT node with a custom transformation function.
+ * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ */
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt, u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return ERR_CAST(node);
+
+	scoped_cond_guard(mutex_intr, ret = -ERESTARTSYS, &ggtt->lock) {
+		ret = xe_ggtt_node_insert_locked(node, size, align, 0);
+		if (!ret)
+			transform(ggtt, node, ggtt->pt_ops->pte_encode_bo, ggtt->pt_ops->ggtt_set_pte, arg);
+	}
+
+	if (!ret)
+		return node;
+
+	xe_ggtt_node_fini(node);
+	return ERR_PTR(ret);
+}
+
 /**
  * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
  * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
@@ -554,8 +577,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
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
@@ -576,9 +599,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
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
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 0bab1fd7cc817..7417f236df5b3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -22,8 +22,7 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
-			       u32 size, u32 align, u32 mm_flags);
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt, u32 size, u32 align, xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index cb02b7994a9ac..34ef713b5245c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -69,15 +69,20 @@ struct xe_ggtt_node {
 	bool invalidate_on_remove;
 };
 
+typedef u64 (*xe_ggtt_pte_encode_bo_fn)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				     xe_ggtt_pte_encode_bo_fn pte_encode_bo,
+				     xe_ggtt_set_pte_fn set_pte, void *arg);
 /**
  * struct xe_ggtt_pt_ops - GGTT Page table operations
  * Which can vary from platform to platform.
  */
 struct xe_ggtt_pt_ops {
 	/** @pte_encode_bo: Encode PTE address for a given BO */
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo;
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	xe_ggtt_set_pte_fn ggtt_set_pte;
 };
 
 #endif
-- 
2.45.2

