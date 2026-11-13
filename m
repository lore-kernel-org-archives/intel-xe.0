Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FC5606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTig4HEx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575A310E3E3;
	Fri, 13 Nov 2026 07:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D0710E3E3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794555364; x=1826091364;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nu8NV6eotZKnEH7cyUpZrq11WrdMd0zpKqLgzlFgjh4=;
 b=DTig4HEx2GrB7wXg3mlrGIyRgQagocpwQFoRiUaNQ2RVsy3a0hnEwyNg
 ekY/Cg1KKdjRh/L20+086JCb3OOx4A9gfun7w+krFVzyGycy2YpeCKR20
 tlV60iPw11HC8yXM57spogO1QIAnDLOkLuL8vBi2bP9l25RqR7ZSGuzCY
 gKut77d2gHjwOTdyS/ulk5mYJS37Ng8QdyRByimzFlzt0G6e4U/iZXzDU
 XvULkbeQWF/YlwDz/8MQtx73fGY8W+9vO9ffkHQ9jiZ5lqIkWnHM+byXd
 NbTkLP4PeBG60dDdrtA7fgY4YBiTI6MaDBx2oKL1RBgkfaY/uTNqRzil4 A==;
X-CSE-ConnectionGUID: x3ouafrNSmqZ7SR4QQcgaQ==
X-CSE-MsgGUID: OvqTdNE0SDaDXfIs48ISJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347938"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3347938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:36:02 -0800
X-CSE-ConnectionGUID: WFMjAst2RICKFroOl+8LSA==
X-CSE-MsgGUID: rbbKKSCUQdeg10MTSl8W0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9030595"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:36:01 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] CI-ONLY:Defer VM teardown until exec queue cleanup
Date: Fri, 13 Nov 2026 13:05:49 +0530
Message-ID: <20261113073549.352746-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113073549.352746-1-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Exec queue destruction is asynchronous. Closing a VM immediately after
killing its queues can remove mappings before GuC cleanup has finished.

Track the queues using each VM and keep the bind queue's user_vm
reference until final queue destruction. Start queue cleanup before
removing the VM mappings.

The count includes VM-owned bind queues. Release the VM's references
to these queues before waiting for their asynchronous cleanup.

During file close, use one five-second wait budget across all VMs.
If queues remain, defer VM close until the last queue is removed.
The existing runtime-PM reference remains held during this wait.

VM destroy does not wait for queue cleanup. If user exec queues still
reference the VM, its mappings remain after the ioctl returns until
those queues finish cleanup. Userspace must destroy the remaining queue
handles or close the DRM file to release them.

Run deferred VM close on the module-lifetime destroy workqueue.
Hold an extra VM reference until the close worker has released its
runtime-PM reference and unplug guard.

File close and VM destroy do not wait for queue cleanup. If tracked
queues remain, retain the VM mappings and defer teardown until the
last queue is removed.

This also applies to internal bind queues, so VM destroy may return
before mappings are released even when no user exec queues remain.
User queue handles must be destroyed, or the DRM file closed, before
those queues can complete cleanup.

v3:
- Remove the deadline calculation and use zero wait explicitly on file close.
  (Tejas)
- Document that internal bind queue cleanup can also defer VM teardown.
  (Sashiko)
- Clarify that mappings remain until all tracked exec queues finish cleanup.
  (Sashiko)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  16 ++-
 drivers/gpu/drm/xe/xe_exec.c       |   9 ++
 drivers/gpu/drm/xe/xe_exec_queue.c |  22 ++--
 drivers/gpu/drm/xe/xe_vm.c         | 162 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h         |   5 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  15 +++
 6 files changed, 207 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1ef9e276bbca..84d17d76b350 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -177,6 +177,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
+	bool close_deferred = false;
 	unsigned long idx;
 
 	guard(xe_pm_runtime)(xe);
@@ -197,8 +198,21 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
+
+	/* Start all bind queue teardown before closing the VMs. */
 	xa_for_each(&xef->vm.xa, idx, vm)
-		xe_vm_close_and_put(vm);
+		xe_vm_kill_bind_queues(vm);
+
+	/*
+	 * Do not wait in file close. Keep mappings alive until the remaining
+	 * exec queues have completed their asynchronous cleanup.
+	 */
+	xa_for_each(&xef->vm.xa, idx, vm)
+		close_deferred |= xe_vm_close_and_put_deferred(vm, 0);
+
+	if (close_deferred)
+		drm_dbg(&xe->drm,
+			"VM teardown deferred while exec queues are being stopped\n");
 
 	scoped_guard(mutex, &xef->mmio_gem.lock) {
 		if (xef->mmio_gem.pci_barrier) {
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 1949fb103fad..1c6f820eb17c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -233,6 +233,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_hw_exec_mode;
 
+	if (xe_vm_is_closed_or_banned(vm)) {
+		err = -ECANCELED;
+		if (write_locked)
+			up_write(&vm->lock);
+		else
+			up_read(&vm->lock);
+		goto err_hw_exec_mode;
+	}
+
 	if (write_locked) {
 		err = xe_vm_userptr_pin(vm);
 		downgrade_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7ade915c59a8..1ee727c485fb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -155,9 +155,16 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 	if (q->vm) {
 		xe_vm_remove_exec_queue(q->vm, q);
+		if (q->vm->xef)
+			xe_vm_remove_close_queue(q->vm);
 		xe_vm_put(q->vm);
 	}
 
+	if (q->user_vm) {
+		xe_vm_remove_close_queue(q->user_vm);
+		xe_vm_put(q->user_vm);
+	}
+
 	if (q->xef)
 		xe_file_put(q->xef);
 
@@ -253,8 +260,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		}
 	}
 
-	if (vm)
+	if (vm) {
 		q->vm = xe_vm_get(vm);
+		/* vm->xef stays unchanged until final VM destruction. */
+		if (vm->xef)
+			xe_vm_add_close_queue(vm);
+	}
 
 	if (extensions) {
 		/*
@@ -620,8 +631,10 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 			return ERR_PTR(err);
 		}
 
-		if (user_vm)
+		if (user_vm) {
 			q->user_vm = xe_vm_get(user_vm);
+			xe_vm_add_close_queue(user_vm);
+		}
 	}
 
 	return q;
@@ -653,11 +666,6 @@ void xe_exec_queue_destroy(struct kref *ref)
 	for_each_tlb_inval(q, i)
 		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, i);
 
-	if (q->user_vm) {
-		xe_vm_put(q->user_vm);
-		q->user_vm = NULL;
-	}
-
 	q->ops->destroy(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e6e53912448f..f5228c3c3ef6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1623,6 +1623,7 @@ static const struct xe_pt_ops xelp_pt_ops = {
 	.pde_encode_bo = xelp_pde_encode_bo,
 };
 
+static void vm_close_work_func(struct work_struct *w);
 static void vm_destroy_work_func(struct work_struct *w);
 
 /**
@@ -1766,6 +1767,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
+	atomic_set(&vm->close.num_exec_queues, 0);
+	init_waitqueue_head(&vm->close.wq);
+	spin_lock_init(&vm->close.lock);
+	INIT_WORK(&vm->close.work, vm_close_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	for (id = 0; id < XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE; ++id)
@@ -2011,19 +2016,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_close(vm);
 
-	if (vm->q) {
-		int i;
-
-		down_write(&vm->lock);
-		xe_exec_queue_last_fence_put(vm->q, vm);
-		for_each_tlb_inval(vm->q, i)
-			xe_exec_queue_tlb_inval_last_fence_put(vm->q, vm, i);
-		up_write(&vm->lock);
-
-		xe_exec_queue_kill(vm->q);
-		xe_exec_queue_put(vm->q);
-		vm->q = NULL;
-	}
+	xe_vm_kill_bind_queues(vm);
 
 	down_write(&vm->lock);
 	xe_vm_lock(vm, false);
@@ -2093,6 +2086,140 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_put(vm);
 }
 
+static void vm_close_work_func(struct work_struct *w)
+{
+	struct xe_vm *vm = container_of(w, struct xe_vm, close.work);
+	struct xe_device *xe = vm->xe;
+	int idx;
+
+	/* Keep the VM and device alive until the PM and unplug guards unwind. */
+	xe_vm_get(vm);
+
+	if (drm_dev_enter(&xe->drm, &idx)) {
+		xe_pm_runtime_get(xe);
+		xe_vm_close_and_put(vm);
+		xe_pm_runtime_put(xe);
+		drm_dev_exit(idx);
+	} else {
+		/*
+		 * The device is gone. Drop the VM without a runtime PM reference.
+		 * xe_vm_close() guards its own register access.
+		 */
+		xe_vm_close_and_put(vm);
+	}
+
+	xe_vm_put(vm);
+}
+
+/**
+ * xe_vm_kill_bind_queues() - Kill and release the VM bind queue
+ * @vm: The VM whose bind queue should be stopped
+ *
+ * Callers must serialize teardown of @vm. Later calls are harmless because
+ * the first call clears the VM bind queue pointer.
+ */
+void xe_vm_kill_bind_queues(struct xe_vm *vm)
+{
+	struct xe_exec_queue *q;
+	int i;
+
+	if (!vm->q)
+		return;
+
+	down_write(&vm->lock);
+	q = vm->q;
+	vm->q = NULL;
+	xe_exec_queue_last_fence_put(q, vm);
+	for_each_tlb_inval(q, i)
+		xe_exec_queue_tlb_inval_last_fence_put(q, vm, i);
+	up_write(&vm->lock);
+
+	xe_exec_queue_kill(q);
+	xe_exec_queue_put(q);
+}
+
+/**
+ * xe_vm_add_close_queue() - Track an exec queue using the VM
+ * @vm: The VM used by the exec queue
+ *
+ * The queue is tracked until its asynchronous destruction completes.
+ */
+void xe_vm_add_close_queue(struct xe_vm *vm)
+{
+	atomic_inc(&vm->close.num_exec_queues);
+}
+
+/**
+ * xe_vm_remove_close_queue() - Stop tracking an exec queue
+ * @vm: The VM used by the exec queue
+ *
+ * If this is the last tracked queue and VM close was deferred, schedule
+ * the deferred VM close.
+ */
+void xe_vm_remove_close_queue(struct xe_vm *vm)
+{
+	bool queue_close = false;
+
+	if (!atomic_dec_and_test(&vm->close.num_exec_queues))
+		return;
+
+	wake_up_all(&vm->close.wq);
+
+	spin_lock(&vm->close.lock);
+	if (vm->close.deferred) {
+		vm->close.deferred = false;
+		queue_close = true;
+	}
+	spin_unlock(&vm->close.lock);
+
+	if (queue_close)
+		xe_destroy_wq_queue(&vm->close.work);
+}
+
+/**
+ * xe_vm_close_and_put_deferred() - Close a VM immediately or defer the close
+ * @vm: The VM reference to consume
+ * @timeout: Maximum time to wait for VM queues, in jiffies
+ *
+ * The VM must already be marked closing, and callers must serialize teardown.
+ * Release the VM-owned bind queues before waiting for queue cleanup. Callers
+ * may release them earlier to start cleanup for several VMs before waiting.
+ *
+ * If queues remain after @timeout, keep the mappings and finish VM close
+ * after the last tracked queue is freed. This consumes the caller's VM
+ * reference on both the immediate and deferred paths.
+ *
+ * Return: %true if VM close was deferred, or %false if it completed now.
+ */
+bool xe_vm_close_and_put_deferred(struct xe_vm *vm, unsigned long timeout)
+{
+	bool queue_close = false;
+
+	/* Drop VM-owned queue references before waiting for their final free. */
+	xe_vm_kill_bind_queues(vm);
+
+	if (!atomic_read(&vm->close.num_exec_queues) ||
+	    wait_event_timeout(vm->close.wq,
+			       !atomic_read(&vm->close.num_exec_queues),
+			       timeout)) {
+		xe_vm_close_and_put(vm);
+		return false;
+	}
+
+	spin_lock(&vm->close.lock);
+	vm->close.deferred = true;
+	if (!atomic_read(&vm->close.num_exec_queues)) {
+		vm->close.deferred = false;
+		queue_close = true;
+	}
+	spin_unlock(&vm->close.lock);
+
+	if (queue_close)
+		xe_destroy_wq_queue(&vm->close.work);
+
+	return true;
+}
+
 static void vm_destroy_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm =
@@ -2289,7 +2416,14 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 
 	if (!err) {
 		xe_vm_close_start(vm);
-		xe_vm_close_and_put(vm);
+
+		/*
+		 * Internal bind queue cleanup is asynchronous, and user exec
+		 * queues can outlive the VM handle. Retain the mappings until
+		 * all tracked queues finish cleanup without waiting here.
+		 * The helper consumes the caller's VM reference.
+		 */
+		xe_vm_close_and_put_deferred(vm, 0);
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c90c9dc1351c..72978a99f389 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -221,6 +221,11 @@ int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 void xe_vm_close_start(struct xe_vm *vm);
+bool xe_vm_close_and_put_deferred(struct xe_vm *vm, unsigned long timeout);
+void xe_vm_kill_bind_queues(struct xe_vm *vm);
+
+void xe_vm_add_close_queue(struct xe_vm *vm);
+void xe_vm_remove_close_queue(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6ca9ef9d0c0b..6ebc6714534b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -14,6 +14,7 @@
 #include <linux/kref.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
+#include <linux/wait.h>
 
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
@@ -314,6 +315,20 @@ struct xe_vm {
 	 */
 	struct work_struct destroy_work;
 
+	/** @close: State used to defer VM teardown until exec queues are gone. */
+	struct {
+		/** @close.num_exec_queues: Queues which can access this VM. */
+		atomic_t num_exec_queues;
+		/** @close.wq: Waitqueue for exec queue teardown. */
+		wait_queue_head_t wq;
+		/** @close.lock: Protects deferred and work scheduling. */
+		spinlock_t lock;
+		/** @close.deferred: VM close is waiting for queue teardown. */
+		bool deferred;
+		/** @close.work: Completes a deferred VM close. */
+		struct work_struct work;
+	} close;
+
 	/**
 	 * @rftree: range fence tree to track updates to page table structure.
 	 * Used to implement conflict tracking between independent bind engines.
-- 
2.43.0

