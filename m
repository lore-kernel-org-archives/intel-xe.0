Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1BFE9D410
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 16:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB7510E6D0;
	Wed,  4 Feb 2026 16:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQD5XXWE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4728C10E6D0
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223624; x=1801759624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2DDD/ilorNLzRMHYv7p2QUZDPoUUfHq7d+ChB0kozto=;
 b=MQD5XXWE85megVZag6QSDOIg7aAzdKWodeq/B1ae8NgT8vj1YCe7zdVx
 Usg8KM/ASJahH6/DKCy7Lgwt0UJIQl8LZpifuKsRThW9sIKMATUa8QYwM
 JhLC4oSr2INdj923ysdzTmTWIjRV9CaG6wzLw3egmmkrZSORVekSaPPvt
 0SUKqYkMvKeU/MRQEuSbvMb1KdZBOoIApdJG6UbQ6c+vVSUDU/CQm5HnC
 xITRsbVR0AAFgHoLHJWugXmgjipH0IBbDs0aOM7RhvwZPy3rjs0aVTh6j
 vImwGtWQZqf1KH2TPDXAgqxlkpiIK5l27OrQARW7JOhMydfrZbkiDabji A==;
X-CSE-ConnectionGUID: PpEg6jmWRHuJfPregOdtZw==
X-CSE-MsgGUID: VE1J6INTQgKDBvRVitNa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70433623"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70433623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:47:04 -0800
X-CSE-ConnectionGUID: 92Va9FOeRFSMGWGsN4CGTw==
X-CSE-MsgGUID: WvFvIydNTNy/GASUmGCBAA==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 08:47:02 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 3/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Date: Wed,  4 Feb 2026 16:46:46 +0000
Message-ID: <20260204164642.3509298-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
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

CCS save/restore batch buffers are attached during BO allocation and
detached during BO teardown. The shrinker triggers xe_bo_move(), which is
used for both allocation and deletion paths.

When BO allocation and shrinking occur concurrently, a circular locking
dependency involving fs_reclaim and swap_guard can occur, leading to a
deadlock such as:

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------

      CPU0                    CPU1
      ----                    ----
 lock(fs_reclaim);
                              lock(&sa_manager->swap_guard);
                              lock(fs_reclaim);
 lock(&sa_manager->swap_guard);

 *** DEADLOCK ***
=====================================================

To avoid this, the BB pointer allocation is separated from xe_bb_ccs_new(),
used drm_suballoc_alloc() for SA allocation and drm_suballoc_init() for BB
allocation preventing reclaim from being invoked in this context.

Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
V1 -> V2:
- Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
(Thomas).
---
 drivers/gpu/drm/xe/xe_bb.c      | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_bb.h      |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_sa.c      | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      | 19 +++++++++++++++++++
 5 files changed, 78 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..9a04d0e814d3 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,16 +59,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct drm_suballoc *sa,
+		  u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
 {
-	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_sa_manager *bb_pool;
+	int timeout = HZ;
 	int err;
 
-	if (!bb)
-		return ERR_PTR(-ENOMEM);
 	/*
 	 * We need to allocate space for the requested number of dwords &
 	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
@@ -78,20 +76,16 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 	 */
 
 	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
-	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
+	err = xe_sa_bo_new_init(bb_pool, sa, 4 * (dwords + 1), timeout);
 
-	if (IS_ERR(bb->bo)) {
-		err = PTR_ERR(bb->bo);
-		goto err;
-	}
+	if (err)
+		return err;
 
+	bb->bo = sa;
 	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
 	bb->len = 0;
 
-	return bb;
-err:
-	kfree(bb);
-	return ERR_PTR(err);
+	return 0;
 }
 
 static struct xe_sched_job *
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 2a8adc9a6dee..3da4652cf0b0 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -16,8 +16,8 @@ struct xe_sched_job;
 enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct drm_suballoc *sa,
+		  u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..15d73814a08a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1109,6 +1109,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	struct xe_sriov_vf_ccs_ctx *ctx;
 	struct xe_sa_manager *bb_pool;
 	u64 size = xe_bo_size(src_bo);
+	struct drm_suballoc *sa;
 	struct xe_bb *bb = NULL;
 	u64 src_L0, src_L0_ofs;
 	u32 src_L0_pt;
@@ -1148,15 +1149,28 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
+	bb = kmalloc(sizeof(*bb), GFP_KERNEL);
+	if (!bb) {
+		err = -ENOMEM;
+		goto err_bb;
+	}
+
+	sa = drm_suballoc_alloc(GFP_KERNEL);
+	if (IS_ERR(sa)) {
+		drm_err(&xe->drm, "Sub-allocator memory allocation failed with %ld\n",
+			PTR_ERR(sa));
+		err = PTR_ERR(sa);
+		goto err_sa;
+	}
+
 	bb_pool = ctx->mem.ccs_bb_pool;
 	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
 	xe_sa_bo_swap_shadow(bb_pool);
 
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
-	if (IS_ERR(bb)) {
+	err = xe_bb_ccs_new(gt, bb, sa, batch_size, read_write);
+	if (err) {
 		drm_err(&xe->drm, "BB allocation failed.\n");
-		err = PTR_ERR(bb);
-		return err;
+		goto err_bb_ccs;
 	}
 
 	batch_size_allocated = batch_size;
@@ -1208,6 +1222,13 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
 	xe_sa_bo_sync_shadow(bb->bo);
 	return 0;
+
+err_bb_ccs:
+	drm_suballoc_release(sa);
+err_sa:
+	kfree(bb);
+err_bb:
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 5efbb5a09f77..2cfe6a353299 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -181,6 +181,30 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * __xe_sa_bo_new_init() - Make a suballocation with given SA.
+ * @sa_manager: the &xe_sa_manager
+ * @sa : Uninitalized sub allocator
+ * @size: number of bytes we want to suballocate
+ * @timeout: Timeout in jiffies waiting for allocation.
+ *
+ * Try to make a suballocation of size @size.
+ *
+ * Return: zero on success, errno on failure.
+ */
+int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa,
+			u32 size, int timeout)
+{
+	/*
+	 * BB to large, return -ENOBUFS indicating user should split
+	 * array of binds into smaller chunks.
+	 */
+	if (size > sa_manager->base.size)
+		return -ENOBUFS;
+
+	return drm_suballoc_init(&sa_manager->base, sa, size, true, 0, timeout);
+}
+
 /**
  * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
  * @sa_bo: the &drm_suballoc to flush
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 05e9a4e00e78..9cb8722779a4 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -18,6 +18,8 @@ struct xe_tile;
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 					      u32 guard, u32 align, u32 flags);
 struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
+int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa,
+			u32 size, int timeout);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
@@ -38,6 +40,23 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
+/**
+ * xe_sa_bo_new_init() - Make a suballocation.
+ * @sa_manager: the &xe_sa_manager
+ * @sa : Uninitialized sub-allocator
+ * @size: number of bytes we want to suballocate
+ * @timeout: Time to a wait suballocation to become available.
+ *
+ * Try to make a suballocation of size @size.
+ *
+ * Return: zero on success, errno on failure.
+ */
+static inline int xe_sa_bo_new_init(struct xe_sa_manager *sa_manager,
+				    struct drm_suballoc *sa, u32 size, int timeout)
+{
+	return __xe_sa_bo_new_init(sa_manager, sa, size, timeout);
+}
+
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
-- 
2.43.0

