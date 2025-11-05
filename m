Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F586CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 12:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123A210E707;
	Wed,  5 Nov 2025 12:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwrMBt0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9933010E707
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762344719; x=1793880719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pv7l8Pz3GEZcPGebcqMJbhJE2PVaoUocf3Y4WZl3YWs=;
 b=PwrMBt0Ocj+wyjR4y4ukjJapo//obnbRLtQME7YIjd9UHduVW3NJz/BN
 0nKdnvphFpiQEITiNzYLWq49rPu4QZRXtBSpGMMSndveMdryQ0QdxoqgD
 At+kC80lQDRi2Iz21Z+wC4FU3/X5O7PyE0abKG05cTBzvaS5nHfriB9zF
 dkFCthJbQ2zlZA2u1xNAGf+IdQLSRIgNcLDEPZ80W0BF23ZYtQWU9w2LX
 0zl+ZL/xYONMh7z4HQcEc2JL2YU9c9wk62MVcK/0WFiNJpyGMgUJQe5St
 BCrVC8WnYIbS+3mFxXn9qz6VT1ktuuHIoS4iP2mm5zgsPv91e8Gf/uUwr Q==;
X-CSE-ConnectionGUID: XoGcp6WkRk6R5mj4N5iEjg==
X-CSE-MsgGUID: 2lhZLhQbTvGkpY4gtYdWxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75807783"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75807783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:11:59 -0800
X-CSE-ConnectionGUID: WrNkqV06QH6oxwQ0+PLblQ==
X-CSE-MsgGUID: H7A9LNg1S9SrAL2tVE52nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187130926"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 04:11:58 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe/vf: Shadow buffer management for CCS read/write
 operations
Date: Wed,  5 Nov 2025 12:11:51 +0000
Message-ID: <20251105121151.2680100-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105121151.2680100-1-satyanarayana.k.v.p@intel.com>
References: <20251105121151.2680100-1-satyanarayana.k.v.p@intel.com>
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

CCS copy command consist of 5-dword sequence. If vCPU halts during
save/restore operations while these sequences are being programmed,
incomplete writes can cause page faults during IGPU CCS metadata saving.

Use shadow buffer management to prevent partial write issues during CCS
operations.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V1 -> V2:
- Updated xe_sa_bo_swap_guard_lock() to use guard(mutex) class (Michal W).
- Moved xe_device_wmb() into xe_sriov_vf_ccs_rw_update_bb_addr() (Matt B).
---
 drivers/gpu/drm/xe/xe_migrate.c      | 54 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 19 +++++++---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 4 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index dbe9320863ab..2106593fe48e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
@@ -1103,12 +1104,16 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
+	struct xe_sriov_vf_ccs_ctx *ctx;
+	struct xe_sa_manager *bb_pool;
 	u64 size = xe_bo_size(src_bo);
 	struct xe_bb *bb = NULL;
 	u64 src_L0, src_L0_ofs;
 	u32 src_L0_pt;
 	int err;
 
+	ctx = &xe->sriov.vf.ccs.contexts[read_write];
+
 	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
 
 	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
@@ -1141,6 +1146,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
+	bb_pool = ctx->mem.ccs_bb_pool;
+	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
+	xe_sa_bo_swap_shadow(bb_pool);
+
 	bb = xe_bb_ccs_new(gt, batch_size, read_write);
 	if (IS_ERR(bb)) {
 		drm_err(&xe->drm, "BB allocation failed.\n");
@@ -1194,12 +1203,57 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	xe_assert(xe, (batch_size_allocated == bb->len));
 	src_bo->bb_ccs[read_write] = bb;
 
+	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+	xe_sa_bo_sync_shadow(bb->bo);
 	return 0;
 
 err_ret:
 	return err;
 }
 
+/**
+ * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
+ * content.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @read_write : Creates BB commands for CCS read/write.
+ *
+ * Directly clearing the BB lacks atomicity and can lead to undefined
+ * behavior if the vCPU is halted mid-operation during the clearing
+ * process. To avoid this issue, we use a shadow buffer object approach.
+ *
+ * First swap the SA BO address with the shadow BO, perform the clearing
+ * operation on the BB, update the shadow BO in the ring buffer, then
+ * sync the shadow and the actual buffer to maintain consistency.
+ *
+ * Returns: None.
+ */
+void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
+{
+	struct xe_bb *bb = src_bo->bb_ccs[read_write];
+	struct xe_device *xe = xe_bo_device(src_bo);
+	struct xe_sriov_vf_ccs_ctx *ctx;
+	struct xe_sa_manager *bb_pool;
+	u32 *cs;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	ctx = &xe->sriov.vf.ccs.contexts[read_write];
+	bb_pool = ctx->mem.ccs_bb_pool;
+
+	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
+	xe_sa_bo_swap_shadow(bb_pool);
+
+	cs = xe_sa_bo_cpu_addr(bb->bo);
+	memset(cs, MI_NOOP, bb->len * sizeof(u32));
+	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+
+	xe_sa_bo_sync_shadow(bb->bo);
+
+	xe_bb_free(bb, NULL);
+	src_bo->bb_ccs[read_write] = NULL;
+}
+
 /**
  * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
  * @migrate: Migrate context.
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index d7bcc6ad8464..db66b2ea31a5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -134,6 +134,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
+void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
+
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
 struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 9959d619addc..33f4238604e1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -150,7 +150,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
 		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
 
-	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
+	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
+					     XE_SA_BO_MANAGER_FLAG_SHADOW);
 
 	if (IS_ERR(sa_manager)) {
 		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
@@ -384,6 +385,18 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	return err;
 }
 
+#define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
+void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
+{
+	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
+	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
+	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
+
+	xe_device_wmb(xe);
+	xe_map_wr(xe, &lrc->bo->vmap, XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET, u32, addr);
+	xe_device_wmb(xe);
+}
+
 /**
  * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
  * @bo: the &buffer object to which batch buffer commands will be added.
@@ -444,9 +457,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 		if (!bb)
 			continue;
 
-		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
-		xe_bb_free(bb, NULL);
-		bo->bb_ccs[ctx_id] = NULL;
+		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index f8ca6efce9ee..00e58b36c510 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -20,6 +20,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
 void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
+void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx);
 
 static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
 {
-- 
2.43.0

