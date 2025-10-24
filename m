Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE447CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6104610E1AA;
	Fri, 24 Oct 2025 15:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaYfrKEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B607210E081
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761319409; x=1792855409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5RMV0rdP2DGXh9Diz3k49jp6tb2fa2M4d3GTY7RWyA=;
 b=GaYfrKEjhvZPPQeLrthao47RZ3BJ8mpp/Sxik2BYKLUDVN3cLi/uCnE7
 qrfD8M020qpknP7rCcDp0H12upWmmVz+IvQqUOPJzqM2ZjweO46SbSubD
 HAZxujM5hbeidhKfgBx4+gU0kKBw5T8GK4pSrrsow16y5RalODzlQZner
 CEx9zEIWUJeVKaq00ZnJgX1vRRx3uCommdQxDy3vpqMny3+JolcswLqHK
 A9AbM6seo24YFxmQsx1FfncSnvoU1eAGl4vvC0yG74JBdBDANxjuQF8il
 NP9i3HKGt5IRx69dqfO2ZJpXh/7LrMv3qwJL51AUBp5c+4cZuvO0f1HS/ Q==;
X-CSE-ConnectionGUID: QM1oFYC+Q76NZP1sIjxKbA==
X-CSE-MsgGUID: UM/0yBKiRsWf3U8+YEEnBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74621850"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74621850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:23:28 -0700
X-CSE-ConnectionGUID: MNve1m6IQ6m7ukDptFKdqg==
X-CSE-MsgGUID: wJycILVWTC2/DoTOpwT9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="184351301"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:23:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 2/2] drm/xe: Decouple bind queue last fence from TLB
 invalidations
Date: Fri, 24 Oct 2025 08:23:23 -0700
Message-Id: <20251024152323.1281242-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024152323.1281242-1-matthew.brost@intel.com>
References: <20251024152323.1281242-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c   | 64 +++++++++++++-----------------------
 drivers/gpu/drm/xe/xe_sync.c | 62 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c   | 53 +++++++++++++++--------------
 3 files changed, 103 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d22fd1ccc0ba..7637757ca0dc 100644
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
@@ -2390,7 +2387,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 #endif
 
 	if (pt_update_ops->needs_invalidation) {
-		struct xe_exec_queue *q = pt_update_ops->q;
 		struct xe_dep_scheduler *dep_scheduler =
 			to_dep_scheduler(q, tile->primary_gt);
 
@@ -2419,17 +2415,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
-
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
+	if (mjob)
+		mfence = xe_tlb_inval_job_push(mjob, tile->migrate, fence);
 
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
@@ -2511,16 +2485,22 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
 
+	xe_exec_queue_last_fence_set(q, vm, fence);
+	xe_exec_queue_tlb_inval_last_fence_set(q, vm, ifence,
+					       XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_exec_queue_tlb_inval_last_fence_set(q, vm, mfence,
+					       XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
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
index 82872a51f098..b77ac3900b5e 100644
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
@@ -284,26 +284,70 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
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
-		fence = xe_exec_queue_last_fence_get(q, vm);
-		return fence;
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
+						    vm->composite_fence_ctx,
+						    vm->composite_fence_seqno++,
+						    false);
+			if (!cf) {
+				--vm->composite_fence_seqno;
+				goto err_out;
+			}
+
+			return &cf->base;
+		} else {
+			fence = xe_exec_queue_last_fence_get(q, vm);
+			return fence;
+		}
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
@@ -313,7 +357,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		}
 	}
 	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
-	cf = dma_fence_array_create(num_in_fence, fences,
+	cf = dma_fence_array_create(num_fence, fences,
 				    vm->composite_fence_ctx,
 				    vm->composite_fence_seqno++,
 				    false);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d2a2f823f1b3..f6fda1dd8f9d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3107,20 +3107,26 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
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
@@ -3137,29 +3143,28 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
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
+		for_each_tlb_inval(i)
+			fences[current_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
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
+	dma_fence_array_init(cf, n_fence, fences, vm->composite_fence_ctx,
+			     vm->composite_fence_seqno++, false);
+	fence = &cf->base;
 
 	for_each_tile(tile, vm->xe, id) {
 		if (!vops->pt_update_ops[id].num_ops)
@@ -3220,7 +3225,6 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_user_fence *ufence;
 	struct xe_vma_op *op;
 	int i;
@@ -3241,7 +3245,6 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 	if (fence) {
 		for (i = 0; i < vops->num_syncs; i++)
 			xe_sync_entry_signal(vops->syncs + i, fence);
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	}
 }
 
-- 
2.34.1

