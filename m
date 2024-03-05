Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7301FC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33634112AC0;
	Tue,  5 Mar 2024 13:12:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A00112ABD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 13:12:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 4/4] drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
Date: Tue,  5 Mar 2024 14:12:50 +0100
Message-ID: <20240305131250.5330-5-maarten.lankhorst@linux.intel.com>
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

Considering the caller of the GGTT functions should keep the
backing storage alive before the function completes, it's not
necessary to invalidate with the GGTT lock held. This just adds
latency for every user of the GGTT.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
 drivers/gpu/drm/xe/xe_bo_evict.c       | 5 +++++
 drivers/gpu/drm/xe/xe_ggtt.c           | 7 +++----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 95595d2cf1dc..79501efd6871 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -205,7 +205,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 
 	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
-		goto out_unlock;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -243,9 +242,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(ggtt, true);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
+	xe_ggtt_invalidate(ggtt, true);
 out:
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7a264a9ca06e..134be2abdf65 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -122,8 +122,10 @@ int xe_bo_evict_all(struct xe_device *xe)
  */
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_bo *bo;
 	int ret;
+	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
@@ -167,6 +169,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 	}
 	spin_unlock(&xe->pinned.lock);
 
+	/* XXX: Need invalidation so soon after resume? */
+	for_each_tile(tile, xe, id)
+		xe_ggtt_invalidate(tile->mem.ggtt, false);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index bda5055a2a18..56bc20586127 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -391,8 +391,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
-
-	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -421,6 +419,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
+
+	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -445,10 +445,9 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool di
 	xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
+	mutex_unlock(&ggtt->lock);
 
 	xe_ggtt_invalidate(ggtt, display);
-
-	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
-- 
2.43.0

