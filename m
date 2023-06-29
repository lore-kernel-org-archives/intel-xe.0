Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B5C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E1710E1D5;
	Thu, 29 Jun 2023 20:10:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EA810E1D5
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688069435; x=1719605435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmFa12Wl6vVt8qQk9cCtxAfkHOYqrkjo+TxZjvPKenw=;
 b=gj2n7sgwBP2S+PXXy7izzhYNwVY8zMd647oh2IGFfIXWyjAnqIrmgr/o
 nsgHkiShq9EfFhLluxNnVIgzyc773kz0bSVxnCJ/pZ6kfj5Q41t4saFVa
 aBr4Ph5Xw7NHDGhXkixehvYPhPwSSd88kI/VGNk4JavHZ21M4I0rmBrxr
 tqzSG3gEA6WzVQu0K1LGjuXxyOZsHYnQfz48gxZOMJR3cAAQarApT1Bf6
 sxsCwI+rgJ3P1JhahzBqJO5V+kILfbMslILJOtfBQB65Dp07d7GXdO3GM
 xVGPmvWjSzUH41whaa6R6nT/yel3lKUlXYL+pFZFmVx9201dzDSHCB9gC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352039543"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="352039543"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711569606"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711569606"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 13:10:38 -0700
Message-Id: <20230629201046.989033-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629201046.989033-1-matthew.brost@intel.com>
References: <20230629201046.989033-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/9] drm/xe: Ban a VM if rebind worker hits an
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c     | 13 +++++
 drivers/gpu/drm/xe/xe_exec.c       |  6 +-
 drivers/gpu/drm/xe/xe_trace.h      |  5 ++
 drivers/gpu/drm/xe/xe_vm.c         | 94 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.h         | 11 ++++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  5 +-
 7 files changed, 92 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 6e6b2913f766..ada2986c33a2 100644
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
index 3bba957e3b89..7d3cceb4a94a 100644
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
@@ -666,11 +685,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto retry;
 		}
 	}
+	if (err)
+		xe_vm_kill(vm);
 	up_write(&vm->lock);
 
 	free_preempt_fences(&preempt_fences);
 
-	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
@@ -1140,11 +1160,12 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
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
 
@@ -3074,28 +3095,31 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		return err;
 
+	if (args->engine_id) {
+		e = xe_engine_lookup(xef, args->engine_id);
+		if (XE_IOCTL_ERR(xe, !e))
+			return -ENOENT;
+
+		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
+			err = -EINVAL;
+			goto put_engine;
+		}
+	}
+
 	vm = xe_vm_lookup(xef, args->vm_id);
 	if (XE_IOCTL_ERR(xe, !vm)) {
 		err = -EINVAL;
-		goto free_objs;
+		goto put_engine;
 	}
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
-		drm_err(dev, "VM closed while we began looking up?\n");
-		err = -ENOENT;
+	err = down_write_killable(&vm->lock);
+	if (err)
 		goto put_vm;
-	}
 
-	if (args->engine_id) {
-		e = xe_engine_lookup(xef, args->engine_id);
-		if (XE_IOCTL_ERR(xe, !e)) {
-			err = -ENOENT;
-			goto put_vm;
-		}
-		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
-			err = -EINVAL;
-			goto put_engine;
-		}
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
+		drm_err(dev, "VM closed while we began looking up?\n");
+		err = -ENOENT;
+		goto release_vm_lock;
 	}
 
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
@@ -3107,10 +3131,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EPROTO;
 
 		if (!err) {
-			down_write(&vm->lock);
 			trace_xe_vm_restart(vm);
 			vm_set_async_error(vm, 0);
-			up_write(&vm->lock);
 
 			queue_work(system_unbound_wq, &vm->async_ops.work);
 
@@ -3119,13 +3141,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3135,7 +3157,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (XE_IOCTL_ERR(xe, range > vm->size) ||
 		    XE_IOCTL_ERR(xe, addr > vm->size - range)) {
 			err = -EINVAL;
-			goto put_engine;
+			goto release_vm_lock;
 		}
 
 		if (bind_ops[i].tile_mask) {
@@ -3144,7 +3166,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			if (XE_IOCTL_ERR(xe, bind_ops[i].tile_mask &
 					 ~valid_tiles)) {
 				err = -EINVAL;
-				goto put_engine;
+				goto release_vm_lock;
 			}
 		}
 	}
@@ -3152,13 +3174,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3213,10 +3235,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
-	err = down_write_killable(&vm->lock);
-	if (err)
-		goto free_syncs;
-
 	/* Do some error checking first to make the unwind easier */
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
@@ -3225,7 +3243,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
 		if (err)
-			goto release_vm_lock;
+			goto free_syncs;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3345,8 +3363,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			break;
 		}
 	}
-release_vm_lock:
-	up_write(&vm->lock);
 free_syncs:
 	while (num_syncs--) {
 		if (async && j &&
@@ -3359,11 +3375,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 5edb7771629c..47bc7fbb2f50 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -49,6 +49,17 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
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
index c148dd49a6ca..286de52160b9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -183,8 +183,9 @@ struct xe_vm {
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

