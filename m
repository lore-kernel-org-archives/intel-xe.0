Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FA1C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4975010FEBE;
	Tue, 12 Mar 2024 14:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vm/6S1pU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8C510FD94
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252307; x=1741788307;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GgZqRILdrCvrDY0X/lT8To8xjmr3F5tDeCrQIvLcHFY=;
 b=Vm/6S1pUJMVc9reWczSBFppwPaLUYN6vsK4CbyKsgCrRcBnPj3Oeuawl
 3u2v8NzSfpiPW7o3KpnZHzezQ5h++2+xO6Z/pq0YZJ3t/rhG024NbU0m/
 1Ks9iYf2uiqpEvqdjMj6ne0yE4XOXCBAhIT9uhk+2TKgvtCC1tdSrEGhb
 hQ5Cyg5RvTtbaJ7qJKz6LCfOo2sM2ZEuIRhrhavj00q8uXc473rHpuZ+6
 RnUB9/fsZLy3exBZabjdF5lfafLgM6/d5hQb4j20lFl0V5fpm9JEsmEQi
 Th9/6teVqNXrdWBv+ahpVDUVRIkuFRN5gTQpoT4QAjlJNT75H0mvfiK4u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22415993"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22415993"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12148458"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/7] drm/xe: Reserve fences where needed
Date: Tue, 12 Mar 2024 15:04:43 +0100
Message-ID: <20240312140447.50437-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

Reserve fence slots where actually needed rather than trying to
predict how many fence slots will be needed over a complete
wound-wait transaction.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c         | 27 +---------------
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
 drivers/gpu/drm/xe/xe_pt.c           | 14 ++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm.h           |  3 +-
 5 files changed, 40 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 5124663a9694..13d1fba2c9d7 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -96,41 +96,16 @@
 
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
-	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
 	struct drm_gem_object *obj;
 	unsigned long index;
-	int num_fences;
 	int ret;
 
 	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
 	if (ret)
 		return ret;
 
-	/*
-	 * 1 fence slot for the final submit, and 1 more for every per-tile for
-	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
-	 * many vma per object/dma-resv, however the fence slot will just be
-	 * re-used, since they are largely the same timeline and the seqno
-	 * should be in order. In the case of CPU bind there is dummy fence used
-	 * for all CPU binds, so no need to have a per-tile slot for that.
-	 */
-	num_fences = 1 + 1 + vm->xe->info.tile_count;
-
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
 	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
-		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		ret = dma_resv_reserve_fences(obj->resv, 1);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73c535193a98..12a5735f4352 100644
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
index 8e1b6456897b..9a1a47a5a4ad 100644
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
@@ -1575,6 +1582,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
 	struct xe_range_fence *rfence;
+	int err;
 
 	LLIST_HEAD(deferred);
 
@@ -1592,6 +1600,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
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
index 18a8e1137016..faad7f52b3ca 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -486,14 +486,11 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 				 bool *done)
 {
+	struct drm_gem_object *obj;
+	unsigned long index;
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
 
@@ -508,7 +505,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 		return 0;
 	}
 
-	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
 	if (err)
 		return err;
 
@@ -516,7 +513,17 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	return drm_gpuvm_validate(&vm->gpuvm, exec);
+	err = drm_gpuvm_validate(&vm->gpuvm, exec);
+	if (err)
+		return err;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -1026,35 +1033,26 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
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
@@ -1066,7 +1064,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_vm_prepare_vma(&exec, vma, 0);
+		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
@@ -2534,7 +2532,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = xe_vm_prepare_vma(exec, vma, 1);
+	err = xe_vm_lock_vma(exec, vma);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4853354336f2..20009d8b4702 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -242,8 +242,7 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
-int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
-		      unsigned int num_shared);
+int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 /**
  * xe_vm_resv() - Return's the vm's reservation object
-- 
2.44.0

