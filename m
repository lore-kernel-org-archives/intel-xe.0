Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA424C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF910E1AA;
	Wed, 26 Mar 2025 18:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa0YFoR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B592510E76C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013173; x=1774549173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+yu+zdA1/2wrQY20jQal6P3cNONcxhHBLb7xh3T0YkU=;
 b=Sa0YFoR9Z1TLOJoZFnTDOrWwc7+j3AdACU/RwZLRNEYEV7siyNfHRUX0
 hiHtq80mgWRNWZZwh4bHH8tdfudXSfACfq2l6E5R9KDxN1shyesarUjse
 NISVj04dYFQqmU3yXF9Df9FuLMBMD5e9loO+J1sxxDV00AKbnIf5e3I8A
 XhuGFMFkZvjK5i3Xgwm3Dhn03+zzotadfGKiZriJBITUgEVKwaZqYw3Dd
 Nu1/D9noeTaCdSY2y0s3BgpFwIXWrY2rSFm0SuxPgA4TlazQgSNBozmPL
 5v/IjXF4FECLxlt4nr8R2NN3hJXNNVCnvUVYYDIaTnodGvHxeHni5OzfA A==;
X-CSE-ConnectionGUID: fNAHuZRnT5OpPUxv7UoqSg==
X-CSE-MsgGUID: KKpRvNcHTye73IaJvdNvlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213586"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:33 -0700
X-CSE-ConnectionGUID: zWsaJXTsTL6VvQt/k+6Ciw==
X-CSE-MsgGUID: DzDwYJZhSW+we99nJQn6pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383312"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/7] drm/xe: use backup object for pinned save/restore
Date: Wed, 26 Mar 2025 18:19:10 +0000
Message-ID: <20250326181908.124082-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326181908.124082-9-matthew.auld@intel.com>
References: <20250326181908.124082-9-matthew.auld@intel.com>
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

Currently we move pinned objects, relying on the fact that the lpfn/fpfn
will force the placement to occupy the same pages when restoring.
However this then limits all such pinned objects to be contig
underneath. In addition it is likely a little fragile moving pinned
objects in the first place. Rather than moving such objects rather copy
the page contents to a secondary system memory object, that way the VRAM
pages never move and remain pinned. This also opens the door for
eventually having non-contig pinned objects that can also be
saved/restored using blitter.

v2:
 - Make sure to drop the fence ref.
 - Handle NULL bo->migrate.
v3:
 - Ensure we add the copy fence to the BOs, otherwise backup_obj can
   be freed before pipelined copy finishes.
v4:
  - Rebase on newly added apply-to-pinned infra.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1182
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 339 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_bo_evict.c |   2 -
 drivers/gpu/drm/xe/xe_bo_types.h |   2 +
 3 files changed, 179 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 64f9c936eea0..362f08f8e743 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -898,79 +898,44 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_pm_runtime_get_noresume(xe);
 	}
 
-	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
-		/*
-		 * Kernel memory that is pinned should only be moved on suspend
-		 * / resume, some of the pinned memory is required for the
-		 * device to resume / use the GPU to move other evicted memory
-		 * (user memory) around. This likely could be optimized a bit
-		 * further where we find the minimum set of pinned memory
-		 * required for resume but for simplity doing a memcpy for all
-		 * pinned memory.
-		 */
-		ret = xe_bo_vmap(bo);
-		if (!ret) {
-			ret = ttm_bo_move_memcpy(ttm_bo, ctx, new_mem);
+	if (move_lacks_source) {
+		u32 flags = 0;
 
-			/* Create a new VMAP once kernel BO back in VRAM */
-			if (!ret && resource_is_vram(new_mem)) {
-				struct xe_vram_region *vram = res_to_mem_region(new_mem);
-				void __iomem *new_addr = vram->mapping +
-					(new_mem->start << PAGE_SHIFT);
+		if (mem_type_is_vram(new_mem->mem_type))
+			flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
+		else if (handle_system_ccs)
+			flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
 
-				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
-					ret = -EINVAL;
-					xe_pm_runtime_put(xe);
-					goto out;
-				}
-
-				xe_assert(xe, new_mem->start ==
-					  bo->placements->fpfn);
-
-				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
-			}
+		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
+	} else {
+		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
+					handle_system_ccs);
+	}
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
+		xe_pm_runtime_put(xe);
+		goto out;
+	}
+	if (!move_lacks_source) {
+		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
+						new_mem);
+		if (ret) {
+			dma_fence_wait(fence, false);
+			ttm_bo_move_null(ttm_bo, new_mem);
+			ret = 0;
 		}
 	} else {
-		if (move_lacks_source) {
-			u32 flags = 0;
-
-			if (mem_type_is_vram(new_mem->mem_type))
-				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
-			else if (handle_system_ccs)
-				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
-
-			fence = xe_migrate_clear(migrate, bo, new_mem, flags);
-		}
-		else
-			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
-						new_mem, handle_system_ccs);
-		if (IS_ERR(fence)) {
-			ret = PTR_ERR(fence);
-			xe_pm_runtime_put(xe);
-			goto out;
-		}
-		if (!move_lacks_source) {
-			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
-							true, new_mem);
-			if (ret) {
-				dma_fence_wait(fence, false);
-				ttm_bo_move_null(ttm_bo, new_mem);
-				ret = 0;
-			}
-		} else {
-			/*
-			 * ttm_bo_move_accel_cleanup() may blow up if
-			 * bo->resource == NULL, so just attach the
-			 * fence and set the new resource.
-			 */
-			dma_resv_add_fence(ttm_bo->base.resv, fence,
-					   DMA_RESV_USAGE_KERNEL);
-			ttm_bo_move_null(ttm_bo, new_mem);
-		}
-
-		dma_fence_put(fence);
+		/*
+		 * ttm_bo_move_accel_cleanup() may blow up if
+		 * bo->resource == NULL, so just attach the
+		 * fence and set the new resource.
+		 */
+		dma_resv_add_fence(ttm_bo->base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
+		ttm_bo_move_null(ttm_bo, new_mem);
 	}
 
+	dma_fence_put(fence);
 	xe_pm_runtime_put(xe);
 
 out:
@@ -1107,59 +1072,90 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
  */
 int xe_bo_evict_pinned(struct xe_bo *bo)
 {
-	struct ttm_place place = {
-		.mem_type = XE_PL_TT,
-	};
-	struct ttm_placement placement = {
-		.placement = &place,
-		.num_placement = 1,
-	};
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.gfp_retry_mayfail = true,
-	};
-	struct ttm_resource *new_mem;
-	int ret;
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct xe_bo *backup;
+	bool unmap = false;
+	int ret = 0;
 
-	xe_bo_assert_held(bo);
+	xe_bo_lock(bo, false);
 
-	if (WARN_ON(!bo->ttm.resource))
-		return -EINVAL;
-
-	if (WARN_ON(!xe_bo_is_pinned(bo)))
-		return -EINVAL;
-
-	if (!xe_bo_is_vram(bo))
-		return 0;
-
-	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
-	if (ret)
-		return ret;
-
-	if (!bo->ttm.ttm) {
-		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
-		if (!bo->ttm.ttm) {
-			ret = -ENOMEM;
-			goto err_res_free;
-		}
+	if (WARN_ON(!bo->ttm.resource)) {
+		ret = -EINVAL;
+		goto out_unlock_bo;
 	}
 
-	ret = ttm_bo_populate(&bo->ttm, &ctx);
+	if (WARN_ON(!xe_bo_is_pinned(bo))) {
+		ret = -EINVAL;
+		goto out_unlock_bo;
+	}
+
+	if (!xe_bo_is_vram(bo))
+		goto out_unlock_bo;
+
+	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
+				     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				     XE_BO_FLAG_PINNED);
+	if (IS_ERR(backup)) {
+		ret = PTR_ERR(backup);
+		goto out_unlock_bo;
+	}
+
+	if (xe_bo_is_user(bo)) {
+		struct xe_migrate *migrate;
+		struct dma_fence *fence;
+
+		if (bo->tile)
+			migrate = bo->tile->migrate;
+		else
+			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
+
+		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+		if (ret)
+			goto out_backup;
+
+		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
+		if (ret)
+			goto out_backup;
+
+		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
+					backup->ttm.resource, false);
+		if (IS_ERR(fence)) {
+			ret = PTR_ERR(fence);
+			goto out_backup;
+		}
+
+		dma_resv_add_fence(bo->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
+		dma_resv_add_fence(backup->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
+		dma_fence_put(fence);
+	} else {
+		ret = xe_bo_vmap(backup);
+		if (ret)
+			goto out_backup;
+
+		if (iosys_map_is_null(&bo->vmap)) {
+			ret = xe_bo_vmap(bo);
+			if (ret)
+				goto out_backup;
+			unmap = true;
+		}
+
+		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
+				   bo->size);
+	}
+
+	bo->backup_obj = backup;
+
+out_backup:
+	xe_bo_vunmap(backup);
+	xe_bo_unlock(backup);
 	if (ret)
-		goto err_res_free;
-
-	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
-	if (ret)
-		goto err_res_free;
-
-	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
-	if (ret)
-		goto err_res_free;
-
-	return 0;
-
-err_res_free:
-	ttm_resource_free(&bo->ttm, &new_mem);
+		xe_bo_put(backup);
+out_unlock_bo:
+	if (unmap)
+		xe_bo_vunmap(bo);
+	xe_bo_unlock(bo);
 	return ret;
 }
 
@@ -1180,47 +1176,82 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		.interruptible = false,
 		.gfp_retry_mayfail = false,
 	};
-	struct ttm_resource *new_mem;
-	struct ttm_place *place = &bo->placements[0];
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct xe_bo *backup = bo->backup_obj;
+	bool unmap = false;
 	int ret;
 
-	xe_bo_assert_held(bo);
-
-	if (WARN_ON(!bo->ttm.resource))
-		return -EINVAL;
-
-	if (WARN_ON(!xe_bo_is_pinned(bo)))
-		return -EINVAL;
-
-	if (WARN_ON(xe_bo_is_vram(bo)))
-		return -EINVAL;
-
-	if (WARN_ON(!bo->ttm.ttm && !xe_bo_is_stolen(bo)))
-		return -EINVAL;
-
-	if (!mem_type_is_vram(place->mem_type))
+	if (!backup)
 		return 0;
 
-	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
+	xe_bo_lock(backup, false);
+
+	ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
 	if (ret)
-		return ret;
+		goto out_backup;
 
-	ret = ttm_bo_populate(&bo->ttm, &ctx);
-	if (ret)
-		goto err_res_free;
+	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
+		ret = -EBUSY;
+		goto out_backup;
+	}
 
-	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
-	if (ret)
-		goto err_res_free;
+	if (xe_bo_is_user(bo)) {
+		struct xe_migrate *migrate;
+		struct dma_fence *fence;
 
-	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
-	if (ret)
-		goto err_res_free;
+		if (bo->tile)
+			migrate = bo->tile->migrate;
+		else
+			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
-	return 0;
+		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+		if (ret)
+			goto out_unlock_bo;
 
-err_res_free:
-	ttm_resource_free(&bo->ttm, &new_mem);
+		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
+		if (ret)
+			goto out_unlock_bo;
+
+		fence = xe_migrate_copy(migrate, backup, bo,
+					backup->ttm.resource, bo->ttm.resource,
+					false);
+		if (IS_ERR(fence)) {
+			ret = PTR_ERR(fence);
+			goto out_unlock_bo;
+		}
+
+		dma_resv_add_fence(bo->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
+		dma_resv_add_fence(backup->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
+		dma_fence_put(fence);
+	} else {
+		ret = xe_bo_vmap(backup);
+		if (ret)
+			goto out_unlock_bo;
+
+		if (iosys_map_is_null(&bo->vmap)) {
+			ret = xe_bo_vmap(bo);
+			if (ret)
+				goto out_unlock_bo;
+			unmap = true;
+		}
+
+		xe_map_memcpy_to(xe, &bo->vmap, 0, backup->vmap.vaddr,
+				 bo->size);
+	}
+
+	bo->backup_obj = NULL;
+
+out_unlock_bo:
+	if (unmap)
+		xe_bo_vunmap(bo);
+	xe_bo_unlock(bo);
+out_backup:
+	xe_bo_vunmap(backup);
+	xe_bo_unlock(backup);
+	if (!bo->backup_obj)
+		xe_bo_put(backup);
 	return ret;
 }
 
@@ -2149,22 +2180,6 @@ int xe_bo_pin(struct xe_bo *bo)
 	if (err)
 		return err;
 
-	/*
-	 * For pinned objects in on DGFX, which are also in vram, we expect
-	 * these to be in contiguous VRAM memory. Required eviction / restore
-	 * during suspend / resume (force restore to same physical address).
-	 */
-	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
-	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
-		if (mem_type_is_vram(place->mem_type)) {
-			xe_assert(xe, place->flags & TTM_PL_FLAG_CONTIGUOUS);
-
-			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
-				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
-			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
-		}
-	}
-
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
 		spin_lock(&xe->pinned.lock);
 		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 1eeb3910450b..6e6a5d7a5617 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -31,14 +31,12 @@ static int xe_bo_apply_to_pinned(struct xe_device *xe,
 		list_move_tail(&bo->pinned_link, &still_in_list);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, false);
 		ret = pinned_fn(bo);
 		if (ret && pinned_list != new_list) {
 			spin_lock(&xe->pinned.lock);
 			list_move(&bo->pinned_link, pinned_list);
 			spin_unlock(&xe->pinned.lock);
 		}
-		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		spin_lock(&xe->pinned.lock);
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 15a92e3d4898..81396181aaea 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -28,6 +28,8 @@ struct xe_vm;
 struct xe_bo {
 	/** @ttm: TTM base buffer object */
 	struct ttm_buffer_object ttm;
+	/** @backup_obj: The backup object when pinned and suspended (vram only) */
+	struct xe_bo *backup_obj;
 	/** @size: Size of this buffer object */
 	size_t size;
 	/** @flags: flags for this buffer object */
-- 
2.48.1

