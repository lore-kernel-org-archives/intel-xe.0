Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B9EB64DC
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jul 2023 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D510E658;
	Sat,  8 Jul 2023 06:43:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DAC10E651
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jul 2023 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688798626; x=1720334626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UazkNM+EpDYFwKHkbAb16PYQmB1gbF8DZyY1p5gPrBc=;
 b=Fhbq2A/xeEreS6nsOXpdQbYkv6spNG6mD02CuMoOvhFWyB8NWS+v7RuF
 EPxVu6CpRuMg4kTz8vlPwyQUb9mdA8QNyE7bT3UpKqrCIlBc4idmcseo2
 hAmQDO3jD5KgDW1GoptTaRRWeL4P6/o/hKqbFLllvm7y8aYurdqQ41LWX
 iK+mXnj1s2fBrQdkJpapD39qQzq+YAjH5OFnstto5/uGXKeJ6lPN/urQv
 HH29BCiPeLtTQ/9kI4ssUcvW/g4TLBQujqNiBvc41jFAU54+JNZqxjkMT
 +qmx0iG9wWE6jn8FbvNv0XPVU99dcnnykWCJLcGAG3KtHNM6BBjXegz7z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348834102"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="348834102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="714240221"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="714240221"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  7 Jul 2023 23:43:54 -0700
Message-Id: <20230708064359.1743796-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230708064359.1743796-1-matthew.brost@intel.com>
References: <20230708064359.1743796-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/6] drm/xe: Ban a VM if rebind worker hits an
 error
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

We cannot recover a VM if a rebind worker hits an error, ban the VM if
happens to ensure we do not attempt to place this VM on the hardware
again.

A follow up will inform the user if this happens.

v2: Return -ECANCELED in exec VM closed or banned, check for closed or
banned within VM lock.
v3: Fix lockdep splat by looking engine outside of vm->lock
v4: Fix error path when engine lookup fails
v5: Add debug message in rebind worker on error, update comments wrt
locking, add xe_vm_close helper

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c     |  13 ++++
 drivers/gpu/drm/xe/xe_exec.c       |   6 +-
 drivers/gpu/drm/xe/xe_trace.h      |   5 ++
 drivers/gpu/drm/xe/xe_vm.c         | 104 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h         |  13 +++-
 drivers/gpu/drm/xe/xe_vm_madvise.c |   2 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  10 ++-
 7 files changed, 107 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 530f55a33b03..3831c5f82773 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -597,10 +597,23 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_ERR(xe, !vm))
 			return -ENOENT;
 
+		err = down_read_interruptible(&vm->lock);
+		if (err) {
+			xe_vm_put(vm);
+			return err;
+		}
+
+		if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
+			up_read(&vm->lock);
+			xe_vm_put(vm);
+			return -ENOENT;
+		}
+
 		e = xe_engine_create(xe, vm, logical_mask,
 				     args->width, hwe,
 				     xe_vm_no_dma_fences(vm) ? 0 :
 				     ENGINE_FLAG_PERSISTENT);
+		up_read(&vm->lock);
 		xe_vm_put(vm);
 		if (IS_ERR(e))
 			return PTR_ERR(e);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index c52edff9a358..bdf00e59e7a4 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -297,9 +297,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_unlock_list;
 
-	if (xe_vm_is_closed(engine->vm)) {
-		drm_warn(&xe->drm, "Trying to schedule after vm is closed\n");
-		err = -EIO;
+	if (xe_vm_is_closed_or_banned(engine->vm)) {
+		drm_warn(&xe->drm, "Trying to schedule after vm is closed or banned\n");
+		err = -ECANCELED;
 		goto err_engine_end;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 02861c26e145..ca96a0a4bb80 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -477,6 +477,11 @@ DECLARE_EVENT_CLASS(xe_vm,
 			      __entry->asid)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_kill,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 DEFINE_EVENT(xe_vm, xe_vm_create,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dbff75a9087b..2e7547d13220 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
+static void xe_vm_kill(struct xe_vm *vm)
+{
+	struct ww_acquire_ctx ww;
+	struct xe_engine *e;
+
+	lockdep_assert_held(&vm->lock);
+
+	xe_vm_lock(vm, &ww, 0, false);
+	vm->flags |= XE_VM_FLAG_BANNED;
+	trace_xe_vm_kill(vm);
+
+	list_for_each_entry(e, &vm->preempt.engines, compute.link)
+		e->ops->kill(e);
+	xe_vm_unlock(vm, &ww);
+
+	/* TODO: Inform user the VM is banned */
+}
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
@@ -533,13 +551,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
-	if (xe_vm_is_closed(vm)) {
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm)) {
+		up_write(&vm->lock);
 		trace_xe_vm_rebind_worker_exit(vm);
 		return;
 	}
 
-	down_write(&vm->lock);
-
 retry:
 	if (vm->async_ops.error)
 		goto out_unlock_outer;
@@ -666,11 +685,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto retry;
 		}
 	}
+	if (err) {
+		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
+		xe_vm_kill(vm);
+	}
 	up_write(&vm->lock);
 
 	free_preempt_fences(&preempt_fences);
 
-	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
@@ -1140,11 +1162,12 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
 {
 	struct rb_node *node;
 
-	if (xe_vm_is_closed(vm))
+	lockdep_assert_held(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
 		return NULL;
 
 	XE_BUG_ON(vma->end >= vm->size);
-	lockdep_assert_held(&vm->lock);
 
 	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
 
@@ -1377,6 +1400,13 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 	wake_up_all(&vm->async_ops.error_capture.wq);
 }
 
+static void xe_vm_close(struct xe_vm *vm)
+{
+	down_write(&vm->lock);
+	vm->size = 0;
+	up_write(&vm->lock);
+}
+
 void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	struct rb_root contested = RB_ROOT;
@@ -1387,8 +1417,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	XE_BUG_ON(vm->preempt.num_engines);
 
-	vm->size = 0;
-	smp_mb();
+	xe_vm_close(vm);
+
 	flush_async_ops(vm);
 	if (xe_vm_in_compute_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
@@ -3072,30 +3102,34 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		return err;
 
-	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_ERR(xe, !vm)) {
-		err = -EINVAL;
-		goto free_objs;
-	}
-
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
-		drm_err(dev, "VM closed while we began looking up?\n");
-		err = -ENOENT;
-		goto put_vm;
-	}
-
 	if (args->engine_id) {
 		e = xe_engine_lookup(xef, args->engine_id);
 		if (XE_IOCTL_ERR(xe, !e)) {
 			err = -ENOENT;
-			goto put_vm;
+			goto free_objs;
 		}
+
 		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
 			err = -EINVAL;
 			goto put_engine;
 		}
 	}
 
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_ERR(xe, !vm)) {
+		err = -EINVAL;
+		goto put_engine;
+	}
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto release_vm_lock;
+	}
+
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 			err = -EOPNOTSUPP;
@@ -3105,10 +3139,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EPROTO;
 
 		if (!err) {
-			down_write(&vm->lock);
 			trace_xe_vm_restart(vm);
 			vm_set_async_error(vm, 0);
-			up_write(&vm->lock);
 
 			queue_work(system_unbound_wq, &vm->async_ops.work);
 
@@ -3117,13 +3149,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				xe_vm_queue_rebind_worker(vm);
 		}
 
-		goto put_engine;
+		goto release_vm_lock;
 	}
 
 	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
 			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
 		err = -EOPNOTSUPP;
-		goto put_engine;
+		goto release_vm_lock;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3133,7 +3165,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (XE_IOCTL_ERR(xe, range > vm->size) ||
 		    XE_IOCTL_ERR(xe, addr > vm->size - range)) {
 			err = -EINVAL;
-			goto put_engine;
+			goto release_vm_lock;
 		}
 
 		if (bind_ops[i].tile_mask) {
@@ -3142,7 +3174,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			if (XE_IOCTL_ERR(xe, bind_ops[i].tile_mask &
 					 ~valid_tiles)) {
 				err = -EINVAL;
-				goto put_engine;
+				goto release_vm_lock;
 			}
 		}
 	}
@@ -3150,13 +3182,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
 	if (!bos) {
 		err = -ENOMEM;
-		goto put_engine;
+		goto release_vm_lock;
 	}
 
 	vmas = kzalloc(sizeof(*vmas) * args->num_binds, GFP_KERNEL);
 	if (!vmas) {
 		err = -ENOMEM;
-		goto put_engine;
+		goto release_vm_lock;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3211,10 +3243,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
-	err = down_write_killable(&vm->lock);
-	if (err)
-		goto free_syncs;
-
 	/* Do some error checking first to make the unwind easier */
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
@@ -3223,7 +3251,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
 		if (err)
-			goto release_vm_lock;
+			goto free_syncs;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3343,8 +3371,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			break;
 		}
 	}
-release_vm_lock:
-	up_write(&vm->lock);
 free_syncs:
 	while (num_syncs--) {
 		if (async && j &&
@@ -3357,11 +3383,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 put_obj:
 	for (i = j; i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
+release_vm_lock:
+	up_write(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
 put_engine:
 	if (e)
 		xe_engine_put(e);
-put_vm:
-	xe_vm_put(vm);
 free_objs:
 	kfree(bos);
 	kfree(vmas);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 5edb7771629c..02b409dd77d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -45,10 +45,21 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
 
 static inline bool xe_vm_is_closed(struct xe_vm *vm)
 {
-	/* Only guaranteed not to change when vm->resv is held */
+	/* Only guaranteed not to change when vm->lock is held */
 	return !vm->size;
 }
 
+static inline bool xe_vm_is_banned(struct xe_vm *vm)
+{
+	return vm->flags & XE_VM_FLAG_BANNED;
+}
+
+static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
+{
+	lockdep_assert_held(&vm->lock);
+	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
+}
+
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 0f5eef337037..76458f8d57f3 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, !vm))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
 		err = -ENOENT;
 		goto put_vm;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c148dd49a6ca..3c885211a8d1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -176,15 +176,19 @@ struct xe_vm {
 	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
 	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
 
-	/** @flags: flags for this VM, statically setup a creation time */
+	/**
+	 * @flags: flags for this VM, statically setup a creation time aside
+	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
+	 */
 #define XE_VM_FLAGS_64K			BIT(0)
 #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
 #define XE_VM_FLAG_ASYNC_BIND_OPS	BIT(2)
 #define XE_VM_FLAG_MIGRATION		BIT(3)
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
 #define XE_VM_FLAG_FAULT_MODE		BIT(5)
-#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 6) & 0x3)
-#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 6)
+#define XE_VM_FLAG_BANNED		BIT(6)
+#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
-- 
2.34.1

