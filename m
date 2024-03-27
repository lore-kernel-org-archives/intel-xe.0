Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E269CD11DF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 09:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9AB10F98A;
	Wed, 27 Mar 2024 09:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljxgU1Ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD7010F986
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711530721; x=1743066721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YpLsxOriWC9+RnRr2Q5YVp5DdAO2/X20f6YxWclCQVo=;
 b=ljxgU1MaH2q6GWsoRjvJj/hBbtK8Jvcf2FwxO3/uPKZzvqU53iYVQXlZ
 jLxIIE4zyb12mwP+kdm/8NZrmntKqZRNMkj3yRLRvoPk3fVgPzf6BDl5S
 nmwK8/WG3+bVHeTd2nDI0nPdzFmq9HOIOLPNXbG2kZteHiTVTPxAs/O/x
 V/EavjEgmKMqXcYripsIjXcn+6G8YiaP35q2Tx/tvBERlUpxMKcS8FAXW
 CStOZLKK7I32ZbLYejr5+4V90cD238eYEBX+HhgBo922wfdA5Bch3b7uY
 0cZ6n8xz+yN5J3hX9KW0c94T4IkCBKEX0faOVatswLnneop/fwRXM11sH A==;
X-CSE-ConnectionGUID: EfC2uzPJSoWO5dtP1K3SGg==
X-CSE-MsgGUID: D8O/bgFSQ+SldxUlEmpxNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29097883"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29097883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16615129"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/4] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Wed, 27 Mar 2024 10:11:36 +0100
Message-ID: <20240327091136.3271-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
References: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
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

Rebinding might allocate page-table bos, causing evictions.
To support blocking locking during these evictions,
perform the rebinding in the drm_exec locking loop.

Also Reserve fence slots where actually needed rather than trying to
predict how many fence slots will be needed over a complete
wound-wait transaction.

v2:
- Remove a leftover call to xe_vm_rebind() (Matt Brost)
- Add a helper function xe_vm_validate_rebind() (Matt Brost)
v3:
- Add comments and squash with previous patch (Matt Brost)

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c         | 52 ++---------------
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
 drivers/gpu/drm/xe/xe_pt.c           | 14 +++++
 drivers/gpu/drm/xe/xe_vm.c           | 83 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h           |  6 +-
 5 files changed, 83 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index b7e26e8e6472..97eeb973e897 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -94,48 +94,16 @@
  *	Unlock all
  */
 
+/*
+ * Add validation and rebinding to the drm_exec locking loop, since both can
+ * trigger eviction which may require sleeping dma_resv locks.
+ */
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
 	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
-	struct drm_gem_object *obj;
-	unsigned long index;
-	int num_fences;
-	int ret;
-
-	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
-	if (ret)
-		return ret;
-
-	/*
-	 * 1 fence slot for the final submit, and 1 more for every per-tile for
-	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
-	 * many vma per object/dma-resv, however the fence slot will just be
-	 * re-used, since they are largely the same timeline and the seqno
-	 * should be in order. In the case of CPU bind there is dummy fence used
-	 * for all CPU binds, so no need to have a per-tile slot for that.
-	 */
-	num_fences = 1 + 1 + vm->xe->info.tile_count;
 
-	/*
-	 * We don't know upfront exactly how many fence slots we will need at
-	 * the start of the exec, since the TTM bo_validate above can consume
-	 * numerous fence slots. Also due to how the dma_resv_reserve_fences()
-	 * works it only ensures that at least that many fence slots are
-	 * available i.e if there are already 10 slots available and we reserve
-	 * two more, it can just noop without reserving anything.  With this it
-	 * is quite possible that TTM steals some of the fence slots and then
-	 * when it comes time to do the vma binding and final exec stage we are
-	 * lacking enough fence slots, leading to some nasty BUG_ON() when
-	 * adding the fences. Hence just add our own fences here, after the
-	 * validate stage.
-	 */
-	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
-		ret = dma_resv_reserve_fences(obj->resv, num_fences);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	/* The fence slot added here is intended for the exec sched job. */
+	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -289,14 +257,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	/*
-	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
-	 * VM mode only.
-	 */
-	err = xe_vm_rebind(vm, false);
-	if (err)
-		goto err_put_job;
-
 	/* Wait behind rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 241c294270d9..fa9e9853c53b 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -100,10 +100,9 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
-	unsigned int num_shared = 2; /* slots for bind + move */
 	int err;
 
-	err = xe_vm_prepare_vma(exec, vma, num_shared);
+	err = xe_vm_lock_vma(exec, vma);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d1b999dbc906..580fe869b414 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1235,6 +1235,13 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
 	if (err)
 		goto err;
+
+	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
+	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
+	if (err)
+		goto err;
+
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
@@ -1577,6 +1584,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
 	struct xe_range_fence *rfence;
+	int err;
 
 	LLIST_HEAD(deferred);
 
@@ -1594,6 +1602,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
 				   num_entries);
 
+	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
+	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
+	if (err)
+		return ERR_PTR(err);
+
 	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 	if (!ifence)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e995196862db..8b32aa5003df 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -482,17 +482,53 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 	return 0;
 }
 
+/**
+ * xe_vm_validate_rebind() - Validate buffer objects and rebind vmas
+ * @vm: The vm for which we are rebinding.
+ * @exec: The struct drm_exec with the locked GEM objects.
+ * @num_fences: The number of fences to reserve for the operation, not
+ * including rebinds and validations.
+ *
+ * Validates all evicted gem objects and rebinds their vmas. Note that
+ * rebindings may cause evictions and hence the validation-rebind
+ * sequence is rerun until there are no more objects to validate.
+ *
+ * Return: 0 on success, negative error code on error. In particular,
+ * may return -EINTR or -ERESTARTSYS if interrupted, and -EDEADLK if
+ * the drm_exec transaction needs to be restarted.
+ */
+int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
+			  unsigned int num_fences)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+	int ret;
+
+	do {
+		ret = drm_gpuvm_validate(&vm->gpuvm, exec);
+		if (ret)
+			return ret;
+
+		ret = xe_vm_rebind(vm, false);
+		if (ret)
+			return ret;
+	} while (!list_empty(&vm->gpuvm.evict.list));
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 				 bool *done)
 {
 	int err;
 
-	/*
-	 * 1 fence for each preempt fence plus a fence for each tile from a
-	 * possible rebind
-	 */
-	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
-				   vm->xe->info.tile_count);
+	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
 	if (err)
 		return err;
 
@@ -507,7 +543,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 		return 0;
 	}
 
-	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
 	if (err)
 		return err;
 
@@ -515,7 +551,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	return drm_gpuvm_validate(&vm->gpuvm, exec);
+	/*
+	 * Add validation and rebinding to the locking loop since both can
+	 * cause evictions which may require blocing dma_resv locks.
+	 * The fence reservation here is intended for the new preempt fences
+	 * we attach at the end of the rebind work.
+	 */
+	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -1000,35 +1042,26 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 }
 
 /**
- * xe_vm_prepare_vma() - drm_exec utility to lock a vma
+ * xe_vm_lock_vma() - drm_exec utility to lock a vma
  * @exec: The drm_exec object we're currently locking for.
  * @vma: The vma for witch we want to lock the vm resv and any attached
  * object's resv.
- * @num_shared: The number of dma-fence slots to pre-allocate in the
- * objects' reservation objects.
  *
  * Return: 0 on success, negative error code on error. In particular
  * may return -EDEADLK on WW transaction contention and -EINTR if
  * an interruptible wait is terminated by a signal.
  */
-int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
-		      unsigned int num_shared)
+int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_bo *bo = xe_vma_bo(vma);
 	int err;
 
 	XE_WARN_ON(!vm);
-	if (num_shared)
-		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
-	else
-		err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
-	if (!err && bo && !bo->vm) {
-		if (num_shared)
-			err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
-		else
-			err = drm_exec_lock_obj(exec, &bo->ttm.base);
-	}
+
+	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
+	if (!err && bo && !bo->vm)
+		err = drm_exec_lock_obj(exec, &bo->ttm.base);
 
 	return err;
 }
@@ -1040,7 +1073,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_vm_prepare_vma(&exec, vma, 0);
+		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
@@ -2506,7 +2539,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = xe_vm_prepare_vma(exec, vma, 1);
+	err = xe_vm_lock_vma(exec, vma);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4853354336f2..306cd0934a19 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -242,8 +242,10 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
-int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
-		      unsigned int num_shared);
+int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
+
+int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
+			  unsigned int num_fences);
 
 /**
  * xe_vm_resv() - Return's the vm's reservation object
-- 
2.44.0

