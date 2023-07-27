Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0B5C001DF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDC510E0B0;
	Thu, 27 Jul 2023 01:40:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3228B89861
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422005; x=1721958005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NKSHpoXp28KmrLG8Hhwm9Q3eLDHxiakKpzmzedOtmM=;
 b=MRiyMHVisfgZ6GjD44NTJqQ5bKFG8SWu4xu7JBRbeS1Ip5JuPMhVtnCm
 R4jEiLlRuNnlNI2ShMgC86BxrDwlufDA2Y8BAluppmt5w12MkB/kW7U2m
 XB040gllaKcghJg9+O6DZaZdp4d9wmcep7ew7wxBFs/Y3T3PJqgGrFqjW
 hKSyIy+bzHNxXLg4qgjvLW31hTILJcamTdFsBoxlSNFqfBblD5rpHKzd2
 Tgcf+6NpkVK4Lt9GUpLOj/Xr7sm2tdOJrazSa52evFEVsx1a38VdnV/IZ
 ttZIMB0hEp8j5fxzXM1oBoC36zYbv5m5UTfQxvE0rtTg7NIj3Utr5llcM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788084"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788084"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459541"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459541"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:54 -0700
Message-Id: <20230727013958.456502-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727013958.456502-1-matthew.brost@intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe: remove async worker, sync binds,
 new error handling
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
Cc: Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Async worker is gone, all jobs and memory allocations done in IOCTL.

Async vs. sync now means when do bind operations complete relative to
the IOCTL. Async completes when out-syncs signal while sync completes
when the IOCTL returns. In-syncs and out-syncs are only allowed in async
mode.

The error handling is similar to before, on memory allocation errors
binds are pause, VM is put in an error state, and the bind IOCTL
returns -ENOSPC. The user is allowed to issue sync unbinds, with the
reclaim bit set, while in an error state. Bind operations without the
reclaim bit set are rejected with -EALREADY until the exits the error
state. To exit the error issue a restart bind operation which will pick
up where the original failure left off.

Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          |   7 +-
 drivers/gpu/drm/xe/xe_engine_types.h    |   1 +
 drivers/gpu/drm/xe/xe_exec.c            |  43 --
 drivers/gpu/drm/xe/xe_sync.c            |  14 +-
 drivers/gpu/drm/xe/xe_sync.h            |   2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 692 ++++++------------------
 drivers/gpu/drm/xe/xe_vm.h              |   2 -
 drivers/gpu/drm/xe/xe_vm_types.h        |  37 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  43 +-
 include/uapi/drm/xe_drm.h               |  86 +--
 10 files changed, 203 insertions(+), 724 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 0102dad16e29..1c6b84f32823 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -542,7 +542,10 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
-	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
+	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
+		bool sync = eci[0].engine_class ==
+			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
+	
 		for_each_gt(gt, xe, id) {
 			struct xe_engine *new;
 
@@ -565,6 +568,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 					       args->width, hwe,
 					       ENGINE_FLAG_PERSISTENT |
 					       ENGINE_FLAG_VM |
+					       (sync ? 0 :
+						ENGINE_FLAG_VM_ASYNC) |
 					       (id ?
 					       ENGINE_FLAG_BIND_ENGINE_CHILD :
 					       0));
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 36bfaeec23f4..4949edfa0980 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -59,6 +59,7 @@ struct xe_engine {
 #define ENGINE_FLAG_VM			BIT(4)
 #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 #define ENGINE_FLAG_WA			BIT(6)
+#define ENGINE_FLAG_VM_ASYNC		BIT(7)
 
 	/**
 	 * @flags: flags for this engine, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index fff4a9d9d12a..58af1e0ef4d1 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -231,27 +231,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	/*
-	 * We can't install a job into the VM dma-resv shared slot before an
-	 * async VM bind passed in as a fence without the risk of deadlocking as
-	 * the bind can trigger an eviction which in turn depends on anything in
-	 * the VM dma-resv shared slots. Not an ideal solution, but we wait for
-	 * all dependent async VM binds to start (install correct fences into
-	 * dma-resv slots) before moving forward.
-	 */
-	if (!xe_vm_no_dma_fences(vm) &&
-	    vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS) {
-		for (i = 0; i < args->num_syncs; i++) {
-			struct dma_fence *fence = syncs[i].fence;
-
-			if (fence) {
-				err = xe_vm_async_fence_wait_start(fence);
-				if (err)
-					goto err_syncs;
-			}
-		}
-	}
-
 retry:
 	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
@@ -264,28 +243,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_syncs;
 
-	/* We don't allow execs while the VM is in error state */
-	if (vm->async_ops.error) {
-		err = vm->async_ops.error;
-		goto err_unlock_list;
-	}
-
-	/*
-	 * Extreme corner where we exit a VM error state with a munmap style VM
-	 * unbind inflight which requires a rebind. In this case the rebind
-	 * needs to install some fences into the dma-resv slots. The worker to
-	 * do this queued, let that worker make progress by dropping vm->lock,
-	 * flushing the worker and retrying the exec.
-	 */
-	if (vm->async_ops.munmap_rebind_inflight) {
-		if (write_locked)
-			up_write(&vm->lock);
-		else
-			up_read(&vm->lock);
-		flush_work(&vm->async_ops.work);
-		goto retry;
-	}
-
 	if (write_locked) {
 		err = xe_vm_userptr_pin(vm);
 		downgrade_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 9fcd7802ba30..73ef259aa387 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -18,7 +18,6 @@
 #include "xe_sched_job_types.h"
 
 #define SYNC_FLAGS_TYPE_MASK 0x3
-#define SYNC_FLAGS_FENCE_INSTALLED	0x10000
 
 struct user_fence {
 	struct xe_device *xe;
@@ -223,12 +222,11 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 	return 0;
 }
 
-bool xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
+void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			  struct dma_fence *fence)
 {
-	if (!(sync->flags & DRM_XE_SYNC_SIGNAL) ||
-	    sync->flags & SYNC_FLAGS_FENCE_INSTALLED)
-		return false;
+	if (!(sync->flags & DRM_XE_SYNC_SIGNAL))
+		return;
 
 	if (sync->chain_fence) {
 		drm_syncobj_add_point(sync->syncobj, sync->chain_fence,
@@ -260,12 +258,6 @@ bool xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
 	}
-
-	/* TODO: external BO? */
-
-	sync->flags |= SYNC_FLAGS_FENCE_INSTALLED;
-
-	return true;
 }
 
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 4cbcf7a19911..30958ddc4cdc 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -19,7 +19,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
-bool xe_sync_entry_signal(struct xe_sync_entry *sync,
+void xe_sync_entry_signal(struct xe_sync_entry *sync,
 			  struct xe_sched_job *job,
 			  struct dma_fence *fence);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ddb1b4af6458..77723f680f37 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -545,7 +545,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
-	int err;
+	int err = 0;
 	long wait;
 	int __maybe_unused tries = 0;
 
@@ -561,22 +561,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 retry:
-	if (vm->async_ops.error)
+	if (vm->ops_state.error || vm->ops_state.munmap_rebind_inflight)
 		goto out_unlock_outer;
 
-	/*
-	 * Extreme corner where we exit a VM error state with a munmap style VM
-	 * unbind inflight which requires a rebind. In this case the rebind
-	 * needs to install some fences into the dma-resv slots. The worker to
-	 * do this queued, let that worker make progress by dropping vm->lock
-	 * and trying this again.
-	 */
-	if (vm->async_ops.munmap_rebind_inflight) {
-		up_write(&vm->lock);
-		flush_work(&vm->async_ops.work);
-		goto retry;
-	}
-
 	if (xe_vm_userptr_check_repin(vm)) {
 		err = xe_vm_userptr_pin(vm);
 		if (err)
@@ -1187,7 +1174,6 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
 	.op_alloc = xe_vm_op_alloc,
 };
 
-static void xe_vma_op_work_func(struct work_struct *w);
 static void vm_destroy_work_func(struct work_struct *w);
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
@@ -1221,9 +1207,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&vm->notifier.rebind_list);
 	spin_lock_init(&vm->notifier.list_lock);
 
-	INIT_LIST_HEAD(&vm->async_ops.pending);
-	INIT_WORK(&vm->async_ops.work, xe_vma_op_work_func);
-	spin_lock_init(&vm->async_ops.lock);
+	INIT_LIST_HEAD(&vm->ops_state.pending);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
@@ -1278,11 +1262,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = false;
 	}
 
-	if (flags & XE_VM_FLAG_ASYNC_BIND_OPS) {
-		vm->async_ops.fence.context = dma_fence_context_alloc(1);
-		vm->flags |= XE_VM_FLAG_ASYNC_BIND_OPS;
-	}
-
 	/* Fill pt_root after allocating scratch tables */
 	for_each_tile(tile, xe, id) {
 		if (!vm->pt_root[id])
@@ -1305,7 +1284,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			migrate_vm = xe_migrate_get_vm(tile->migrate);
 			eng = xe_engine_create_class(xe, gt, migrate_vm,
 						     XE_ENGINE_CLASS_COPY,
-						     ENGINE_FLAG_VM);
+						     ENGINE_FLAG_VM |
+						     ((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
+						     ENGINE_FLAG_VM_ASYNC : 0));
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(eng)) {
 				xe_vm_close_and_put(vm);
@@ -1360,42 +1341,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return ERR_PTR(err);
 }
 
-static void flush_async_ops(struct xe_vm *vm)
-{
-	queue_work(system_unbound_wq, &vm->async_ops.work);
-	flush_work(&vm->async_ops.work);
-}
-
-static void vm_error_capture(struct xe_vm *vm, int err,
-			     u32 op, u64 addr, u64 size)
-{
-	struct drm_xe_vm_bind_op_error_capture capture;
-	u64 __user *address =
-		u64_to_user_ptr(vm->async_ops.error_capture.addr);
-	bool in_kthread = !current->mm;
-
-	capture.error = err;
-	capture.op = op;
-	capture.addr = addr;
-	capture.size = size;
-
-	if (in_kthread) {
-		if (!mmget_not_zero(vm->async_ops.error_capture.mm))
-			goto mm_closed;
-		kthread_use_mm(vm->async_ops.error_capture.mm);
-	}
-
-	if (copy_to_user(address, &capture, sizeof(capture)))
-		XE_WARN_ON("Copy to user failed");
-
-	if (in_kthread) {
-		kthread_unuse_mm(vm->async_ops.error_capture.mm);
-		mmput(vm->async_ops.error_capture.mm);
-	}
-
-mm_closed:
-	wake_up_all(&vm->async_ops.error_capture.wq);
-}
+static void vm_bind_ioctl_ops_cleanup(struct xe_vm *vm);
 
 static void xe_vm_close(struct xe_vm *vm)
 {
@@ -1417,7 +1363,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	XE_BUG_ON(vm->preempt.num_engines);
 
 	xe_vm_close(vm);
-	flush_async_ops(vm);
 	if (xe_vm_in_compute_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
@@ -1430,6 +1375,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 
 	down_write(&vm->lock);
+	vm_bind_ioctl_ops_cleanup(vm);
 	xe_vm_lock(vm, &ww, 0, false);
 	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
 		vma = gpuva_to_vma(gpuva);
@@ -1483,9 +1429,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
-	if (vm->async_ops.error_capture.addr)
-		wake_up_all(&vm->async_ops.error_capture.wq);
-
 	XE_WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
@@ -1640,10 +1583,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 
 err_fences:
 	if (fences) {
-		while (cur_fence) {
-			/* FIXME: Rewind the previous binds? */
+		while (cur_fence)
 			dma_fence_put(fences[--cur_fence]);
-		}
 		kfree(fences);
 	}
 
@@ -1717,100 +1658,24 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 
 err_fences:
 	if (fences) {
-		while (cur_fence) {
-			/* FIXME: Rewind the previous binds? */
+		while (cur_fence)
 			dma_fence_put(fences[--cur_fence]);
-		}
 		kfree(fences);
 	}
 
 	return ERR_PTR(err);
 }
 
-struct async_op_fence {
-	struct dma_fence fence;
-	struct dma_fence *wait_fence;
-	struct dma_fence_cb cb;
-	struct xe_vm *vm;
-	wait_queue_head_t wq;
-	bool started;
-};
-
-static const char *async_op_fence_get_driver_name(struct dma_fence *dma_fence)
+static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_engine *e)
 {
-	return "xe";
-}
-
-static const char *
-async_op_fence_get_timeline_name(struct dma_fence *dma_fence)
-{
-	return "async_op_fence";
-}
-
-static const struct dma_fence_ops async_op_fence_ops = {
-	.get_driver_name = async_op_fence_get_driver_name,
-	.get_timeline_name = async_op_fence_get_timeline_name,
-};
-
-static void async_op_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
-{
-	struct async_op_fence *afence =
-		container_of(cb, struct async_op_fence, cb);
-
-	afence->fence.error = afence->wait_fence->error;
-	dma_fence_signal(&afence->fence);
-	xe_vm_put(afence->vm);
-	dma_fence_put(afence->wait_fence);
-	dma_fence_put(&afence->fence);
-}
-
-static void add_async_op_fence_cb(struct xe_vm *vm,
-				  struct dma_fence *fence,
-				  struct async_op_fence *afence)
-{
-	int ret;
-
-	if (!xe_vm_no_dma_fences(vm)) {
-		afence->started = true;
-		smp_wmb();
-		wake_up_all(&afence->wq);
-	}
-
-	afence->wait_fence = dma_fence_get(fence);
-	afence->vm = xe_vm_get(vm);
-	dma_fence_get(&afence->fence);
-	ret = dma_fence_add_callback(fence, &afence->cb, async_op_fence_cb);
-	if (ret == -ENOENT) {
-		afence->fence.error = afence->wait_fence->error;
-		dma_fence_signal(&afence->fence);
-	}
-	if (ret) {
-		xe_vm_put(vm);
-		dma_fence_put(afence->wait_fence);
-		dma_fence_put(&afence->fence);
-	}
-	XE_WARN_ON(ret && ret != -ENOENT);
-}
-
-int xe_vm_async_fence_wait_start(struct dma_fence *fence)
-{
-	if (fence->ops == &async_op_fence_ops) {
-		struct async_op_fence *afence =
-			container_of(fence, struct async_op_fence, fence);
-
-		XE_BUG_ON(xe_vm_no_dma_fences(afence->vm));
-
-		smp_rmb();
-		return wait_event_interruptible(afence->wq, afence->started);
-	}
-
-	return 0;
+	return e ? !(e->flags & ENGINE_FLAG_VM_ASYNC) :
+		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
 }
 
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence,
-			bool immediate, bool first_op, bool last_op)
+			u32 num_syncs, bool immediate, bool first_op,
+			bool last_op)
 {
 	struct dma_fence *fence;
 
@@ -1832,17 +1697,18 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
 		}
 	}
-	if (afence)
-		add_async_op_fence_cb(vm, fence, afence);
 
+	if (last_op && xe_vm_sync_mode(vm, e))
+		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
+
 	return 0;
 }
 
 static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_engine *e,
 		      struct xe_bo *bo, struct xe_sync_entry *syncs,
-		      u32 num_syncs, struct async_op_fence *afence,
-		      bool immediate, bool first_op, bool last_op)
+		      u32 num_syncs, bool immediate, bool first_op,
+		      bool last_op)
 {
 	int err;
 
@@ -1855,14 +1721,13 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_engine *e,
 			return err;
 	}
 
-	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence, immediate,
-			    first_op, last_op);
+	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, immediate, first_op,
+			    last_op);
 }
 
 static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence,
-			bool first_op, bool last_op)
+			u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 
@@ -1872,103 +1737,18 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs, first_op, last_op);
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
-	if (afence)
-		add_async_op_fence_cb(vm, fence, afence);
 
 	xe_vma_destroy(vma, fence);
+	if (last_op && xe_vm_sync_mode(vm, e))
+		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
 	return 0;
 }
 
-static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
-					u64 value)
-{
-	if (XE_IOCTL_DBG(xe, !value))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -EOPNOTSUPP;
-
-	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
-		return -EOPNOTSUPP;
-
-	vm->async_ops.error_capture.mm = current->mm;
-	vm->async_ops.error_capture.addr = value;
-	init_waitqueue_head(&vm->async_ops.error_capture.wq);
-
-	return 0;
-}
-
-typedef int (*xe_vm_set_property_fn)(struct xe_device *xe, struct xe_vm *vm,
-				     u64 value);
-
-static const xe_vm_set_property_fn vm_set_property_funcs[] = {
-	[XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS] =
-		vm_set_error_capture_address,
-};
-
-static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
-				    u64 extension)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_vm_set_property ext;
-	int err;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
-		return -EINVAL;
-
-	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
-}
-
-typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
-				       u64 extension);
-
-static const xe_vm_set_property_fn vm_user_extension_funcs[] = {
-	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
-};
-
-#define MAX_USER_EXTENSIONS	16
-static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
-			      u64 extensions, int ext_number)
-{
-	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
-	int err;
-
-	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
-		return -E2BIG;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.name >=
-			 ARRAY_SIZE(vm_user_extension_funcs)))
-		return -EINVAL;
-
-	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
-	if (XE_IOCTL_DBG(xe, err))
-		return err;
-
-	if (ext.next_extension)
-		return vm_user_extensions(xe, vm, ext.next_extension,
-					  ++ext_number);
-
-	return 0;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
-				    DRM_XE_VM_CREATE_ASYNC_BIND_OPS | \
+				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FAULT_MODE)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -2008,12 +1788,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 !xe->info.supports_usm))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
 		flags |= XE_VM_FLAG_COMPUTE_MODE;
-	if (args->flags & DRM_XE_VM_CREATE_ASYNC_BIND_OPS)
-		flags |= XE_VM_FLAG_ASYNC_BIND_OPS;
+	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
+		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
@@ -2021,14 +1804,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (args->extensions) {
-		err = vm_user_extensions(xe, vm, args->extensions, 0);
-		if (XE_IOCTL_DBG(xe, err)) {
-			xe_vm_close_and_put(vm);
-			return err;
-		}
-	}
-
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
@@ -2098,8 +1873,7 @@ static const u32 region_to_mem_type[] = {
 static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			  struct xe_engine *e, u32 region,
 			  struct xe_sync_entry *syncs, u32 num_syncs,
-			  struct async_op_fence *afence, bool first_op,
-			  bool last_op)
+			  bool first_op, bool last_op)
 {
 	int err;
 
@@ -2113,7 +1887,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, e, xe_vma_bo(vma), syncs, num_syncs,
-				  afence, true, first_op, last_op);
+				  true, first_op, last_op);
 	} else {
 		int i;
 
@@ -2123,8 +1897,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 				xe_sync_entry_signal(&syncs[i], NULL,
 						     dma_fence_get_stub());
 		}
-		if (afence)
-			dma_fence_signal(&afence->fence);
+
 		return 0;
 	}
 }
@@ -2146,49 +1919,10 @@ static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
 	tv->bo = xe_vm_ttm_bo(vm);
 }
 
-static void vm_set_async_error(struct xe_vm *vm, int err)
+static void xe_vm_set_error(struct xe_vm *vm, int err)
 {
 	lockdep_assert_held(&vm->lock);
-	vm->async_ops.error = err;
-}
-
-static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
-				    u64 addr, u64 range, u32 op)
-{
-	struct xe_device *xe = vm->xe;
-	struct xe_vma *vma;
-	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
-
-	lockdep_assert_held(&vm->lock);
-
-	switch (VM_BIND_OP(op)) {
-	case XE_VM_BIND_OP_MAP:
-	case XE_VM_BIND_OP_MAP_USERPTR:
-		vma = xe_vm_find_overlapping_vma(vm, addr, range);
-		if (XE_IOCTL_DBG(xe, vma && !async))
-			return -EBUSY;
-		break;
-	case XE_VM_BIND_OP_UNMAP:
-	case XE_VM_BIND_OP_PREFETCH:
-		vma = xe_vm_find_overlapping_vma(vm, addr, range);
-		if (XE_IOCTL_DBG(xe, !vma))
-			/* Not an actual error, IOCTL cleans up returns and 0 */
-			return -ENODATA;
-		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
-				      xe_vma_end(vma) != addr + range) && !async))
-			return -EINVAL;
-		break;
-	case XE_VM_BIND_OP_UNMAP_ALL:
-		if (XE_IOCTL_DBG(xe, list_empty(&bo->ttm.base.gpuva.list)))
-			/* Not an actual error, IOCTL cleans up returns and 0 */
-			return -ENODATA;
-		break;
-	default:
-		XE_BUG_ON("NOT POSSIBLE");
-		return -EINVAL;
-	}
-
-	return 0;
+	vm->ops_state.error = err;
 }
 
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
@@ -2417,41 +2151,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 {
 	struct xe_vma_op *last_op = NULL;
 	struct list_head *async_list = NULL;
-	struct async_op_fence *fence = NULL;
-	int err, i;
+	int i;
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(num_ops_list > 1 && !async);
-
-	if (num_syncs && async) {
-		u64 seqno;
-
-		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
-		if (!fence)
-			return -ENOMEM;
-
-		seqno = e ? ++e->bind.fence_seqno : ++vm->async_ops.fence.seqno;
-		dma_fence_init(&fence->fence, &async_op_fence_ops,
-			       &vm->async_ops.lock, e ? e->bind.fence_ctx :
-			       vm->async_ops.fence.context, seqno);
-
-		if (!xe_vm_no_dma_fences(vm)) {
-			fence->vm = vm;
-			fence->started = false;
-			init_waitqueue_head(&fence->wq);
-		}
-	}
 
 	for (i = 0; i < num_ops_list; ++i) {
 		struct drm_gpuva_ops *__ops = ops[i];
 		struct drm_gpuva_op *__op;
+		bool has_ops = false;
 
 		drm_gpuva_for_each_op(__op, __ops) {
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 			bool first = !async_list;
 
-			XE_BUG_ON(!first && !async);
-
+			has_ops = true;
 			INIT_LIST_HEAD(&op->link);
 			if (first)
 				async_list = ops_list;
@@ -2473,10 +2186,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 				vma = new_vma(vm, &op->base.map,
 					      op->tile_mask, op->map.read_only,
 					      op->map.is_null);
-				if (IS_ERR(vma)) {
-					err = PTR_ERR(vma);
-					goto free_fence;
-				}
+				if (IS_ERR(vma))
+					return PTR_ERR(vma);
 
 				op->map.vma = vma;
 				break;
@@ -2501,10 +2212,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					vma = new_vma(vm, op->base.remap.prev,
 						      op->tile_mask, read_only,
 						      is_null);
-					if (IS_ERR(vma)) {
-						err = PTR_ERR(vma);
-						goto free_fence;
-					}
+					if (IS_ERR(vma))
+						return PTR_ERR(vma);
 
 					op->remap.prev = vma;
 
@@ -2536,10 +2245,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					vma = new_vma(vm, op->base.remap.next,
 						      op->tile_mask, read_only,
 						      is_null);
-					if (IS_ERR(vma)) {
-						err = PTR_ERR(vma);
-						goto free_fence;
-					}
+					if (IS_ERR(vma))
+						return PTR_ERR(vma);
 
 					op->remap.next = vma;
 
@@ -2566,9 +2273,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 			}
 
 			last_op = op;
+
 		}
 
-		last_op->ops = __ops;
+		if (has_ops) {
+			last_op->ops = __ops;
+		} else {
+			drm_gpuva_ops_free(&vm->mgr, __ops);
+			ops[i] = NULL;
+		}
 	}
 
 	if (!last_op)
@@ -2577,13 +2290,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 	last_op->flags |= XE_VMA_OP_LAST;
 	last_op->num_syncs = num_syncs;
 	last_op->syncs = syncs;
-	last_op->fence = fence;
 
 	return 0;
-
-free_fence:
-	kfree(fence);
-	return err;
 }
 
 static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
@@ -2674,7 +2382,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->engine, xe_vma_bo(vma),
-				 op->syncs, op->num_syncs, op->fence,
+				 op->syncs, op->num_syncs,
 				 op->map.immediate || !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
@@ -2686,15 +2394,14 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 
 		if (!op->remap.unmap_done) {
 			if (prev || next) {
-				vm->async_ops.munmap_rebind_inflight = true;
+				vm->ops_state.munmap_rebind_inflight = true;
 				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
 			}
 			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
 					   op->num_syncs,
-					   !prev && !next ? op->fence : NULL,
 					   op->flags & XE_VMA_OP_FIRST,
-					   op->flags & XE_VMA_OP_LAST && !prev &&
-					   !next);
+					   op->flags & XE_VMA_OP_LAST &&
+					   !prev && !next);
 			if (err)
 				break;
 			op->remap.unmap_done = true;
@@ -2704,8 +2411,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
 			err = xe_vm_bind(vm, op->remap.prev, op->engine,
 					 xe_vma_bo(op->remap.prev), op->syncs,
-					 op->num_syncs,
-					 !next ? op->fence : NULL, true, false,
+					 op->num_syncs, true, false,
 					 op->flags & XE_VMA_OP_LAST && !next);
 			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (err)
@@ -2718,26 +2424,25 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			err = xe_vm_bind(vm, op->remap.next, op->engine,
 					 xe_vma_bo(op->remap.next),
 					 op->syncs, op->num_syncs,
-					 op->fence, true, false,
+					 true, false,
 					 op->flags & XE_VMA_OP_LAST);
 			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (err)
 				break;
 			op->remap.next = NULL;
 		}
-		vm->async_ops.munmap_rebind_inflight = false;
+		vm->ops_state.munmap_rebind_inflight = false;
 
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
 		err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
-				   op->num_syncs, op->fence,
-				   op->flags & XE_VMA_OP_FIRST,
+				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
 				   op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		err = xe_vm_prefetch(vm, vma, op->engine, op->prefetch.region,
-				     op->syncs, op->num_syncs, op->fence,
+				     op->syncs, op->num_syncs,
 				     op->flags & XE_VMA_OP_FIRST,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2811,20 +2516,17 @@ static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	bool last = op->flags & XE_VMA_OP_LAST;
 
+	lockdep_assert_held_write(&vm->lock);
+
 	if (last) {
 		while (op->num_syncs--)
 			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
 		kfree(op->syncs);
 		if (op->engine)
 			xe_engine_put(op->engine);
-		if (op->fence)
-			dma_fence_put(&op->fence->fence);
 	}
-	if (!list_empty(&op->link)) {
-		spin_lock_irq(&vm->async_ops.lock);
+	if (!list_empty(&op->link))
 		list_del(&op->link);
-		spin_unlock_irq(&vm->async_ops.lock);
-	}
 	if (op->ops)
 		drm_gpuva_ops_free(&vm->mgr, op->ops);
 	if (last)
@@ -2881,122 +2583,23 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	}
 }
 
-static struct xe_vma_op *next_vma_op(struct xe_vm *vm)
-{
-	return list_first_entry_or_null(&vm->async_ops.pending,
-					struct xe_vma_op, link);
-}
-
-static void xe_vma_op_work_func(struct work_struct *w)
-{
-	struct xe_vm *vm = container_of(w, struct xe_vm, async_ops.work);
-
-	for (;;) {
-		struct xe_vma_op *op;
-		int err;
-
-		if (vm->async_ops.error && !xe_vm_is_closed(vm))
-			break;
-
-		spin_lock_irq(&vm->async_ops.lock);
-		op = next_vma_op(vm);
-		spin_unlock_irq(&vm->async_ops.lock);
-
-		if (!op)
-			break;
-
-		if (!xe_vm_is_closed(vm)) {
-			down_write(&vm->lock);
-			err = xe_vma_op_execute(vm, op);
-			if (err) {
-				drm_warn(&vm->xe->drm,
-					 "Async VM op(%d) failed with %d",
-					 op->base.op, err);
-				vm_set_async_error(vm, err);
-				up_write(&vm->lock);
-
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err, 0, 0, 0);
-				break;
-			}
-			up_write(&vm->lock);
-		} else {
-			struct xe_vma *vma;
-
-			switch (op->base.op) {
-			case DRM_GPUVA_OP_REMAP:
-				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				trace_xe_vma_flush(vma);
-
-				down_write(&vm->lock);
-				xe_vma_destroy_unlocked(vma);
-				up_write(&vm->lock);
-				break;
-			case DRM_GPUVA_OP_UNMAP:
-				vma = gpuva_to_vma(op->base.unmap.va);
-				trace_xe_vma_flush(vma);
-
-				down_write(&vm->lock);
-				xe_vma_destroy_unlocked(vma);
-				up_write(&vm->lock);
-				break;
-			default:
-				/* Nothing to do */
-				break;
-			}
-
-			if (op->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-						   &op->fence->fence.flags)) {
-				if (!xe_vm_no_dma_fences(vm)) {
-					op->fence->started = true;
-					wake_up_all(&op->fence->wq);
-				}
-				dma_fence_signal(&op->fence->fence);
-			}
-		}
-
-		xe_vma_op_cleanup(vm, op);
-	}
-}
-
 static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
-				    struct list_head *ops_list, bool async)
+				    struct list_head *ops_list,
+				    bool reclaim)
 {
-	struct xe_vma_op *op, *last_op, *next;
+	struct xe_vma_op *op, *next;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
 	list_for_each_entry(op, ops_list, link) {
-		last_op = op;
 		err = xe_vma_op_commit(vm, op);
 		if (err)
 			goto unwind;
 	}
 
-	if (!async) {
-		err = xe_vma_op_execute(vm, last_op);
-		if (err)
-			goto unwind;
-		xe_vma_op_cleanup(vm, last_op);
-	} else {
-		int i;
-		bool installed = false;
-
-		for (i = 0; i < last_op->num_syncs; i++)
-			installed |= xe_sync_entry_signal(&last_op->syncs[i],
-							  NULL,
-							  &last_op->fence->fence);
-		if (!installed && last_op->fence)
-			dma_fence_signal(&last_op->fence->fence);
-
-		spin_lock_irq(&vm->async_ops.lock);
-		list_splice_tail(ops_list, &vm->async_ops.pending);
-		spin_unlock_irq(&vm->async_ops.lock);
-
-		if (!vm->async_ops.error)
-			queue_work(system_unbound_wq, &vm->async_ops.work);
-	}
+	if (!reclaim)
+		list_splice_tail(ops_list, &vm->ops_state.pending);
 
 	return 0;
 
@@ -3034,15 +2637,48 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 	}
 }
 
+static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
+				     struct list_head *ops_list)
+{
+	struct xe_vma_op *op, *next;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	list_for_each_entry_safe(op, next, ops_list, link) {
+		err = xe_vma_op_execute(vm, op);
+		if (err) {
+			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
+				 op->base.op, err);
+			xe_vm_set_error(vm, err);
+			return -ENOSPC;
+		}
+		xe_vma_op_cleanup(vm, op);
+	}
+
+	return 0;
+}
+
+static void vm_bind_ioctl_ops_cleanup(struct xe_vm *vm)
+{
+	struct xe_vma_op *op, *next;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	list_for_each_entry_safe(op, next, &vm->ops_state.pending, link)
+		xe_vma_op_cleanup(vm, op);
+}
+
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
 	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
-	 XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_NULL | XE_VM_BIND_FLAG_RECLAIM | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
-	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
+	 XE_VM_BIND_FLAG_RECLAIM | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 
@@ -3051,7 +2687,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops,
-				    bool *async)
+				    bool *async, bool *reclaim)
 {
 	int err;
 	int i;
@@ -3092,31 +2728,31 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
-		} else if (XE_IOCTL_DBG(xe, !*async) ||
-			   XE_IOCTL_DBG(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
+			*reclaim = !!(op & XE_VM_BIND_FLAG_RECLAIM);
+			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs) ||
+			    XE_IOCTL_DBG(xe, *async && *reclaim)) {
+				err = -EINVAL;
+				goto free_bind_ops;
+			}
+		} else if (XE_IOCTL_DBG(xe, *async !=
+					!!(op & XE_VM_BIND_FLAG_ASYNC)) ||
+			   XE_IOCTL_DBG(xe, *reclaim !=
+					!!(op & XE_VM_BIND_FLAG_RECLAIM)) ||
 			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
 					XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
-			err = -EINVAL;
-			goto free_bind_ops;
-		}
-
-		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
-			err = -EINVAL;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
+		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP &&
+				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL &&
+				 VM_BIND_OP(op) != XE_VM_BIND_OP_RESTART &&
+				 *reclaim) ||
 		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
 				 is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
@@ -3175,11 +2811,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
 	LIST_HEAD(ops_list);
-	bool async;
+	bool async, reclaim, restart = false;
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
+	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async, &reclaim);
 	if (err)
 		return err;
 
@@ -3194,6 +2830,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EINVAL;
 			goto put_engine;
 		}
+
+		if (XE_IOCTL_DBG(xe, async !=
+				 !!(e->flags & ENGINE_FLAG_VM_ASYNC))) {
+			err = -EINVAL;
+			goto put_engine;
+		}
 	}
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -3202,6 +2844,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_engine;
 	}
 
+	if (!args->engine_id) {
+		if (XE_IOCTL_DBG(xe, async !=
+				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
+			err = -EINVAL;
+			goto put_vm;
+		}
+	}
+
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
@@ -3211,32 +2861,29 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto release_vm_lock;
 	}
 
+	if (XE_IOCTL_DBG(xe, vm->ops_state.error && !reclaim)) {
+		err = -EALREADY;
+		goto release_vm_lock;
+	}
+
+	if (XE_IOCTL_DBG(xe, !vm->ops_state.error && reclaim)) {
+		err = -EINVAL;
+		goto release_vm_lock;
+	}
+
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
-		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-			err = -EOPNOTSUPP;
-		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
+		if (XE_IOCTL_DBG(xe, args->num_syncs))
 			err = EINVAL;
-		if (XE_IOCTL_DBG(xe, !err && !vm->async_ops.error))
+		if (XE_IOCTL_DBG(xe, !err && !vm->ops_state.error))
 			err = -EPROTO;
+		if (err)
+			goto release_vm_lock;
 
-		if (!err) {
-			trace_xe_vm_restart(vm);
-			vm_set_async_error(vm, 0);
-
-			queue_work(system_unbound_wq, &vm->async_ops.work);
-
-			/* Rebinds may have been blocked, give worker a kick */
-			if (xe_vm_in_compute_mode(vm))
-				xe_vm_queue_rebind_worker(vm);
-		}
-
-		goto release_vm_lock;
-	}
+		trace_xe_vm_restart(vm);
+		xe_vm_set_error(vm, 0);
+		restart = true;
 
-	if (XE_IOCTL_DBG(xe, !vm->async_ops.error &&
-			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
-		err = -EOPNOTSUPP;
-		goto release_vm_lock;
+		goto execute;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3324,17 +2971,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
-	/* Do some error checking first to make the unwind easier */
-	for (i = 0; i < args->num_binds; ++i) {
-		u64 range = bind_ops[i].range;
-		u64 addr = bind_ops[i].addr;
-		u32 op = bind_ops[i].op;
-
-		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
-		if (err)
-			goto free_syncs;
-	}
-
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3358,10 +2994,28 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto unwind_ops;
 
-	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
+	xe_vm_get(vm);
+	if (e)
+		xe_engine_get(e);
+	err = vm_bind_ioctl_ops_commit(vm, &ops_list, reclaim);
+
+execute:
+	if (!err)
+		err = vm_bind_ioctl_ops_execute(vm, reclaim && !restart ?
+						&ops_list :
+						&vm->ops_state.pending);
+
+	/* Rebinds may have been blocked, give worker a kick */
+	if (!err && restart && xe_vm_in_compute_mode(vm))
+		xe_vm_queue_rebind_worker(vm);
+
 	up_write(&vm->lock);
 
-	for (i = 0; i < args->num_binds; ++i)
+	if (e)
+		xe_engine_put(e);
+	xe_vm_put(vm);
+
+	for (i = 0; bos && i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
 
 	kfree(bos);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4db777d7e375..3d874456a9f2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -179,8 +179,6 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-int xe_vm_async_fence_wait_start(struct dma_fence *fence);
-
 extern struct ttm_device_funcs xe_ttm_funcs;
 
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 261a4b0e8570..ba05e7069dda 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -17,7 +17,6 @@
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
 
-struct async_op_fence;
 struct xe_bo;
 struct xe_sync_entry;
 struct xe_vm;
@@ -163,7 +162,7 @@ struct xe_vm {
 	 */
 #define XE_VM_FLAG_64K			BIT(0)
 #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
-#define XE_VM_FLAG_ASYNC_BIND_OPS	BIT(2)
+#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
 #define XE_VM_FLAG_MIGRATION		BIT(3)
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
 #define XE_VM_FLAG_FAULT_MODE		BIT(5)
@@ -214,40 +213,18 @@ struct xe_vm {
 		struct list_head list;
 	} extobj;
 
-	/** @async_ops: async VM operations (bind / unbinds) */
+	/** @ops_state: VM operations (bind / unbinds) state*/
 	struct {
-		/** @list: list of pending async VM ops */
+		/** @list: list of pending VM ops */
 		struct list_head pending;
-		/** @work: worker to execute async VM ops */
-		struct work_struct work;
-		/** @lock: protects list of pending async VM ops and fences */
-		spinlock_t lock;
-		/** @error_capture: error capture state */
-		struct {
-			/** @mm: user MM */
-			struct mm_struct *mm;
-			/**
-			 * @addr: user pointer to copy error capture state too
-			 */
-			u64 addr;
-			/** @wq: user fence wait queue for VM errors */
-			wait_queue_head_t wq;
-		} error_capture;
-		/** @fence: fence state */
-		struct {
-			/** @context: context of async fence */
-			u64 context;
-			/** @seqno: seqno of async fence */
-			u32 seqno;
-		} fence;
-		/** @error: error state for async VM ops */
+		/** @error: error state for VM ops */
 		int error;
 		/**
 		 * @munmap_rebind_inflight: an munmap style VM bind is in the
 		 * middle of a set of ops which requires a rebind at the end.
 		 */
 		bool munmap_rebind_inflight;
-	} async_ops;
+	} ops_state;
 
 	/** @userptr: user pointer state */
 	struct {
@@ -404,10 +381,6 @@ struct xe_vma_op {
 	u32 num_syncs;
 	/** @link: async operation link */
 	struct list_head link;
-	/**
-	 * @fence: async operation fence, signaled on last operation complete
-	 */
-	struct async_op_fence *fence;
 	/** @tile_mask: gt mask for this operation */
 	u8 tile_mask;
 	/** @flags: operation flags */
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index c4202df1d4f0..9eb5320a4509 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,7 +13,6 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
-#include "xe_vm.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -81,8 +80,7 @@ static int check_hw_engines(struct xe_device *xe,
 }
 
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
-			 DRM_XE_UFENCE_WAIT_ABSTIME | \
-			 DRM_XE_UFENCE_WAIT_VM_ERROR)
+			 DRM_XE_UFENCE_WAIT_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
 static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
@@ -109,11 +107,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
-	struct xe_vm *vm = NULL;
 	u64 addr = args->addr;
 	int err;
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
-		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
+	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
 	unsigned long timeout;
 	ktime_t start;
 
@@ -134,8 +130,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) &&
-			 addr & 0x7))
+	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
@@ -153,22 +148,6 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
-	if (args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) {
-		if (XE_IOCTL_DBG(xe, args->vm_id >> 32))
-			return -EINVAL;
-
-		vm = xe_vm_lookup(to_xe_file(file), args->vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
-			return -ENOENT;
-
-		if (XE_IOCTL_DBG(xe, !vm->async_ops.error_capture.addr)) {
-			xe_vm_put(vm);
-			return -EOPNOTSUPP;
-		}
-
-		addr = vm->async_ops.error_capture.addr;
-	}
-
 	/*
 	 * For negative timeout we want to wait "forever" by setting
 	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
@@ -188,15 +167,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
 	 * work with the wait_event_* macros.
 	 */
-	if (vm)
-		add_wait_queue(&vm->async_ops.error_capture.wq, &w_wait);
-	else
-		add_wait_queue(&xe->ufence_wq, &w_wait);
+	add_wait_queue(&xe->ufence_wq, &w_wait);
 	for (;;) {
-		if (vm && xe_vm_is_closed(vm)) {
-			err = -ENODEV;
-			break;
-		}
 		err = do_compare(addr, args->value, args->mask, args->op);
 		if (err <= 0)
 			break;
@@ -213,12 +185,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
 	}
-	if (vm) {
-		remove_wait_queue(&vm->async_ops.error_capture.wq, &w_wait);
-		xe_vm_put(vm);
-	} else {
-		remove_wait_queue(&xe->ufence_wq, &w_wait);
-	}
+	remove_wait_queue(&xe->ufence_wq, &w_wait);
 
 	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
 		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 259de80376b4..93e097942563 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -475,50 +475,13 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_vm_create {
-#define XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
+#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
@@ -583,30 +546,6 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_PREFETCH		0x5
 
 #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
-	/*
-	 * A bind ops completions are always async, hence the support for out
-	 * sync. This flag indicates the allocation of the memory for new page
-	 * tables and the job to program the pages tables is asynchronous
-	 * relative to the IOCTL. That part of a bind operation can fail under
-	 * memory pressure, the job in practice can't fail unless the system is
-	 * totally shot.
-	 *
-	 * If this flag is clear and the IOCTL doesn't return an error, in
-	 * practice the bind op is good and will complete.
-	 *
-	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
-	 * via non-async unbinds, and then restart all queue'd async binds op via
-	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
-	 * VM.
-	 *
-	 * This flag is only allowed when DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
-	 * configured in the VM and must be set if the VM is configured with
-	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
-	 */
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
@@ -621,6 +560,7 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+#define XE_VM_BIND_FLAG_RECLAIM		(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
@@ -735,10 +675,11 @@ struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
 	/*
-	 * Kernel only class (not actual hardware engine class). Used for
+	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
 	__u16 engine_class;
 
 	__u16 engine_instance;
@@ -908,18 +849,10 @@ struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	union {
-		/**
-		 * @addr: user pointer address to wait on, must qword aligned
-		 */
-		__u64 addr;
-
-		/**
-		 * @vm_id: The ID of the VM which encounter an error used with
-		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
-		 */
-		__u64 vm_id;
-	};
+	/**
+	 * @addr: user pointer address to wait on, must qword aligned
+	 */
+	__u64 addr;
 
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
@@ -932,7 +865,6 @@ struct drm_xe_wait_user_fence {
 
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
-#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	/** @flags: wait flags */
 	__u16 flags;
 
-- 
2.34.1

