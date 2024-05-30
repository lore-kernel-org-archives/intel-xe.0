Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109A5C41513
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90710FCDD;
	Thu, 30 May 2024 00:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQEjrG0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859A310EAA9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029211; x=1748565211;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uAqnOIjCw18fcb/6cKTR/KPFCxp3wLimc/+lkDw5U70=;
 b=AQEjrG0Tbop1xnFHMXOOdAm45k2zoTMlmueKNd21baB52/Lvwcj1x4bC
 +v7sOYxJDXrD0WciLBGj+ggiZbbr81F0z319hb6+gUqg+6eUno8MmbPgZ
 j/iN9SczCzVgAELI8bOtgBy52SUocMlsQbvY1/cIUkpmeNZAn8XtaqnI/
 q/FBjmoh56gBxDl61qtMdeMRL1+kvFIIvBJ94Pr2cydoLJY9kpr8ADaDi
 FvEnu8RKISsTAj1164MIcGDEMQe/lY8ndvfzg14MORmQUF3Pwb7HtNCYq
 KuNcwMr4Xdb+AwWsXW7mP6LoN31eiVpef5zMfgDKNKBqT/9DWjpzI2qbL g==;
X-CSE-ConnectionGUID: XU+uJlyhQi+CXUJ3fY30sA==
X-CSE-MsgGUID: u+I0wkiuSIauZ/gbnUfmmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975386"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:23 -0700
X-CSE-ConnectionGUID: b3B3jINIQXqXrC2PGXWR2g==
X-CSE-MsgGUID: 4gk/cbUQSTa5Pv0qrYvxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088736"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 11/26] drm/svm: introduce hmmptr and helper functions
Date: Wed, 29 May 2024 20:47:17 -0400
Message-Id: <20240530004732.84898-11-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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

Helper functions are introduced to init, release, populate and dma-map
hmmptr.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/Kconfig   |   1 +
 drivers/gpu/drm/Makefile  |   1 +
 drivers/gpu/drm/drm_svm.c | 254 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  55 +++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_svm.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..8e5fb3532243 100644
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
index 000000000000..588721edeeb1
--- /dev/null
+++ b/drivers/gpu/drm/drm_svm.c
@@ -0,0 +1,254 @@
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
+static void drm_svm_hmmptr_unmap_dma_pages(struct drm_hmmptr *hmmptr)
+{
+	u64 npages = __npages_in_range(__hmmptr_start(hmmptr), __hmmptr_end(hmmptr));
+	unsigned long *hmm_pfn = hmmptr->pfn;
+	struct page *page;
+	u64 i;
+
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(hmm_pfn[i]);
+		if (!page)
+			continue;
+
+		if (!is_device_private_page(page))
+			dma_unlink_range(&hmmptr->iova, i << PAGE_SHIFT);
+	}
+}
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
+	struct page *page;
+	u64 i;
+
+	BUG_ON(page_idx + npages > tpages);
+	for (i = page_idx; i < page_idx + npages; i++) {
+		page = hmm_pfn_to_page(hmm_pfn[i]);
+		BUG_ON(!page);
+		BUG_ON(is_device_private_page(page));
+		dma_link_range(page, 0, &hmmptr->iova, i << PAGE_SHIFT);
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
+	iova->dev = drm->dev;
+	iova->size = end - start;
+	iova->dir = DMA_BIDIRECTIONAL;
+	ret = dma_alloc_iova(iova);
+	if (ret)
+		goto free_pfn;
+
+	ret = mmu_interval_notifier_insert(&hmmptr->notifier, current->mm,
+		start, end - start, ops);
+	if (ret)
+		goto free_iova;
+
+	hmmptr->notifier_seq = LONG_MAX;
+	return 0;
+
+free_iova:
+	dma_free_iova(iova);
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
+	drm_svm_hmmptr_unmap_dma_pages(hmmptr);
+	mmu_interval_notifier_remove(&hmmptr->notifier);
+	dma_free_iova(&hmmptr->iova);
+	kvfree(hmmptr->pfn);
+}
+EXPORT_SYMBOL_GPL(drm_svm_hmmptr_release);
+
+/**
+ * drm_svm_hmmptr_populate() - Populate physical pages of the range of hmmptr
+ *
+ * @hmmptr: hmmptr to populate
+ * @start: start of the range
+ * @end: end of the range
+ * @write: Populate range for write purpose
+ * @owner: avoid fault for pages owned by owner, only report the current pfn.
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
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end, bool write)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	struct hmm_range hmm_range;
+	struct mm_struct *mm = hmmptr->notifier.mm;
+	int pfn_index, npages;
+	int ret;
+
+	BUG_ON(start < __hmmptr_start(hmmptr));
+	BUG_ON(end > __hmmptr_end(hmmptr));
+	mmap_assert_locked(mm);
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	hmm_range.notifier = &hmmptr->notifier;
+	hmm_range.start = ALIGN_DOWN(start, PAGE_SIZE);
+	hmm_range.end = ALIGN(end, PAGE_SIZE);
+	npages = __npages_in_range(hmm_range.start, hmm_range.end);
+	pfn_index = (hmm_range.start - __hmmptr_start(hmmptr)) >> PAGE_SHIFT;
+	hmm_range.hmm_pfns = hmmptr->pfn + pfn_index;
+	hmm_range.default_flags = HMM_PFN_REQ_FAULT;
+	if (write)
+		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
+	hmm_range.dev_private_owner = owner;
+
+	while (true) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(&hmmptr->notifier);
+		ret = hmm_range_fault(&hmm_range);
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
index 2f8658538b4b..8f699a75d6dd 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -4,11 +4,15 @@
  */
 
 #include <linux/compiler_types.h>
+#include <linux/dma-mapping.h>
 #include <linux/memremap.h>
+#include <drm/drm_gpuvm.h>
 #include <linux/types.h>
 
+
 struct dma_fence;
 struct drm_mem_region;
+struct mmu_interval_notifier_ops;
 
 /**
  * struct migrate_vec - a migration vector is an array of addresses,
@@ -154,3 +158,54 @@ static inline u64 drm_mem_region_pfn_to_dpa(struct drm_mem_region *mr, u64 pfn)
 
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
+	 */
+	unsigned long *pfn;
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
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner,
+		u64 start, u64 end, bool write);
-- 
2.26.3

