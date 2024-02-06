Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A18C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 13:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C078A10FD8C;
	Tue,  6 Feb 2024 13:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNoP1Shx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6439D10EB5E;
 Tue,  6 Feb 2024 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707224651; x=1738760651;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G97eSVTZ87+hVBQgCbi/wQQT0CDDWjZA0JA7kqeKyLI=;
 b=GNoP1ShxvdnhbR0/l60XIAsSQ0Nd9zRjux+zlRGKiRvikI1aQ/kL14T2
 brqeqXaKKWgSV9E7/s7oSwOmSACwxTJR5CuJFKjdVQNxfcpkXUxiiquVU
 weE61m278H3aD3M4p1hmenlmcLY6LLH/jmj0zR3NIOEVrjsLHPK29HszB
 4ncZEMAfHh9sfzRphkYb0sDCRnXGBzwAOzLwChYpgxEGv58QrFiWnJPwx
 ra6prMeIrzbAuZqngqekcWSxPJ053MNPw/hiTpf0+r+VUZcdZP2/xciEm
 gnLV/RqBNxbXhDLm67ezpEKFva61UekY2pzanFAYlFZLjTvvLeHxeIL2Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="642180"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="642180"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 05:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933455921"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="933455921"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.52])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 05:04:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Subject: [CI] drm/ttm: improve idle/busy handling v4
Date: Tue,  6 Feb 2024 14:03:53 +0100
Message-ID: <20240206130353.13610-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Previously we would never try to move a BO into the preferred placements
when it ever landed in a busy placement since those were considered
compatible.

Rework the whole handling and finally unify the idle and busy handling.
ttm_bo_validate() is now responsible to try idle placement first and then
use the busy placement if that didn't worked.

Drawback is that we now always try the idle placement first for each
validation which might cause some additional CPU overhead on overcommit.

v2: fix kerneldoc warning and coding style
v3: take care of XE as well
v4: keep the ttm_bo_mem_space functionality as it is for now, only add
    new handling for ttm_bo_validate as suggested by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com> v3
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 231 +++++++++++++----------------
 drivers/gpu/drm/ttm/ttm_resource.c |  16 +-
 include/drm/ttm/ttm_resource.h     |   3 +-
 3 files changed, 121 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 457a2303fbf8..ab1d79128d7c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -725,64 +725,36 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/*
- * Repeatedly evict memory from the LRU for @mem_type until we create enough
- * space, or we've evicted everything and there isn't enough space.
- */
-static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
-				  const struct ttm_place *place,
-				  struct ttm_resource **mem,
-				  struct ttm_operation_ctx *ctx)
-{
-	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man;
-	struct ww_acquire_ctx *ticket;
-	int ret;
-
-	man = ttm_manager_type(bdev, place->mem_type);
-	ticket = dma_resv_locking_ctx(bo->base.resv);
-	do {
-		ret = ttm_resource_alloc(bo, place, mem);
-		if (likely(!ret))
-			break;
-		if (unlikely(ret != -ENOSPC))
-			return ret;
-		ret = ttm_mem_evict_first(bdev, man, place, ctx,
-					  ticket);
-		if (unlikely(ret != 0))
-			return ret;
-	} while (1);
-
-	return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
-}
-
 /**
- * ttm_bo_mem_space
+ * ttm_bo_alloc_resource - Allocate backing store for a BO
  *
- * @bo: Pointer to a struct ttm_buffer_object. the data of which
- * we want to allocate space for.
- * @placement: Proposed new placement for the buffer object.
- * @mem: A struct ttm_resource.
+ * @bo: Pointer to a struct ttm_buffer_object of which we want a resource for
+ * @placement: Proposed new placement for the buffer object
  * @ctx: if and how to sleep, lock buffers and alloc memory
+ * @force_space: If we should evict buffers to force space
+ * @res: The resulting struct ttm_resource.
  *
- * Allocate memory space for the buffer object pointed to by @bo, using
- * the placement flags in @placement, potentially evicting other idle buffer objects.
- * This function may sleep while waiting for space to become available.
+ * Allocates a resource for the buffer object pointed to by @bo, using the
+ * placement flags in @placement, potentially evicting other buffer objects when
+ * @force_space is true.
+ * This function may sleep while waiting for resources to become available.
  * Returns:
- * -EBUSY: No space available (only if no_wait == 1).
+ * -EBUSY: No space available (only if no_wait == true).
  * -ENOSPC: Could not allocate space for the buffer object, either due to
  * fragmentation or concurrent allocators.
  * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
  */
-int ttm_bo_mem_space(struct ttm_buffer_object *bo,
-			struct ttm_placement *placement,
-			struct ttm_resource **mem,
-			struct ttm_operation_ctx *ctx)
+static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
+				 struct ttm_placement *placement,
+				 struct ttm_operation_ctx *ctx,
+				 bool force_space,
+				 struct ttm_resource **res)
 {
 	struct ttm_device *bdev = bo->bdev;
-	bool type_found = false;
+	struct ww_acquire_ctx *ticket;
 	int i, ret;
 
+	ticket = dma_resv_locking_ctx(bo->base.resv);
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret))
 		return ret;
@@ -791,98 +763,73 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
-		if (place->flags & TTM_PL_FLAG_FALLBACK)
-			continue;
-
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
 
-		type_found = true;
-		ret = ttm_resource_alloc(bo, place, mem);
-		if (ret == -ENOSPC)
+		if (place->flags & (force_space ? TTM_PL_FLAG_DESIRED :
+				    TTM_PL_FLAG_FALLBACK))
+			continue;
+
+		do {
+			ret = ttm_resource_alloc(bo, place, res);
+			if (unlikely(ret != -ENOSPC))
+				return ret;
+			if (likely(!ret) || !force_space)
+				break;
+
+			ret = ttm_mem_evict_first(bdev, man, place, ctx,
+						  ticket);
+			if (unlikely(ret == -EBUSY))
+				break;
+			if (unlikely(ret))
+				return ret;
+		} while (1);
+		if (ret)
 			continue;
-		if (unlikely(ret))
-			goto error;
 
-		ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
+		ret = ttm_bo_add_move_fence(bo, man, *res, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
-			ttm_resource_free(bo, mem);
+			ttm_resource_free(bo, res);
 			if (ret == -EBUSY)
 				continue;
 
-			goto error;
+			return ret;
 		}
 		return 0;
 	}
 
-	for (i = 0; i < placement->num_placement; ++i) {
-		const struct ttm_place *place = &placement->placement[i];
-		struct ttm_resource_manager *man;
-
-		if (place->flags & TTM_PL_FLAG_DESIRED)
-			continue;
-
-		man = ttm_manager_type(bdev, place->mem_type);
-		if (!man || !ttm_resource_manager_used(man))
-			continue;
-
-		type_found = true;
-		ret = ttm_bo_mem_force_space(bo, place, mem, ctx);
-		if (likely(!ret))
-			return 0;
-
-		if (ret && ret != -EBUSY)
-			goto error;
-	}
-
-	ret = -ENOSPC;
-	if (!type_found) {
-		pr_err(TTM_PFX "No compatible memory type found\n");
-		ret = -EINVAL;
-	}
-
-error:
-	return ret;
+	return -ENOSPC;
 }
-EXPORT_SYMBOL(ttm_bo_mem_space);
 
-static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
-			      struct ttm_placement *placement,
-			      struct ttm_operation_ctx *ctx)
+/*
+ * ttm_bo_mem_space - Wrapper around ttm_bo_alloc_resource
+ *
+ * @bo: Pointer to a struct ttm_buffer_object of which we want a resource for
+ * @placement: Proposed new placement for the buffer object
+ * @res: The resulting struct ttm_resource.
+ * @ctx: if and how to sleep, lock buffers and alloc memory
+ *
+ * Tries both idle allocation and forcefully eviction of buffers. See
+ * ttm_bo_alloc_resource for details.
+ */
+int ttm_bo_mem_space(struct ttm_buffer_object *bo,
+		     struct ttm_placement *placement,
+		     struct ttm_resource **res,
+		     struct ttm_operation_ctx *ctx)
 {
-	struct ttm_resource *mem;
-	struct ttm_place hop;
+	bool force_space = false;
 	int ret;
 
-	dma_resv_assert_held(bo->base.resv);
+	do {
+		ret = ttm_bo_alloc_resource(bo, placement, ctx,
+					    force_space, res);
+		force_space = !force_space;
+	} while (ret == -ENOSPC && force_space);
 
-	/*
-	 * Determine where to move the buffer.
-	 *
-	 * If driver determines move is going to need
-	 * an extra step then it will return -EMULTIHOP
-	 * and the buffer will be moved to the temporary
-	 * stop and the driver will be called to make
-	 * the second hop.
-	 */
-	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
-	if (ret)
-		return ret;
-bounce:
-	ret = ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
-	if (ret == -EMULTIHOP) {
-		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
-		if (ret)
-			goto out;
-		/* try and move to final place now. */
-		goto bounce;
-	}
-out:
-	if (ret)
-		ttm_resource_free(bo, &mem);
 	return ret;
 }
+EXPORT_SYMBOL(ttm_bo_mem_space);
 
 /**
  * ttm_bo_validate
@@ -903,6 +850,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
+	struct ttm_resource *res;
+	struct ttm_place hop;
+	bool force_space;
 	int ret;
 
 	dma_resv_assert_held(bo->base.resv);
@@ -913,20 +863,53 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
-	/* Check whether we need to move buffer. */
-	if (bo->resource && ttm_resource_compatible(bo->resource, placement))
-		return 0;
+	force_space = false;
+	do {
+		/* Check whether we need to move buffer. */
+		if (bo->resource &&
+		    ttm_resource_compatible(bo->resource, placement,
+					    force_space))
+			return 0;
 
-	/* Moving of pinned BOs is forbidden */
-	if (bo->pin_count)
-		return -EINVAL;
+		/* Moving of pinned BOs is forbidden */
+		if (bo->pin_count)
+			return -EINVAL;
+
+		/*
+		 * Determine where to move the buffer.
+		 *
+		 * If driver determines move is going to need
+		 * an extra step then it will return -EMULTIHOP
+		 * and the buffer will be moved to the temporary
+		 * stop and the driver will be called to make
+		 * the second hop.
+		 */
+		ret = ttm_bo_alloc_resource(bo, placement, ctx, force_space,
+					    &res);
+		force_space = !force_space;
+		if (ret == -ENOSPC)
+			continue;
+		if (ret)
+			return ret;
+
+bounce:
+		ret = ttm_bo_handle_move_mem(bo, res, false, ctx, &hop);
+		if (ret == -EMULTIHOP) {
+			ret = ttm_bo_bounce_temp_buffer(bo, &res, ctx, &hop);
+			/* try and move to final place now. */
+			if (!ret)
+				goto bounce;
+		}
+		if (ret) {
+			ttm_resource_free(bo, &res);
+			return ret;
+		}
+
+	} while (ret && force_space);
 
-	ret = ttm_bo_move_buffer(bo, placement, ctx);
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
 		return -ENOMEM;
-	if (ret)
-		return ret;
 
 	/*
 	 * We might need to add a TTM.
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index f299152b38a8..e99c05d92b75 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -341,11 +341,13 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
  *
  * @res: the resource to check
  * @placement: the placement to check against
+ * @evicting: true if the caller is doing evictions
  *
  * Returns true if the placement is compatible.
  */
 bool ttm_resource_compatible(struct ttm_resource *res,
-			     struct ttm_placement *placement)
+			     struct ttm_placement *placement,
+			     bool evicting)
 {
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
@@ -361,14 +363,20 @@ bool ttm_resource_compatible(struct ttm_resource *res,
 		if (res->mem_type != place->mem_type)
 			continue;
 
+		if (place->flags & (evicting ? TTM_PL_FLAG_DESIRED :
+				    TTM_PL_FLAG_FALLBACK))
+			continue;
+
+		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
+		    !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
+			continue;
+
 		man = ttm_manager_type(bdev, res->mem_type);
 		if (man->func->compatible &&
 		    !man->func->compatible(man, res, place, bo->base.size))
 			continue;
 
-		if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
-		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
-			return true;
+		return true;
 	}
 	return false;
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 3e969b6b90b5..8d018b8b01bb 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -404,7 +404,8 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 			     const struct ttm_place *place,
 			     size_t size);
 bool ttm_resource_compatible(struct ttm_resource *res,
-			     struct ttm_placement *placement);
+			     struct ttm_placement *placement,
+			     bool evicting);
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo);
 
-- 
2.43.0

