Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE01606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DVC9SRQt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EA4112A1B;
	Fri, 20 Nov 2026 13:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0256112A16
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179808; x=1826715808;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5AhMjxrBZs9KVnCr9+HhQRbI1zlnkfCtG9NhmlQ9y4Q=;
 b=DVC9SRQtfURwtJy69TLZkqiFcreFycGa9r/iHBiCmrk2l2IIB+XSLDaS
 HxrBa/0lxiI4/Fbd+xfOZemV7A1C1Zk38R9INaJRhOogJkUz2RdJvbgC5
 8FUNpQE1NmJQ9cYWzX/qtxhq0gnb8df2XTwtu8F/Qe99M3puowclU7Czw
 juaP9oY7vj29tJka0FUxTbsqQrzFQhu0oVOBmJmyNF1yKsyWeqlvh/sUO
 n2nvTtTEH35BtxBL2McBvLq8lRzmxcuUnL9ysuelHCfQATmycRbrexv/B
 Oh+684p605yPiptUANGoS7LRY2YZ7OhNG/hvNYQWNoU4NC9YIENfQQpMY A==;
X-CSE-ConnectionGUID: +u+5udP5Tm2/7pN0t4J42w==
X-CSE-MsgGUID: 5NYnuayfSnuqiOXuyUpYiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072687"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:27 -0800
X-CSE-ConnectionGUID: KTgwDg/3RtOFqSimTtYZFw==
X-CSE-MsgGUID: bQ1B5v2uTjeD5LTx5pWQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639266"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 20 Nov 2026 13:02:20 +0000
Subject: [PATCH v2 5/6] drm/xe/userptr: Make the repin retry loop non-fatal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-userptr-repin-v2-5-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

drm_gpusvm_get_pages() gives up with -EBUSY after a fixed one second
budget if the CPU mappings keep changing during the repin. That error
was treated as fatal: the rebind worker killed the VM, exec returned it
to user-space and the bind ioctl converted it to -ENOMEM.

Instead, time-stamp the first repin attempt of a userptr and, as long as
the overall timeout (the userptr_repin_timeout_ms sysfs attribute, read
on each check) hasn't expired, translate -EBUSY into -EAGAIN. Discount
idle gaps between attempts (for example if the task was stopped via
SIGTSTP) so resuming does not immediately trip the timeout. Callers drop
all locks and retry:

- exec and the rebind worker already retry on -EAGAIN.
- The bind and madvise ioctls restart from the top with vm->lock
  dropped. Since new vmas are created on each attempt, they track the
  overall timeout themselves.
- The pagefault handler repeats the repin.

Only when the overall timeout expires is -EBUSY returned. Drop the
-EBUSY to -ENOMEM conversion in new_vma() as -EBUSY now means just that.

v2 (Matt):
 - Reset num_ufence at the retry label in xe_vm_bind_ioctl() so user
   fences are not counted twice across repin retries.
 - Handle -EAGAIN from xe_vm_alloc_madvise_vma() in
   xe_vm_madvise_ioctl() with vm->lock dropped and repin timeout
   tracking.
 - Discount idle gaps longer than XE_USERPTR_REPIN_IDLE_MS between
   attempts and check signal_pending() / return -ERESTARTSYS in ioctl
   retry loops so stopping and resuming (e.g. Ctrl-Z) works without
   immediately timing out.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       |  9 +++++--
 drivers/gpu/drm/xe/xe_pagefault.c  |  4 +++
 drivers/gpu/drm/xe/xe_userptr.c    | 47 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_userptr.h    | 53 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c         | 43 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_madvise.c | 23 ++++++++++++++++-
 6 files changed, 159 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 1949fb103fad..0e6a197a8e85 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -10,6 +10,7 @@
 #include <drm/drm_file.h>
 #include <uapi/drm/xe_drm.h>
 #include <linux/delay.h>
+#include <linux/sched/signal.h>
 
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -380,8 +381,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
-	if (err == -EAGAIN)
-		goto retry;
+	if (err == -EAGAIN) {
+		cond_resched();
+		if (!signal_pending(current))
+			goto retry;
+		err = -ERESTARTSYS;
+	}
 err_hw_exec_mode:
 	if (mode == EXEC_MODE_DMA_FENCE)
 		xe_hw_engine_group_put(group);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 98cce0f12b12..6c4e5e77e1c6 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -191,6 +191,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
 			err = xe_vma_userptr_pin_pages(uvma);
+			if (err == -EAGAIN) {
+				cond_resched();
+				continue;
+			}
 			if (err) {
 				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN);
 				return err;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 9c1dac0fce6f..39806ca9f54a 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -74,6 +74,23 @@ static bool __xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
 #define xe_vma_userptr_lockdep(uvma)
 #endif
 
+/**
+ * xe_vma_userptr_pin_pages() - Pin and map the pages of a userptr vma
+ * @uvma: The userptr vma.
+ *
+ * Pin the pages and set up the dma mappings. If the CPU mappings keep changing
+ * during the repin, drm_gpusvm_get_pages() eventually gives up with -EBUSY.
+ * That is converted to -EAGAIN until the overall repin timeout, measured from
+ * the first attempt since the last successful repin, expires. The caller is
+ * then expected to drop all locks and retry.
+ *
+ * Context: Either vm->lock held in write mode, or in read mode together with
+ * the vma's fault_lock.
+ *
+ * Return: 0 on success, -EAGAIN if the caller should retry with all locks
+ * dropped, -EBUSY if the overall timeout expired, or another negative error
+ * code on failure.
+ */
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
 	struct xe_vma *vma = &uvma->vma;
@@ -84,19 +101,35 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
 		.allow_mixed = true,
 	};
+	int err;
 
 	xe_vma_userptr_lockdep(uvma);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
-	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+	if (vma->gpuva.flags & XE_VMA_DESTROYED) {
+		uvma->userptr.repin = (struct xe_userptr_repin){};
 		return 0;
+	}
 
-	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
-				    uvma->userptr.notifier.mm,
-				    &uvma->userptr.notifier,
-				    xe_vma_userptr(vma),
-				    xe_vma_userptr(vma) + xe_vma_size(vma),
-				    &ctx);
+	xe_userptr_repin_begin(&uvma->userptr.repin);
+
+	err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
+				   uvma->userptr.notifier.mm,
+				   &uvma->userptr.notifier,
+				   xe_vma_userptr(vma),
+				   xe_vma_userptr(vma) + xe_vma_size(vma),
+				   &ctx);
+	if (err == -EBUSY) {
+		u32 timeout_ms = READ_ONCE(xe->userptr_repin_timeout_ms);
+
+		if (xe_userptr_repin_should_retry(&uvma->userptr.repin,
+						  timeout_ms))
+			return -EAGAIN;
+	}
+
+	uvma->userptr.repin = (struct xe_userptr_repin){};
+
+	return err;
 }
 
 static struct mmu_interval_notifier_finish *
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index 2a3cd1b5efbb..179f2aca26a3 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -6,6 +6,8 @@
 #ifndef _XE_USERPTR_H_
 #define _XE_USERPTR_H_
 
+#include <linux/hmm.h>
+#include <linux/jiffies.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
@@ -20,6 +22,51 @@ struct xe_vm;
 struct xe_vma;
 struct xe_userptr_vma;
 
+/**
+ * struct xe_userptr_repin - Timeout tracking state for userptr repin retries
+ * @start: Timestamp in jiffies of the first repin attempt, adjusted for idle
+ *	   gaps, or zero if no repin is in progress.
+ * @last: Timestamp in jiffies when the previous attempt failed with -EBUSY,
+ *	  or zero if no retry is pending.
+ */
+struct xe_userptr_repin {
+	unsigned long start;
+	unsigned long last;
+};
+
+/*
+ * If more than XE_USERPTR_REPIN_IDLE_MS elapses between attempts (for example
+ * when the task was stopped via SIGTSTP/Ctrl-Z), discount the idle gap so
+ * waking up does not immediately expire the overall repin timeout.
+ */
+#define XE_USERPTR_REPIN_IDLE_MS (5 * HMM_RANGE_DEFAULT_TIMEOUT)
+
+static inline void xe_userptr_repin_begin(struct xe_userptr_repin *repin)
+{
+	unsigned long now = jiffies;
+
+	if (!repin->start) {
+		repin->start = now ?: 1;
+		return;
+	}
+
+	if (repin->last &&
+	    time_after(now, repin->last +
+		       msecs_to_jiffies(XE_USERPTR_REPIN_IDLE_MS)))
+		repin->start = (repin->start + (now - repin->last)) ?: 1;
+	repin->last = 0;
+}
+
+static inline bool xe_userptr_repin_should_retry(struct xe_userptr_repin *repin,
+						 u32 timeout_ms)
+{
+	unsigned long now = jiffies;
+
+	repin->last = now ?: 1;
+	return !timeout_ms ||
+	       time_before(now, repin->start + msecs_to_jiffies(timeout_ms));
+}
+
 /** struct xe_userptr_vm - User pointer VM level state */
 struct xe_userptr_vm {
 	/**
@@ -92,6 +139,12 @@ struct xe_userptr {
 	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
 	 */
 	bool initial_bind;
+	/**
+	 * @repin: Timeout state for an in-progress repin retry sequence.
+	 * Protected by vm->lock in write mode, or in read mode together with
+	 * the vma's fault_lock.
+	 */
+	struct xe_userptr_repin repin;
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ff8d355728fc..0c5121361f8e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
+#include <linux/sched/signal.h>
 #include <linux/swap.h>
 
 #include <generated/xe_wa_oob.h>
@@ -2782,14 +2783,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 
 		if (xe_vma_is_userptr(vma)) {
 			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-			/*
-			 * -EBUSY has dedicated meaning that a user fence
-			 * attached to the VMA is busy, in practice
-			 * xe_vma_userptr_pin_pages can only fail with -EBUSY if
-			 * we are low on memory so convert this to -ENOMEM.
-			 */
-			if (err == -EBUSY)
-				err = -ENOMEM;
 		}
 	}
 	if (err) {
@@ -4085,11 +4078,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuva_ops **ops = NULL;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q = NULL;
-	u32 num_syncs, num_ufence = 0;
+	u32 num_syncs, num_ufence;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops = { .flags = 0, };
+	struct xe_userptr_repin repin = {};
 	struct dma_fence *fence;
+	bool repin_again;
 	int err;
 	int i;
 
@@ -4122,6 +4117,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	/* Ensure all UNMAPs visible */
 	xe_svm_flush(vm);
 
+retry:
+	repin_again = false;
+	num_ufence = 0;
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_exec_queue;
@@ -4225,6 +4223,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	if (args->num_binds > 1)
 		vops.flags |= XE_VMA_OPS_ARRAY_OF_BINDS;
+	xe_userptr_repin_begin(&repin);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -4240,12 +4239,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
+			repin_again = err == -EAGAIN;
 			goto unwind_ops;
 		}
 
 		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
-		if (err)
+		if (err) {
+			repin_again = err == -EAGAIN;
 			goto unwind_ops;
+		}
 
 #ifdef TEST_VM_OPS_ERROR
 		if (flags & FORCE_OP_ERROR) {
@@ -4308,6 +4310,27 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		up_read(&vm->lock);
 	else
 		up_write(&vm->lock);
+	if (repin_again) {
+		/*
+		 * A userptr repin keeps failing due to concurrent CPU mapping
+		 * changes. New vmas are created on every attempt so the overall
+		 * timeout is tracked here. Retry with all locks dropped.
+		 */
+		u32 timeout_ms = READ_ONCE(vm->xe->userptr_repin_timeout_ms);
+
+		if (xe_userptr_repin_should_retry(&repin, timeout_ms)) {
+			bos = NULL;
+			ops = NULL;
+			syncs = NULL;
+			vops.flags = 0;
+			cond_resched();
+			if (!signal_pending(current))
+				goto retry;
+			err = -ERESTARTSYS;
+		} else {
+			err = -EBUSY;
+		}
+	}
 put_exec_queue:
 	if (q)
 		xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 31245c6c96d4..4bb544ee168b 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -6,6 +6,7 @@
 #include "xe_vm_madvise.h"
 
 #include <linux/nospec.h>
+#include <linux/sched/signal.h>
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
@@ -13,6 +14,7 @@
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_tlb_inval.h"
+#include "xe_userptr.h"
 #include "xe_vm.h"
 
 struct xe_vmas_in_madvise_range {
@@ -592,11 +594,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		.addr = xe_device_uncanonicalize_addr(xe, args->start),
 		.range = args->range,
 	};
+	struct xe_userptr_repin repin = {};
 	struct xe_madvise_details details;
 	u16 pat_index, coh_mode;
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
+	bool repin_again;
 	bool do_retained;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -629,6 +633,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 	xe_svm_flush(vm);
 
+retry:
+	repin_again = false;
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
@@ -642,9 +648,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err)
 		goto unlock_vm;
 
+	xe_userptr_repin_begin(&repin);
 	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
-	if (err)
+	if (err) {
+		repin_again = err == -EAGAIN;
 		goto madv_fini;
+	}
 
 	err = get_vmas(vm, &madvise_range);
 	if (err || !madvise_range.num_vmas)
@@ -730,6 +739,18 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_madvise_details_fini(&details);
 unlock_vm:
 	up_write(&vm->lock);
+	if (repin_again) {
+		u32 timeout_ms = READ_ONCE(xe->userptr_repin_timeout_ms);
+
+		if (xe_userptr_repin_should_retry(&repin, timeout_ms)) {
+			cond_resched();
+			if (!signal_pending(current))
+				goto retry;
+			err = -ERESTARTSYS;
+		} else {
+			err = -EBUSY;
+		}
+	}
 
 	/* Write retained value to user after releasing all locks */
 	if (!err && do_retained)

-- 
2.56.1

