Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C43010E674;
	Wed,  6 Dec 2023 04:23:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FCB10E67A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701836634; x=1733372634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yhMYbGPSuI8oGo7Y5Dja0bkTxVNlOluSo0eahyE9nbY=;
 b=O1ReT4Rw/zXhDMcDkf8zXD/Sgrdji5ROIucvUWjtsBqWlYRDLglg6kME
 CXH3JBPXPQkoNhydjcVHgsgobXH4uzdGZHGzHWgWy75Gyxc2n81kYtzsE
 KNXpO+XN+Ky6pbwB55uoiUUzQFnBuQhDSYa9X8gySBa/arXbKLCHo02kP
 HAtZzgFjKoH/JQT8RUDNqkh1zQuPrw0VVJIWu0FIa0Dpk7rOvGzCZ7hY+
 34YnMRjmXKfvuvfdKgb7mqbqjGCdESJxmxqfZNBIrEn5gLqwaZLKl9i0M
 JTTZ7i97SR8p8hs/+dnYvaJQNeF23jhsWzSA3LLEvPFLCF39XA7BsFXH0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458326777"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="458326777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="12556336"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 20:23:53 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 10:01:24 +0530
Message-Id: <20231206043126.984049-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 7/9] drm/xe/xe2: Handle flat ccs move for igfx.
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

- Clear flat ccs during user bo creation.
- copy ccs meta data between flat ccs and bo during eviction and
restore.
- Add a bool field ccs_cleared in bo, true means ccs region of bo is
already cleared.

v2:
 - Rebase.
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++-----
 drivers/gpu/drm/xe/xe_bo_types.h |  4 +++
 drivers/gpu/drm/xe/xe_migrate.c  | 60 ++++++++++++++++++--------------
 3 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 81630838d769..e9b6c67b2523 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -647,10 +647,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool move_lacks_source;
 	bool tt_has_data;
 	bool needs_clear;
+	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
+				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
 	int ret = 0;
-
-	/* Bo creation path, moving to system or TT. No clearing required. */
-	if (!old_mem && ttm) {
+	/* Bo creation path, moving to system or TT. */
+	if (((old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT) ||
+	     (!old_mem && ttm)) && !handle_system_ccs) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		return 0;
 	}
@@ -665,14 +667,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
 			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
 
-	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
+	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
+						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
-	if ((move_lacks_source && !needs_clear) ||
-	    (old_mem_type == XE_PL_SYSTEM &&
-	     new_mem->mem_type == XE_PL_TT)) {
+	if ((move_lacks_source && !needs_clear)) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
 	}
@@ -703,8 +704,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			ret = timeout;
 			goto out;
 		}
-		ttm_bo_move_null(ttm_bo, new_mem);
-		goto out;
+
+		if (!handle_system_ccs) {
+			ttm_bo_move_null(ttm_bo, new_mem);
+			goto out;
+		}
 	}
 
 	if (!move_lacks_source &&
@@ -725,6 +729,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
 	else if (mem_type_is_vram(old_mem_type))
 		migrate = mem_type_to_migrate(xe, old_mem_type);
+	else
+		migrate = xe->tiles[0].migrate;
 
 	xe_assert(xe, migrate);
 
@@ -1254,6 +1260,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 			return bo;
 	}
 
+	bo->ccs_cleared = false;
 	bo->tile = tile;
 	bo->size = size;
 	bo->flags = flags;
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f71dbc518958..64c2249a4e40 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -79,6 +79,10 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
+
+	/** @ccs_cleared */
+	bool ccs_cleared;
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects.
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1bfb249680f4..ae11701408a9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -567,14 +567,14 @@ static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
 
 static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 			       struct xe_bb *bb,
-			       u64 src_ofs, bool src_is_vram,
-			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
+			       u64 src_ofs, bool src_is_indirect,
+			       u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
 			       u64 ccs_ofs, bool copy_ccs)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
+	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -583,28 +583,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * Otherwise if the bo doesn't have any CCS metadata attached,
 		 * we still need to clear it for security reasons.
 		 */
-		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
+		u64 ccs_src_ofs =  src_is_indirect ? src_ofs : m->cleared_mem_ofs;
 
 		emit_copy_ccs(gt, bb,
 			      dst_ofs, true,
-			      ccs_src_ofs, src_is_vram, dst_size);
+			      ccs_src_ofs, src_is_indirect, dst_size);
 
 		flush_flags = MI_FLUSH_DW_CCS;
 	} else if (copy_ccs) {
-		if (!src_is_vram)
+		if (!src_is_indirect)
 			src_ofs = ccs_ofs;
-		else if (!dst_is_vram)
+		else if (!dst_is_indirect)
 			dst_ofs = ccs_ofs;
 
-		/*
-		 * At the moment, we don't support copying CCS metadata from
-		 * system to system.
-		 */
-		xe_gt_assert(gt, src_is_vram || dst_is_vram);
+		xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
 
-		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
-			      src_is_vram, dst_size);
-		if (dst_is_vram)
+		emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
+			      src_is_indirect, dst_size);
+		if (dst_is_indirect)
 			flush_flags = MI_FLUSH_DW_CCS;
 	}
 
@@ -645,6 +641,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	u64 src_L0, dst_L0;
 	int pass = 0;
 	int err;
+	bool src_is_pltt = src->mem_type == XE_PL_TT;
+	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
 	bool src_is_vram = mem_type_is_vram(src->mem_type);
 	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
@@ -720,8 +718,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		/* Add copy commands size here */
-		batch_size += EMIT_COPY_DW +
-			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
+		batch_size += ((!src_is_vram && !dst_is_vram) ? 0 : EMIT_COPY_DW) +
+			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -747,10 +745,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
-			  XE_PAGE_SIZE);
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_vram,
-						  dst_L0_ofs, dst_is_vram,
+		if (src_is_vram || dst_is_vram)
+			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
+
+		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
+						  dst_L0_ofs,
+						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
 						  src_L0, ccs_ofs, copy_ccs);
 
 		mutex_lock(&m->job_mutex);
@@ -923,6 +924,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
+	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
@@ -963,9 +965,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					emit_clear_cmd_len(gt), 0,
+					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
-		if (xe_device_has_flat_ccs(xe) && clear_vram)
+
+		if (xe_bo_needs_ccs_pages(bo))
 			batch_size += EMIT_COPY_CCS_DW;
 
 		/* Clear commands */
@@ -980,7 +983,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		size -= clear_L0;
-
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
@@ -991,9 +993,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
-			   clear_vram);
-		if (xe_device_has_flat_ccs(xe) && clear_vram) {
+		if (!clear_system_ccs)
+			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
+
+		if (xe_bo_needs_ccs_pages(bo)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
@@ -1050,6 +1053,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
+	if (clear_system_ccs)
+		bo->ccs_cleared = true;
+
 	return fence;
 }
 
-- 
2.25.1

