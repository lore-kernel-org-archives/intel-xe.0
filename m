Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5E2C2BA2B
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC06910E921;
	Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et2C++in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4A10E128
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252029; x=1749788029;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Xda98IURdQGIqz8J3EqN5gGjep1Y/qKnX2bFOSPb8og=;
 b=Et2C++inEjG9TDIqNbC9DldQO0tCn8tdj5mu8i8gwoq2tepe2AIm5xKZ
 /lPg2J4/ekgZk0m6Hcl1kzLOyUWIsgFwyNr1PtvYKes3A2uqk5Bn7Puty
 lDBMdWtQFcgXdtUZbovk7ZyhpyTiIrhYrNUUauPpoQQ2ZHZGPKSphKRlG
 2BHtjvbYZxQWcr7zc/avi9D2IL3fRWZEsCCpsIILRh1VUR2MWCGuAsYpy
 2SSP6tlxCCE8fxrs2o6FHNyQUtK5asxr7ludt3PsJjhuFNm1eF8k6GUqD
 BT1xm2SUrLvnIsrDoVaXSJXdNZ/h4UYNg2iNH8jAaPsLzTNgGPbBpsZzb Q==;
X-CSE-ConnectionGUID: a04OOnmVS4y/zZd0I2ztkg==
X-CSE-MsgGUID: Irf+M0x7SzOLaxzRlj1WQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847961"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: S9IBgzDxQ2m0bql+ig4zlg==
X-CSE-MsgGUID: dNq7y+WvTwKHKAEQMjFE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476326"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 10/42] drm/svm: introduce hmmptr and helper functions
Date: Thu, 13 Jun 2024 00:23:57 -0400
Message-Id: <20240613042429.637281-10-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

A hmmptr is a pointer in a CPU program, like a userptr. but unlike
a userptr, a hmmptr can also be migrated to device local memory. The
other way to look at is, userptr is a special hmmptr without the
capability of migration - userptr's backing store is always in system
memory.

This is built on top of kernel HMM infrastructure thus is called hmmptr.

This is the key concept to implement SVM (shared virtual memory) at drm
drivers. With SVM, all the valid virtual address in a CPU program is
also valid for GPU program, if the GPUVM participate SVM. This is
implemented thru hmmptr concept.

Helper functions are introduced to init, release, populate and dma-map
/unmap hmmptr. Helper will also be introduced to migrate a range of
hmmptr to device memory. With those helpers, driver can easily
implement the SVM address space mirroring and migration functionalities.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Krishna Bommu <krishnaiah.bommu@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/Kconfig   |   1 +
 drivers/gpu/drm/Makefile  |   1 +
 drivers/gpu/drm/drm_svm.c | 316 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  62 ++++++++
 4 files changed, 380 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_svm.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 981f43d4ca8c..2c18c8d88444 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -20,6 +20,7 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
+	select HMM_MIRROR
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..0006a37c662a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -89,6 +89,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 drm-$(CONFIG_DRM_PANIC) += drm_panic.o
+drm-$(CONFIG_HMM_MIRROR) += ./drm_svm.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
new file mode 100644
index 000000000000..9a164615f866
--- /dev/null
+++ b/drivers/gpu/drm/drm_svm.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2024 Intel Corporation
+ */
+
+
+#include <linux/scatterlist.h>
+#include <linux/mmu_notifier.h>
+#include <linux/dma-mapping.h>
+#include <linux/memremap.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_svm.h>
+#include <linux/swap.h>
+#include <linux/bug.h>
+#include <linux/hmm.h>
+#include <linux/mm.h>
+
+static u64 __npages_in_range(unsigned long start, unsigned long end)
+{
+	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
+}
+
+/**
+ * __mark_range_accessed() - mark a range is accessed, so core mm
+ * have such information for memory eviction or write back to
+ * hard disk
+ *
+ * @hmm_pfn: hmm_pfn array to mark
+ * @npages: how many pages to mark
+ * @write: if write to this range, we mark pages in this range
+ * as dirty
+ */
+static void __mark_range_accessed(unsigned long *hmm_pfn, int npages, bool write)
+{
+	struct page *page;
+	u64 i;
+
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(hmm_pfn[i]);
+		if (write)
+			set_page_dirty_lock(page);
+
+		mark_page_accessed(page);
+	}
+}
+
+static inline u64 __hmmptr_start(struct drm_hmmptr *hmmptr)
+{
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
+	u64 start = GPUVA_START(gpuva);
+
+	return start;
+}
+
+static inline u64 __hmmptr_end(struct drm_hmmptr *hmmptr)
+{
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
+	u64 end = GPUVA_END(gpuva);
+
+	return end;
+}
+
+static inline u64 __hmmptr_cpu_start(struct drm_hmmptr *hmmptr)
+{
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
+
+	/**
+	 * FIXME: xekmd right now use gem.offset for userptr
+	 * Maybe this need to be reconsidered.
+	 */
+	return gpuva->gem.offset;
+}
+
+static inline u64 __hmmptr_cpu_end(struct drm_hmmptr *hmmptr)
+{
+	return __hmmptr_cpu_start(hmmptr) +
+			(__hmmptr_end(hmmptr) - __hmmptr_start(hmmptr));
+}
+
+/**
+ * drm_svm_hmmptr_unmap_dma_pages() - dma unmap a section (must be page boudary) of
+ * hmmptr from iova space
+ *
+ * @hmmptr: hmmptr to dma unmap
+ * @page_idx: from which page to start the unmapping
+ * @npages: how many pages to unmap
+ */
+void drm_svm_hmmptr_unmap_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 npages)
+{
+	u64 tpages = __npages_in_range(__hmmptr_start(hmmptr), __hmmptr_end(hmmptr));
+	unsigned long *hmm_pfn = hmmptr->pfn;
+	struct page *page;
+	u64 i;
+
+	DRM_MM_BUG_ON(page_idx + npages > tpages);
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(hmm_pfn[i + page_idx]);
+		if (!page)
+			continue;
+
+		if (!is_device_private_page(page))
+			dma_unlink_range(&hmmptr->iova, (i + page_idx) << PAGE_SHIFT);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_unmap_dma_pages);
+
+/**
+ * drm_svm_hmmptr_map_dma_pages() - dma map a section (must be page boudary) of
+ * hmmptr to iova space
+ *
+ * @hmmptr: hmmptr to dma map
+ * @page_idx: from which page to start the mapping
+ * @npages: how many pages to map
+ */
+void drm_svm_hmmptr_map_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 npages)
+{
+	u64 tpages = __npages_in_range(__hmmptr_start(hmmptr), __hmmptr_end(hmmptr));
+	unsigned long *hmm_pfn = hmmptr->pfn;
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
+	struct drm_gpuvm *gpuvm = gpuva->vm;
+	struct drm_device *drm = gpuvm->drm;
+	struct page *page;
+	bool range_is_device_pages;
+	u64 i;
+
+	DRM_MM_BUG_ON(page_idx + npages > tpages);
+	for (i = page_idx; i < page_idx + npages; i++) {
+		page = hmm_pfn_to_page(hmm_pfn[i]);
+		DRM_MM_BUG_ON(!page);
+		if (i == page_idx)
+			range_is_device_pages = is_device_private_page(page);
+
+		if (range_is_device_pages != is_device_private_page(page))
+			drm_warn_once(drm, "Found mixed system and device pages plancement\n");
+
+		if (!is_device_private_page(page))
+			hmmptr->dma_addr[i] = dma_link_range(page, 0, &hmmptr->iova, i << PAGE_SHIFT);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_map_dma_pages);
+
+/**
+ * drm_svm_hmmptr_init() - initialize a hmmptr
+ *
+ * @hmmptr: the hmmptr to initialize
+ * @ops: the mmu interval notifier ops used to invalidate hmmptr
+ */
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops)
+{
+	struct drm_gpuva *gpuva = hmmptr->get_gpuva(hmmptr);
+	struct dma_iova_attrs *iova = &hmmptr->iova;
+	struct drm_gpuvm *gpuvm = gpuva->vm;
+	struct drm_device *drm = gpuvm->drm;
+	u64 cpu_va_start = __hmmptr_cpu_start(hmmptr);
+	u64 start = GPUVA_START(gpuva);
+	u64 end = GPUVA_END(gpuva);
+	size_t npages;
+	int ret;
+
+	start = ALIGN_DOWN(start, PAGE_SIZE);
+	end = ALIGN(end, PAGE_SIZE);
+	npages = __npages_in_range(start, end);
+	hmmptr->pfn = kvcalloc(npages, sizeof(*hmmptr->pfn), GFP_KERNEL);
+	if (!hmmptr->pfn)
+		return -ENOMEM;
+
+	hmmptr->dma_addr = kvcalloc(npages, sizeof(*hmmptr->dma_addr), GFP_KERNEL);
+	if (!hmmptr->dma_addr) {
+		ret = -ENOMEM;
+		goto free_pfn;
+	}
+
+	iova->dev = drm->dev;
+	iova->size = end - start;
+	iova->dir = DMA_BIDIRECTIONAL;
+	ret = dma_alloc_iova(iova);
+	if (ret)
+		goto free_dma_addr;
+
+	ret = mmu_interval_notifier_insert(&hmmptr->notifier, current->mm,
+		cpu_va_start, end - start, ops);
+	if (ret)
+		goto free_iova;
+
+	hmmptr->notifier_seq = LONG_MAX;
+	return 0;
+
+free_iova:
+	dma_free_iova(iova);
+free_dma_addr:
+	kvfree(hmmptr->dma_addr);
+free_pfn:
+	kvfree(hmmptr->pfn);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_init);
+
+/**
+ * drm_svm_hmmptr_release() - release a hmmptr
+ *
+ * @hmmptr: the hmmptr to release
+ */
+void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr)
+{
+	u64 npages = __npages_in_range(__hmmptr_start(hmmptr), __hmmptr_end(hmmptr));
+
+	drm_svm_hmmptr_unmap_dma_pages(hmmptr, 0, npages);
+	mmu_interval_notifier_remove(&hmmptr->notifier);
+	dma_free_iova(&hmmptr->iova);
+	kvfree(hmmptr->pfn);
+	kvfree(hmmptr->dma_addr);
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_release);
+
+/**
+ * drm_svm_hmmptr_populate() - Populate physical pages of the range of hmmptr
+ *
+ * @hmmptr: hmmptr to populate
+ * @owner: avoid fault for pages owned by owner, only report the current pfn.
+ * @start: start CPU VA of the range
+ * @end: end CPU VA of the range
+ * @write: Populate range for write purpose
+ * @is_mmap_locked: Whether the caller hold mmap lock
+ *
+ * This function populate the physical pages of a hmmptr range. The
+ * populated physical pages is saved in hmmptr's pfn array.
+ * It is similar to get_user_pages but call hmm_range_fault.
+ *
+ * There are two usage model of this API:
+ *
+ * 1) use it for legacy userptr code: pass owner as NULL, fault-in the range
+ * in system pages
+ *
+ * 2) use it for svm: Usually caller would first migrate a range to device
+ * pages, then call this function with owner as the device pages owner. This way
+ * this function won't cause a fault, only report the range's backing pfns which
+ * is already in device memory.
+ *
+ * This function also read mmu notifier sequence # (
+ * mmu_interval_read_begin), for the purpose of later comparison
+ * (through mmu_interval_read_retry). The usage model is, driver first
+ * call this function to populate a range of a hmmptr, then call
+ * mmu_interval_read_retry to see whether need to retry before programming
+ * GPU page table. Since we only populate a sub-range of the whole hmmptr
+ * here, even if the recorded hmmptr->notifier_seq equals to notifier's
+ * current sequence no, it doesn't means the whole hmmptr is up to date.
+ * Driver is *required* to always call this function before check a retry.
+ *
+ * This must be called with mmap read or write lock held.
+ *
+ * returns: 0 for success; negative error no on failure
+ */
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end,
+            bool write, bool is_mmap_locked)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	struct hmm_range hmm_range;
+	struct mm_struct *mm = hmmptr->notifier.mm;
+	int pfn_index, npages;
+	int ret;
+
+	DRM_MM_BUG_ON(start < __hmmptr_cpu_start(hmmptr));
+	DRM_MM_BUG_ON(end > __hmmptr_cpu_end(hmmptr));
+	if (!PAGE_ALIGNED(start) || !PAGE_ALIGNED(end))
+		pr_warn("drm svm populate unaligned range [%llx~%llx)\n", start, end);
+
+	if (is_mmap_locked)
+		mmap_assert_locked(mm);
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	hmm_range.notifier = &hmmptr->notifier;
+	hmm_range.start = start;
+	hmm_range.end = end;
+	npages = __npages_in_range(start, end);
+	pfn_index = (start - __hmmptr_cpu_start(hmmptr)) >> PAGE_SHIFT;
+	hmm_range.hmm_pfns = hmmptr->pfn + pfn_index;
+	hmm_range.default_flags = HMM_PFN_REQ_FAULT;
+	if (write)
+		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
+	hmm_range.dev_private_owner = owner;
+
+	while (true) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(&hmmptr->notifier);
+
+		if (!is_mmap_locked)
+			mmap_read_lock(mm);
+
+		ret = hmm_range_fault(&hmm_range);
+
+		if (!is_mmap_locked)
+			mmap_read_unlock(mm);
+
+		if (ret == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			continue;
+		}
+		break;
+	}
+
+	mmput(mm);
+
+	if (ret)
+		return ret;
+
+	__mark_range_accessed(hmm_range.hmm_pfns, npages, write);
+	hmmptr->notifier_seq = hmm_range.notifier_seq;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_populate);
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index a383c7251e2b..d443f20b5510 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -7,9 +7,13 @@
 #define _DRM_SVM__
 
 #include <linux/compiler_types.h>
+#include <linux/mmu_notifier.h>
+#include <linux/dma-mapping.h>
 #include <linux/memremap.h>
+#include <drm/drm_gpuvm.h>
 #include <linux/types.h>
 
+
 struct dma_fence;
 struct drm_mem_region;
 
@@ -159,4 +163,62 @@ static inline u64 drm_mem_region_page_to_dpa(struct drm_mem_region *mr, struct p
 
 	return dpa;
 }
+
+/**
+ * struct drm_hmmptr- hmmptr pointer
+ *
+ * A hmmptr is a pointer in a CPU program that can be access by GPU program
+ * also, like a userptr. but unlike a userptr, a hmmptr can also be migrated
+ * to device local memory. The other way to look at is, userptr is a special
+ * hmmptr without the capability of migration - userptr's backing store is
+ * always in system memory.
+ *
+ * A hmmptr can have mixed backing pages in system and GPU vram.
+ *
+ * hmmptr is supposed to be embedded in driver's GPU virtual range management
+ * struct such as xe_vma etc. hmmptr itself doesn't have a range. hmmptr
+ * depends on driver's data structure (such as xe_vma) to live in a gpuvm's
+ * process space and RB-tree.
+ *
+ * With hmmptr concept, SVM and traditional userptr can share codes around
+ * mmu notifier, backing store population etc.
+ *
+ * This is built on top of kernel HMM infrastructure thus is called hmmptr.
+ */
+struct drm_hmmptr {
+	/**
+	 * @notifier: MMU notifier for hmmptr
+	 */
+	struct mmu_interval_notifier notifier;
+	/** @notifier_seq: notifier sequence number */
+	unsigned long notifier_seq;
+	/**
+	 * @pfn: An array of pfn used for page population
+	 * Note this is hmm_pfn, not normal core mm pfn
+	 */
+	unsigned long *pfn;
+	/**
+	 * @dma_addr: An array to hold the dma mapped address
+	 * of each page, only used when page is in sram.
+	 */
+	dma_addr_t *dma_addr;
+	/**
+	 * @iova: iova hold the dma-address of this hmmptr.
+	 * iova is only used when the backing pages are in sram.
+	 */
+	struct dma_iova_attrs iova;
+	/**
+	 * @get_gpuva: callback function to get gpuva of this hmmptr
+	 * FIXME: Probably have direct gpuva member in hmmptr
+	 */
+	struct drm_gpuva * (*get_gpuva) (struct drm_hmmptr *hmmptr);
+};
+
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops);
+void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr);
+void drm_svm_hmmptr_map_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 npages);
+void drm_svm_hmmptr_unmap_dma_pages(struct drm_hmmptr *hmmptr, u64 page_idx, u64 npages);
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end,
+            bool write, bool is_mmap_locked);
 #endif
-- 
2.26.3

