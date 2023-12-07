Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0EAC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEF210E7E8;
	Thu,  7 Dec 2023 05:57:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F5210E7E8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701928631; x=1733464631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9DLgeYM+xTV3NZ032Y3dlsQBxigoDwXRpwSHf4CsPk=;
 b=Hv0Csd4gWU1WYs6Jq5jFsVWQULG7MoSIV+/QoSxJgm7QI4JBxcfsfMoQ
 qlauk0DhbyV8tCfIcXa04AWosk8joJXv1JBAEXXnE2aujdYKWmMj/v741
 imVlu46g0V8A+fXMieHgs5H5M9vBhszq8Gz4+CXXdUrd5wDXgruVINqDV
 HGvrvOuOkItJScJqHCfo22hvDVDHllAZoevCA5lJgR1n45g7ZrYIQbGye
 w1RQwMx6wA46UMuCRFZaGWOijHjwXBlJe22jI1KuwDFNeKkM0uQEhvw1O
 /97JQNNCKSRIRf85vG34mAEMLG3Oyc7uU70HmY498gc0XSCSQCdic/QgA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7540182"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7540182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895019866"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895019866"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 21:57:29 -0800
Message-Id: <20231207055729.438642-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207055729.438642-1-matthew.brost@intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 7/7] drm/xe/uapi: Uniform async vs sync
 handling
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove concept of async vs sync VM bind queues, rather make async vs
sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
a singular flag IOCTL rather than per VM bind op flag too. Add
DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
this. Support this new flag for both the VM bind IOCTL and the exec
IOCTL to match behavior.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  58 ++++++++----
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_vm.c               | 110 ++++++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h         |  15 ++--
 include/uapi/drm/xe_drm.h                |  56 +++++++-----
 6 files changed, 129 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 92b0da6580e8..c62cabfaa112 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -130,12 +130,15 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
 	return err;
 }
 
+#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
+
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_exec *args = data;
-	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
+	struct drm_xe_sync __user *syncs_user =
+		u64_to_user_ptr(args->syncs.syncs);
 	u64 __user *addresses_user = u64_to_user_ptr(args->address);
 	struct xe_exec_queue *q;
 	struct xe_sync_entry *syncs = NULL;
@@ -143,15 +146,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_exec exec;
 	u32 i, num_syncs = 0;
 	struct xe_sched_job *job;
-	struct dma_fence *rebind_fence;
+	struct dma_fence *rebind_fence, *job_fence;
 	struct xe_vm *vm;
-	bool write_locked;
+	bool write_locked, skip_job_put = false;
+	bool wait = args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP;
 	ktime_t end = 0;
 	int err = 0;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]) ||
+	    XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
+	    XE_IOCTL_DBG(xe, wait && args->syncs.num_syncs))
 		return -EINVAL;
 
 	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
@@ -170,8 +176,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec_queue;
 	}
 
-	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+	if (args->syncs.num_syncs) {
+		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs),
+				GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto err_exec_queue;
@@ -180,7 +187,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	vm = q->vm;
 
-	for (i = 0; i < args->num_syncs; i++) {
+	for (i = 0; i < args->syncs.num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
@@ -245,9 +252,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				err = PTR_ERR(fence);
 				goto err_exec;
 			}
+
 			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
+
 			xe_exec_queue_last_fence_set(q, vm, fence);
+			if (wait) {
+				long timeout = dma_fence_wait(fence, true);
+
+				if (timeout < 0)
+					err = -EINTR;
+			}
 			dma_fence_put(fence);
 		}
 
@@ -331,42 +346,51 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
+	job_fence = &job->drm.s_fence->finished;
+	if (wait)
+		dma_fence_get(job_fence);
 	if (!xe_vm_in_lr_mode(vm)) {
 		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(&vm->resv,
-				   &job->drm.s_fence->finished,
+		dma_resv_add_fence(&vm->resv, job_fence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/*
 		 * Make implicit sync work across drivers, assuming all external
 		 * BOs are written as we don't pass in a read / write list.
 		 */
-		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
-					DMA_RESV_USAGE_WRITE);
+		xe_vm_fence_all_extobjs(vm, job_fence, DMA_RESV_USAGE_WRITE);
 	}
 
 	for (i = 0; i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], job,
-				     &job->drm.s_fence->finished);
+		xe_sync_entry_signal(&syncs[i], job, job_fence);
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
 	if (!xe_vm_in_lr_mode(vm))
-		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
+		xe_exec_queue_last_fence_set(q, vm, job_fence);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
-	if (!err && !xe_vm_in_lr_mode(vm)) {
+	if (!xe_vm_in_lr_mode(vm)) {
 		spin_lock(&xe->ttm.lru_lock);
 		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
+	skip_job_put = true;
+	if (wait) {
+		long timeout = dma_fence_wait(job_fence, true);
+
+		dma_fence_put(job_fence);
+		if (timeout < 0)
+			err = -EINTR;
+	}
+
 err_repin:
 	if (!xe_vm_in_lr_mode(vm))
 		up_read(&vm->userptr.notifier_lock);
 err_put_job:
-	if (err)
+	if (err && !skip_job_put)
 		xe_sched_job_put(job);
 err_exec:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3911d14522ee..98776d02d634 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
-	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
-		bool sync = eci[0].engine_class ==
-			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
-
+	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_exec_queue *new;
 
@@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe,
 						   EXEC_QUEUE_FLAG_PERSISTENT |
 						   EXEC_QUEUE_FLAG_VM |
-						   (sync ? 0 :
-						    EXEC_QUEUE_FLAG_VM_ASYNC) |
 						   (id ?
 						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
 						    0));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 52f0927d0d9b..c78f6e8b41c4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -74,8 +74,6 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
-/* VM jobs for this queue are asynchronous */
-#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cf2eb44a71db..4b0c976c003a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1433,9 +1433,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM |
-				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
-				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
+			u32 create_flags = EXEC_QUEUE_FLAG_VM;
 
 			if (!vm->pt_root[id])
 				continue;
@@ -1835,16 +1833,10 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	return ERR_PTR(err);
 }
 
-static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
-{
-	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
-		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
-}
-
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
 			u32 num_syncs, bool immediate, bool first_op,
-			bool last_op)
+			bool last_op, bool async)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1870,7 +1862,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
+	if (last_op && !async)
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
@@ -1880,7 +1872,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 		      struct xe_bo *bo, struct xe_sync_entry *syncs,
 		      u32 num_syncs, bool immediate, bool first_op,
-		      bool last_op)
+		      bool last_op, bool async)
 {
 	int err;
 
@@ -1894,12 +1886,12 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
 	}
 
 	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
-			    last_op);
+			    last_op, async);
 }
 
 static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-			u32 num_syncs, bool first_op, bool last_op)
+			u32 num_syncs, bool first_op, bool last_op, bool async)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1914,7 +1906,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
+	if (last_op && !async)
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
@@ -1923,7 +1915,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
-				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -1977,8 +1968,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
 		flags |= XE_VM_FLAG_LR_MODE;
-	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
-		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
@@ -2062,7 +2051,7 @@ static const u32 region_to_mem_type[] = {
 static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			  struct xe_exec_queue *q, u32 region,
 			  struct xe_sync_entry *syncs, u32 num_syncs,
-			  bool first_op, bool last_op)
+			  bool first_op, bool last_op, bool async)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	int err;
@@ -2077,7 +2066,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
+				  true, first_op, last_op, async);
 	} else {
 		int i;
 
@@ -2400,6 +2389,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 
 		op->q = q;
+		if (async)
+			op->flags |= XE_VMA_OP_ASYNC;
 
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
@@ -2538,7 +2529,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 				 op->syncs, op->num_syncs,
 				 op->map.immediate || !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
-				 op->flags & XE_VMA_OP_LAST);
+				 op->flags & XE_VMA_OP_LAST,
+				 op->flags & XE_VMA_OP_ASYNC);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2552,7 +2544,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 					   op->num_syncs,
 					   op->flags & XE_VMA_OP_FIRST,
 					   op->flags & XE_VMA_OP_LAST &&
-					   !prev && !next);
+					   !prev && !next,
+					   op->flags & XE_VMA_OP_ASYNC);
 			if (err)
 				break;
 			op->remap.unmap_done = true;
@@ -2563,7 +2556,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 			err = xe_vm_bind(vm, op->remap.prev, op->q,
 					 xe_vma_bo(op->remap.prev), op->syncs,
 					 op->num_syncs, true, false,
-					 op->flags & XE_VMA_OP_LAST && !next);
+					 op->flags & XE_VMA_OP_LAST && !next,
+					 op->flags & XE_VMA_OP_ASYNC);
 			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (err)
 				break;
@@ -2576,7 +2570,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 					 xe_vma_bo(op->remap.next),
 					 op->syncs, op->num_syncs,
 					 true, false,
-					 op->flags & XE_VMA_OP_LAST);
+					 op->flags & XE_VMA_OP_LAST,
+					 op->flags & XE_VMA_OP_ASYNC);
 			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (err)
 				break;
@@ -2588,13 +2583,15 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_UNMAP:
 		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
 				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
-				   op->flags & XE_VMA_OP_LAST);
+				   op->flags & XE_VMA_OP_LAST,
+				   op->flags & XE_VMA_OP_ASYNC);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
 				     op->syncs, op->num_syncs,
 				     op->flags & XE_VMA_OP_FIRST,
-				     op->flags & XE_VMA_OP_LAST);
+				     op->flags & XE_VMA_OP_LAST,
+				     op->flags & XE_VMA_OP_ASYNC);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -2808,16 +2805,16 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
-	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
-	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
-	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
+	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
-	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
+	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
 	 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
+#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
 
@@ -2829,7 +2826,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int err;
 	int i;
 
-	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	if (XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -2857,6 +2854,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		*bind_ops = &args->bind;
 	}
 
+	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
+
+	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
+	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
+		err = -EINVAL;
+		goto free_bind_ops;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = (*bind_ops)[i].range;
 		u64 addr = (*bind_ops)[i].addr;
@@ -2887,18 +2892,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			goto free_bind_ops;
 		}
 
-		if (i == 0) {
-			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
-			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
-				err = -EINVAL;
-				goto free_bind_ops;
-			}
-		} else if (XE_IOCTL_DBG(xe, *async !=
-					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
-			err = -EINVAL;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
@@ -2951,7 +2944,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 				       struct xe_exec_queue *q,
 				       struct xe_sync_entry *syncs,
-				       int num_syncs)
+				       int num_syncs, bool async)
 {
 	struct dma_fence *fence;
 	int i, err = 0;
@@ -2967,7 +2960,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
 				     fence);
 
-	if (xe_vm_sync_mode(vm, q)) {
+	if (!async) {
 		long timeout = dma_fence_wait(fence, true);
 
 		if (timeout < 0)
@@ -3001,7 +2994,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		return err;
 
-	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	if (XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -3016,12 +3009,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EINVAL;
 			goto put_exec_queue;
 		}
-
-		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
-				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
-			err = -EINVAL;
-			goto put_exec_queue;
-		}
 	}
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -3030,14 +3017,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_exec_queue;
 	}
 
-	if (!args->exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
-				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
-			err = -EINVAL;
-			goto put_vm;
-		}
-	}
-
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
@@ -3127,16 +3106,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+	if (args->syncs.num_syncs) {
+		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto put_obj;
 		}
 	}
 
-	syncs_user = u64_to_user_ptr(args->syncs);
-	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
+	syncs_user = u64_to_user_ptr(args->syncs.syncs);
+	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
 					  (xe_vm_in_lr_mode(vm) ?
@@ -3210,7 +3189,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
 	if (err == -ENODATA)
-		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
+		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs,
+						  async);
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 23abdfd8622f..ce8b9bde7e9c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -167,13 +167,12 @@ struct xe_vm {
 	 */
 #define XE_VM_FLAG_64K			BIT(0)
 #define XE_VM_FLAG_LR_MODE		BIT(1)
-#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
-#define XE_VM_FLAG_MIGRATION		BIT(3)
-#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
-#define XE_VM_FLAG_FAULT_MODE		BIT(5)
-#define XE_VM_FLAG_BANNED		BIT(6)
-#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
-#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
+#define XE_VM_FLAG_MIGRATION		BIT(2)
+#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
+#define XE_VM_FLAG_FAULT_MODE		BIT(4)
+#define XE_VM_FLAG_BANNED		BIT(5)
+#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
@@ -385,6 +384,8 @@ enum xe_vma_op_flags {
 	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
 	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
 	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
+	/** @XE_VMA_OP_ASYNC: operation is async */
+	XE_VMA_OP_ASYNC			= BIT(5),
 };
 
 /** struct xe_vma_op - VMA operation */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eb03a49c17a1..fd8172fe2d9a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
-#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
 	__u16 engine_class;
 
 	__u16 engine_instance;
@@ -660,7 +659,6 @@ struct drm_xe_vm_create {
 	 * still enable recoverable pagefaults if supported by the device.
 	 */
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
 	/*
 	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
 	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
@@ -668,7 +666,7 @@ struct drm_xe_vm_create {
 	 * The xe driver internally uses recoverable pagefaults to implement
 	 * this.
 	 */
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
 	__u32 op;
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -807,6 +804,27 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_syncs - In / out syncs for IOCTLs.
+ */
+struct drm_xe_syncs {
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/*
+	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
+	 */
+#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
+	/** @flags: Sync flags */
+	__u32 flags;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -838,14 +856,8 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @pad: MBZ */
-	__u32 pad2;
-
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
+	/** @syncs: syncs for bind */
+	struct drm_xe_syncs syncs;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -974,14 +986,14 @@ struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @exec_queue_id: Exec queue ID for the batch buffer */
 	__u32 exec_queue_id;
 
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
+	/** @syncs: syncs for exec */
+	struct drm_xe_syncs syncs;
 
 	/**
 	 * @address: address of batch buffer if num_batch_buffer == 1 or an
@@ -995,8 +1007,8 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
-	/** @pad: MBZ */
-	__u16 pad[3];
+	/** @pad2: MBZ */
+	__u16 pad2[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1

