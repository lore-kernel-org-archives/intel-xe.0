Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2FEC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 09:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371C210E71D;
	Wed,  5 Mar 2025 09:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLTFqgGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC8E10E719
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741166557; x=1772702557;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FQhDr5l/taw//xU2lOPdNTTShFpBcFZeTNAA83KgnlM=;
 b=KLTFqgGdBx4n0arvKTrjYTYVves90rp4BjFfbKlv1J3TMG6iV3qLPhTF
 rlJEsAdLWUVj2pu2SZEIHO0M/Lsr7khXDB89Grh19xqWN1xTPHdYT2mQ2
 aVLnlakOof+XlDvcGzKI8i1h954FHy0jsRdmNjsDh/EOSFyHDv7I1qO2K
 ikc4J9Ub+snKD9hA2Y2iyLvDu0ewa5bPEaFNQBe/JF7BywWGC5oWzQyVV
 Al9U/Mki27Ble+LU9In3Y574a4G433K1+bwh02XxbkSYLTWHNllFq152d
 AealGz2FWf4XGhIjqoz8OUFUrgaqrhBVSvB62f+s4dOTtEKGSKv86YUSI Q==;
X-CSE-ConnectionGUID: svsLsVTcQMSl6PCrT4UUhQ==
X-CSE-MsgGUID: R5ossX/LTqKGSM8NAtsUFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64557174"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="64557174"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:37 -0800
X-CSE-ConnectionGUID: PW3noE8kQVGjmxDGug4DkQ==
X-CSE-MsgGUID: jzOxYiouQkyTL8+7DysqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123569525"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:36 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v17 5/7] drm/ttm: Add helpers for shrinking
Date: Wed,  5 Mar 2025 10:22:18 +0100
Message-ID: <20250305092220.123405-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
References: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
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

Add a number of helpers for shrinking that access core TTM and
core MM functionality in a way that make them unsuitable for
driver open-coding.

v11:
- New patch (split off from previous) and additional helpers.
v13:
- Adapt to ttm_backup interface change.
- Take resource off LRU when backed up.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 107 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c      |  29 ++++++++
 include/drm/ttm/ttm_bo.h          |  21 ++++++
 include/drm/ttm/ttm_tt.h          |   2 +
 4 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0cac02a9764c..15cab9bda17f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -28,7 +28,7 @@
 /*
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
-
+#include <linux/swap.h>
 #include <linux/vmalloc.h>
 
 #include <drm/ttm/ttm_bo.h>
@@ -1052,3 +1052,108 @@ struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs
 	return bo ? bo : ttm_bo_lru_cursor_next(curs);
 }
 EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
+
+/**
+ * ttm_bo_shrink() - Helper to shrink a ttm buffer object.
+ * @ctx: The struct ttm_operation_ctx used for the shrinking operation.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0)
+		return lret;
+
+	if (bo->bulk_move) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_del_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+
+	if (lret <= 0 && bo->bulk_move) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_add_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	if (lret < 0 && lret != -EINTR)
+		return -EBUSY;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_shrink);
+
+/**
+ * ttm_bo_shrink_suitable() - Whether a bo is suitable for shinking
+ * @ctx: The struct ttm_operation_ctx governing the shrinking.
+ * @bo: The candidate for shrinking.
+ *
+ * Check whether the object, given the information available to TTM,
+ * is suitable for shinking, This function can and should be used
+ * before attempting to shrink an object.
+ *
+ * Return: true if suitable. false if not.
+ */
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+{
+	return bo->ttm && ttm_tt_is_populated(bo->ttm) && !bo->pin_count &&
+		(!ctx->no_wait_gpu ||
+		 dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP));
+}
+EXPORT_SYMBOL(ttm_bo_shrink_suitable);
+
+/**
+ * ttm_bo_shrink_avoid_wait() - Whether to avoid waiting for GPU
+ * during shrinking
+ *
+ * In some situations, like direct reclaim, waiting (in particular gpu waiting)
+ * should be avoided since it may stall a system that could otherwise make progress
+ * shrinking something else less time consuming.
+ *
+ * Return: true if gpu waiting should be avoided, false if not.
+ */
+bool ttm_bo_shrink_avoid_wait(void)
+{
+	return !current_is_kswapd();
+}
+EXPORT_SYMBOL(ttm_bo_shrink_avoid_wait);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 00b7c28f2329..df0aa6c4b8b8 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -531,3 +531,32 @@ unsigned long ttm_tt_pages_limit(void)
 	return ttm_pages_limit;
 }
 EXPORT_SYMBOL(ttm_tt_pages_limit);
+
+/**
+ * ttm_tt_setup_backup() - Allocate and assign a backup structure for a ttm_tt
+ * @tt: The ttm_tt for wich to allocate and assign a backup structure.
+ *
+ * Assign a backup structure to be used for tt backup. This should
+ * typically be done at bo creation, to avoid allocations at shrinking
+ * time.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int ttm_tt_setup_backup(struct ttm_tt *tt)
+{
+	struct ttm_backup *backup =
+		ttm_backup_shmem_create(((loff_t)tt->num_pages) << PAGE_SHIFT);
+
+	if (WARN_ON_ONCE(!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)))
+		return -EINVAL;
+
+	if (IS_ERR(backup))
+		return PTR_ERR(backup);
+
+	if (tt->backup)
+		ttm_backup_fini(tt->backup);
+
+	tt->backup = backup;
+	return 0;
+}
+EXPORT_SYMBOL(ttm_tt_setup_backup);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 1509268849c0..903cd1030110 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -225,6 +225,27 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		   const struct ttm_bo_shrink_flags flags);
+
+bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx);
+
+bool ttm_bo_shrink_avoid_wait(void);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index c736c01ac2ca..13cf47f3322f 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -298,6 +298,8 @@ long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
 int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
 		   const struct ttm_operation_ctx *ctx);
 
+int ttm_tt_setup_backup(struct ttm_tt *tt);
+
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
 
-- 
2.48.1

