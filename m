Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD29C369A3
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEAC10E45C;
	Mon,  7 Apr 2025 13:05:09 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852F10E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 13:05:08 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI 13/14] drm/xe: Allow for optimization of xe_ggtt_map_bo
Date: Mon,  7 Apr 2025 15:04:48 +0200
Message-ID: <20250407130449.1010470-14-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c          | 74 ++++++++++++++++++---------
 2 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d6770ed4126c1..772b6db3784d9 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -9,6 +9,7 @@
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
+#include "xe_ggtt.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c7b6369a88a9e..1f46d299b5149 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -26,6 +26,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
@@ -607,6 +608,25 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 	return drm_mm_node_allocated(&node->base);
 }
 
+struct xe_ggtt_cb_data {
+	struct xe_res_cursor cur;
+	u64 pte_flags;
+	bool sysmem;
+};
+
+static void xe_ggtt_map_bo_cb(void *args, u32 ggtt_offset, u32 local_offset, u64 *ptes, u32 num_ptes)
+{
+	struct xe_ggtt_cb_data *data = args;
+
+	while (num_ptes--) {
+		u64 addr = data->sysmem ? xe_res_dma(&data->cur) : data->cur.start;
+
+		*ptes++ = data->pte_flags + addr;
+
+		xe_res_next(&data->cur, XE_PAGE_SIZE);
+	}
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -615,39 +635,43 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
  * @pat_index: Which pat_index to use.
  */
 static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			   struct xe_bo *bo, u16 pat_index)
+			   struct xe_bo *bo, u16 pat_index, bool allow_accel)
 {
-	u64 start, pte;
-	struct xe_res_cursor cur;
+	struct xe_ggtt_cb_data data;
+	struct dma_fence *fence = NULL;
 
 	if (XE_WARN_ON(!node))
 		return;
 
-	start = node->base.start;
-
-	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
-	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
+	data.pte_flags = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+	data.sysmem = !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo);
+	if (data.sysmem) {
 		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
 
-		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
-		     cur.remaining;
-		     xe_res_next(&cur, XE_PAGE_SIZE)) {
-			u64 addr = xe_res_dma(&cur);
-
-			ggtt->pt_ops->ggtt_set_pte(ggtt, start + cur.start, addr | pte);
-		}
+		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &data.cur);
 	} else {
-		u64 end = start + bo->size;
-
 		/* Prepend GPU offset */
-		pte |= vram_region_gpu_offset(bo->ttm.resource);
+		data.pte_flags |= vram_region_gpu_offset(bo->ttm.resource);
+
+		xe_res_first(bo->ttm.resource, 0, bo->size, &data.cur);
+	}
+
+	if (allow_accel && node->base.size >= SZ_4K && ggtt->tile->migrate)
+		fence = xe_migrate_update_gtt(ggtt->tile->migrate, xe_ggtt_map_bo_cb, &data,
+					      node->base.start,
+					      node->base.size / XE_PAGE_SIZE);
+
+	if (!IS_ERR_OR_NULL(fence)) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	} else {
+		/* Eat error, force map */
 
-		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
-		     cur.remaining;
-		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+		for (u32 local_offset = 0; local_offset < node->base.size; local_offset += XE_PAGE_SIZE) {
+			u64 pte;
+			xe_ggtt_map_bo_cb(&data, node->base.start, local_offset, &pte, 1);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
-						   pte + cur.start);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, node->base.start + local_offset, pte);
 		}
 	}
 }
@@ -665,7 +689,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
 
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
+	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index, false);
 	mutex_unlock(&ggtt->lock);
 }
 
@@ -709,7 +733,7 @@ struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
 		u64 pte_flags = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 		transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_pte, arg);
 	} else {
-		xe_ggtt_map_bo(ggtt, node, bo, pat_index);
+		xe_ggtt_map_bo(ggtt, node, bo, pat_index, true);
 	}
 
 
@@ -762,7 +786,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
 
-		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
+		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index, false);
 	}
 	mutex_unlock(&ggtt->lock);
 
-- 
2.45.2

