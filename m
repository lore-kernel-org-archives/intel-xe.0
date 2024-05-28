Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B4C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54668112249;
	Tue, 28 May 2024 12:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+q3mofZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F67810E345
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899641; x=1748435641;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=x+27eBShM9N8y9seRdQ7YZp/ZaEfV5hWmImaaFr9wFo=;
 b=O+q3mofZT1tMaeSQ1yN1MOa7P3dLqjNPn2RGmdvq/c8meaOKTwfjDLBQ
 vKhjBaLziok7AhsdgsMKneevhcYiFX6w1eb72mKJojbPIrDY0B4Uyw0FR
 LSvyb6fsd3luw3jW04JjZztPIIe6GkB+ieCe70OO4UnNajNO98MQVJ0SI
 byGVbDTBdOKo+muj98Sk4UgnkwxNTdAU3gIs6i1x7JgyLFfMwqQNWNKmD
 vDTXc/PFo/4uUr7zbuK0sPBVAPtxh/yZwnuu4XplX5eHneToVTJZqwHr1
 BEc+XJuusBFp7qdK8EKb1t7sXBUAHugx9HaGpBVY/g5KdnSNS8p8wKnDu A==;
X-CSE-ConnectionGUID: VjbKkN1KT6GaGI7heBUJYQ==
X-CSE-MsgGUID: 2JUrpHrAS5yPdvZu5U63qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065013"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:33:59 -0700
X-CSE-ConnectionGUID: wzOQJ4pbSRWdXZy2E3RSRw==
X-CSE-MsgGUID: /AnsY3iPSMSvjlk/0p7izw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880384"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:33:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 05/22] drm/ttm: Provide a generic LRU walker helper
Date: Tue, 28 May 2024 14:33:26 +0200
Message-ID: <20240528123343.169970-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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
a ww mutex locking transaction, to mimic to some extent the
current functionality in ttm. However any -EDEADLK return
is converted to -ENOMEM, so that the driver will need to back
off and possibly retry without being able to keep the
ticket.

v3:
- Move the helper to core ttm.
- Remove the drm_exec usage from it for now, it will be
  reintroduced later in the series.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 145 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          |  32 +++++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0b3f4267130c..be200c06cc79 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -768,3 +768,148 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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
+ * the lock, and that the buffer object didn't switch resource in between.
+ *
+ * With a locked object, the actions indicated by @walk->process_bo are
+ * performed, and after that, the bo is unlocked, the refcount dropped and the
+ * next struct ttm_resource is processed. Here, the walker relies on
+ * TTM's restartable LRU list implementation.
+ *
+ * Typically @walk->process_bo() would return the number of pages evicted,
+ * swapped or shrunken, so that when the total exceeds @target, or when the
+ * LRU list has been walked in full, iteration is terminated. It's also terminated
+ * on error. Note that the definition of @target is done by the caller, it
+ * could have a different meaning than the number of pages.
+ *
+ * Note that the way dma_resv individualization is done, locking needs to be done
+ * either with the LRU lock held (trylocking only) or with a reference on the
+ * object.
+ *
+ * Return: The progress made towards target or negative error code on error.
+ */
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			    struct ttm_resource_manager *man, long target)
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
+		sofar = (lret < 0) ? lret : sofar + lret;
+		if (sofar < 0 || sofar >= target)
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
index 6ccf96c91f3a..8b032298d66e 100644
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
+ */
+struct ttm_lru_walk {
+	/** @ops: Pointer to the ops structure. */
+	const struct ttm_lru_walk_ops *ops;
+	/** @ctx: Pointer to the struct ttm_operation_ctx. */
+	struct ttm_operation_ctx *ctx;
+	/** @ticket: The struct ww_acquire_ctx if any. */
+	struct ww_acquire_ctx *ticket;
+	/** @tryock_only: Only use trylock for locking. */
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

