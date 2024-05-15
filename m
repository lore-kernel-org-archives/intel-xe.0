Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C317C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC710E4E1;
	Wed, 15 May 2024 08:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9BoqpOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C59510E0D9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760915; x=1747296915;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7kPvLU7swKR57NyzhTX0TumeJg+m+ES9CixAWnDWQnY=;
 b=g9BoqpOdthf5c7HR4/uBonHf8QnlPaJyRvlYMvtlwKrlWL+XHfBKt90H
 wcGyZu7fO6SMbLtzVS9eP2u+lj63zsZwetlTrh0MkIWpsjegN2wLEGMXE
 p5N9CdTRJl8MuBf/qcYkvbD8aRLJE3dJnoXI0+YZ5flYQ0aCjm/HaxB7P
 hzp0jmrdhCaMm/9L+w4qv1n/YTvRCakC9ehxqmSLSf1KqntujmB8q86bF
 W+U86F7DNB7gL7L+ESLr3XlwwdO0Ha6Ls1owbW6hVNDAauLKT7ZY0RXkm
 MRiqYnmeGIRWqjZHnakJSvFvrWEXxNZiV9TgMrX09oGi2gnE87hs/HEU0 Q==;
X-CSE-ConnectionGUID: AcULc9iPReasVV7i8gAWYQ==
X-CSE-MsgGUID: B6jwmnO2RAy0xm1wAdA2+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193321"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193321"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:15 -0700
X-CSE-ConnectionGUID: vumztlotQXWMEOa2/K3MfA==
X-CSE-MsgGUID: 9bd3qonSRiqLDNxBpRT7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977482"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 17/21] drm/ttm: Support drm_exec locking for eviction and swapping
Date: Wed, 15 May 2024 10:14:45 +0200
Message-ID: <20240515081449.46646-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
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

---
 drivers/gpu/drm/ttm/ttm_bo.c      | 40 +++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 47 +++++++++++++++++++++++++------
 include/drm/ttm/ttm_bo.h          |  5 ++++
 3 files changed, 73 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e5a8eac9478a..103a26e51792 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,8 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -539,10 +541,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	};
 	long lret;
 
-	evict_walk.walk.trylock_only = true;
-	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
-	if (lret || !ticket)
-		goto out;
+	if (!ctx->exec || !IS_ENABLED(CONFIG_DEBUG_WW_MUTEX_SLOWPATH)) {
+		evict_walk.walk.trylock_only = true;
+		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+		if (lret || !(ticket || ctx->exec))
+			goto out;
+	}
 
 	/* If ticket-locking, repeat while we make progress. */
 	evict_walk.walk.trylock_only = false;
@@ -756,6 +760,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
+	struct drm_exec_snapshot snap;
 	struct ttm_resource *res;
 	struct ttm_place hop;
 	bool force_space;
@@ -769,17 +774,24 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
+	if (ctx->exec)
+		drm_exec_snapshot(ctx->exec, &snap);
+  
 	force_space = false;
 	do {
 		/* Check whether we need to move buffer. */
 		if (bo->resource &&
 		    ttm_resource_compatible(bo->resource, placement,
-					    force_space))
-			return 0;
+					    force_space)) {
+			ret = 0;
+			goto out;
+		}
 
 		/* Moving of pinned BOs is forbidden */
-		if (bo->pin_count)
-			return -EINVAL;
+		if (bo->pin_count) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/*
 		 * Determine where to move the buffer.
@@ -796,7 +808,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		if (ret == -ENOSPC)
 			continue;
 		if (ret)
-			return ret;
+			goto out;
 
 bounce:
 		ret = ttm_bo_handle_move_mem(bo, res, false, ctx, &hop);
@@ -808,11 +820,14 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		}
 		if (ret) {
 			ttm_resource_free(bo, &res);
-			return ret;
+			goto out;
 		}
 
 	} while (ret && force_space);
 
+	if (ctx->exec)
+		drm_exec_restore(ctx->exec, &snap);
+
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
 		return -ENOMEM;
@@ -826,6 +841,11 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 			return ret;
 	}
 	return 0;
+out:
+	if (ctx->exec)
+		drm_exec_restore(ctx->exec, &snap);
+
+	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_validate);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1d9c066689e8..f924c6ac78d5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -31,6 +31,8 @@
 
 #include <linux/vmalloc.h>
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -814,6 +816,25 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 	return ret;
 }
 
+static int ttm_lru_walk_execlock(struct ttm_lru_walk *walk,
+				 struct ttm_buffer_object *bo)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct drm_gem_object *obj = &bo->base;
+	struct drm_exec *exec = ctx->exec;
+	int ret;
+
+	if (walk->trylock_only)
+		ret = drm_exec_trylock_obj(exec, obj);
+	else
+		ret = drm_exec_lock_obj(exec, obj);
+
+	if (ret == -EALREADY && bo->base.resv == ctx->resv && ctx->allow_res_evict)
+		return 0;
+
+	return ret;
+}
+
 static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
 {
 	if (locked)
@@ -866,6 +887,7 @@ static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
 long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			       struct ttm_resource_manager *man, long target)
 {
+	struct drm_exec *exec = walk->ctx->exec;
 	struct ttm_resource_cursor cursor;
 	struct ttm_resource *res;
 	long sofar = 0;
@@ -881,11 +903,14 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		if (!bo || bo->resource != res)
 			continue;
 
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
-			bo_locked = true;
-		else if ((!walk->ticket) || walk->ctx->no_wait_gpu ||
-			 walk->trylock_only)
-			continue;
+		if (!exec) {
+			if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+				bo_locked = true;
+
+			else if (!walk->ticket || walk->ctx->no_wait_gpu ||
+				 walk->trylock_only)
+				continue;
+		}
 
 		if (!ttm_bo_get_unless_zero(bo)) {
 			ttm_lru_walk_unlock(bo, bo_needs_unlock);
@@ -896,12 +921,16 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		spin_unlock(&bdev->lru_lock);
 
 		lret = 0;
-		if (!bo_locked && walk->ticket)
-			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+		if (!bo_locked) {
+			if (exec)
+			        lret = ttm_lru_walk_execlock(walk, bo);
+			else
+				lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+		}
 
 		/*
 		 * Note that in between the release of the lru lock and the
-		 * ticketlock, the bo may have switched resource,
+		 * drm_exec_lock_obj / ticketlock, the bo may have switched resource,
 		 * and also memory type, since the resource may have been
 		 * freed and allocated again with a different memory type.
 		 * In that case, just skip it.
@@ -911,7 +940,7 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		ttm_lru_walk_unlock(bo, bo_needs_unlock);
 		ttm_bo_put(bo);
-		if (lret == -EBUSY)
+		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		if (lret < 0) {
 			sofar = lret;
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index da2bf3ca3ee3..0839f870b818 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -164,6 +164,8 @@ struct ttm_bo_kmap_obj {
 	struct ttm_buffer_object *bo;
 };
 
+struct drm_exec;
+
 /**
  * struct ttm_operation_ctx
  *
@@ -175,6 +177,8 @@ struct ttm_bo_kmap_obj {
  * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
+ * @exec: If part of a drm_exec transaction, pointer to the struct drm_exec.
+ * Null otherwise.
  * @bytes_moved: Statistics on how many bytes have been moved.
  *
  * Context for TTM operations like changing buffer placement or general memory
@@ -187,6 +191,7 @@ struct ttm_operation_ctx {
 	bool allow_res_evict;
 	bool force_alloc;
 	struct dma_resv *resv;
+	struct drm_exec *exec;
 	uint64_t bytes_moved;
 };
 
-- 
2.44.0

