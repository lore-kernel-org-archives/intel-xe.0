Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F7C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 15:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35010E325;
	Mon, 10 Jun 2024 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLQxOGpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B710E4C0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718032856; x=1749568856;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Ij51uAOa0OFC8Y6WkjDEY1CfYzwqUW403WEcUFROGA=;
 b=XLQxOGpPOgOPbDUAnb/HZXUq/QRcp7F2doGhGIwPiWukrZSsTQa6Zrf2
 HXXza9kNQkDKDVZE0i/Gnta0wj/nFnOemDfiZcmLW+VkCC0WsrXspnoed
 YZWbDE3A8ijTJFLx9k8LSDuRBc0LeAMpwCUt3VWneuzpSQlcgZhdDiYqS
 NuRXKKlpRiecnGOCRJaYN5M6AwKVDZfKWHBZNo0LB4r6kVynQ4ANBW4pA
 omiXmxBUBiMqvcHk2qy7qF6sGYdK1HybsL3FaBo5gmt6w0l82+NTQdOqW
 uC9f7WZy+D+RxZOsdmTZ5r65UnGvJA6WX8Gl6va7b6Y+hCkKrXN6jsX+z A==;
X-CSE-ConnectionGUID: VIuE2eI5SCyAaFmK0yqiAg==
X-CSE-MsgGUID: uo0BdEeTTO+OUx6kO9FVbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14820718"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14820718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:28 -0700
X-CSE-ConnectionGUID: 9ygDZGHgQ4eZ20f/4mi+Xw==
X-CSE-MsgGUID: w89Eya2ARoSVDAU4mYhYHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43529293"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/3] drm/xe: poor man's exhaustive eviction
Date: Mon, 10 Jun 2024 17:20:15 +0200
Message-ID: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  2 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_exec.c         |  7 +--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++--
 drivers/gpu/drm/xe/xe_val_lock.c     | 65 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_val_lock.h     | 18 ++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 35 +++++++++------
 8 files changed, 119 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_val_lock.c
 create mode 100644 drivers/gpu/drm/xe/xe_val_lock.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 478acc94a71c..de317359d7d7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -119,6 +119,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
+	xe_val_lock.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94dbfe5cf19c..284cbcf124a7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -275,6 +275,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	spin_lock_init(&xe->irq.lock);
 	spin_lock_init(&xe->clients.lock);
 
+	init_rwsem(&xe->val_lock);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f1c09824b145..824d82d6d0eb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -473,6 +473,8 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	struct rw_semaphore val_lock;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4cf6c6ab4866..fce1519e3b34 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -18,6 +18,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_val_lock.h"
 #include "xe_vm.h"
 
 /**
@@ -228,9 +229,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm_exec.vm = &vm->gpuvm;
 	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	if (xe_vm_in_lr_mode(vm)) {
-		drm_exec_init(exec, vm_exec.flags, 0);
+		xe_exec_init(exec, vm_exec.flags, 0, xe, false);
 	} else {
-		err = drm_gpuvm_exec_lock(&vm_exec);
+		err = xe_gpuvm_exec_lock(&vm_exec, xe, false);
 		if (err) {
 			if (xe_vm_validate_should_retry(exec, err, &end))
 				err = -EAGAIN;
@@ -319,7 +320,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(exec);
+	xe_exec_fini(exec, xe, false);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index eaf68f0135c1..a0b9b6c56db1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -20,6 +20,7 @@
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
 #include "xe_trace.h"
+#include "xe_val_lock.h"
 #include "xe_vm.h"
 
 struct pagefault {
@@ -153,7 +154,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	}
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, false);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
@@ -178,7 +179,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
-	drm_exec_fini(&exec);
+	xe_exec_fini(&exec, vm->xe, false);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
@@ -522,7 +523,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, false);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, true, tile->id);
 		drm_exec_retry_on_contention(&exec);
@@ -530,7 +531,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 			break;
 	}
 
-	drm_exec_fini(&exec);
+	xe_exec_fini(&exec, vm->xe, false);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_val_lock.c b/drivers/gpu/drm/xe/xe_val_lock.c
new file mode 100644
index 000000000000..560f92ca182f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_val_lock.c
@@ -0,0 +1,65 @@
+#include <drm/drm_exec.h>
+#include <drm/drm_gpuvm.h>
+
+#include "xe_device_types.h"
+#include "xe_val_lock.h"
+
+static int xe_val_lock(struct xe_device *xe, bool intr, bool exclusive)
+{
+	if (intr) {
+		if (exclusive)
+			return down_write_killable(&xe->val_lock);
+		else
+			return down_read_interruptible(&xe->val_lock);
+	}
+
+	if (exclusive)
+		down_write(&xe->val_lock);
+	else
+		down_read(&xe->val_lock);
+
+	return 0;
+}
+
+static void xe_val_unlock(struct xe_device *xe, bool exclusive)
+{
+	if (exclusive)
+		up_write(&xe->val_lock);
+	else
+		up_read(&xe->val_lock);
+}
+
+int xe_exec_init(struct drm_exec *exec, u32 flags, unsigned int nr,
+		 struct xe_device *xe, bool exclusive)
+{
+	int ret = xe_val_lock(xe, flags & DRM_EXEC_INTERRUPTIBLE_WAIT,
+			      exclusive);
+	if (ret)
+		return ret;
+
+	drm_exec_init(exec, flags, nr);
+
+	return 0;
+}
+
+int xe_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec, struct xe_device *xe, bool exclusive)
+{
+	int ret = xe_val_lock(xe, vm_exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT,
+			      exclusive);
+
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_exec_lock(vm_exec);
+	if (ret)
+		xe_val_unlock(xe, exclusive);
+
+	return ret;
+}
+	
+void xe_exec_fini(struct drm_exec *exec, struct xe_device *xe, bool exclusive)
+{
+	drm_exec_fini(exec);
+	xe_val_unlock(xe, exclusive);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_val_lock.h b/drivers/gpu/drm/xe/xe_val_lock.h
new file mode 100644
index 000000000000..c0bb7670b86b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_val_lock.h
@@ -0,0 +1,18 @@
+#ifndef _XE_VAL_LOCK_H_
+#define _XE_VAL_LOCK_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct drm_exec;
+struct drm_gpuvm_exec;
+
+int xe_exec_init(struct drm_exec *exec, u32 flags, unsigned int nr,
+		 struct xe_device *xe, bool exclusive);
+
+int xe_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec, struct xe_device *xe, bool exclusive);
+
+void xe_exec_fini(struct drm_exec *exec, struct xe_device *xe, bool exclusive);
+
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99bf7412475c..25cc4e68ca58 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -37,6 +37,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
+#include "xe_val_lock.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
 
@@ -234,7 +235,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
+	err = xe_gpuvm_exec_lock(&vm_exec, vm->xe, false);
 	if (err)
 		goto out_up_write;
 
@@ -266,7 +267,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_fini:
-	drm_exec_fini(exec);
+	xe_exec_fini(exec, vm->xe, false);
 out_up_write:
 	up_write(&vm->lock);
 
@@ -495,7 +496,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	err = xe_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, vm->xe, false);
+	if (err)
+		goto out_unlock_outer;
 
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
@@ -503,7 +506,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
 		if (err || done) {
-			drm_exec_fini(&exec);
+			xe_exec_fini(&exec, vm->xe, false);
 			if (err && xe_vm_validate_should_retry(&exec, err, &end))
 				err = -EAGAIN;
 
@@ -552,7 +555,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	xe_exec_fini(&exec, vm->xe, false);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1046,10 +1049,11 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct drm_exec exec;
 	int err;
 
-	drm_exec_init(&exec, 0, 0);
+	(void) xe_exec_init(&exec, 0, 0, xe, false);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
@@ -1059,7 +1063,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 
 	xe_vma_destroy(vma, NULL);
 
-	drm_exec_fini(&exec);
+	xe_exec_fini(&exec, xe, false);
 }
 
 struct xe_vma *
@@ -2145,7 +2149,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+		err = xe_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, vm->xe, false);
+		if (err)
+			return ERR_PTR(err);
 		drm_exec_until_all_locked(&exec) {
 			err = 0;
 			if (!bo->vm) {
@@ -2157,7 +2163,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 				drm_exec_retry_on_contention(&exec);
 			}
 			if (err) {
-				drm_exec_fini(&exec);
+				xe_exec_fini(&exec, vm->xe, false);
 				return ERR_PTR(err);
 			}
 		}
@@ -2166,7 +2172,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, pat_index, flags);
 	if (bo)
-		drm_exec_fini(&exec);
+		xe_exec_fini(&exec, vm->xe, false);
 
 	if (xe_vma_is_userptr(vma)) {
 		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
@@ -2882,8 +2888,11 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES, 0);
+	err = xe_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+			   DRM_EXEC_IGNORE_DUPLICATES, 0, vm->xe, false);
+	if (err)
+		return err;
+
 	drm_exec_until_all_locked(&exec) {
 		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
@@ -2902,7 +2911,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	}
 
 unlock:
-	drm_exec_fini(&exec);
+	xe_exec_fini(&exec, vm->xe, false);
 	return err;
 }
 
-- 
2.44.0

