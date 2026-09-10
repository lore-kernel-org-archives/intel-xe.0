Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F37C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA88710F497;
	Thu, 10 Sep 2026 11:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8SVQ4Wo";
	dkim-atps=neutral
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 11:47:58 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9479710E5F8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789040878; x=1820576878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOu3qSdSca/EMKyx9V6AruuY6x9RIXQfK1Z07BYW8D4=;
 b=K8SVQ4WoSPMauQXQD6ARNVip7RP0va3d1eb18vNxchE8oWpomepcMqXH
 TbF0Vzh7BaCbPwwrN1Vb+BV75dIYx8G2SmDsQEL0KcvwOOPHEeDfR9dk+
 rtvdZ6kCzjH6xDXT9giOb59bjpkTnK+ttMNqcCO+WG89ubTeF+oN6PCdC
 pRnrWqxxamA2QMH1w+7S8Ofk5t8Ah1rfHuI7xYolzvv5iiqUe7Ozpa3Gy
 /eeiD16hmfwE46GelWpERdTIg+Z8U0s/0SnUSq4+e9tw7W3uKSFmJQGgF
 6nYuGAo7q0732Iu8OSgcEniOKnTDqYCavuGeDHD76xr7BWmzY7KRkMOtM g==;
X-CSE-ConnectionGUID: LXa/S1UqQLWpHBURpNoPUQ==
X-CSE-MsgGUID: nTmH7VwcSnaLoJykc8npgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="8035"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="8035"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:40:52 -0700
X-CSE-ConnectionGUID: Yf4D1rhuSMGiFKvAgHhs0A==
X-CSE-MsgGUID: 0IhjCeq6Qyu5qtnU2b0BZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295099746"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 04:40:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4] [CI-ONLY][DONOT-REVIEW] Access counter squash
Date: Thu, 10 Sep 2026 17:13:30 +0530
Message-ID: <20260910114407.1801795-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
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

---
 drivers/gpu/drm/xe/Makefile                  |   4 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h        |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h      |  10 +
 drivers/gpu/drm/xe/xe_access_counter.c       | 366 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       |  17 +
 drivers/gpu/drm/xe/xe_access_counter_types.h | 143 ++++++++
 drivers/gpu/drm/xe/xe_device.c               |  30 ++
 drivers/gpu/drm/xe/xe_device.h               |   1 +
 drivers/gpu/drm/xe/xe_device_types.h         |  12 +
 drivers/gpu/drm/xe/xe_exec_queue.c           |  35 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   9 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_access_counter.c   |  74 ++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h   |  15 +
 drivers/gpu/drm/xe/xe_guc_ct.c               |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                  |  35 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |   5 +-
 drivers/gpu/drm/xe/xe_pagefault.c            |  78 +---
 drivers/gpu/drm/xe/xe_pt.c                   |  21 ++
 drivers/gpu/drm/xe/xe_svm.c                  | 197 ++++++++--
 drivers/gpu/drm/xe/xe_svm.h                  |  49 +++
 drivers/gpu/drm/xe/xe_trace_bo.h             |  32 +-
 drivers/gpu/drm/xe/xe_usm_queue.h            | 127 +++++++
 drivers/gpu/drm/xe/xe_vm.c                   | 130 ++++++-
 drivers/gpu/drm/xe/xe_vm.h                   |   6 +
 drivers/gpu/drm/xe/xe_vm_types.h             |  11 +
 include/uapi/drm/xe_drm.h                    | 205 +++++++++++
 28 files changed, 1505 insertions(+), 115 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index adc2de37e768..ad1acc67ee0b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -32,7 +32,8 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 
 # core driver code
 
-xe-y += xe_bb.o \
+xe-y += xe_access_counter.o \
+	xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_dep_scheduler.o \
@@ -73,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
+	xe_guc_access_counter.o \
 	xe_guc_pagefault.o \
 	xe_guc_pc.o \
 	xe_guc_rc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index d6bc19ef277b..1286ef346504 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -30,6 +30,7 @@
 #define XE_PDE_IPS_64K			BIT_ULL(11)
 
 #define XE_GGTT_PTE_DM			BIT_ULL(1)
+#define XE_PPGTT_PTE_NC			BIT_ULL(5)
 #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
 #define XE_PPGTT_PTE_DM			BIT_ULL(11)
 #define XE_PDE_64K			BIT_ULL(6)
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 6f7abc0181b5..c32e47e87f88 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -45,4 +45,14 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+/* Fields for CTX_ACC_CTR_THOLD */
+#define ACC_TRIGGER_MASK		REG_GENMASK(15, 0)
+#define ACC_TRIGGER_VAL(x)		REG_FIELD_PREP(ACC_TRIGGER_MASK, x)
+#define ACC_NOTIFY_MASK			REG_GENMASK(31, 16)
+#define ACC_NOTIFY_VAL(x)		REG_FIELD_PREP(ACC_NOTIFY_MASK, x)
+
+/* Fields for CTX_ASID */
+#define ACC_GRANULARITY_MASK            REG_GENMASK(22, 20)
+#define ACC_GRANULARITY_VAL(x)          REG_FIELD_PREP(ACC_GRANULARITY_MASK, x)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
new file mode 100644
index 000000000000..ed1ed6091ac5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/circ_buf.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_managed.h>
+
+#include "xe_access_counter.h"
+#include "xe_access_counter_types.h"
+#include "xe_device.h"
+#include "xe_gt_printk.h"
+#include "xe_hw_engine.h"
+#include "xe_svm.h"
+#include "xe_trace_bo.h"
+#include "xe_usm_queue.h"
+#include "xe_vm.h"
+
+/**
+ * DOC: Xe access counters
+ *
+ * Xe access counters are handled in two layers with one-way communication.
+ * The producer layer interacts with hardware or firmware to receive and parse
+ * access counter notifications into struct xe_access_counter, then forwards them
+ * to the consumer. The consumer layer services the notifications (e.g., memory
+ * migration hints, binding decisions). No acknowledgment is sent back to the
+ * producer. The consumer uses an access counter queue sized to absorb all potential
+ * notifications and a multi-threaded worker to process them. Multiple producers
+ * are supported, with a single shared consumer.
+ *
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
+ * xe_access_counter.c implements the consumer layer.
+ */
+static void xe_access_counter_print(struct xe_access_counter *ac)
+{
+	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
+		  "\tVA: 0x%08x%08x\n"
+		  "\tCounter Type: %d\n"
+		  "\tGranularity: %d\n"
+		  "\tSub-Granularity: 0x%08x\n"
+		  "\tEngineClass: %d %s\n"
+		  "\tEngineInstance: %d\n",
+		  ac->consumer.asid,
+		  upper_32_bits(ac->consumer.page_va),
+		  lower_32_bits(ac->consumer.page_va),
+		  ac->consumer.counter_type,
+		  ac->consumer.granularity,
+		  ac->consumer.sub_granularity,
+		  ac->consumer.engine_class,
+		  xe_hw_engine_class_to_str(ac->consumer.engine_class),
+		  ac->consumer.engine_instance);
+}
+
+static int xe_access_counter_vma_setup(struct xe_vm *vm, struct xe_vma *vma,
+				       struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct dma_fence *fence = NULL;
+	int err = 0;
+
+	/*TODO : Handle userptr move to vram */
+	if (xe_vma_has_no_bo(vma))
+		return 0;
+
+	/*
+	 * ac_move_fence is also read/cleared by the page-fault handler under
+	 * fault_lock; serialize against it since vm->lock is held in read mode.
+	 */
+	guard(mutex)(&vma->fault_lock);
+
+	/* Drop duplicate event if migration/rebind is already in-flight */
+	if (vma->ac_move_fence && !dma_fence_is_signaled(vma->ac_move_fence))
+		return 0;
+
+	/* Previous migration completed; release its fence before starting a new one */
+	dma_fence_put(vma->ac_move_fence);
+	vma->ac_move_fence = NULL;
+
+	/*
+	 * Ignore duplicate locks: the eligibility check below needs the BO
+	 * resv held, so we lock the VMA explicitly and xe_vma_lock_and_validate()
+	 * then locks the same BO again.
+	 */
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
+			       (struct xe_val_flags) { .exec_ignore_duplicates = true });
+	drm_exec_until_all_locked(&exec) {
+		err = xe_vm_lock_vma(&exec, vma);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
+
+		if (!xe_vma_supports_access_ctr(vm->xe, vma, tile))
+			break;
+
+		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+		if (err)
+			break;
+
+		xe_vm_set_validation_exec(vm, &exec);
+		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+		xe_vm_set_validation_exec(vm, NULL);
+		if (IS_ERR(fence))
+			err = PTR_ERR(fence);
+	}
+
+	/*
+	 * Migrations and binds are pipelined GPU operations with no H2G ack;
+	 * store the fence on the VMA so the page-fault handler can wait on it
+	 * if needed, rather than blocking here under vm->lock.
+	 */
+	if (!err && fence && !IS_ERR(fence))
+		vma->ac_move_fence = fence;
+
+	xe_validation_ctx_fini(&ctx);
+
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
+	if (!IS_DGFX(xe)) {
+		/* Access counter migration hints target device VRAM only. */
+		ac->consumer.page_va = ac->gran_end;
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
+		if (!xe_vma_supports_access_ctr(xe, vma, gt_to_tile(gt))) {
+			ac->consumer.page_va = min(xe_vma_end(vma), gran_end);
+			goto unlock_vm;
+		}
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
+unlock_vm:
+	up_read(&vm->lock);
+	xe_vm_put(vm);
+
+	return err;
+}
+
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	struct xe_ac_worker *acw = container_of(w, struct xe_ac_worker, work);
+	struct xe_device *xe = acw->xe;
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
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
+
+	if (!xe_usm_queue_pop(ac_queue, &ac))
+		return;
+
+service:
+	if (ac.gt) {
+		int err = xe_access_counter_service(&ac);
+
+		if (err) {
+			xe_access_counter_print(&ac);
+			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
+				  ERR_PTR(err));
+		} else if (ac.consumer.page_va < ac.gran_end) {
+			acw->pending = ac;
+			queue_work(xe->usm.pagefault_wq, w);
+			return;
+		}
+	}
+
+	if (xe_usm_queue_peek(ac_queue))
+		queue_work(xe->usm.pagefault_wq, w);
+}
+
+static void xe_access_counter_queue_init(struct xe_device *xe,
+					 struct xe_usm_queue *ac_queue)
+{
+	int i;
+
+	for (i = 0; i < XE_ACCESS_COUNTER_WORKER_COUNT; i++) {
+		xe->usm.ac_workers[i].xe = xe;
+		INIT_WORK(&xe->usm.ac_workers[i].work, xe_access_counter_queue_work_func);
+	}
+}
+
+/**
+ * xe_access_counter_init - Initialize access counter consumer layer
+ * @xe: xe device
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_init(struct xe_device *xe)
+{
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	ac_queue->data_size = sizeof(struct xe_access_counter);
+	ac_queue->entry_size = roundup_pow_of_two(ac_queue->data_size);
+#define XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES	128
+	ac_queue->size = XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES *
+			 ac_queue->entry_size;
+#undef XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES
+
+	/*
+	 * drmm-managed so it outlives destroy_workqueue(pagefault_wq), which
+	 * drains the shared AC workers during xe_pagefault_fini.
+	 */
+	ac_queue->data = drmm_kzalloc(&xe->drm, ac_queue->size, GFP_KERNEL);
+	if (!ac_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&ac_queue->lock);
+	xe_access_counter_queue_init(xe, ac_queue);
+
+	return 0;
+}
+
+static int xe_access_counter_work_index(struct xe_device *xe)
+{
+	lockdep_assert_held(&xe->usm.ac_queue.lock);
+	return xe->usm.ac_workers_indx++ % XE_ACCESS_COUNTER_WORKER_COUNT;
+}
+
+/**
+ * xe_access_counter_handler - Handle an access counter notification
+ * @xe: xe device
+ * @ac: access counter notification
+ *
+ * Sink the access counter notification to a queue and queue a worker
+ * to service it.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
+{
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
+	int idx;
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&ac_queue->lock, flags);
+	idx = xe_access_counter_work_index(xe);
+	full = xe_usm_queue_full(ac_queue);
+	if (!full) {
+		xe_usm_queue_push(ac_queue, ac);
+		queue_work(xe->usm.pagefault_wq, &xe->usm.ac_workers[idx].work);
+	} else {
+		drm_warn(&xe->drm,
+			 "AccessCounter Queue full, shouldn't be possible\n");
+	}
+	spin_unlock_irqrestore(&ac_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_access_counter.h b/drivers/gpu/drm/xe/xe_access_counter.h
new file mode 100644
index 000000000000..b3a331687f13
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_H_
+#define _XE_ACCESS_COUNTER_H_
+
+struct xe_device;
+struct xe_gt;
+struct xe_access_counter;
+
+int xe_access_counter_init(struct xe_device *xe);
+
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
new file mode 100644
index 000000000000..955d63e2c204
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_TYPES_H_
+#define _XE_ACCESS_COUNTER_TYPES_H_
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+struct xe_device;
+struct xe_gt;
+struct xe_access_counter;
+
+/** enum xe_access_counter_type - Xe access counter type */
+enum xe_access_counter_type {
+	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
+	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
+	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
+	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
+};
+
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
+static inline u64 xe_access_counter_granularity_to_size(u8 granularity)
+{
+	switch (granularity) {
+	case XE_ACCESS_COUNTER_GRANULARITY_128K: return SZ_128K;
+	case XE_ACCESS_COUNTER_GRANULARITY_2M:   return SZ_2M;
+	case XE_ACCESS_COUNTER_GRANULARITY_16M:  return SZ_16M;
+	case XE_ACCESS_COUNTER_GRANULARITY_64M:  return SZ_64M;
+	default:
+		return SZ_128K;
+	}
+}
+
+/**
+ * struct xe_access_counter - Xe access counter
+ *
+ * Generic access counter structure for communication between producer and consumer.
+ * Sized to exactly 64 bytes (roundup_pow_of_two(sizeof(*this)) == 64) so each
+ * queue entry occupies one cache line. Upon a device access counter notification,
+ * the producer populates this structure, and the consumer copies it into the access
+ * counter queue for deferred handling.
+ */
+struct xe_access_counter {
+	/**
+	 * @gt: GT of access counter
+	 */
+	struct xe_gt *gt;
+	/**
+	 * @consumer: State for the software handling the access counter.
+	 * Populated by the producer and may be modified by the consumer to
+	 * communicate information back to the producer upon acknowledgment.
+	 */
+	struct {
+		/** @consumer.page_va: virtual address of page */
+		u64 page_va;
+		/** @consumer.sub_granularity: sub-granularity */
+		u32 sub_granularity;
+		/**
+		 * @consumer.counter_type: counter type, u8 rather than enum to
+		 * keep size compact
+		 */
+		u8 counter_type;
+		/**
+		 * @consumer.granularity: access granularity, u8 rather than enum
+		 * to keep size compact
+		 */
+		u8 granularity;
+		/** @consumer.reserved: reserved bits for alignment */
+		u8 reserved[2];
+		/** @consumer.asid: address space ID */
+		u32 asid;
+		/** @consumer.engine_class: engine class */
+		u8 engine_class;
+		/** @consumer.engine_instance: engine instance */
+		u8 engine_instance;
+		/** @consumer.vfid: VFID */
+		u8 vfid;
+		/** @consumer.reserved1: reserved bits */
+		u8 reserved1;
+	} consumer;
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
+};
+
+/**
+ * struct xe_ac_worker - Access counter worker context
+ *
+ * Each worker pulls entries from the shared access counter queue
+ * concurrently, eliminating head-of-queue blocking when one event
+ * takes a long time to process.
+ *
+ * Multi-VMA granularity windows are handled iteratively: after servicing
+ * one VMA the worker stores the remaining window state in @pending and
+ * re-queues itself on pf_wq, allowing page-fault handlers to interleave.
+ * @pending is private to this worker — it is never pushed back into the
+ * shared queue — so it cannot be stolen by another ac_worker.
+ */
+struct xe_ac_worker {
+	/** @xe: back-pointer to xe_device */
+	struct xe_device *xe;
+	/** @work: work item scheduled on the USM workqueue */
+	struct work_struct work;
+	/**
+	 * @pending: continuation event for the current granularity window.
+	 *
+	 * Non-zero @pending.gran_end means this worker has more VMAs to
+	 * service in an ongoing window.  Checked before popping from the
+	 * shared queue so the continuation cannot be stolen by peer workers.
+	 * Zeroed once the window is fully serviced or on error.
+	 */
+	struct xe_access_counter pending;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..0bab46f0e4e0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -23,6 +23,7 @@
 #include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_access_counter.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_configfs.h"
@@ -997,6 +998,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_access_counter_init(xe);
+	if (err)
+		return err;
+
 	if (xe->tiles->media_gt &&
 	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
 		XE_DEVICE_WA_DISABLE(xe, 15015404425);
@@ -1501,3 +1506,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	return vm;
 }
+
+/**
+ * xe_device_asid_to_fault_vm() - Find FAULT VM from ASID
+ * @xe: the &xe_device
+ * @asid: Address space ID
+ *
+ * Find a FAULTING VM from ASID and take a reference to VM which
+ * caller must drop. Reclaim safe.
+ *
+ * Return: VM on success, ERR_PTR on failure
+ */
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid)
+{
+	struct xe_vm *vm;
+
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, asid);
+	if (vm && xe_vm_in_fault_mode(vm))
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	return vm;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6d3d6d5eba29..42ddd4a21b48 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -273,6 +273,7 @@ int xe_is_injection_active(void);
 bool xe_is_xe_file(const struct file *file);
 
 struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
 
 #ifdef CONFIG_PCI_IOV
 bool xe_device_is_admin_only(const struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f88bacf63c83..3d0e3cc54878 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -29,6 +30,7 @@
 #include "xe_survivability_mode_types.h"
 #include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
+#include "xe_usm_queue.h"
 #include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -336,6 +338,16 @@ struct xe_device {
 		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_MAX];
 		/** @usm.pf_queue: Page fault queue */
 		struct xe_pagefault_queue pf_queue;
+		/**
+		 * @usm.ac_workers_indx: Round-robin index selecting the
+		 * next access-counter worker to wake.
+		 */
+		u32 ac_workers_indx;
+#define XE_ACCESS_COUNTER_WORKER_COUNT	4
+		/** @usm.ac_workers: Access counter workers */
+		struct xe_ac_worker ac_workers[XE_ACCESS_COUNTER_WORKER_COUNT];
+		/** @usm.ac_queue: Access counter queue */
+		struct xe_usm_queue ac_queue;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.dpagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e63559a2f582..390288e09b40 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -436,7 +436,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+			lrc = xe_lrc_create(q, q->hwe, q->vm, q->replay_state,
 					    xe_lrc_ring_size(), q->msix_vec, flags);
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
@@ -1153,6 +1153,38 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
 	return 0;
 }
 
+static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
+					     struct xe_exec_queue *q,
+					     u64 extension, u64 *properties)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_exec_queue_set_acc_param ext;
+	int err;
+
+	if (!xe->info.has_access_counter)
+		return -EINVAL;
+
+	err = copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.granularity > DRM_XE_ACCESS_COUNTER_GRANULARITY_64M))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.notify > ext.trigger))
+		return -EINVAL;
+
+	/* Store access counter parameters in exec queue */
+	q->acc.trigger = ext.trigger;
+	q->acc.notify = ext.notify;
+	q->acc.granularity = ext.granularity;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
 					    u64 extension, u64 *properties)
@@ -1199,6 +1231,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
 };
 
 #define MAX_USER_EXTENSIONS	16
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 836f88fc0faa..c5777689eead 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -265,6 +265,15 @@ struct xe_exec_queue {
 
 	/** @replay_state: GPU hang replay state */
 	void *replay_state;
+	/** @acc: Access counter parameters */
+	struct {
+		/** @acc.trigger: Access counter trigger threshold */
+		u16 trigger;
+		/** @acc.notify: Access counter notify threshold */
+		u16 notify;
+		/** @acc.granularity: Access counter granularity */
+		u8 granularity;
+	} acc;
 
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a36db39dcda8..14d5f90e234d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -259,7 +259,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm/xe/xe_guc_access_counter.c
new file mode 100644
index 000000000000..7e9b835e1ed6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_guc_access_counter.h"
+
+#include "xe_access_counter.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_guc.h"
+#include "xe_guc_fwif.h"
+#include "xe_guc_submit.h"
+#include "xe_printk.h"
+
+static u64 xe_guc_access_counter_page_va(struct xe_device *xe, u64 addr, u8 gran)
+{
+	u64 gran_size = xe_access_counter_granularity_to_size(gran);
+	u64 sub_gran_size = gran_size / 32;
+	u64 region_base = ALIGN_DOWN(addr, gran_size);
+	u64 offset_in_subchunk = addr & (sub_gran_size - 1);
+	u64 page_va = region_base + offset_in_subchunk;
+
+	xe_dbg(xe, "gran_size = %llx, addr = = %llx, region_base = %llx, page_va=%llx\n",
+	       gran_size, addr, region_base, page_va);
+	return page_va;
+}
+
+/**
+ * xe_guc_access_counter_handler() - G2H access counter handler
+ * @guc: GuC object
+ * @msg: G2H message
+ * @len: Length of G2H message
+ *
+ * Parse GuC to host (G2H) message into a struct xe_access_counter and forward
+ * onto the Xe access counter layer.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_access_counter ac = {};
+	struct xe_device *xe = guc_to_xe(guc);
+	u64 addr;
+#define GUC_ACC_MSG_LEN_DW	\
+	(sizeof(struct xe_guc_acc_desc) / sizeof(u32))
+
+	if (len != GUC_ACC_MSG_LEN_DW)
+		return -EPROTO;
+
+	ac.gt = guc_to_gt(guc);
+
+	/* Parse access counter descriptor */
+	ac.consumer.granularity = FIELD_GET(ACC_GRANULARITY, msg[2]);
+	ac.consumer.sub_granularity = FIELD_GET(ACC_SUBG_HI, msg[1]) << ACC_SUBG_LO_WIDTH |
+				      FIELD_GET(ACC_SUBG_LO, msg[0]);
+	ac.consumer.counter_type = FIELD_GET(ACC_TYPE, msg[0]);
+	if (ac.consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
+		return -EINVAL;
+
+	addr = ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
+		(msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
+	ac.consumer.page_va = xe_guc_access_counter_page_va(xe, addr, ac.consumer.granularity);
+	ac.gran_end = ac.consumer.page_va +
+		      xe_access_counter_granularity_to_size(ac.consumer.granularity);
+	ac.consumer.asid = FIELD_GET(ACC_ASID, msg[1]);
+	ac.consumer.engine_class = FIELD_GET(ACC_ENG_CLASS, msg[1]);
+	ac.consumer.engine_instance = FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
+	ac.consumer.vfid = FIELD_GET(ACC_VFID, msg[2]);
+#undef GUC_ACC_MSG_LEN_DW
+
+	return xe_access_counter_handler(xe, &ac);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.h b/drivers/gpu/drm/xe/xe_guc_access_counter.h
new file mode 100644
index 000000000000..1ac8e76398d2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_ACCESS_COUNTER_H_
+#define _XE_GUC_ACCESS_COUNTER_H_
+
+#include <linux/types.h>
+
+struct xe_guc;
+
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..3068cbbff8c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,6 +26,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
+#include "xe_guc_access_counter.h"
 #include "xe_guc_pagefault.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -1753,6 +1754,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
+		ret = xe_guc_access_counter_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 971b850f2136..a2a77b252d3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -299,6 +299,7 @@ struct xe_guc_acc_desc {
 #define ACC_TRIGGER	0
 #define ACC_NOTIFY	1
 #define ACC_SUBG_LO	GENMASK(31, 1)
+#define ACC_SUBG_LO_WIDTH 31
 
 	u32 dw1;
 #define ACC_SUBG_HI	BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f1cf1463f1b2..991a17f283de 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1516,8 +1516,10 @@ static void xe_lrc_set_gpgpu_preemption_level(struct xe_lrc *lrc, struct xe_gt *
 	xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
 }
 
-static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
-			   void *replay_state, u16 msix_vec, u32 init_flags)
+static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+			   struct xe_hw_engine *hwe, struct xe_vm *vm,
+			   void *replay_state,
+			   u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -1616,8 +1618,20 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
 	}
 
-	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
+	if (xe->info.has_asid && vm) {
+		u32 asid;
+
+		if (q)
+			asid = vm->usm.asid | ACC_GRANULARITY_VAL(q->acc.granularity);
+		else
+			asid = vm->usm.asid;
+		xe_lrc_write_ctx_reg(lrc, CTX_ASID, asid);
+	}
+
+	if (q && xe->info.has_access_counter && vm)
+		xe_lrc_write_ctx_reg(lrc, CTX_ACC_CTR_THOLD,
+				     ACC_NOTIFY_VAL(q->acc.notify) |
+				     ACC_TRIGGER_VAL(q->acc.trigger));
 
 	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER)
 		xe_lrc_set_gpgpu_preemption_level(lrc, gt);
@@ -1662,7 +1676,8 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	return err;
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+		       struct xe_hw_engine *hwe, struct xe_vm *vm,
 		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1718,7 +1733,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+	err = xe_lrc_ctx_init(lrc, q, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
@@ -1734,6 +1749,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 
 /**
  * xe_lrc_create - Create a LRC
+ * @q: Exec queue (can be NULL for kernel queues)
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @replay_state: GPU hang replay state
@@ -1746,8 +1762,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
  * Return pointer to created LRC upon success and an error pointer
  * upon failure.
  */
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state, u32 ring_size,
+			     u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1756,7 +1773,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, q, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a8ff4e59a1f4..006b3628f360 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -61,8 +61,9 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
 #define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
 
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state,
+			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index c82b8bc8bc70..58ad38aeb75c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -114,37 +114,6 @@ static int xe_pagefault_entry_size(void)
 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
 }
 
-static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
-			      struct xe_vram_region *vram, bool need_vram_move)
-{
-	struct xe_bo *bo = xe_vma_bo(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int err;
-
-	err = xe_vm_lock_vma(exec, vma);
-	if (err)
-		return err;
-
-	if (!bo)
-		return 0;
-
-	/*
-	 * Skip validate/migrate for DONTNEED/purged BOs - repopulating
-	 * their pages would prevent the shrinker from reclaiming them.
-	 * For non-scratch VMs there is no safe fallback so fail the fault.
-	 * For scratch VMs let xe_vma_rebind() run normally; it will install
-	 * scratch PTEs so the GPU gets safe zero reads instead of faulting.
-	 */
-	if (unlikely(xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo))) {
-		if (!xe_vm_has_scratch(vm))
-			return -EACCES;
-		return 0;
-	}
-
-	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
-		xe_bo_validate(bo, vm, true, exec);
-}
-
 static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 				   struct xe_pagefault *pf, bool atomic)
 {
@@ -168,6 +137,15 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	trace_xe_vma_pagefault(vma);
 
 	guard(mutex)(&vma->fault_lock);
+	/*
+	 * If an access-counter triggered migration is in-flight, wait for it
+	 * to complete before checking whether the GPU mapping is already valid.
+	 */
+	if (vma->ac_move_fence) {
+		dma_fence_wait(vma->ac_move_fence, false);
+		dma_fence_put(vma->ac_move_fence);
+		vma->ac_move_fence = NULL;
+	}
 
 	/* Check if VMA is valid, opportunistic check only */
 	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
@@ -191,8 +169,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
 				       (struct xe_val_flags) {});
 		drm_exec_until_all_locked(&exec) {
-			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
-						 needs_vram == 1);
+			err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram,
+						       needs_vram == 1);
 			drm_exec_retry_on_contention(&exec);
 			xe_validation_retry_on_oom(&ctx, &err);
 			if (err)
@@ -230,21 +208,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
 	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
-static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
-{
-	struct xe_vm *vm;
-
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, asid);
-	if (vm && xe_vm_in_fault_mode(vm))
-		xe_vm_get(vm);
-	else
-		vm = ERR_PTR(-EINVAL);
-	up_read(&xe->usm.lock);
-
-	return vm;
-}
-
 static int xe_pagefault_service(struct xe_pagefault *pf)
 {
 	struct xe_gt *gt = pf->gt;
@@ -259,7 +222,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
-	vm = xe_pagefault_asid_to_vm(xe, asid);
+	vm = xe_device_asid_to_fault_vm(xe, asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -576,26 +539,13 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
 {
 	struct xe_vm *vm;
+	u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
 
-	/*
-	 * Pagefault may be asociated to VM that is not in fault mode.
-	 * Perform asid_to_vm behavior, except if VM is not in fault
-	 * mode, return VM anyways.
-	 */
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm,
-		     FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id));
-	if (vm)
-		xe_vm_get(vm);
-	else
-		vm = ERR_PTR(-EINVAL);
-	up_read(&xe->usm.lock);
-
+	vm = xe_device_asid_to_vm(xe, asid);
 	if (IS_ERR(vm))
 		return;
 
 	xe_vm_add_fault_entry_pf(vm, pf);
-
 	xe_vm_put(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7fb2fe1f826c..5dee40d82ee1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -862,6 +862,27 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
+	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
+	if (range) {
+		/*
+		 * Always set NC (no-count) on VRAM PTEs for SVM ranges so
+		 * this GPU does not generate access counter events for memory
+		 * it is already responsible for.  Today default_vram_pte
+		 * covers only local VRAM; once UAL lands, remote-device VRAM
+		 * pages will also flow through default_vram_pte — NC remains
+		 * the right setting there too, as the owning device handles
+		 * AC for its own local memory.  Update this comment when UAL
+		 * support is added and adjust if the semantics change.
+		 */
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		if (!xe_svm_range_allowed_in_devmem(range))
+			xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = (bo && !is_purged) ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6c3033fc4db7..2aafeedf0514 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -31,6 +31,41 @@
 #define XE_PEER_PAGEMAP ((void *)0ul)
 #define XE_PEER_VM ((void *)1ul)
 
+/**
+ * DOC: SVM access counter migration policy
+ *
+ * Access counters are a hardware mechanism that tracks how frequently the GPU
+ * accesses memory regions.  When counters become hot, the kernel driver can
+ * migrate memory to device-local VRAM for better performance.  The policy
+ * governing when and where AC-triggered migration happens is as follows:
+ *
+ * 1. Explicit preferred location (set via madvise DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC):
+ *
+ *    - If the preferred location resolves to a specific GPU tile, only that
+ *      tile's PTEs have the NC (no-count) bit clear, so only that GPU generates
+ *      AC events and triggers migration.  All other GPUs map the memory with
+ *      NC set and never generate AC events for it.
+ *    - If the preferred location is system memory (DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM),
+ *      all GPUs map with NC set — no AC-triggered migration occurs.
+ *
+ * 2. No explicit preference (default — DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE or unset):
+ *
+ *    First-touch-then-migrate-on-hot policy:
+ *    - The first GPU to fault the range migrates it to that GPU's local VRAM
+ *      (device-side first-touch placement).
+ *    - NC is left clear on all tiles, so any other GPU that subsequently
+ *      accesses the range keeps counting; once its access counter becomes
+ *      hot the range is migrated to that GPU's local VRAM.
+ *    - The GPU that fires the AC event wins placement.
+ *
+ * 3. Migrate only once hot (opt-in via DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER):
+ *
+ *    Like policy 2, but the eager first-touch migration is skipped: the range
+ *    stays where the CPU placed it on the initial GPU page fault and is
+ *    migrated to a GPU's local VRAM only once that GPU's access counter
+ *    reports it hot, avoiding unnecessary early migrations.
+ */
+
 /**
  * DOC: drm_pagemap reference-counting in xe:
  *
@@ -1265,9 +1300,10 @@ DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
 DECL_SVM_RANGE_US_STATS(bind, BIND)
 DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
 
-static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-				     struct xe_pagefault *pf, struct xe_gt *gt,
-				     u64 fault_addr, bool need_vram)
+static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+				struct xe_pagefault *pf, struct xe_gt *gt,
+				u64 fault_addr, bool need_vram,
+				bool acc_ctr_trigger)
 {
 	int devmem_possible = IS_DGFX(vm->xe) &&
 		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
@@ -1275,7 +1311,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = devmem_possible,
 		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
-		.devmem_only = need_vram && devmem_possible,
+		.devmem_only = (need_vram || acc_ctr_trigger) && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
@@ -1293,7 +1329,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
+	if (!acc_ctr_trigger)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Release old range */
@@ -1315,7 +1352,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	xe_svm_range_fault_count_stats_incr(gt, range);
+	if (!acc_ctr_trigger)
+		xe_svm_range_fault_count_stats_incr(gt, range);
 
 	mutex_lock(&range->lock);
 
@@ -1331,13 +1369,32 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
-		range_debug(range, "PAGE FAULT - VALID");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - VALID" :
+			    "PAGE FAULT - VALID");
 		goto out;
 	}
 
-	range_debug(range, "PAGE FAULT");
+	range_debug(range, acc_ctr_trigger ?
+		    "ACCESS COUNTER TRIGGERED" : "PAGE FAULT");
+
+	/*
+	 * AC-triggered setup: if the range is already in device memory a
+	 * rebind is all that's needed.  Otherwise proceed to the
+	 * migration path — with no explicit madvise preferred location, the
+	 * default first-touch-then-migrate-on-hot policy applies and we
+	 * should attempt VRAM placement for this hot range.
+	 */
+	if (acc_ctr_trigger && !range_flags.migrate_devmem)
+		goto out;
 
+	/*
+	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
+	 * counters: skip the eager migrate on a normal page fault, but still
+	 * migrate when this setup was itself triggered by an AC event.
+	 */
 	if (--migrate_try_count >= 0 &&
+	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_gt_stats_ktime_get();
 
@@ -1375,6 +1432,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
+	if (err == -EOPNOTSUPP)
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - EVICTED PAGES" :
+			    "PAGE FAULT - EVICTED PAGES");
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -1382,7 +1443,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			drm_dbg(&vm->xe->drm,
 				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			range_debug(range, acc_ctr_trigger ?
+				    "ACCESS COUNTER TRIGGERED - RETRY PAGES" :
+				    "PAGE FAULT - RETRY PAGES");
 			goto retry;
 		} else {
 			xe_log_err(gt, PAGEFAULT, err,
@@ -1391,7 +1454,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 	if (err) {
-		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - FAIL PAGE COLLECT" :
+			    "PAGE FAULT - FAIL PAGE COLLECT");
 		goto err_out;
 	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
 		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
@@ -1400,7 +1465,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
-	range_debug(range, "PAGE FAULT - BIND");
+
+	range_debug(range, acc_ctr_trigger ?
+		    "ACCESS COUNTER TRIGGERED - BIND" : "PAGE FAULT - BIND");
 
 	bind_start = xe_gt_stats_ktime_get();
 	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {}, err) {
@@ -1426,11 +1493,12 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
 
 out:
-	/* Give hint to immediately ack faults */
-	xe_pagefault_set_start_addr(pf,  xe_svm_range_start(range));
-	xe_pagefault_set_end_addr(pf, xe_svm_range_end(range));
-
-	xe_svm_range_fault_us_stats_incr(gt, range, start);
+	if (!acc_ctr_trigger) {
+		/* Give hint to immediately ack faults */
+		xe_pagefault_set_start_addr(pf,  xe_svm_range_start(range));
+		xe_pagefault_set_end_addr(pf, xe_svm_range_end(range));
+		xe_svm_range_fault_us_stats_incr(gt, range, start);
+	}
 	mutex_unlock(&range->lock);
 	drm_gpusvm_range_put(&range->base);
 	return 0;
@@ -1438,7 +1506,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 err_out:
 	if (err == -EAGAIN) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
-		range_debug(range, "PAGE FAULT - RETRY BIND");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - RETRY BIND" :
+			    "PAGE FAULT - RETRY BIND");
 		goto retry;
 	}
 
@@ -1449,37 +1519,38 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 /**
- * xe_svm_handle_pagefault() - SVM handle page fault
+ * xe_svm_range_setup - Setup range for GPU access
  * @vm: The VM.
  * @vma: The CPU address mirror VMA.
  * @pf: Pagefault structure
- * @gt: The gt upon the fault occurred.
- * @fault_addr: The GPU fault address.
- * @atomic: The fault atomic access bit.
+ * @gt: The gt for which binding.
+ * @addr: Addr for which need to bind svm range.
+ * @flags: struct xe_svm_range_setup_flags
  *
- * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * Create GPU bindings for a SVM vma. Optionally migrate to device
  * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_pagefault *pf, struct xe_gt *gt,
-			    u64 fault_addr, bool atomic)
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_pagefault *pf, struct xe_gt *gt,
+		       u64 addr, struct xe_svm_range_setup_flags flags)
 {
 	int need_vram, ret;
 retry:
-	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, flags.atomic);
 	if (need_vram < 0)
 		return need_vram;
 
-	ret =  __xe_svm_handle_pagefault(vm, vma, pf, gt, fault_addr,
-					 need_vram ? true : false);
+	ret =  __xe_svm_range_setup(vm, vma, pf, gt, addr,
+				    need_vram ? true : false,
+				    flags.acc_ctr_trigger);
 	if (ret == -EAGAIN) {
 		/*
 		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
 		 * may have been split by xe_svm_range_set_default_attr.
 		 */
-		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		vma = xe_vm_find_vma_by_addr(vm, addr);
 		if (!vma)
 			return -EINVAL;
 
@@ -1488,6 +1559,70 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return ret;
 }
 
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @pf: Pagefault structure.
+ * @gt: The gt upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_pagefault *pf, struct xe_gt *gt,
+			    u64 fault_addr, bool atomic)
+{
+	return xe_svm_range_setup(vm, vma, pf, gt, fault_addr,
+				  (struct xe_svm_range_setup_flags) {
+					.atomic = atomic,
+					.acc_ctr_trigger = false,
+				  });
+}
+
+/**
+ * xe_svm_range_find_first() - Find first existing SVM range in a VA window
+ * @vm: The VM.
+ * @start: Start of the VA window.
+ * @end: End (exclusive) of the VA window.
+ *
+ * Returns the first already-existing SVM range whose address overlaps
+ * [start, end), skipping holes natively via the interval tree.  Does NOT
+ * create a new range if none exists (unlike xe_svm_range_find_or_insert).
+ *
+ * May be called with vm->lock held in read mode; range_lock is taken to guard
+ * the interval-tree walk against concurrent insert/remove.
+ *
+ * Return: Referenced pointer to the range (drop with xe_svm_range_put()), or
+ * NULL if no range exists in the window.
+ */
+struct xe_svm_range *xe_svm_range_find_first(struct xe_vm *vm,
+					     u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier;
+
+	lockdep_assert_held(&vm->lock);
+
+	guard(mutex)(&vm->svm.range_lock);
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		u64 n_end = min_t(u64, end, drm_gpusvm_notifier_end(notifier));
+		struct drm_gpusvm_range *r;
+
+		r = drm_gpusvm_range_find(notifier, start, n_end);
+		if (r) {
+			drm_gpusvm_range_get(r);
+			return to_xe_range(r);
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * xe_svm_has_mapping() - SVM has mappings
  * @vm: The VM.
@@ -1604,10 +1739,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 				   &range->base.notifier->notifier,
 				   drm_gpusvm_range_start(&range->base),
 				   drm_gpusvm_range_end(&range->base), ctx);
-	if (err == -EOPNOTSUPP) {
-		range_debug(range, "PAGE FAULT - EVICT PAGES");
+	if (err == -EOPNOTSUPP)
 		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
-	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2ef4ef026ccd..4c218bd1f9bd 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -28,6 +28,14 @@ struct xe_vm;
 struct xe_vma;
 struct xe_vram_region;
 
+/** struct xe_svm_range_setup_flags -flags for range setup */
+struct xe_svm_range_setup_flags {
+	/** @atomic: is atomic access */
+	u32 atomic : 1;
+	/** @acc_ctr_trigger: is called by access ctr trigger */
+	u32 acc_ctr_trigger : 1;
+};
+
 /** struct xe_svm_range - SVM range */
 struct xe_svm_range {
 	/** @base: base drm_gpusvm_range */
@@ -109,6 +117,12 @@ void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
 
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_pagefault *pf, struct xe_gt *gt,
+		       u64 addr, struct xe_svm_range_setup_flags flags);
+
+struct xe_svm_range *xe_svm_range_find_first(struct xe_vm *vm, u64 start, u64 end);
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_pagefault *pf, struct xe_gt *gt,
 			    u64 fault_addr, bool atomic);
@@ -220,6 +234,17 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	return drm_gpusvm_range_size(&range->base);
 }
 
+/**
+ * xe_svm_range_allowed_in_devmem() - Whether a range's pages may migrate to devmem
+ * @range: SVM range
+ *
+ * Return: true if the range's pages are allowed to migrate to device memory.
+ */
+static inline bool xe_svm_range_allowed_in_devmem(struct xe_svm_range *range)
+{
+	return range->base.flags.migrate_devmem;
+}
+
 /**
  * xe_svm_range_first_dma() - Resolve the device address array of a SVM range
  * @range: SVM range
@@ -270,6 +295,11 @@ struct xe_svm_range {
 	u32 tile_invalidated;
 };
 
+struct xe_svm_range_setup_flags {
+	u32 atomic : 1;
+	u32 acc_ctr_trigger : 1;
+};
+
 static inline void xe_svm_range_put(struct xe_svm_range *range)
 {
 }
@@ -279,6 +309,11 @@ static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 	return false;
 }
 
+static inline bool xe_svm_range_allowed_in_devmem(struct xe_svm_range *range)
+{
+	return false;
+}
+
 static inline
 int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
@@ -318,6 +353,20 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
+static inline
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_pagefault *pf, struct xe_gt *gt,
+		       u64 addr, struct xe_svm_range_setup_flags flags)
+{
+	return 0;
+}
+
+static inline
+struct xe_svm_range *xe_svm_range_find_first(struct xe_vm *vm, u64 start, u64 end)
+{
+	return NULL;
+}
+
 static inline
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..eae5a5d0dbdc 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_vm.h"
@@ -125,9 +126,34 @@ DEFINE_EVENT(xe_vma, xe_vma_pagefault,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_acc,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
+TRACE_EVENT(xe_vma_acc,
+	    TP_PROTO(struct xe_vma *vma, u8 counter_type),
+	    TP_ARGS(vma, counter_type),
+
+	    TP_STRUCT__entry(
+		     __string(dev, __dev_name_vma(vma))
+		     __field(struct xe_vma *, vma)
+		     __field(struct xe_vm *, vm)
+		     __field(u32, asid)
+		     __field(u64, start)
+		     __field(u64, end)
+		     __field(u8, counter_type)
+		     ),
+
+	    TP_fast_assign(
+		   __assign_str(dev);
+		   __entry->vma = vma;
+		   __entry->vm = xe_vma_vm(vma);
+		   __entry->asid = xe_vma_vm(vma)->usm.asid;
+		   __entry->start = xe_vma_start(vma);
+		   __entry->end = xe_vma_end(vma) - 1;
+		   __entry->counter_type = counter_type;
+		   ),
+
+	    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, type=%s",
+		      __get_str(dev), __entry->vma, __entry->vm,
+		      __entry->asid, __entry->start, __entry->end,
+		      __entry->counter_type == XE_ACCESS_COUNTER_TYPE_NOTIFY ? "NOTIFY" : "TRIGGER")
 );
 
 DEFINE_EVENT(xe_vma, xe_vma_bind,
diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
new file mode 100644
index 000000000000..64f708a5f835
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usm_queue.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_USM_QUEUE_H_
+#define _XE_USM_QUEUE_H_
+
+#include <linux/circ_buf.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct xe_usm_queue - Generic USM circular FIFO queue
+ *
+ * A lock-protected circular buffer used by the access counter
+ * consumer. Producers push fixed-size entries from IRQ context;
+ * workers process them asynchronously.
+ */
+struct xe_usm_queue {
+	/**
+	 * @data: Raw byte buffer backing the queue, protected by @lock
+	 */
+	void *data;
+	/** @size: Total size of @data in bytes */
+	u32 size;
+	/** @head: Write cursor in bytes, moved by producer, protected by @lock */
+	u32 head;
+	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock */
+	u32 tail;
+	/**
+	 * @entry_size: Slot size in bytes (power of two); governs head/tail
+	 * arithmetic.  Always >= @data_size.
+	 */
+	u32 entry_size;
+	/**
+	 * @data_size: Actual number of bytes of live data per entry.
+	 * memcpy in push/pop uses this value so callers never need to
+	 * over-allocate their stack buffers to entry_size.
+	 */
+	u32 data_size;
+	/** @lock: Protects the queue head/tail */
+	spinlock_t lock;
+};
+
+/**
+ * xe_usm_queue_full - Check whether the queue has no room for one more entry
+ * @q: queue
+ *
+ * Must be called with @q->lock held.
+ *
+ * Return: true if the queue is full
+ */
+static inline bool xe_usm_queue_full(struct xe_usm_queue *q)
+{
+	lockdep_assert_held(&q->lock);
+
+	return CIRC_SPACE(q->head, q->tail, q->size) <= q->entry_size;
+}
+
+/**
+ * xe_usm_queue_pop - Pop one entry from the queue into @out
+ * @q: queue
+ * @out: destination buffer, must be at least @q->data_size bytes
+ *
+ * Copies exactly @q->data_size bytes into @out (the actual live data
+ * size), while advancing the tail by @q->entry_size (the padded slot
+ * size).  This prevents stack overflows when @entry_size > @data_size.
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if an entry was dequeued, false if the queue was empty
+ */
+static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out)
+{
+	bool found = false;
+
+	spin_lock_irq(&q->lock);
+	if (q->tail != q->head) {
+		memcpy(out, q->data + q->tail, q->data_size);
+		q->tail = (q->tail + q->entry_size) % q->size;
+		found = true;
+	}
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_peek - Check whether the queue has at least one entry
+ * @q: queue
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if the queue is non-empty
+ */
+static inline bool xe_usm_queue_peek(struct xe_usm_queue *q)
+{
+	bool found;
+
+	spin_lock_irq(&q->lock);
+	found = q->tail != q->head;
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_push - Push one entry into the queue
+ * @q: queue
+ * @in: source buffer, must be at least @q->data_size bytes
+ *
+ * Copies exactly @q->data_size bytes from @in into the next slot
+ * (which is @q->entry_size bytes wide; any padding bytes are left
+ * uninitialised and are never read back by pop).
+ *
+ * Must be called with @q->lock held.
+ * Caller must check xe_usm_queue_full() before calling.
+ */
+static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in)
+{
+	lockdep_assert_held(&q->lock);
+
+	memcpy(q->data + q->head, in, q->data_size);
+	q->head = (q->head + q->entry_size) % q->size;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 753a5fc55baa..15f20cfaa444 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -752,7 +752,8 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 	XE_VMA_DUMPABLE |		    \
 	XE_VMA_SYSTEM_ALLOCATOR |           \
 	DRM_GPUVA_SPARSE |		    \
-	XE_VMA_MADV_AUTORESET)
+	XE_VMA_MADV_AUTORESET |		    \
+	XE_VMA_MIGRATE_ON_ACC)
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
@@ -1219,6 +1220,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		vma->ufence = NULL;
 	}
 
+	dma_fence_put(vma->ac_move_fence);
+
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
@@ -1318,6 +1321,50 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	return err;
 }
 
+/**
+ * xe_vma_lock_and_validate - Lock Vma and Validate bo location
+ * @exec: drm execution context
+ * @vma: VMA to prepare
+ * @vram: target VRAM region
+ * @need_vram_move: true if BO must be moved to VRAM
+ *
+ * Locks the VMA and its associated BO, then ensures the BO is in the correct
+ * memory location for GPU access. If need_vram_move is true, migrates the BO
+ * to VRAM; otherwise validates it in its current location.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	int err;
+
+	err = xe_vm_lock_vma(exec, vma);
+	if (err)
+		return err;
+
+	if (!bo)
+		return 0;
+
+	/*
+	 * Skip validate/migrate for DONTNEED/purged BOs - repopulating
+	 * their pages would prevent the shrinker from reclaiming them.
+	 * For non-scratch VMs there is no safe fallback so fail the fault.
+	 * For scratch VMs let xe_vma_rebind() run normally; it will install
+	 * scratch PTEs so the GPU gets safe zero reads instead of faulting.
+	 */
+	if (unlikely(xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo))) {
+		if (!xe_vm_has_scratch(vm))
+			return -EACCES;
+		return 0;
+	}
+
+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
+		xe_bo_validate(bo, vm, true, exec);
+}
+
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
@@ -2517,6 +2564,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
 			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+			if (flags & DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER)
+				op->map.vma_flags |= XE_VMA_MIGRATE_ON_ACC;
 			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
@@ -3219,6 +3268,8 @@ static void prefetch_thread_func(struct prefetch_thread *thread)
 	if (err) {
 		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
 			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		if (err == -EOPNOTSUPP)
+			xe_svm_range_debug(svm_range, "PREFETCH - EVICTED PAGES");
 		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
 			err = -ENODATA;
 		thread->err = err;
@@ -3739,7 +3790,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
 	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
 	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
-	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS | \
+	 DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3873,6 +3925,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
 		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
+				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP)) ||
+		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER) &&
 				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP))) {
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -4828,6 +4882,78 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_supports_access_ctr - Determine if VMA is eligible for access counting
+ * @xe: Pointer to the Xe device structure
+ * @vma: The VMA
+ * @tile: Tile with which VMA bound is associated to
+ *
+ * For CPU address mirror VMAs the decision is policy-driven:
+ *
+ * - If madvise has set an explicit preferred location that resolves to a
+ *   pagemap belonging to a *different* tile, this tile should not generate
+ *   access counter events (the user declared where the memory lives).  Set
+ *   NC so AC events are suppressed.
+ * - If the preferred location is system memory (DEFAULT_SYSTEM), no GPU
+ *   should migrate via AC; suppress on all tiles.
+ * - Otherwise (no preference / DEFAULT_DEVICE) apply first-touch-then-hot
+ *   policy: enable AC so this tile can migrate the range once it becomes hot.
+ *
+ * Note, access counters are not used unless enabled in LRC.
+ */
+bool xe_vma_supports_access_ctr(struct xe_device *xe,
+				struct xe_vma *vma,
+				struct xe_tile *tile)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct ttm_resource *res;
+
+	if (!IS_DGFX(xe))
+		return false;
+
+	if (xe_vma_is_cpu_addr_mirror(vma)) {
+		struct drm_pagemap *preferred = xe_vma_resolve_pagemap(vma, tile);
+
+		/*
+		 * Explicit system preference: no AC on any GPU — the user
+		 * has stated memory should remain in system RAM.
+		 */
+		if (vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
+			return false;
+
+		/*
+		 * Explicit device preference pointing at a *different* tile:
+		 * suppress AC on this tile so migrates only happen on the
+		 * owning GPU.
+		 */
+		if (preferred && preferred != xe_tile_local_pagemap(tile))
+			return false;
+
+		/* No preference or this tile is preferred: enable AC. */
+		return true;
+	}
+
+	/* userptr or using null vma */
+	if (!bo)
+		return false;
+
+	xe_bo_assert_held(bo);
+	res = bo->ttm.resource;
+	/* if for some reason no backing store, nothing to migrate */
+	if (!res)
+		return false;
+
+	/* cannot migrate if single placement */
+	if (bo->placement.num_placement <= 1)
+		return false;
+
+	/* cannot migrate to ourself (already in VRAM local to @tile) */
+	if (!tile->mem.vram || res->mem_type == tile->mem.vram->placement)
+		return false;
+
+	return true;
+}
+
 /**
  * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
  * @xe: Pointer to the Xe device structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..2a5ae0aacc97 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -185,6 +185,9 @@ struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
 
+bool xe_vma_supports_access_ctr(struct xe_device *xe, struct xe_vma *vma,
+				struct xe_tile *tile);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
@@ -281,6 +284,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move);
+
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 648031e64145..a88e20329e9f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -52,6 +52,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
+#define XE_VMA_MIGRATE_ON_ACC	(DRM_GPUVA_USERBITS << 11)
 
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
@@ -175,6 +176,16 @@ struct xe_vma {
 	 */
 	struct xe_user_fence *ufence;
 
+	/**
+	 * @ac_move_fence: Fence for an in-progress access-counter triggered
+	 * migration/rebind. Written by the AC service and read+cleared by the
+	 * page-fault handler, both under down_read(&vm->lock) + @fault_lock;
+	 * any access under the read lock MUST also hold @fault_lock. The final
+	 * put on VMA destroy (xe_vma_destroy_late()) is unlocked - safe as no
+	 * other reference to the VMA remains.
+	 */
+	struct dma_fence *ac_move_fence;
+
 	/**
 	 * @attr: The attributes of vma which determines the migration policy
 	 * and encoding of the PTEs for this vma.
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 578f0c1eb43e..5f37415239b9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1073,6 +1073,15 @@ struct drm_xe_vm_destroy {
  *    "no-compression" PAT. Only meaningful for VRAM-backed BOs on devices that
  *    support Flat CCS and the required HW generation XE2+.
  *
+ *  - %DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER - Can be used in combination
+ *    with %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to defer device placement to
+ *    access counters: skip the eager first-touch migration on the initial GPU
+ *    page fault and migrate the range to a GPU's local VRAM only once that
+ *    GPU's access counter reports it hot. Ignored when madvise has set an
+ *    explicit preferred device location (placement is already pinned) and never
+ *    overrides migrations required for correctness, such as device atomics.
+ *    Only valid for DRM_XE_VM_BIND_OP_MAP.
+ *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
  *    the memory region advised by madvise.
@@ -1182,6 +1191,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 #define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)
+#define DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER	(1 << 8)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1432,6 +1442,7 @@ struct drm_xe_vm_get_property {
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
@@ -1472,6 +1483,200 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/**
+ * enum drm_xe_access_counter_granularity - VA window size for access counter notifications
+ *
+ * Selects the size of the virtual address region that the hardware groups
+ * together when counting memory accesses and reporting notifications.  A
+ * larger granularity means the hardware reports a coarser region but
+ * generates fewer notifications; a smaller granularity is more precise but
+ * may produce more events under a scattered access pattern.
+ */
+enum drm_xe_access_counter_granularity {
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
+};
+
+/**
+ * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
+ *
+ * **What are access counters?**
+ *
+ * Access counters are a hardware mechanism that tracks how frequently the GPU
+ * accesses memory regions over time.  When a virtual address (VA) window
+ * accumulates enough accesses, the hardware notifies the kernel driver, which
+ * can then take advisory action — typically migrating the hot memory region
+ * from system RAM to device-local VRAM so future GPU accesses avoid costly
+ * PCIe transfers.
+ *
+ * Access counter notifications are purely **advisory and transparent** to
+ * userspace.  Workloads execute identically with or without them; the only
+ * observable effect is potentially improved performance if the kernel succeeds
+ * in migrating memory closer to the GPU.
+ *
+ * **Enabling access counters on an exec queue**
+ *
+ * Access counters are configured at exec queue creation time by attaching a
+ * &drm_xe_exec_queue_set_acc_param extension to &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ * via %DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.  Once set, the parameters
+ * are baked into the engine's Logical Ring Context (LRC) registers
+ * (%CTX_ACC_CTR_THOLD and %CTX_ASID) and remain active for the lifetime of
+ * the exec queue.  There is no separate ioctl to change or remove the
+ * parameters after creation; destroy and recreate the exec queue instead.
+ *
+ * The only behavioural change visible to userspace is that workloads submitted
+ * to this exec queue may run with slightly different memory locality over time
+ * as the kernel responds to hotness hints.
+ *
+ * **Typical usage pattern**
+ *
+ * .. code-block:: c
+ *
+ *     // Step 1: build the extension
+ *     struct drm_xe_exec_queue_set_acc_param acc = {
+ *         .base.name     = DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM,
+ *         .trigger       = 100,  // report trigger notification at 100 accesses
+ *         .notify        = 20,   // notify on LRU de-alloc if >= 20 accesses
+ *         .granularity   = DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+ *     };
+ *
+ *     // Step 2: chain it onto exec queue creation
+ *     struct drm_xe_exec_queue_create eq = {
+ *         .extensions    = (uintptr_t)&acc,
+ *         .vm_id         = vm_id,
+ *         .width         = 1,
+ *         .num_placements = 1,
+ *         .instances     = (uintptr_t)&instance,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &eq);
+ *
+ *     // Step 3: submit work as normal — AC tracking is automatic
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+ *
+ * **How @trigger works**
+ *
+ * The hardware maintains a finite pool of counters, each tracking accesses to
+ * one @granularity-aligned VA window.  When the accumulated access count for
+ * a counter reaches @trigger, the hardware immediately reports it to the
+ * driver as an **access counter trigger notification**.  This is the primary,
+ * high-priority path: the region is identified as hot and the driver acts on
+ * it promptly (e.g., migrating memory to VRAM).
+ *
+ * **How @notify works**
+ *
+ * Because the hardware counter pool is finite, a counter may be de-allocated
+ * under capacity pressure using an LRU policy before its count ever reaches
+ * @trigger.  At de-allocation time, the hardware compares the current count
+ * of the de-allocated counter against @notify.  If count >= @notify,
+ * the hardware reports it as an **access counter notify notification**.
+ * The driver treats notify notifications with lower priority than trigger
+ * notifications — they indicate moderate interest and are serviced
+ * opportunistically.  If count < @notify, the de-allocation is silent.
+ *
+ * Both @trigger and @notify are absolute access counts (16-bit unsigned).
+ *
+ * Example (hardware counter pool under pressure)::
+ *
+ *     CTR 10 is being de-allocated (LRU).  It was tracking a VA window with
+ *     notify=0x14 (20), trigger=0x64 (100).
+ *
+ *     CTR 10 count == 0x0A (10): count < notify → silent de-allocation.
+ *     CTR 10 count == 0x1E (30): count >= notify → NOTIFY reported to driver.
+ *
+ * Setting @notify > @trigger is meaningless: the counter is de-allocated
+ * (via trigger notification or LRU) before its count can ever reach @notify.
+ * Always set @notify <= @trigger.
+ *
+ * **Do notifications reach userspace?**
+ *
+ * No.  Notifications are handled entirely inside the kernel driver.  The
+ * driver emits kernel trace events (``trace_xe_vma_acc`` via ftrace) that are
+ * visible through the standard Linux tracing infrastructure, but no signal,
+ * udev event, or file descriptor event is delivered to the process.
+ *
+ * **What if access counters are not supported?**
+ *
+ * Attaching this extension on hardware that does not support access counters
+ * (i.e., when ``xe.info.has_access_counter`` is zero) causes
+ * %DRM_IOCTL_XE_EXEC_QUEUE_CREATE to return ``-EINVAL``.  Applications should
+ * either verify hardware capability using %DRM_IOCTL_XE_DEVICE_QUERY before
+ * using this extension, or be prepared to handle ``-EINVAL`` and fall back to
+ * creating the exec queue without the extension.
+ *
+ * **Reset and removal**
+ *
+ * Access counter parameters cannot be removed or changed after the exec queue
+ * is created.  During a GT reset the kernel squashes any in-flight access
+ * counter notifications for that GT (pending work items are discarded), but
+ * the LRC register values are not cleared — they are restored by the GuC
+ * context save/restore mechanism when the engine recovers.
+ */
+struct drm_xe_exec_queue_set_acc_param {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/**
+	 * @trigger: Active count threshold for trigger notifications.
+	 *
+	 * When the hardware counter for a @granularity-aligned VA window
+	 * reaches this value, the hardware immediately reports an access
+	 * counter **trigger** notification to the driver.  Trigger
+	 * notifications are high priority — the region is confirmed hot.
+	 * Absolute count, 16-bit unsigned (e.g. 0x64 = 100 accesses).
+	 */
+	__u16 trigger;
+
+	/**
+	 * @notify: De-allocation count threshold for notify notifications.
+	 *
+	 * When a counter is de-allocated from the finite hardware pool under
+	 * LRU pressure, the hardware compares its accumulated count against
+	 * this value.  If count >= @notify, an access counter **notify**
+	 * notification is reported to the driver (lower priority than trigger).
+	 * If count < @notify, the de-allocation is silent.
+	 * Absolute count, 16-bit unsigned (e.g. 0x14 = 20 accesses).
+	 *
+	 * Must be <= @trigger.  A counter is de-allocated once it either fires
+	 * a trigger notification or is de-allocated by LRU; in either case its
+	 * count never exceeds @trigger, so a @notify value larger than @trigger
+	 * can never be satisfied.
+	 */
+	__u16 notify;
+
+	/**
+	 * @granularity: VA window size, one of &enum drm_xe_access_counter_granularity.
+	 *
+	 * Determines the alignment and size of the virtual address regions
+	 * that the hardware tracks and reports.  Each notification covers one
+	 * aligned window of this size.  Possible values:
+	 *
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128 KiB windows.
+	 *   Finest granularity; best for workloads with small, scattered hot
+	 *   allocations where precise locality matters.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2 MiB windows.
+	 *   Matches the typical huge-page size; good general-purpose choice.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16 MiB windows.
+	 *   Coarser tracking; suitable for large buffer workloads where
+	 *   per-allocation granularity is sufficient.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64 MiB windows.
+	 *   Coarsest granularity; fewest notifications, lowest overhead,
+	 *   best for very large contiguous allocations.
+	 */
+	__u8 granularity;
+
+	/** @pad1: MBZ */
+	__u8 pad1;
+
+	/** @pad2: MBZ */
+	__u16 pad2;
+};
+
 /**
  * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
  */
-- 
2.43.0

