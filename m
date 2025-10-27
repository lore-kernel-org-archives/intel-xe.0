Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A8CCF9F2
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A64F10E566;
	Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGygTXQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26FB10E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z2QQ31YGd+QlTxBAN8bv8Etjfci6Qdk/RNaWVAiyeh0=;
 b=mGygTXQaKwcCP+g24PVdjnL0WLCYwJ5C0VLfg/u02U9eBR2HP11hUA2j
 ufyfKbXGHoaCt8aI+ubKYqpLenAeKDbliK0YlbfzdiwMD+qOMJnRdWNZH
 ATj5yiYtzwfz+yjsSRxOuG09WP6iz++o1Ju9Z17I5xDtDhjUJwbpDPmlP
 wiassUot4okgdpLMVquBYomqFUAAwXYZbDwSKb4FyCmbFuDt7g8NYBPcc
 rYu9MzJO2O6fRzI+0GEZYwwRWgKOBkNY81HmVfEbbtEEIJpSXB0NorBHc
 ZXpGrj9m3fF5X+pr7C3pqbe0c2Ov2hi+n6nwAfzaqT/WkneXKcmx+zQPj Q==;
X-CSE-ConnectionGUID: gNCLBu3/TE2SasXzTMIKMw==
X-CSE-MsgGUID: 2N+O6Y0LRBCrIC4KCYty6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368844"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: jqL/Hn23T8SNAN+swI8h5Q==
X-CSE-MsgGUID: /CXx4WCrRYuMEDbHaMg2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782344"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/8] drm/xe: Decouple bind queue last fence from TLB invalidations
Date: Mon, 27 Oct 2025 14:42:46 -0700
Message-Id: <20251027214252.2455093-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Separate the bind queue's last fence to apply only to the bind job,
rather than combining it with associated TLB invalidation jobs. This
avoids unnecessary serialization of bind jobs on prior TLB
invalidations.

Since user fence signaling depends on the completion of both bind and
TLB invalidation jobs, their fences are merged later in the bind
pipeline to preserve correct signaling order.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v3:
 - Fix lockdep assert for migrate queues (CI)
 - Use individual dma fence contexts for array out fences (Testing)
 - Don't set last fence with arrays (Testing)
 - Move TLB invalid last fence under migrate lock (Testing)
 - Don't set queue last for migrate queues (Testing)
---
 drivers/gpu/drm/xe/xe_pt.c            | 73 ++++++++++---------------
 drivers/gpu/drm/xe/xe_sync.c          | 63 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 31 ++++++++---
 drivers/gpu/drm/xe/xe_tlb_inval_job.h |  5 +-
 drivers/gpu/drm/xe/xe_vm.c            | 76 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h      |  5 --
 6 files changed, 143 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d22fd1ccc0ba..a4b9cdf016d9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,8 +3,6 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <linux/dma-fence-array.h>
-
 #include "xe_pt.h"
 
 #include "regs/xe_gtt_defs.h"
@@ -2359,10 +2357,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm *vm = vops->vm;
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
-	struct dma_fence *fence, *ifence, *mfence;
+	struct xe_exec_queue *q = pt_update_ops->q;
+	struct dma_fence *fence, *ifence = NULL, *mfence = NULL;
 	struct xe_tlb_inval_job *ijob = NULL, *mjob = NULL;
-	struct dma_fence **fences = NULL;
-	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -2390,15 +2387,14 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 #endif
 
 	if (pt_update_ops->needs_invalidation) {
-		struct xe_exec_queue *q = pt_update_ops->q;
 		struct xe_dep_scheduler *dep_scheduler =
 			to_dep_scheduler(q, tile->primary_gt);
 
 		ijob = xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
-					       dep_scheduler,
+					       dep_scheduler, vm,
 					       pt_update_ops->start,
 					       pt_update_ops->last,
-					       vm->usm.asid);
+					       XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
 		if (IS_ERR(ijob)) {
 			err = PTR_ERR(ijob);
 			goto kill_vm_tile1;
@@ -2410,26 +2406,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 			mjob = xe_tlb_inval_job_create(q,
 						       &tile->media_gt->tlb_inval,
-						       dep_scheduler,
+						       dep_scheduler, vm,
 						       pt_update_ops->start,
 						       pt_update_ops->last,
-						       vm->usm.asid);
+						       XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
 			if (IS_ERR(mjob)) {
 				err = PTR_ERR(mjob);
 				goto free_ijob;
 			}
 			update.mjob = mjob;
-
-			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
-			if (!fences) {
-				err = -ENOMEM;
-				goto free_ijob;
-			}
-			cf = dma_fence_array_alloc(2);
-			if (!cf) {
-				err = -ENOMEM;
-				goto free_ijob;
-			}
 		}
 	}
 
@@ -2460,31 +2445,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				  pt_update_ops->last, fence))
 		dma_fence_wait(fence, false);
 
-	/* tlb invalidation must be done before signaling unbind/rebind */
-	if (ijob) {
-		struct dma_fence *__fence;
-
+	if (ijob)
 		ifence = xe_tlb_inval_job_push(ijob, tile->migrate, fence);
-		__fence = ifence;
+	if (mjob)
+		mfence = xe_tlb_inval_job_push(mjob, tile->migrate, fence);
 
-		if (mjob) {
-			fences[0] = ifence;
-			mfence = xe_tlb_inval_job_push(mjob, tile->migrate,
-						       fence);
-			fences[1] = mfence;
-
-			dma_fence_array_init(cf, 2, fences,
-					     vm->composite_fence_ctx,
-					     vm->composite_fence_seqno++,
-					     false);
-			__fence = &cf->base;
-		}
-
-		dma_fence_put(fence);
-		fence = __fence;
-	}
-
-	if (!mjob) {
+	if (!mjob && !ijob) {
 		dma_resv_add_fence(xe_vm_resv(vm), fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
@@ -2492,6 +2458,14 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 		list_for_each_entry(op, &vops->list, link)
 			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
+	} else if (ijob && !mjob) {
+		dma_resv_add_fence(xe_vm_resv(vm), ifence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+
+		list_for_each_entry(op, &vops->list, link)
+			op_commit(vops->vm, tile, pt_update_ops, op, ifence, NULL);
 	} else {
 		dma_resv_add_fence(xe_vm_resv(vm), ifence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -2511,16 +2485,23 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
 
+	/*
+	 * The last fence is only used for zero bind queue idling; migrate
+	 * queues are not exposed to user space.
+	 */
+	if (!(q->flags & EXEC_QUEUE_FLAG_MIGRATE))
+		xe_exec_queue_last_fence_set(q, vm, fence);
+
 	xe_tlb_inval_job_put(mjob);
 	xe_tlb_inval_job_put(ijob);
+	dma_fence_put(ifence);
+	dma_fence_put(mfence);
 
 	return fence;
 
 free_rfence:
 	kfree(rfence);
 free_ijob:
-	kfree(cf);
-	kfree(fences);
 	xe_tlb_inval_job_put(mjob);
 	xe_tlb_inval_job_put(ijob);
 kill_vm_tile1:
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 82872a51f098..70706362c11a 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -14,7 +14,7 @@
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
 
-#include "xe_device_types.h"
+#include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
@@ -284,26 +284,67 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct dma_fence *fence;
-	int i, num_in_fence = 0, current_fence = 0;
+	int i, num_fence = 0, current_fence = 0;
 
 	lockdep_assert_held(&vm->lock);
 
 	/* Count in-fences */
 	for (i = 0; i < num_sync; ++i) {
 		if (sync[i].fence) {
-			++num_in_fence;
+			++num_fence;
 			fence = sync[i].fence;
 		}
 	}
 
 	/* Easy case... */
-	if (!num_in_fence) {
+	if (!num_fence) {
+		if (q->flags & EXEC_QUEUE_FLAG_VM) {
+			struct xe_exec_queue *__q;
+			struct xe_tile *tile;
+			u8 id;
+
+			for_each_tile(tile, vm->xe, id)
+				num_fence += (1 + XE_MAX_GT_PER_TILE);
+
+			fences = kmalloc_array(num_fence, sizeof(*fences),
+					       GFP_KERNEL);
+			if (!fences)
+				return ERR_PTR(-ENOMEM);
+
+			fences[current_fence++] =
+				xe_exec_queue_last_fence_get(q, vm);
+			for_each_tlb_inval(i)
+				fences[current_fence++] =
+					xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
+			list_for_each_entry(__q, &q->multi_gt_list,
+					    multi_gt_link) {
+				fences[current_fence++] =
+					xe_exec_queue_last_fence_get(__q, vm);
+				for_each_tlb_inval(i)
+					fences[current_fence++] =
+						xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
+			}
+
+			xe_assert(vm->xe, current_fence == num_fence);
+			cf = dma_fence_array_create(num_fence, fences,
+						    dma_fence_context_alloc(1),
+						    1, false);
+			if (!cf)
+				goto err_out;
+
+			return &cf->base;
+		}
+
 		fence = xe_exec_queue_last_fence_get(q, vm);
 		return fence;
 	}
 
-	/* Create composite fence */
-	fences = kmalloc_array(num_in_fence + 1, sizeof(*fences), GFP_KERNEL);
+	/*
+	 * Create composite fence - FIXME - the below code doesn't work. This is
+	 * unused in Mesa so we are ok for the moment. Perhaps we just disable
+	 * this entire code path if number of in fences != 0.
+	 */
+	fences = kmalloc_array(num_fence + 1, sizeof(*fences), GFP_KERNEL);
 	if (!fences)
 		return ERR_PTR(-ENOMEM);
 	for (i = 0; i < num_sync; ++i) {
@@ -313,14 +354,10 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		}
 	}
 	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
-	cf = dma_fence_array_create(num_in_fence, fences,
-				    vm->composite_fence_ctx,
-				    vm->composite_fence_seqno++,
-				    false);
-	if (!cf) {
-		--vm->composite_fence_seqno;
+	cf = dma_fence_array_create(num_fence, fences,
+				    dma_fence_context_alloc(1), 1, false);
+	if (!cf)
 		goto err_out;
-	}
 
 	return &cf->base;
 
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 492def04a559..1ae0dec2cf31 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -12,6 +12,7 @@
 #include "xe_tlb_inval_job.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_vm.h"
 
 /** struct xe_tlb_inval_job - TLB invalidation job */
 struct xe_tlb_inval_job {
@@ -21,6 +22,8 @@ struct xe_tlb_inval_job {
 	struct xe_tlb_inval *tlb_inval;
 	/** @q: exec queue issuing the invalidate */
 	struct xe_exec_queue *q;
+	/** @vm: VM which TLB invalidation is being issued for */
+	struct xe_vm *vm;
 	/** @refcount: ref count of this job */
 	struct kref refcount;
 	/**
@@ -32,8 +35,8 @@ struct xe_tlb_inval_job {
 	u64 start;
 	/** @end: End address to invalidate */
 	u64 end;
-	/** @asid: Address space ID to invalidate */
-	u32 asid;
+	/** @type: GT type */
+	int type;
 	/** @fence_armed: Fence has been armed */
 	bool fence_armed;
 };
@@ -46,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
 		container_of(job->fence, typeof(*ifence), base);
 
 	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
-			   job->end, job->asid);
+			   job->end, job->vm->usm.asid);
 
 	return job->fence;
 }
@@ -70,9 +73,10 @@ static const struct xe_dep_job_ops dep_job_ops = {
  * @q: exec queue issuing the invalidate
  * @tlb_inval: TLB invalidation client
  * @dep_scheduler: Dependency scheduler for job
+ * @vm: VM which TLB invalidation is being issued for
  * @start: Start address to invalidate
  * @end: End address to invalidate
- * @asid: Address space ID to invalidate
+ * @type: GT type
  *
  * Create a TLB invalidation job and initialize internal fields. The caller is
  * responsible for releasing the creation reference.
@@ -81,8 +85,8 @@ static const struct xe_dep_job_ops dep_job_ops = {
  */
 struct xe_tlb_inval_job *
 xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
-			struct xe_dep_scheduler *dep_scheduler, u64 start,
-			u64 end, u32 asid)
+			struct xe_dep_scheduler *dep_scheduler,
+			struct xe_vm *vm, u64 start, u64 end, int type)
 {
 	struct xe_tlb_inval_job *job;
 	struct drm_sched_entity *entity =
@@ -90,19 +94,24 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	struct xe_tlb_inval_fence *ifence;
 	int err;
 
+	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+
 	job = kmalloc(sizeof(*job), GFP_KERNEL);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
 	job->q = q;
+	job->vm = vm;
 	job->tlb_inval = tlb_inval;
 	job->start = start;
 	job->end = end;
-	job->asid = asid;
 	job->fence_armed = false;
 	job->dep.ops = &dep_job_ops;
+	job->type = type;
 	kref_init(&job->refcount);
 	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
+	xe_vm_get(vm);		/* Pairs with put in xe_tlb_inval_job_destroy */
 
 	ifence = kmalloc(sizeof(*ifence), GFP_KERNEL);
 	if (!ifence) {
@@ -124,6 +133,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 err_fence:
 	kfree(ifence);
 err_job:
+	xe_vm_put(vm);
 	xe_exec_queue_put(q);
 	kfree(job);
 
@@ -138,6 +148,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 		container_of(job->fence, typeof(*ifence), base);
 	struct xe_exec_queue *q = job->q;
 	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_vm *vm = job->vm;
 
 	if (!job->fence_armed)
 		kfree(ifence);
@@ -147,6 +158,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 
 	drm_sched_job_cleanup(&job->dep.drm);
 	kfree(job);
+	xe_vm_put(vm);		/* Pairs with get from xe_tlb_inval_job_create */
 	xe_exec_queue_put(q);	/* Pairs with get from xe_tlb_inval_job_create */
 	xe_pm_runtime_put(xe);	/* Pairs with get from xe_tlb_inval_job_create */
 }
@@ -231,6 +243,11 @@ struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
 	dma_fence_get(&job->dep.drm.s_fence->finished);
 	drm_sched_entity_push_job(&job->dep.drm);
 
+	/* Let the upper layers fish this out */
+	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
+					       &job->dep.drm.s_fence->finished,
+					       job->type);
+
 	xe_migrate_job_unlock(m, job->q);
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
index e63edcb26b50..4d6df1a6c6ca 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
@@ -11,14 +11,15 @@
 struct dma_fence;
 struct xe_dep_scheduler;
 struct xe_exec_queue;
+struct xe_migrate;
 struct xe_tlb_inval;
 struct xe_tlb_inval_job;
-struct xe_migrate;
+struct xe_vm;
 
 struct xe_tlb_inval_job *
 xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 			struct xe_dep_scheduler *dep_scheduler,
-			u64 start, u64 end, u32 asid);
+			struct xe_vm *vm, u64 start, u64 end, int type);
 
 int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d2a2f823f1b3..2f181c44b8b7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1623,9 +1623,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		}
 	}
 
-	if (number_tiles > 1)
-		vm->composite_fence_ctx = dma_fence_context_alloc(1);
-
 	if (xef && xe->info.has_asid) {
 		u32 asid;
 
@@ -3107,20 +3104,26 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int number_tiles = 0, current_fence = 0, err;
+	int number_tiles = 0, current_fence = 0, n_fence = 0, err;
 	u8 id;
 
 	number_tiles = vm_ops_setup_tile_args(vm, vops);
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	if (number_tiles > 1) {
-		fences = kmalloc_array(number_tiles, sizeof(*fences),
-				       GFP_KERNEL);
-		if (!fences) {
-			fence = ERR_PTR(-ENOMEM);
-			goto err_trace;
-		}
+	for_each_tile(tile, vm->xe, id)
+		n_fence += (1 + XE_MAX_GT_PER_TILE);
+
+	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
+	if (!fences) {
+		fence = ERR_PTR(-ENOMEM);
+		goto err_trace;
+	}
+
+	cf = dma_fence_array_alloc(n_fence);
+	if (!cf) {
+		fence = ERR_PTR(-ENOMEM);
+		goto err_out;
 	}
 
 	for_each_tile(tile, vm->xe, id) {
@@ -3137,29 +3140,30 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	trace_xe_vm_ops_execute(vops);
 
 	for_each_tile(tile, vm->xe, id) {
+		struct xe_exec_queue *q = vops->pt_update_ops[tile->id].q;
+		int i;
+
+		fence = NULL;
 		if (!vops->pt_update_ops[id].num_ops)
-			continue;
+			goto collect_fences;
 
 		fence = xe_pt_update_ops_run(tile, vops);
 		if (IS_ERR(fence))
 			goto err_out;
 
-		if (fences)
-			fences[current_fence++] = fence;
+collect_fences:
+		fences[current_fence++] = fence ?: dma_fence_get_stub();
+		xe_migrate_job_lock(tile->migrate, q);
+		for_each_tlb_inval(i)
+			fences[current_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
+		xe_migrate_job_unlock(tile->migrate, q);
 	}
 
-	if (fences) {
-		cf = dma_fence_array_create(number_tiles, fences,
-					    vm->composite_fence_ctx,
-					    vm->composite_fence_seqno++,
-					    false);
-		if (!cf) {
-			--vm->composite_fence_seqno;
-			fence = ERR_PTR(-ENOMEM);
-			goto err_out;
-		}
-		fence = &cf->base;
-	}
+	xe_assert(vm->xe, current_fence == n_fence);
+	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
+			     1, false);
+	fence = &cf->base;
 
 	for_each_tile(tile, vm->xe, id) {
 		if (!vops->pt_update_ops[id].num_ops)
@@ -3220,7 +3224,6 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_user_fence *ufence;
 	struct xe_vma_op *op;
 	int i;
@@ -3241,7 +3244,6 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 	if (fence) {
 		for (i = 0; i < vops->num_syncs; i++)
 			xe_sync_entry_signal(vops->syncs + i, fence);
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	}
 }
 
@@ -3435,19 +3437,19 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 				       struct xe_sync_entry *syncs,
 				       int num_syncs)
 {
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int i, err = 0;
 
-	fence = xe_sync_in_fence_get(syncs, num_syncs,
-				     to_wait_exec_queue(vm, q), vm);
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+	if (num_syncs) {
+		fence = xe_sync_in_fence_get(syncs, num_syncs,
+					     to_wait_exec_queue(vm, q), vm);
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
 
-	for (i = 0; i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], fence);
+		for (i = 0; i < num_syncs; i++)
+			xe_sync_entry_signal(&syncs[i], fence);
+	}
 
-	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
-				     fence);
 	dma_fence_put(fence);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d6e2a0fdd4b3..542dbe2f9310 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -221,11 +221,6 @@ struct xe_vm {
 #define XE_VM_FLAG_GSC			BIT(8)
 	unsigned long flags;
 
-	/** @composite_fence_ctx: context composite fence */
-	u64 composite_fence_ctx;
-	/** @composite_fence_seqno: seqno for composite fence */
-	u32 composite_fence_seqno;
-
 	/**
 	 * @lock: outer most lock, protects objects of anything attached to this
 	 * VM
-- 
2.34.1

