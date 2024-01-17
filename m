Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40354C47DB1
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 10:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE26710E691;
	Wed, 17 Jan 2024 10:52:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E1110E660
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705488773; x=1737024773;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NdQmW1+BQN/OkHvWQlDemdlx0Q9BdNZfPpwyy9TLyBE=;
 b=OomLYXLL8qNUDTKWugpRlDa5oxPvkv3ekt9tvrOeQk2KMc7OYRtiw35/
 Q//7iJlLjS2JwLi28gqBHut4DXaZhZK7CLDLVs0Z9fCN/UEOAqLKNbiJY
 teyBCrgyjzMruZGHrRbCwytbUQY5yjDeRD5XEhqqs6RrAzcyGOPGZ7tqk
 TViLwX6GXOmX+2h/zznISMEjc8PHO6Ka5HtJ8wVvtP4FaJTh+/sBe9/xq
 5dDY/M6MGsgE336Rir2H0cCLgdikQW7Tq5dJUOZYxralHJjoXcnFdtxqA
 XVxZ0MqnhdfaOYZF9KWGF1mchvAoXvERtquBj1sULK9fDRGomBZQsBX39 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486292285"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="486292285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1848"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:53 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/5] drm/ttm: improve idle/busy handling v3
Date: Wed, 17 Jan 2024 11:52:35 +0100
Message-ID: <20240117105236.121836-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117105236.121836-1-thomas.hellstrom@linux.intel.com>
References: <20240117105236.121836-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 131 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_resource.c         |  16 ++-
 drivers/gpu/drm/xe/xe_bo.c                 |   4 +-
 include/drm/ttm/ttm_bo.h                   |   3 +-
 include/drm/ttm/ttm_resource.h             |   3 +-
 7 files changed, 68 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index b671b0665492..06fb3fc47eaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -404,7 +404,7 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
 		(*bo_ptr)->placements[i].lpfn = (offset + size) >> PAGE_SHIFT;
 	}
 	r = ttm_bo_mem_space(&(*bo_ptr)->tbo, &(*bo_ptr)->placement,
-			     &(*bo_ptr)->tbo.resource, &ctx);
+			     &(*bo_ptr)->tbo.resource, &ctx, false);
 	if (r)
 		goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8722beba494e..f23cdc7c5b08 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -966,7 +966,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	placements.mem_type = TTM_PL_TT;
 	placements.flags = bo->resource->placement;
 
-	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
+	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx, true);
 	if (unlikely(r))
 		return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a5e11a92e0b9..3783be24d832 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -414,7 +414,7 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 	hop_placement.placement = hop;
 
 	/* find space in the bounce domain */
-	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
+	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx, true);
 	if (ret)
 		return ret;
 	/* move to the bounce domain */
@@ -454,7 +454,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		return ttm_bo_pipeline_gutting(bo);
 	}
 
-	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
+	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx, true);
 	if (ret) {
 		if (ret != -ERESTARTSYS) {
 			pr_err("Failed to find memory space for buffer 0x%p eviction\n",
@@ -724,37 +724,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
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
  * ttm_bo_mem_space
  *
@@ -763,6 +732,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  * @placement: Proposed new placement for the buffer object.
  * @mem: A struct ttm_resource.
  * @ctx: if and how to sleep, lock buffers and alloc memory
+ * @force_space: If we should evict buffers to force space
  *
  * Allocate memory space for the buffer object pointed to by @bo, using
  * the placement flags in @placement, potentially evicting other idle buffer objects.
@@ -776,12 +746,14 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			struct ttm_placement *placement,
 			struct ttm_resource **mem,
-			struct ttm_operation_ctx *ctx)
+			struct ttm_operation_ctx *ctx,
+			bool force_space)
 {
 	struct ttm_device *bdev = bo->bdev;
-	bool type_found = false;
+	struct ww_acquire_ctx *ticket;
 	int i, ret;
 
+	ticket = dma_resv_locking_ctx(bo->base.resv);
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret))
 		return ret;
@@ -790,19 +762,30 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
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
+			ret = ttm_resource_alloc(bo, place, mem);
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
 
 		ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
@@ -810,45 +793,19 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
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
 EXPORT_SYMBOL(ttm_bo_mem_space);
 
 static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 			      struct ttm_placement *placement,
-			      struct ttm_operation_ctx *ctx)
+			      struct ttm_operation_ctx *ctx,
+			      bool force_space)
 {
 	struct ttm_resource *mem;
 	struct ttm_place hop;
@@ -865,7 +822,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	 * stop and the driver will be called to make
 	 * the second hop.
 	 */
-	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
+	ret = ttm_bo_mem_space(bo, placement, &mem, ctx, force_space);
 	if (ret)
 		return ret;
 bounce:
@@ -902,6 +859,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
+	bool force_space;
 	int ret;
 
 	dma_resv_assert_held(bo->base.resv);
@@ -912,20 +870,27 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
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
+
+		/* Moving of pinned BOs is forbidden */
+		if (bo->pin_count)
+			return -EINVAL;
 
-	/* Moving of pinned BOs is forbidden */
-	if (bo->pin_count)
-		return -EINVAL;
+		ret = ttm_bo_move_buffer(bo, placement, ctx, force_space);
+		if (ret && ret != -ENOSPC)
+			return ret;
 
-	ret = ttm_bo_move_buffer(bo, placement, ctx);
+		force_space = !force_space;
+	} while (force_space);
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
 		return -ENOMEM;
-	if (ret)
-		return ret;
 
 	/*
 	 * We might need to add a TTM.
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index fb14f7716cf8..65155f2013ca 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -295,11 +295,13 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
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
@@ -315,14 +317,20 @@ bool ttm_resource_compatible(struct ttm_resource *res,
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
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6b25c5d49e08..0b1209a45acd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -842,7 +842,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (WARN_ON(!xe_bo_is_vram(bo)))
 		return -EINVAL;
 
-	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
+	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx, false);
 	if (ret)
 		return ret;
 
@@ -907,7 +907,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
 		return -EINVAL;
 
-	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
+	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx, false);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b2..64d738f152d1 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -397,7 +397,8 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		     struct ttm_placement *placement,
 		     struct ttm_resource **mem,
-		     struct ttm_operation_ctx *ctx);
+		     struct ttm_operation_ctx *ctx,
+		     bool force_space);
 
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
 /*
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 1afa13f0c22b..7561023db43d 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -366,7 +366,8 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
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

