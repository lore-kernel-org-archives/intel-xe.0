Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3322C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 06:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7657F10EA3B;
	Thu, 27 Feb 2025 06:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I26nIdjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED18610EA3B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740638861; x=1772174861;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H/c8xhuoXtkU5jW9tidnDDejFLs7ekOdBVuKz27OEi4=;
 b=I26nIdjck8mAi0kBOKhhRCDos4mNq7fOObgaHqEfClijoV2vF2LEXg+n
 A44dX0NB9gt1iq5hZ6S6tFuTc5OaA/qVwQ1cXltqEUi2akGEJS9Vx73WK
 +Nh8qVQ18irvIsUBu24ZjIjxLCywsH/cJPsXRxZPF1C3Q6yTge01WGdxy
 TTTthrjN0zgNR5W4creEs398voyqHOeogrcj63FYTxa2rWg1dPhh+QgEf
 ArXZA6KLOSkk/SZtTptTQzVw510gQxWUIDYP3GVAVHPX4RlA+0z5xNd0L
 8Nwf73Nob/TAnlROMULGG71zocbYTtj85DbIaPZPGhG4brJYIfzcsJZi/ w==;
X-CSE-ConnectionGUID: issUg928RHWD14LNsm/b3A==
X-CSE-MsgGUID: 28txySaITKGf6j8mw01pTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63982641"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="63982641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 22:47:39 -0800
X-CSE-ConnectionGUID: +NOnKI9WSS2HUIvnAoiT4w==
X-CSE-MsgGUID: v1XbqjqHRuaJ4p56DjqARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="116938518"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 22:47:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7] drm/xe: SVM squash for CI
Date: Wed, 26 Feb 2025 22:48:42 -0800
Message-Id: <20250227064842.3352539-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Fixing Kconfig issues, kernel doc, sending for CI. Do not review.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst            |   84 +
 Documentation/gpu/rfc/index.rst             |    4 +
 drivers/gpu/drm/Kconfig                     |    9 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_gpusvm.c                | 2236 +++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/xe_bo.c                  |   54 +
 drivers/gpu/drm/xe/xe_bo.h                  |   20 +
 drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
 drivers/gpu/drm/xe/xe_device.c              |    3 +
 drivers/gpu/drm/xe/xe_device_types.h        |   22 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   18 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   22 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
 drivers/gpu/drm/xe/xe_migrate.h             |   10 +
 drivers/gpu/drm/xe/xe_module.c              |    7 +
 drivers/gpu/drm/xe/xe_module.h              |    2 +
 drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
 drivers/gpu/drm/xe/xe_pt.h                  |    5 +
 drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_query.c               |    5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h          |  123 +-
 drivers/gpu/drm/xe/xe_svm.c                 |  946 ++++++++
 drivers/gpu/drm/xe/xe_svm.h                 |  150 ++
 drivers/gpu/drm/xe/xe_tile.c                |    5 +
 drivers/gpu/drm/xe/xe_vm.c                  |  386 +++-
 drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
 include/drm/drm_gpusvm.h                    |  509 +++++
 include/drm/drm_gpuvm.h                     |    5 +
 include/drm/drm_pagemap.h                   |  109 +
 include/linux/migrate.h                     |    1 +
 include/uapi/drm/xe_drm.h                   |   22 +-
 mm/memory.c                                 |   13 +-
 mm/migrate_device.c                         |  116 +-
 37 files changed, 5393 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst
 create mode 100644 drivers/gpu/drm/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 include/drm/drm_gpusvm.h
 create mode 100644 include/drm/drm_pagemap.h

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
new file mode 100644
index 000000000000..063412160685
--- /dev/null
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -0,0 +1,84 @@
+===============
+GPU SVM Section
+===============
+
+Agreed upon design principles
+=============================
+
+* migrate_to_ram path
+	* Rely only on core MM concepts (migration PTEs, page references, and
+	  page locking).
+	* No driver specific locks other than locks for hardware interaction in
+	  this path. These are not required and generally a bad idea to
+	  invent driver defined locks to seal core MM races.
+	* Partial migration is supported (i.e., a subset of pages attempting to
+	  migrate can actually migrate, with only the faulting page guaranteed
+	  to migrate).
+	* Driver handles mixed migrations via retry loops rather than locking.
+* Eviction
+	* Only looking at physical memory data structures and locks as opposed to
+	  looking at virtual memory data structures and locks.
+	* No looking at mm/vma structs or relying on those being locked.
+* GPU fault side
+	* mmap_read only used around core MM functions which require this lock
+	  and should strive to take mmap_read lock only in GPU SVM layer.
+	* Big retry loop to handle all races with the mmu notifier under the gpu
+	  pagetable locks/mmu notifier range lock/whatever we end up calling
+          those.
+	* Races (especially against concurrent eviction or migrate_to_ram)
+	  should not be handled on the fault side by trying to hold locks;
+	  rather, they should be handled using retry loops. One possible
+	  exception is holding a BO's dma-resv lock during the initial migration
+	  to VRAM, as this is a well-defined lock that can be taken underneath
+	  the mmap_read lock.
+* Physical memory to virtual backpointer
+	* Does not work, no pointers from physical memory to virtual should
+	  exist.
+	* Physical memory backpointer (page->zone_device_data) should be stable
+	  from allocation to page free.
+* GPU pagetable locking
+	* Notifier lock only protects range tree, pages valid state for a range
+	  (rather than seqno due to wider notifiers), pagetable entries, and
+	  mmu notifier seqno tracking, it is not a global lock to protect
+          against races.
+	* All races handled with big retry as mentioned above.
+
+Overview of current design
+==========================
+
+Baseline design is simple as possible to get a working basline in which can be
+built upon.
+
+.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
+   :doc: Overview
+   :doc: Locking
+   :doc: Migrataion
+   :doc: Partial Unmapping of Ranges
+   :doc: Examples
+
+Possible future design features
+===============================
+
+* Concurrent GPU faults
+	* CPU faults are concurrent so makes sense to have concurrent GPU
+	  faults.
+	* Should be possible with fined grained locking in the driver GPU
+	  fault handler.
+	* No expected GPU SVM changes required.
+* Ranges with mixed system and device pages
+	* Can be added if required to drm_gpusvm_get_pages fairly easily.
+* Multi-GPU support
+	* Work in progress and patches expected after initially landing on GPU
+	  SVM.
+	* Ideally can be done with little to no changes to GPU SVM.
+* Drop ranges in favor of radix tree
+	* May be desirable for faster notifiers.
+* Compound device pages
+	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
+	  migrate device layer are a performance bottleneck, having compound
+	  device pages should help increase performance by reducing the number
+	  of these expensive calls.
+* Higher order dma mapping for migration
+	* 4k dma mapping adversely affects migration performance on Intel
+	  hardware, higher order (2M) dma mapping should help here.
+* Build common userptr implementation on top of GPU SVM
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 476719771eef..396e535377fb 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -16,6 +16,10 @@ host such documentation:
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
 
+.. toctree::
+
+    gpusvm.rst
+
 .. toctree::
 
     i915_gem_lmem.rst
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d9986fd52194..693f338e5b28 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -278,6 +278,15 @@ config DRM_GPUVM
 	  GPU-VM representation providing helpers to manage a GPUs virtual
 	  address space
 
+config DRM_GPUSVM
+	tristate
+	depends on DRM && DEVICE_PRIVATE
+	select HMM_MIRROR
+	select MMU_NOTIFIER
+	help
+	  GPU-SVM representation providing helpers to manage a GPUs shared
+	  virtual memory
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 50604b49d1ac..186b611a88b5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
+obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
new file mode 100644
index 000000000000..f314f5c4af0f
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -0,0 +1,2236 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ *
+ * Authors:
+ *     Matthew Brost <matthew.brost@intel.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/hmm.h>
+#include <linux/memremap.h>
+#include <linux/migrate.h>
+#include <linux/mm_types.h>
+#include <linux/pagemap.h>
+#include <linux/slab.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
+#include <drm/drm_print.h>
+
+/**
+ * DOC: Overview
+ *
+ * GPU Shared Virtual Memory (GPU SVM) layer for the Direct Rendering Manager (DRM)
+ *
+ * The GPU SVM layer is a component of the DRM framework designed to manage shared
+ * virtual memory between the CPU and GPU. It enables efficient data exchange and
+ * processing for GPU-accelerated applications by allowing memory sharing and
+ * synchronization between the CPU's and GPU's virtual address spaces.
+ *
+ * Key GPU SVM Components:
+ * - Notifiers: Notifiers: Used for tracking memory intervals and notifying the
+ *		GPU of changes, notifiers are sized based on a GPU SVM
+ *		initialization parameter, with a recommendation of 512M or
+ *		larger. They maintain a Red-BlacK tree and a list of ranges that
+ *		fall within the notifier interval. Notifiers are tracked within
+ *		a GPU SVM Red-BlacK tree and list and are dynamically inserted
+ *		or removed as ranges within the interval are created or
+ *		destroyed.
+ * - Ranges: Represent memory ranges mapped in a DRM device and managed
+ *	     by GPU SVM. They are sized based on an array of chunk sizes, which
+ *	     is a GPU SVM initialization parameter, and the CPU address space.
+ *	     Upon GPU fault, the largest aligned chunk that fits within the
+ *	     faulting CPU address space is chosen for the range size. Ranges are
+ *	     expected to be dynamically allocated on GPU fault and removed on an
+ *	     MMU notifier UNMAP event. As mentioned above, ranges are tracked in
+ *	     a notifier's Red-Black tree.
+ * - Operations: Define the interface for driver-specific GPU SVM operations
+ *               such as range allocation, notifier allocation, and
+ *               invalidations.
+ * - Device Memory Allocations: Embedded structure containing enough information
+ *                              for GPU SVM to migrate to / from device memory.
+ * - Device Memory Operations: Define the interface for driver-specific device
+ *                             memory operations release memory, populate pfns,
+ *                             and copy to / from device memory.
+ *
+ * This layer provides interfaces for allocating, mapping, migrating, and
+ * releasing memory ranges between the CPU and GPU. It handles all core memory
+ * management interactions (DMA mapping, HMM, and migration) and provides
+ * driver-specific virtual functions (vfuncs). This infrastructure is sufficient
+ * to build the expected driver components for an SVM implementation as detailed
+ * below.
+ *
+ * Expected Driver Components:
+ * - GPU page fault handler: Used to create ranges and notifiers based on the
+ *			     fault address, optionally migrate the range to
+ *			     device memory, and create GPU bindings.
+ * - Garbage collector: Used to unmap and destroy GPU bindings for ranges.
+ *			Ranges are expected to be added to the garbage collector
+ *			upon a MMU_NOTIFY_UNMAP event in notifier callback.
+ * - Notifier callback: Used to invalidate and DMA unmap GPU bindings for
+ *			ranges.
+ */
+
+/**
+ * DOC: Locking
+ *
+ * GPU SVM handles locking for core MM interactions, i.e., it locks/unlocks the
+ * mmap lock as needed.
+ *
+ * GPU SVM introduces a global notifier lock, which safeguards the notifier's
+ * range RB tree and list, as well as the range's DMA mappings and sequence
+ * number. GPU SVM manages all necessary locking and unlocking operations,
+ * except for the recheck range's pages being valid
+ * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings. This
+ * lock corresponds to the 'driver->update' lock mentioned in the HMM
+ * documentation (TODO: Link). Future revisions may transition from a GPU SVM
+ * global lock to a per-notifier lock if finer-grained locking is deemed
+ * necessary.
+ *
+ * In addition to the locking mentioned above, the driver should implement a
+ * lock to safeguard core GPU SVM function calls that modify state, such as
+ * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove. This lock is
+ * denoted as 'driver_svm_lock' in code examples. Finer grained driver side
+ * locking should also be possible for concurrent GPU fault processing within a
+ * single GPU SVM. The 'driver_svm_lock' can be via drm_gpusvm_driver_set_lock
+ * to add annotations to GPU SVM.
+ */
+
+/**
+ * DOC: Migration
+ *
+ * The migration support is quite simple, allowing migration between RAM and
+ * device memory at the range granularity. For example, GPU SVM currently does not
+ * support mixing RAM and device memory pages within a range. This means that upon GPU
+ * fault, the entire range can be migrated to device memory, and upon CPU fault, the
+ * entire range is migrated to RAM. Mixed RAM and device memory storage within a range
+ * could be added in the future if required.
+ *
+ * The reasoning for only supporting range granularity is as follows: it
+ * simplifies the implementation, and range sizes are driver-defined and should
+ * be relatively small.
+ */
+
+/**
+ * DOC: Partial Unmapping of Ranges
+ *
+ * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by CPU resulting
+ * in MMU_NOTIFY_UNMAP event) presents several challenges, with the main one
+ * being that a subset of the range still has CPU and GPU mappings. If the
+ * backing store for the range is in device memory, a subset of the backing store has
+ * references. One option would be to split the range and device memory backing store,
+ * but the implementation for this would be quite complicated. Given that
+ * partial unmappings are rare and driver-defined range sizes are relatively
+ * small, GPU SVM does not support splitting of ranges.
+ *
+ * With no support for range splitting, upon partial unmapping of a range, the
+ * driver is expected to invalidate and destroy the entire range. If the range
+ * has device memory as its backing, the driver is also expected to migrate any
+ * remaining pages back to RAM.
+ */
+
+/**
+ * DOC: Examples
+ *
+ * This section provides three examples of how to build the expected driver
+ * components: the GPU page fault handler, the garbage collector, and the
+ * notifier callback.
+ *
+ * The generic code provided does not include logic for complex migration
+ * policies, optimized invalidations, fined grained driver locking, or other
+ * potentially required driver locking (e.g., DMA-resv locks).
+ *
+ * 1) GPU page fault handler
+ *
+ *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
+ *	{
+ *		int err = 0;
+ *
+ *		driver_alloc_and_setup_memory_for_bind(gpusvm, range);
+ *
+ *		drm_gpusvm_notifier_lock(gpusvm);
+ *		if (drm_gpusvm_range_pages_valid(range))
+ *			driver_commit_bind(gpusvm, range);
+ *		else
+ *			err = -EAGAIN;
+ *		drm_gpusvm_notifier_unlock(gpusvm);
+ *
+ *		return err;
+ *	}
+ *
+ *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, unsigned long fault_addr,
+ *			     unsigned long gpuva_start, unsigned long gpuva_end)
+ *	{
+ *		struct drm_gpusvm_ctx ctx = {};
+ *		int err;
+ *
+ *		driver_svm_lock();
+ *	retry:
+ *		// Always process UNMAPs first so view of GPU SVM ranges is current
+ *		driver_garbage_collector(gpusvm);
+ *
+ *		range = drm_gpusvm_range_find_or_insert(gpusvm, fault_addr,
+ *							gpuva_start, gpuva_end,
+ *						        &ctx);
+ *		if (IS_ERR(range)) {
+ *			err = PTR_ERR(range);
+ *			goto unlock;
+ *		}
+ *
+ *		if (driver_migration_policy(range)) {
+ *			mmap_read_lock(mm);
+ *			devmem = driver_alloc_devmem();
+ *			err = drm_gpusvm_migrate_to_devmem(gpusvm, range,
+ *							   devmem_allocation,
+ *							   &ctx);
+ *			mmap_read_unlock(mm);
+ *			if (err)	// CPU mappings may have changed
+ *				goto retry;
+ *		}
+ *
+ *		err = drm_gpusvm_range_get_pages(gpusvm, range, &ctx);
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed
+ *			if (err == -EOPNOTSUPP)
+ *				drm_gpusvm_range_evict(gpusvm, range);
+ *			goto retry;
+ *		} else if (err) {
+ *			goto unlock;
+ *		}
+ *
+ *		err = driver_bind_range(gpusvm, range);
+ *		if (err == -EAGAIN)	// CPU mappings changed
+ *			goto retry
+ *
+ *	unlock:
+ *		driver_svm_unlock();
+ *		return err;
+ *	}
+ *
+ * 2) Garbage Collector.
+ *
+ *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
+ *					struct drm_gpusvm_range *range)
+ *	{
+ *		assert_driver_svm_locked(gpusvm);
+ *
+ *		// Partial unmap, migrate any remaining device memory pages back to RAM
+ *		if (range->flags.partial_unmap)
+ *			drm_gpusvm_range_evict(gpusvm, range);
+ *
+ *		driver_unbind_range(range);
+ *		drm_gpusvm_range_remove(gpusvm, range);
+ *	}
+ *
+ *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
+ *	{
+ *		assert_driver_svm_locked(gpusvm);
+ *
+ *		for_each_range_in_garbage_collector(gpusvm, range)
+ *			__driver_garbage_collector(gpusvm, range);
+ *	}
+ *
+ * 3) Notifier callback.
+ *
+ *	void driver_invalidation(struct drm_gpusvm *gpusvm,
+ *				 struct drm_gpusvm_notifier *notifier,
+ *				 const struct mmu_notifier_range *mmu_range)
+ *	{
+ *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
+ *		struct drm_gpusvm_range *range = NULL;
+ *
+ *		driver_invalidate_device_pages(gpusvm, mmu_range->start, mmu_range->end);
+ *
+ *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
+ *					  mmu_range->end) {
+ *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
+ *
+ *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
+ *				continue;
+ *
+ *			drm_gpusvm_range_set_unmapped(range, mmu_range);
+ *			driver_garbage_collector_add(gpusvm, range);
+ *		}
+ *	}
+ */
+
+/**
+ * npages_in_range() - Calculate the number of pages in a given range
+ * @start: The start address of the range
+ * @end: The end address of the range
+ *
+ * This macro calculates the number of pages in a given memory range,
+ * specified by the start and end addresses. It divides the difference
+ * between the end and start addresses by the page size (PAGE_SIZE) to
+ * determine the number of pages in the range.
+ *
+ * Return: The number of pages in the specified range.
+ */
+static unsigned long
+npages_in_range(unsigned long start, unsigned long end)
+{
+	return (end - start) >> PAGE_SHIFT;
+}
+
+/**
+ * struct drm_gpusvm_zdd - GPU SVM zone device data
+ *
+ * @refcount: Reference count for the zdd
+ * @devmem_allocation: device memory allocation
+ * @device_private_page_owner: Device private pages owner
+ *
+ * This structure serves as a generic wrapper installed in
+ * page->zone_device_data. It provides infrastructure for looking up a device
+ * memory allocation upon CPU page fault and asynchronously releasing device
+ * memory once the CPU has no page references. Asynchronous release is useful
+ * because CPU page references can be dropped in IRQ contexts, while releasing
+ * device memory likely requires sleeping locks.
+ */
+struct drm_gpusvm_zdd {
+	struct kref refcount;
+	struct drm_gpusvm_devmem *devmem_allocation;
+	void *device_private_page_owner;
+};
+
+/**
+ * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
+ * @device_private_page_owner: Device private pages owner
+ *
+ * This function allocates and initializes a new zdd structure. It sets up the
+ * reference count and initializes the destroy work.
+ *
+ * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
+ */
+static struct drm_gpusvm_zdd *
+drm_gpusvm_zdd_alloc(void *device_private_page_owner)
+{
+	struct drm_gpusvm_zdd *zdd;
+
+	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
+	if (!zdd)
+		return NULL;
+
+	kref_init(&zdd->refcount);
+	zdd->devmem_allocation = NULL;
+	zdd->device_private_page_owner = device_private_page_owner;
+
+	return zdd;
+}
+
+/**
+ * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
+ * @zdd: Pointer to the zdd structure.
+ *
+ * This function increments the reference count of the provided zdd structure.
+ *
+ * Return: Pointer to the zdd structure.
+ */
+static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
+{
+	kref_get(&zdd->refcount);
+	return zdd;
+}
+
+/**
+ * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
+ * @ref: Pointer to the reference count structure.
+ *
+ * This function queues the destroy_work of the zdd for asynchronous destruction.
+ */
+static void drm_gpusvm_zdd_destroy(struct kref *ref)
+{
+	struct drm_gpusvm_zdd *zdd =
+		container_of(ref, struct drm_gpusvm_zdd, refcount);
+	struct drm_gpusvm_devmem *devmem = zdd->devmem_allocation;
+
+	if (devmem) {
+		complete_all(&devmem->detached);
+		if (devmem->ops->devmem_release)
+			devmem->ops->devmem_release(devmem);
+	}
+	kfree(zdd);
+}
+
+/**
+ * drm_gpusvm_zdd_put() - Put a zdd reference.
+ * @zdd: Pointer to the zdd structure.
+ *
+ * This function decrements the reference count of the provided zdd structure
+ * and schedules its destruction if the count drops to zero.
+ */
+static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
+{
+	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
+}
+
+/**
+ * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
+ * @notifier: Pointer to the GPU SVM notifier structure.
+ * @start: Start address of the range
+ * @end: End address of the range
+ *
+ * Return: A pointer to the drm_gpusvm_range if found or NULL
+ */
+struct drm_gpusvm_range *
+drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
+		      unsigned long end)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_range, itree);
+	else
+		return NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
+
+/**
+ * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
+ * @range__: Iterator variable for the ranges
+ * @next__: Iterator variable for the ranges temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the range
+ * @end__: End address of the range
+ *
+ * This macro is used to iterate over GPU SVM ranges in a notifier while
+ * removing ranges from it.
+ */
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
+
+/**
+ * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
+ * @notifier: a pointer to the current drm_gpusvm_notifier
+ *
+ * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
+ *         the current notifier is the last one or if the input notifier is
+ *         NULL.
+ */
+static struct drm_gpusvm_notifier *
+__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
+{
+	if (notifier && !list_is_last(&notifier->entry,
+				      &notifier->gpusvm->notifier_list))
+		return list_next_entry(notifier, entry);
+
+	return NULL;
+}
+
+static struct drm_gpusvm_notifier *
+notifier_iter_first(struct rb_root_cached *root, unsigned long start,
+		    unsigned long last)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(root, start, last);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
+	else
+		return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
+ * @mni: Pointer to the mmu_interval_notifier structure.
+ * @mmu_range: Pointer to the mmu_notifier_range structure.
+ * @cur_seq: Current sequence number.
+ *
+ * This function serves as a generic MMU notifier for GPU SVM. It sets the MMU
+ * notifier sequence number and calls the driver invalidate vfunc under
+ * gpusvm->notifier_lock.
+ *
+ * Return: true if the operation succeeds, false otherwise.
+ */
+static bool
+drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
+			       const struct mmu_notifier_range *mmu_range,
+			       unsigned long cur_seq)
+{
+	struct drm_gpusvm_notifier *notifier =
+		container_of(mni, typeof(*notifier), notifier);
+	struct drm_gpusvm *gpusvm = notifier->gpusvm;
+
+	if (!mmu_notifier_range_blockable(mmu_range))
+		return false;
+
+	down_write(&gpusvm->notifier_lock);
+	mmu_interval_set_seq(mni, cur_seq);
+	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
+	up_write(&gpusvm->notifier_lock);
+
+	return true;
+}
+
+/**
+ * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
+ */
+static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
+	.invalidate = drm_gpusvm_notifier_invalidate,
+};
+
+/**
+ * drm_gpusvm_init() - Initialize the GPU SVM.
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @name: Name of the GPU SVM.
+ * @drm: Pointer to the DRM device structure.
+ * @mm: Pointer to the mm_struct for the address space.
+ * @device_private_page_owner: Device private pages owner.
+ * @mm_start: Start address of GPU SVM.
+ * @mm_range: Range of the GPU SVM.
+ * @notifier_size: Size of individual notifiers.
+ * @ops: Pointer to the operations structure for GPU SVM.
+ * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
+ *               Entries should be powers of 2 in descending order with last
+ *               entry being SZ_4K.
+ * @num_chunks: Number of chunks.
+ *
+ * This function initializes the GPU SVM.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
+		    const char *name, struct drm_device *drm,
+		    struct mm_struct *mm, void *device_private_page_owner,
+		    unsigned long mm_start, unsigned long mm_range,
+		    unsigned long notifier_size,
+		    const struct drm_gpusvm_ops *ops,
+		    const unsigned long *chunk_sizes, int num_chunks)
+{
+	if (!ops->invalidate || !num_chunks)
+		return -EINVAL;
+
+	gpusvm->name = name;
+	gpusvm->drm = drm;
+	gpusvm->mm = mm;
+	gpusvm->device_private_page_owner = device_private_page_owner;
+	gpusvm->mm_start = mm_start;
+	gpusvm->mm_range = mm_range;
+	gpusvm->notifier_size = notifier_size;
+	gpusvm->ops = ops;
+	gpusvm->chunk_sizes = chunk_sizes;
+	gpusvm->num_chunks = num_chunks;
+
+	mmgrab(mm);
+	gpusvm->root = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&gpusvm->notifier_list);
+
+	init_rwsem(&gpusvm->notifier_lock);
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&gpusvm->notifier_lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+#ifdef CONFIG_LOCKDEP
+	gpusvm->lock_dep_map = NULL;
+#endif
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_init);
+
+/**
+ * drm_gpusvm_notifier_find() - Find GPU SVM notifier
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @fault_addr: Fault address
+ *
+ * This function finds the GPU SVM notifier associated with the fault address.
+ *
+ * Return: Pointer to the GPU SVM notifier on success, NULL otherwise.
+ */
+static struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
+			 unsigned long fault_addr)
+{
+	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
+}
+
+/**
+ * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
+ * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
+ *
+ * Return: A pointer to the containing drm_gpusvm_notifier structure.
+ */
+static struct drm_gpusvm_notifier *to_drm_gpusvm_notifier(struct rb_node *node)
+{
+	return container_of(node, struct drm_gpusvm_notifier, itree.rb);
+}
+
+/**
+ * drm_gpusvm_notifier_insert() - Insert GPU SVM notifier
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ *
+ * This function inserts the GPU SVM notifier into the GPU SVM RB tree and list.
+ */
+static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
+				       struct drm_gpusvm_notifier *notifier)
+{
+	struct rb_node *node;
+	struct list_head *head;
+
+	interval_tree_insert(&notifier->itree, &gpusvm->root);
+
+	node = rb_prev(&notifier->itree.rb);
+	if (node)
+		head = &(to_drm_gpusvm_notifier(node))->entry;
+	else
+		head = &gpusvm->notifier_list;
+
+	list_add(&notifier->entry, head);
+}
+
+/**
+ * drm_gpusvm_notifier_remove() - Remove GPU SVM notifier
+ * @gpusvm: Pointer to the GPU SVM tructure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ *
+ * This function removes the GPU SVM notifier from the GPU SVM RB tree and list.
+ */
+static void drm_gpusvm_notifier_remove(struct drm_gpusvm *gpusvm,
+				       struct drm_gpusvm_notifier *notifier)
+{
+	interval_tree_remove(&notifier->itree, &gpusvm->root);
+	list_del(&notifier->entry);
+}
+
+/**
+ * drm_gpusvm_fini() - Finalize the GPU SVM.
+ * @gpusvm: Pointer to the GPU SVM structure.
+ *
+ * This function finalizes the GPU SVM by cleaning up any remaining ranges and
+ * notifiers, and dropping a reference to struct MM.
+ */
+void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
+{
+	struct drm_gpusvm_notifier *notifier, *next;
+
+	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0, LONG_MAX) {
+		struct drm_gpusvm_range *range, *__next;
+
+		/*
+		 * Remove notifier first to avoid racing with any invalidation
+		 */
+		mmu_interval_notifier_remove(&notifier->notifier);
+		notifier->flags.removed = true;
+
+		drm_gpusvm_for_each_range_safe(range, __next, notifier, 0,
+					       LONG_MAX)
+			drm_gpusvm_range_remove(gpusvm, range);
+	}
+
+	mmdrop(gpusvm->mm);
+	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
+
+/**
+ * drm_gpusvm_notifier_alloc() - Allocate GPU SVM notifier
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @fault_addr: Fault address
+ *
+ * This function allocates and initializes the GPU SVM notifier structure.
+ *
+ * Return: Pointer to the allocated GPU SVM notifier on success, ERR_PTR() on failure.
+ */
+static struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, unsigned long fault_addr)
+{
+	struct drm_gpusvm_notifier *notifier;
+
+	if (gpusvm->ops->notifier_alloc)
+		notifier = gpusvm->ops->notifier_alloc();
+	else
+		notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
+
+	if (!notifier)
+		return ERR_PTR(-ENOMEM);
+
+	notifier->gpusvm = gpusvm;
+	notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
+	notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
+	INIT_LIST_HEAD(&notifier->entry);
+	notifier->root = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&notifier->range_list);
+
+	return notifier;
+}
+
+/**
+ * drm_gpusvm_notifier_free() - Free GPU SVM notifier
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ *
+ * This function frees the GPU SVM notifier structure.
+ */
+static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
+				     struct drm_gpusvm_notifier *notifier)
+{
+	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
+
+	if (gpusvm->ops->notifier_free)
+		gpusvm->ops->notifier_free(notifier);
+	else
+		kfree(notifier);
+}
+
+/**
+ * to_drm_gpusvm_range() - retrieve the container struct for a given rbtree node
+ * @node: a pointer to the rbtree node embedded within a drm_gpusvm_range struct
+ *
+ * Return: A pointer to the containing drm_gpusvm_range structure.
+ */
+static struct drm_gpusvm_range *to_drm_gpusvm_range(struct rb_node *node)
+{
+	return container_of(node, struct drm_gpusvm_range, itree.rb);
+}
+
+/**
+ * drm_gpusvm_range_insert() - Insert GPU SVM range
+ * @notifier: Pointer to the GPU SVM notifier structure
+ * @range: Pointer to the GPU SVM range structure
+ *
+ * This function inserts the GPU SVM range into the notifier RB tree and list.
+ */
+static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier *notifier,
+				    struct drm_gpusvm_range *range)
+{
+	struct rb_node *node;
+	struct list_head *head;
+
+	drm_gpusvm_notifier_lock(notifier->gpusvm);
+	interval_tree_insert(&range->itree, &notifier->root);
+
+	node = rb_prev(&range->itree.rb);
+	if (node)
+		head = &(to_drm_gpusvm_range(node))->entry;
+	else
+		head = &notifier->range_list;
+
+	list_add(&range->entry, head);
+	drm_gpusvm_notifier_unlock(notifier->gpusvm);
+}
+
+/**
+ * __drm_gpusvm_range_remove() - Remove GPU SVM range
+ * @notifier: Pointer to the GPU SVM notifier structure
+ * @range: Pointer to the GPU SVM range structure
+ *
+ * This macro removes the GPU SVM range from the notifier RB tree and list.
+ */
+static void __drm_gpusvm_range_remove(struct drm_gpusvm_notifier *notifier,
+				      struct drm_gpusvm_range *range)
+{
+	interval_tree_remove(&range->itree, &notifier->root);
+	list_del(&range->entry);
+}
+
+/**
+ * drm_gpusvm_range_alloc() - Allocate GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ * @fault_addr: Fault address
+ * @chunk_size: Chunk size
+ * @migrate_devmem: Flag indicating whether to migrate device memory
+ *
+ * This function allocates and initializes the GPU SVM range structure.
+ *
+ * Return: Pointer to the allocated GPU SVM range on success, ERR_PTR() on failure.
+ */
+static struct drm_gpusvm_range *
+drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
+		       struct drm_gpusvm_notifier *notifier,
+		       unsigned long fault_addr, unsigned long chunk_size,
+		       bool migrate_devmem)
+{
+	struct drm_gpusvm_range *range;
+
+	if (gpusvm->ops->range_alloc)
+		range = gpusvm->ops->range_alloc(gpusvm);
+	else
+		range = kzalloc(sizeof(*range), GFP_KERNEL);
+
+	if (!range)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&range->refcount);
+	range->gpusvm = gpusvm;
+	range->notifier = notifier;
+	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
+	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
+	INIT_LIST_HEAD(&range->entry);
+	range->notifier_seq = LONG_MAX;
+	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
+
+	return range;
+}
+
+/**
+ * drm_gpusvm_check_pages() - Check pages
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ * @start: Start address
+ * @end: End address
+ *
+ * Check if pages between start and end have been faulted in on the CPU. Use to
+ * prevent migration of pages without CPU backing store.
+ *
+ * Return: True if pages have been faulted into CPU, False otherwise
+ */
+static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_notifier *notifier,
+				   unsigned long start, unsigned long end)
+{
+	struct hmm_range hmm_range = {
+		.default_flags = 0,
+		.notifier = &notifier->notifier,
+		.start = start,
+		.end = end,
+		.dev_private_owner = gpusvm->device_private_page_owner,
+	};
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns;
+	unsigned long npages = npages_in_range(start, end);
+	int err, i;
+
+	mmap_assert_locked(gpusvm->mm);
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return false;
+
+	hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
+	hmm_range.hmm_pfns = pfns;
+
+	while (true) {
+		err = hmm_range_fault(&hmm_range);
+		if (err == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			hmm_range.notifier_seq =
+				mmu_interval_read_begin(&notifier->notifier);
+			continue;
+		}
+		break;
+	}
+	if (err)
+		goto err_free;
+
+	for (i = 0; i < npages;) {
+		if (!(pfns[i] & HMM_PFN_VALID)) {
+			err = -EFAULT;
+			goto err_free;
+		}
+		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
+	}
+
+err_free:
+	kvfree(pfns);
+	return err ? false : true;
+}
+
+/**
+ * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier structure
+ * @vas: Pointer to the virtual memory area structure
+ * @fault_addr: Fault address
+ * @gpuva_start: Start address of GPUVA which mirrors CPU
+ * @gpuva_end: End address of GPUVA which mirrors CPU
+ * @check_pages_threshold: Check CPU pages for present threshold
+ *
+ * This function determines the chunk size for the GPU SVM range based on the
+ * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
+ * memory area boundaries.
+ *
+ * Return: Chunk size on success, LONG_MAX on failure.
+ */
+static unsigned long
+drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_notifier *notifier,
+			    struct vm_area_struct *vas,
+			    unsigned long fault_addr,
+			    unsigned long gpuva_start,
+			    unsigned long gpuva_end,
+			    unsigned long check_pages_threshold)
+{
+	unsigned long start, end;
+	int i = 0;
+
+retry:
+	for (; i < gpusvm->num_chunks; ++i) {
+		start = ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
+		end = ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
+
+		if (start >= vas->vm_start && end <= vas->vm_end &&
+		    start >= drm_gpusvm_notifier_start(notifier) &&
+		    end <= drm_gpusvm_notifier_end(notifier) &&
+		    start >= gpuva_start && end <= gpuva_end)
+			break;
+	}
+
+	if (i == gpusvm->num_chunks)
+		return LONG_MAX;
+
+	/*
+	 * If allocation more than page, ensure not to overlap with existing
+	 * ranges.
+	 */
+	if (end - start != SZ_4K) {
+		struct drm_gpusvm_range *range;
+
+		range = drm_gpusvm_range_find(notifier, start, end);
+		if (range) {
+			++i;
+			goto retry;
+		}
+
+		/*
+		 * XXX: Only create range on pages CPU has faulted in. Without
+		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
+		 * process-many-malloc' fails. In the failure case, each process
+		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
+		 * ranges. When migrating the SVM ranges, some processes fail in
+		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
+		 * and then upon drm_gpusvm_range_get_pages device pages from
+		 * other processes are collected + faulted in which creates all
+		 * sorts of problems. Unsure exactly how this happening, also
+		 * problem goes away if 'xe_exec_system_allocator --r
+		 * process-many-malloc' mallocs at least 64k at a time.
+		 */
+		if (end - start <= check_pages_threshold &&
+		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
+			++i;
+			goto retry;
+		}
+	}
+
+	return end - start;
+}
+
+#ifdef CONFIG_LOCKDEP
+/**
+ * drm_gpusvm_driver_lock_held() - Assert GPU SVM driver lock is held
+ * @gpusvm: Pointer to the GPU SVM structure.
+ *
+ * Ensure driver lock is held.
+ */
+static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
+{
+	if ((gpusvm)->lock_dep_map)
+		lockdep_assert(lock_is_held_type((gpusvm)->lock_dep_map, 0));
+}
+#else
+static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
+{
+}
+#endif
+
+/**
+ * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @fault_addr: Fault address
+ * @gpuva_start: Start address of GPUVA which mirrors CPU
+ * @gpuva_end: End address of GPUVA which mirrors CPU
+ * @ctx: GPU SVM context
+ *
+ * This function finds or inserts a newly allocated a GPU SVM range based on the
+ * fault address. Caller must hold a lock to protect range lookup and insertion.
+ *
+ * Return: Pointer to the GPU SVM range on success, ERR_PTR() on failure.
+ */
+struct drm_gpusvm_range *
+drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
+				unsigned long fault_addr,
+				unsigned long gpuva_start,
+				unsigned long gpuva_end,
+				const struct drm_gpusvm_ctx *ctx)
+{
+	struct drm_gpusvm_notifier *notifier;
+	struct drm_gpusvm_range *range;
+	struct mm_struct *mm = gpusvm->mm;
+	struct vm_area_struct *vas;
+	bool notifier_alloc = false;
+	unsigned long chunk_size;
+	int err;
+	bool migrate_devmem;
+
+	drm_gpusvm_driver_lock_held(gpusvm);
+
+	if (fault_addr < gpusvm->mm_start ||
+	    fault_addr > gpusvm->mm_start + gpusvm->mm_range)
+		return ERR_PTR(-EINVAL);
+
+	if (!mmget_not_zero(mm))
+		return ERR_PTR(-EFAULT);
+
+	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
+	if (!notifier) {
+		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
+		if (IS_ERR(notifier)) {
+			err = PTR_ERR(notifier);
+			goto err_mmunlock;
+		}
+		notifier_alloc = true;
+		err = mmu_interval_notifier_insert(&notifier->notifier,
+						   mm,
+						   drm_gpusvm_notifier_start(notifier),
+						   drm_gpusvm_notifier_size(notifier),
+						   &drm_gpusvm_notifier_ops);
+		if (err)
+			goto err_notifier;
+	}
+
+	mmap_read_lock(mm);
+
+	vas = vma_lookup(mm, fault_addr);
+	if (!vas) {
+		err = -ENOENT;
+		goto err_notifier_remove;
+	}
+
+	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
+		err = -EPERM;
+		goto err_notifier_remove;
+	}
+
+	range = drm_gpusvm_range_find(notifier, fault_addr, fault_addr + 1);
+	if (range)
+		goto out_mmunlock;
+	/*
+	 * XXX: Short-circuiting migration based on migrate_vma_* current
+	 * limitations. If/when migrate_vma_* add more support, this logic will
+	 * have to change.
+	 */
+	migrate_devmem = ctx->devmem_possible &&
+		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
+
+	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
+						 fault_addr, gpuva_start,
+						 gpuva_end,
+						 ctx->check_pages_threshold);
+	if (chunk_size == LONG_MAX) {
+		err = -EINVAL;
+		goto err_notifier_remove;
+	}
+
+	range = drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr, chunk_size,
+				       migrate_devmem);
+	if (IS_ERR(range)) {
+		err = PTR_ERR(range);
+		goto err_notifier_remove;
+	}
+
+	drm_gpusvm_range_insert(notifier, range);
+	if (notifier_alloc)
+		drm_gpusvm_notifier_insert(gpusvm, notifier);
+
+out_mmunlock:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return range;
+
+err_notifier_remove:
+	mmap_read_unlock(mm);
+	if (notifier_alloc)
+		mmu_interval_notifier_remove(&notifier->notifier);
+err_notifier:
+	if (notifier_alloc)
+		drm_gpusvm_notifier_free(gpusvm, notifier);
+err_mmunlock:
+	mmput(mm);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
+
+/**
+ * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @npages: Number of pages to unmap
+ *
+ * This function unmap pages associated with a GPU SVM range. Assumes and
+ * asserts correct locking is in place when called.
+ */
+static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
+					   struct drm_gpusvm_range *range,
+					   unsigned long npages)
+{
+	unsigned long i, j;
+	struct drm_pagemap *dpagemap = range->dpagemap;
+	struct device *dev = gpusvm->drm->dev;
+
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	if (range->flags.has_dma_mapping) {
+		for (i = 0, j = 0; i < npages; j++) {
+			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
+
+			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
+				dma_unmap_page(dev,
+					       addr->addr,
+					       PAGE_SIZE << addr->order,
+					       addr->dir);
+			else if (dpagemap && dpagemap->ops->device_unmap)
+				dpagemap->ops->device_unmap(dpagemap,
+							    dev, *addr);
+			i += 1 << addr->order;
+		}
+		range->flags.has_devmem_pages = false;
+		range->flags.has_dma_mapping = false;
+		range->dpagemap = NULL;
+	}
+}
+
+/**
+ * drm_gpusvm_range_free_pages() - Free pages associated with a GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ *
+ * This function frees the dma address array associated with a GPU SVM range.
+ */
+static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
+					struct drm_gpusvm_range *range)
+{
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	if (range->dma_addr) {
+		kvfree(range->dma_addr);
+		range->dma_addr = NULL;
+	}
+}
+
+/**
+ * drm_gpusvm_range_remove() - Remove GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range to be removed
+ *
+ * This function removes the specified GPU SVM range and also removes the parent
+ * GPU SVM notifier if no more ranges remain in the notifier. The caller must
+ * hold a lock to protect range and notifier removal.
+ */
+void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
+			     struct drm_gpusvm_range *range)
+{
+	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
+					       drm_gpusvm_range_end(range));
+	struct drm_gpusvm_notifier *notifier;
+
+	drm_gpusvm_driver_lock_held(gpusvm);
+
+	notifier = drm_gpusvm_notifier_find(gpusvm,
+					    drm_gpusvm_range_start(range));
+	if (WARN_ON_ONCE(!notifier))
+		return;
+
+	drm_gpusvm_notifier_lock(gpusvm);
+	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
+	drm_gpusvm_range_free_pages(gpusvm, range);
+	__drm_gpusvm_range_remove(notifier, range);
+	drm_gpusvm_notifier_unlock(gpusvm);
+
+	drm_gpusvm_range_put(range);
+
+	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
+		if (!notifier->flags.removed)
+			mmu_interval_notifier_remove(&notifier->notifier);
+		drm_gpusvm_notifier_remove(gpusvm, notifier);
+		drm_gpusvm_notifier_free(gpusvm, notifier);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_remove);
+
+/**
+ * drm_gpusvm_range_get() - Get a reference to GPU SVM range
+ * @range: Pointer to the GPU SVM range
+ *
+ * This function increments the reference count of the specified GPU SVM range.
+ *
+ * Return: Pointer to the GPU SVM range.
+ */
+struct drm_gpusvm_range *
+drm_gpusvm_range_get(struct drm_gpusvm_range *range)
+{
+	kref_get(&range->refcount);
+
+	return range;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_get);
+
+/**
+ * drm_gpusvm_range_destroy() - Destroy GPU SVM range
+ * @refcount: Pointer to the reference counter embedded in the GPU SVM range
+ *
+ * This function destroys the specified GPU SVM range when its reference count
+ * reaches zero. If a custom range-free function is provided, it is invoked to
+ * free the range; otherwise, the range is deallocated using kfree().
+ */
+static void drm_gpusvm_range_destroy(struct kref *refcount)
+{
+	struct drm_gpusvm_range *range =
+		container_of(refcount, struct drm_gpusvm_range, refcount);
+	struct drm_gpusvm *gpusvm = range->gpusvm;
+
+	if (gpusvm->ops->range_free)
+		gpusvm->ops->range_free(range);
+	else
+		kfree(range);
+}
+
+/**
+ * drm_gpusvm_range_put() - Put a reference to GPU SVM range
+ * @range: Pointer to the GPU SVM range
+ *
+ * This function decrements the reference count of the specified GPU SVM range
+ * and frees it when the count reaches zero.
+ */
+void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
+{
+	kref_put(&range->refcount, drm_gpusvm_range_destroy);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
+
+/**
+ * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ *
+ * This function determines if a GPU SVM range pages are valid. Expected be
+ * called holding gpusvm->notifier_lock and as the last step before committing a
+ * GPU binding. This is akin to a notifier seqno check in the HMM documentation
+ * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
+ * function is required for finer grained checking (i.e., per range) if pages
+ * are valid.
+ *
+ * Return: True if GPU SVM range has valid pages, False otherwise
+ */
+bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
+				  struct drm_gpusvm_range *range)
+{
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
+
+/**
+ * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ *
+ * This function determines if a GPU SVM range pages are valid. Expected be
+ * called without holding gpusvm->notifier_lock.
+ *
+ * Return: True if GPU SVM range has valid pages, False otherwise
+ */
+static bool
+drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
+				      struct drm_gpusvm_range *range)
+{
+	bool pages_valid;
+
+	if (!range->dma_addr)
+		return false;
+
+	drm_gpusvm_notifier_lock(gpusvm);
+	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
+	if (!pages_valid)
+		drm_gpusvm_range_free_pages(gpusvm, range);
+	drm_gpusvm_notifier_unlock(gpusvm);
+
+	return pages_valid;
+}
+
+/**
+ * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a GPU SVM range and ensures they are mapped for
+ * DMA access.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
+			       struct drm_gpusvm_range *range,
+			       const struct drm_gpusvm_ctx *ctx)
+{
+	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
+	struct hmm_range hmm_range = {
+		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
+			HMM_PFN_REQ_WRITE),
+		.notifier = notifier,
+		.start = drm_gpusvm_range_start(range),
+		.end = drm_gpusvm_range_end(range),
+		.dev_private_owner = gpusvm->device_private_page_owner,
+	};
+	struct mm_struct *mm = gpusvm->mm;
+	struct drm_gpusvm_zdd *zdd;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long i, j;
+	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
+					       drm_gpusvm_range_end(range));
+	unsigned long num_dma_mapped;
+	unsigned int order = 0;
+	unsigned long *pfns;
+	struct page **pages;
+	int err = 0;
+	struct dev_pagemap *pagemap;
+	struct drm_pagemap *dpagemap;
+
+retry:
+	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
+	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
+		goto set_seqno;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return -ENOMEM;
+
+	if (!mmget_not_zero(mm)) {
+		err = -EFAULT;
+		goto err_free;
+	}
+
+	hmm_range.hmm_pfns = pfns;
+	while (true) {
+		mmap_read_lock(mm);
+		err = hmm_range_fault(&hmm_range);
+		mmap_read_unlock(mm);
+
+		if (err == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			hmm_range.notifier_seq =
+				mmu_interval_read_begin(notifier);
+			continue;
+		}
+		break;
+	}
+	mmput(mm);
+	if (err)
+		goto err_free;
+
+	pages = (struct page **)pfns;
+map_pages:
+	/*
+	 * Perform all dma mappings under the notifier lock to not
+	 * access freed pages. A notifier will either block on
+	 * the notifier lock or unmap dma.
+	 */
+	drm_gpusvm_notifier_lock(gpusvm);
+
+	if (range->flags.unmapped) {
+		drm_gpusvm_notifier_unlock(gpusvm);
+		err = -EFAULT;
+		goto err_free;
+	}
+
+	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
+		drm_gpusvm_notifier_unlock(gpusvm);
+		kvfree(pfns);
+		goto retry;
+	}
+
+	if (!range->dma_addr) {
+		/* Unlock and restart mapping to allocate memory. */
+		drm_gpusvm_notifier_unlock(gpusvm);
+		range->dma_addr = kvmalloc_array(npages,
+						 sizeof(*range->dma_addr),
+						 GFP_KERNEL);
+		if (!range->dma_addr) {
+			err = -ENOMEM;
+			goto err_free;
+		}
+		goto map_pages;
+	}
+
+	zdd = NULL;
+	num_dma_mapped = 0;
+	for (i = 0, j = 0; i < npages; ++j) {
+		struct page *page = hmm_pfn_to_page(pfns[i]);
+
+		order = hmm_pfn_to_map_order(pfns[i]);
+		if (is_device_private_page(page) ||
+		    is_device_coherent_page(page)) {
+			if (zdd != page->zone_device_data && i > 0) {
+				err = -EOPNOTSUPP;
+				goto err_unmap;
+			}
+			zdd = page->zone_device_data;
+			if (pagemap != page->pgmap) {
+				if (i > 0) {
+					err = -EOPNOTSUPP;
+					goto err_unmap;
+				}
+
+				pagemap = page->pgmap;
+				dpagemap = zdd->devmem_allocation->dpagemap;
+				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
+					/*
+					 * Raced. This is not supposed to happen
+					 * since hmm_range_fault() should've migrated
+					 * this page to system.
+					 */
+					err = -EAGAIN;
+					goto err_unmap;
+				}
+			}
+			range->dma_addr[j] =
+				dpagemap->ops->device_map(dpagemap,
+							  gpusvm->drm->dev,
+							  page, order,
+							  DMA_BIDIRECTIONAL);
+			if (dma_mapping_error(gpusvm->drm->dev,
+					      range->dma_addr[j].addr)) {
+				err = -EFAULT;
+				goto err_unmap;
+			}
+
+			pages[i] = page;
+		} else {
+			dma_addr_t addr;
+
+			if (is_zone_device_page(page) || zdd) {
+				err = -EOPNOTSUPP;
+				goto err_unmap;
+			}
+
+			addr = dma_map_page(gpusvm->drm->dev,
+					    page, 0,
+					    PAGE_SIZE << order,
+					    DMA_BIDIRECTIONAL);
+			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
+				err = -EFAULT;
+				goto err_unmap;
+			}
+
+			range->dma_addr[j] = drm_pagemap_device_addr_encode
+				(addr, DRM_INTERCONNECT_SYSTEM, order,
+				 DMA_BIDIRECTIONAL);
+		}
+		i += 1 << order;
+		num_dma_mapped = i;
+	}
+
+	range->flags.has_dma_mapping = true;
+	if (zdd) {
+		range->flags.has_devmem_pages = true;
+		range->dpagemap = dpagemap;
+	}
+
+	drm_gpusvm_notifier_unlock(gpusvm);
+	kvfree(pfns);
+set_seqno:
+	range->notifier_seq = hmm_range.notifier_seq;
+
+	return 0;
+
+err_unmap:
+	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
+	drm_gpusvm_notifier_unlock(gpusvm);
+err_free:
+	kvfree(pfns);
+	if (err == -EAGAIN)
+		goto retry;
+	return err;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
+
+/**
+ * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function unmaps pages associated with a GPU SVM range. If @in_notifier
+ * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
+ * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
+ * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
+ * security model.
+ */
+void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
+				  struct drm_gpusvm_range *range,
+				  const struct drm_gpusvm_ctx *ctx)
+{
+	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
+					       drm_gpusvm_range_end(range));
+
+	if (ctx->in_notifier)
+		lockdep_assert_held_write(&gpusvm->notifier_lock);
+	else
+		drm_gpusvm_notifier_lock(gpusvm);
+
+	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
+
+	if (!ctx->in_notifier)
+		drm_gpusvm_notifier_unlock(gpusvm);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
+
+/**
+ * drm_gpusvm_migration_unlock_put_page() - Put a migration page
+ * @page: Pointer to the page to put
+ *
+ * This function unlocks and puts a page.
+ */
+static void drm_gpusvm_migration_unlock_put_page(struct page *page)
+{
+	unlock_page(page);
+	put_page(page);
+}
+
+/**
+ * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
+ * @npages: Number of pages
+ * @migrate_pfn: Array of migrate page frame numbers
+ *
+ * This function unlocks and puts an array of pages.
+ */
+static void drm_gpusvm_migration_unlock_put_pages(unsigned long npages,
+						  unsigned long *migrate_pfn)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page;
+
+		if (!migrate_pfn[i])
+			continue;
+
+		page = migrate_pfn_to_page(migrate_pfn[i]);
+		drm_gpusvm_migration_unlock_put_page(page);
+		migrate_pfn[i] = 0;
+	}
+}
+
+/**
+ * drm_gpusvm_get_devmem_page() - Get a reference to a device memory page
+ * @page: Pointer to the page
+ * @zdd: Pointer to the GPU SVM zone device data
+ *
+ * This function associates the given page with the specified GPU SVM zone
+ * device data and initializes it for zone device usage.
+ */
+static void drm_gpusvm_get_devmem_page(struct page *page,
+				       struct drm_gpusvm_zdd *zdd)
+{
+	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
+	zone_device_page_init(page);
+}
+
+/**
+ * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
+ * @dev: The device for which the pages are being mapped
+ * @dma_addr: Array to store DMA addresses corresponding to mapped pages
+ * @migrate_pfn: Array of migrate page frame numbers to map
+ * @npages: Number of pages to map
+ * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ *
+ * This function maps pages of memory for migration usage in GPU SVM. It
+ * iterates over each page frame number provided in @migrate_pfn, maps the
+ * corresponding page, and stores the DMA address in the provided @dma_addr
+ * array.
+ *
+ * Return: 0 on success, -EFAULT if an error occurs during mapping.
+ */
+static int drm_gpusvm_migrate_map_pages(struct device *dev,
+					dma_addr_t *dma_addr,
+					unsigned long *migrate_pfn,
+					unsigned long npages,
+					enum dma_data_direction dir)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+
+		if (!page)
+			continue;
+
+		if (WARN_ON_ONCE(is_zone_device_page(page)))
+			return -EFAULT;
+
+		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		if (dma_mapping_error(dev, dma_addr[i]))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
+ * @dev: The device for which the pages were mapped
+ * @dma_addr: Array of DMA addresses corresponding to mapped pages
+ * @npages: Number of pages to unmap
+ * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ *
+ * This function unmaps previously mapped pages of memory for GPU Shared Virtual
+ * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
+ * if it's valid and not already unmapped, and unmaps the corresponding page.
+ */
+static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
+					   dma_addr_t *dma_addr,
+					   unsigned long npages,
+					   enum dma_data_direction dir)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i) {
+		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+			continue;
+
+		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+	}
+}
+
+/**
+ * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to device memory
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @devmem_allocation: Pointer to the device memory allocation. The caller
+ *                     should hold a reference to the device memory allocation,
+ *                     which should be dropped via ops->devmem_release or upon
+ *                     the failure of this function.
+ * @ctx: GPU SVM context
+ *
+ * This function migrates the specified GPU SVM range to device memory. It
+ * performs the necessary setup and invokes the driver-specific operations for
+ * migration to device memory. Upon successful return, @devmem_allocation can
+ * safely reference @range until ops->devmem_release is called which only upon
+ * successful return. Expected to be called while holding the mmap lock in read
+ * mode.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
+				 struct drm_gpusvm_range *range,
+				 struct drm_gpusvm_devmem *devmem_allocation,
+				 const struct drm_gpusvm_ctx *ctx)
+{
+	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
+	unsigned long start = drm_gpusvm_range_start(range),
+		      end = drm_gpusvm_range_end(range);
+	struct migrate_vma migrate = {
+		.start		= start,
+		.end		= end,
+		.pgmap_owner	= gpusvm->device_private_page_owner,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	struct mm_struct *mm = gpusvm->mm;
+	unsigned long i, npages = npages_in_range(start, end);
+	struct vm_area_struct *vas;
+	struct drm_gpusvm_zdd *zdd = NULL;
+	struct page **pages;
+	dma_addr_t *dma_addr;
+	void *buf;
+	int err;
+
+	mmap_assert_locked(gpusvm->mm);
+
+	if (!range->flags.migrate_devmem)
+		return -EINVAL;
+
+	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	    !ops->copy_to_ram)
+		return -EOPNOTSUPP;
+
+	vas = vma_lookup(mm, start);
+	if (!vas) {
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	if (end > vas->vm_end || start < vas->vm_start) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	if (!vma_is_anonymous(vas)) {
+		err = -EBUSY;
+		goto err_out;
+	}
+
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+
+	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
+	if (!zdd) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+
+	migrate.vma = vas;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+
+	err = migrate_vma_setup(&migrate);
+	if (err)
+		goto err_free;
+
+	if (!migrate.cpages) {
+		err = -EFAULT;
+		goto err_free;
+	}
+
+	if (migrate.cpages != npages) {
+		err = -EBUSY;
+		goto err_finalize;
+	}
+
+	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	if (err)
+		goto err_finalize;
+
+	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					   migrate.src, npages, DMA_TO_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = pfn_to_page(migrate.dst[i]);
+
+		pages[i] = page;
+		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
+		drm_gpusvm_get_devmem_page(page, zdd);
+	}
+
+	err = ops->copy_to_devmem(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+	/* Upon success bind devmem allocation to range and zdd */
+	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
+
+err_finalize:
+	if (err)
+		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+				       DMA_TO_DEVICE);
+err_free:
+	if (zdd)
+		drm_gpusvm_zdd_put(zdd);
+	kvfree(buf);
+err_out:
+	return err;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
+
+/**
+ * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
+ * @vas: Pointer to the VM area structure, can be NULL
+ * @fault_page: Fault page
+ * @npages: Number of pages to populate
+ * @mpages: Number of pages to migrate
+ * @src_mpfn: Source array of migrate PFNs
+ * @mpfn: Array of migrate PFNs to populate
+ * @addr: Start address for PFN allocation
+ *
+ * This function populates the RAM migrate page frame numbers (PFNs) for the
+ * specified VM area structure. It allocates and locks pages in the VM area for
+ * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
+ * alloc_page for allocation.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
+					       struct page *fault_page,
+					       unsigned long npages,
+					       unsigned long *mpages,
+					       unsigned long *src_mpfn,
+					       unsigned long *mpfn,
+					       unsigned long addr)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
+		struct page *page, *src_page;
+
+		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		src_page = migrate_pfn_to_page(src_mpfn[i]);
+		if (!src_page)
+			continue;
+
+		if (fault_page) {
+			if (src_page->zone_device_data !=
+			    fault_page->zone_device_data)
+				continue;
+		}
+
+		if (vas)
+			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
+		else
+			page = alloc_page(GFP_HIGHUSER);
+
+		if (!page)
+			goto free_pages;
+
+		mpfn[i] = migrate_pfn(page_to_pfn(page));
+	}
+
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(mpfn[i]);
+
+		if (!page)
+			continue;
+
+		WARN_ON_ONCE(!trylock_page(page));
+		++*mpages;
+	}
+
+	return 0;
+
+free_pages:
+	for (i = 0; i < npages; ++i) {
+		struct page *page = migrate_pfn_to_page(mpfn[i]);
+
+		if (!page)
+			continue;
+
+		put_page(page);
+		mpfn[i] = 0;
+	}
+	return -ENOMEM;
+}
+
+/**
+ * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
+ * @devmem_allocation: Pointer to the device memory allocation
+ *
+ * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
+ * migration done via migrate_device_* functions.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
+	unsigned long npages, mpages = 0;
+	struct page **pages;
+	unsigned long *src, *dst;
+	dma_addr_t *dma_addr;
+	void *buf;
+	int i, err = 0;
+	unsigned int retry_count = 2;
+
+	npages = devmem_allocation->size >> PAGE_SHIFT;
+
+retry:
+	if (!mmget_not_zero(devmem_allocation->mm))
+		return -EFAULT;
+
+	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	src = buf;
+	dst = buf + (sizeof(*src) * npages);
+	dma_addr = buf + (2 * sizeof(*src) * npages);
+	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
+
+	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	if (err)
+		goto err_free;
+
+	err = migrate_device_pfns(src, npages);
+	if (err)
+		goto err_free;
+
+	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
+						  src, dst, 0);
+	if (err || !mpages)
+		goto err_finalize;
+
+	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
+					   dst, npages, DMA_FROM_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i)
+		pages[i] = migrate_pfn_to_page(src[i]);
+
+	err = ops->copy_to_ram(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+err_finalize:
+	if (err)
+		drm_gpusvm_migration_unlock_put_pages(npages, dst);
+	migrate_device_pages(src, dst, npages);
+	migrate_device_finalize(src, dst, npages);
+	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+				       DMA_FROM_DEVICE);
+err_free:
+	kvfree(buf);
+err_out:
+	mmput_async(devmem_allocation->mm);
+
+	if (completion_done(&devmem_allocation->detached))
+		return 0;
+
+	if (retry_count--) {
+		cond_resched();
+		goto retry;
+	}
+
+	return err ?: -EBUSY;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
+
+/**
+ * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
+ * @vas: Pointer to the VM area structure
+ * @device_private_page_owner: Device private pages owner
+ * @page: Pointer to the page for fault handling (can be NULL)
+ * @fault_addr: Fault address
+ * @size: Size of migration
+ *
+ * This internal function performs the migration of the specified GPU SVM range
+ * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
+ * invokes the driver-specific operations for migration to RAM.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
+				       void *device_private_page_owner,
+				       struct page *page,
+				       unsigned long fault_addr,
+				       unsigned long size)
+{
+	struct migrate_vma migrate = {
+		.vma		= vas,
+		.pgmap_owner	= device_private_page_owner,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		.fault_page	= page,
+	};
+	struct drm_gpusvm_zdd *zdd;
+	const struct drm_gpusvm_devmem_ops *ops;
+	struct device *dev = NULL;
+	unsigned long npages, mpages = 0;
+	struct page **pages;
+	dma_addr_t *dma_addr;
+	unsigned long start, end;
+	void *buf;
+	int i, err = 0;
+
+	start = ALIGN_DOWN(fault_addr, size);
+	end = ALIGN(fault_addr + 1, size);
+
+	/* Corner where VMA area struct has been partially unmapped */
+	if (start < vas->vm_start)
+		start = vas->vm_start;
+	if (end > vas->vm_end)
+		end = vas->vm_end;
+
+	migrate.start = start;
+	migrate.end = end;
+	npages = npages_in_range(start, end);
+
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+		       sizeof(*pages), GFP_KERNEL);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+
+	migrate.vma = vas;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+
+	err = migrate_vma_setup(&migrate);
+	if (err)
+		goto err_free;
+
+	/* Raced with another CPU fault, nothing to do */
+	if (!migrate.cpages)
+		goto err_free;
+
+	if (!page) {
+		for (i = 0; i < npages; ++i) {
+			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
+				continue;
+
+			page = migrate_pfn_to_page(migrate.src[i]);
+			break;
+		}
+
+		if (!page)
+			goto err_finalize;
+	}
+	zdd = page->zone_device_data;
+	ops = zdd->devmem_allocation->ops;
+	dev = zdd->devmem_allocation->dev;
+
+	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
+						  migrate.src, migrate.dst,
+						  start);
+	if (err)
+		goto err_finalize;
+
+	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
+					   DMA_FROM_DEVICE);
+	if (err)
+		goto err_finalize;
+
+	for (i = 0; i < npages; ++i)
+		pages[i] = migrate_pfn_to_page(migrate.src[i]);
+
+	err = ops->copy_to_ram(pages, dma_addr, npages);
+	if (err)
+		goto err_finalize;
+
+err_finalize:
+	if (err)
+		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+	if (dev)
+		drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
+					       DMA_FROM_DEVICE);
+err_free:
+	kvfree(buf);
+err_out:
+
+	return err;
+}
+
+/**
+ * drm_gpusvm_range_evict - Evict GPU SVM range
+ * @pagemap: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range to be removed
+ *
+ * This function evicts the specified GPU SVM range. This function will not
+ * evict coherent pages.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_range *range)
+{
+	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
+	struct hmm_range hmm_range = {
+		.default_flags = HMM_PFN_REQ_FAULT,
+		.notifier = notifier,
+		.start = drm_gpusvm_range_start(range),
+		.end = drm_gpusvm_range_end(range),
+		.dev_private_owner = NULL,
+	};
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns;
+	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
+					       drm_gpusvm_range_end(range));
+	int err = 0;
+	struct mm_struct *mm = gpusvm->mm;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return -ENOMEM;
+
+	hmm_range.hmm_pfns = pfns;
+	while (!time_after(jiffies, timeout)) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
+		if (time_after(jiffies, timeout)) {
+			err = -ETIME;
+			break;
+		}
+
+		mmap_read_lock(mm);
+		err = hmm_range_fault(&hmm_range);
+		mmap_read_unlock(mm);
+		if (err != -EBUSY)
+			break;
+	}
+
+	kvfree(pfns);
+	mmput(mm);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
+
+/**
+ * drm_gpusvm_page_free() - Put GPU SVM zone device data associated with a page
+ * @page: Pointer to the page
+ *
+ * This function is a callback used to put the GPU SVM zone device data
+ * associated with a page when it is being released.
+ */
+static void drm_gpusvm_page_free(struct page *page)
+{
+	drm_gpusvm_zdd_put(page->zone_device_data);
+}
+
+/**
+ * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (page fault handler)
+ * @vmf: Pointer to the fault information structure
+ *
+ * This function is a page fault handler used to migrate a GPU SVM range to RAM.
+ * It retrieves the GPU SVM range information from the faulting page and invokes
+ * the internal migration function to migrate the range back to RAM.
+ *
+ * Return: VM_FAULT_SIGBUS on failure, 0 on success.
+ */
+static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
+{
+	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
+	int err;
+
+	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
+					  zdd->device_private_page_owner,
+					  vmf->page, vmf->address,
+					  zdd->devmem_allocation->size);
+
+	return err ? VM_FAULT_SIGBUS : 0;
+}
+
+/**
+ * drm_gpusvm_pagemap_ops() - Device page map operations for GPU SVM
+ */
+static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
+	.page_free = drm_gpusvm_page_free,
+	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
+};
+
+/**
+ * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page map operations
+ *
+ * Return: Pointer to the GPU SVM device page map operations structure.
+ */
+const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
+{
+	return &drm_gpusvm_pagemap_ops;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
+
+/**
+ * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for the given address range
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @start: Start address
+ * @end: End address
+ *
+ * Return: True if GPU SVM has mapping, False otherwise
+ */
+bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
+			    unsigned long end)
+{
+	struct drm_gpusvm_notifier *notifier;
+
+	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
+		struct drm_gpusvm_range *range = NULL;
+
+		drm_gpusvm_for_each_range(range, notifier, start, end)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
+
+/**
+ * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as unmapped
+ * @range: Pointer to the GPU SVM range structure.
+ * @mmu_range: Pointer to the MMU notifier range structure.
+ *
+ * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
+ * if the range partially falls within the provided MMU notifier range.
+ */
+void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
+				   const struct mmu_notifier_range *mmu_range)
+{
+	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
+
+	range->flags.unmapped = true;
+	if (drm_gpusvm_range_start(range) < mmu_range->start ||
+	    drm_gpusvm_range_end(range) > mmu_range->end)
+		range->flags.partial_unmap = true;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
+
+/**
+ * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory allocation
+ *
+ * @dev: Pointer to the device structure which device memory allocation belongs to
+ * @mm: Pointer to the mm_struct for the address space
+ * @ops: Pointer to the operations structure for GPU SVM device memory
+ * @dpagemap: The struct drm_pagemap we're allocating from.
+ * @size: Size of device memory allocation
+ */
+void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
+			    struct device *dev, struct mm_struct *mm,
+			    const struct drm_gpusvm_devmem_ops *ops,
+			    struct drm_pagemap *dpagemap, size_t size)
+{
+	init_completion(&devmem_allocation->detached);
+	devmem_allocation->dev = dev;
+	devmem_allocation->mm = mm;
+	devmem_allocation->ops = ops;
+	devmem_allocation->dpagemap = dpagemap;
+	devmem_allocation->size = size;
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
+
+MODULE_DESCRIPTION("DRM GPUSVM");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 99219c16e8aa..7d7995196702 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,6 +39,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
+	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
@@ -73,6 +74,15 @@ config DRM_XE_DP_TUNNEL
 
 	  If in doubt say "Y".
 
+config DRM_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
 	depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 856b14fe1c4d..75a79390a0e3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -124,6 +124,7 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
+xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25761924a8b4..0c7a7f5e5596 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -279,6 +279,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_bo *bo;
+
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -290,6 +292,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	bo = ttm_to_xe_bo(tbo);
+	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
@@ -734,6 +742,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
+	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) &&
+	    new_mem->mem_type == XE_PL_SYSTEM) {
+		ret = xe_svm_bo_evict(bo);
+		if (!ret) {
+			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
+			ttm_bo_move_null(ttm_bo, new_mem);
+		} else {
+			drm_dbg(&xe->drm, "Evict system allocator BO failed=%pe\n",
+				ERR_PTR(ret));
+		}
+
+		goto out;
+	}
+
 	if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT && !handle_system_ccs) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
@@ -2273,6 +2295,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
 	struct xe_vm *vm = NULL;
+	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -2344,6 +2367,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
+	}
+
+retry:
+	if (vm) {
 		err = xe_vm_lock(vm, true);
 		if (err)
 			goto out_vm;
@@ -2357,6 +2384,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
 		goto out_vm;
 	}
 
@@ -2653,6 +2682,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
 		drm_gem_object_free(&bo->ttm.base.refcount);
 }
 
+static void xe_bo_dev_work_func(struct work_struct *work)
+{
+	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
+
+	xe_bo_put_commit(&bo_dev->async_list);
+}
+
+/**
+ * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
+ * @bo_dev: The BO dev structure
+ */
+void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
+{
+	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
+}
+
+/**
+ * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
+ * @bo_dev: The BO dev structure
+ */
+void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
+{
+	flush_work(&bo_dev->async_free);
+}
+
 void xe_bo_put(struct xe_bo *bo)
 {
 	struct xe_tile *tile;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a25340949415..2b9c0b0778a2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -47,6 +47,7 @@
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
 					 XE_BO_FLAG_GGTT3)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
@@ -323,6 +324,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
 void xe_bo_put_commit(struct llist_head *deferred);
 
+/**
+ * xe_bo_put_async() - Put BO async
+ * @bo: The bo to put.
+ *
+ * Put BO async, the final put is deferred to a worker to exit an IRQ context.
+ */
+static inline void
+xe_bo_put_async(struct xe_bo *bo)
+{
+	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
+
+	if (xe_bo_put_deferred(bo, &bo_device->async_list))
+		schedule_work(&bo_device->async_free);
+}
+
+void xe_bo_dev_init(struct xe_bo_dev *bo_device);
+
+void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
+
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 60c522866500..15a92e3d4898 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 
+#include <drm/drm_gpusvm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -80,6 +81,9 @@ struct xe_bo {
 	 */
 	u16 cpu_caching;
 
+	/** @devmem_allocation: SVM device memory allocation */
+	struct drm_gpusvm_devmem devmem_allocation;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..a7dd9c7b95e5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -387,6 +387,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_bo_dev_fini(&xe->bo_device);
+
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
@@ -424,6 +426,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..fac488942316 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -106,6 +107,19 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
 };
@@ -525,6 +539,14 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @bo_device: Struct to control async free of BOs */
+	struct xe_bo_dev {
+		/** @bo_device.async_free: Free worker */
+		struct work_struct async_free;
+		/** @bo_device.async_list: List of BOs to be freed */
+		struct llist_head async_list;
+	} bo_device;
+
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 17d69039b866..c5ad9a0a89c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,6 +19,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -125,8 +126,8 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
-				struct xe_vma *vma)
+static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
+				bool atomic)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -134,13 +135,13 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
-	bool atomic;
+
+	lockdep_assert_held_write(&vm->lock);
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
 
 	trace_xe_vma_pagefault(vma);
-	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
 	if (vma_is_valid(tile, vma) && !atomic)
@@ -210,6 +211,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
+	bool atomic;
 
 	/* SW isn't expected to handle TRTT faults */
 	if (pf->trva_fault)
@@ -235,7 +237,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	err = handle_vma_pagefault(gt, pf, vma);
+	atomic = access_is_atomic(pf->access_type);
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		err = xe_svm_handle_pagefault(vm, vma, gt_to_tile(gt),
+					      pf->page_addr, atomic);
+	else
+		err = handle_vma_pagefault(gt, vma, atomic);
 
 unlock_vm:
 	if (!err)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 0a93831c0a02..03072e094991 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -410,6 +410,28 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
 
+/**
+ * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
+ * @gt: graphics tile
+ * @vm: VM to invalidate
+ *
+ * Invalidate entire VM's address space
+ */
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
+{
+	struct xe_gt_tlb_invalidation_fence fence;
+	u64 range = 1ull << vm->xe->info.va_bits;
+	int ret;
+
+	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+
+	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
+	if (ret < 0)
+		return;
+
+	xe_gt_tlb_invalidation_fence_wait(&fence);
+}
+
 /**
  * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
  * @gt: GT structure
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 672acfcdf0d7..abe9b03d543e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -12,6 +12,7 @@
 
 struct xe_gt;
 struct xe_guc;
+struct xe_vm;
 struct xe_vma;
 
 int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
@@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 278bc96cf593..df4282c71bf0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1544,6 +1544,181 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
+static u32 pte_update_cmd_size(u64 size)
+{
+	u32 num_dword;
+	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+
+	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
+	/*
+	 * MI_STORE_DATA_IMM command is used to update page table. Each
+	 * instruction can update maximumly 0x1ff pte entries. To update
+	 * n (n <= 0x1ff) pte entries, we need:
+	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
+	 * 2 dword for the page table's physical location
+	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
+	 */
+	num_dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
+	num_dword += entries * 2;
+
+	return num_dword;
+}
+
+static void build_pt_update_batch_sram(struct xe_migrate *m,
+				       struct xe_bb *bb, u32 pt_offset,
+				       dma_addr_t *sram_addr, u32 size)
+{
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u32 ptes;
+	int i = 0;
+
+	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	while (ptes) {
+		u32 chunk = min(0x1ffU, ptes);
+
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = pt_offset;
+		bb->cs[bb->len++] = 0;
+
+		pt_offset += chunk * 8;
+		ptes -= chunk;
+
+		while (chunk--) {
+			u64 addr = sram_addr[i++] & PAGE_MASK;
+
+			xe_tile_assert(m->tile, addr);
+			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								 addr, pat_index,
+								 0, false, 0);
+			bb->cs[bb->len++] = lower_32_bits(addr);
+			bb->cs[bb->len++] = upper_32_bits(addr);
+		}
+	}
+}
+
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
+static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+					 unsigned long npages,
+					 dma_addr_t *sram_addr, u64 vram_addr,
+					 const enum xe_migrate_copy_dir dir)
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u32 batch_size = 2;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u64 round_update_size;
+	struct xe_sched_job *job;
+	struct xe_bb *bb;
+	u32 update_idx, pt_slot = 0;
+	int err;
+
+	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
+		return ERR_PTR(-EINVAL);
+
+	round_update_size = npages * PAGE_SIZE;
+	batch_size += pte_update_cmd_size(round_update_size);
+	batch_size += EMIT_COPY_DW;
+
+	bb = xe_bb_new(gt, batch_size, true);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		return ERR_PTR(err);
+	}
+
+	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+				   sram_addr, round_update_size);
+
+	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
+		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+
+	} else {
+		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+	}
+
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	update_idx = bb->len;
+
+	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
+		  XE_PAGE_SIZE);
+
+	job = xe_bb_create_migration_job(m->q, bb,
+					 xe_migrate_batch_base(m, true),
+					 update_idx);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto err;
+	}
+
+	xe_sched_job_add_migrate_flush(job, 0);
+
+	mutex_lock(&m->job_mutex);
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	dma_fence_put(m->fence);
+	m->fence = dma_fence_get(fence);
+	mutex_unlock(&m->job_mutex);
+
+	xe_bb_free(bb, fence);
+
+	return fence;
+
+err:
+	xe_bb_free(bb, NULL);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_migrate_to_vram() - Migrate to VRAM
+ * @m: The migration context.
+ * @npages: Number of pages to migrate.
+ * @src_addr: Array of dma addresses (source of migrate)
+ * @dst_addr: Device physical address of VRAM (destination of migrate)
+ *
+ * Copy from an array dma addresses to a VRAM device physical address
+ *
+ * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
+				     unsigned long npages,
+				     dma_addr_t *src_addr,
+				     u64 dst_addr)
+{
+	return xe_migrate_vram(m, npages, src_addr, dst_addr,
+			       XE_MIGRATE_COPY_TO_VRAM);
+}
+
+/**
+ * xe_migrate_from_vram() - Migrate from VRAM
+ * @m: The migration context.
+ * @npages: Number of pages to migrate.
+ * @src_addr: Device physical address of VRAM (source of migrate)
+ * @dst_addr: Array of dma addresses (destination of migrate)
+ *
+ * Copy from a VRAM device physical address to an array dma addresses
+ *
+ * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
+				       unsigned long npages,
+				       u64 src_addr,
+				       dma_addr_t *dst_addr)
+{
+	return xe_migrate_vram(m, npages, dst_addr, src_addr,
+			       XE_MIGRATE_COPY_TO_SRAM);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 0109866e398a..6ff9a963425c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -95,6 +95,16 @@ struct xe_migrate_pt_update {
 
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
+struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
+				     unsigned long npages,
+				     dma_addr_t *src_addr,
+				     u64 dst_addr);
+
+struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
+				       unsigned long npages,
+				       u64 src_addr,
+				       dma_addr_t *dst_addr);
+
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
 				  struct xe_bo *dst_bo,
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 26ec9aa02648..475acdba2b55 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -25,9 +25,16 @@ struct xe_modparam xe_modparam = {
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 #endif
 	.wedged_mode = 1,
+	.svm_notifier_size = 512,
 	/* the rest are 0 by default */
 };
 
+module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
+
+module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
+MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
+
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 161a5e6f717f..84339e509c80 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool always_migrate_to_vram;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
@@ -22,6 +23,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	int wedged_mode;
+	u32 svm_notifier_size;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..29ade504e1c1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -20,6 +20,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_svm.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -214,6 +215,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	xe_pt_free(pt);
 }
 
+/**
+ * xe_pt_clear() - Clear a page-table.
+ * @xe: xe device.
+ * @pt: The page-table.
+ *
+ * Clears page-table by setting to zero.
+ */
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
+{
+	struct iosys_map *map = &pt->bo->vmap;
+
+	xe_map_memset(xe, map, 0, 0, SZ_4K);
+}
+
 /**
  * DOC: Pagetable building
  *
@@ -587,6 +602,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * range.
  * @tile: The tile we're building for.
  * @vma: The vma indicating the address range.
+ * @range: The range indicating the address range.
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
  * @num_entries: On output contains the number of @entries used.
@@ -602,6 +618,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  */
 static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
+		 struct xe_svm_range *range,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_device *xe = tile_to_xe(tile);
@@ -618,14 +635,43 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vm = xe_vma_vm(vma),
 		.tile = tile,
 		.curs = &curs,
-		.va_curs_start = xe_vma_start(vma),
+		.va_curs_start = range ? range->base.itree.start :
+			xe_vma_start(vma),
 		.vma = vma,
 		.wupd.entries = entries,
-		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (range) {
+		/* Move this entire thing to xe_svm.c? */
+		xe_svm_notifier_lock(xe_vma_vm(vma));
+		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
+			xe_svm_notifier_unlock(xe_vma_vm(vma));
+			return -EAGAIN;
+		}
+		if (xe_svm_range_has_dma_mapping(range)) {
+			xe_res_first_dma(range->base.dma_addr, 0,
+					 range->base.itree.last + 1 - range->base.itree.start,
+					 &curs);
+			is_devmem = xe_res_is_vram(&curs);
+			if (is_devmem)
+				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
+			else
+				xe_svm_range_debug(range, "BIND PREPARE - DMA");
+		} else {
+			xe_assert(xe, false);
+		}
+		/*
+		 * Note, when unlocking the resource cursor dma addresses may become
+		 * stale, but the bind will be aborted anyway att commit time.
+		 */
+		xe_svm_notifier_unlock(xe_vma_vm(vma));
+	}
+
+	xe_walk.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem;
+
 	/**
 	 * Default atomic expectations for different allocation scenarios are as follows:
 	 *
@@ -647,7 +693,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			 * gets migrated to LMEM, bind such allocations with
 			 * device atomics enabled.
 			 */
-			else if (is_devmem && !xe_bo_has_single_placement(bo))
+			else if (is_devmem)
 				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		} else {
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
@@ -663,15 +709,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
-		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
+		xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	}
 
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
 
-	xe_bo_assert_held(bo);
+	if (!range)
+		xe_bo_assert_held(bo);
 
-	if (!xe_vma_is_null(vma)) {
+	if (!xe_vma_is_null(vma) && !range) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
 					xe_vma_size(vma), &curs);
@@ -681,12 +728,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-	} else {
+	} else if (!range) {
 		curs.size = xe_vma_size(vma);
 	}
 
-	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
-			       xe_vma_end(vma), &xe_walk.base);
+	ret = xe_pt_walk_range(&pt->base, pt->level,
+			       range ? range->base.itree.start : xe_vma_start(vma),
+			       range ? range->base.itree.last + 1 : xe_vma_end(vma),
+			       &xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -830,6 +879,46 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	return xe_walk.needs_invalidate;
 }
 
+/**
+ * xe_pt_zap_ptes_range() - Zap (zero) gpu ptes of a SVM range
+ * @tile: The tile we're zapping for.
+ * @vm: The VM we're zapping for.
+ * @range: The SVM range we're zapping for.
+ *
+ * SVM invalidation needs to be able to zap the gpu ptes of a given address
+ * range. In order to be able to do that, that function needs access to the
+ * shared page-table entries so it can either clear the leaf PTEs or
+ * clear the pointers to lower-level page-tables. The caller is required
+ * to hold the SVM notifier lock.
+ *
+ * Return: Whether ptes were actually updated and a TLB invalidation is
+ * required.
+ */
+bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
+			  struct xe_svm_range *range)
+{
+	struct xe_pt_zap_ptes_walk xe_walk = {
+		.base = {
+			.ops = &xe_pt_zap_ptes_ops,
+			.shifts = xe_normal_pt_shifts,
+			.max_level = XE_PT_HIGHEST_LEVEL,
+		},
+		.tile = tile,
+	};
+	struct xe_pt *pt = vm->pt_root[tile->id];
+	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
+
+	xe_svm_assert_in_notifier(vm);
+
+	if (!(pt_mask & BIT(tile->id)))
+		return false;
+
+	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.itree.start,
+				range->base.itree.last + 1, &xe_walk.base);
+
+	return xe_walk.needs_invalidate;
+}
+
 static void
 xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
 		       struct iosys_map *map, void *data,
@@ -873,13 +962,19 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
 	}
 }
 
+#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
+
 static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 {
-	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_vm *vm;
 
+	if (vma == XE_INVALID_VMA)
+		return;
+
+	vm = xe_vma_vm(vma);
 	lockdep_assert_held(&vm->lock);
 
-	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
+	if (!xe_vma_has_no_bo(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	xe_vm_assert_held(vm);
@@ -902,7 +997,8 @@ static void xe_pt_commit(struct xe_vma *vma,
 		for (j = 0; j < entries[i].qwords; j++) {
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
 
-			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+			xe_pt_destroy(oldpte, (vma == XE_INVALID_VMA) ? 0 :
+				      xe_vma_vm(vma)->flags, deferred);
 		}
 	}
 }
@@ -981,12 +1077,13 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
+		   struct xe_svm_range *range,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, range, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
 
@@ -1069,6 +1166,11 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	int err = 0;
 
+	/*
+	 * No need to check for is_cpu_addr_mirror here as vma_add_deps is a
+	 * NOP if VMA is_cpu_addr_mirror
+	 */
+
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
@@ -1087,6 +1189,8 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_PREFETCH:
 		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1311,6 +1415,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
+static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vma_op *op;
+	int err;
+
+	err = xe_pt_pre_commit(pt_update);
+	if (err)
+		return err;
+
+	xe_svm_notifier_lock(vm);
+
+	list_for_each_entry(op, &vops->list, link) {
+		struct xe_svm_range *range = op->map_range.range;
+
+		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
+			continue;
+
+		xe_svm_range_debug(range, "PRE-COMMIT");
+
+		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+
+		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+			xe_svm_notifier_unlock(vm);
+			return -EAGAIN;
+		}
+	}
+
+	return 0;
+}
+
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
@@ -1496,7 +1634,9 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  * xe_pt_stage_unbind() - Build page-table update structures for an unbind
  * operation
  * @tile: The tile we're unbinding for.
+ * @vm: The vm
  * @vma: The vma we're unbinding.
+ * @range: The range we're unbinding.
  * @entries: Caller-provided storage for the update structures.
  *
  * Builds page-table update structures for an unbind operation. The function
@@ -1506,9 +1646,14 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  *
  * Return: The number of entries used.
  */
-static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
+static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
+				       struct xe_vm *vm,
+				       struct xe_vma *vma,
+				       struct xe_svm_range *range,
 				       struct xe_vm_pgtable_update *entries)
 {
+	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
+	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
 	struct xe_pt_stage_unbind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
@@ -1516,14 +1661,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.tile = tile,
-		.modified_start = xe_vma_start(vma),
-		.modified_end = xe_vma_end(vma),
+		.modified_start = start,
+		.modified_end = end,
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	struct xe_pt *pt = vm->pt_root[tile->id];
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
+				&xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
@@ -1603,12 +1748,12 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 
 static void
 xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
-				 struct xe_vma *vma)
+				 u64 start, u64 end)
 {
+	u64 last;
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int i, level = 0;
-	u64 start, last;
 
 	for (i = 0; i < pt_op->num_entries; i++) {
 		const struct xe_vm_pgtable_update *entry = &pt_op->entries[i];
@@ -1618,8 +1763,8 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 	}
 
 	/* Greedy (non-optimal) calculation but simple */
-	start = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
-	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+	start = ALIGN_DOWN(start, 0x1ull << xe_pt_shift(level));
+	last = ALIGN(end, 0x1ull << xe_pt_shift(level)) - 1;
 
 	if (start < pt_update_ops->start)
 		pt_update_ops->start = start;
@@ -1646,6 +1791,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int err;
 
+	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
@@ -1660,7 +1806,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	if (err)
 		return err;
 
-	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+	err = xe_pt_prepare_bind(tile, vma, NULL, pt_op->entries,
 				 &pt_op->num_entries);
 	if (!err) {
 		xe_tile_assert(tile, pt_op->num_entries <=
@@ -1668,7 +1814,9 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 					pt_op->num_entries, true);
 
-		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+		xe_pt_update_ops_rfence_interval(pt_update_ops,
+						 xe_vma_start(vma),
+						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
 		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 
@@ -1702,6 +1850,48 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	return err;
 }
 
+static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
+			      struct xe_vm_pgtable_update_ops *pt_update_ops,
+			      struct xe_vma *vma, struct xe_svm_range *range)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	int err;
+
+	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing bind, with range [%lx...%lx)\n",
+	       range->base.itree.start, range->base.itree.last);
+
+	pt_op->vma = NULL;
+	pt_op->bind = true;
+	pt_op->rebind = BIT(tile->id) & range->tile_present;
+
+	err = xe_pt_prepare_bind(tile, vma, range, pt_op->entries,
+				 &pt_op->num_entries);
+	if (!err) {
+		xe_tile_assert(tile, pt_op->num_entries <=
+			       ARRAY_SIZE(pt_op->entries));
+		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+					pt_op->num_entries, true);
+
+		xe_pt_update_ops_rfence_interval(pt_update_ops,
+						 range->base.itree.start,
+						 range->base.itree.last + 1);
+		++pt_update_ops->current_op;
+		pt_update_ops->needs_svm_lock = true;
+
+		pt_op->vma = vma;
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
+	}
+
+	return err;
+}
+
 static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
 			     struct xe_vma *vma)
@@ -1713,19 +1903,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
 		return 0;
 
+	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx)\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1);
 
-	/*
-	 * Wait for invalidation to complete. Can corrupt internal page table
-	 * state if an invalidation is running while preparing an unbind.
-	 */
-	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
-		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
-
 	pt_op->vma = vma;
 	pt_op->bind = false;
 	pt_op->rebind = false;
@@ -1734,11 +1918,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (err)
 		return err;
 
-	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
+	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
+						vma, NULL, pt_op->entries);
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
-	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
+					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
@@ -1748,6 +1934,42 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	return 0;
 }
 
+static int unbind_range_prepare(struct xe_vm *vm,
+				struct xe_tile *tile,
+				struct xe_vm_pgtable_update_ops *pt_update_ops,
+				struct xe_svm_range *range)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+
+	if (!(range->tile_present & BIT(tile->id)))
+		return 0;
+
+	vm_dbg(&vm->xe->drm,
+	       "Preparing unbind, with range [%lx...%lx)\n",
+	       range->base.itree.start, range->base.itree.last);
+
+	pt_op->vma = XE_INVALID_VMA;
+	pt_op->bind = false;
+	pt_op->rebind = false;
+
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
+						pt_op->entries);
+
+	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+				pt_op->num_entries, false);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
+					 range->base.itree.last + 1);
+	++pt_update_ops->current_op;
+	pt_update_ops->needs_svm_lock = true;
+	pt_update_ops->needs_invalidation = true;
+
+	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
+				    pt_op->num_entries);
+
+	return 0;
+}
+
 static int op_prepare(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -1759,15 +1981,21 @@ static int op_prepare(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_cpu_addr_mirror)
 			break;
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.remap.unmap->va));
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_cpu_addr_mirror(old))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, old);
 
 		if (!err && op->remap.prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
@@ -1780,15 +2008,40 @@ static int op_prepare(struct xe_vm *vm,
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.unmap.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, vma);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		err = bind_op_prepare(vm, tile, pt_update_ops,
-				      gpuva_to_vma(op->base.prefetch.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			break;
+
+		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
+	}
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+
+			err = bind_range_prepare(vm, tile, pt_update_ops,
+						 op->map_range.vma,
+						 op->map_range.range);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			err = unbind_range_prepare(vm, tile, pt_update_ops,
+						   op->unmap_range.range);
+		}
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1858,6 +2111,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vma *vma, struct dma_fence *fence,
 			   struct dma_fence *fence2)
 {
+	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1891,6 +2146,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vma *vma, struct dma_fence *fence,
 			     struct dma_fence *fence2)
 {
+	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1925,16 +2182,21 @@ static void op_commit(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_cpu_addr_mirror)
 			break;
 
 		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
 			       fence2);
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence,
-				 fence2);
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_cpu_addr_mirror(old))
+			break;
+
+		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
@@ -1943,14 +2205,35 @@ static void op_commit(struct xe_vm *vm,
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
 				       fence, fence2);
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (!xe_vma_is_cpu_addr_mirror(vma))
+			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
+					 fence2);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (!xe_vma_is_cpu_addr_mirror(vma))
+			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
+				       fence2);
+		break;
+	}
+	case DRM_GPUVA_OP_DRIVER:
+	{
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			op->map_range.range->tile_present |= BIT(tile->id);
+			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			op->unmap_range.range->tile_present &= ~BIT(tile->id);
+		}
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1968,6 +2251,12 @@ static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_svm_pre_commit,
+};
+
 /**
  * xe_pt_update_ops_run() - Run PT update operations
  * @tile: Tile of PT update operations
@@ -1993,7 +2282,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vma_op *op;
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
-		.ops = pt_update_ops->needs_userptr_lock ?
+		.ops = pt_update_ops->needs_svm_lock ?
+			&svm_migrate_ops :
+			pt_update_ops->needs_userptr_lock ?
 			&userptr_migrate_ops :
 			&migrate_ops,
 		.vops = vops,
@@ -2114,6 +2405,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				  &ifence->base.base, &mfence->base.base);
 	}
 
+	if (pt_update_ops->needs_svm_lock)
+		xe_svm_notifier_unlock(vm);
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..5ecf003d513c 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -13,6 +13,7 @@ struct dma_fence;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
+struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
@@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
+
 int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
 struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
@@ -42,5 +45,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
+bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
+			  struct xe_svm_range *range);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..69eab6f37cfe 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -104,6 +104,8 @@ struct xe_vm_pgtable_update_ops {
 	u32 num_ops;
 	/** @current_op: current operations */
 	u32 current_op;
+	/** @needs_svm_lock: Needs SVM lock */
+	bool needs_svm_lock;
 	/** @needs_userptr_lock: Needs userptr lock */
 	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 781dd21682e5..8742672e458b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -338,8 +338,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
-		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_GPUSVM))
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..01b151712998 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,6 +26,7 @@
 
 #include <linux/scatterlist.h>
 
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
@@ -34,17 +35,38 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_macros.h"
+#include "xe_svm.h"
 #include "xe_ttm_vram_mgr.h"
 
-/* state back for walking over vram_mgr, stolen_mgr, and gtt_mgr allocations */
+/**
+ * struct xe_res_cursor - state for walking over dma mapping, vram_mgr,
+ * stolen_mgr, and gtt_mgr allocations
+ */
 struct xe_res_cursor {
+	/** @start: Start of cursor */
 	u64 start;
+	/** @size: Size of the current segment. */
 	u64 size;
+	/** @remaining: Remaining bytes in cursor */
 	u64 remaining;
+	/** @node: Opaque point current node cursor */
 	void *node;
+	/** @mem_type: Memory type */
 	u32 mem_type;
+	/** @sgl: Scatterlist for for cursor */
 	struct scatterlist *sgl;
+	/** @dma_addr: Current element in a struct drm_pagemap_device_addr array */
+	const struct drm_pagemap_device_addr *dma_addr;
+	/** @mm: Buddy allocator for VRAM cursor */
 	struct drm_buddy *mm;
+	/**
+	 * @dma_start: DMA start address for the current segment.
+	 * This may be different to @dma_addr.addr since elements in
+	 * the array may be coalesced to a single segment.
+	 */
+	u64 dma_start;
+	/** @dma_seg_size: Size of the current DMA segment. */
+	u64 dma_seg_size;
 };
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
@@ -70,6 +92,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = NULL;
 	if (!res)
 		goto fallback;
 
@@ -141,6 +164,36 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 	cur->sgl = sgl;
 }
 
+/**
+ * __xe_res_dma_next() - Advance the cursor when end-of-segment is reached
+ * @cur: The cursor
+ */
+static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
+{
+	const struct drm_pagemap_device_addr *addr = cur->dma_addr;
+	u64 start = cur->start;
+
+	while (start >= cur->dma_seg_size) {
+		start -= cur->dma_seg_size;
+		addr++;
+		cur->dma_seg_size = PAGE_SIZE << addr->order;
+	}
+	cur->dma_start = addr->addr;
+
+	/* Coalesce array_elements */
+	while (cur->dma_seg_size - start < cur->remaining) {
+		if (cur->dma_start + cur->dma_seg_size != addr[1].addr ||
+		    addr->proto != addr[1].proto)
+			break;
+		addr++;
+		cur->dma_seg_size += PAGE_SIZE << addr->order;
+	}
+
+	cur->dma_addr = addr;
+	cur->start = start;
+	cur->size = cur->dma_seg_size - start;
+}
+
 /**
  * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
  *
@@ -160,11 +213,42 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
+	cur->dma_addr = NULL;
 	cur->sgl = sg->sgl;
 	cur->mem_type = XE_PL_TT;
 	__xe_res_sg_next(cur);
 }
 
+/**
+ * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
+ *
+ * @dma_addr: struct drm_pagemap_device_addr array to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size.
+ */
+static inline void xe_res_first_dma(const struct drm_pagemap_device_addr *dma_addr,
+				    u64 start, u64 size,
+				    struct xe_res_cursor *cur)
+{
+	XE_WARN_ON(!dma_addr);
+	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+		   !IS_ALIGNED(size, PAGE_SIZE));
+
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->dma_seg_size = PAGE_SIZE << dma_addr->order;
+	cur->dma_start = 0;
+	cur->size = 0;
+	cur->dma_addr = dma_addr;
+	__xe_res_dma_next(cur);
+	cur->sgl = NULL;
+	cur->mem_type = XE_PL_TT;
+}
+
 /**
  * xe_res_next - advance the cursor
  *
@@ -191,6 +275,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		return;
 	}
 
+	if (cur->dma_addr) {
+		cur->start += size;
+		__xe_res_dma_next(cur);
+		return;
+	}
+
 	if (cur->sgl) {
 		cur->start += size;
 		__xe_res_sg_next(cur);
@@ -232,6 +322,35 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
+	if (cur->dma_addr)
+		return cur->dma_start + cur->start;
+	else if (cur->sgl)
+		return sg_dma_address(cur->sgl) + cur->start;
+	else
+		return cur->start;
+}
+
+/**
+ * xe_res_is_vram() - Whether the cursor current dma address points to
+ * same-device VRAM
+ * @cur: The cursor.
+ *
+ * Return: true iff the address returned by xe_res_dma() points to internal vram.
+ */
+static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
+{
+	if (cur->dma_addr)
+		return cur->dma_addr->proto == XE_INTERCONNECT_VRAM;
+
+	switch (cur->mem_type) {
+	case XE_PL_STOLEN:
+	case XE_PL_VRAM0:
+	case XE_PL_VRAM1:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..ce1d5f6f5dc3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,946 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_migrate.h"
+#include "xe_module.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+#include "xe_ttm_vram_mgr.h"
+#include "xe_vm.h"
+#include "xe_vm_types.h"
+
+static bool xe_svm_range_in_vram(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return range->base.flags.has_devmem_pages;
+}
+
+static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return xe_svm_range_in_vram(range) && range->tile_present;
+}
+
+static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
+{
+	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
+}
+
+static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
+{
+	return gpusvm_to_vm(r->gpusvm);
+}
+
+static unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_start(&range->base);
+}
+
+static unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_end(&range->base);
+}
+
+static unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
+
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
+	       xe_svm_range_size((r__)))
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+	range_debug(range, operation);
+}
+
+static void *xe_svm_devm_owner(struct xe_device *xe)
+{
+	return xe;
+}
+
+static struct drm_gpusvm_range *
+xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
+{
+	struct xe_svm_range *range;
+
+	range = kzalloc(sizeof(*range), GFP_KERNEL);
+	if (!range)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&range->garbage_collector_link);
+	xe_vm_get(gpusvm_to_vm(gpusvm));
+
+	return &range->base;
+}
+
+static void xe_svm_range_free(struct drm_gpusvm_range *range)
+{
+	xe_vm_put(range_to_vm(range));
+	kfree(range);
+}
+
+static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
+static void
+xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
+				   const struct mmu_notifier_range *mmu_range)
+{
+	struct xe_device *xe = vm->xe;
+
+	range_debug(range, "GARBAGE COLLECTOR ADD");
+
+	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
+
+	spin_lock(&vm->svm.garbage_collector.lock);
+	if (list_empty(&range->garbage_collector_link))
+		list_add_tail(&range->garbage_collector_link,
+			      &vm->svm.garbage_collector.range_list);
+	spin_unlock(&vm->svm.garbage_collector.lock);
+
+	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
+		   &vm->svm.garbage_collector.work);
+}
+
+static u8
+xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
+				  const struct mmu_notifier_range *mmu_range,
+				  u64 *adj_start, u64 *adj_end)
+{
+	struct xe_svm_range *range = to_xe_range(r);
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	u8 tile_mask = 0;
+	u8 id;
+
+	xe_svm_assert_in_notifier(vm);
+
+	range_debug(range, "NOTIFIER");
+
+	/* Skip if already unmapped or if no binding exist */
+	if (range->base.flags.unmapped || !range->tile_present)
+		return 0;
+
+	range_debug(range, "NOTIFIER - EXECUTE");
+
+	/* Adjust invalidation to range boundaries */
+	*adj_start = min(xe_svm_range_start(range), mmu_range->start);
+	*adj_end = max(xe_svm_range_end(range), mmu_range->end);
+
+	/*
+	 * XXX: Ideally would zap PTEs in one shot in xe_svm_invalidate but the
+	 * invalidation code can't correctly cope with sparse ranges or
+	 * invalidations spanning multiple ranges.
+	 */
+	for_each_tile(tile, xe, id)
+		if (xe_pt_zap_ptes_range(tile, vm, range)) {
+			tile_mask |= BIT(id);
+			range->tile_invalidated |= BIT(id);
+		}
+
+	return tile_mask;
+}
+
+static void
+xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
+				const struct mmu_notifier_range *mmu_range)
+{
+	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
+
+	xe_svm_assert_in_notifier(vm);
+
+	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
+	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
+		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
+						   mmu_range);
+}
+
+static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
+			      struct drm_gpusvm_notifier *notifier,
+			      const struct mmu_notifier_range *mmu_range)
+{
+	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	struct drm_gpusvm_range *r, *first;
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
+	u8 tile_mask = 0;
+	u8 id;
+	u32 fence_id = 0;
+	long err;
+
+	xe_svm_assert_in_notifier(vm);
+
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=%p, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
+	/* Adjust invalidation to notifier boundaries */
+	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
+	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
+
+	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
+	if (!first)
+		return;
+
+	/*
+	 * PTs may be getting destroyed so not safe to touch these but PT should
+	 * be invalidated at this point in time. Regardless we still need to
+	 * ensure any dma mappings are unmapped in the here.
+	 */
+	if (xe_vm_is_closed(vm))
+		goto range_notifier_event_end;
+
+	/*
+	 * XXX: Less than ideal to always wait on VM's resv slots if an
+	 * invalidation is not required. Could walk range list twice to figure
+	 * out if an invalidations is need, but also not ideal.
+	 */
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(err <= 0);
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		tile_mask |= xe_svm_range_notifier_event_begin(vm, r, mmu_range,
+							       &adj_start,
+							       &adj_end);
+	if (!tile_mask)
+		goto range_notifier_event_end;
+
+	xe_device_wmb(xe);
+
+	for_each_tile(tile, xe, id) {
+		if (tile_mask & BIT(id)) {
+			int err;
+
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
+							   &fence[fence_id],
+							   adj_start,
+							   adj_end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->media_gt,
+							   &fence[fence_id],
+							   adj_start,
+							   adj_end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+		}
+	}
+
+wait:
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+
+range_notifier_event_end:
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+}
+
+static int __xe_svm_garbage_collector(struct xe_vm *vm,
+				      struct xe_svm_range *range)
+{
+	struct dma_fence *fence;
+
+	range_debug(range, "GARBAGE COLLECTOR");
+
+	xe_vm_lock(vm, false);
+	fence = xe_vm_range_unbind(vm, range);
+	xe_vm_unlock(vm);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+	dma_fence_put(fence);
+
+	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+
+	return 0;
+}
+
+static int xe_svm_garbage_collector(struct xe_vm *vm)
+{
+	struct xe_svm_range *range;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return -ENOENT;
+
+	spin_lock(&vm->svm.garbage_collector.lock);
+	for (;;) {
+		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
+						 typeof(*range),
+						 garbage_collector_link);
+		if (!range)
+			break;
+
+		list_del(&range->garbage_collector_link);
+		spin_unlock(&vm->svm.garbage_collector.lock);
+
+		err = __xe_svm_garbage_collector(vm, range);
+		if (err) {
+			drm_warn(&vm->xe->drm,
+				 "Garbage collection failed: %pe\n",
+				 ERR_PTR(err));
+			xe_vm_kill(vm, true);
+			return err;
+		}
+
+		spin_lock(&vm->svm.garbage_collector.lock);
+	}
+	spin_unlock(&vm->svm.garbage_collector.lock);
+
+	return 0;
+}
+
+static void xe_svm_garbage_collector_work_func(struct work_struct *w)
+{
+	struct xe_vm *vm = container_of(w, struct xe_vm,
+					svm.garbage_collector.work);
+
+	down_write(&vm->lock);
+	xe_svm_garbage_collector(vm);
+	up_write(&vm->lock);
+}
+
+static struct xe_vram_region *page_to_vr(struct page *page)
+{
+	return container_of(page->pgmap, struct xe_vram_region, pagemap);
+}
+
+static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
+{
+	return container_of(vr, struct xe_tile, mem.vram);
+}
+
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)
+{
+	u64 dpa;
+	struct xe_tile *tile = vr_to_tile(vr);
+	u64 pfn = page_to_pfn(page);
+	u64 offset;
+
+	xe_tile_assert(tile, is_device_private_page(page));
+	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >= vr->hpa_base);
+
+	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
+	dpa = vr->dpa_base + offset;
+
+	return dpa;
+}
+
+enum xe_svm_copy_dir {
+	XE_SVM_COPY_TO_VRAM,
+	XE_SVM_COPY_TO_SRAM,
+};
+
+static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
+		       unsigned long npages, const enum xe_svm_copy_dir dir)
+{
+	struct xe_vram_region *vr = NULL;
+	struct xe_tile *tile;
+	struct dma_fence *fence = NULL;
+	unsigned long i;
+#define XE_VRAM_ADDR_INVALID	~0x0ull
+	u64 vram_addr = XE_VRAM_ADDR_INVALID;
+	int err = 0, pos = 0;
+	bool sram = dir == XE_SVM_COPY_TO_SRAM;
+
+	/*
+	 * This flow is complex: it locates physically contiguous device pages,
+	 * derives the starting physical address, and performs a single GPU copy
+	 * to for every 8M chunk in a DMA address array. Both device pages and
+	 * DMA addresses may be sparsely populated. If either is NULL, a copy is
+	 * triggered based on the current search state. The last GPU copy is
+	 * waited on to ensure all copies are complete.
+	 */
+
+	for (i = 0; i < npages; ++i) {
+		struct page *spage = pages[i];
+		struct dma_fence *__fence;
+		u64 __vram_addr;
+		bool match = false, chunk, last;
+
+#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
+		chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
+		last = (i + 1) == npages;
+
+		/* No CPU page and no device pages queue'd to copy */
+		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
+			continue;
+
+		if (!vr && spage) {
+			vr = page_to_vr(spage);
+			tile = vr_to_tile(vr);
+		}
+		XE_WARN_ON(spage && page_to_vr(spage) != vr);
+
+		/*
+		 * CPU page and device page valid, capture physical address on
+		 * first device page, check if physical contiguous on subsequent
+		 * device pages.
+		 */
+		if (dma_addr[i] && spage) {
+			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
+			if (vram_addr == XE_VRAM_ADDR_INVALID) {
+				vram_addr = __vram_addr;
+				pos = i;
+			}
+
+			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
+		}
+
+		/*
+		 * Mismatched physical address, 8M copy chunk, or last page -
+		 * trigger a copy.
+		 */
+		if (!match || chunk || last) {
+			/*
+			 * Extra page for first copy if last page and matching
+			 * physical address.
+			 */
+			int incr = (match && last) ? 1 : 0;
+
+			if (vram_addr != XE_VRAM_ADDR_INVALID) {
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
+					__fence = xe_migrate_from_vram(tile->migrate,
+								       i - pos + incr,
+								       vram_addr,
+								       dma_addr + pos);
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
+					__fence = xe_migrate_to_vram(tile->migrate,
+								     i - pos + incr,
+								     dma_addr + pos,
+								     vram_addr);
+				}
+				if (IS_ERR(__fence)) {
+					err = PTR_ERR(__fence);
+					goto err_out;
+				}
+
+				dma_fence_put(fence);
+				fence = __fence;
+			}
+
+			/* Setup physical address of next device page */
+			if (dma_addr[i] && spage) {
+				vram_addr = __vram_addr;
+				pos = i;
+			} else {
+				vram_addr = XE_VRAM_ADDR_INVALID;
+			}
+
+			/* Extra mismatched device page, copy it */
+			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       vram_addr, (u64)dma_addr[pos], 1);
+					__fence = xe_migrate_from_vram(tile->migrate, 1,
+								       vram_addr,
+								       dma_addr + pos);
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       (u64)dma_addr[pos], vram_addr, 1);
+					__fence = xe_migrate_to_vram(tile->migrate, 1,
+								     dma_addr + pos,
+								     vram_addr);
+				}
+				if (IS_ERR(__fence)) {
+					err = PTR_ERR(__fence);
+					goto err_out;
+				}
+
+				dma_fence_put(fence);
+				fence = __fence;
+			}
+		}
+	}
+
+err_out:
+	/* Wait for all copies to complete */
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+
+	return err;
+#undef XE_MIGRATE_CHUNK_SIZE
+#undef XE_VRAM_ADDR_INVALID
+}
+
+static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
+				 unsigned long npages)
+{
+	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
+}
+
+static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
+			      unsigned long npages)
+{
+	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
+}
+
+static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
+}
+
+static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+
+	xe_bo_put_async(bo);
+}
+
+static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
+{
+	return PHYS_PFN(offset + vr->hpa_base);
+}
+
+static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
+{
+	return &tile->mem.vram.ttm.mm;
+}
+
+static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
+				      unsigned long npages, unsigned long *pfn)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+	struct ttm_resource *res = bo->ttm.resource;
+	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+	struct drm_buddy_block *block;
+	int j = 0;
+
+	list_for_each_entry(block, blocks, link) {
+		struct xe_vram_region *vr = block->private;
+		struct xe_tile *tile = vr_to_tile(vr);
+		struct drm_buddy *buddy = tile_to_buddy(tile);
+		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
+		int i;
+
+		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
+			pfn[j++] = block_pfn + i;
+	}
+
+	return 0;
+}
+
+static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
+	.devmem_release = xe_svm_devmem_release,
+	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.copy_to_devmem = xe_svm_copy_to_devmem,
+	.copy_to_ram = xe_svm_copy_to_ram,
+};
+
+static const struct drm_gpusvm_ops gpusvm_ops = {
+	.range_alloc = xe_svm_range_alloc,
+	.range_free = xe_svm_range_free,
+	.invalidate = xe_svm_invalidate,
+};
+
+static const unsigned long fault_chunk_sizes[] = {
+	SZ_2M,
+	SZ_64K,
+	SZ_4K,
+};
+
+/**
+ * xe_svm_init() - SVM initialize
+ * @vm: The VM.
+ *
+ * Initialize SVM state which is embedded within the VM.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_init(struct xe_vm *vm)
+{
+	int err;
+
+	spin_lock_init(&vm->svm.garbage_collector.lock);
+	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
+	INIT_WORK(&vm->svm.garbage_collector.work,
+		  xe_svm_garbage_collector_work_func);
+
+	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+			      current->mm, xe_svm_devm_owner(vm->xe), 0,
+			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
+			      &gpusvm_ops, fault_chunk_sizes,
+			      ARRAY_SIZE(fault_chunk_sizes));
+	if (err)
+		return err;
+
+	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+
+	return 0;
+}
+
+/**
+ * xe_svm_close() - SVM close
+ * @vm: The VM.
+ *
+ * Close SVM state (i.e., stop and flush all SVM actions).
+ */
+void xe_svm_close(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	flush_work(&vm->svm.garbage_collector.work);
+}
+
+/**
+ * xe_svm_fini() - SVM finalize
+ * @vm: The VM.
+ *
+ * Finalize SVM state which is embedded within the VM.
+ */
+void xe_svm_fini(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+}
+
+static bool xe_svm_range_is_valid(struct xe_svm_range *range,
+				  struct xe_tile *tile)
+{
+	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
+}
+
+static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
+{
+	return &tile->mem.vram;
+}
+
+static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_svm_range *range,
+			     const struct drm_gpusvm_ctx *ctx)
+{
+	struct mm_struct *mm = vm->svm.gpusvm.mm;
+	struct xe_vram_region *vr = tile_to_vr(tile);
+	struct drm_buddy_block *block;
+	struct list_head *blocks;
+	struct xe_bo *bo;
+	ktime_t end = 0;
+	int err;
+
+	range_debug(range, "ALLOCATE VRAM");
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+	mmap_read_lock(mm);
+
+retry:
+	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
+				 xe_svm_range_size(range),
+				 ttm_bo_type_device,
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_CPU_ADDR_MIRROR);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
+		goto unlock;
+	}
+
+	drm_gpusvm_devmem_init(&bo->devmem_allocation,
+			       vm->xe->drm.dev, mm,
+			       &gpusvm_devmem_ops,
+			       &tile->mem.vram.dpagemap,
+			       xe_svm_range_size(range));
+
+	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+	list_for_each_entry(block, blocks, link)
+		block->private = vr;
+
+	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
+					   &bo->devmem_allocation, ctx);
+	xe_bo_unlock(bo);
+	if (err)
+		xe_bo_put(bo);	/* Creation ref */
+
+unlock:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return err;
+}
+
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @tile: The tile upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic)
+{
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.devmem_possible = IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.check_pages_threshold = IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+	};
+	struct xe_svm_range *range;
+	struct drm_gpusvm_range *r;
+	struct drm_exec exec;
+	struct dma_fence *fence;
+	ktime_t end = 0;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+
+retry:
+	/* Always process UNMAPs first so view SVM ranges is current */
+	err = xe_svm_garbage_collector(vm);
+	if (err)
+		return err;
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
+					    xe_vma_start(vma), xe_vma_end(vma),
+					    &ctx);
+	if (IS_ERR(r))
+		return PTR_ERR(r);
+
+	range = to_xe_range(r);
+	if (xe_svm_range_is_valid(range, tile))
+		return 0;
+
+	range_debug(range, "PAGE FAULT");
+
+	/* XXX: Add migration policy, for now migrate range once */
+	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
+	    xe_svm_range_size(range) >= SZ_64K) {
+		range->skip_migrate = true;
+
+		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		if (err) {
+			drm_dbg(&vm->xe->drm,
+				"VRAM allocation failed, falling back to "
+				"retrying fault, asid=%u, errno %pe\n",
+				vm->usm.asid, ERR_PTR(err));
+			goto retry;
+		}
+	}
+
+	range_debug(range, "GET PAGES");
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	/* Corner where CPU mappings have changed */
+	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
+		if (err == -EOPNOTSUPP) {
+			range_debug(range, "PAGE FAULT - EVICT PAGES");
+			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		}
+		drm_dbg(&vm->xe->drm,
+			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
+			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		range_debug(range, "PAGE FAULT - RETRY PAGES");
+		goto retry;
+	}
+	if (err) {
+		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
+		goto err_out;
+	}
+
+	range_debug(range, "PAGE FAULT - BIND");
+
+retry_bind:
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			drm_exec_fini(&exec);
+			goto err_out;
+		}
+
+		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+		if (IS_ERR(fence)) {
+			drm_exec_fini(&exec);
+			err = PTR_ERR(fence);
+			if (err == -EAGAIN) {
+				range_debug(range, "PAGE FAULT - RETRY BIND");
+				goto retry;
+			}
+			if (xe_vm_validate_should_retry(&exec, err, &end))
+				goto retry_bind;
+			goto err_out;
+		}
+	}
+	drm_exec_fini(&exec);
+
+	if (xe_modparam.always_migrate_to_vram)
+		range->skip_migrate = false;
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+err_out:
+
+	return err;
+}
+
+/**
+ * xe_svm_has_mapping() - SVM has mappings
+ * @vm: The VM.
+ * @start: Start address.
+ * @end: End address.
+ *
+ * Check if an address range has SVM mappings.
+ *
+ * Return: True if address range has a SVM mapping, False otherwise
+ */
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
+}
+
+/**
+ * xe_svm_bo_evict() - SVM evict BO to system memory
+ * @bo: BO to evict
+ *
+ * SVM evict BO to system memory. GPU SVM layer ensures all device pages
+ * are evicted before returning.
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
+}
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+static struct drm_pagemap_device_addr
+xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
+			  struct device *dev,
+			  struct page *page,
+			  unsigned int order,
+			  enum dma_data_direction dir)
+{
+	struct device *pgmap_dev = dpagemap->dev;
+	enum drm_interconnect_protocol prot;
+	dma_addr_t addr;
+
+	if (pgmap_dev == dev) {
+		addr = xe_vram_region_page_to_dpa(page_to_vr(page), page);
+		prot = XE_INTERCONNECT_VRAM;
+	} else {
+		addr = DMA_MAPPING_ERROR;
+		prot = 0;
+	}
+
+	return drm_pagemap_device_addr_encode(addr, prot, order, dir);
+}
+
+static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.device_map = xe_drm_pagemap_device_map,
+};
+
+/**
+ * xe_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region belongs to
+ * @vr: vram memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   vr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	vr->pagemap.range.start = res->start;
+	vr->pagemap.range.end = res->end;
+	vr->pagemap.nr_range = 1;
+	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
+	vr->pagemap.owner = xe_svm_devm_owner(xe);
+	addr = devm_memremap_pages(dev, &vr->pagemap);
+
+	vr->dpagemap.dev = dev;
+	vr->dpagemap.ops = &xe_drm_pagemap_ops;
+
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
+			tile->id, ERR_PTR(ret));
+		return ret;
+	}
+	vr->hpa_base = res->start;
+
+	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
+	return 0;
+}
+#else
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..e059590e5076
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_SVM_H_
+#define _XE_SVM_H_
+
+#include <drm/drm_pagemap.h>
+#include <drm/drm_gpusvm.h>
+
+#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
+
+struct xe_bo;
+struct xe_vram_region;
+struct xe_tile;
+struct xe_vm;
+struct xe_vma;
+
+/** struct xe_svm_range - SVM range */
+struct xe_svm_range {
+	/** @base: base drm_gpusvm_range */
+	struct drm_gpusvm_range base;
+	/**
+	 * @garbage_collector_link: Link into VM's garbage collect SVM range
+	 * list. Protected by VM's garbage collect lock.
+	 */
+	struct list_head garbage_collector_link;
+	/**
+	 * @tile_present: Tile mask of binding is present for this range.
+	 * Protected by GPU SVM notifier lock.
+	 */
+	u8 tile_present;
+	/**
+	 * @tile_invalidated: Tile mask of binding is invalidated for this
+	 * range. Protected by GPU SVM notifier lock.
+	 */
+	u8 tile_invalidated;
+	/**
+	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
+	 * locking.
+	 */
+	u8 skip_migrate	:1;
+};
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+/**
+ * xe_svm_range_pages_valid() - SVM range pages valid
+ * @range: SVM range
+ *
+ * Return: True if SVM range pages are valid, False otherwise
+ */
+static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
+}
+
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
+
+int xe_svm_init(struct xe_vm *vm);
+
+void xe_svm_fini(struct xe_vm *vm);
+
+void xe_svm_close(struct xe_vm *vm);
+
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic);
+
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
+
+int xe_svm_bo_evict(struct xe_bo *bo);
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+#else
+static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
+{
+	return false;
+}
+
+static inline
+int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
+{
+	return 0;
+}
+
+static inline
+int xe_svm_init(struct xe_vm *vm)
+{
+	return 0;
+}
+
+static inline
+void xe_svm_fini(struct xe_vm *vm)
+{
+}
+
+static inline
+void xe_svm_close(struct xe_vm *vm)
+{
+}
+
+static inline
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic)
+{
+	return 0;
+}
+
+static inline
+bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
+{
+	return false;
+}
+
+static inline
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return 0;
+}
+
+static inline
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+}
+#endif
+
+/**
+ * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
+ * @range: SVM range
+ *
+ * Return: True if SVM range has a DMA mapping, False otherwise
+ */
+static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
+	return range->base.flags.has_dma_mapping;
+}
+
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d29658ff4dd4..0771acbbf367 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -13,6 +13,7 @@
 #include "xe_migrate.h"
 #include "xe_pcode.h"
 #include "xe_sa.h"
+#include "xe_svm.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
@@ -160,6 +161,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
 	err = tile_ttm_mgr_init(tile);
@@ -168,6 +170,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
+	if (xe->info.has_usm && IS_DGFX(xe))
+		xe_devm_add(tile, &tile->mem.vram);
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..7b68d89b7f5a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -8,6 +8,7 @@
 #include <linux/dma-fence-array.h>
 #include <linux/nospec.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_tt.h>
@@ -35,6 +36,7 @@
 #include "xe_pt.h"
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
@@ -918,6 +920,179 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	return fence;
 }
 
+static void xe_vm_populate_range_rebind(struct xe_vma_op *op,
+					struct xe_vma *vma,
+					struct xe_svm_range *range,
+					u8 tile_mask)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = tile_mask;
+	op->base.op = DRM_GPUVA_OP_DRIVER;
+	op->subop = XE_VMA_SUBOP_MAP_RANGE;
+	op->map_range.vma = vma;
+	op->map_range.range = range;
+}
+
+static int
+xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
+			   struct xe_vma *vma,
+			   struct xe_svm_range *range,
+			   u8 tile_mask)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
+	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+
+	return 0;
+}
+
+/**
+ * xe_vm_range_rebind() - VM range (re)bind
+ * @vm: The VM which the range belongs to.
+ * @vma: The VMA which the range belongs to.
+ * @range: SVM range to rebind.
+ * @tile_mask: Tile mask to bind the range to.
+ *
+ * (re)bind SVM range setting up GPU page tables for the range.
+ *
+ * Return: dma fence for rebind to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
+				     struct xe_vma *vma,
+				     struct xe_svm_range *range,
+				     u8 tile_mask)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_exec_queue(tile);
+	}
+
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	if (err)
+		return ERR_PTR(err);
+
+	err = xe_vma_ops_alloc(&vops, false);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
+	fence = ops_execute(vm, &vops);
+
+free_ops:
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
+	}
+	xe_vma_ops_fini(&vops);
+
+	return fence;
+}
+
+static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
+					struct xe_svm_range *range)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = range->tile_present;
+	op->base.op = DRM_GPUVA_OP_DRIVER;
+	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
+	op->unmap_range.range = range;
+}
+
+static int
+xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
+			   struct xe_svm_range *range)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_range_unbind(op, range);
+	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+
+	return 0;
+}
+
+/**
+ * xe_vm_range_unbind() - VM range unbind
+ * @vm: The VM which the range belongs to.
+ * @range: SVM range to rebind.
+ *
+ * Unbind SVM range removing the GPU page tables for the range.
+ *
+ * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
+				     struct xe_svm_range *range)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+
+	if (!range->tile_present)
+		return dma_fence_get_stub();
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_exec_queue(tile);
+	}
+
+	err = xe_vm_ops_add_range_unbind(&vops, range);
+	if (err)
+		return ERR_PTR(err);
+
+	err = xe_vma_ops_alloc(&vops, false);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
+	fence = ops_execute(vm, &vops);
+
+free_ops:
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
+	}
+	xe_vma_ops_fini(&vops);
+
+	return fence;
+}
+
 static void xe_vma_free(struct xe_vma *vma)
 {
 	if (xe_vma_is_userptr(vma))
@@ -926,9 +1101,10 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
-#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
-#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
-#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
+#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
+#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
+#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -942,6 +1118,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
+	bool is_cpu_addr_mirror =
+		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -950,7 +1128,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	 * Allocate and ensure that the xe_vma_is_userptr() return
 	 * matches what was allocated.
 	 */
-	if (!bo && !is_null) {
+	if (!bo && !is_null && !is_cpu_addr_mirror) {
 		struct xe_userptr_vma *uvma = kzalloc(sizeof(*uvma), GFP_KERNEL);
 
 		if (!uvma)
@@ -962,6 +1140,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
+		if (is_cpu_addr_mirror)
+			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
 		if (is_null)
 			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 		if (bo)
@@ -1004,7 +1184,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gpuva_link(&vma->gpuva, vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
-		if (!is_null) {
+		if (!is_null && !is_cpu_addr_mirror) {
 			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
 			u64 size = end - start + 1;
 			int err;
@@ -1054,7 +1234,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		 */
 		mmu_interval_notifier_remove(&userptr->notifier);
 		xe_vm_put(vm);
-	} else if (xe_vma_is_null(vma)) {
+	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
 	} else {
 		xe_bo_put(xe_vma_bo(vma));
@@ -1094,7 +1274,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_assert(vm->xe, list_empty(&to_userptr_vma(vma)->userptr.repin_link));
 		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
-	} else if (!xe_vma_is_null(vma)) {
+	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
 		drm_gpuva_unlink(&vma->gpuva);
@@ -1545,6 +1725,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
+	if (flags & XE_VM_FLAG_FAULT_MODE) {
+		err = xe_svm_init(vm);
+		if (err)
+			goto err_close;
+	}
+
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
@@ -1571,9 +1757,43 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 static void xe_vm_close(struct xe_vm *vm)
 {
+	struct xe_device *xe = vm->xe;
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
 	down_write(&vm->lock);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_lock(vm);
+
 	vm->size = 0;
+
+	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
+		struct xe_tile *tile;
+		struct xe_gt *gt;
+		u8 id;
+
+		/* Wait for pending binds */
+		dma_resv_wait_timeout(xe_vm_resv(vm),
+				      DMA_RESV_USAGE_BOOKKEEP,
+				      false, MAX_SCHEDULE_TIMEOUT);
+
+		if (bound) {
+			for_each_tile(tile, xe, id)
+				if (vm->pt_root[id])
+					xe_pt_clear(xe, vm->pt_root[id]);
+
+			for_each_gt(gt, xe, id)
+				xe_gt_tlb_invalidation_vm(gt, vm);
+		}
+	}
+
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_unlock(vm);
 	up_write(&vm->lock);
+
+	drm_dev_exit(idx);
 }
 
 void xe_vm_close_and_put(struct xe_vm *vm)
@@ -1590,6 +1810,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_close(vm);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1658,6 +1880,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
@@ -2014,6 +2239,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+			op->map.is_cpu_addr_mirror = flags &
+				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
@@ -2206,6 +2433,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->map.is_cpu_addr_mirror ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2213,7 +2442,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
-			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
+			    !op->map.is_cpu_addr_mirror)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask);
 			break;
@@ -2222,21 +2452,35 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		{
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
+			bool skip = xe_vma_is_cpu_addr_mirror(old);
+			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+
+			if (op->base.remap.prev)
+				start = op->base.remap.prev->va.addr +
+					op->base.remap.prev->va.range;
+			if (op->base.remap.next)
+				end = op->base.remap.next->va.addr;
+
+			if (xe_vma_is_cpu_addr_mirror(old) &&
+			    xe_svm_has_mapping(vm, start, end))
+				return -EBUSY;
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
 
-			if (op->base.remap.prev) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_READ_ONLY ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				DRM_GPUVA_SPARSE ?
+				VMA_CREATE_FLAG_IS_NULL : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_DUMPABLE ?
+				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= xe_vma_is_cpu_addr_mirror(old) ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
+			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2248,9 +2492,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+				op->remap.skip_prev = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_end(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_prev) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2266,16 +2511,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			}
 
 			if (op->base.remap.next) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
-
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2287,9 +2522,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_next = !xe_vma_is_userptr(old) &&
+				op->remap.skip_next = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_start(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_next) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2302,14 +2538,32 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!skip)
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+			if (xe_vma_is_cpu_addr_mirror(vma) &&
+			    xe_svm_has_mapping(vm, xe_vma_start(vma),
+					       xe_vma_end(vma)))
+				return -EBUSY;
+
+			if (!xe_vma_is_cpu_addr_mirror(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			break;
+		}
 		case DRM_GPUVA_OP_PREFETCH:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
 			/* FIXME: Need to skip some prefetch ops */
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!xe_vma_is_cpu_addr_mirror(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
+		}
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
@@ -2534,6 +2788,8 @@ static void op_trace(struct xe_vma_op *op)
 	case DRM_GPUVA_OP_PREFETCH:
 		trace_xe_vma_bind(gpuva_to_vma(op->base.prefetch.va));
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		break;
 	default:
 		XE_WARN_ON("NOT POSSIBLE");
 	}
@@ -2711,9 +2967,11 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 	}
 	if (ufence)
 		xe_sync_ufence_put(ufence);
-	for (i = 0; i < vops->num_syncs; i++)
-		xe_sync_entry_signal(vops->syncs + i, fence);
-	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
+	if (fence) {
+		for (i = 0; i < vops->num_syncs; i++)
+			xe_sync_entry_signal(vops->syncs + i, fence);
+		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
+	}
 }
 
 static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
@@ -2736,8 +2994,11 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		}
 
 		fence = ops_execute(vm, vops);
-		if (IS_ERR(fence))
+		if (IS_ERR(fence)) {
+			if (PTR_ERR(fence) == -ENODATA)
+				vm_bind_ioctl_ops_fini(vm, vops, NULL);
 			goto unlock;
+		}
 
 		vm_bind_ioctl_ops_fini(vm, vops, fence);
 	}
@@ -2753,7 +3014,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
-	 DRM_XE_VM_BIND_FLAG_CHECK_PXP)
+	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
+	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -2764,7 +3026,7 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
-static int vm_bind_ioctl_check_args(struct xe_device *xe,
+static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
 {
@@ -2809,9 +3071,18 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		bool is_cpu_addr_mirror = flags &
+			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
+		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
+				 (!xe_vm_in_fault_mode(vm) ||
+				 !IS_ENABLED(CONFIG_DRM_GPUSVM)))) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -2832,13 +3103,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
-		    XE_IOCTL_DBG(xe, obj && is_null) ||
-		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
+		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
+		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
+						    is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 is_null) ||
+				 (is_null || is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
-				 !is_null) ||
+				 !is_null && !is_cpu_addr_mirror) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
@@ -2987,15 +3259,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
 	if (err)
-		return err;
+		goto put_vm;
 
 	if (args->exec_queue_id) {
 		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 		if (XE_IOCTL_DBG(xe, !q)) {
 			err = -ENOENT;
-			goto free_objs;
+			goto put_vm;
 		}
 
 		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
@@ -3004,15 +3280,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_DBG(xe, !vm)) {
-		err = -EINVAL;
-		goto put_exec_queue;
-	}
+	/* Ensure all UNMAPs visible */
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->svm.garbage_collector.work);
 
 	err = down_write_killable(&vm->lock);
 	if (err)
-		goto put_vm;
+		goto put_exec_queue;
 
 	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
 		err = -ENOENT;
@@ -3176,12 +3450,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_bo_put(bos[i]);
 release_vm_lock:
 	up_write(&vm->lock);
-put_vm:
-	xe_vm_put(vm);
 put_exec_queue:
 	if (q)
 		xe_exec_queue_put(q);
-free_objs:
+put_vm:
+	xe_vm_put(vm);
 	kvfree(bos);
 	kvfree(ops);
 	if (args->num_binds > 1)
@@ -3313,6 +3586,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	int ret = 0;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
+	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
 	trace_xe_vma_invalidate(vma);
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..83adde1a84bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -23,6 +23,7 @@ struct dma_fence;
 struct xe_exec_queue;
 struct xe_file;
 struct xe_sync_entry;
+struct xe_svm_range;
 struct drm_exec;
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
@@ -152,6 +153,11 @@ static inline bool xe_vma_is_null(struct xe_vma *vma)
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
 }
 
+static inline bool xe_vma_is_cpu_addr_mirror(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
+}
+
 static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !xe_vma_bo(vma);
@@ -159,7 +165,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
-	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
+		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
 /**
@@ -212,6 +219,12 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm);
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
+struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
+				     struct xe_vma *vma,
+				     struct xe_svm_range *range,
+				     u8 tile_mask);
+struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
+				     struct xe_svm_range *range);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52467b9b5348..0b59ba948e86 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
+#include <drm/drm_gpusvm.h>
 #include <drm/drm_gpuvm.h>
 
 #include <linux/dma-resv.h>
@@ -18,6 +19,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
@@ -42,6 +44,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
+#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -139,6 +142,30 @@ struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
 
+	/** @svm: Shared virtual memory state */
+	struct {
+		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
+		struct drm_gpusvm gpusvm;
+		/**
+		 * @svm.garbage_collector: Garbage collector which is used unmap
+		 * SVM range's GPU bindings and destroy the ranges.
+		 */
+		struct {
+			/** @svm.garbage_collector.lock: Protect's range list */
+			spinlock_t lock;
+			/**
+			 * @svm.garbage_collector.range_list: List of SVM ranges
+			 * in the garbage collector.
+			 */
+			struct list_head range_list;
+			/**
+			 * @svm.garbage_collector.work: Worker which the
+			 * garbage collector runs on.
+			 */
+			struct work_struct work;
+		} garbage_collector;
+	} svm;
+
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
@@ -295,6 +322,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @is_cpu_addr_mirror: is CPU address mirror binding */
+	bool is_cpu_addr_mirror;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
@@ -325,6 +354,20 @@ struct xe_vma_op_prefetch {
 	u32 region;
 };
 
+/** struct xe_vma_op_map_range - VMA map range operation */
+struct xe_vma_op_map_range {
+	/** @vma: VMA to map (system allocator VMA) */
+	struct xe_vma *vma;
+	/** @range: SVM range to map */
+	struct xe_svm_range *range;
+};
+
+/** struct xe_vma_op_unmap_range - VMA unmap range operation */
+struct xe_vma_op_unmap_range {
+	/** @range: SVM range to unmap */
+	struct xe_svm_range *range;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -335,6 +378,14 @@ enum xe_vma_op_flags {
 	XE_VMA_OP_NEXT_COMMITTED	= BIT(2),
 };
 
+/** enum xe_vma_subop - VMA sub-operation */
+enum xe_vma_subop {
+	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
+	XE_VMA_SUBOP_MAP_RANGE,
+	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
+	XE_VMA_SUBOP_UNMAP_RANGE,
+};
+
 /** struct xe_vma_op - VMA operation */
 struct xe_vma_op {
 	/** @base: GPUVA base operation */
@@ -343,6 +394,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
+	/** @subop: user defined sub-operation */
+	enum xe_vma_subop subop;
 	/** @tile_mask: Tile mask for operation */
 	u8 tile_mask;
 
@@ -353,6 +406,10 @@ struct xe_vma_op {
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
 		struct xe_vma_op_prefetch prefetch;
+		/** @map_range: VMA map range operation specific data */
+		struct xe_vma_op_map_range map_range;
+		/** @unmap_range: VMA unmap range operation specific data */
+		struct xe_vma_op_unmap_range unmap_range;
 	};
 };
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
new file mode 100644
index 000000000000..df120b4d1f83
--- /dev/null
+++ b/include/drm/drm_gpusvm.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __DRM_GPUSVM_H__
+#define __DRM_GPUSVM_H__
+
+#include <linux/kref.h>
+#include <linux/interval_tree.h>
+#include <linux/mmu_notifier.h>
+
+struct dev_pagemap_ops;
+struct drm_device;
+struct drm_gpusvm;
+struct drm_gpusvm_notifier;
+struct drm_gpusvm_ops;
+struct drm_gpusvm_range;
+struct drm_gpusvm_devmem;
+struct drm_pagemap;
+struct drm_pagemap_device_addr;
+
+/**
+ * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
+ *
+ * This structure defines the operations for GPU Shared Virtual Memory (SVM)
+ * device memory. These operations are provided by the GPU driver to manage device memory
+ * allocations and perform operations such as migration between device memory and system
+ * RAM.
+ */
+struct drm_gpusvm_devmem_ops {
+	/**
+	 * @devmem_release: Release device memory allocation (optional)
+	 * @devmem_allocation: device memory allocation
+	 *
+	 * Release device memory allocation and drop a reference to device
+	 * memory allocation.
+	 */
+	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
+
+	/**
+	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @devmem_allocation: device memory allocation
+	 * @npages: Number of pages to populate
+	 * @pfn: Array of page frame numbers to populate
+	 *
+	 * Populate device memory page frame numbers (PFN).
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
+				   unsigned long npages, unsigned long *pfn);
+
+	/**
+	 * @copy_to_devmem: Copy to device memory (required for migration)
+	 * @pages: Pointer to array of device memory pages (destination)
+	 * @dma_addr: Pointer to array of DMA addresses (source)
+	 * @npages: Number of pages to copy
+	 *
+	 * Copy pages to device memory.
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*copy_to_devmem)(struct page **pages,
+			      dma_addr_t *dma_addr,
+			      unsigned long npages);
+
+	/**
+	 * @copy_to_ram: Copy to system RAM (required for migration)
+	 * @pages: Pointer to array of device memory pages (source)
+	 * @dma_addr: Pointer to array of DMA addresses (destination)
+	 * @npages: Number of pages to copy
+	 *
+	 * Copy pages to system RAM.
+	 *
+	 * Return: 0 on success, a negative error code on failure.
+	 */
+	int (*copy_to_ram)(struct page **pages,
+			   dma_addr_t *dma_addr,
+			   unsigned long npages);
+};
+
+/**
+ * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
+ *
+ * @dev: Pointer to the device structure which device memory allocation belongs to
+ * @mm: Pointer to the mm_struct for the address space
+ * @detached: device memory allocations is detached from device pages
+ * @ops: Pointer to the operations structure for GPU SVM device memory
+ * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
+ * @size: Size of device memory allocation
+ */
+struct drm_gpusvm_devmem {
+	struct device *dev;
+	struct mm_struct *mm;
+	struct completion detached;
+	const struct drm_gpusvm_devmem_ops *ops;
+	struct drm_pagemap *dpagemap;
+	size_t size;
+};
+
+/**
+ * struct drm_gpusvm_ops - Operations structure for GPU SVM
+ *
+ * This structure defines the operations for GPU Shared Virtual Memory (SVM).
+ * These operations are provided by the GPU driver to manage SVM ranges and
+ * notifiers.
+ */
+struct drm_gpusvm_ops {
+	/**
+	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
+	 *
+	 * Allocate a GPU SVM notifier.
+	 *
+	 * Return: Pointer to the allocated GPU SVM notifier on success, NULL on failure.
+	 */
+	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
+
+	/**
+	 * @notifier_free: Free a GPU SVM notifier (optional)
+	 * @notifier: Pointer to the GPU SVM notifier to be freed
+	 *
+	 * Free a GPU SVM notifier.
+	 */
+	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
+
+	/**
+	 * @range_alloc: Allocate a GPU SVM range (optional)
+	 * @gpusvm: Pointer to the GPU SVM
+	 *
+	 * Allocate a GPU SVM range.
+	 *
+	 * Return: Pointer to the allocated GPU SVM range on success, NULL on failure.
+	 */
+	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
+
+	/**
+	 * @range_free: Free a GPU SVM range (optional)
+	 * @range: Pointer to the GPU SVM range to be freed
+	 *
+	 * Free a GPU SVM range.
+	 */
+	void (*range_free)(struct drm_gpusvm_range *range);
+
+	/**
+	 * @invalidate: Invalidate GPU SVM notifier (required)
+	 * @gpusvm: Pointer to the GPU SVM
+	 * @notifier: Pointer to the GPU SVM notifier
+	 * @mmu_range: Pointer to the mmu_notifier_range structure
+	 *
+	 * Invalidate the GPU page tables. It can safely walk the notifier range
+	 * RB tree/list in this function. Called while holding the notifier lock.
+	 */
+	void (*invalidate)(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_notifier *notifier,
+			   const struct mmu_notifier_range *mmu_range);
+};
+
+/**
+ * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
+ *
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: MMU interval notifier
+ * @itree: Interval tree node for the notifier (inserted in GPU SVM)
+ * @entry: List entry to fast interval tree traversal
+ * @root: Cached root node of the RB tree containing ranges
+ * @range_list: List head containing of ranges in the same order they appear in
+ *              interval tree. This is useful to keep iterating ranges while
+ *              doing modifications to RB tree.
+ * @flags: Flags for notifier
+ * @flags.removed: Flag indicating whether the MMU interval notifier has been
+ *                 removed
+ *
+ * This structure represents a GPU SVM notifier.
+ */
+struct drm_gpusvm_notifier {
+	struct drm_gpusvm *gpusvm;
+	struct mmu_interval_notifier notifier;
+	struct interval_tree_node itree;
+	struct list_head entry;
+	struct rb_root_cached root;
+	struct list_head range_list;
+	struct {
+		u32 removed : 1;
+	} flags;
+};
+
+/**
+ * struct drm_gpusvm_range - Structure representing a GPU SVM range
+ *
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @notifier: Pointer to the GPU SVM notifier
+ * @refcount: Reference count for the range
+ * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
+ * @entry: List entry to fast interval tree traversal
+ * @notifier_seq: Notifier sequence number of the range's pages
+ * @dma_addr: Device address array
+ * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
+ *            Note this is assuming only one drm_pagemap per range is allowed.
+ * @flags: Flags for range
+ * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
+ * @flags.unmapped: Flag indicating if the range has been unmapped
+ * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
+ * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
+ * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
+ *
+ * This structure represents a GPU SVM range used for tracking memory ranges
+ * mapped in a DRM device.
+ */
+struct drm_gpusvm_range {
+	struct drm_gpusvm *gpusvm;
+	struct drm_gpusvm_notifier *notifier;
+	struct kref refcount;
+	struct interval_tree_node itree;
+	struct list_head entry;
+	unsigned long notifier_seq;
+	struct drm_pagemap_device_addr *dma_addr;
+	struct drm_pagemap *dpagemap;
+	struct {
+		/* All flags below must be set upon creation */
+		u16 migrate_devmem : 1;
+		/* All flags below must be set / cleared under notifier lock */
+		u16 unmapped : 1;
+		u16 partial_unmap : 1;
+		u16 has_devmem_pages : 1;
+		u16 has_dma_mapping : 1;
+	} flags;
+};
+
+/**
+ * struct drm_gpusvm - GPU SVM structure
+ *
+ * @name: Name of the GPU SVM
+ * @drm: Pointer to the DRM device structure
+ * @mm: Pointer to the mm_struct for the address space
+ * @device_private_page_owner: Device private pages owner
+ * @mm_start: Start address of GPU SVM
+ * @mm_range: Range of the GPU SVM
+ * @notifier_size: Size of individual notifiers
+ * @ops: Pointer to the operations structure for GPU SVM
+ * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
+ *               Entries should be powers of 2 in descending order.
+ * @num_chunks: Number of chunks
+ * @notifier_lock: Read-write semaphore for protecting notifier operations
+ * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
+ * @notifier_list: list head containing of notifiers in the same order they
+ *                 appear in interval tree. This is useful to keep iterating
+ *                 notifiers while doing modifications to RB tree.
+ *
+ * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
+ * memory ranges mapped in a DRM (Direct Rendering Manager) device.
+ *
+ * No reference counting is provided, as this is expected to be embedded in the
+ * driver VM structure along with the struct drm_gpuvm, which handles reference
+ * counting.
+ */
+struct drm_gpusvm {
+	const char *name;
+	struct drm_device *drm;
+	struct mm_struct *mm;
+	void *device_private_page_owner;
+	unsigned long mm_start;
+	unsigned long mm_range;
+	unsigned long notifier_size;
+	const struct drm_gpusvm_ops *ops;
+	const unsigned long *chunk_sizes;
+	int num_chunks;
+	struct rw_semaphore notifier_lock;
+	struct rb_root_cached root;
+	struct list_head notifier_list;
+#ifdef CONFIG_LOCKDEP
+	/**
+	 * @lock_dep_map: Annotates drm_gpusvm_range_find_or_insert and
+	 * drm_gpusvm_range_remove with a driver provided lock.
+	 */
+	struct lockdep_map *lock_dep_map;
+#endif
+};
+
+/**
+ * struct drm_gpusvm_ctx - DRM GPU SVM context
+ *
+ * @check_pages_threshold: Check CPU pages for present if chunk is less than or
+ *                         equal to threshold. If not present, reduce chunk
+ *                         size.
+ * @in_notifier: entering from a MMU notifier
+ * @read_only: operating on read-only memory
+ * @devmem_possible: possible to use device memory
+ *
+ * Context that is DRM GPUSVM is operating in (i.e. user arguments).
+ */
+struct drm_gpusvm_ctx {
+	unsigned long check_pages_threshold;
+	unsigned int in_notifier :1;
+	unsigned int read_only :1;
+	unsigned int devmem_possible :1;
+};
+
+int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
+		    const char *name, struct drm_device *drm,
+		    struct mm_struct *mm, void *device_private_page_owner,
+		    unsigned long mm_start, unsigned long mm_range,
+		    unsigned long notifier_size,
+		    const struct drm_gpusvm_ops *ops,
+		    const unsigned long *chunk_sizes, int num_chunks);
+
+void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
+
+void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
+
+struct drm_gpusvm_range *
+drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
+				unsigned long fault_addr,
+				unsigned long gpuva_start,
+				unsigned long gpuva_end,
+				const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
+			     struct drm_gpusvm_range *range);
+
+int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_range *range);
+
+struct drm_gpusvm_range *
+drm_gpusvm_range_get(struct drm_gpusvm_range *range);
+
+void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
+
+bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
+				  struct drm_gpusvm_range *range);
+
+int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
+			       struct drm_gpusvm_range *range,
+			       const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
+				  struct drm_gpusvm_range *range,
+				  const struct drm_gpusvm_ctx *ctx);
+
+int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
+				 struct drm_gpusvm_range *range,
+				 struct drm_gpusvm_devmem *devmem_allocation,
+				 const struct drm_gpusvm_ctx *ctx);
+
+int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
+
+const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
+
+bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
+			    unsigned long end);
+
+struct drm_gpusvm_range *
+drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
+		      unsigned long end);
+
+void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
+				   const struct mmu_notifier_range *mmu_range);
+
+void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
+			    struct device *dev, struct mm_struct *mm,
+			    const struct drm_gpusvm_devmem_ops *ops,
+			    struct drm_pagemap *dpagemap, size_t size);
+
+#ifdef CONFIG_LOCKDEP
+/**
+ * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @lock: the lock used to protect the gpuva list. The locking primitive
+ * must contain a dep_map field.
+ *
+ * Call this to annotate drm_gpusvm_range_find_or_insert and
+ * drm_gpusvm_range_remove.
+ */
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)
+#else
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)
+#endif
+
+/**
+ * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract client usage GPU SVM notifier lock, take lock
+ */
+#define drm_gpusvm_notifier_lock(gpusvm__)	\
+	down_read(&(gpusvm__)->notifier_lock)
+
+/**
+ * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract client usage GPU SVM notifier lock, drop lock
+ */
+#define drm_gpusvm_notifier_unlock(gpusvm__)	\
+	up_read(&(gpusvm__)->notifier_lock)
+
+/**
+ * drm_gpusvm_range_start() - GPU SVM range start address
+ * @range: Pointer to the GPU SVM range
+ *
+ * Return: GPU SVM range start address
+ */
+static inline unsigned long
+drm_gpusvm_range_start(struct drm_gpusvm_range *range)
+{
+	return range->itree.start;
+}
+
+/**
+ * drm_gpusvm_range_end() - GPU SVM range end address
+ * @range: Pointer to the GPU SVM range
+ *
+ * Return: GPU SVM range end address
+ */
+static inline unsigned long
+drm_gpusvm_range_end(struct drm_gpusvm_range *range)
+{
+	return range->itree.last + 1;
+}
+
+/**
+ * drm_gpusvm_range_size() - GPU SVM range size
+ * @range: Pointer to the GPU SVM range
+ *
+ * Return: GPU SVM range size
+ */
+static inline unsigned long
+drm_gpusvm_range_size(struct drm_gpusvm_range *range)
+{
+	return drm_gpusvm_range_end(range) - drm_gpusvm_range_start(range);
+}
+
+/**
+ * drm_gpusvm_notifier_start() - GPU SVM notifier start address
+ * @notifier: Pointer to the GPU SVM notifier
+ *
+ * Return: GPU SVM notifier start address
+ */
+static inline unsigned long
+drm_gpusvm_notifier_start(struct drm_gpusvm_notifier *notifier)
+{
+	return notifier->itree.start;
+}
+
+/**
+ * drm_gpusvm_notifier_end() - GPU SVM notifier end address
+ * @notifier: Pointer to the GPU SVM notifier
+ *
+ * Return: GPU SVM notifier end address
+ */
+static inline unsigned long
+drm_gpusvm_notifier_end(struct drm_gpusvm_notifier *notifier)
+{
+	return notifier->itree.last + 1;
+}
+
+/**
+ * drm_gpusvm_notifier_size() - GPU SVM notifier size
+ * @notifier: Pointer to the GPU SVM notifier
+ *
+ * Return: GPU SVM notifier size
+ */
+static inline unsigned long
+drm_gpusvm_notifier_size(struct drm_gpusvm_notifier *notifier)
+{
+	return drm_gpusvm_notifier_end(notifier) -
+		drm_gpusvm_notifier_start(notifier);
+}
+
+/**
+ * __drm_gpusvm_range_next() - Get the next GPU SVM range in the list
+ * @range: a pointer to the current GPU SVM range
+ *
+ * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
+ *         current range is the last one or if the input range is NULL.
+ */
+static inline struct drm_gpusvm_range *
+__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
+{
+	if (range && !list_is_last(&range->entry,
+				   &range->notifier->range_list))
+		return list_next_entry(range, entry);
+
+	return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_range() - Iterate over GPU SVM ranges in a notifier
+ * @range__: Iterator variable for the ranges. If set, it indicates the start of
+ *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the range
+ * @end__: End address of the range
+ *
+ * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
+ * to use while holding the driver SVM lock or the notifier lock.
+ */
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))
+
+#endif /* __DRM_GPUSVM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..2a9629377633 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
 	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
 	 */
 	DRM_GPUVA_OP_PREFETCH,
+
+	/**
+	 * @DRM_GPUVA_OP_DRIVER: the driver defined op type
+	 */
+	DRM_GPUVA_OP_DRIVER,
 };
 
 /**
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
new file mode 100644
index 000000000000..d561ca7ff0e6
--- /dev/null
+++ b/include/drm/drm_pagemap.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef _DRM_PAGEMAP_H_
+#define _DRM_PAGEMAP_H_
+
+#include <linux/dma-direction.h>
+#include <linux/hmm.h>
+#include <linux/types.h>
+
+struct drm_pagemap;
+struct device;
+
+/**
+ * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
+ *
+ * @DRM_INTERCONNECT_SYSTEM: DMA map is system pages
+ * @DRM_INTERCONNECT_PCIE_P2P: DMA map is PCIE P2P
+ * @DRM_INTERCONNECT_DRIVER: DMA map is driver defined
+ */
+enum drm_interconnect_protocol {
+	DRM_INTERCONNECT_SYSTEM,
+	DRM_INTERCONNECT_PCIE_P2P,
+	DRM_INTERCONNECT_DRIVER,
+	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
+};
+
+/**
+ * struct drm_pagemap_device_addr - Device address representation.
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Note: There is room for improvement here. We should be able to pack into
+ * 64 bits.
+ */
+struct drm_pagemap_device_addr {
+	dma_addr_t addr;
+	u64 proto : 54;
+	u64 order : 8;
+	u64 dir : 2;
+};
+
+/**
+ * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Return: A struct drm_pagemap_device_addr encoding the above information.
+ */
+static inline struct drm_pagemap_device_addr
+drm_pagemap_device_addr_encode(dma_addr_t addr,
+			       enum drm_interconnect_protocol proto,
+			       unsigned int order,
+			       enum dma_data_direction dir)
+{
+	return (struct drm_pagemap_device_addr) {
+		.addr = addr,
+		.proto = proto,
+		.order = order,
+		.dir = dir,
+	};
+}
+
+/**
+ * struct drm_pagemap_ops: Ops for a drm-pagemap.
+ */
+struct drm_pagemap_ops {
+	/**
+	 * @device_map: Map for device access or provide a virtual address suitable for
+	 *
+	 * @dpagemap: The struct drm_pagemap for the page.
+	 * @dev: The device mapper.
+	 * @page: The page to map.
+	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
+	 * @dir: The transfer direction.
+	 */
+	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
+						     struct device *dev,
+						     struct page *page,
+						     unsigned int order,
+						     enum dma_data_direction dir);
+
+	/**
+	 * @device_unmap: Unmap a device address previously obtained using @device_map.
+	 *
+	 * @dpagemap: The struct drm_pagemap for the mapping.
+	 * @dev: The device unmapper.
+	 * @addr: The device address obtained when mapping.
+	 */
+	void (*device_unmap)(struct drm_pagemap *dpagemap,
+			     struct device *dev,
+			     struct drm_pagemap_device_addr addr);
+
+};
+
+/**
+ * struct drm_pagemap: Additional information for a struct dev_pagemap
+ * used for device p2p handshaking.
+ * @ops: The struct drm_pagemap_ops.
+ * @dev: The struct drevice owning the device-private memory.
+ */
+struct drm_pagemap {
+	const struct drm_pagemap_ops *ops;
+	struct device *dev;
+};
+
+#endif
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 29919faea2f1..80891120cca9 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -227,6 +227,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages);
+int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
 void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 76a462fae05f..637ae048d344 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
+ *      device has CPU address mirroring support
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -987,6 +990,12 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
  *    reject the binding if the encryption key is no longer valid. This
  *    flag has no effect on BOs that are not marked as using PXP.
+ *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror flag is
+ *    set, no mappings are created rather the range is reserved for CPU address
+ *    mirroring which will be populated on GPU page faults or prefetches. Only
+ *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
+ *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
+ *    handle MBZ, and the BO offset MBZ.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1039,7 +1048,9 @@ struct drm_xe_vm_bind_op {
 	 * on the @pat_index. For such mappings there is no actual memory being
 	 * mapped (the address in the PTE is invalid), so the various PAT memory
 	 * attributes likely do not apply.  Simply leaving as zero is one
-	 * option (still a valid pat_index).
+	 * option (still a valid pat_index). Same applies to
+	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
+	 * there is no actual memory being mapped.
 	 */
 	__u16 pat_index;
 
@@ -1055,6 +1066,14 @@ struct drm_xe_vm_bind_op {
 
 		/** @userptr: user pointer to bind on */
 		__u64 userptr;
+
+		/**
+		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
+		 * CPU address mirror mappings. MBZ with current level of
+		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
+		 * only supported).
+		 */
+		__s64 cpu_addr_mirror_offset;
 	};
 
 	/**
@@ -1078,6 +1097,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
+#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/mm/memory.c b/mm/memory.c
index b4d3d4893267..59b804f4bf3f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4348,10 +4348,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			 * Get a page reference while we know the page can't be
 			 * freed.
 			 */
-			get_page(vmf->page);
-			pte_unmap_unlock(vmf->pte, vmf->ptl);
-			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
-			put_page(vmf->page);
+			if (trylock_page(vmf->page)) {
+				get_page(vmf->page);
+				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
+				unlock_page(vmf->page);
+				put_page(vmf->page);
+			} else {
+				pte_unmap_unlock(vmf->pte, vmf->ptl);
+			}
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
 		} else if (is_pte_marker_entry(entry)) {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5bd888223cc8..0dc66b7a58c9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   struct mm_walk *walk)
 {
 	struct migrate_vma *migrate = walk->private;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
 	struct vm_area_struct *vma = walk->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long addr = start, unmapped = 0;
@@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			folio_get(folio);
 			spin_unlock(ptl);
+			/* FIXME: we don't expect THP for fault_folio */
+			if (WARN_ON_ONCE(fault_folio == folio))
+				return migrate_vma_collect_skip(start, end,
+								walk);
 			if (unlikely(!folio_trylock(folio)))
 				return migrate_vma_collect_skip(start, end,
 								walk);
 			ret = split_folio(folio);
-			folio_unlock(folio);
+			if (fault_folio != folio)
+				folio_unlock(folio);
 			folio_put(folio);
 			if (ret)
 				return migrate_vma_collect_skip(start, end,
@@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		 * optimisation to avoid walking the rmap later with
 		 * try_to_migrate().
 		 */
-		if (folio_trylock(folio)) {
+		if (fault_folio == folio || folio_trylock(folio)) {
 			bool anon_exclusive;
 			pte_t swp_pte;
 
@@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 				if (folio_try_share_anon_rmap_pte(folio, page)) {
 					set_pte_at(mm, addr, ptep, pte);
-					folio_unlock(folio);
+					if (fault_folio != folio)
+						folio_unlock(folio);
 					folio_put(folio);
 					mpfn = 0;
 					goto next;
@@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 					  unsigned long npages,
 					  struct page *fault_page)
 {
+	struct folio *fault_folio = fault_page ?
+		page_folio(fault_page) : NULL;
 	unsigned long i, restore = 0;
 	bool allow_drain = true;
 	unsigned long unmapped = 0;
@@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 		remove_migration_ptes(folio, folio, 0);
 
 		src_pfns[i] = 0;
-		folio_unlock(folio);
+		if (fault_folio != folio)
+			folio_unlock(folio);
 		folio_put(folio);
 		restore--;
 	}
@@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
 		return -EINVAL;
 	if (args->fault_page && !is_device_private_page(args->fault_page))
 		return -EINVAL;
+	if (args->fault_page && !PageLocked(args->fault_page))
+		return -EINVAL;
 
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
@@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
-/*
- * migrate_device_finalize() - complete page migration
- * @src_pfns: src_pfns returned from migrate_device_range()
- * @dst_pfns: array of pfns allocated by the driver to migrate memory to
- * @npages: number of pages in the range
- *
- * Completes migration of the page by removing special migration entries.
- * Drivers must ensure copying of page data is complete and visible to the CPU
- * before calling this.
- */
-void migrate_device_finalize(unsigned long *src_pfns,
-			unsigned long *dst_pfns, unsigned long npages)
+static void __migrate_device_finalize(unsigned long *src_pfns,
+				      unsigned long *dst_pfns,
+				      unsigned long npages,
+				      struct page *fault_page)
 {
+	struct folio *fault_folio = fault_page ?
+		page_folio(fault_page) : NULL;
 	unsigned long i;
 
 	for (i = 0; i < npages; i++) {
@@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!page) {
 			if (dst) {
+				WARN_ON_ONCE(fault_folio == dst);
 				folio_unlock(dst);
 				folio_put(dst);
 			}
@@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
 
 		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
 			if (dst) {
+				WARN_ON_ONCE(fault_folio == dst);
 				folio_unlock(dst);
 				folio_put(dst);
 			}
@@ -843,15 +852,33 @@ void migrate_device_finalize(unsigned long *src_pfns,
 		if (!folio_is_zone_device(dst))
 			folio_add_lru(dst);
 		remove_migration_ptes(src, dst, 0);
-		folio_unlock(src);
+		if (fault_folio != src)
+			folio_unlock(src);
 		folio_put(src);
 
 		if (dst != src) {
+			WARN_ON_ONCE(fault_folio == dst);
 			folio_unlock(dst);
 			folio_put(dst);
 		}
 	}
 }
+
+/*
+ * migrate_device_finalize() - complete page migration
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Completes migration of the page by removing special migration entries.
+ * Drivers must ensure copying of page data is complete and visible to the CPU
+ * before calling this.
+ */
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)
+{
+	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
+}
 EXPORT_SYMBOL(migrate_device_finalize);
 
 /**
@@ -867,10 +894,27 @@ EXPORT_SYMBOL(migrate_device_finalize);
  */
 void migrate_vma_finalize(struct migrate_vma *migrate)
 {
-	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
+	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
+				  migrate->fault_page);
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
+static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+{
+	struct folio *folio;
+
+	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	if (!folio)
+		return 0;
+
+	if (!folio_trylock(folio)) {
+		folio_put(folio);
+		return 0;
+	}
+
+	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+}
+
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
  * @src_pfns: array large enough to hold migrating source device private pfns.
@@ -895,29 +939,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 {
 	unsigned long i, pfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct folio *folio;
+	for (pfn = start, i = 0; i < npages; pfn++, i++)
+		src_pfns[i] = migrate_device_pfn_lock(pfn);
 
-		folio = folio_get_nontail_page(pfn_to_page(pfn));
-		if (!folio) {
-			src_pfns[i] = 0;
-			continue;
-		}
+	migrate_device_unmap(src_pfns, npages, NULL);
 
-		if (!folio_trylock(folio)) {
-			src_pfns[i] = 0;
-			folio_put(folio);
-			continue;
-		}
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_range);
 
-		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
-	}
+/**
+ * migrate_device_pfns() - migrate device private pfns to normal memory.
+ * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @npages: number of pages to migrate.
+ *
+ * Similar to migrate_device_range() but supports non-contiguous pre-popluated
+ * array of device pages to migrate.
+ */
+int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; i++)
+		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
 	return 0;
 }
-EXPORT_SYMBOL(migrate_device_range);
+EXPORT_SYMBOL(migrate_device_pfns);
 
 /*
  * Migrate a device coherent folio back to normal memory. The caller should have
-- 
2.34.1

