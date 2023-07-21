Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83713C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 19:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9910E6F3;
	Fri, 21 Jul 2023 19:10:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BF610E6F3
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689966633; x=1721502633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QpO2/COaDDNmF6L2BZffhwzmYhwkJzLSNtBlZASdVxU=;
 b=T93PvQTmrHFFnB56yycMHgUO2jEhUSK5FTxkVGUivpG4F/xcjgGPdh+W
 u1mIEyqXl2Wl1R/Bh9pJlwCNje/4sQKG0P+14HxGkp3Fd0H2LpUM3tOfk
 nNbzB7TQDOHj6YBxyF8ooyws/A+nYY9iD9TYexXEd0r67Dp0ZqkXlvamE
 37XAoYp3TCOuJRXG0c13IdYaHODCOe7eFoIehMC+Tpn7ajZYQMD9gsZtQ
 zjMf++TP2055KA/sk9alEHbNKyhvX2R7cmywEfBnsNWoxYL5SxE8iTNbz
 9+dbqpTnzLuFxgkMFXmmJeXGjj5AFymF9KZ9+7+hxDWAj0Xc3OUsR/s/e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351983508"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351983508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="815082154"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="815082154"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:10:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 12:10:27 -0700
Message-Id: <20230721191027.267010-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Increase prefetch size
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MTL requires 2k prefetch for RCS hw engine, fix this. Also wire up hwe
class in this calculation to not waste space in the common case of using
a BCS hw engine.

Bspec: 45718

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  3 ++-
 drivers/gpu/drm/xe/xe_bb.c            | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_bb.h            |  4 +++-
 drivers/gpu/drm/xe/xe_gt.c            |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c       |  7 ++++---
 5 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 30e5fdf6ca63..71a127efe99a 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -286,7 +286,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_pt;
 	}
 
-	bb = xe_bb_new(tile->primary_gt, 32, xe->info.supports_usm);
+	bb = xe_bb_new(tile->primary_gt, m->eng->hwe->class, 32,
+		       xe->info.supports_usm);
 	if (IS_ERR(bb)) {
 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
 			   PTR_ERR(bb));
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index f9b6b7adf99f..15e616fcccef 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -14,21 +14,23 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-static int bb_prefetch(struct xe_gt *gt)
+static int bb_prefetch(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
-		/*
-		 * RCS and CCS require 1K, although other engines would be
-		 * okay with 512.
-		 */
+	if (xe->info.platform == XE_METEORLAKE &&
+	    class == XE_ENGINE_CLASS_RENDER)
+		return SZ_2K;
+	else if (GRAPHICS_VERx100(xe) >= 1250 &&
+		 (class == XE_ENGINE_CLASS_RENDER ||
+		  class == XE_ENGINE_CLASS_COMPUTE))
 		return SZ_1K;
 	else
 		return SZ_512;
 }
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
+struct xe_bb *xe_bb_new(struct xe_gt *gt, enum xe_engine_class class,
+			u32 dwords, bool usm)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
@@ -44,7 +46,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	 * requirements.
 	 */
 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
-			      4 * (dwords + 1) + bb_prefetch(gt));
+			      4 * (dwords + 1) + bb_prefetch(gt, class));
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
 		goto err;
@@ -66,7 +68,8 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
 
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
-	WARN_ON(bb->len * 4 + bb_prefetch(kernel_eng->gt) > size);
+	WARN_ON(bb->len * 4 + bb_prefetch(kernel_eng->gt,
+					  kernel_eng->hwe->class) > size);
 
 	xe_sa_bo_flush_write(bb->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 0cc9260c9634..ad6170b0b23a 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -8,13 +8,15 @@
 
 #include "xe_bb_types.h"
 
+enum xe_engine_class;
 struct dma_fence;
 
 struct xe_gt;
 struct xe_engine;
 struct xe_sched_job;
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_new(struct xe_gt *gt, enum xe_engine_class class, u32 size,
+			bool usm);
 struct xe_sched_job *xe_bb_create_job(struct xe_engine *kernel_eng,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..d928b161c480 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -88,7 +88,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	u64 batch_ofs;
 	long timeout;
 
-	bb = xe_bb_new(gt, 4, false);
+	bb = xe_bb_new(gt, e->hwe->class, 4, false);
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
@@ -126,7 +126,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 	long timeout;
 	int count = 0;
 
-	bb = xe_bb_new(gt, SZ_4K, false);	/* Just pick a large BB size */
+	bb = xe_bb_new(gt, e->hwe->class, SZ_4K, false);	/* Just pick a large BB size */
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bc7dac4e2086..649ba38bca81 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -685,7 +685,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		batch_size += EMIT_COPY_DW +
 			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
 
-		bb = xe_bb_new(gt, batch_size, usm);
+		bb = xe_bb_new(gt, m->eng->hwe->class, batch_size, usm);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
@@ -914,7 +914,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (WARN_ON_ONCE(!clear_L0))
 			break;
 
-		bb = xe_bb_new(gt, batch_size, usm);
+		bb = xe_bb_new(gt, m->eng->hwe->class, batch_size, usm);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
@@ -1196,7 +1196,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 */
 	XE_BUG_ON(batch_size >= SZ_128K);
 
-	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
+	bb = xe_bb_new(gt, eng_override->hwe->class, batch_size,
+		       !eng && xe->info.supports_usm);
 	if (IS_ERR(bb))
 		return ERR_CAST(bb);
 
-- 
2.34.1

