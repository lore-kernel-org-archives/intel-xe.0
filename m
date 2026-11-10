Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F095C606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xl8m/u/5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434F10F82E;
	Tue, 10 Nov 2026 23:15:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6EB10F54C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352502; x=1825888502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RcFnnRP9rik6PShOrHKWliYuKjaWOuAVf8liZG1L7Jk=;
 b=Xl8m/u/5eJxaJ2ZHRcKsXtzPsH0FvgvZ0l2s/2yirIrHRajXT566RS1n
 z7aSlJmAgH5IOhtMFD0560xkemQbfNt0HAFMAZjoszqyXyazwL+ks4FKn
 tBfdZSrGrUnSkF/LLOs0nkbPE54irapKlL7Uh2b+AL63YjHO1MMogMi71
 d0x2W9EStFBb1i2qJYj3cyvG5f5vgOrKoDsBBvwn4hBmkn4fkQ+nmvv/j
 6WfYiEHkpU9iLqEPRGDX+D3Tm7qfTZFeH2dBXfHCeRklZDYtBJGm4xngc
 ibtLzl4LDJ1FrG+VzewRSvJQZ9x0bh7hWUlNB+/7abklmIA7L9zGmCEIT A==;
X-CSE-ConnectionGUID: sfHHHHs7TsCDm0/yYquI6g==
X-CSE-MsgGUID: ucQNDiUpQwKgXrX4oh9kGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120829"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
X-CSE-ConnectionGUID: mCf6qB5KRQOE/ikXVxyW5w==
X-CSE-MsgGUID: 1/OICi5wQrGTQxXK+TtQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133966"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/11] drm/xe: Run page table updates on the media GT when
 there is no primary
Date: Tue, 10 Nov 2026 23:14:49 +0000
Message-ID: <20261110231442.218721-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

The tile's migration context, and the bind exec queues built on top of
it, are hard wired to the primary GT and its copy engine.  On a device
with no graphics IP that GT is NULL, and xe_migrate_init() is never
called at all, so probe dies in xe_cpu_bind_init() on an uninitialised
tile->migrate.

Page table updates are plain memory writes, so any GT can issue them.
Add xe_tile_pt_gt() and xe_tile_pt_class(), which name the primary GT and
its copy engine as before but fall back to the media GT and a video
decode engine, and use them for the migration context, the bind queues
and the place xe_gt_init() decides to set migration up.

Note this only makes page table updates work.  The blit based copy and
clear paths now target a video engine rather than NULL on such a device,
which stops them oopsing, but they are still not functional there.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  5 +++--
 drivers/gpu/drm/xe/xe_gt.c         | 11 ++++++----
 drivers/gpu/drm/xe/xe_migrate.c    | 29 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_tile.h       | 32 ++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7ade915c59a8..cb93c4ee7bb8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -28,6 +28,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_tile.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
@@ -588,7 +589,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_vm *user_vm,
 						u32 flags, u64 extensions)
 {
-	struct xe_gt *gt = tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(tile);
 	struct xe_exec_queue *q;
 	struct xe_vm *migrate_vm;
 
@@ -606,7 +607,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 					 flags, extensions);
 	} else {
 		q = xe_exec_queue_create_class(xe, gt, migrate_vm,
-					       XE_ENGINE_CLASS_COPY, flags,
+					       xe_tile_pt_class(tile), flags,
 					       extensions);
 	}
 	xe_vm_put(migrate_vm);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index be79a0da2f2f..82299c1bc6c5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -61,6 +61,7 @@
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_tuning.h"
 #include "xe_uc.h"
@@ -657,10 +658,12 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		}
 	}
 
-	if (xe_gt_is_main_type(gt)) {
-		struct xe_tile *tile = gt_to_tile(gt);
-
-		err = xe_migrate_init(tile->migrate);
+	/*
+	 * Normally the migration context runs on the primary GT, but a tile
+	 * with no graphics IP has only its media GT to run it on.
+	 */
+	if (gt == xe_tile_pt_gt(gt_to_tile(gt))) {
+		err = xe_migrate_init(gt_to_tile(gt)->migrate);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 19c37eb31589..754592c5cf88 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -43,6 +43,7 @@
 #include "xe_sriov_vf_ccs.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
 #include "xe_vm.h"
@@ -478,7 +479,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (xe->info.has_usm) {
 			xe_tile_assert(tile, xe_bo_size(batch) == SZ_1M);
 
-			batch = tile->primary_gt->usm.bb_pool->bo;
+			batch = xe_tile_pt_gt(tile)->usm.bb_pool->bo;
 			m->usm_batch_base_ofs = m->batch_base_ofs + SZ_1M;
 			xe_tile_assert(tile, xe_bo_size(batch) == SZ_512K);
 
@@ -499,7 +500,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
 
 		if (xe->info.has_usm) {
-			batch = tile->primary_gt->usm.bb_pool->bo;
+			batch = xe_tile_pt_gt(tile)->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
 		}
@@ -787,7 +788,7 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 int xe_migrate_init(struct xe_migrate *m)
 {
 	struct xe_tile *tile = m->tile;
-	struct xe_gt *primary_gt = tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(tile);
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vm *vm;
 	int err;
@@ -803,8 +804,8 @@ int xe_migrate_init(struct xe_migrate *m)
 		goto err_out;
 
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe0 = primary_gt->usm.paging_hwe0;
-		u32 logical_mask = primary_gt->usm.paging_logical_mask;
+		struct xe_hw_engine *hwe0 = gt->usm.paging_hwe0;
+		u32 logical_mask = gt->usm.paging_logical_mask;
 
 		if (!hwe0 || !logical_mask) {
 			err = -EINVAL;
@@ -821,8 +822,8 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_MIGRATE |
 					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
 	} else {
-		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
-						  XE_ENGINE_CLASS_COPY,
+		m->q = xe_exec_queue_create_class(xe, gt, vm,
+						  xe_tile_pt_class(tile),
 						  EXEC_QUEUE_FLAG_KERNEL |
 						  EXEC_QUEUE_FLAG_MIGRATE, 0);
 	}
@@ -1170,7 +1171,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 			       u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
 			       u64 ccs_ofs, bool copy_ccs)
 {
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(m->tile);
 	u32 flush_flags = 0;
 
 	if (!copy_ccs && dst_is_indirect) {
@@ -1214,7 +1215,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   bool copy_only_ccs,
 					   bool is_vram_resolve)
 {
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(m->tile);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = xe_bo_size(src_bo);
@@ -1512,7 +1513,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
 	struct ttm_resource *src = new_mem;
 	struct xe_migrate *m = tile->migrate;
-	struct xe_gt *gt = tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(tile);
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
@@ -1714,7 +1715,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 {
 	struct xe_device *xe = xe_bo_device(vram_bo);
 	struct xe_tile *tile = vram_bo->tile;
-	struct xe_gt *gt = tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(tile);
 	struct xe_migrate *m = tile->migrate;
 	struct dma_fence *fence = NULL;
 	struct ttm_resource *vram = vram_bo->ttm.resource;
@@ -1930,7 +1931,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(m->tile);
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_only_system_ccs = false;
 	struct dma_fence *fence = NULL;
@@ -2295,7 +2296,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 struct dma_fence *deps,
 					 const enum xe_migrate_copy_dir dir)
 {
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(m->tile);
 	struct xe_device *xe = gt_to_xe(gt);
 	bool use_usm_batch = xe->info.has_usm;
 	struct dma_fence *fence = NULL;
@@ -2723,7 +2724,7 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 bool write_to_ccs)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
-	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_gt *gt = xe_tile_pt_gt(m->tile);
 	struct dma_fence *fence;
 	struct xe_bb *bb;
 	struct xe_sched_job *job;
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index a2a2c0e936b8..f35b675f7a20 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -6,6 +6,7 @@
 #ifndef _XE_TILE_H_
 #define _XE_TILE_H_
 
+#include "xe_hw_engine_types.h"
 #include "xe_tile_types.h"
 
 struct xe_device;
@@ -24,6 +25,37 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+/**
+ * xe_tile_pt_gt() - GT used to run a tile's page table update jobs
+ * @tile: Pointer to the struct xe_tile.
+ *
+ * Page table updates, and the migration context they are submitted through,
+ * normally run on the primary GT.  A device whose graphics IP is absent has
+ * no primary GT, but its media GT can write page tables just as well.
+ *
+ * Return: The tile's primary GT, or its media GT if it has no primary GT.
+ */
+static inline struct xe_gt *xe_tile_pt_gt(struct xe_tile *tile)
+{
+	return tile->primary_gt ?: tile->media_gt;
+}
+
+/**
+ * xe_tile_pt_class() - Engine class to run a tile's page table update jobs on
+ * @tile: Pointer to the struct xe_tile.
+ *
+ * The engine class to pair with xe_tile_pt_gt(). The copy engine is the usual
+ * choice, but it lives on the primary GT; when there is none, fall back to a
+ * video decode engine on the media GT.
+ *
+ * Return: The engine class to create the tile's page table exec queue with.
+ */
+static inline enum xe_engine_class xe_tile_pt_class(struct xe_tile *tile)
+{
+	return tile->primary_gt ? XE_ENGINE_CLASS_COPY :
+				  XE_ENGINE_CLASS_VIDEO_DECODE;
+}
+
 /**
  * xe_tile_to_vr() - Return the struct xe_vram_region pointer from a
  * struct xe_tile pointer
-- 
2.43.0

