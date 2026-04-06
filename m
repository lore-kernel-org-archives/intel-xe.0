Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88197EF4EC9
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF2210E228;
	Mon,  6 Apr 2026 08:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exu/R/B7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727D910E21B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465930; x=1807001930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwQJuHyorbkhzAV21g22fnli58eWWjiWuROCn7ZAeCk=;
 b=exu/R/B7ysi6stGlhynUDyxaJLaGh9ajelkFMeuJxoLG6eqeiZWS5VhM
 ID/65HF7hA2L2jjifZYnI5Jy0ETDvUOwKP4XZJ5jkGE41OraObwx4evkQ
 HKIBguLIUxiO4BkoJrOp+0b05qX4kKHi9sgLHh/LUe0YAX6r14Zt7JtQ/
 WgJPxeG7S88pxb8fePl1DmDxC0Ae1iWiYfCukX85JTfgbmobs2s6FhNec
 ok0krrEjk80USBxDc3/ZmK4XdP+zA4hDz2YBuWM/+lH80cVUtHRDl7vHj
 ZWG+iDtciSTYwUHbU7+iDR4sZT2hZvstUZpun4SnpQXTgmGpdzC3QF/Aj g==;
X-CSE-ConnectionGUID: Z9mNXVcJQBm1Cs4dcrR9LQ==
X-CSE-MsgGUID: gBynLbKjSz+qaZMNMETj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012888"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012888"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:50 -0700
X-CSE-ConnectionGUID: ftnoto7TRS2hhVaesQAwqw==
X-CSE-MsgGUID: bClnhfpSRvSc7N7/NpCwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775192"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:48 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 4/7] drm/xe/vm: Add madvise autoreset interval notifier
 worker infrastructure
Date: Mon,  6 Apr 2026 14:28:27 +0530
Message-ID: <20260406085830.1118431-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

Reset VMA attributes on munmap for CPU-only VMAs.

The MMU notifier callback cannot take vm->lock, so use an
mmu_interval_notifier to queue work on MMU_NOTIFY_UNMAP.
The worker runs under vm->lock and resets attributes for VMAs
with cpu_autoreset_active set.

v2:
  - Replace closing state with teardown_rwsem. (Matt)
  - Use maple_tree for notifier tracking. (Matt)
  - Embed work_struct in notifier; no allocation in callback. (Thomas)
  - Coalesce overlapping munmap events via min/max.
  - Run notifier removal and workqueue drain outside teardown_rwsem. (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 394 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |   7 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  59 +++++
 3 files changed, 460 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 66f00d3f5c07..bdeb2e8e0f2c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -6,6 +6,8 @@
 #include "xe_vm_madvise.h"
 
 #include <linux/nospec.h>
+#include <linux/maple_tree.h>
+#include <linux/workqueue.h>
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
@@ -14,6 +16,10 @@
 #include "xe_svm.h"
 #include "xe_tlb_inval.h"
 #include "xe_vm.h"
+#include "xe_macros.h"
+
+/* Lockdep class for teardown_rwsem */
+static struct lock_class_key xe_madvise_teardown_key;
 
 struct xe_vmas_in_madvise_range {
 	u64 addr;
@@ -827,3 +833,391 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_vm_put(vm);
 	return err;
 }
+
+static void xe_vma_set_default_attributes(struct xe_vma *vma)
+{
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		.pat_index = vma->attr.default_pat_index,
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
+	};
+
+	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
+}
+
+/**
+ * xe_vm_madvise_process_unmap - Process munmap for all VMAs in range
+ * @vm: VM
+ * @start: Start of unmap range
+ * @end: End of unmap range
+ *
+ * Processes all VMAs overlapping the unmap range. An unmap can span multiple
+ * VMAs, so we need to loop and process each segment.
+ *
+ * Return: 0 on success, negative error otherwise
+ */
+static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64 start, u64 end)
+{
+	u64 addr = start;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return 0;
+
+	while (addr < end) {
+		struct xe_vma *vma;
+		u64 seg_start, seg_end;
+		bool has_default_attr;
+
+		vma = xe_vm_find_overlapping_vma(vm, addr, end - addr);
+		if (!vma)
+			break;
+
+		/* Skip GPU-touched VMAs - SVM handles them */
+		if (!xe_vma_has_cpu_autoreset_active(vma)) {
+			addr = xe_vma_end(vma);
+			continue;
+		}
+
+		has_default_attr = xe_vma_has_default_mem_attrs(vma);
+		seg_start = max(addr, xe_vma_start(vma));
+		seg_end = min(end, xe_vma_end(vma));
+
+		/* Expand for merging if VMA already has default attrs */
+		if (has_default_attr &&
+		    xe_vma_start(vma) >= start &&
+		    xe_vma_end(vma) <= end) {
+			/*
+			 * VMA fully within unmap range and already at defaults.
+			 * Try to merge with adjacent default-attr VMAs into one
+			 * rebuild call.  If expansion found nothing, skip.
+			 */
+			seg_start = xe_vma_start(vma);
+			seg_end = xe_vma_end(vma);
+			xe_vm_find_cpu_addr_mirror_vma_range(vm, &seg_start, &seg_end);
+			if (xe_vma_start(vma) == seg_start && xe_vma_end(vma) == seg_end) {
+				/* No adjacent defaults to merge; nothing to do. */
+				addr = seg_end;
+				continue;
+			}
+		} else if (xe_vma_start(vma) == seg_start && xe_vma_end(vma) == seg_end) {
+			/* Unmap covers VMA exactly; reset attrs in-place, no rebuild needed. */
+			xe_vma_set_default_attributes(vma);
+			addr = seg_end;
+			continue;
+		}
+
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, seg_start, seg_end - seg_start);
+		if (err) {
+			if (err == -ENOENT) {
+				/* VMA removed before worker ran; nothing to reset. */
+				addr = seg_end;
+				continue;
+			}
+			return err;
+		}
+
+		addr = seg_end;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_madvise_work_func - Worker to process unmap
+ * @w: work_struct embedded in xe_madvise_notifier
+ *
+ * Reads the pending range, clears the pending flag, then resets VMA
+ * attributes under vm->lock.  The work struct and vm reference are both
+ * owned by the notifier, so no allocation or extra refcount is needed here.
+ */
+static void xe_madvise_work_func(struct work_struct *w)
+{
+	struct xe_madvise_notifier *notifier =
+		container_of(w, struct xe_madvise_notifier, work);
+	struct xe_vm *vm = notifier->vm;
+	u64 start, end;
+	int err;
+
+	spin_lock(&notifier->work_lock);
+	start = notifier->work_start;
+	end = notifier->work_end;
+	notifier->work_pending = false;
+	spin_unlock(&notifier->work_lock);
+
+	down_write(&vm->lock);
+	err = xe_vm_madvise_process_unmap(vm, start, end);
+	if (err)
+		drm_warn(&vm->xe->drm,
+			 "madvise autoreset failed [%#llx-%#llx]: %d\n",
+			 start, end, err);
+	up_write(&vm->lock);
+}
+
+/**
+ * xe_madvise_notifier_callback - MMU notifier callback for CPU munmap
+ * @mni: mmu_interval_notifier
+ * @range: mmu_notifier_range
+ * @cur_seq: current sequence number
+ *
+ * Queues the pre-allocated embedded work item to reset VMA attributes.
+ * No memory allocation occurs here; the work struct lives inside the
+ * xe_madvise_notifier which was allocated at ioctl time.
+ *
+ * Coalesces overlapping munmap events via min/max into the pending range.
+ *
+ * Return: true (never blocks)
+ */
+static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
+					 const struct mmu_notifier_range *range,
+					 unsigned long cur_seq)
+{
+	struct xe_madvise_notifier *notifier =
+		container_of(mni, struct xe_madvise_notifier, mmu_notifier);
+	struct xe_vm *vm = notifier->vm;
+	u64 start, end;
+
+	if (range->event != MMU_NOTIFY_UNMAP)
+		return true;
+
+	/* Skip non-blockable contexts; correctness is ensured by cpu_autoreset_active. */
+	if (!mmu_notifier_range_blockable(range))
+		return true;
+
+	/* Consume seq (interval-notifier convention) */
+	mmu_interval_set_seq(mni, cur_seq);
+
+	start = max_t(u64, range->start, notifier->vma_start);
+	end = min_t(u64, range->end, notifier->vma_end);
+
+	if (start >= end)
+		return true;
+
+	/* Bail if teardown started; trylock fails once fini holds write. */
+	if (!down_read_trylock(&vm->svm.madvise_work.teardown_rwsem))
+		return true;
+
+	/* fini may have NULLed wq before we got here; check under read lock. */
+	if (!vm->svm.madvise_work.wq) {
+		up_read(&vm->svm.madvise_work.teardown_rwsem);
+		return true;
+	}
+
+	spin_lock(&notifier->work_lock);
+	if (notifier->work_pending) {
+		/* Coalesce into the already-pending range; no requeue needed. */
+		notifier->work_start = min(notifier->work_start, start);
+		notifier->work_end = max(notifier->work_end, end);
+		spin_unlock(&notifier->work_lock);
+		up_read(&vm->svm.madvise_work.teardown_rwsem);
+		return true;
+	}
+	notifier->work_start = start;
+	notifier->work_end = end;
+	notifier->work_pending = true;
+	spin_unlock(&notifier->work_lock);
+
+	queue_work(vm->svm.madvise_work.wq, &notifier->work);
+
+	up_read(&vm->svm.madvise_work.teardown_rwsem);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops xe_madvise_notifier_ops = {
+	.invalidate = xe_madvise_notifier_callback,
+};
+
+/**
+ * xe_vm_madvise_init - Initialize madvise notifier infrastructure
+ * @vm: VM
+ *
+ * Sets up workqueue for async munmap processing.
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+int xe_vm_madvise_init(struct xe_vm *vm)
+{
+	/* Guard against double initialization */
+	if (vm->svm.madvise_work.wq)
+		return 0;
+
+	mt_init(&vm->svm.madvise_notifiers);
+
+	/* Custom lockdep class: always acquired via trylock, never blocks. */
+	__init_rwsem(&vm->svm.madvise_work.teardown_rwsem,
+		     "xe_madvise_teardown", &xe_madvise_teardown_key);
+
+	/* WQ_UNBOUND, no WQ_MEM_RECLAIM: not on reclaim path. */
+	vm->svm.madvise_work.wq = alloc_workqueue("xe_madvise", WQ_UNBOUND, 0);
+	if (!vm->svm.madvise_work.wq) {
+		mtree_destroy(&vm->svm.madvise_notifiers);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_vm_madvise_fini - Cleanup all madvise notifiers
+ * @vm: VM
+ *
+ * Tears down notifiers and drains workqueue. Safe if init partially failed.
+ *
+ * down_write(teardown_rwsem) first to block callbacks, then collect notifiers
+ * and NULL wq, then up_write. Remove notifiers and drain wq only after
+ * releasing the rwsem: mmu_interval_notifier_remove() can block on mmap_lock.
+ */
+void xe_vm_madvise_fini(struct xe_vm *vm)
+{
+	struct xe_madvise_notifier *notifier, *next;
+	struct workqueue_struct *wq;
+	unsigned long index;
+	LIST_HEAD(tmp);
+
+	/* Nothing to do if init never ran. */
+	if (!vm->svm.madvise_work.wq)
+		return;
+
+	/* Block new callbacks and wait for in-flight ones to finish. */
+	down_write(&vm->svm.madvise_work.teardown_rwsem);
+
+	/* Stage notifiers for removal; list_head is unused outside fini. */
+	mt_for_each(&vm->svm.madvise_notifiers, notifier, index, ULONG_MAX)
+		list_add(&notifier->list, &tmp);
+
+	/* VM is CLOSED here; no new madvise ioctls can insert. Safe to destroy. */
+	mtree_destroy(&vm->svm.madvise_notifiers);
+
+	/* NULL the wq; late callbacks see NULL and bail. */
+	wq = vm->svm.madvise_work.wq;
+	vm->svm.madvise_work.wq = NULL;
+
+	up_write(&vm->svm.madvise_work.teardown_rwsem);
+
+	/*
+	 * Remove interval notifiers outside the rwsem; remove() may block on
+	 * mmap_lock.  This synchronises with in-progress callbacks but NOT with
+	 * already-queued work items (the embedded work_struct is still live).
+	 */
+	list_for_each_entry(notifier, &tmp, list)
+		mmu_interval_notifier_remove(&notifier->mmu_notifier);
+
+	/*
+	 * Drain before freeing: queued/running work items hold a pointer to
+	 * the notifier via container_of().  kfree() must not happen until all
+	 * work has finished.
+	 */
+	if (wq) {
+		drain_workqueue(wq);
+		destroy_workqueue(wq);
+	}
+
+	/* Safe to free now: no callbacks can fire, no workers are running. */
+	list_for_each_entry_safe(notifier, next, &tmp, list) {
+		list_del(&notifier->list);
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+	}
+}
+
+/**
+ * xe_vm_madvise_register_notifier_range - Register MMU notifier for address range
+ * @vm: VM
+ * @start: Start address (page-aligned)
+ * @end: End address (page-aligned)
+ *
+ * Registers interval notifier for munmap tracking. Uses addresses (not VMA pointers)
+ * to avoid UAF after dropping vm->lock. Deduplicates by range.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_madvise_notifier *notifier;
+	int err;
+
+	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(end <= start))
+		return -EINVAL;
+
+	if (!vm->svm.gpusvm.mm)
+		return -EINVAL;
+
+	notifier = kzalloc_obj(*notifier, GFP_KERNEL);
+	if (!notifier)
+		return -ENOMEM;
+
+	notifier->vm = xe_vm_get(vm);
+	notifier->vma_start = start;
+	notifier->vma_end = end;
+	INIT_LIST_HEAD(&notifier->list);
+	spin_lock_init(&notifier->work_lock);
+	INIT_WORK(&notifier->work, xe_madvise_work_func);
+
+	/* Insert before taking vm->lock; may call mmap_write_lock() internally. */
+	err = mmu_interval_notifier_insert(&notifier->mmu_notifier,
+					   vm->svm.gpusvm.mm,
+					   start,
+					   end - start,
+					   &xe_madvise_notifier_ops);
+	if (err) {
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+		return err;
+	}
+
+	/* Take vm->lock only for the maple-tree dedup check and store. */
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm)) {
+		up_write(&vm->lock);
+		mmu_interval_notifier_remove(&notifier->mmu_notifier);
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+		return -ENOENT;
+	}
+
+	/*
+	 * Re-arm on exact match, deactivate stale notifiers from split VMAs
+	 * so their callbacks no-op. fini() will clean them up.
+	 */
+	{
+		struct xe_madvise_notifier *n;
+		unsigned long idx = start;
+
+		mt_for_each(&vm->svm.madvise_notifiers, n, idx, end - 1) {
+			if (n->vma_start == start && n->vma_end == end) {
+				n->active = true;
+				up_write(&vm->lock);
+				mmu_interval_notifier_remove(&notifier->mmu_notifier);
+				xe_vm_put(notifier->vm);
+				kfree(notifier);
+				return 0;
+			}
+			/* Stale notifier from a split VMA; deactivate and let
+			 * fini() clean it up.
+			 */
+			n->active = false;
+		}
+	}
+
+	err = mtree_store_range(&vm->svm.madvise_notifiers, start, end - 1,
+				notifier, GFP_KERNEL);
+	up_write(&vm->lock);
+
+	if (err) {
+		mmu_interval_notifier_remove(&notifier->mmu_notifier);
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+	}
+
+	return err;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index 39acd2689ca0..111953de4d2f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -6,13 +6,20 @@
 #ifndef _XE_VM_MADVISE_H_
 #define _XE_VM_MADVISE_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
 struct xe_bo;
+struct xe_vm;
+struct xe_vma;
 
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
 void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
 
+int xe_vm_madvise_init(struct xe_vm *vm);
+void xe_vm_madvise_fini(struct xe_vm *vm);
+int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6a19ecca5518..93e777f010f9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -12,6 +12,7 @@
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
+#include <linux/maple_tree.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
 
@@ -31,6 +32,42 @@ struct xe_user_fence;
 struct xe_vm;
 struct xe_vm_pgtable_update_op;
 
+/**
+ * struct xe_madvise_notifier - MMU notifier for madvise autoreset
+ *
+ * Tracks CPU munmap on CPU address mirror VMAs and queues work to
+ * reset attributes. Work is embedded so the callback does not allocate.
+ *
+ * work_lock serialises pending range updates between callback and worker.
+ * Overlapping events are coalesced via min/max on work_start/work_end.
+ */
+struct xe_madvise_notifier {
+	/** @mmu_notifier: MMU interval notifier */
+	struct mmu_interval_notifier mmu_notifier;
+	/** @vm: VM this notifier belongs to (holds reference via xe_vm_get) */
+	struct xe_vm *vm;
+	/** @vma_start: Start address of VMA being tracked */
+	u64 vma_start;
+	/** @vma_end: End address of VMA being tracked */
+	u64 vma_end;
+	/** @list: Used only in xe_vm_madvise_fini() to stage notifiers for removal. */
+	struct list_head list;
+	/** @work_lock: Serialises work_pending, work_start and work_end. */
+	spinlock_t work_lock;
+	/** @work_pending: True if a range is pending for @work. */
+	bool work_pending;
+	/** @work_start: Start of the unmapped range for the pending work item. */
+	u64 work_start;
+	/** @work_end: End of the unmapped range for the pending work item. */
+	u64 work_end;
+	/**
+	 * @work: Embedded work item queued on CPU munmap.
+	 * Pre-allocated at notifier registration; no allocation ever occurs
+	 * in the MMU notifier callback.
+	 */
+	struct work_struct work;
+};
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
 #define FORCE_OP_ERROR	BIT(31)
@@ -245,6 +282,28 @@ struct xe_vm {
 		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
 		/** @svm.peer: Used for pagemap connectivity computations. */
 		struct drm_pagemap_peer peer;
+
+		/**
+		 * @svm.madvise_notifiers: Active madvise notifiers, keyed by
+		 * [vma_start, vma_end - 1]. The maple tree uses its own internal
+		 * spinlock for data integrity. Insertions happen under vm->lock
+		 * write; teardown is serialized by teardown_rwsem write.
+		 */
+		struct maple_tree madvise_notifiers;
+
+		/** @svm.madvise_work: Workqueue for async munmap processing */
+		struct {
+			/** @svm.madvise_work.wq: Workqueue */
+			struct workqueue_struct *wq;
+
+			/**
+			 * @svm.madvise_work.teardown_rwsem: Guards VM teardown.
+			 *
+			 * Callbacks take read via trylock; fini takes write.
+			 * A failed trylock means teardown started; bail immediately.
+			 */
+			struct rw_semaphore teardown_rwsem;
+		} madvise_work;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.43.0

