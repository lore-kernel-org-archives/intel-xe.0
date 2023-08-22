Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC6EE49AF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 17:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4FB10E3C0;
	Tue, 22 Aug 2023 17:33:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80A10E3BF
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692725628; x=1724261628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlqmfBuYqk89ZQSazjKFlQbUuc7FaLsX2esC8GPKDts=;
 b=Imp5UD4wXTe4gyaHPIe2mR52f5eMvgXMW5ZgZ3++GMJGtbsp1KLQ0/1E
 WT+08Qf/4VfKpOZGFq+IP0XGP8YrvbkTIO2OaH6PZpRlD2MW5gyR5HO4K
 41tLgZloENz1+mjRhWZmEqjQgQI6BVqD8XK8hxphrm8x4BB9EYhPlTw0R
 C1Z37fhhw7Tc24lQeTP1jQ68CeiTQLBf4LB8VRtkrnmunSVwYQHruCXr4
 qqZFBK9EASVx00/sN7bugl4/1RLmfK6ds4inz/ikXl3xSXwpi89wumXl9
 o6SrGorpJ+huUV8eheZqRtA8iAni74CeMolz04vBMMfqkq8HGkFmWew8U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376685288"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="376685288"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860009034"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="860009034"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 10:33:34 -0700
Message-ID: <20230822173334.1664332-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
References: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe: standardize vm-less kernel
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
index ad5c3f9b80d3..732f61bac575 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -202,7 +202,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
 {
-	return !(job->q->flags & EXEC_QUEUE_FLAG_WA) ? BIT(8) : 0;
+	return job->q->vm ? BIT(8) : 0;
 }
 
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
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

