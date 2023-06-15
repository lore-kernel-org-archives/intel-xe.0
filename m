Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2959EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 22:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F8B10E566;
	Thu, 15 Jun 2023 22:43:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C1510E566
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686869038; x=1718405038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Thdp+RokkI1ivNFi3eQTT9F+Zv4cH/txO45HX7rdx0=;
 b=R0jMTJHE3adMWSys6C3b7GfR0UOGidjct5pEi8agKkxqJ+ZBRLD8jI+V
 gNUP0UPmnoe0Bb6PaRwgXUCgAW3Jm6d9wFqqZFWGeWb49RlQInN3/Bvxe
 qcDl/fhQ109Lsy/A3S7FlrTsZ82lzg636FwwaHPhcA0YlUIhYO6s5xqvF
 HHT8QLtGq50aM5c4CUWVpK7TnlODKR1emCw+W1KwOnek5lj/C5R2sDXyf
 1ZH42XWXifMjZgvg01pLgujktQh0qSViTsSRhLgSSVRQCFQC+dDqET51S
 9pPhBy2WkNjyfgdpH+hANvojwGC93y9wFA43h3IAmrbmID6n3tJGTdn6Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387661387"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="387661387"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 15:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715782440"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="715782440"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 15:43:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 15:44:09 -0700
Message-Id: <20230615224409.320122-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Ban a VM if rebind worker hits an error
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c     | 13 +++++++
 drivers/gpu/drm/xe/xe_exec.c       |  6 ++--
 drivers/gpu/drm/xe/xe_trace.h      |  5 +++
 drivers/gpu/drm/xe/xe_vm.c         | 55 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h         | 11 ++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  5 +--
 7 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..52eb1c4bad0c 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -597,8 +597,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
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
 				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
+		up_read(&vm->lock);
 		xe_vm_put(vm);
 		if (IS_ERR(e))
 			return PTR_ERR(e);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e44076ee2e11..7e263fb77a8c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -294,9 +294,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 2f8eb7ebe9a7..eb89ac934394 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -472,6 +472,11 @@ DECLARE_EVENT_CLASS(xe_vm,
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
index 56ed2cb75c8e..1a0fc6660f37 100644
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
@@ -662,11 +681,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
 
@@ -1127,11 +1147,12 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
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
 
@@ -3052,17 +3073,21 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_objs;
 	}
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
 		drm_err(dev, "VM closed while we began looking up?\n");
 		err = -ENOENT;
-		goto put_vm;
+		goto release_vm_lock;
 	}
 
 	if (args->engine_id) {
 		e = xe_engine_lookup(xef, args->engine_id);
 		if (XE_IOCTL_ERR(xe, !e)) {
 			err = -ENOENT;
-			goto put_vm;
+			goto release_vm_lock;
 		}
 		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
 			err = -EINVAL;
@@ -3079,10 +3104,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EPROTO;
 
 		if (!err) {
-			down_write(&vm->lock);
 			trace_xe_vm_restart(vm);
 			vm_set_async_error(vm, 0);
-			up_write(&vm->lock);
 
 			queue_work(system_unbound_wq, &vm->async_ops.work);
 
@@ -3185,10 +3208,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
-	err = down_write_killable(&vm->lock);
-	if (err)
-		goto free_syncs;
-
 	/* Do some error checking first to make the unwind easier */
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
@@ -3197,7 +3216,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
 		if (err)
-			goto release_vm_lock;
+			goto free_syncs;
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3317,8 +3336,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			break;
 		}
 	}
-release_vm_lock:
-	up_write(&vm->lock);
 free_syncs:
 	while (num_syncs--) {
 		if (async && j &&
@@ -3334,6 +3351,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 put_engine:
 	if (e)
 		xe_engine_put(e);
+release_vm_lock:
+	up_write(&vm->lock);
 put_vm:
 	xe_vm_put(vm);
 free_objs:
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index bb2996856841..9533c6fed49a 100644
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
index a51e84e584b4..f828426a6564 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -179,8 +179,9 @@ struct xe_vm {
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

