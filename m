Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683ABC41513
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B3510ED8C;
	Thu, 16 May 2024 18:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3Elq8Zp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B106510ECC4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883837; x=1747419837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=06y8JURlBYlhNA/CICrtpOxMZvk5NOb5xvfHAyMqnLU=;
 b=F3Elq8ZpusXDIWnq4KZsnapQ0z2SYpG9ZQK+F0gOSxNOW1S4f6uibc4v
 00xKcfwm2qHwtwamzlTrKiO6OHI1E7xqByAoGjccYM034Qx5k0DCo622H
 8Iu3S0AkG2wvJ86fayFhT44my5f4O65sHJ86/7WOSIJhOwJtEtQ463uH6
 mkd2JFSka/X5+SZPI0XZte/Fsmh1mYvrztFF8PNq90WULTD0KgQa7KxZm
 yg6zg5lAG+Ox/qqrNkgInTV7aZ4YFRC2VR3Yg1b7PmwxtKmOJIxguLD1V
 MKQLC8kvS850NgQ810rWtET4BKoukBpgPHbtCLLxcD9lsfrGpVwV55Ien g==;
X-CSE-ConnectionGUID: eUjAxyy6Tf6L9LTBtAd4kg==
X-CSE-MsgGUID: 4e+owPKgSR6TDCX31O3yFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159900"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:23:57 -0700
X-CSE-ConnectionGUID: KPx0FADLR/eaC/f06KAHwg==
X-CSE-MsgGUID: nZEayQnpQ7mTtke4BFZyJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065274"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:23:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 06/21] drm/ttm: Use restartable LRU and sleeping locks for
 swapping.
Date: Thu, 16 May 2024 20:23:24 +0200
Message-ID: <20240516182339.3482-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_bo.c     | 86 ++++++++++++++++++++------------
 drivers/gpu/drm/ttm/ttm_device.c | 29 ++---------
 include/drm/ttm/ttm_bo.h         |  5 +-
 3 files changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 43eda720657f..4dbd53852773 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1118,11 +1118,18 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 }
 EXPORT_SYMBOL(ttm_bo_wait_ctx);
 
-int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-		   gfp_t gfp_flags)
+struct ttm_bo_swapout_walk {
+	struct ttm_lru_walk walk;
+	gfp_t gfp_flags;
+};
+
+static long
+ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	struct ttm_place place;
-	bool locked;
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct ttm_bo_swapout_walk *swapout_walk =
+		container_of(walk, typeof(*swapout_walk), walk);
+	struct ttm_operation_ctx *ctx = walk->ctx;
 	long ret;
 
 	/*
@@ -1131,28 +1138,29 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * The driver may use the fact that we're moving from SYSTEM
 	 * as an indication that we're about to swap out.
 	 */
-	memset(&place, 0, sizeof(place));
-	place.mem_type = bo->resource->mem_type;
-	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
-		return -EBUSY;
+	if (!bo->bdev->funcs->eviction_valuable(bo, &place)) {
+		ret = -EBUSY;
+		goto out;
+	}
 
 	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
 	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
-	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
-	    !ttm_bo_get_unless_zero(bo)) {
-		if (locked)
-			dma_resv_unlock(bo->base.resv);
-		return -EBUSY;
+	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
+		ret = -EBUSY;
+		goto out;
 	}
 
 	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
-		ttm_bo_put(bo);
-		return ret == -EBUSY ? -ENOSPC : ret;
-	}
+		pgoff_t num_pages = bo->ttm->num_pages;
 
-	/* TODO: Cleanup the locking */
-	spin_unlock(&bo->bdev->lru_lock);
+		ret = ttm_bo_wait_ctx(bo, ctx);
+		if (ret)
+			goto out;
+
+		ttm_bo_cleanup_memtype_use(bo);
+		ret = num_pages;
+		goto out;
+	}
 
 	/*
 	 * Move to system cached
@@ -1164,11 +1172,11 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		memset(&hop, 0, sizeof(hop));
 		place.mem_type = TTM_PL_SYSTEM;
 		ret = ttm_resource_alloc(bo, &place, &evict_mem);
-		if (unlikely(ret))
+		if (ret)
 			goto out;
 
 		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
-		if (unlikely(ret != 0)) {
+		if (ret) {
 			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
 			ttm_resource_free(bo, &evict_mem);
 			goto out;
@@ -1179,7 +1187,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * Make sure BO is idle.
 	 */
 	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(ret != 0))
+	if (ret)
 		goto out;
 
 	ttm_bo_unmap_virtual(bo);
@@ -1192,17 +1200,33 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		bo->bdev->funcs->swap_notify(bo);
 
 	if (ttm_tt_is_populated(bo->ttm))
-		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
+		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
 out:
+	/* Consider some error codes fatal. Others may continue the walk. */
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS ||
+	    ret == -EAGAIN || ret > 0)
+		return ret;
 
-	/*
-	 * Unreserve without putting on LRU to avoid swapping out an
-	 * already swapped buffer.
-	 */
-	if (locked)
-		dma_resv_unlock(bo->base.resv);
-	ttm_bo_put(bo);
-	return ret == -EBUSY ? -ENOSPC : ret;
+	return 0;
+}
+
+const struct ttm_lru_walk_ops ttm_swap_ops = {
+	.process_bo = ttm_bo_swapout_cb,
+};
+
+long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		    struct ttm_resource_manager *man, gfp_t gfp_flags,
+		    pgoff_t target)
+{
+	struct ttm_bo_swapout_walk swapout_walk = {
+		.walk = {
+			.ops = &ttm_swap_ops,
+			.ctx = ctx,
+		},
+		.gfp_flags = gfp_flags,
+	};
+
+	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
 }
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f9e9b1ec8c8a..c9d08ecc0f3b 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -148,11 +148,9 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
-	struct ttm_resource_cursor cursor;
 	struct ttm_resource_manager *man;
-	struct ttm_resource *res;
 	unsigned i;
-	int ret;
+	long lret;
 
 	spin_lock(&bdev->lru_lock);
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
@@ -160,28 +158,11 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		ttm_resource_manager_for_each_res(man, &cursor, res) {
-			struct ttm_buffer_object *bo = res->bo;
-			uint32_t num_pages;
-
-			if (!bo || bo->resource != res)
-				continue;
-
-			num_pages = PFN_UP(bo->base.size);
-			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret) {
-				ttm_resource_cursor_fini(&cursor);
-				return num_pages;
-			}
-			if (ret != -EBUSY) {
-				ttm_resource_cursor_fini(&cursor);
-				return ret;
-			}
-		}
+		lret = ttm_bo_swapout(bdev, ctx, man, gfp_flags, 1);
+		/* Can be both positive (num_pages) and negative (error) */
+		if (lret)
+			return lret;
 	}
-	ttm_resource_cursor_fini_locked(&cursor);
-	spin_unlock(&bdev->lru_lock);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_device_swapout);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8c542ebbe698..8c43939e95e9 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -410,8 +410,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-		   gfp_t gfp_flags);
+long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		    struct ttm_resource_manager *man, gfp_t gfp_flags,
+		    pgoff_t target);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_mem_evict_first(struct ttm_device *bdev,
-- 
2.44.0

