Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2AC108B911
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BDC10EA9A;
	Fri, 20 Mar 2026 12:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBImB6AR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9B210EA9A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774008717; x=1805544717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6mySXtirJGLK10ffv7ViN3yFg8JZfXMpdbNNpEYawIs=;
 b=IBImB6AR4Ua1eY2RphgD0ETJEHCJ1O9Nu/PWOCqHb332zlwInmo/A8Q+
 fAfi6cAacU1+eCXyswtuntxIwzUa7UjM8/ckObWI6eaB18coRWD5yJSx6
 I4lq7cysvtKFJz98S4km/Dchg875Ej+qjNNRFpWLdliZ9PyLLHO2UblG2
 6Xf1PWZ1ulv1Ufff0ARbGpmCAjpkvCqEXLzeMT/zMBhf9U55k1/2nrd2D
 FSrdoioKL9l9SQqzQnkaU9yQzFScKSH+WnlmE6nSgqW3BUaenOwhWOhnS
 PzMV/i10xohPr3jSmiGXoX+AIXUZJ+gBawJ9Wcuns1SjExDiGiRVMVIk0 A==;
X-CSE-ConnectionGUID: w9GFNOu9RcG4OEtKOrFErA==
X-CSE-MsgGUID: /fQCk0gYQvKRo23Vi5TPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85717818"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="85717818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:11:51 -0700
X-CSE-ConnectionGUID: 5Y317K4wTsqL/zujSvAlqw==
X-CSE-MsgGUID: qiAg9TEaSBevP0h9SVlfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227399291"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 05:11:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS read/write
Date: Fri, 20 Mar 2026 12:12:31 +0000
Message-ID: <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
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

The suballocator algorithm tracks a hole cursor at the last allocation
and tries to allocate after it. This is optimized for fence-ordered
progress, where older allocations are expected to become reusable first.

In fence-enabled mode, that ordering assumption holds. In fence-disabled
mode, allocations may be freed in arbitrary order, so limiting allocation
to the current hole window can miss valid free space and fail allocations
despite sufficient total space.

Use DRM memory manager instead of sub-allocator to get rid of this issue
as CCS read/write operations do not use fences.

Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
Used drm mm instead of drm sa based on comments from
https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
---
 drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
 drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
 4 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..4c4f15c5648e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -18,6 +18,7 @@
 #include "xe_ggtt_types.h"
 
 struct xe_device;
+struct xe_drm_mm_bb;
 struct xe_vm;
 
 #define XE_BO_MAX_PLACEMENTS	3
@@ -88,7 +89,7 @@ struct xe_bo {
 	bool ccs_cleared;
 
 	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
-	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
+	struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fc918b4fba54..2fefd306cb2e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -22,6 +22,7 @@
 #include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_drm_mm.h"
 #include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
+	struct xe_drm_mm_manager *bb_pool;
 	struct xe_sriov_vf_ccs_ctx *ctx;
-	struct xe_sa_manager *bb_pool;
+	struct xe_drm_mm_bb *bb = NULL;
 	u64 size = xe_bo_size(src_bo);
-	struct xe_bb *bb = NULL;
 	u64 src_L0, src_L0_ofs;
+	struct xe_bb xe_bb_tmp;
 	u32 src_L0_pt;
 	int err;
 
@@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
-	bb = xe_bb_alloc(gt);
+	bb = xe_drm_mm_bb_alloc();
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
 	bb_pool = ctx->mem.ccs_bb_pool;
-	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
-		xe_sa_bo_swap_shadow(bb_pool);
+	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
+		xe_drm_mm_bo_swap_shadow(bb_pool);
 
-		err = xe_bb_init(bb, bb_pool, batch_size);
+		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
 		if (err) {
 			xe_gt_err(gt, "BB allocation failed.\n");
-			xe_bb_free(bb, NULL);
+			kfree(bb);
 			return err;
 		}
 
@@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size = xe_bo_size(src_bo);
 		batch_size = 0;
 
+		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
 		/*
 		 * Emit PTE and copy commands here.
 		 * The CCS copy command can only support limited size. If the size to be
@@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
 			batch_size += EMIT_COPY_CCS_DW;
 
-			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
+			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
 
-			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
+			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
-			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
+							      flush_flags);
+			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
 							  src_L0_ofs, dst_is_pltt,
 							  src_L0, ccs_ofs, true);
-			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
+			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
+							      flush_flags);
 
 			size -= src_L0;
 		}
 
-		xe_assert(xe, (batch_size_allocated == bb->len));
+		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
+		bb->len = xe_bb_tmp.len;
 		src_bo->bb_ccs[read_write] = bb;
 
 		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
-		xe_sa_bo_sync_shadow(bb->bo);
+		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
 	}
 
 	return 0;
@@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
 {
-	struct xe_bb *bb = src_bo->bb_ccs[read_write];
+	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
 	struct xe_device *xe = xe_bo_device(src_bo);
+	struct xe_drm_mm_manager *bb_pool;
 	struct xe_sriov_vf_ccs_ctx *ctx;
-	struct xe_sa_manager *bb_pool;
 	u32 *cs;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
@@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 	ctx = &xe->sriov.vf.ccs.contexts[read_write];
 	bb_pool = ctx->mem.ccs_bb_pool;
 
-	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
-	xe_sa_bo_swap_shadow(bb_pool);
-
-	cs = xe_sa_bo_cpu_addr(bb->bo);
-	memset(cs, MI_NOOP, bb->len * sizeof(u32));
-	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
+		xe_drm_mm_bo_swap_shadow(bb_pool);
 
-	xe_sa_bo_sync_shadow(bb->bo);
+		cs = bb_pool->cpu_addr + bb->node.start;
+		memset(cs, MI_NOOP, bb->len * sizeof(u32));
+		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
 
-	xe_bb_free(bb, NULL);
-	src_bo->bb_ccs[read_write] = NULL;
+		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
+		xe_drm_mm_bb_free(bb);
+		src_bo->bb_ccs[read_write] = NULL;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index db023fb66a27..6fb4641c6f0f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -8,6 +8,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_mm.h"
 #include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_sriov_vf.h"
@@ -16,7 +17,6 @@
 #include "xe_lrc.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
-#include "xe_sa.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
@@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
 
 static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 {
+	struct xe_drm_mm_manager *drm_mm_manager;
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_sa_manager *sa_manager;
 	u64 bb_pool_size;
 	int offset, err;
 
@@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
 		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
 
-	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
-					     XE_SA_BO_MANAGER_FLAG_SHADOW);
-
-	if (IS_ERR(sa_manager)) {
-		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
-			     sa_manager);
-		err = PTR_ERR(sa_manager);
+	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
+						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
+	if (IS_ERR(drm_mm_manager)) {
+		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
+			     drm_mm_manager);
+		err = PTR_ERR(drm_mm_manager);
 		return err;
 	}
 
 	offset = 0;
-	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
+	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
 		      bb_pool_size);
-	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
+	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
 		      bb_pool_size);
 
 	offset = bb_pool_size - sizeof(u32);
-	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
-	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
+	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
+	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
 
-	ctx->mem.ccs_bb_pool = sa_manager;
+	ctx->mem.ccs_bb_pool = drm_mm_manager;
 
 	return 0;
 }
 
 static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 {
-	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
+	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 	u32 dw[10], i = 0;
 
@@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
 void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
 {
-	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
+	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
 
@@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	struct xe_sriov_vf_ccs_ctx *ctx;
+	struct xe_drm_mm_bb *bb;
 	struct xe_tile *tile;
-	struct xe_bb *bb;
 	int err = 0;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
@@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_bb *bb;
+	struct xe_drm_mm_bb *bb;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
 
@@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
  */
 void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 {
-	struct xe_sa_manager *bb_pool;
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_drm_mm_manager *bb_pool;
 
 	if (!IS_VF_CCS_READY(xe))
 		return;
@@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 
 		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
 		drm_printf(p, "-------------------------\n");
-		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
+		drm_mm_print(&bb_pool->base, p);
 		drm_puts(p, "\n");
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 22c499943d2a..f2af074578c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
 	/** @mem: memory data */
 	struct {
 		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
-		struct xe_sa_manager *ccs_bb_pool;
+		struct xe_drm_mm_manager *ccs_bb_pool;
 	} mem;
 };
 
-- 
2.43.0

