Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E62C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 19:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060A10E5E8;
	Thu, 27 Jul 2023 19:00:18 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFD410E5E9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690484415; x=1722020415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Yb0tq2ntaZl/sIq/deyGIZbMPfa+rGDHkzvLD53yKk=;
 b=D9GWRY4J4PwbChH4gFRYTPJPMC7lXGvbzWlc16otRQyW63pQZIeCfxKj
 YwbaFXFugAIG8mLmMfpDECfMdyvs7ZIOI/aWgDpY1I8bCnWRvlzE7UqOk
 4mTTwnn9W/+c9lPQb4zQyuPEP5mDYTwlb9YjG0H7ijRMkITRpivESpX8L
 AoVPoLhkR0Rf3hyqVV8tYfuPPzM+iSdFq0oLx63RVAHVJ4UtMHNIsE8oT
 kmkf9SE+f7sP6Ar//CYxuwqWMl55YcPnYatZPG7LLW7rHlWKxmi/LyMoI
 UkZliL8Fr4K2/BcNbBU35OS7vzGtB5ztpJTcZBUI/vCmEWiYJWbcdTYCF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348681608"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="348681608"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727127097"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727127097"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 11:59:45 -0700
Message-ID: <20230727185945.401047-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: standardize vm-less kernel
 submissions
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

The current only submission in the driver that doesn't use a vm is the
WA setup. We still pass a vm structure (the migration one), but we don't
actually use it at submission time and we instead have an hack to use
GGTT for this particular engine.
Instead of special-casing the WA engine, we can skip providing a VM and
use that as selector for whether to use GGTT or PPGTT. As part of this
change, we can drop the special engine flag for the WA engine and switch
the WA submission to use the standard job functions instead of dedicated
ones.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c           | 10 ----------
 drivers/gpu/drm/xe/xe_bb.h           |  2 --
 drivers/gpu/drm/xe/xe_engine_types.h |  2 --
 drivers/gpu/drm/xe/xe_gt.c           | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_ring_ops.c     |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c    |  6 ++----
 6 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index f9b6b7adf99f..8d4e645d43c5 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -73,16 +73,6 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
 	return xe_sched_job_create(kernel_eng, addr);
 }
 
-struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
-					 struct xe_bb *bb, u64 batch_base_ofs)
-{
-	u64 addr = batch_base_ofs + drm_suballoc_soffset(bb->bo);
-
-	XE_BUG_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
-
-	return __xe_bb_create_job(wa_eng, bb, &addr);
-}
-
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
 						struct xe_bb *bb,
 						u64 batch_base_ofs,
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 0cc9260c9634..d1d55bccbf45 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -20,8 +20,6 @@ struct xe_sched_job *xe_bb_create_job(struct xe_engine *kernel_eng,
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
-struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
-					 struct xe_bb *bb, u64 batch_ofs);
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 6802fdc10ec8..6ddc92b57c51 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -66,8 +66,6 @@ struct xe_engine {
 #define ENGINE_FLAG_VM			BIT(5)
 /* child of VM engine for multi-tile VM jobs */
 #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(6)
-/* engine used for WA setup */
-#define ENGINE_FLAG_WA			BIT(7)
 
 	/**
 	 * @flags: flags for this engine, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..de0a9683ad68 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -85,15 +85,13 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	struct dma_fence *fence;
-	u64 batch_ofs;
 	long timeout;
 
 	bb = xe_bb_new(gt, 4, false);
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
-	job = xe_bb_create_wa_job(e, bb, batch_ofs);
+	job = xe_bb_create_job(e, bb);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
@@ -122,7 +120,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	struct dma_fence *fence;
-	u64 batch_ofs;
 	long timeout;
 	int count = 0;
 
@@ -141,8 +138,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 		}
 	}
 
-	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
-	job = xe_bb_create_wa_job(e, bb, batch_ofs);
+	job = xe_bb_create_job(e, bb);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
@@ -166,14 +162,12 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 int xe_gt_record_default_lrcs(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err = 0;
 
 	for_each_hw_engine(hwe, gt, id) {
 		struct xe_engine *e, *nop_e;
-		struct xe_vm *vm;
 		void *default_lrc;
 
 		if (gt->default_lrc[hwe->class])
@@ -190,14 +184,13 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (!default_lrc)
 			return -ENOMEM;
 
-		vm = xe_migrate_get_vm(tile->migrate);
-		e = xe_engine_create(xe, vm, BIT(hwe->logical_instance), 1,
-				     hwe, ENGINE_FLAG_WA);
+		e = xe_engine_create(xe, NULL, BIT(hwe->logical_instance), 1,
+				     hwe, ENGINE_FLAG_KERNEL);
 		if (IS_ERR(e)) {
 			err = PTR_ERR(e);
 			xe_gt_err(gt, "hwe %s: xe_engine_create failed (%pe)\n",
 				  hwe->name, e);
-			goto put_vm;
+			return err;
 		}
 
 		/* Prime golden LRC with known good state */
@@ -208,8 +201,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 			goto put_engine;
 		}
 
-		nop_e = xe_engine_create(xe, vm, BIT(hwe->logical_instance),
-					 1, hwe, ENGINE_FLAG_WA);
+		nop_e = xe_engine_create(xe, NULL, BIT(hwe->logical_instance),
+					 1, hwe, ENGINE_FLAG_KERNEL);
 		if (IS_ERR(nop_e)) {
 			err = PTR_ERR(nop_e);
 			xe_gt_err(gt, "hwe %s: nop xe_engine_create failed (%pe)\n",
@@ -243,8 +236,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		xe_engine_put(nop_e);
 put_engine:
 		xe_engine_put(e);
-put_vm:
-		xe_vm_put(vm);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 8e21c19cb041..bc0fdd4ef188 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -202,7 +202,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
 {
-	return !(job->engine->flags & ENGINE_FLAG_WA) ? BIT(8) : 0;
+	return job->engine->vm ? BIT(8) : 0;
 }
 
 static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index e1af1f2a44c2..68f446e8c081 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -59,8 +59,7 @@ static struct xe_sched_job *job_alloc(bool parallel)
 
 bool xe_sched_job_is_migration(struct xe_engine *e)
 {
-	return e->vm && (e->vm->flags & XE_VM_FLAG_MIGRATION) &&
-		!(e->flags & ENGINE_FLAG_WA);
+	return e->vm && (e->vm->flags & XE_VM_FLAG_MIGRATION);
 }
 
 static void job_free(struct xe_sched_job *job)
@@ -91,8 +90,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 	XE_BUG_ON(!e->vm && !(e->flags & ENGINE_FLAG_KERNEL));
 
 	/* Migration and kernel engines have their own locking */
-	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM |
-			  ENGINE_FLAG_WA))) {
+	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM))) {
 		lockdep_assert_held(&e->vm->lock);
 		if (!xe_vm_no_dma_fences(e->vm))
 			xe_vm_assert_held(e->vm);
-- 
2.41.0

