Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y0PsLCpY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C98112868;
	Thu, 22 Oct 2026 17:41:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9E11287A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690872; x=1824226872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/byocKX8y2bf6HFzM5IoHCM83n15xfks9ZRPUB8kH6U=;
 b=Y0PsLCpYoihPaZJHhizWwm7CqaWJRQRW6HNthfERjWPRHxSUh4K4mHqU
 f3f841U5eoBsEtpKY9+G/ItmTmlXGaL+Yast4GiaJG6G4pBJxMSQFkkHY
 dwRot5k3Y7cxl9JNLJRu0DLLdB1PLVXdd/9UeLj53d85uI0n0N/G2yeL5
 z1W38FUtACYrUfM+EYJn9FDcIBuLQGjWs5dIuXcz5yCp2R42tBmdXdeKC
 jOw6C/ydYZ/9tzEeholihudUfHeb0l6T6hx5oU+mNBWxS6o+1+zkNMLzn
 zmhcTd8xJMWvzy+rz4mHF6mUQ/4Yid7CO/yosOOmoopesUHb2zyhVkhpA Q==;
X-CSE-ConnectionGUID: UpVGUM+oR1aIzEVbXD2zDA==
X-CSE-MsgGUID: gl/xuRPgR96EfWYk7OBDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1435963"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1435963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:12 -0700
X-CSE-ConnectionGUID: 3k5R9u7eR+C9ynIRMe6AZA==
X-CSE-MsgGUID: nySVkRogTPOxboduRUmzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3366122"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/sa: remove unused shadow BO and two-step bb helpers
Date: Thu, 22 Oct 2026 18:41:01 +0100
Message-ID: <20261022174058.226432-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022174058.226432-4-matthew.auld@intel.com>
References: <20261022174058.226432-4-matthew.auld@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 1460eae74fbb ("drm/xe/vf: Use drm mm instead of drm sa for
CCS read/write"), the VF CCS save/restore batchbuffers come from
xe_mem_pool rather than xe_sa/xe_bb. That left a fair bit of
suballocator code with no callers:

  - the two-step bb helpers: xe_bb_alloc(), xe_bb_init(),
    xe_sa_bo_alloc() and xe_sa_bo_init()
  - the shadow BO support: XE_SA_BO_MANAGER_FLAG_SHADOW,
    xe_sa_bo_swap_shadow(), xe_sa_bo_sync_shadow() and
    xe_sa_bo_swap_guard()

Remove it, along with the now unused flags argument of
__xe_sa_bo_manager_init().

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c       |  62 -------------------
 drivers/gpu/drm/xe/xe_bb.h       |   3 -
 drivers/gpu/drm/xe/xe_guc_buf.c  |   2 +-
 drivers/gpu/drm/xe/xe_sa.c       | 103 +------------------------------
 drivers/gpu/drm/xe/xe_sa.h       |  22 +------
 drivers/gpu/drm/xe/xe_sa_types.h |   3 -
 6 files changed, 4 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..4d940f655ce8 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,68 +59,6 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-/**
- * xe_bb_alloc() - Allocate a new batch buffer structure
- * @gt: the &xe_gt
- *
- * Allocates and initializes a new xe_bb structure with an associated
- * uninitialized suballoc object.
- *
- * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
- */
-struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
-{
-	struct xe_bb *bb = kmalloc_obj(*bb);
-	int err;
-
-	if (!bb)
-		return ERR_PTR(-ENOMEM);
-
-	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
-	if (IS_ERR(bb->bo)) {
-		err = PTR_ERR(bb->bo);
-		goto err;
-	}
-
-	return bb;
-
-err:
-	kfree(bb);
-	return ERR_PTR(err);
-}
-
-/**
- * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
- * @bb: Batch buffer structure to initialize
- * @bb_pool: Suballoc memory pool to allocate from
- * @dwords: Number of dwords to be allocated
- *
- * Initializes the batch buffer by allocating memory from the specified
- * suballoc pool.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
-{
-	int err;
-
-	/*
-	 * We need to allocate space for the requested number of dwords &
-	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
-	 * is submitted to HW, we need to make sure that the last instruction
-	 * is not over written when the last chunk of SA is allocated for BB.
-	 * So, this extra DW acts as a guard here.
-	 */
-	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
-	if (err)
-		return err;
-
-	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
-	bb->len = 0;
-
-	return 0;
-}
-
 static struct xe_sched_job *
 __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 231870b24c2f..b5cc65506696 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,12 +12,9 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
-struct xe_sa_manager;
 struct xe_sched_job;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
-int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 11f77decd8d1..7a8efb62df60 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -29,7 +29,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index d9c2b28b08c2..71645b01fdec 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -29,7 +29,6 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 		kvfree(sa_manager->cpu_ptr);
 
 	sa_manager->bo = NULL;
-	sa_manager->shadow = NULL;
 }
 
 /**
@@ -38,14 +37,12 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
  * @size: number of bytes to allocate
  * @guard: number of bytes to exclude from suballocations
  * @align: alignment for each suballocated chunk
- * @flags: flags for suballocator
  *
  * Prepares the suballocation manager for suballocations.
  *
  * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
  */
-struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
-					      u32 guard, u32 align, u32 flags)
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sa_manager *sa_manager;
@@ -82,32 +79,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 	}
 
-	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
-		struct xe_bo *shadow;
-
-		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
-		if (ret)
-			return ERR_PTR(ret);
-
-		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-			fs_reclaim_acquire(GFP_KERNEL);
-			might_lock(&sa_manager->swap_guard);
-			fs_reclaim_release(GFP_KERNEL);
-		}
-
-		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
-						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_GGTT_INVALIDATE |
-						      XE_BO_FLAG_PINNED_NORESTORE);
-		if (IS_ERR(shadow)) {
-			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
-				size / SZ_1K, shadow);
-			return ERR_CAST(shadow);
-		}
-		sa_manager->shadow = shadow;
-	}
-
 	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
 				       sa_manager);
@@ -117,48 +88,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 	return sa_manager;
 }
 
-/**
- * xe_sa_bo_swap_shadow() - Swap the SA BO with shadow BO.
- * @sa_manager: the XE sub allocator manager
- *
- * Swaps the sub-allocator primary buffer object with shadow buffer object.
- *
- * Return: None.
- */
-void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
-{
-	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
-
-	xe_assert(xe, sa_manager->shadow);
-	lockdep_assert_held(&sa_manager->swap_guard);
-
-	swap(sa_manager->bo, sa_manager->shadow);
-	if (!sa_manager->bo->vmap.is_iomem)
-		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
-}
-
-/**
- * xe_sa_bo_sync_shadow() - Sync the SA Shadow BO with primary BO.
- * @sa_bo: the sub-allocator buffer object.
- *
- * Synchronize sub-allocator shadow buffer object with primary buffer object.
- *
- * Return: None.
- */
-void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
-{
-	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
-	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
-
-	xe_assert(xe, sa_manager->shadow);
-	lockdep_assert_held(&sa_manager->swap_guard);
-
-	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
-			 drm_suballoc_soffset(sa_bo),
-			 xe_sa_bo_cpu_addr(sa_bo),
-			 drm_suballoc_size(sa_bo));
-}
-
 /**
  * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
  * @sa_manager: the &xe_sa_manager
@@ -182,36 +111,6 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, false, 0);
 }
 
-/**
- * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
- * @gfp: gfp flags used for memory allocation.
- *
- * Allocate memory for an uninitialized suballoc object. Intended usage is
- * allocate memory for suballoc object outside of a reclaim tainted context
- * and then be initialized at a later time in a reclaim tainted context.
- *
- * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
- */
-struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
-{
-	return drm_suballoc_alloc(gfp);
-}
-
-/**
- * xe_sa_bo_init() - Initialize a suballocation.
- * @sa_manager: pointer to the sa_manager
- * @sa: The struct drm_suballoc.
- * @size: number of bytes we want to suballocate.
- *
- * Try to make a suballocation on a pre-allocated suballoc object of size @size.
- *
- * Return: zero on success, errno on failure.
- */
-int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
-{
-	return drm_suballoc_insert(&sa_manager->base, sa, size, true, 0);
-}
-
 /**
  * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
  * @sa_bo: the &drm_suballoc to flush
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 50218b0d1404..1be744350836 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -14,14 +14,12 @@
 struct dma_fence;
 struct xe_tile;
 
-#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
-struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
-					      u32 guard, u32 align, u32 flags);
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
 struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
-	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
+	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
 }
 
 /**
@@ -38,8 +36,6 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
-struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
-int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
@@ -73,18 +69,4 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
 		drm_suballoc_soffset(sa);
 }
 
-void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
-void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
-
-/**
- * xe_sa_bo_swap_guard() - Retrieve the SA BO swap guard within sub-allocator.
- * @sa_manager: the &xe_sa_manager
- *
- * Return: Sub alloctor swap guard mutex.
- */
-static inline struct mutex *xe_sa_bo_swap_guard(struct xe_sa_manager *sa_manager)
-{
-	return &sa_manager->swap_guard;
-}
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
index 1085c9c37d6b..cb7238799dcb 100644
--- a/drivers/gpu/drm/xe/xe_sa_types.h
+++ b/drivers/gpu/drm/xe/xe_sa_types.h
@@ -12,9 +12,6 @@ struct xe_bo;
 struct xe_sa_manager {
 	struct drm_suballoc_manager base;
 	struct xe_bo *bo;
-	struct xe_bo *shadow;
-	/** @swap_guard: Timeline guard updating @bo and @shadow */
-	struct mutex swap_guard;
 	void *cpu_ptr;
 	bool is_iomem;
 };
-- 
2.56.0

