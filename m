Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8055BE9A047
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E0F10E5EB;
	Wed, 18 Feb 2026 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iX4InNCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4358910E5EB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771429664; x=1802965664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Isy9dypYWRGE7hcMKpi0bVK+z8a2GYlFFCL21OJoe9U=;
 b=iX4InNCnGu6J96PjrmJ5qV7eg8lbqLyuluLnOg1nny7GmfXXMiW4Vef1
 08vfzKLrgJQHijaaqIyBSFCiOun7KnIpt0zy53KIFXLOU/NwbSw36mI1h
 HTzuT7vD1H7SDRTCVbVhUOsiD6XpOP7t7Cq5o4BJtXsvG/m011izR3GoF
 0j5XWoHZ5qFtLGhx6cUluKlJGHLE+eQ1L/001GpIC7I0deY6ADwpkJ4gB
 d4ei3UHorArFJK7jDWIs3BCQyLkE3aPVRnhApJLkZzwBAefQlBBASAbMy
 Xo6f5MsFEz87nqbm6iBmKwdmT9NyOHJ1c4j4LDe8M95FNsL3dd8VBaXbh Q==;
X-CSE-ConnectionGUID: IkglTanIReaesj6CnJuDSQ==
X-CSE-MsgGUID: KJX6ISFySSy7z9ekcNatvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83224410"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83224410"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:47:44 -0800
X-CSE-ConnectionGUID: M+2yp6G/S7izZGy0wzbVoA==
X-CSE-MsgGUID: GaEdGf/oQr2d2KisVoJq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212889145"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2026 07:47:41 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Date: Wed, 18 Feb 2026 15:47:31 +0000
Message-ID: <20260218154728.1508151-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
References: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

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
 drivers/gpu/drm/xe/xe_bb.c      | 72 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.h      |  7 ++-
 drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_sa.c      | 39 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  3 +
 5 files changed, 156 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..a991d9db8164 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,16 +59,64 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
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
+ * xe_bb_release() - Release and free a batch buffer structure
+ * @bb: Batch buffer structure to release
+ *
+ * Releases the sub-allocated buffer object associated with the batch buffer
+ * and frees the xe_bb structure memory.
+ */
+void xe_bb_release(struct xe_bb *bb)
+{
+	xe_sa_bo_release(bb->bo);
+	kfree(bb);
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
@@ -76,22 +124,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
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
index 2a8adc9a6dee..5778699149ec 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,12 +12,13 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
+struct xe_sa_manager;
 struct xe_sched_job;
-enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
+void xe_bb_release(struct xe_bb *bb);
+int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..d4cfc54d614b 100644
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
+
+		err = xe_bb_init(bb, bb_pool, batch_size);
+		if (err) {
+			xe_gt_err(gt, "BB allocation failed.\n");
+			xe_bb_release(bb);
+			return err;
+		}
 
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
-	if (IS_ERR(bb)) {
-		drm_err(&xe->drm, "BB allocation failed.\n");
-		err = PTR_ERR(bb);
-		return err;
-	}
+		batch_size_allocated = batch_size;
+		size = xe_bo_size(src_bo);
+		batch_size = 0;
 
-	batch_size_allocated = batch_size;
-	size = xe_bo_size(src_bo);
-	batch_size = 0;
+		/*
+		 * Emit PTE and copy commands here.
+		 * The CCS copy command can only support limited size. If the size to be
+		 * copied is more than the limit, divide copy into chunks. So, calculate
+		 * sizes here again before copy command is emitted.
+		 */
 
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
+		while (size) {
+			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+			u32 flush_flags = 0;
+			u64 ccs_ofs, ccs_size;
+			u32 ccs_pt;
 
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+			u32 avail_pts = max_mem_transfer_per_pass(xe) /
+					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		src_L0 = xe_migrate_res_sizes(m, &src_it);
+			src_L0 = xe_migrate_res_sizes(m, &src_it);
 
-		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
-					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      avail_pts);
+			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
+						      &src_L0_ofs, &src_L0_pt, 0, 0,
+						      avail_pts);
 
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
-					      &ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-		batch_size += EMIT_COPY_CCS_DW;
+			ccs_size = xe_device_ccs_bytes(xe, src_L0);
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+						      &ccs_pt, 0, avail_pts, avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+			batch_size += EMIT_COPY_CCS_DW;
 
-		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
+			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
 
-		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
-						  src_L0_ofs, dst_is_pltt,
-						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+							  src_L0_ofs, dst_is_pltt,
+							  src_L0, ccs_ofs, true);
+			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
 
-		size -= src_L0;
-	}
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
index b738102575d4..bdb52606aed3 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -175,6 +175,45 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
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
+ * xe_sa_bo_release() - Release memory for suballocation.
+ * @sa: The struct drm_suballoc.
+ */
+void xe_sa_bo_release(struct drm_suballoc *sa)
+{
+	drm_suballoc_release(sa);
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
index 05e9a4e00e78..156b6e6fa14b 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -38,6 +38,9 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
+void xe_sa_bo_release(struct drm_suballoc *sa);
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
-- 
2.43.0

