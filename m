Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E09BC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 19:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31B10E125;
	Tue, 24 Jun 2025 19:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agNdNJGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CCA10E125
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750794318; x=1782330318;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vRNxbcco5VD19ED2SFw+SBII2kuxlNW+irUS5t6cymM=;
 b=agNdNJGma2AD/x3Fda1Qpq/IDZp5Gw5fxA4qVwKJouJEAR2QfYF/g3Ps
 WRaHXclERZONvtwk/KQkdXmW96oFiHg5YKKcjzp/Z0NMQ0leRtRVdI4Z6
 hQOUJ3t3TGuwyOnXdfICP/GhC4qG8czZzLjBGU48UCBpU+tSau/3Mz0Im
 4uk4n8GcO4K/Yf99wMYDOSix/7kvo7KqYWPeiAge7jqNkM/YKZLenvUTb
 ekssLhgpVKgAhyvt+nH1dN1s8S/hDOyMl4hfWnk2BWsrm7IjOoYcaCOnq
 +3/b+z10hrXFKXAVygHeuH80KY0BK9hOsH14Px+++HyEFPiWJgRx9PzIm w==;
X-CSE-ConnectionGUID: cOrZlkRVQR+ItPswa6tqGA==
X-CSE-MsgGUID: NL8grQgvRyWfVFNNxa3qOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55676293"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="55676293"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:45:17 -0700
X-CSE-ConnectionGUID: bjFtczLxQxyd71A1TkOWxg==
X-CSE-MsgGUID: nqlNPxeHRT65g/mT5jlIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152129280"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:45:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop bo->size
Date: Tue, 24 Jun 2025 12:46:54 -0700
Message-Id: <20250624194654.2787356-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

bo->size is redundant because the base GEM object already has a size
field with the same value. Drop bo->size and use the base GEM object’s
size instead. While at it, introduce xe_bo_size() to abstract the BO
size.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 19 +++++++-------
 drivers/gpu/drm/xe/xe_bo.h                 | 17 ++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h           |  2 --
 drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 14 +++++-----
 drivers/gpu/drm/xe/xe_gsc.c                |  6 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  8 +++---
 drivers/gpu/drm/xe/xe_guc.c                |  4 +--
 drivers/gpu/drm/xe/xe_guc_ads.c            |  4 +--
 drivers/gpu/drm/xe/xe_guc_ct.c             |  4 +--
 drivers/gpu/drm/xe/xe_guc_log.c            |  2 +-
 drivers/gpu/drm/xe/xe_huc.c                |  2 +-
 drivers/gpu/drm/xe/xe_lmtt.c               |  4 +--
 drivers/gpu/drm/xe/xe_lrc.c                |  4 +--
 drivers/gpu/drm/xe/xe_migrate.c            | 30 +++++++++++-----------
 drivers/gpu/drm/xe/xe_oa.c                 | 10 ++++----
 drivers/gpu/drm/xe/xe_trace_bo.h           |  4 +--
 drivers/gpu/drm/xe/xe_vm.c                 |  6 ++---
 18 files changed, 77 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..cbd9ed60b207 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -437,7 +437,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 
 	extra_pages = 0;
 	if (xe_bo_needs_ccs_pages(bo))
-		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
+		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, xe_bo_size(bo)),
 					   PAGE_SIZE);
 
 	/*
@@ -1122,7 +1122,7 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
 					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 					XE_BO_FLAG_PINNED);
@@ -1200,7 +1200,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 
 	if (!backup) {
-		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
 						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 						XE_BO_FLAG_PINNED);
@@ -1254,7 +1254,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		}
 
 		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
-				   bo->size);
+				   xe_bo_size(bo));
 	}
 
 	if (!bo->backup_obj)
@@ -1347,7 +1347,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		}
 
 		xe_map_memcpy_to(xe, &bo->vmap, 0, backup->vmap.vaddr,
-				 bo->size);
+				 xe_bo_size(bo));
 	}
 
 	bo->backup_obj = NULL;
@@ -1558,7 +1558,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 
 	vram = res_to_mem_region(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
-		     bo->size - (offset & PAGE_MASK), &cursor);
+		     xe_bo_size(bo) - (offset & PAGE_MASK), &cursor);
 
 	do {
 		unsigned long page_offset = (offset & ~PAGE_MASK);
@@ -1858,7 +1858,6 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	bo->ccs_cleared = false;
 	bo->tile = tile;
-	bo->size = size;
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
@@ -2036,7 +2035,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
-							   start + bo->size, U64_MAX);
+							   start + xe_bo_size(bo), U64_MAX);
 			} else {
 				err = xe_ggtt_insert_bo(t->mem.ggtt, bo);
 			}
@@ -2234,7 +2233,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	xe_assert(xe, !(*src)->vmap.is_iomem);
 
 	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
-					    (*src)->size, dst_flags);
+					    xe_bo_size(*src), dst_flags);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -2524,7 +2523,7 @@ int xe_bo_vmap(struct xe_bo *bo)
 	 * TODO: Fix up ttm_bo_vmap to do that, or fix up ttm_bo_kmap
 	 * to use struct iosys_map.
 	 */
-	ret = ttm_bo_kmap(&bo->ttm, 0, bo->size >> PAGE_SHIFT, &bo->kmap);
+	ret = ttm_bo_kmap(&bo->ttm, 0, xe_bo_size(bo) >> PAGE_SHIFT, &bo->kmap);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a23..bd4a8d1fb1df 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -238,6 +238,19 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 	return xe_bo_addr(bo, 0, page_size);
 }
 
+/**
+ * xe_bo_size() - Xe BO size
+ * @bo: The bo to object.
+ *
+ * Simple helper to return Xe BO's size.
+ *
+ * Return: Xe BO's size
+ */
+static inline size_t xe_bo_size(struct xe_bo *bo)
+{
+	return bo->ttm.base.size;
+}
+
 static inline u32
 __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
 {
@@ -246,7 +259,7 @@ __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
 	if (XE_WARN_ON(!ggtt_node))
 		return 0;
 
-	XE_WARN_ON(ggtt_node->base.size > bo->size);
+	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
 	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
 	return ggtt_node->base.start;
 }
@@ -300,7 +313,7 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
 
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
-	return PAGE_ALIGN(bo->ttm.base.size);
+	return PAGE_ALIGN(xe_bo_size(bo));
 }
 
 static inline bool xe_bo_has_pages(struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index eb5e83c5f233..da3c879fc8d2 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -32,8 +32,6 @@ struct xe_bo {
 	struct xe_bo *backup_obj;
 	/** @parent_obj: Ref to parent bo if this a backup_obj */
 	struct xe_bo *parent_obj;
-	/** @size: Size of this buffer object */
-	size_t size;
 	/** @flags: flags for this buffer object */
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 31f688e953d7..f931ff9b1ec0 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -167,7 +167,7 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
 static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
-	u64 sz = bo->size;
+	u64 sz = xe_bo_size(bo);
 	u32 mem_type = bo->ttm.resource->mem_type;
 
 	xe_bo_assert_held(bo);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7b11fa1356f0..65adcb07cb00 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -410,7 +410,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 		goto err;
 	}
 
-	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, ggtt->scratch->size);
+	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
 
 	xe_ggtt_initial_clear(ggtt);
 
@@ -682,13 +682,13 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		return;
 
 	start = node->base.start;
-	end = start + bo->size;
+	end = start + xe_bo_size(bo);
 
 	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
 		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
 
-		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
+		for (xe_res_first_sg(xe_bo_sg(bo), 0, xe_bo_size(bo), &cur);
 		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
 			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
 						   pte | xe_res_dma(&cur));
@@ -696,7 +696,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		/* Prepend GPU offset */
 		pte |= vram_region_gpu_offset(bo->ttm.resource);
 
-		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
+		for (xe_res_first(bo->ttm.resource, 0, xe_bo_size(bo), &cur);
 		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
 			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
 						   pte + cur.start);
@@ -732,7 +732,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	if (XE_WARN_ON(bo->ggtt_node[tile_id])) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == xe_bo_size(bo));
 		return 0;
 	}
 
@@ -751,7 +751,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  bo->size, alignment, 0, start, end, 0);
+					  xe_bo_size(bo), alignment, 0, start, end, 0);
 	if (err) {
 		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -812,7 +812,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == xe_bo_size(bo));
 
 	xe_ggtt_node_remove(bo->ggtt_node[tile_id],
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0bcf97063ff6..1d84bf2f2cef 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -59,7 +59,8 @@ static int memcpy_fw(struct xe_gsc *gsc)
 
 	xe_map_memcpy_from(xe, storage, &gsc->fw.bo->vmap, 0, fw_size);
 	xe_map_memcpy_to(xe, &gsc->private->vmap, 0, storage, fw_size);
-	xe_map_memset(xe, &gsc->private->vmap, fw_size, 0, gsc->private->size - fw_size);
+	xe_map_memset(xe, &gsc->private->vmap, fw_size, 0,
+		      xe_bo_size(gsc->private) - fw_size);
 
 	kfree(storage);
 
@@ -82,7 +83,8 @@ static int emit_gsc_upload(struct xe_gsc *gsc)
 	bb->cs[bb->len++] = GSC_FW_LOAD;
 	bb->cs[bb->len++] = lower_32_bits(offset);
 	bb->cs[bb->len++] = upper_32_bits(offset);
-	bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | GSC_FW_LOAD_LIMIT_VALID;
+	bb->cs[bb->len++] = (xe_bo_size(gsc->private) / SZ_4K) |
+		GSC_FW_LOAD_LIMIT_VALID;
 
 	job = xe_bb_create_job(gsc->q, bb);
 	if (IS_ERR(job)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..54e21ce2877a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1299,7 +1299,7 @@ static u64 pf_get_vf_config_lmem(struct xe_gt *gt, unsigned int vfid)
 	struct xe_bo *bo;
 
 	bo = config->lmem_obj;
-	return bo ? bo->size : 0;
+	return bo ? xe_bo_size(bo) : 0;
 }
 
 static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
@@ -1388,7 +1388,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 			err = xe_lmtt_populate_pages(lmtt, vfid, bo, offset);
 			if (err)
 				goto fail;
-			offset += bo->size;
+			offset += xe_bo_size(bo);
 		}
 	}
 
@@ -1469,12 +1469,12 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 			goto release;
 	}
 
-	err = pf_push_vf_cfg_lmem(gt, vfid, bo->size);
+	err = pf_push_vf_cfg_lmem(gt, vfid, xe_bo_size(bo));
 	if (unlikely(err))
 		goto reset_lmtt;
 
 	xe_gt_sriov_dbg_verbose(gt, "VF%u LMEM %zu (%zuM)\n",
-				vfid, bo->size, bo->size / SZ_1M);
+				vfid, xe_bo_size(bo), xe_bo_size(bo) / SZ_1M);
 	return 0;
 
 reset_lmtt:
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 209e5d53c290..15ade05ca169 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -59,7 +59,7 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
 	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
 	xe_assert(xe, addr < GUC_GGTT_TOP);
-	xe_assert(xe, bo->size <= GUC_GGTT_TOP - addr);
+	xe_assert(xe, xe_bo_size(bo) <= GUC_GGTT_TOP - addr);
 
 	return addr;
 }
@@ -420,7 +420,7 @@ static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 t
 	buf = base + G2G_DESC_AREA_SIZE + slot * G2G_BUFFER_SIZE;
 
 	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
-	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
+	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= xe_bo_size(g2g_bo));
 
 	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
 					      desc, buf, G2G_BUFFER_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f3c74f9a40c6..57f611b692eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -895,7 +895,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
 
 	xe_gt_assert(gt, ads->bo);
 
-	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
+	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, xe_bo_size(ads->bo));
 	guc_policies_init(ads);
 	guc_golden_lrc_init(ads);
 	guc_mapping_table_init_invalid(gt, &info_map);
@@ -919,7 +919,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 
 	xe_gt_assert(gt, ads->bo);
 
-	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
+	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, xe_bo_size(ads->bo));
 	guc_policies_init(ads);
 	fill_engine_enable_masks(gt, &info_map);
 	guc_mmio_reg_state_init(ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 37509f619503..7228b13a65c4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -443,7 +443,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
-	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
+	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
@@ -1897,7 +1897,7 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
 		return NULL;
 
 	if (ct->bo && want_ctb) {
-		snapshot->ctb_size = ct->bo->size;
+		snapshot->ctb_size = xe_bo_size(ct->bo);
 		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 38039c411387..c01ccb35dc75 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -79,7 +79,7 @@ static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *
 	 * Also, can't use vmalloc as might be called from atomic context. So need
 	 * to break the buffer up into smaller chunks that can be allocated.
 	 */
-	snapshot->size = log->bo->size;
+	snapshot->size = xe_bo_size(log->bo);
 	snapshot->num_chunks = DIV_ROUND_UP(snapshot->size, GUC_LOG_CHUNK_SIZE);
 
 	snapshot->copy = kcalloc(snapshot->num_chunks, sizeof(*snapshot->copy),
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 6a846e4cb221..7e43b2dd6a32 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -171,7 +171,7 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
 				       sizeof(struct pxp43_new_huc_auth_in));
 	wr_offset = huc_emit_pxp_auth_msg(xe, &pkt->vmap, wr_offset,
 					  xe_bo_ggtt_addr(huc->fw.bo),
-					  huc->fw.bo->size);
+					  xe_bo_size(huc->fw.bo));
 	do {
 		err = xe_gsc_pkt_submit_kernel(&gt->uc.gsc, ggtt_offset, wr_offset,
 					       ggtt_offset + PXP43_HUC_AUTH_INOUT_SIZE,
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 63db66df064b..b56437a816e4 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -386,11 +386,11 @@ static void lmtt_insert_bo(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo
 	u64 addr, vram_offset;
 
 	lmtt_assert(lmtt, IS_ALIGNED(start, page_size));
-	lmtt_assert(lmtt, IS_ALIGNED(bo->size, page_size));
+	lmtt_assert(lmtt, IS_ALIGNED(xe_bo_size(bo), page_size));
 	lmtt_assert(lmtt, xe_bo_is_vram(bo));
 
 	vram_offset = vram_region_gpu_offset(bo->ttm.resource);
-	xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
+	xe_res_first(bo->ttm.resource, 0, xe_bo_size(bo), &cur);
 	while (cur.remaining) {
 		addr = xe_res_dma(&cur);
 		addr += vram_offset; /* XXX */
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 37598588a54f..c92e7eff79f7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -975,7 +975,7 @@ struct wa_bb_setup {
 
 static size_t wa_bb_offset(struct xe_lrc *lrc)
 {
-	return lrc->bo->size - LRC_WA_BB_SIZE;
+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
 }
 
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
@@ -1859,7 +1859,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->seqno = xe_lrc_seqno(lrc);
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
+	snapshot->lrc_size = xe_bo_size(lrc->bo) - snapshot->lrc_offset -
 		LRC_WA_BB_SIZE;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..b3a76758b02d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -203,7 +203,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
-	xe_tile_assert(tile, m->batch_base_ofs + batch->size < SZ_2M);
+	xe_tile_assert(tile, m->batch_base_ofs + xe_bo_size(batch) < SZ_2M);
 
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
@@ -214,7 +214,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		return PTR_ERR(bo);
 
 	/* PT30 & PT31 reserved for 2M identity map */
-	pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
+	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
@@ -236,7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
-		for (i = 0; i < batch->size;
+		for (i = 0; i < xe_bo_size(batch);
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
 			entry = vm->pt_ops->pte_encode_bo(batch, i,
@@ -247,13 +247,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			level++;
 		}
 		if (xe->info.has_usm) {
-			xe_tile_assert(tile, batch->size == SZ_1M);
+			xe_tile_assert(tile, xe_bo_size(batch) == SZ_1M);
 
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			m->usm_batch_base_ofs = m->batch_base_ofs + SZ_1M;
-			xe_tile_assert(tile, batch->size == SZ_512K);
+			xe_tile_assert(tile, xe_bo_size(batch) == SZ_512K);
 
-			for (i = 0; i < batch->size;
+			for (i = 0; i < xe_bo_size(batch);
 			     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 			     XE_PAGE_SIZE) {
 				entry = vm->pt_ops->pte_encode_bo(batch, i,
@@ -306,7 +306,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
-		u64 pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
+		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
@@ -321,7 +321,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
 				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
-			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
+			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
 			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
@@ -768,7 +768,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
-	u64 size = src_bo->size;
+	u64 size = xe_bo_size(src_bo);
 	struct xe_res_cursor src_it, dst_it, ccs_it;
 	u64 src_L0_ofs, dst_L0_ofs;
 	u32 src_L0_pt, dst_L0_pt;
@@ -791,7 +791,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
 
-	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
+	if (src_bo != dst_bo && XE_WARN_ON(xe_bo_size(src_bo) != xe_bo_size(dst_bo)))
 		return ERR_PTR(-EINVAL);
 
 	if (!src_is_vram)
@@ -1064,7 +1064,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_only_system_ccs = false;
 	struct dma_fence *fence = NULL;
-	u64 size = bo->size;
+	u64 size = xe_bo_size(bo);
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
@@ -1076,9 +1076,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		clear_only_system_ccs = true;
 
 	if (!clear_vram)
-		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
+		xe_res_first_sg(xe_bo_sg(bo), 0, xe_bo_size(bo), &src_it);
 	else
-		xe_res_first(src, 0, bo->size, &src_it);
+		xe_res_first(src, 0, xe_bo_size(bo), &src_it);
 
 	while (size) {
 		u64 clear_L0_ofs;
@@ -1407,7 +1407,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 					if (idx == chunk)
 						goto next_cmd;
 
-					xe_tile_assert(tile, pt_bo->size == SZ_4K);
+					xe_tile_assert(tile, xe_bo_size(pt_bo) == SZ_4K);
 
 					/* Map a PT at most once */
 					if (pt_bo->update_index < 0)
@@ -1866,7 +1866,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	if (IS_ERR(dma_addr))
 		return PTR_ERR(dma_addr);
 
-	xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
+	xe_res_first(bo->ttm.resource, offset, xe_bo_size(bo) - offset, &cursor);
 
 	do {
 		struct dma_fence *__fence;
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4829ed46a8b4..a3379d39f76d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -403,7 +403,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	int size_exponent = __ffs(stream->oa_buffer.bo->size);
+	int size_exponent = __ffs(xe_bo_size(stream->oa_buffer.bo));
 	u32 oa_buf = gtt_offset | OAG_OABUFFER_MEMORY_SELECT;
 	struct xe_mmio *mmio = &stream->gt->mmio;
 	unsigned long flags;
@@ -435,7 +435,7 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
-	memset(stream->oa_buffer.vaddr, 0, stream->oa_buffer.bo->size);
+	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
 }
 
 static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
@@ -1065,7 +1065,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 static u32 oag_buf_size_select(const struct xe_oa_stream *stream)
 {
 	return _MASKED_FIELD(OAG_OA_DEBUG_BUF_SIZE_SELECT,
-			     stream->oa_buffer.bo->size > SZ_16M ?
+			     xe_bo_size(stream->oa_buffer.bo) > SZ_16M ?
 			     OAG_OA_DEBUG_BUF_SIZE_SELECT : 0);
 }
 
@@ -1582,7 +1582,7 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 
 static long xe_oa_info_locked(struct xe_oa_stream *stream, unsigned long arg)
 {
-	struct drm_xe_oa_stream_info info = { .oa_buf_size = stream->oa_buffer.bo->size, };
+	struct drm_xe_oa_stream_info info = { .oa_buf_size = xe_bo_size(stream->oa_buffer.bo), };
 	void __user *uaddr = (void __user *)arg;
 
 	if (copy_to_user(uaddr, &info, sizeof(info)))
@@ -1668,7 +1668,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
-	if (vma->vm_end - vma->vm_start != stream->oa_buffer.bo->size) {
+	if (vma->vm_end - vma->vm_start != xe_bo_size(stream->oa_buffer.bo)) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index ccebd5f0878e..86323cf3be2c 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -33,7 +33,7 @@ DECLARE_EVENT_CLASS(xe_bo,
 
 		    TP_fast_assign(
 			   __assign_str(dev);
-			   __entry->size = bo->size;
+			   __entry->size = xe_bo_size(bo);
 			   __entry->flags = bo->flags;
 			   __entry->vm = bo->vm;
 			   ),
@@ -73,7 +73,7 @@ TRACE_EVENT(xe_bo_move,
 
 	    TP_fast_assign(
 		   __entry->bo      = bo;
-		   __entry->size = bo->size;
+		   __entry->size = xe_bo_size(bo);
 		   __assign_str(new_placement_name);
 		   __assign_str(old_placement_name);
 		   __assign_str(device_id);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04d1a43b81e3..32c3d266a954 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3466,9 +3466,9 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 {
 	u16 coh_mode;
 
-	if (XE_IOCTL_DBG(xe, range > bo->size) ||
+	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
-			 bo->size - range)) {
+			 xe_bo_size(bo) - range)) {
 		return -EINVAL;
 	}
 
@@ -3771,7 +3771,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
+	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
 				       vm->xe->pat.idx[cache_lvl]);
 	if (IS_ERR(ops)) {
-- 
2.34.1

