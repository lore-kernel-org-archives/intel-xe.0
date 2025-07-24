Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3775C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B3810E2BA;
	Thu, 24 Jul 2025 19:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjSCm0+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E58B10E02E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753384232; x=1784920232;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=d9iU0yvRCJn5/5/A/dokswpr/4Y0KlL6I1yXGY8Iil8=;
 b=DjSCm0+Fv2XvaOuSyUn7cpbk0PRhTXLYTMhTCvDrl4ymhcVPTKyzO0gm
 TSRCniBfBcdMzW2uNvSrgj0XP4+6xlK3x80F068Rx1QMX/ZGUra4neKFs
 jC7zaHJPYKJA+Jrt/yEIGLIjQA1HolPfKP9ugHDQVAWYxNokbzuhth5mO
 OdH9j6UFLTM9IynWTjjoDV4QF93LRsO8QXkAtrM1MdACskS+VipTHaMl+
 d5A6hY3D6yy6IePcyqJYTbMPB1SXpJGK3EYARC/mnXg5648wx6fCVaTXz
 Tl7zPpMfh1FbEkwbB0g6Y1BaxPp4+53jXn2FUqhWyygl4v7iJwnlzCoQQ Q==;
X-CSE-ConnectionGUID: b1lRFEd3Q3iuQHPOmUcTfA==
X-CSE-MsgGUID: Yx9WyjI4SiWbBZjeGnVAWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65976730"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="65976730"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:31 -0700
X-CSE-ConnectionGUID: mn+0Z8GCRJeSsc6d01b+cg==
X-CSE-MsgGUID: 2gFI8X6LQaicjf0dlKYYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160387671"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 6/7] drm/xe: Use GT TLB invalidation jobs in PT layer
Date: Thu, 24 Jul 2025 12:12:15 -0700
Message-Id: <20250724191216.4076566-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
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

Rather than open-coding GT TLB invalidations in the PT layer, use GT TLB
invalidation jobs. The real benefit is that GT TLB invalidation jobs use
a single dma-fence context, allowing the generated fences to be squashed
in dma-resv/DRM scheduler.

v2:
 - s/;;/; (checkpatch)
 - Move ijob/mjob job push after range fence install
v3:
 - Remove extra newline (Stuart)
 - Set ijob/mjob near creation (Stuart)
 - Add comment back in (Stuart)

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h |   9 ++
 drivers/gpu/drm/xe/xe_pt.c      | 178 +++++++++++++-------------------
 2 files changed, 80 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 5af2f5aa645f..3758f9615484 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -14,6 +14,7 @@ struct ttm_resource;
 
 struct xe_bo;
 struct xe_gt;
+struct xe_gt_tlb_inval_job;
 struct xe_exec_queue;
 struct xe_migrate;
 struct xe_migrate_pt_update;
@@ -91,6 +92,14 @@ struct xe_migrate_pt_update {
 	struct xe_vma_ops *vops;
 	/** @job: The job if a GPU page-table update. NULL otherwise */
 	struct xe_sched_job *job;
+	/**
+	 * @ijob: The GT TLB invalidation job for primary tile. NULL otherwise
+	 */
+	struct xe_gt_tlb_inval_job *ijob;
+	/**
+	 * @mjob: The GT TLB invalidation job for media tile. NULL otherwise
+	 */
+	struct xe_gt_tlb_inval_job *mjob;
 	/** @tile_id: Tile ID of the update */
 	u8 tile_id;
 };
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c8e63bd23300..330cc0f54a3f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -13,7 +13,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval_job.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
@@ -1261,6 +1261,8 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 }
 
 static int xe_pt_vm_dependencies(struct xe_sched_job *job,
+				 struct xe_gt_tlb_inval_job *ijob,
+				 struct xe_gt_tlb_inval_job *mjob,
 				 struct xe_vm *vm,
 				 struct xe_vma_ops *vops,
 				 struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -1328,6 +1330,20 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	for (i = 0; job && !err && i < vops->num_syncs; i++)
 		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
 
+	if (job) {
+		if (ijob) {
+			err = xe_gt_tlb_inval_job_alloc_dep(ijob);
+			if (err)
+				return err;
+		}
+
+		if (mjob) {
+			err = xe_gt_tlb_inval_job_alloc_dep(mjob);
+			if (err)
+				return err;
+		}
+	}
+
 	return err;
 }
 
@@ -1339,7 +1355,8 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[pt_update->tile_id];
 
-	return xe_pt_vm_dependencies(pt_update->job, vm, pt_update->vops,
+	return xe_pt_vm_dependencies(pt_update->job, pt_update->ijob,
+				     pt_update->mjob, vm, pt_update->vops,
 				     pt_update_ops, rftree);
 }
 
@@ -1509,75 +1526,6 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 }
 #endif
 
-struct invalidation_fence {
-	struct xe_gt_tlb_invalidation_fence base;
-	struct xe_gt *gt;
-	struct dma_fence *fence;
-	struct dma_fence_cb cb;
-	struct work_struct work;
-	u64 start;
-	u64 end;
-	u32 asid;
-};
-
-static void invalidation_fence_cb(struct dma_fence *fence,
-				  struct dma_fence_cb *cb)
-{
-	struct invalidation_fence *ifence =
-		container_of(cb, struct invalidation_fence, cb);
-	struct xe_device *xe = gt_to_xe(ifence->gt);
-
-	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
-	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
-	} else {
-		ifence->base.base.error = ifence->fence->error;
-		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
-	}
-	dma_fence_put(ifence->fence);
-}
-
-static void invalidation_fence_work_func(struct work_struct *w)
-{
-	struct invalidation_fence *ifence =
-		container_of(w, struct invalidation_fence, work);
-	struct xe_device *xe = gt_to_xe(ifence->gt);
-
-	trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
-	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
-				     ifence->end, ifence->asid);
-}
-
-static void invalidation_fence_init(struct xe_gt *gt,
-				    struct invalidation_fence *ifence,
-				    struct dma_fence *fence,
-				    u64 start, u64 end, u32 asid)
-{
-	int ret;
-
-	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
-
-	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
-
-	ifence->fence = fence;
-	ifence->gt = gt;
-	ifence->start = start;
-	ifence->end = end;
-	ifence->asid = asid;
-
-	INIT_WORK(&ifence->work, invalidation_fence_work_func);
-	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
-	if (ret == -ENOENT) {
-		dma_fence_put(ifence->fence);	/* Usually dropped in CB */
-		invalidation_fence_work_func(&ifence->work);
-	} else if (ret) {
-		dma_fence_put(&ifence->base.base);	/* Caller ref */
-		dma_fence_put(&ifence->base.base);	/* Creation ref */
-	}
-
-	xe_gt_assert(gt, !ret || ret == -ENOENT);
-}
-
 struct xe_pt_stage_unbind_walk {
 	/** @base: The pagewalk base-class. */
 	struct xe_pt_walk base;
@@ -2407,8 +2355,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm *vm = vops->vm;
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
-	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL, *mfence = NULL;
+	struct dma_fence *fence, *ifence, *mfence;
+	struct xe_gt_tlb_inval_job *ijob = NULL, *mjob = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
@@ -2440,26 +2388,38 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 #endif
 
 	if (pt_update_ops->needs_invalidation) {
-		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-		if (!ifence) {
-			err = -ENOMEM;
+		ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
+						  tile->primary_gt,
+						  pt_update_ops->start,
+						  pt_update_ops->last,
+						  vm->usm.asid);
+		if (IS_ERR(ijob)) {
+			err = PTR_ERR(ijob);
 			goto kill_vm_tile1;
 		}
+		update.ijob = ijob;
+
 		if (tile->media_gt) {
-			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-			if (!mfence) {
-				err = -ENOMEM;
-				goto free_ifence;
+			mjob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
+							  tile->media_gt,
+							  pt_update_ops->start,
+							  pt_update_ops->last,
+							  vm->usm.asid);
+			if (IS_ERR(mjob)) {
+				err = PTR_ERR(mjob);
+				goto free_ijob;
 			}
+			update.mjob = mjob;
+
 			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
 			if (!fences) {
 				err = -ENOMEM;
-				goto free_ifence;
+				goto free_ijob;
 			}
 			cf = dma_fence_array_alloc(2);
 			if (!cf) {
 				err = -ENOMEM;
-				goto free_ifence;
+				goto free_ijob;
 			}
 		}
 	}
@@ -2467,7 +2427,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
 	if (!rfence) {
 		err = -ENOMEM;
-		goto free_ifence;
+		goto free_ijob;
 	}
 
 	fence = xe_migrate_update_pgtables(tile->migrate, &update);
@@ -2491,30 +2451,31 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				  pt_update_ops->last, fence))
 		dma_fence_wait(fence, false);
 
-	/* tlb invalidation must be done before signaling rebind */
-	if (ifence) {
-		if (mfence)
-			dma_fence_get(fence);
-		invalidation_fence_init(tile->primary_gt, ifence, fence,
-					pt_update_ops->start,
-					pt_update_ops->last, vm->usm.asid);
-		if (mfence) {
-			invalidation_fence_init(tile->media_gt, mfence, fence,
-						pt_update_ops->start,
-						pt_update_ops->last, vm->usm.asid);
-			fences[0] = &ifence->base.base;
-			fences[1] = &mfence->base.base;
+	/* tlb invalidation must be done before signaling unbind/rebind */
+	if (ijob) {
+		struct dma_fence *__fence;
+
+		ifence = xe_gt_tlb_inval_job_push(ijob, tile->migrate, fence);
+		__fence = ifence;
+
+		if (mjob) {
+			fences[0] = ifence;
+			mfence = xe_gt_tlb_inval_job_push(mjob, tile->migrate,
+							  fence);
+			fences[1] = mfence;
+
 			dma_fence_array_init(cf, 2, fences,
 					     vm->composite_fence_ctx,
 					     vm->composite_fence_seqno++,
 					     false);
-			fence = &cf->base;
-		} else {
-			fence = &ifence->base.base;
+			__fence = &cf->base;
 		}
+
+		dma_fence_put(fence);
+		fence = __fence;
 	}
 
-	if (!mfence) {
+	if (!mjob) {
 		dma_resv_add_fence(xe_vm_resv(vm), fence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
@@ -2523,19 +2484,19 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		list_for_each_entry(op, &vops->list, link)
 			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
 	} else {
-		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
+		dma_resv_add_fence(xe_vm_resv(vm), ifence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
+		dma_resv_add_fence(xe_vm_resv(vm), mfence,
 				   pt_update_ops->wait_vm_bookkeep ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op,
-				  &ifence->base.base, &mfence->base.base);
+			op_commit(vops->vm, tile, pt_update_ops, op, ifence,
+				  mfence);
 	}
 
 	if (pt_update_ops->needs_svm_lock)
@@ -2543,15 +2504,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
 
+	xe_gt_tlb_inval_job_put(mjob);
+	xe_gt_tlb_inval_job_put(ijob);
+
 	return fence;
 
 free_rfence:
 	kfree(rfence);
-free_ifence:
+free_ijob:
 	kfree(cf);
 	kfree(fences);
-	kfree(mfence);
-	kfree(ifence);
+	xe_gt_tlb_inval_job_put(mjob);
+	xe_gt_tlb_inval_job_put(ijob);
 kill_vm_tile1:
 	if (err != -EAGAIN && err != -ENODATA && tile->id)
 		xe_vm_kill(vops->vm, false);
-- 
2.34.1

