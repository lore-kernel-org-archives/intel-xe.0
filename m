Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD05E9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D44F10E687;
	Thu, 19 Feb 2026 09:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOoqMLu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8001210E687
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492412; x=1803028412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R5/nvyAKfLJwSAP0c7LwOWD3A/XYWL3WWuvb5ewLkk0=;
 b=KOoqMLu7stXv7MLSB79jTEImc4J+U6hpV2G8zJytURGNlhFyJ4JOso87
 KAXLTkVmXzf/sv3iRaxdAu/4DtoXtdxVE8UrwlCUmVwhkk8a8N0UjmILv
 XBI5cX0iHYua5A4YWIdvdSGmiIQdTaaOhL1CBbozs2BBeP3rjkQTPu9kD
 7uMFW6JI/SlPzFYueW8uk9VV7H6x8v9BEsb51b/CIFybxIm4Zubf9vcoS
 3Hjo0DOQntj+N+N2P0S5h0kKP3tMyKsLRCgfTBoz1UcoLqn+LLQEdz6d5
 d1OV2221CgOffApAG8k7p+zCWufzeOkw8HvyygBqRjpmfdT9D6ENuU9cG Q==;
X-CSE-ConnectionGUID: Eut+NW//T7yJ5vRg3JH3NQ==
X-CSE-MsgGUID: dffyIqPOTziAtP3RlVMzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637313"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:32 -0800
X-CSE-ConnectionGUID: +n0E7bpWStu5ljB2TcFq0A==
X-CSE-MsgGUID: 3oJFa+LfQfaL6vwrMAr/OQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:31 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 4/7] drm/xe/vm: Add madvise autoreset interval notifier worker
 infrastructure
Date: Thu, 19 Feb 2026 14:43:09 +0530
Message-ID: <20260219091312.796749-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
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

MADVISE_AUTORESET needs to reset VMA attributes when userspace unmaps
CPU-only ranges, but the MMU invalidate callback cannot take vm->lock
due to lock ordering (mmap_lock is already held).

Add mmu_interval_notifier that queues work items for MMU_NOTIFY_UNMAP
events. The worker runs under vm->lock and resets attributes for VMAs
still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-touched).

Work items are allocated from a mempool to handle atomic context in the
callback. The notifier is deactivated when GPU touches the VMA.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 394 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |   8 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  41 +++
 3 files changed, 443 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 52147f5eaaa0..4c0ffb100bcc 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -6,9 +6,12 @@
 #include "xe_vm_madvise.h"
 
 #include <linux/nospec.h>
+#include <linux/mempool.h>
+#include <linux/workqueue.h>
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_macros.h"
 #include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
@@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_vm_put(vm);
 	return err;
 }
+
+/**
+ * struct xe_madvise_work_item - Work item for unmap processing
+ * @work: work_struct
+ * @vm: VM reference
+ * @pool: Mempool for recycling
+ * @start: Start address
+ * @end: End address
+ */
+struct xe_madvise_work_item {
+	struct work_struct work;
+	struct xe_vm *vm;
+	mempool_t *pool;
+	u64 start;
+	u64 end;
+};
+
+static void xe_vma_set_default_attributes(struct xe_vma *vma)
+{
+	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
+	vma->attr.pat_index = vma->attr.default_pat_index;
+	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
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
+		vma = xe_vm_find_overlapping_vma(vm, addr, end);
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
+			seg_start = xe_vma_start(vma);
+			seg_end = xe_vma_end(vma);
+			xe_vm_find_cpu_addr_mirror_vma_range(vm, &seg_start, &seg_end);
+		} else if (xe_vma_start(vma) == seg_start && xe_vma_end(vma) == seg_end) {
+			xe_vma_set_default_attributes(vma);
+			addr = seg_end;
+			continue;
+		}
+
+		if (xe_vma_start(vma) == seg_start &&
+		    xe_vma_end(vma) == seg_end &&
+		    has_default_attr) {
+			addr = seg_end;
+			continue;
+		}
+
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, seg_start, seg_end - seg_start);
+		if (err) {
+			if (err == -ENOENT) {
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
+ * @w: work_struct
+ *
+ * Processes a single unmap by taking vm->lock and calling the helper.
+ * Each unmap has its own work item, so no interval loss.
+ */
+static void xe_madvise_work_func(struct work_struct *w)
+{
+	struct xe_madvise_work_item *item = container_of(w, struct xe_madvise_work_item, work);
+	struct xe_vm *vm = item->vm;
+	int err;
+
+	down_write(&vm->lock);
+	err = xe_vm_madvise_process_unmap(vm, item->start, item->end);
+	if (err)
+		drm_warn(&vm->xe->drm,
+			 "madvise autoreset failed [%#llx-%#llx]: %d\n",
+			 item->start, item->end, err);
+	/*
+	 * Best-effort: Log failure and continue.
+	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
+	 */
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+	mempool_free(item, item->pool);
+}
+
+/**
+ * xe_madvise_notifier_callback - MMU notifier callback for CPU munmap
+ * @mni: mmu_interval_notifier
+ * @range: mmu_notifier_range
+ * @cur_seq: current sequence number
+ *
+ * Queues work to reset VMA attributes. Cannot take vm->lock (circular locking),
+ * so uses workqueue. GFP_ATOMIC allocation may fail; drops event if so.
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
+	struct xe_madvise_work_item *item;
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+	u64 start, end;
+
+	if (range->event != MMU_NOTIFY_UNMAP)
+		return true;
+
+	/*
+	 * Best-effort: skip in non-blockable contexts to avoid building up work.
+	 * Correctness does not rely on this notifier - CPU_AUTORESET_ACTIVE flag
+	 * prevents GPU PTE zaps on CPU-only VMAs in the zap path.
+	 */
+	if (!mmu_notifier_range_blockable(range))
+		return true;
+
+	/* Consume seq (interval-notifier convention) */
+	mmu_interval_set_seq(mni, cur_seq);
+
+	/* Best-effort: core correctness from CPU_AUTORESET_ACTIVE check in zap path */
+
+	start = max_t(u64, range->start, notifier->vma_start);
+	end = min_t(u64, range->end, notifier->vma_end);
+
+	if (start >= end)
+		return true;
+
+	pool = READ_ONCE(vm->svm.madvise_work.pool);
+	wq = READ_ONCE(vm->svm.madvise_work.wq);
+	if (!pool || !wq || atomic_read(&vm->svm.madvise_work.closing))
+		return true;
+
+	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier context */
+	item = mempool_alloc(pool, GFP_ATOMIC);
+	if (!item)
+		return true;
+
+	memset(item, 0, sizeof(*item));
+	INIT_WORK(&item->work, xe_madvise_work_func);
+	item->vm = xe_vm_get(vm);
+	item->pool = pool;
+	item->start = start;
+	item->end = end;
+
+	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {
+		xe_vm_put(item->vm);
+		mempool_free(item, pool);
+		return true;
+	}
+
+	queue_work(wq, &item->work);
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
+ * Sets up workqueue and mempool for async munmap processing.
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+int xe_vm_madvise_init(struct xe_vm *vm)
+{
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+
+	/* Always initialize list and mutex - fini may be called on partial init */
+	INIT_LIST_HEAD(&vm->svm.madvise_notifiers.list);
+	mutex_init(&vm->svm.madvise_notifiers.lock);
+
+	wq = READ_ONCE(vm->svm.madvise_work.wq);
+	pool = READ_ONCE(vm->svm.madvise_work.pool);
+
+	/* Guard against double initialization and detect partial init */
+	if (wq || pool) {
+		XE_WARN_ON(!wq || !pool);
+		return 0;
+	}
+
+	WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
+	WRITE_ONCE(vm->svm.madvise_work.pool, NULL);
+	atomic_set(&vm->svm.madvise_work.closing, 1);
+
+	/*
+	 * WQ_UNBOUND: best-effort optimization, not critical path.
+	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops with GFP_KERNEL).
+	 * Not on reclaim path - merely resets attributes after munmap.
+	 */
+	vm->svm.madvise_work.wq = alloc_workqueue("xe_madvise", WQ_UNBOUND, 0);
+	if (!vm->svm.madvise_work.wq)
+		return -ENOMEM;
+
+	/* Mempool for GFP_ATOMIC allocs in notifier callback */
+	vm->svm.madvise_work.pool =
+		mempool_create_kmalloc_pool(64,
+					     sizeof(struct xe_madvise_work_item));
+	if (!vm->svm.madvise_work.pool) {
+		destroy_workqueue(vm->svm.madvise_work.wq);
+		WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
+		return -ENOMEM;
+	}
+
+	atomic_set(&vm->svm.madvise_work.closing, 0);
+
+	return 0;
+}
+
+/**
+ * xe_vm_madvise_fini - Cleanup all madvise notifiers
+ * @vm: VM
+ *
+ * Tears down notifiers and drains workqueue. Safe if init partially failed.
+ * Order: closing flag → remove notifiers (SRCU sync) → drain wq → destroy.
+ */
+void xe_vm_madvise_fini(struct xe_vm *vm)
+{
+	struct xe_madvise_notifier *notifier, *next;
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+	LIST_HEAD(tmp);
+
+	atomic_set(&vm->svm.madvise_work.closing, 1);
+
+	/*
+	 * Detach notifiers under lock, then remove outside lock (SRCU sync can be slow).
+	 * Splice avoids holding mutex across mmu_interval_notifier_remove() SRCU sync.
+	 * Removing notifiers first (before drain) prevents new invalidate callbacks.
+	 */
+	mutex_lock(&vm->svm.madvise_notifiers.lock);
+	list_splice_init(&vm->svm.madvise_notifiers.list, &tmp);
+	mutex_unlock(&vm->svm.madvise_notifiers.lock);
+
+	/* Now remove notifiers without holding lock - mmu_interval_notifier_remove() SRCU-syncs */
+	list_for_each_entry_safe(notifier, next, &tmp, list) {
+		list_del(&notifier->list);
+		mmu_interval_notifier_remove(&notifier->mmu_notifier);
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+	}
+
+	/* Drain and destroy workqueue */
+	wq = xchg(&vm->svm.madvise_work.wq, NULL);
+	if (wq) {
+		drain_workqueue(wq);
+		destroy_workqueue(wq);
+	}
+
+	pool = xchg(&vm->svm.madvise_work.pool, NULL);
+	if (pool)
+		mempool_destroy(pool);
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
+	struct xe_madvise_notifier *notifier, *existing;
+	int err;
+
+	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(end <= start))
+		return -EINVAL;
+
+	if (atomic_read(&vm->svm.madvise_work.closing))
+		return -ENOENT;
+
+	if (!READ_ONCE(vm->svm.madvise_work.wq) ||
+	    !READ_ONCE(vm->svm.madvise_work.pool))
+		return -ENOMEM;
+
+	/* Check mm early to avoid allocation if it's missing */
+	if (!vm->svm.gpusvm.mm)
+		return -EINVAL;
+
+	/* Dedupe: check if notifier exists for this range */
+	mutex_lock(&vm->svm.madvise_notifiers.lock);
+	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
+		if (existing->vma_start == start && existing->vma_end == end) {
+			mutex_unlock(&vm->svm.madvise_notifiers.lock);
+			return 0;
+		}
+	}
+	mutex_unlock(&vm->svm.madvise_notifiers.lock);
+
+	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
+	if (!notifier)
+		return -ENOMEM;
+
+	notifier->vm = xe_vm_get(vm);
+	notifier->vma_start = start;
+	notifier->vma_end = end;
+	INIT_LIST_HEAD(&notifier->list);
+
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
+	/* Re-check closing to avoid teardown race */
+	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {
+		mmu_interval_notifier_remove(&notifier->mmu_notifier);
+		xe_vm_put(notifier->vm);
+		kfree(notifier);
+		return -ENOENT;
+	}
+
+	/* Add to list - check again for concurrent registration race */
+	mutex_lock(&vm->svm.madvise_notifiers.lock);
+	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
+		if (existing->vma_start == start && existing->vma_end == end) {
+			mutex_unlock(&vm->svm.madvise_notifiers.lock);
+			mmu_interval_notifier_remove(&notifier->mmu_notifier);
+			xe_vm_put(notifier->vm);
+			kfree(notifier);
+			return 0;
+		}
+	}
+	list_add(&notifier->list, &vm->svm.madvise_notifiers.list);
+	mutex_unlock(&vm->svm.madvise_notifiers.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index b0e1fc445f23..ba9cd7912113 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -6,10 +6,18 @@
 #ifndef _XE_VM_MADVISE_H_
 #define _XE_VM_MADVISE_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
+struct xe_vm;
+struct xe_vma;
 
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
+int xe_vm_madvise_init(struct xe_vm *vm);
+void xe_vm_madvise_fini(struct xe_vm *vm);
+int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 29ff63503d4c..eb978995000c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -12,6 +12,7 @@
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
+#include <linux/mempool.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
 
@@ -29,6 +30,26 @@ struct xe_user_fence;
 struct xe_vm;
 struct xe_vm_pgtable_update_op;
 
+/**
+ * struct xe_madvise_notifier - CPU madvise notifier for memory attribute reset
+ *
+ * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
+ * When userspace unmaps CPU memory, this notifier processes attribute reset
+ * via work queue to avoid circular locking (can't take vm->lock in callback).
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
+	/** @list: Link in vm->svm.madvise_notifiers.list */
+	struct list_head list;
+};
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
 #define FORCE_OP_ERROR	BIT(31)
@@ -212,6 +233,26 @@ struct xe_vm {
 		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
 		/** @svm.peer: Used for pagemap connectivity computations. */
 		struct drm_pagemap_peer peer;
+
+		/**
+		 * @svm.madvise_notifiers: Active CPU madvise notifiers
+		 */
+		struct {
+			/** @svm.madvise_notifiers.list: List of active notifiers */
+			struct list_head list;
+			/** @svm.madvise_notifiers.lock: Protects notifiers list */
+			struct mutex lock;
+		} madvise_notifiers;
+
+		/** @svm.madvise_work: Workqueue for async munmap processing */
+		struct {
+			/** @svm.madvise_work.wq: Workqueue */
+			struct workqueue_struct *wq;
+			/** @svm.madvise_work.pool: Mempool for work items */
+			mempool_t *pool;
+			/** @svm.madvise_work.closing: Teardown flag */
+			atomic_t closing;
+		} madvise_work;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.43.0

