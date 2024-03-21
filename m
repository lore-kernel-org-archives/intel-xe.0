Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB14C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B9110E76A;
	Thu, 21 Mar 2024 11:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuH1m2Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7B10E7A2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711021065; x=1742557065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZ9MVKQ8qtegrZt3mihdcCf7QjpIk2fB3SmSYHn1M84=;
 b=EuH1m2Y6RqNKdmvky7nh8h1GjSe5lpHsfHQfrjiWCm1N8xrZsnj2jHXf
 VqJhBCTvvUSfsJI/H8DmnYypxF24J02vBeHLMaoikvTkHXR5itLkxdQCC
 wl/EH/q6lTASA5wXHKD64Qtviue/bYwLSfDyae9HfsFUqy1wdsWzO8/+l
 E1n5vXHTCMxITG2Y0l4lJekPF2Xo8c1Kyd4KUr58ANbr3af10ubkeA814
 6KxA/lSKjvNV+jVoFnJ4VoeMDP/7XCM0GvOs2mtW30sTnpCKPOziiEv/0
 SZLsHnB5sztb2efPwQCK78hDRZDqEs7lUjS4nSzUkz9nKnsOEdISekJ/q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6127352"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6127352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19053270"
Received: from dinieasx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.100])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 3/7] drm/xe: Reserve fences where needed
Date: Thu, 21 Mar 2024 12:37:15 +0100
Message-ID: <20240321113720.120865-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
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

Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c         | 27 +---------------
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
 drivers/gpu/drm/xe/xe_pt.c           | 14 ++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm.h           |  3 +-
 5 files changed, 40 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7692ebfe7d47..511d23426a5e 100644
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
index 109c26e5689e..7add08b2954e 100644
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
@@ -1576,6 +1583,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
 	struct xe_range_fence *rfence;
+	int err;
 
 	LLIST_HEAD(deferred);
 
@@ -1593,6 +1601,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
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
index 80d43d75b1da..cff8db605743 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -485,14 +485,11 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
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
 
@@ -507,7 +504,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 		return 0;
 	}
 
-	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
 	if (err)
 		return err;
 
@@ -515,7 +512,17 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -1004,35 +1011,26 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
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
@@ -1044,7 +1042,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_vm_prepare_vma(&exec, vma, 0);
+		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
@@ -2511,7 +2509,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = xe_vm_prepare_vma(exec, vma, 1);
+	err = xe_vm_lock_vma(exec, vma);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6df1f1c7f85d..47f3960120a0 100644
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

