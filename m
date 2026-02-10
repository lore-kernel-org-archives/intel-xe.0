Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B811EA3F3A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 10:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1510E557;
	Tue, 10 Feb 2026 10:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1XAT8QD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9F610E558
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770721185; x=1802257185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JFWparwM6ERP9tdNtzxqDpWhKVdg3GhIHY2AVRVVcus=;
 b=R1XAT8QDaLmiUC0txnxNcS0hogrHx/8sCNQMET4CVUMvuVAdxUQ1CRRG
 GKLMoPqUds7rL/I1l5B+c/O4+5bbiW+H42osY4gm7ZeE5gGLyHZ3DQj5Z
 x66iNo6Ui0zJ+KLYa9lQT8p2kbZohWhsM6wuEWYIVfjuJ/j5WL431eesI
 cRY7U16c5jU+/iAMUipABnULzjqm87Jsuvr/7e4I9X2fCihUQIdHjKkie
 Q5gMFMrcrDdSwo2Z++V+YBJWKPXJ7ihJR1b4AaIKUWY7v2k/jqtfgXoXN
 Gnt7xz5Sk1qa7Bh3FFMDgs46q1whLu8teIJP5tk5qY2ABZZr8ZZfFd8DD w==;
X-CSE-ConnectionGUID: nyMkjkUBRky7LCnP/VpTqw==
X-CSE-MsgGUID: Ql+Vtzp3SCys7R4jLpjgqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71056513"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71056513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:59:45 -0800
X-CSE-ConnectionGUID: 3fo+OaasQfWbcd4SmpAiuQ==
X-CSE-MsgGUID: m964rJy7TMWRBzTIpV9+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242510363"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 02:59:42 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Date: Tue, 10 Feb 2026 10:59:32 +0000
Message-ID: <20260210105929.4089794-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
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

To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
before taking lock and SA is initialized using xe_bb_init() preventing
reclaim from being invoked in this context.

Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
V2 -> V3:
- Created new functions xe_sa_bo_alloc(), xe_sa_bo_release() and
xe_sa_bo_init(). (Thomas)
- Created new functions xe_bb_alloc(), xe_bb_release and
xe_bb_init(). (Thomas)
- Updated guard() to scoped_guard() in xe_migrate_ccs_rw_copy(). (Thomas)

V1 -> V2:
- Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
(Thomas).
---
 drivers/gpu/drm/xe/xe_bb.c      | 49 +++++++++++------
 drivers/gpu/drm/xe/xe_bb.h      |  7 ++-
 drivers/gpu/drm/xe/xe_migrate.c | 96 ++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_sa.c      | 40 ++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  3 ++
 5 files changed, 135 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..631ae564e719 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,16 +59,43 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_sa_manager *bb_pool;
 	int err;
 
 	if (!bb)
 		return ERR_PTR(-ENOMEM);
+
+	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
+	if (IS_ERR(bb->bo)) {
+		drm_err(&xe->drm, "Sub-allocator memory allocation failed with %ld\n",
+			PTR_ERR(bb->bo));
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
+void xe_bb_release(struct xe_bb *bb)
+{
+	if (bb->bo)
+		xe_sa_bo_release(bb->bo);
+
+	kfree(bb);
+}
+
+int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,
+	       struct xe_sa_manager *bb_pool, u32 dwords)
+{
+	int err;
+
 	/*
 	 * We need to allocate space for the requested number of dwords &
 	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
@@ -76,22 +103,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
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
index 2a8adc9a6dee..3eb80925bfd1 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,11 +13,14 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
+struct xe_sa_manager;
 enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
+void xe_bb_release(struct xe_bb *bb);
+int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,
+	       struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..c858eaa70e3e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1148,65 +1148,75 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
-	bb_pool = ctx->mem.ccs_bb_pool;
-	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
-	xe_sa_bo_swap_shadow(bb_pool);
-
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
+	bb = xe_bb_alloc(gt);
 	if (IS_ERR(bb)) {
-		drm_err(&xe->drm, "BB allocation failed.\n");
 		err = PTR_ERR(bb);
 		return err;
 	}
 
-	batch_size_allocated = batch_size;
-	size = xe_bo_size(src_bo);
-	batch_size = 0;
+	bb_pool = ctx->mem.ccs_bb_pool;
+	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
+		xe_sa_bo_swap_shadow(bb_pool);
+
+		err = xe_bb_init(gt, bb, bb_pool, batch_size);
+		if (err) {
+			drm_err(&xe->drm, "BB allocation failed.\n");
+			xe_bb_release(bb);
+			return err;
+		}
 
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
+		batch_size_allocated = batch_size;
+		size = xe_bo_size(src_bo);
+		batch_size = 0;
 
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+		/*
+		 * Emit PTE and copy commands here.
+		 * The CCS copy command can only support limited size. If the size to be
+		 * copied is more than the limit, divide copy into chunks. So, calculate
+		 * sizes here again before copy command is emitted.
+		 */
 
-		src_L0 = xe_migrate_res_sizes(m, &src_it);
+		while (size) {
+			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+			u32 flush_flags = 0;
+			u64 ccs_ofs, ccs_size;
+			u32 ccs_pt;
 
-		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
-					      &src_L0_ofs, &src_L0_pt, 0, 0,
-					      avail_pts);
+			u32 avail_pts = max_mem_transfer_per_pass(xe) /
+					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
-					      &ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-		batch_size += EMIT_COPY_CCS_DW;
+			src_L0 = xe_migrate_res_sizes(m, &src_it);
+
+			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
+						      &src_L0_ofs, &src_L0_pt, 0, 0,
+						      avail_pts);
+
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
index b738102575d4..59d0187b3e82 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -175,6 +175,46 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_alloc - Allocate uninitialized suballoc object.
+ * @gfp: gfp flags used for memory allocation.
+ *
+ * Allocate memory for an uninitialized suballoc object. Intended usage is
+ * allocate memory for suballoc object outside of a reclaim tainted context
+ * and then be initialized at a later time in a reclaim tainted context.
+ *
+ * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+ */
+
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
+{
+	return drm_suballoc_alloc(gfp);
+}
+
+/**
+ * xe_sa_bo_release - Release memory for suballocation.
+ * @sa: The struct drm_suballoc.
+ */
+void xe_sa_bo_release(struct drm_suballoc *sa)
+{
+	drm_suballoc_release(sa);
+}
+
+/**
+ * xe_sa_bo_init - Initialize a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @sa: The struct drm_suballoc.
+ * @size: number of bytes we want to suballocate.
+ *
+ * Try to make a suballocation on a pre-allocated suballoc object of size @size.
+ *
+ * Return: zero on success, errno on failure.
+ */
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, u32 size)
+{
+	return drm_suballoc_init(&sa_manager->base, sa, size, true, 0);
+}
+
 /**
  * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
  * @sa_bo: the &drm_suballoc to flush
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 05e9a4e00e78..19d4b698a7d7 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -38,6 +38,9 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
+void xe_sa_bo_release(struct drm_suballoc *sa);
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, u32 size);
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
-- 
2.43.0

