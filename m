Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85501C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4489910EADB;
	Thu, 13 Jun 2024 15:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXBb8Ezo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289DC10EACE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292044; x=1749828044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hB8fGFQdX23M5i9iDlnVTrzUxMupZN+krT/GcsOHstU=;
 b=YXBb8EzoTuIOncDedrjmsDiBcC2hIT8HBQUgtD8S+gX6/8Au63/BxL7U
 EkSRjuSDI4ELvkIDlCskohpknSW22vaOF7vQrzRZsTAplX+pYvhy36t/B
 HFbG7EWp0TDUFz40y14E9uaNlNdwbcfR20c1LlzC/eZMiSvyyh0j0lbd2
 plufJAdKVfD5ccRYhhmyFL4yC7/TTWYLEQWC5cqZv8dFs6vDlgFsO9TA0
 yPDSsz6BN3mjnPSCi1MWrkKM4kthetRoxqPe/lurMs213foWbliINmw73
 CUEB7ka2R/PqHQ1FlBqHIuvQQlnQ7CjZQC+8nasoTGn25+YBYbGpAvPb2 Q==;
X-CSE-ConnectionGUID: OPfjY3cCTxa4iKRmUg1XJw==
X-CSE-MsgGUID: E+GvFQIzRa+j0Eu1xtyktg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348646"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
X-CSE-ConnectionGUID: UeobeMeMRdOagiB3jzOmVA==
X-CSE-MsgGUID: xT5Qb3EWST+9Kiq61hxWQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135091"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 14/42] drm/svm: Add DRM SVM documentation
Date: Thu, 13 Jun 2024 11:31:00 -0400
Message-Id: <20240613153128.681864-14-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

The purpose of DRM SVM design is to provide helpers and infrastructure
to facilitate driver implementation of SVM (shared virtual memory)
function.

The overview part described the helpers that DRM layer provdes and the
virtual function interfaces that driver has to implement if driver use
drm SVM layer to implement SVM functionality.

Unlike legacy DRM BO (buffer object) based physical memory management,
DRM SVM use a complete page centric memory management. This has
fundamental impact to the memory allocate, free, eviction and migration
logic. It also requires the driver to support range (which is required
to be page boundary) based GPU page table update and invalidation. The
page centric design section described this design.

Lock design is one of the key of the design, which is described in the
lock design section.

There are other sections described the memory attributes API design and
the memory eviction design.

Create a DRM SVM section in drm-mm.rst and generate SVM documents under
this document section.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 Documentation/gpu/drm-mm.rst |  42 +++++
 drivers/gpu/drm/drm_svm.c    | 309 +++++++++++++++++++++++++++++++++++
 2 files changed, 351 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..fa968abb9387 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -573,3 +573,45 @@ Scheduler Function References
 
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_entity.c
    :export:
+
+DRM SVM
+======
+
+Overview
+-------
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :doc: Overview
+
+Page centric design
+------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :doc: page centric design
+
+Lock design
+-----------
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :doc: lock design
+
+Memory hints
+-----------
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :doc: Memory hints
+
+Memory eviction
+-----------
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :doc: pag granularity eviction
+
+Function References
+-----------------------------
+
+.. kernel-doc:: include/drm/drm_svm.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_svm.c
+   :export:
diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index d34809b2bad6..967e7addae54 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -17,6 +17,315 @@
 #include <linux/pci.h>
 #include <linux/mm.h>
 
+/**
+ * DOC: Overview
+ *
+ * Shared Virtual Memory (SVM) allows the programmer to use a shared virtual
+ * address space between threads executing on CPUs and GPUs. It abstracts
+ * away from the user the location of the backing memory, and hence simplifies
+ * the user programming model. In a non-SVM memory model, user need to explicitly
+ * decide memory placement such as device or system memory, also user need to
+ * explicitly migrate memory b/t device and system memory. Under SVM, KMD takes
+ * care of memory migration implicitly.
+ *
+ * SVM makes use of default OS memory allocation and mapping interface such as
+ * malloc() and mmap(). The pointer returned from malloc() and mmap() can be
+ * directly used on both CPU and GPU program. Any CPU program local variables
+ * or global variables can also be used by GPU program.
+ *
+ * SVM also provides API to set virtual address range based memory attributes
+ * such as preferred memory location, memory migration granularity, and memory
+ * atomic attributes etc. This is similar to Linux madvise API.
+ *
+ * DRM SVM implementation is based on Linux kernel Heterogeneous Memory Management
+ * (HMM) framework. HMM provides address space mirroring and data migration helpers.
+ *
+ * This is the DRM layer abstraction of the SVM implementation. The target of this
+ * abstraction is to provide common SVM functions which can be shared between all
+ * DRM drivers. The key functionality of DRM layer is to provide a infrastructure
+ * for driver to achieve process space mirroring and data migration.
+ *
+ * The DRM abstraction is based on two concepts:
+ *
+ * 1) DRM memory region: represents physical memory on GPU devices. Memory region
+ * has operations(callback functions) such as allocate/free memory, memory copy etc.
+ *
+ * 2) hmmptr: similar to userptr with the exception that a hmmptr can be migrated
+ * b/t system memory and device memories. Currently hmmptr is a very thin layer deal
+ * with mmu notifier register/unregister and page population. The hmmptr invalidation
+ * and gpu page table update is left to driver.
+ *
+ * See more details of those concepts in the kernel DOC in drm_svm.h.
+ *
+ * The DRM SVM layer provides helper functions for driver writer to:
+ *
+ * 1) register a DRM memory region, along which some driver callback functions to
+ * allocate/free device memory, migrate memory b/t system memory and GPU device memory
+ * etc.
+ *
+ * 2) create a :c:type:`drm_hmmptr`: Create a hmmptr and register mmu interval notifier
+ * for this hmmptr.
+ *
+ * 3) populate a :c:type:`drm_hmmptr`: Populate the CPU page table, for the purpose of
+ * address space mirroring.
+ *
+ * 4) migrate a range of :c:type:`drm_hmmptr` to GPU device memory
+ *
+ * Note migration of hmmptr (or partial of hmmptr) is DRM internal, triggered by CPU
+ * page fault. This is not exposed to driver.
+ *
+ * With above DRM facilities, it is very simple for vendors to implement a SVM system
+ * alloator driver:
+ *
+ * 1) Implement GPU device memory allocation and free callback functions
+ *
+ * 2) Implement a vendor specific data migration callback function using GPU HW such as DMA
+ *
+ * 3) Implement a vendor specific hmmptr GPU page table invalidation callback function
+ *
+ * 4) On device initialization, register GPU device memory to DRM using the DRM memory
+ * region registration helper
+ *
+ * 4) In GPU page fault handler, call drm helpers to create hmmptr if necessary, migrate
+ * range of hmmptr to GPU device memory per migration policy, and populate range of hmmptr
+ * to program/mirror the hmmptr range in GPU page table. Resume GPU HW execution.
+ *
+ *
+ * There are 3 events which can trigger SVM subsystem in actions:
+ *
+ * 1. A mmu notifier callback
+ *
+ * Since SVM need to mirror the program's CPU virtual address space from GPU side,
+ * when program's CPU address space changes, SVM need to make an identical change
+ * from GPU side. SVM/hmm use mmu interval notifier to achieve this. SVM register
+ * a mmu interval notifier call back function to core mm, and whenever a CPU side
+ * virtual address space is changed (i.e., when a virtual address range is unmapped
+ * from CPU calling munmap), the registered callback function will be called from
+ * core mm. SVM then mirror the CPU address space change from GPU side, i.e., unmap
+ * or invalidate the virtual address range from GPU page table.
+ *
+ * This part of the work is mainly left to driver. Driver need to implement the GPU
+ * page table invalidation function. The invalidation has to be virtual address range
+ * based, instead of invalidate the whole hmmptr on each callback.
+ *
+ * 2. A GPU page fault
+ *
+ * At the very beginning of a process's life, no virtual address of the process
+ * is mapped on GPU page table. So when GPU access any virtual address of the process
+ * a GPU page fault is triggered. SVM then decide the best memory location of the
+ * fault address (mainly from performance consideration. Some times also consider
+ * correctness requirement such as whether GPU can perform atomics operation to
+ * certain memory location), migrate memory if necessary, and map the fault address
+ * to GPU page table.
+ *
+ * This part of work is also mainly left to driver implementor for flexibility consideration.
+ * Driver can call DRM SVM layer helper to migrate a sub-range of a hmmptr to device
+ * memory, and call DRM helper to populate the physical pages of a hmmptr.
+ *
+ * 3. A CPU page fault
+ *
+ * A CPU page fault is usually managed by Linux core mm. But in a CPU and GPU
+ * mix programming environment, the backing store of a virtual address range
+ * can be in GPU's local memory which is not visible to CPU (DEVICE_PRIVATE),
+ * so CPU page fault handler need to migrate such pages to system memory for
+ * CPU to be able to access them. Such memory migration is device specific.
+ * HMM has a callback function (migrate_to_ram function of the dev_pagemap_ops)
+ * for device driver to implement.
+ *
+ * This part of the work is mainly done at DRM abstraction layer. DRM layer
+ * call the vendor specific memory region data migration callback function
+ * to migrate data from GPU memory to system memory, if needed. The whole
+ * CPU page fault processing is transparent to driver implementation.
+ *
+ */
+
+/**
+ * DOC: page centric design
+ *
+ * Unlike the non-SVM memory allocator (such as gem_create, vm_bind etc), there
+ * is no buffer object (BO, such as struct ttm_buffer_object, struct drm_gem_object),
+ * in DRM SVM design. We delibrately choose this implementation option to achieve true
+ * page granularity memory placement, allocation, free, validation, eviction and migration.
+ * In a BO centric world, all above operate at a granularity of buffer object, e.g.,
+ * you can't evict or migrate partial of a BO.
+ *
+ * The drm buddy allocator is essentially buddy block granularity, e.g., user can’t
+ * return a few pages of memory back to buddy (so other users can use the freed pages)
+ * until user finishes the whole buddy block. The minimal free size is buddy block.
+ *
+ * To achieve the goal, a drm page cache layer is introduced. DRM page cache layer
+ * provide interface for user to allocate and free memory at page granularity. DRM
+ * page cache layer allocate memory from DRM buddy if it can't meet user's memory
+ * allocation request with the cached pages. DRM page cache free a buddy block when
+ * all the pages in a block are freed by users.
+ *
+ * Both TTM-based driver and SVM are now required to allocate memory from DRM page
+ * cache layer instead of directly from DRM buddy. This is necessary to achieve goal
+ * because, in the direct DRM buddy scheme, pages freed from TTM-based driver and
+ * from SVM, are kept locally until the whole DRM buddy block is freed. So SVM can't
+ * use TTM freed pages until the whole DRM buddy block is freed, and vice versa.
+ *
+ * To support a true page granularity design, SVM subsystem implemented page granularity
+ * migration, eviction, page table update and invalidation.
+ *
+ * Legacy driver can stay with BO-based scheme, but a lot of driver internal interfaces
+ * such as page table codes are modified to support page granularity scheme so those
+ * interfaces can be shared b/t SVM and BO-based driver.
+ *
+ * TTM-based driver can still free memory at coarse grain granularity such as only free
+ * when the BO is finished; while system allocator will apply the page granularity memory
+ * free.
+ *
+ * Currently page cache layer track the usage of each page using a simple bitmap scheme.
+ * When all pages in a block are not used anymore, it returns this block back to drm
+ * buddy subsystem. This scheme can be fine tunned.
+ *
+ * See more in :doc: Page granularity eviction
+ *
+ */
+
+/**
+ * DOC: lock design
+ *
+ * Since under the picture of SVM, CPU program and GPU program share one virtual
+ * address space, we need rather complex lock design to avoid race conditions.
+ * For example, while GPU is accessing a virtual address range, the same range
+ * could be munmapped from CPU side, or the backing store of the same range
+ * could be moved to another physical place due to memory pressure. The lock
+ * design essentially need to serialize the GPU page table invalidate, data
+ * migration, CPU page table population and GPU page table re-validation.
+ *
+ * There are multiple locks involved in this scheme:
+ *
+ * 1. mm mmap_lock
+ * mm's mmap_lock is a read write semaphore used to protect mm's address
+ * space. Linux core mm hold this lock whenever it need to change process
+ * space's memory mapping, for example, during a user munmap process, or
+ * during a page migration triggered by kernel NUMA balance. MMU interval
+ * notifier callback function is called mmap_lock hold.
+ *
+ * Driver is required to hold mmap_read_lock when it calls the DRM hmmptr
+ * population helper to populate CPU page tables.
+ *
+ * 2. driver's gpuvm dma-resv
+ * driver's dma reservation object is used protect GPU page table update.
+ * This is usually per GPUVM based, e.g., for xekmd this is xe_vm's dma-resv.
+ * For BO type vma, dma resv is enough for page table update. For userptr
+ * and hmmptr, besides dma resv, we need an extra page_table_lock to avoid
+ * page table update collision with userptr invalidation. See below.
+ *
+ * 3. driver's page_table_lock
+ * page_table_lock is used to protect userptr/hmmptr GPU page table update,
+ * to avoid a update collision with userptr invalidation. So page_table_lock
+ * is required in the userptr invalidate callback function. Notifier_lock
+ * is the "user_lock" in the documentation of mmu_interval_read_begin(),
+ * which is a hard requirement per mmu notifier design. In xekmd design,
+ * this lock is xe_vm::userptr::notifier_lock.
+ *
+ * Note currently the page_table_lock is a coarse grain lock design which
+ * is whole GPU VM based. This coarse grain design can be fine tunned to
+ * a per page table based fine grain lock, similar to the core mm split
+ * page table lock.
+ *
+ * Lock order
+ * Acquiring locks in the same order can avoid deadlocks. The locking
+ * order of above locks are:
+ *
+ * mmap_lock => gpuvm::dma-resv => page_table_lock
+ *
+ * This lock order is a hard requirement per existing codes. For example,
+ * the mmap_lock and dma-resv order is explicitly defined in dma_resv_lockdep().
+ *
+ *
+ * Use case, pseudo codes:
+ *
+ * Take the concurrent GPU page fault handler and user munmap as an example,
+ * the locking codes looks broadly like below:
+ *
+ * In GPU page fault handler:                                                                           munmap from user:
+ *
+ * again:
+ * Mmap_read_lock()                                                                                     mmap_write_lock()
+ * call drm_svm_migrate_hmmptr_to_vram to migrate hmmptr if needed                                      mmu_notifier_invalidate_range_start(), call hmmptr->invalidate()
+ * hmmptr.notifier_seq = mmu_interval_read_begin(&hmmptr.notifier)                                          down_write(page_table_lock);
+ * call drm_svm_populate_hmmptr to populate hmmptr                                                          mmu_interval_set_seq();
+ * Mmap_read_unlock                                                                                         invalidate hmmptr from GPU page table
+ *                                                                                                          up_write(page_table_lock);
+ * dma_resv_lock()                                                                                      mmu_notifier_invalidate_range_end()
+ * down_read(page_table_lock);                                                                            mmap_write_unlock();
+ * if (!mmu_interval_read_retry() {
+ *     //collision with userptr invalidation, retry
+ *     up_read(page_table_lock);
+ *     dma_resv_unlock()
+ *     goto again;
+ * }
+ *
+ * update_gpu_page_table()
+ * up_read(page_table_lock);
+ * dma_resv_unlock()
+ *
+ *
+ * In above codes, we hold mmap_read_lock to populate hmmptr because we
+ * need to walk the CPU page table. Since the munmap hold a mmap_write_lock,
+ * the hmmptr population can't colide with munmap.
+ *
+ * After that, we update GPU page table with the hmmptr pfns/pages populated
+ * above. We hold both dma-resv object to protect and page_table_lock for GPU
+ * page table update.
+ *
+ * Since we don't hold the mmap_lock during GPU page table update, user
+ * might perform munmap simultaneously which can cause userptr invalidation.
+ * If such collision happens, we will have to retry hmmptr population.
+ *
+ * Once we confirmed there is no need to retry, we can update GPU page table
+ * safely without have to worry about munmap/hmmptr->invalidate(), because
+ * during this retry confirmation and GPU page table update we hold the
+ * page_table_lock. The same page_table_lock is also hold in the hmmptr->invalidate
+ * callback.
+ */
+
+/**
+ * DOC: Memory hints: TBD
+ */
+
+/**
+ * DOC: Page granularity eviction
+ *
+ * One of the DRM SVM design requirement is to evict memory at true page granularity.
+ * To achieve this goal, we removed buffer object concept in DRM SVM design. This
+ * means we won't build SVM upon TTM infrastructure like amdgpu or xekmd does.
+ *
+ * Even though this approach is true page granularity, it does create a problem for
+ * memory eviction when there is memory pressure: memory allocated by SVM and memory
+ * allocated by TTM should be able to mutually evict from each other. TTM's resource
+ * manager maintains a LRU list for each memory type and this list is used to pick up
+ * the memory eviction victim. Since we don't use TTM for SVM implementation, SVM
+ * allocated memory can't be added to TTM resource manager's LRU list. Thus SVM
+ * allocated memory and TTM allocated memory are not mutually evictable.
+ *
+ * We solve this problem by creating a shared LRU list b/t SVM and TTM, or any other
+ * resource manager. This is named drm evictable LRU.
+ *
+ * The basic idea is, abstract a drm_lru_entity structure which is supposed to be
+ * embedded in ttm_resource structure, or any other resource manager such as used
+ * in SVM implementation. So a LRU entity can represent memory resource used by
+ * both TTM and SVM.
+ *
+ * The resource LRU list is a list of drm_lru_entity. drm_lru_entity has eviction
+ * function pointers which can be used to call back drivers' specific eviction
+ * function to evict a memory resource.
+ *
+ * Driver specific eviction function from both TTM and SVM should follow the same
+ * lock order to avoid any lock inversion. The current plan is, SVM subsystem to
+ * follow exactly the same locking order used in TTM-based eviction process.
+ *
+ * A device-wide global drm_lru_manager is introduced to manage a shared LRU list
+ * between TTM and SVM. drm lru manager provides a evict_first function to evict
+ * the first memory resource from LRU list. This function can be called from TTM,
+ * SVM, thus all the memory allocated in the drm sub-system can be mutually evicted.
+ *
+ */
+
 static u64 __npages_in_range(unsigned long start, unsigned long end)
 {
 	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
-- 
2.26.3

