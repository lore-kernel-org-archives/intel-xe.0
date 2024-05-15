Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5736CC41513
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0610E4E1;
	Wed, 15 May 2024 08:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYg8vsOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454C10E255
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760905; x=1747296905;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8ZjOCuC/0psvG/ZYAd8yH4qzY6R06lBEyUhnrvUdGTs=;
 b=TYg8vsOwJ51lNWlbDlGX0hSOcTCd/IjnbDgri2H0pkxZD2D1OK7kG37n
 HmzRzDZdqwJLkRlU21j6mk2TYss3Tp28Bxr2NhLruFp73PnBGY9h5gzZ+
 As3ruh5zjTYXJn9g+lZPhJ3neCjV1bjLZ2D3An6prsC+GWcey/tioVS2d
 MR8Ks5UclNnJa/X6qXzaMz+Q4oC+sx0dahZvq7uyCbW6DlhGCE40noiNS
 IrJfnLM/ueyYClMimLhpdBEKPiYI6ZBfu2oXxQUC2kbj6WBXqy09TrxdI
 vRDX2zu+w6KM60vt0GmfS019cpQbBTrd+bKZPzjwPWzp3x9cdnIx3G71q Q==;
X-CSE-ConnectionGUID: dy4wIJzeRt6jftZ/uvvrHA==
X-CSE-MsgGUID: VwJ4fQHoT/aLgEJO6awccg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193301"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:05 -0700
X-CSE-ConnectionGUID: Y5V9Kyd3SfWnSwHKuoSqzg==
X-CSE-MsgGUID: vcpPmwv9TDaa5p9L5M2isQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977385"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/21] drm/ttm: Provide a generic LRU walker helper
Date: Wed, 15 May 2024 10:14:34 +0200
Message-ID: <20240515081449.46646-7-thomas.hellstrom@linux.intel.com>
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

Provide a generic LRU walker in TTM, in the spirit of drm_gem_lru_scan()
but building on the restartable TTM LRU functionality.

The LRU walker optionally supports locking objects as part of
a drm_exec locking transaction, and can thus be used for both
exhaustive eviction and shrinking. And, in fact, direct
shrinking in the case where we fail to populate system memory
objects and want to retry by shrinking purgeable or evictable
local objects, which a shrinker is not capable of doing.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 162 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          |  32 ++++++
 2 files changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0b3f4267130c..3ca28025dfc3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -768,3 +768,165 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, ttm);
 	return ret;
 }
+
+static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
+				 struct ttm_buffer_object *bo,
+				 bool *needs_unlock)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+
+	*needs_unlock = false;
+
+	if (dma_resv_trylock(bo->base.resv)) {
+		*needs_unlock = true;
+		return true;
+	}
+
+	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
+		dma_resv_assert_held(bo->base.resv);
+		return true;
+	}
+
+	return false;
+}
+
+static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
+				   struct ttm_buffer_object *bo,
+				   bool *needs_unlock)
+{
+	struct dma_resv *resv = bo->base.resv;
+	int ret;
+
+	if (walk->ctx->interruptible)
+		ret = dma_resv_lock_interruptible(resv, walk->ticket);
+	else
+		ret = dma_resv_lock(resv, walk->ticket);
+
+	if (ret == -EDEADLK)
+		ret = -ENOSPC;
+
+	if (!ret) {
+		*needs_unlock = true;
+		/* Only a single ticketlock per loop */
+		walk->ticket = NULL;
+	}
+
+	return ret;
+}
+
+static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
+{
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+}
+
+/**
+ * ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
+ * valid items.
+ * @walk: describe the walks and actions taken
+ * @bdev: The TTM device.
+ * @man: The struct ttm_resource manager whose LRU lists we're walking.
+ * @target: The end condition for the walk.
+ *
+ * The LRU lists of @man are walk, and for each struct ttm_resource encountered,
+ * the corresponding ttm_buffer_object is locked and taken a reference on, and
+ * the LRU lock is dropped. the LRU lock may be dropped before locking and, in
+ * that case, it's verified that the item actually remains on the LRU list after
+ * the lock, and that the buffer object hasn't changed.
+ *
+ * With a locked object, the actions indicated by @walk->process_bo are
+ * performed, and after that, the bo is unlocked, the refcount dropped and the
+ * next struct ttm_resource is processed. Here we rely on TTM's restartable
+ * LRU list implementation.
+ *
+ * Typically @walk->process_bo() would return the number of pages evicted, and
+ * that when the total exceeds @target, or when the LRU list has been walked
+ * in full, iteration is terminated. It's also terminated on error.
+ *
+ * Buffer object dma_resv locking:
+ * This locking is performed using the combined interpretation of @walk->exec and
+ * @walk->ctx according to the following.
+ * 1) Sleeping locks: Sleeping locks are used exclusively if @walk->exec is true.
+ * The buffer object are not unlocked. That is the caller's responsibility.
+ * 2) Assuming bo is already locked: This assumption is made iff @walk->exec is false,
+ * @walk->ctx->allow_res_evict is true and bo->base.resv == @walk->ctx->resv.
+ * This is for cases where it is desired to evict bos sharing a reservation lock
+ * that is already held by the process. Thes bo locks are not unlocked during
+ * the walk.
+ * 3) Trylocking. Trylocking is done in all other cases. If trylocking fails, the
+ * iteration skips the current item and continues. Trylocks are always unlocked
+ * by the walk.
+ *
+ * Note that the way dma_resv individualization is done, locking needs to be done
+ * either with the LRU lock held (trylocking only) or with a reference on the
+ * object.
+ *
+ * Return: (Typically) The number of pages evicted or negative error code on error.
+ */
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, long target)
+{
+	struct ttm_resource_cursor cursor;
+	struct ttm_resource *res;
+	long sofar = 0;
+	long lret;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		struct ttm_buffer_object *bo = res->bo;
+		bool bo_needs_unlock = false;
+		bool bo_locked = false;
+		int mem_type;
+		
+		if (!bo || bo->resource != res)
+			continue;
+
+		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+			bo_locked = true;
+		else if ((!walk->ticket) || walk->ctx->no_wait_gpu ||
+			 walk->trylock_only)
+			continue;
+
+		if (!ttm_bo_get_unless_zero(bo)) {
+			ttm_lru_walk_unlock(bo, bo_needs_unlock);
+			continue;
+		}
+
+		mem_type = res->mem_type;
+		spin_unlock(&bdev->lru_lock);
+
+		lret = 0;
+		if (!bo_locked && walk->ticket)
+			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+
+		/*
+		 * Note that in between the release of the lru lock and the
+		 * ticketlock, the bo may have switched resource,
+		 * and also memory type, since the resource may have been
+		 * freed and allocated again with a different memory type.
+		 * In that case, just skip it.
+		 */
+		if (!lret && bo->resource == res && res->mem_type == mem_type)
+			lret = walk->ops->process_bo(walk, bo);
+
+		ttm_lru_walk_unlock(bo, bo_needs_unlock);
+		ttm_bo_put(bo);
+		if (lret == -EBUSY)
+			lret = 0;
+		if (lret < 0) {
+			sofar = lret;
+			goto out;
+		}
+
+		sofar += lret;
+		if (sofar >= target)
+			goto out;
+
+		cond_resched();
+		spin_lock(&bdev->lru_lock);
+	}
+	spin_unlock(&bdev->lru_lock);
+out:
+	ttm_resource_cursor_fini(&cursor);
+	return sofar;
+}
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3a..8c542ebbe698 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -190,6 +190,38 @@ struct ttm_operation_ctx {
 	uint64_t bytes_moved;
 };
 
+struct ttm_lru_walk;
+
+/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
+struct ttm_lru_walk_ops {
+	/**
+	 * process_bo - Process this bo.
+	 * @walk: struct ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 *
+	 * Return: Negative error code on error, Number of processed pages on
+	 * success. 0 also indicates success.
+	 */
+	long (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
+};
+
+/**
+ * struct ttm_lru_walk - Structure describing a LRU walk.
+ * @ops: Pointer to the ops structure.
+ * @ctx: Pointer to the struct ttm_operation_ctx.
+ * @ticket: The struct ww_acquire_ctx if any.
+ * @tryock_only: Only use trylock for locking.
+ */
+struct ttm_lru_walk {
+	const struct ttm_lru_walk_ops *ops;
+	struct ttm_operation_ctx *ctx;
+	struct ww_acquire_ctx *ticket;
+	bool trylock_only;
+};
+
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			    struct ttm_resource_manager *man, long target);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.44.0

