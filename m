Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207DC001DF
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 23:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C95A10E390;
	Mon,  7 Aug 2023 23:40:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9E610E074
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691451630; x=1722987630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2h1zBCFLK3U+8vc5wFVf/r3v4MVz5dWlkokzRq5YKi4=;
 b=JGsWvVA6d+GYFI2rQ6CJnHFB3IWKCYw4UsvMbQLWVMIJ9fDlFSuinaSV
 iOkrsLcTUKOX0ycwaUPc1miveafE6y7DnGLySlKRQsRZAa9jbvg3HtyoH
 ws1JAlEnomQB6NBG1DhCHF+6rFTQZVTcCSs1OtwTPshxtn1GzDUpYTtwu
 TpXV6WMo/rbNrsIz3Zwy/YywCcinH/oOQjkJcfPoiHjhhdPjKcHLuoorN
 sif2vXmhlcs5stzBIXnxt51mGNviu/QtSKtK22j2GG1/wnZEIAtYBb6Vv
 0EhCHmQY8PzsGIWp+ycV9yiwZCi8OMb3znaJtwkvOM7covHak51XMQA3p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401637477"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="401637477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="680998753"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="680998753"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 16:40:14 -0700
Message-ID: <20230807234014.960795-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807234014.960795-1-daniele.ceraolospurio@intel.com>
References: <20230807234014.960795-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe: standardize vm-less kernel
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

v2: rebased on s/engine/exec_queue

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c               | 10 ----------
 drivers/gpu/drm/xe/xe_bb.h               |  2 --
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 --
 drivers/gpu/drm/xe/xe_gt.c               | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_ring_ops.c         |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c        |  6 ++----
 6 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 38f4ce83a207..1fbc2fcddc96 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -73,16 +73,6 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 	return xe_sched_job_create(q, addr);
 }
 
-struct xe_sched_job *xe_bb_create_wa_job(struct xe_exec_queue *q,
-					 struct xe_bb *bb, u64 batch_base_ofs)
-{
-	u64 addr = batch_base_ofs + drm_suballoc_soffset(bb->bo);
-
-	XE_WARN_ON(!(q->vm->flags & XE_VM_FLAG_MIGRATION));
-
-	return __xe_bb_create_job(q, bb, &addr);
-}
-
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb,
 						u64 batch_base_ofs,
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index c5ae0770bab5..fafacd73dcc3 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -20,8 +20,6 @@ struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
-struct xe_sched_job *xe_bb_create_wa_job(struct xe_exec_queue *q,
-					 struct xe_bb *bb, u64 batch_ofs);
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 75a180b7192c..4a9a46d8a759 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -66,8 +66,6 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_VM			BIT(5)
 /* child of VM queue for multi-tile VM jobs */
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
-/* queue used for WA setup */
-#define EXEC_QUEUE_FLAG_WA			BIT(7)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 13320af4ddd3..3d6a7c11bac1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -87,15 +87,13 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	struct dma_fence *fence;
-	u64 batch_ofs;
 	long timeout;
 
 	bb = xe_bb_new(gt, 4, false);
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
-	job = xe_bb_create_wa_job(q, bb, batch_ofs);
+	job = xe_bb_create_job(q, bb);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
@@ -124,7 +122,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	struct dma_fence *fence;
-	u64 batch_ofs;
 	long timeout;
 	int count = 0;
 
@@ -143,8 +140,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		}
 	}
 
-	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
-	job = xe_bb_create_wa_job(q, bb, batch_ofs);
+	job = xe_bb_create_job(q, bb);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
@@ -168,14 +164,12 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 int xe_gt_record_default_lrcs(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err = 0;
 
 	for_each_hw_engine(hwe, gt, id) {
 		struct xe_exec_queue *q, *nop_q;
-		struct xe_vm *vm;
 		void *default_lrc;
 
 		if (gt->default_lrc[hwe->class])
@@ -192,14 +186,13 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (!default_lrc)
 			return -ENOMEM;
 
-		vm = xe_migrate_get_vm(tile->migrate);
-		q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1,
-					 hwe, EXEC_QUEUE_FLAG_WA);
+		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
+					 hwe, EXEC_QUEUE_FLAG_KERNEL);
 		if (IS_ERR(q)) {
 			err = PTR_ERR(q);
 			xe_gt_err(gt, "hwe %s: xe_exec_queue_create failed (%pe)\n",
 				  hwe->name, q);
-			goto put_vm;
+			return err;
 		}
 
 		/* Prime golden LRC with known good state */
@@ -210,8 +203,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 			goto put_exec_queue;
 		}
 
-		nop_q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance),
-					     1, hwe, EXEC_QUEUE_FLAG_WA);
+		nop_q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance),
+					     1, hwe, EXEC_QUEUE_FLAG_KERNEL);
 		if (IS_ERR(nop_q)) {
 			err = PTR_ERR(nop_q);
 			xe_gt_err(gt, "hwe %s: nop xe_exec_queue_create failed (%pe)\n",
@@ -245,8 +238,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		xe_exec_queue_put(nop_q);
 put_exec_queue:
 		xe_exec_queue_put(q);
-put_vm:
-		xe_vm_put(vm);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 8d1544d5fdf4..fd493e2c115b 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -202,7 +202,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
 {
-	return !(job->q->flags & EXEC_QUEUE_FLAG_WA) ? BIT(8) : 0;
+	return job->q->vm ? BIT(8) : 0;
 }
 
 static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 6f33c50ec214..190731d161dc 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -59,8 +59,7 @@ static struct xe_sched_job *job_alloc(bool parallel)
 
 bool xe_sched_job_is_migration(struct xe_exec_queue *q)
 {
-	return q->vm && (q->vm->flags & XE_VM_FLAG_MIGRATION) &&
-		!(q->flags & EXEC_QUEUE_FLAG_WA);
+	return q->vm && (q->vm->flags & XE_VM_FLAG_MIGRATION);
 }
 
 static void job_free(struct xe_sched_job *job)
@@ -91,8 +90,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
 
 	/* Migration and kernel engines have their own locking */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM |
-			  EXEC_QUEUE_FLAG_WA))) {
+	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
 		lockdep_assert_held(&q->vm->lock);
 		if (!xe_vm_no_dma_fences(q->vm))
 			xe_vm_assert_held(q->vm);
-- 
2.41.0

