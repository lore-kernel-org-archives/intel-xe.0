Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23239C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 15:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2FF10E3C3;
	Mon, 10 Jun 2024 15:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gt9zrvrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEC810E4C1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718032856; x=1749568856;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=evn1sauvJJv1+clkglWeGYWHfupBZWHaa7i3BMqPW7w=;
 b=gt9zrvrDEBc9xWMg+tWxf6hsjU8KrRRfsE5IlBINVNUEhPphwPiVj5a2
 tIYWmrY6dr2QpyGxrNyQzSkohj7wJPfIblz0hZRvGhYWNx6q211wrxizg
 pcrJz7K8q2rkr0q/j4zdwiTfbzjCINoxoD+Z6cdvZS5cpKY+flEDEjq/K
 F4WgfTW+KocyizppprXnOJBXkWhwrTp39zXWWFFc92moQ2jAycKfdyBMB
 X2x59DnquRnejNzA936j9S3Xh/1r5+JOuMpxfOFGqLAr5BNgMKhZ2Xnb9
 ioxPRDy6jSTQXDUTrvjdQbDflVOrMIU3lY8WP8GqPg8+UGvG+7ggOejY6 A==;
X-CSE-ConnectionGUID: +QHOvLvuQtytsvpUIKV1yA==
X-CSE-MsgGUID: waU5gzwgRLm7rPgcOIWa8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14820719"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14820719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:29 -0700
X-CSE-ConnectionGUID: xM+uDigLQdOiNapn/UYdvw==
X-CSE-MsgGUID: 8di3BzzdTwG70UDdZp4BRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43529294"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/3] drm/xe: Take the validation rwsem in exclusive mode on OOM
Date: Mon, 10 Jun 2024 17:20:16 +0200
Message-ID: <20240610152017.43436-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
References: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
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

In the unlikely event that we hit an OOM from TTM validation, take
the validation rwsem in exclusive mode to block parallel validation
and submission on the same device.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c         | 10 ++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 ++++-----
 drivers/gpu/drm/xe/xe_vm.c           | 33 +++++++++++-----------------
 drivers/gpu/drm/xe/xe_vm.h           |  2 +-
 4 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index fce1519e3b34..16b4224e58ae 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -123,7 +123,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
-	ktime_t end = 0;
+	bool exclusive = false;
 	int err = 0;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
@@ -229,11 +229,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm_exec.vm = &vm->gpuvm;
 	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	if (xe_vm_in_lr_mode(vm)) {
-		xe_exec_init(exec, vm_exec.flags, 0, xe, false);
+		xe_exec_init(exec, vm_exec.flags, 0, xe, exclusive);
 	} else {
-		err = xe_gpuvm_exec_lock(&vm_exec, xe, false);
+		err = xe_gpuvm_exec_lock(&vm_exec, xe, exclusive);
 		if (err) {
-			if (xe_vm_validate_should_retry(exec, err, &end))
+			if (xe_vm_validate_should_retry(exec, err, &exclusive))
 				err = -EAGAIN;
 			goto err_unlock_list;
 		}
@@ -320,7 +320,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	xe_exec_fini(exec, xe, false);
+	xe_exec_fini(exec, xe, exclusive);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index a0b9b6c56db1..b8d0076a2dd2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -132,7 +132,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	ktime_t end = 0;
+	bool exclusive = false;
 	int err;
 	bool atomic;
 
@@ -154,11 +154,11 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	}
 
 	/* Lock VM and BOs dma-resv */
-	(void) xe_exec_init(&exec, 0, 0, vm->xe, false);
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, exclusive);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (xe_vm_validate_should_retry(&exec, err, &end))
+		if (xe_vm_validate_should_retry(&exec, err, &exclusive))
 			err = -EAGAIN;
 		if (err)
 			goto unlock_dma_resv;
@@ -168,7 +168,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			if (xe_vm_validate_should_retry(&exec, err, &end))
+			if (xe_vm_validate_should_retry(&exec, err, &exclusive))
 				err = -EAGAIN;
 			goto unlock_dma_resv;
 		}
@@ -179,7 +179,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
-	xe_exec_fini(&exec, vm->xe, false);
+	xe_exec_fini(&exec, vm->xe, exclusive);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 25cc4e68ca58..3399c7e5bf4d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -341,32 +341,25 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
  * xe_vm_validate_should_retry() - Whether to retry after a validate error.
  * @exec: The drm_exec object used for locking before validation.
  * @err: The error returned from ttm_bo_validate().
- * @end: A ktime_t cookie that should be set to 0 before first use and
- * that should be reused on subsequent calls.
+ * @exclusive: A pointer to a bool that holds the previous validation
+ * semaphore locking mode on input and the desired locking mode on output.
  *
  * With multiple active VMs, under memory pressure, it is possible that
  * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
  * Until ttm properly handles locking in such scenarios, best thing the
- * driver can do is retry with a timeout. Check if that is necessary, and
- * if so unlock the drm_exec's objects while keeping the ticket to prepare
- * for a rerun.
+ * driver can do is retry locking out other validators.
+ * Check if that is necessary, and also indicate the intended mode of
+ * the validation semaphore.
  *
  * Return: true if a retry after drm_exec_init() is recommended;
  * false otherwise.
  */
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
+bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, bool *exclusive)
 {
-	ktime_t cur;
-
-	if (err != -ENOMEM)
-		return false;
-
-	cur = ktime_get();
-	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
-	if (!ktime_before(cur, *end))
+	if (err != -ENOMEM || *exclusive)
 		return false;
 
-	msleep(20);
+	*exclusive = true;
 	return true;
 }
 
@@ -473,7 +466,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
-	ktime_t end = 0;
+	bool exclusive = false;
 	int err = 0;
 	long wait;
 	int __maybe_unused tries = 0;
@@ -496,7 +489,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	err = xe_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, vm->xe, false);
+	err = xe_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, vm->xe, exclusive);
 	if (err)
 		goto out_unlock_outer;
 
@@ -506,8 +499,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
 		if (err || done) {
-			xe_exec_fini(&exec, vm->xe, false);
-			if (err && xe_vm_validate_should_retry(&exec, err, &end))
+			xe_exec_fini(&exec, vm->xe, exclusive);
+			if (err && xe_vm_validate_should_retry(&exec, err, &exclusive))
 				err = -EAGAIN;
 
 			goto out_unlock_outer;
@@ -555,7 +548,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	xe_exec_fini(&exec, vm->xe, false);
+	xe_exec_fini(&exec, vm->xe, exclusive);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..e5d12196b102 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -241,7 +241,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
+bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, bool *exclusive);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
-- 
2.44.0

