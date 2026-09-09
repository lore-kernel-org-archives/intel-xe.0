Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69450C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1605410F116;
	Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfdqnxiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C8D10F104
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957728; x=1820493728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H9YVGO0jwwU9pc4hW3+0F8Rz7Au3SUkkmB1gsNNN4Ks=;
 b=KfdqnxiZkIzQ6LkAwErLdbLo5lngLclcrDpTDQVEeJ0aHcSIqNJfagkP
 dBP/6oHLuQwZOvFOX4ZzJKAIexT1A7H+0NnCnxjX04YJydR8XAGkfiw1/
 ocJdq46D37MGHUkIz+/vUL5xv6GkoZfBtcqqGBjbDEQIkUmqSphLQEU2y
 qotXdRaOpBkS/cwsvo4D4zkKSYVgc3wlEJV9HH473H/mFssAfLbjBhQtt
 D+H9c/iheMSwwljyEu9lwqG9exvydbJUhnHPIsTmdY5zzp5+jxamfgDly
 Xlk0wBM9UkN3cj4NkLP4v9e6iV+9vzmtdsdwQhnOQ8x/sa5DW4wZy7Kwd A==;
X-CSE-ConnectionGUID: Wrzda/1bQjqugLPBjffwOg==
X-CSE-MsgGUID: 6ssrFKJuSSqbfgCcHnymFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715558"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:08 -0700
X-CSE-ConnectionGUID: t+Ga16h8QpOC40VXPYeJvA==
X-CSE-MsgGUID: ScSazPwQTla94TfRHZ71dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246641"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 12/21] drm/xe: Service all VMAs in an access counter
 granularity window
Date: Wed,  9 Sep 2026 18:15:06 +0530
Message-ID: <20260909124457.1610890-35-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

An access counter notification covers a VA window (64K–64M) that may
span multiple VMAs, but only the first was ever serviced. Introduce a
cursor-based continuation: after each VMA, advance page_va and store
the updated state in acw->pending, re-queuing on pf_wq so page-fault
handlers can interleave. Also add xe_access_counter_granularity enum
and a helper to decode the hardware granularity field.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c       | 172 +++++++++++++++----
 drivers/gpu/drm/xe/xe_access_counter_types.h |  48 +++++-
 2 files changed, 183 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index c386b3585b20..1aff8b710862 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_engine.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_usm_queue.h"
 #include "xe_vm.h"
@@ -29,9 +30,18 @@
  * notifications and a multi-threaded worker to process them. Multiple producers
  * are supported, with a single shared consumer.
  *
+ * Each access counter notification covers a VA window of size determined by the
+ * hardware granularity field (64K / 2M / 16M / 64M). That window may span
+ * multiple VMAs or SVM ranges. To avoid starving higher-priority page-fault
+ * handlers that share the same workqueue, the consumer services **one** VMA or
+ * SVM range per work-item invocation.  When additional VMAs remain within the
+ * granularity window, a continuation event (with the VA cursor advanced past the
+ * just-serviced VMA) is pushed back into the access counter queue and a new
+ * work item is scheduled. Page-fault work items sharing @pagefault_wq may therefore
+ * jump the queue between consecutive access counter events for the same window.
+ *
  * xe_access_counter.c implements the consumer layer.
  */
-
 static void xe_access_counter_print(struct xe_access_counter *ac)
 {
 	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
@@ -52,44 +62,28 @@ static void xe_access_counter_print(struct xe_access_counter *ac)
 		  ac->consumer.engine_instance);
 }
 
-static int xe_access_counter_service(struct xe_access_counter *ac)
+static int xe_access_counter_vma_setup(struct xe_vm *vm, struct xe_vma *vma,
+				       struct xe_gt *gt)
 {
-	struct xe_gt *gt = ac->gt;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	struct xe_vm *vm;
-	struct xe_vma *vma;
 	int err = 0;
 
-	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.asid);
-	if (IS_ERR(vm))
-		return PTR_ERR(vm);
-
-	down_write(&vm->lock);
-
-	if (xe_vm_is_closed(vm)) {
-		err = -ENOENT;
-		goto unlock_vm;
-	}
-	/* Lookup VMA */
-	vma = xe_vm_find_overlapping_vma(vm, ac->consumer.page_va, SZ_4K);
-	if (!vma) {
-		err = -EINVAL;
-		goto unlock_vm;
-	}
-
-	trace_xe_vma_acc(vma, ac->consumer.counter_type);
-
-	/* TODO: Handle svm vma's  */
+	/*TODO : Handle userptr move to vram */
 	if (xe_vma_has_no_bo(vma))
-		goto unlock_vm;
+		return 0;
+
+	/*
+	 * ac_move_fence is also read/cleared by the page-fault handler under
+	 * fault_lock; serialize against it since vm->lock is held in read mode.
+	 */
+	guard(mutex)(&vma->fault_lock);
 
 	/* Drop duplicate event if migration/rebind is already in-flight */
 	if (vma->ac_move_fence && !dma_fence_is_signaled(vma->ac_move_fence))
-		goto unlock_vm;
+		return 0;
 
 	/* Previous migration completed; release its fence before starting a new one */
 	dma_fence_put(vma->ac_move_fence);
@@ -121,8 +115,106 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 
 	xe_validation_ctx_fini(&ctx);
 
+	return err;
+}
+
+static int xe_access_counter_service(struct xe_access_counter *ac)
+{
+	struct xe_gt *gt = ac->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_vm *vm;
+	struct xe_vma *vma;
+	u64 page_va;
+	u64 gran_end;
+	u64 hint_va;
+	int err = 0;
+
+	if (!ac->gran_end || ac->gran_end <= ac->consumer.page_va)
+		return -EINVAL;
+
+	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	down_read(&vm->lock);
+
+	if (xe_vm_is_closed(vm)) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	page_va = ac->consumer.page_va;
+	gran_end = ac->gran_end;
+
+	/*
+	 * Find the first VMA that overlaps the remaining portion of the
+	 * granularity window [page_va, gran_end). drm_gpuva_find_first()
+	 * skips any unmapped holes and returns the next mapped VMA.
+	 * We service exactly one VMA (BO) or one SVM range (cpu_addr_mirror)
+	 * per invocation to allow higher-priority page-fault handlers sharing
+	 * pagefault_wq to interleave.
+	 */
+	vma = xe_vm_find_overlapping_vma(vm, page_va, gran_end - page_va);
+	if (!vma) {
+		/*
+		 * No VMA in [page_va, gran_end) — either the entire original
+		 * window is unmapped, or all remaining bytes are a trailing
+		 * hole after the last serviced VMA.  Access counter notifications
+		 * are advisory; advance the cursor to gran_end so the caller
+		 * sees the window as exhausted and skips any further continuation.
+		 */
+		ac->consumer.page_va = gran_end;
+		goto unlock_vm;
+	}
+
+	/*
+	 * The found VMA may start *after* page_va — there is a leading hole
+	 * in the window at [page_va, xe_vma_start(vma)).  Clamp the hint
+	 * address to the VMA's actual start so the setup functions receive a
+	 * VA that is valid within the VMA.
+	 */
+	hint_va = max(page_va, xe_vma_start(vma));
+
+	trace_xe_vma_acc(vma, ac->consumer.counter_type);
+
+	if (xe_vma_is_cpu_addr_mirror(vma)) {
+		struct xe_svm_range *range;
+
+		/*
+		 * Find the first existing SVM range in [hint_va, gran_end).
+		 * We use range_find (not find_or_insert) because AC events are
+		 * fired only after the GPU has already accessed a region; an SVM
+		 * range must already exist.  Holes and unaccessed addresses are
+		 * skipped automatically by the interval tree walk.
+		 *
+		 * If no range exists, the window is exhausted — advance to
+		 * gran_end so no continuation is stored.
+		 */
+		range = xe_svm_range_find_first(vm, hint_va, min(xe_vma_end(vma), gran_end));
+		if (!range) {
+			ac->consumer.page_va = min(xe_vma_end(vma), gran_end);
+			goto unlock_vm;
+		}
+
+		err = xe_svm_range_setup(vm, vma, NULL, gt, xe_svm_range_start(range),
+					 (struct xe_svm_range_setup_flags) {
+						.atomic = false,
+						.acc_ctr_trigger = true,
+					});
+
+		if (!err)
+			ac->consumer.page_va = min_t(u64,
+						     xe_svm_range_end(range),
+						     gran_end);
+		xe_svm_range_put(range);
+	} else {
+		err = xe_access_counter_vma_setup(vm, vma, gt);
+		if (!err)
+			ac->consumer.page_va = min(xe_vma_end(vma), gran_end);
+	}
+
 unlock_vm:
-	up_write(&vm->lock);
+	up_read(&vm->lock);
 	xe_vm_put(vm);
 
 	return err;
@@ -133,25 +225,35 @@ static void xe_access_counter_queue_work_func(struct work_struct *w)
 	struct xe_ac_worker *acw = container_of(w, struct xe_ac_worker, work);
 	struct xe_device *xe = acw->xe;
 	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
-	struct xe_access_counter ac = {};
+	struct xe_access_counter ac;
+
+	if (acw->pending.gran_end) {
+		if (acw->pending.consumer.page_va < acw->pending.gran_end) {
+			ac = acw->pending;
+			memset(&acw->pending, 0, sizeof(acw->pending));
+			goto service;
+		}
+		memset(&acw->pending, 0, sizeof(acw->pending));
+	}
 
 	if (!xe_usm_queue_pop(ac_queue, &ac))
 		return;
 
-	if (ac.gt) {	/* Skip if access counter was squashed during reset */
+service:
+	if (ac.gt) {
 		int err = xe_access_counter_service(&ac);
 
 		if (err) {
 			xe_access_counter_print(&ac);
 			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
 				  ERR_PTR(err));
+		} else if (ac.consumer.page_va < ac.gran_end) {
+			acw->pending = ac;
+			queue_work(xe->usm.pagefault_wq, w);
+			return;
 		}
 	}
 
-	/*
-	 * Service at most one event per invocation so page-fault work items
-	 * sharing pf_wq can jump the queue between access counter events.
-	 */
 	if (xe_usm_queue_peek(ac_queue))
 		queue_work(xe->usm.pagefault_wq, w);
 }
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
index deecd25b990a..7cdcdae4e357 100644
--- a/drivers/gpu/drm/xe/xe_access_counter_types.h
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -22,12 +22,31 @@ enum xe_access_counter_type {
 	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
 };
 
+/**
+ * enum xe_access_counter_granularity - Granularity of an AC notification
+ *
+ * Encodes the size of the hot virtual-address window reported by the hardware.
+ * The window starts at &xe_access_counter.consumer.page_va and extends for
+ * the corresponding number of bytes.
+ */
+enum xe_access_counter_granularity {
+	/** @XE_ACCESS_COUNTER_GRANULARITY_128K: 128 KiB window */
+	XE_ACCESS_COUNTER_GRANULARITY_128K = 0,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_2M: 2 MiB window */
+	XE_ACCESS_COUNTER_GRANULARITY_2M   = 1,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_16M: 16 MiB window */
+	XE_ACCESS_COUNTER_GRANULARITY_16M  = 2,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_64M: 64 MiB window */
+	XE_ACCESS_COUNTER_GRANULARITY_64M  = 3,
+};
+
 /**
  * struct xe_access_counter - Xe access counter
  *
  * Generic access counter structure for communication between producer and consumer.
- * Carefully sized to be 64 bytes. Upon a device access counter notification, the
- * producer populates this structure, and the consumer copies it into the access
+ * Sized to exactly 64 bytes (roundup_pow_of_two(sizeof(*this)) == 64) so each
+ * queue entry occupies one cache line. Upon a device access counter notification,
+ * the producer populates this structure, and the consumer copies it into the access
  * counter queue for deferred handling.
  */
 struct xe_access_counter {
@@ -68,6 +87,16 @@ struct xe_access_counter {
 		/** @consumer.reserved1: reserved bits */
 		u8 reserved1;
 	} consumer;
+	/**
+	 * @gran_end: end address (exclusive) of the hot VA window.
+	 *
+	 * Derived by the consumer on first receipt as
+	 * ``consumer.page_va + granularity_size``. Preserved across
+	 * re-queued continuation events so that @consumer.page_va can
+	 * advance through multiple VMAs without losing the original window
+	 * boundary.  Zero when populated by the producer.
+	 */
+	u64 gran_end;
 };
 
 /**
@@ -76,12 +105,27 @@ struct xe_access_counter {
  * Each worker pulls entries from the shared access counter queue
  * concurrently, eliminating head-of-queue blocking when one event
  * takes a long time to process.
+ *
+ * Multi-VMA granularity windows are handled iteratively: after servicing
+ * one VMA the worker stores the remaining window state in @pending and
+ * re-queues itself on pf_wq, allowing page-fault handlers to interleave.
+ * @pending is private to this worker — it is never pushed back into the
+ * shared queue — so it cannot be stolen by another ac_worker.
  */
 struct xe_ac_worker {
 	/** @xe: back-pointer to xe_device */
 	struct xe_device *xe;
 	/** @work: work item scheduled on the USM workqueue */
 	struct work_struct work;
+	/**
+	 * @pending: continuation event for the current granularity window.
+	 *
+	 * Non-zero @pending.gran_end means this worker has more VMAs to
+	 * service in an ongoing window.  Checked before popping from the
+	 * shared queue so the continuation cannot be stolen by peer workers.
+	 * Zeroed once the window is fully serviced or on error.
+	 */
+	struct xe_access_counter pending;
 };
 
 #endif
-- 
2.43.0

