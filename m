Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B023BC77B60
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 17:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6A10E1DE;
	Fri, 31 Mar 2023 17:10:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD010E15D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680282605; x=1711818605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycgw20BgNIDcmZ3UA51tFwQtHFCJlUQ04Kp7gTOFKP0=;
 b=EFQKMyvPbe6xl4xGHJucc1/URBW/2YvNCVArTA8BCqIc4c9aF5rTCHs2
 t59SZkD6KJ6pcZS6u5vB31bkQTPTbBIxZIcCuKq55HMbttDsfsM7/KmAI
 nwaw5zOe2MQD8MhrJV1UlHc2rZtSQifIL9BDZ6Ob+JVtvz8yDLUyCcY81
 86otPWkUO5SRMr2MC4t92rakXoJEmBHGVFSNPY4jlQfLJw0Vu7FTJ7kXl
 PVFRuc4oJJHUlXXWDKbaOzGF3a+MDz/vh63NVJaIPH35gS6TsJIct+XGo
 7tI06ZKUQMsM2Ao8NHwo40MTYLTYwKV1CU2vrNDlt2WsCm2AByGQeGkKf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325490230"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325490230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809106397"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809106397"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 10:09:25 -0700
Message-Id: <20230331170925.10883-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
References: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Use proper vram offset
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate functions, use proper vram io offset of the
tiles while calculating addresses.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_bo.h      |  1 +
 drivers/gpu/drm/xe/xe_migrate.c | 13 ++++++++-----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..5460e6fe3c1f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1207,12 +1207,12 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
  */
-static uint64_t vram_region_io_offset(struct xe_bo *bo)
+uint64_t vram_region_io_offset(struct ttm_resource *res)
 {
-	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_gt *gt = mem_type_to_gt(xe, bo->ttm.resource->mem_type);
+	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
+	struct xe_gt *gt = mem_type_to_gt(xe, res->mem_type);
 
-	if (bo->ttm.resource->mem_type == XE_PL_STOLEN)
+	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
 	return gt->mem.vram.io_start - xe->mem.vram.io_start;
@@ -1299,7 +1299,7 @@ int xe_bo_pin(struct xe_bo *bo)
 			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
-				       vram_region_io_offset(bo)) >> PAGE_SHIFT;
+				       vram_region_io_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 
 			spin_lock(&xe->pinned.lock);
@@ -1443,7 +1443,7 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 
 		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
 			     page_size, &cur);
-		return cur.start + offset + vram_region_io_offset(bo);
+		return cur.start + offset + vram_region_io_offset(bo->ttm.resource);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9b26049521de..8f5a7ad10d09 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -223,6 +223,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
+uint64_t vram_region_io_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index deb4233b94fa..e8978440c725 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -392,6 +392,7 @@ static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
 
 static u32 pte_update_size(struct xe_migrate *m,
 			   bool is_vram,
+			   struct ttm_resource *res,
 			   struct xe_res_cursor *cur,
 			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
 			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
@@ -417,7 +418,8 @@ static u32 pte_update_size(struct xe_migrate *m,
 		cmds += cmd_size;
 	} else {
 		/* Offset into identity map. */
-		*L0_ofs = xe_migrate_vram_ofs(cur->start);
+		*L0_ofs = xe_migrate_vram_ofs(cur->start +
+					      vram_region_io_offset(res));
 		cmds += cmd_size;
 	}
 
@@ -467,6 +469,7 @@ static void emit_pte(struct xe_migrate *m,
 					addr |= GEN12_PTE_PS64;
 				}
 
+				addr += vram_region_io_offset(bo->ttm.resource);
 				addr |= GEN12_PPGTT_PTE_LM;
 			}
 			addr |= PPAT_CACHED | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
@@ -646,17 +649,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, &src_it, &src_L0,
+		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      NUM_PT_PER_BLIT);
 
-		batch_size += pte_update_size(m, dst_is_vram, &dst_it, &src_L0,
+		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
 					      &dst_L0_ofs, &dst_L0_pt, 0,
 					      NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
 
 		if (copy_system_ccs) {
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
-			batch_size += pte_update_size(m, false, &ccs_it, &ccs_size,
+			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * NUM_PT_PER_BLIT,
 						      NUM_PT_PER_BLIT);
@@ -879,7 +882,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Calculate final sizes and batch size.. */
 		batch_size = 2 +
-			pte_update_size(m, clear_vram, &src_it,
+			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					emit_clear_cmd_len(xe), 0,
 					NUM_PT_PER_BLIT);
-- 
2.21.0.rc0.32.g243a4c7e27

