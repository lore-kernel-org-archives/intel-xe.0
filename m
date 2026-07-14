Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68958C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 06:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2867F89369;
	Tue, 14 Jul 2026 06:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUp2dZUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BAE89369
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784010285; x=1815546285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWBcWBq6c9xeoSrvhV14oMuOQwa0UED31C9lUR/SgfI=;
 b=LUp2dZUd8Jtc2jRJaJg7UwXm3HVIF8sLPvFuVeRiU2vT/Yu+Sz4DSC6K
 XES2mFXIkmRpYiqP3KqAKUi1OzN/zq4UMKKqEKre6GCMQkLSO1NcmcDmr
 K57kuoArkYJz6JQeCyVB8atu2wIKW30FvQBaSOBjTF0UU5SLfAl8dTOLH
 5CO46ANPNY+GhnM84sbhELifxI8SizAu+iOi/az9sTdmrt9RXkSxPS+dp
 F71rQdYNzzYwDLLW+kpO05ow2t6KyD1Qa9z6ae9g8dMBgtQu4IGMGB8g9
 RZvDNL/6EpHX+n18d7dfmfJT6ImOUFkRQFT1io8iKmAY6+w+vxZNHvF/v A==;
X-CSE-ConnectionGUID: i7d8Si4mSC2Q/nrIUNUVNw==
X-CSE-MsgGUID: k9U39nxbQ66vjMSdsCk0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95991818"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="95991818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:24:44 -0700
X-CSE-ConnectionGUID: tf5bchFVSZe3kgWawZ8JOg==
X-CSE-MsgGUID: Ekyym8YFQB27qU+ttnD2NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="285849923"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:24:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH] drm/xe/vf: Fix VF CCS attach/detach race with in-flight BO
 moves
Date: Mon, 13 Jul 2026 23:24:40 -0700
Message-Id: <20260714062440.3421225-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_bo_move() attaches VF CCS read/write batch buffers (BBs) to a BO
after it transitions NULL/SYSTEM -> TT, and detaches them after it
transitions TT -> SYSTEM. Both operations were done synchronously on
the CPU immediately after building the move's copy/clear fence,
without waiting for that fence to signal. This creates two races with
VF migration:

- Attach happens too late relative to the copy job it is meant to
  protect. If the copy job is submitted before the CCS BBs are
  attached, a VF migration event that pauses execution mid-copy can
  observe partially copied CCS metadata without the attach state
  needed to correctly save/restore it.

- Detach happens too early relative to the copy job that moves data
  out of TT. The CCS BBs are torn down right after the copy fence is
  obtained, while the actual blit may still be in flight. A VF
  migration event that pauses execution mid-copy can then race the
  save/restore path against the still-running blit, and the CCS BBs
  it would need to make sense of the paused state have already been
  removed.

Fix both races:

- Move the attach call to before the copy/clear job is submitted, so
  the CCS BBs are already registered by the time the copy runs. On
  attach failure, unwind and bail out of the move. xe_migrate_ccs_rw_copy()
  now takes the destination resource explicitly, since bo->ttm.resource
  is not updated to the new resource until after the move commits.

- Detach only after explicitly waiting for the copy fence to signal,
  instead of tearing down the CCS BBs immediately after obtaining it.

While here, also fix xe_sriov_vf_ccs_attach_bo() to properly unwind and
propagate errors: the per-context loop previously never broke out on
error, silently discarding earlier failures. Unwind by clearing each
attached context directly via xe_migrate_ccs_rw_copy_clear() instead of
reusing xe_sriov_vf_ccs_detach_bo(), which requires both contexts to be
attached before it will clean up either one.

Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 34 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.c      |  5 +++-
 drivers/gpu/drm/xe/xe_migrate.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 20 ++++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  3 ++-
 5 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 85e6d9a0f575..7916aea0c9cb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1102,6 +1102,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_pm_runtime_get_noresume(xe);
 	}
 
+	/*
+	 * Attach CCS BBs before submitting the copy job below so a VF
+	 * migration racing the copy sees valid, up to date attach state.
+	 */
+	if (IS_VF_CCS_READY(xe) &&
+	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
+	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
+	    handle_system_ccs) {
+		ret = xe_sriov_vf_ccs_attach_bo(bo, new_mem);
+		if (ret) {
+			xe_pm_runtime_put(xe);
+			goto out;
+		}
+	}
+
 	if (move_lacks_source) {
 		u32 flags = 0;
 
@@ -1139,22 +1154,19 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		ttm_bo_move_null(ttm_bo, new_mem);
 	}
 
-	dma_fence_put(fence);
-	xe_pm_runtime_put(xe);
-
 	/*
-	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
-	 * BBs from BO as it is no longer needed.
+	 * Detach must wait for the copy above to complete: a VF migration
+	 * racing an in-flight copy must still see valid CCS BBs, so don't
+	 * tear them down until the copy fence has signaled.
 	 */
 	if (IS_VF_CCS_READY(xe) && old_mem_type == XE_PL_TT &&
-	    new_mem->mem_type == XE_PL_SYSTEM)
+	    new_mem->mem_type == XE_PL_SYSTEM) {
+		dma_fence_wait(fence, false);
 		xe_sriov_vf_ccs_detach_bo(bo);
+	}
 
-	if (IS_VF_CCS_READY(xe) &&
-	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
-	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
-	    handle_system_ccs)
-		ret = xe_sriov_vf_ccs_attach_bo(bo);
+	dma_fence_put(fence);
+	xe_pm_runtime_put(xe);
 
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 92d5e81ceac2..c84e14e86a82 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1142,6 +1142,8 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
  * @tile: Tile whose migration context to be used.
  * @q : Execution to be used along with migration context.
  * @src_bo: The buffer object @src is currently bound to.
+ * @new_mem: The (not yet committed) destination resource @src_bo is being
+ *          moved into; src_bo->ttm.resource is still the old resource.
  * @read_write : Creates BB commands for CCS read/write.
  *
  * Creates batch buffer instructions to copy CCS metadata from CCS pool to
@@ -1153,12 +1155,13 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
  */
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
+			   struct ttm_resource *new_mem,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
 
 {
 	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
 	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
-	struct ttm_resource *src = src_bo->ttm.resource;
+	struct ttm_resource *src = new_mem;
 	struct xe_migrate *m = tile->migrate;
 	struct xe_gt *gt = tile->primary_gt;
 	u32 batch_size, batch_size_allocated;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 965c45889c72..78e5b63f3ebe 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -138,6 +138,7 @@ struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
 
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
+			   struct ttm_resource *new_mem,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 09b99fb2608b..6787564629c6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -404,6 +404,8 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
 /**
  * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
  * @bo: the &buffer object to which batch buffer commands will be added.
+ * @new_mem: the (not yet committed) destination resource @bo is being moved
+ *          into; bo->ttm.resource is still the old resource at this point.
  *
  * This function shall be called only by VF. It inserts the PTEs and copy
  * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
@@ -411,7 +413,7 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
  *
  * Returns: 0 if successful, negative error code on failure.
  */
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
@@ -430,7 +432,21 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 		xe_assert(xe, !bb);
 
 		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
-		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, ctx_id);
+		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, new_mem, ctx_id);
+		if (err)
+			goto err_unwind;
+	}
+	return 0;
+
+err_unwind:
+	/*
+	 * Clean up any contexts already attached. Can't reuse
+	 * xe_sriov_vf_ccs_detach_bo() here as it requires both contexts
+	 * attached before cleaning up either one.
+	 */
+	for_each_ccs_rw_ctx(ctx_id) {
+		if (bo->bb_ccs[ctx_id])
+			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
 	}
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 00e58b36c510..e1034d852104 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -11,11 +11,12 @@
 #include "xe_sriov_vf_ccs_types.h"
 
 struct drm_printer;
+struct ttm_resource;
 struct xe_device;
 struct xe_bo;
 
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
-- 
2.34.1

