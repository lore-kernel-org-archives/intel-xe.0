Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A1C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 20:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25DA10E334;
	Mon, 10 Apr 2023 20:02:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E430C10E334
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681156952; x=1712692952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tb0J59YO1oi01+lENLHs3TUAhAjuJy5uUAIjTHu03yM=;
 b=UyMBhzkZIqDf0P8/O4Vel4SMpIyfGkUx2/PIh3LbcpLjaX7/F0rp8EZZ
 tbe203wJE82H2TkUqEESGrcKkfIopMdZn6tqkj/gCUo/QOqS45k95VcHs
 ZdznfiN14liZUpA152NPG1vdrxz7Zt7utY6uK6FmalhuvCtcvZgNYMMfE
 arbHDBt1mr6mlFNveo/G4hs3mzZidtOYsI33vTkuv9x5NdI92UamO7JMI
 mhS3SwvTaz2FfV1l6IPY8ZzaL52Lr/BUYDjw77mfUcbEVyAcFrDeaesx4
 AbVZbOTKhmx452Mfb4NCOp646896y3fTcZYc61bURjkCvSVodyl16RJsg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="346109120"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="346109120"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 13:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638563276"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="638563276"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 13:02:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 13:02:29 -0700
Message-Id: <20230410200229.2726648-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Let primary and media GT share a
 kernel_bb_pool
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The media GT requires a valid gt->kernel_bb_pool during driver probe to
allocate the WA and NOOP batchbuffers used to record default context
images.  Dynamically allocate the bb_pools so that the primary and media
GT can use the same pool during driver init.

The media GT still shouldn't be need the USM pool, so only hook up the
kernel_bb_pool for now.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c         |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         | 32 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++--
 drivers/gpu/drm/xe/xe_gt_types.h   | 10 +++++++---
 drivers/gpu/drm/xe/xe_migrate.c    |  4 ++--
 drivers/gpu/drm/xe/xe_sa.c         | 23 ++++++++++++++-------
 drivers/gpu/drm/xe/xe_sa.h         |  4 +---
 7 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 7172801ee570..3deb2d55f421 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -42,7 +42,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	 * space to accomodate the platform-specific hardware prefetch
 	 * requirements.
 	 */
-	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
+	bb->bo = xe_sa_bo_new(!usm ? gt->kernel_bb_pool : gt->usm.bb_pool,
 			      4 * (dwords + 1) + bb_prefetch(gt));
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daaf93e23bbf..4186f7f0d42f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -137,7 +137,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
+	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
@@ -186,7 +186,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 		}
 	}
 
-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
+	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
@@ -439,26 +439,32 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/*
-	 * FIXME: This should be ok as SA should only be used by gt->migrate and
-	 * vm->gt->migrate and both should be pointing to a non-media GT. But to
-	 * realy safe, convert gt->kernel_bb_pool to a pointer and point a media
-	 * GT to the kernel_bb_pool on a real tile.
-	 */
 	if (!xe_gt_is_media_type(gt)) {
-		err = xe_sa_bo_manager_init(gt, &gt->kernel_bb_pool, SZ_1M, 16);
-		if (err)
+		gt->kernel_bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
+		if (IS_ERR(gt->kernel_bb_pool)) {
+			err = PTR_ERR(gt->kernel_bb_pool);
 			goto err_force_wake;
+		}
 
 		/*
 		 * USM has its only SA pool to non-block behind user operations
 		 */
 		if (gt_to_xe(gt)->info.supports_usm) {
-			err = xe_sa_bo_manager_init(gt, &gt->usm.bb_pool,
-						    SZ_1M, 16);
-			if (err)
+			gt->usm.bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
+			if (IS_ERR(gt->usm.bb_pool)) {
+				err = PTR_ERR(gt->usm.bb_pool);
 				goto err_force_wake;
+			}
 		}
+	} else {
+		struct xe_gt *full_gt = xe_find_full_gt(gt);
+
+		/*
+		 * Media GT's kernel_bb_pool is only used while recording the
+		 * default context during GT init.  The USM pool should never
+		 * be needed on the media GT.
+		 */
+		gt->kernel_bb_pool = full_gt->kernel_bb_pool;
 	}
 
 	if (!xe_gt_is_media_type(gt)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 9fab8017490f..c45486c2015a 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -66,8 +66,8 @@ static int sa_info(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool.base, &p,
-				     gt->kernel_bb_pool.gpu_addr);
+	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool->base, &p,
+				     gt->kernel_bb_pool->gpu_addr);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 9d3117fad2e4..7c47d67aa8be 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -214,7 +214,7 @@ struct xe_gt {
 		 * behind any user operations which may have resulted in a
 		 * fault.
 		 */
-		struct xe_sa_manager bb_pool;
+		struct xe_sa_manager *bb_pool;
 		/**
 		 * @reserved_bcs_instance: reserved BCS instance used for USM
 		 * operations (e.g. mmigrations, fixing page tables)
@@ -304,8 +304,12 @@ struct xe_gt {
 	/** @hw_engines: hardware engines on the GT */
 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
 
-	/** @kernel_bb_pool: Pool from which batchbuffers are allocated */
-	struct xe_sa_manager kernel_bb_pool;
+	/**
+	 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
+	 *
+	 * Media GT shares a pool with its primary GT.
+	 */
+	struct xe_sa_manager *kernel_bb_pool;
 
 	/** @migrate: Migration helper for vram blits and clearing */
 	struct xe_migrate *migrate;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e8978440c725..8686a2a7b035 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -161,7 +161,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 	u32 map_ofs, level, i;
 	struct xe_device *xe = gt_to_xe(m->gt);
-	struct xe_bo *bo, *batch = gt->kernel_bb_pool.bo;
+	struct xe_bo *bo, *batch = gt->kernel_bb_pool->bo;
 	u64 entry;
 	int ret;
 
@@ -229,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
 
 		if (xe->info.supports_usm) {
-			batch = gt->usm.bb_pool.bo;
+			batch = gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE,
 						&is_vram);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 96c4b0ef24fe..c16f7c14ff52 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -33,13 +33,18 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 	sa_manager->bo = NULL;
 }
 
-int xe_sa_bo_manager_init(struct xe_gt *gt,
-			  struct xe_sa_manager *sa_manager,
-			  u32 size, u32 align)
+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 managed_size = size - SZ_4K;
 	struct xe_bo *bo;
+	int ret;
+
+	struct xe_sa_manager *sa_manager = drmm_kzalloc(&gt_to_xe(gt)->drm,
+							sizeof(*sa_manager),
+							GFP_KERNEL);
+	if (!sa_manager)
+		return ERR_PTR(-ENOMEM);
 
 	sa_manager->bo = NULL;
 
@@ -49,7 +54,7 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
-		return PTR_ERR(bo);
+		return (struct xe_sa_manager *)bo;
 	}
 	sa_manager->bo = bo;
 
@@ -61,15 +66,19 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
 		if (!sa_manager->cpu_ptr) {
 			xe_bo_unpin_map_no_vm(sa_manager->bo);
 			sa_manager->bo = NULL;
-			return -ENOMEM;
+			return ERR_PTR(-ENOMEM);
 		}
 	} else {
 		sa_manager->cpu_ptr = bo->vmap.vaddr;
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
-					sa_manager);
+	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
+				       sa_manager);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return sa_manager;
 }
 
 struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 742282ef7179..3063fb34c720 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -11,9 +11,7 @@ struct dma_fence;
 struct xe_bo;
 struct xe_gt;
 
-int xe_sa_bo_manager_init(struct xe_gt *gt,
-			  struct xe_sa_manager *sa_manager,
-			  u32 size, u32 align);
+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align);
 
 struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
 				  u32 size);
-- 
2.39.2

