Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A9C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD93210E198;
	Wed, 15 May 2024 08:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhV6ZG5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211C910E36B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760907; x=1747296907;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xdM0SiNfJm5IEQSJFrGezp7m3AImrQfL5c8IpEJ55VI=;
 b=BhV6ZG5DzmcPywkTOcoUb/h6V8JtxeXIsqw6oeF1ffqJnGqPKtoZm9Pr
 88i6/haPvenHkntiLHh/IrTSXAYhi8Zdg1fIsf6OhiuIOGPILYdu8dhqo
 gCieizwd/ZfsbFS/4AnmJCwNUlRcEnwihmmy25vo1juNEsbEjoexE5n2Q
 sBQezTdKDmHRlQGEcD01nJXmn9vqn5U4VtNM6YCaL/8xmW1gsorTF1CIP
 hqvFEg9+AbScDHvmJSy1YKqsqYw/wTufcRahkDJGwRGxWU8EFy9aNIMMh
 D9/0zTXBkpGNadJrhPRam61xUv3pITsM5hO3f5DpoB7GPZ7sY7Lv7Cr91 g==;
X-CSE-ConnectionGUID: 9GDE2g3vSAup2JClEcaDxA==
X-CSE-MsgGUID: Jji+MxS3QlOdbsFvxkn+Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193303"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:07 -0700
X-CSE-ConnectionGUID: yg9vzz9UQQOfhW6idYDcVA==
X-CSE-MsgGUID: lGT0Su1FQ0ahAt6UIKyF0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977437"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/21] drm/ttm: sleeping evict lock.
Date: Wed, 15 May 2024 10:14:36 +0200
Message-ID: <20240515081449.46646-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 344 +++++++++++------------------
 drivers/gpu/drm/ttm/ttm_device.c   |   1 -
 drivers/gpu/drm/ttm/ttm_resource.c |  22 +-
 include/drm/ttm/ttm_bo.h           |   8 +-
 4 files changed, 133 insertions(+), 242 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d1c219fd784b..e5a8eac9478a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	dma_resv_iter_end(&cursor);
 }
 
-/**
- * ttm_bo_cleanup_refs
- * If bo idle, remove from lru lists, and unref.
- * If not idle, block if possible.
- *
- * Must be called with lru_lock and reservation held, this function
- * will drop the lru lock and optionally the reservation lock before returning.
- *
- * @bo:                    The buffer object to clean-up
- * @interruptible:         Any sleeps should occur interruptibly.
- * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
- * @unlock_resv:           Unlock the reservation lock as well.
- */
-
-static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
-			       bool interruptible, bool no_wait_gpu,
-			       bool unlock_resv)
-{
-	struct dma_resv *resv = &bo->base._resv;
-	int ret;
-
-	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
-		ret = 0;
-	else
-		ret = -EBUSY;
-
-	if (ret && !no_wait_gpu) {
-		long lret;
-
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-
-		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
-					     interruptible,
-					     30 * HZ);
-
-		if (lret < 0)
-			return lret;
-		else if (lret == 0)
-			return -EBUSY;
-
-		spin_lock(&bo->bdev->lru_lock);
-		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
-			/*
-			 * We raced, and lost, someone else holds the reservation now,
-			 * and is probably busy in ttm_bo_cleanup_memtype_use.
-			 *
-			 * Even if it's not the case, because we finished waiting any
-			 * delayed destruction would succeed, so just return success
-			 * here.
-			 */
-			spin_unlock(&bo->bdev->lru_lock);
-			return 0;
-		}
-		ret = 0;
-	}
-
-	if (ret) {
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-		return ret;
-	}
-
-	spin_unlock(&bo->bdev->lru_lock);
-	ttm_bo_cleanup_memtype_use(bo);
-
-	if (unlock_resv)
-		dma_resv_unlock(bo->base.resv);
-
-	return 0;
-}
-
 /*
  * Block for the dma_resv object to become idle, lock the buffer and clean up
  * the resource and tt object.
@@ -505,151 +431,131 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/*
- * Check the target bo is allowable to be evicted or swapout, including cases:
- *
- * a. if share same reservation object with ctx->resv, have assumption
- * reservation objects should already be locked, so not lock again and
- * return true directly when either the opreation allow_reserved_eviction
- * or the target bo already is in delayed free list;
- *
- * b. Otherwise, trylock it.
- */
-static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
-					   struct ttm_operation_ctx *ctx,
-					   const struct ttm_place *place,
-					   bool *locked, bool *busy)
+int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx)
 {
-	bool ret = false;
-
-	if (bo->pin_count) {
-		*locked = false;
-		if (busy)
-			*busy = false;
-		return false;
-	}
-
-	if (bo->base.resv == ctx->resv) {
-		dma_resv_assert_held(bo->base.resv);
-		if (ctx->allow_res_evict)
-			ret = true;
-		*locked = false;
-		if (busy)
-			*busy = false;
-	} else {
-		ret = dma_resv_trylock(bo->base.resv);
-		*locked = ret;
-		if (busy)
-			*busy = !ret;
+	struct ttm_resource_cursor cursor;
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo;
+	int ret = 0;
+	
+	spin_lock(&bdev->lru_lock);
+	res = ttm_resource_manager_first(man, &cursor);
+	if (!res) {
+		ret = -ENOENT;
+		goto out_no_ref;
 	}
+	bo = res->bo;
+	if (!ttm_bo_get_unless_zero(bo))
+		goto out_no_ref;
+	spin_unlock(&bdev->lru_lock);
+	dma_resv_lock(bo->base.resv, NULL);
+	if (bo->resource != res)
+		goto out_bad_res;
 
-	if (ret && place && (bo->resource->mem_type != place->mem_type ||
-		!bo->bdev->funcs->eviction_valuable(bo, place))) {
-		ret = false;
-		if (*locked) {
-			dma_resv_unlock(bo->base.resv);
-			*locked = false;
-		}
+	if (bo->deleted) {
+		ret = ttm_bo_wait_ctx(bo, ctx);
+		if (ret)
+			ttm_bo_cleanup_memtype_use(bo);
+	} else {	
+		ret = ttm_bo_evict(bo, ctx);
 	}
-
+out_bad_res:
+	dma_resv_unlock(bo->base.resv);
+	ttm_bo_put(bo);
+	ttm_resource_cursor_fini(&cursor);
 	return ret;
+	
+out_no_ref:
+	ttm_resource_cursor_fini_locked(&cursor);
+	spin_unlock(&bdev->lru_lock);
+	return -ENOENT;
 }
+		
+struct ttm_bo_evict_walk {
+	struct ttm_lru_walk walk;
+	const struct ttm_place *place;
+	struct ttm_buffer_object *evictor;
+	struct ttm_resource **res;
+	unsigned long evicted;
+};
 
-/**
- * ttm_mem_evict_wait_busy - wait for a busy BO to become available
- *
- * @busy_bo: BO which couldn't be locked with trylock
- * @ctx: operation context
- * @ticket: acquire ticket
- *
- * Try to lock a busy buffer object to avoid failing eviction.
- */
-static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
-				   struct ttm_operation_ctx *ctx,
-				   struct ww_acquire_ctx *ticket)
+static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	int r;
+	struct ttm_bo_evict_walk *evict_walk =
+		container_of(walk, typeof(*evict_walk), walk);
+	long lret;
 
-	if (!busy_bo || !ticket)
-		return -EBUSY;
+	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
+		return 0;
 
-	if (ctx->interruptible)
-		r = dma_resv_lock_interruptible(busy_bo->base.resv,
-							  ticket);
-	else
-		r = dma_resv_lock(busy_bo->base.resv, ticket);
+	if (bo->deleted) {
+		lret = ttm_bo_wait_ctx(bo, walk->ctx);
+		if (!lret)
+			ttm_bo_cleanup_memtype_use(bo);
+	} else {	
+		lret = ttm_bo_evict(bo, walk->ctx);
+	}
 
-	/*
-	 * TODO: It would be better to keep the BO locked until allocation is at
-	 * least tried one more time, but that would mean a much larger rework
-	 * of TTM.
-	 */
-	if (!r)
-		dma_resv_unlock(busy_bo->base.resv);
+	if (lret)
+		goto out;
 
-	return r == -EDEADLK ? -EBUSY : r;
+	evict_walk->evicted++;
+	if (evict_walk->res)
+		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
+					  evict_walk->res);
+	if (lret == 0) 
+		return 1;
+out:
+	/* Errors that should terminate the walk. */
+	if (lret == -ENOMEM || lret == -EINTR || lret == -ERESTARTSYS ||
+	    lret == -EAGAIN)
+		return lret;
+	
+	return 0;
 }
 
-int ttm_mem_evict_first(struct ttm_device *bdev,
-			struct ttm_resource_manager *man,
-			const struct ttm_place *place,
-			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket)
-{
-	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
-	struct ttm_resource_cursor cursor;
-	struct ttm_resource *res;
-	bool locked = false;
-	int ret;
-
-	spin_lock(&bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
-		bool busy;
-
-		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
-						    &locked, &busy)) {
-			if (busy && !busy_bo && ticket !=
-			    dma_resv_locking_ctx(res->bo->base.resv))
-				busy_bo = res->bo;
-			continue;
-		}
-
-		if (ttm_bo_get_unless_zero(res->bo)) {
-			bo = res->bo;
-			break;
-		}
-		if (locked)
-			dma_resv_unlock(res->bo->base.resv);
-	}
-	ttm_resource_cursor_fini_locked(&cursor);
-
-	if (!bo) {
-		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
-			busy_bo = NULL;
-		spin_unlock(&bdev->lru_lock);
-		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
-		if (busy_bo)
-			ttm_bo_put(busy_bo);
-		return ret;
-	}
-
-	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
-					  ctx->no_wait_gpu, locked);
-		ttm_bo_put(bo);
-		return ret;
-	}
+static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
+	.process_bo = ttm_bo_evict_cb,
+};
 
-	spin_unlock(&bdev->lru_lock);
+static int ttm_bo_evict_alloc(struct ttm_device *bdev,
+			      struct ttm_resource_manager *man,
+			      const struct ttm_place *place,
+			      struct ttm_buffer_object *evictor,
+			      struct ttm_operation_ctx *ctx,
+			      struct ww_acquire_ctx *ticket,
+			      struct ttm_resource **res)
+{
+	struct ttm_bo_evict_walk evict_walk = {
+		.walk = {
+			.ops = &ttm_evict_walk_ops,
+			.ctx = ctx,
+			.ticket = ticket,
+		},
+		.place = place,
+		.evictor = evictor,
+		.res = res,
+	};
+	long lret;
 
-	ret = ttm_bo_evict(bo, ctx);
-	if (locked)
-		ttm_bo_unreserve(bo);
-	else
-		ttm_bo_move_to_lru_tail_unlocked(bo);
+	evict_walk.walk.trylock_only = true;
+	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+	if (lret || !ticket)
+		goto out;
 
-	ttm_bo_put(bo);
-	return ret;
+	/* If ticket-locking, repeat while we make progress. */
+	evict_walk.walk.trylock_only = false;
+	do {
+		evict_walk.evicted = 0;
+		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+	} while (!lret && evict_walk.evicted);
+out:
+	if (lret < 0)
+		return lret;
+	if (lret == 0)
+		return -EBUSY;
+	return 0;
 }
 
 /**
@@ -760,6 +666,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 	for (i = 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
+		bool may_evict;
 
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
@@ -769,22 +676,21 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 				    TTM_PL_FLAG_FALLBACK))
 			continue;
 
-		do {
-			ret = ttm_resource_alloc(bo, place, res);
-			if (unlikely(ret && ret != -ENOSPC))
-				return ret;
-			if (likely(!ret) || !force_space)
-				break;
-
-			ret = ttm_mem_evict_first(bdev, man, place, ctx,
-						  ticket);
-			if (unlikely(ret == -EBUSY))
-				break;
-			if (unlikely(ret))
+		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
+		ret = ttm_resource_alloc(bo, place, res);
+		if (ret) {
+			if (ret != -ENOSPC)
+				return ret;		
+			if (!may_evict)
+				continue;
+
+			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
+						 ticket, res);
+			if (ret == -EBUSY)
+				continue;
+			if (ret)
 				return ret;
-		} while (1);
-		if (ret)
-			continue;
+		}
 
 		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
@@ -796,7 +702,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 		}
 		return 0;
 	}
-
 	return -ENOSPC;
 }
 
@@ -822,6 +727,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	do {
 		ret = ttm_bo_alloc_resource(bo, placement, ctx,
 					    force_space, res);
+		if (ret)
+			pr_err("mem space failure %pe, force_space %d\n",
+			       ERR_PTR(ret), force_space);
 		force_space = !force_space;
 	} while (ret == -ENOSPC && force_space);
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c9d08ecc0f3b..ee575d8a54c0 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -152,7 +152,6 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	unsigned i;
 	long lret;
 
-	spin_lock(&bdev->lru_lock);
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 9b80bdcf2216..2cea0ff7acb1 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -509,25 +509,11 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 	};
 	struct dma_fence *fence;
 	int ret;
-	unsigned i;
-
-	/*
-	 * Can't use standard list traversal since we're unlocking.
-	 */
-
-	spin_lock(&bdev->lru_lock);
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		while (!list_empty(&man->lru[i])) {
-			spin_unlock(&bdev->lru_lock);
-			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
-						  NULL);
-			if (ret)
-				return ret;
-			spin_lock(&bdev->lru_lock);
-		}
-	}
-	spin_unlock(&bdev->lru_lock);
 
+	do {
+		ret = ttm_bo_evict_first(bdev, man, &ctx);
+	} while (!ret);
+	
 	spin_lock(&man->move_lock);
 	fence = dma_fence_get(man->move);
 	spin_unlock(&man->move_lock);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8c43939e95e9..30c3a5fd9099 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -415,11 +415,9 @@ long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		    pgoff_t target);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
-int ttm_mem_evict_first(struct ttm_device *bdev,
-			struct ttm_resource_manager *man,
-			const struct ttm_place *place,
-			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket);
+int ttm_bo_evict_first(struct ttm_device *bdev,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.44.0

