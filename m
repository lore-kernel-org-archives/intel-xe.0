Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04361E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDF110E695;
	Thu, 19 Feb 2026 10:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1DdSQW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DBF10E695
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771498489; x=1803034489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c4rhadYHZ5KIh3+VgkoQ7AvOVMtwuCHMdl3ESe2oZdM=;
 b=F1DdSQW5tWtGrHPtOS+2LXzC2SYIjvx/OluNb5LX6Mr1TjcBJUXTP0kb
 tZRx2sTj5FxrHfGtrZ0kT6aKKLTH/qbC69GsP3FHbF1wb5gxt3UB47mwN
 +JdxilJ9pxEZZis7BKnPzwiOUKZtFDb+ZN9aFyzIRDa0x9QgEdn+B67h9
 GP8hWs3bODT/dlCQGsIeBuv4BgbN0T45B0pTyQBNIE7+m65gF6tT5Kmv/
 9EPSdZAieCNl5OhYXYMhMyR21I85a+ieNyVFB2W+xHFa8i2J0J24eRlAi
 VR1plyaE6UFespg4yQHDgbDGbHnu2ojOteS/iTGl8K5g7Yiz9JwQDF2RZ g==;
X-CSE-ConnectionGUID: lMxjQ9jOQlenfL8wmZKfzQ==
X-CSE-MsgGUID: h6uVkn+cRGWG+wPP1z8EJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71604974"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71604974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:54:49 -0800
X-CSE-ConnectionGUID: 1O47sGa4QRGL0mLAaXwypg==
X-CSE-MsgGUID: wcnLGKeYQ3KaC96/TmNoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213163342"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2026 02:54:46 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Date: Thu, 19 Feb 2026 10:54:36 +0000
Message-ID: <20260219105433.2234194-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
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

*===============================================================*
*    WARNING: possible circular locking dependency detected	*
*---------------------------------------------------------------*
*								*
*      CPU0                    CPU1				*
*      ----                    ----				*
* lock(fs_reclaim);						*
*                              lock(&sa_manager->swap_guard);	*
*                              lock(fs_reclaim);		*
* lock(&sa_manager->swap_guard);				*
*								*
* *** DEADLOCK ***						*
*===============================================================*

To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
before taking lock and SA is initialized using xe_bb_init() preventing
reclaim from being invoked in this context.

Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>

---
V6 -> V7:
- Dropped R-B as some release sequence is changed.
- Dropped xe_bb_release() and used existing xe_bb_free().

V5 -> V6:
- Updated drm_suballoc_init() to drm_suballoc_insert(). (Maarten).

V4 -> V5:
- Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
  any more (Michal).

V3 -> V4:
- Fixed some nits (Michal).

V2 -> V3:
- Updated commit message (Matt, Thomas & Christian).
- Removed timeout logic from drm_suballoc_init(). (Thomas &
Christian).

V1 -> V2:
- Splitted drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
---
 drivers/gpu/drm/xe/xe_bb.c      | 59 ++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.h      |  6 +-
 drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_sa.c      | 30 ++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  2 +
 5 files changed, 132 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..b0aceaec2685 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,16 +59,51 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+/**
+ * xe_bb_alloc() - Allocate a new batch buffer structure
+ * @gt: the &xe_gt
+ *
+ * Allocates and initializes a new xe_bb structure with an associated
+ * uninitialized suballoc object.
+ *
+ * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+ */
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_sa_manager *bb_pool;
 	int err;
 
 	if (!bb)
 		return ERR_PTR(-ENOMEM);
+
+	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
+	if (IS_ERR(bb->bo)) {
+		err = PTR_ERR(bb->bo);
+		goto err;
+	}
+
+	return bb;
+
+err:
+	kfree(bb);
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
+ * @bb: Batch buffer structure to initialize
+ * @bb_pool: Suballoc memory pool to allocate from
+ * @dwords: Number of dwords to be allocated
+ *
+ * Initializes the batch buffer by allocating memory from the specified
+ * suballoc pool.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
+{
+	int err;
+
 	/*
 	 * We need to allocate space for the requested number of dwords &
 	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
@@ -76,22 +111,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 	 * is not over written when the last chunk of SA is allocated for BB.
 	 * So, this extra DW acts as a guard here.
 	 */
-
-	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
-	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
-
-	if (IS_ERR(bb->bo)) {
-		err = PTR_ERR(bb->bo);
-		goto err;
-	}
+	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
+	if (err)
+		return err;
 
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
index 2a8adc9a6dee..231870b24c2f 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,12 +12,12 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
+struct xe_sa_manager;
 struct xe_sched_job;
-enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
+int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..333af7b57ae9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -25,6 +25,7 @@
 #include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
+	bb = xe_bb_alloc(gt);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
 	bb_pool = ctx->mem.ccs_bb_pool;
-	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
-	xe_sa_bo_swap_shadow(bb_pool);
+	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
+		xe_sa_bo_swap_shadow(bb_pool);
 
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
-	if (IS_ERR(bb)) {
-		drm_err(&xe->drm, "BB allocation failed.\n");
-		err = PTR_ERR(bb);
-		return err;
-	}
+		err = xe_bb_init(bb, bb_pool, batch_size);
+		if (err) {
+			xe_gt_err(gt, "BB allocation failed.\n");
+			xe_bb_free(bb, NULL);
+			return err;
+		}
 
-	batch_size_allocated = batch_size;
-	size = xe_bo_size(src_bo);
-	batch_size = 0;
+		batch_size_allocated = batch_size;
+		size = xe_bo_size(src_bo);
+		batch_size = 0;
 
-	/*
-	 * Emit PTE and copy commands here.
-	 * The CCS copy command can only support limited size. If the size to be
-	 * copied is more than the limit, divide copy into chunks. So, calculate
-	 * sizes here again before copy command is emitted.
-	 */
-	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
-		u32 flush_flags = 0;
-		u64 ccs_ofs, ccs_size;
-		u32 ccs_pt;
+		/*
+		 * Emit PTE and copy commands here.
+		 * The CCS copy command can only support limited size. If the size to be
+		 * copied is more than the limit, divide copy into chunks. So, calculate
+		 * sizes here again before copy command is emitted.
+		 */
 
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+		while (size) {
+			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+			u32 flush_flags = 0;
+			u64 ccs_ofs, ccs_size;
+			u32 ccs_pt;
 
-		src_L0 = xe_migrate_res_sizes(m, &src_it);
+			u32 avail_pts = max_mem_transfer_per_pass(xe) /
+					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
-					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      avail_pts);
+			src_L0 = xe_migrate_res_sizes(m, &src_it);
 
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
-					      &ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-		batch_size += EMIT_COPY_CCS_DW;
+			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
+						      &src_L0_ofs, &src_L0_pt, 0, 0,
+						      avail_pts);
 
-		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
+			ccs_size = xe_device_ccs_bytes(xe, src_L0);
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+						      &ccs_pt, 0, avail_pts, avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+			batch_size += EMIT_COPY_CCS_DW;
 
-		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
 
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
-						  src_L0_ofs, dst_is_pltt,
-						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-		size -= src_L0;
-	}
+			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+							  src_L0_ofs, dst_is_pltt,
+							  src_L0, ccs_ofs, true);
+			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+
+			size -= src_L0;
+		}
 
-	xe_assert(xe, (batch_size_allocated == bb->len));
-	src_bo->bb_ccs[read_write] = bb;
+		xe_assert(xe, (batch_size_allocated == bb->len));
+		src_bo->bb_ccs[read_write] = bb;
+
+		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+		xe_sa_bo_sync_shadow(bb->bo);
+	}
 
-	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
-	xe_sa_bo_sync_shadow(bb->bo);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b738102575d4..c7ee952e8914 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -175,6 +175,36 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
+ * @gfp: gfp flags used for memory allocation.
+ *
+ * Allocate memory for an uninitialized suballoc object. Intended usage is
+ * allocate memory for suballoc object outside of a reclaim tainted context
+ * and then be initialized at a later time in a reclaim tainted context.
+ *
+ * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+ */
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
+{
+	return drm_suballoc_alloc(gfp);
+}
+
+/**
+ * xe_sa_bo_init() - Initialize a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @sa: The struct drm_suballoc.
+ * @size: number of bytes we want to suballocate.
+ *
+ * Try to make a suballocation on a pre-allocated suballoc object of size @size.
+ *
+ * Return: zero on success, errno on failure.
+ */
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
+{
+	return drm_suballoc_insert(&sa_manager->base, sa, size, true, 0);
+}
+
 /**
  * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
  * @sa_bo: the &drm_suballoc to flush
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 05e9a4e00e78..50218b0d1404 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -38,6 +38,8 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
-- 
2.43.0

