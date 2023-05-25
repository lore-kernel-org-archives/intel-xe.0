Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF634C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB54E10E749;
	Thu, 25 May 2023 19:43:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73F610E741
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685043824; x=1716579824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BILWlqIHpjw838Nw274bVySGipD28N5CWcx2SDBui7Y=;
 b=MECXDe1vnCULtWxoTRAyYsufvWltSiSgMDaCyeIdMawIP6r+FbQvoljT
 Jf9mMVYT7i/f/O3Hv9BMnFWCtQQHElGDDvMjJzicl6QVG287QEwcXJHQY
 szezm+SrZexGijgxihMJZdzUpOyS/9OmVmqd3wtlfYi6GFT2GdOTNeb+L
 W1OoWpP9WVV14T788c5U+IP/fDJvCNv/L4JzKWc1DaUByJB7igyZ21syi
 gM0epmMt91fWogxN9YikSFzrcUDEZNPT0BVCOPSIneB+frhgf+t5QuBEZ
 gEJIlAk8HrAcPFqimPzxCwNsM+HienazdLQOgufhz4umHlwAdkYhID6k+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351514353"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="351514353"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774799893"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="774799893"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:43 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 15:43:26 -0400
Message-Id: <20230525194326.1648781-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
References: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Rename GPU offset helper to reflect
 true usage
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The _io_offset helper function is returning an offset into the GPU
address space.  Using the CPU address offset (io_) is not correct.

Rename to reflect usage.
Update to use GPU offset information.
Update PT dma_offset to use the helper

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 8 ++++----
 drivers/gpu/drm/xe/xe_bo.h      | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 drivers/gpu/drm/xe/xe_pt.c      | 5 +----
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..ab2307d0744a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1335,7 +1335,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
  */
-uint64_t vram_region_io_offset(struct ttm_resource *res)
+uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct xe_gt *gt = mem_type_to_gt(xe, res->mem_type);
@@ -1343,7 +1343,7 @@ uint64_t vram_region_io_offset(struct ttm_resource *res)
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return gt->mem.vram.io_start - xe->mem.vram.io_start;
+	return xe->mem.vram.base + gt->mem.vram.base;
 }
 
 /**
@@ -1427,7 +1427,7 @@ int xe_bo_pin(struct xe_bo *bo)
 			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
-				       vram_region_io_offset(bo->ttm.resource)) >> PAGE_SHIFT;
+				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 
 			spin_lock(&xe->pinned.lock);
@@ -1574,7 +1574,7 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
 
 		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
 			     page_size, &cur);
-		return cur.start + offset + vram_region_io_offset(bo->ttm.resource);
+		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..65680c312893 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -226,7 +226,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
-uint64_t vram_region_io_offset(struct ttm_resource *res);
+uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..d8401793dd0b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -419,7 +419,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	} else {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_io_offset(res));
+					      vram_region_gpu_offset(res));
 		cmds += cmd_size;
 	}
 
@@ -469,7 +469,7 @@ static void emit_pte(struct xe_migrate *m,
 					addr |= XE_PTE_PS64;
 				}
 
-				addr += vram_region_io_offset(bo->ttm.resource);
+				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_LM;
 			}
 			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f15282996c3b..bac3ce3688de 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -758,13 +758,10 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	int ret;
 
 	if (is_vram) {
-		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
-
 		xe_walk.default_pte = XE_PPGTT_PTE_LM;
 		if (vma && vma->use_atomic_access_pte_bit)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
-		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
-			gt_to_xe(gt)->mem.vram.io_start;
+		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
 		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
-- 
2.39.2

