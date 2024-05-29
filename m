Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F137DC41513
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D1A112C83;
	Wed, 29 May 2024 01:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN7ezH0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A78112C92
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944728; x=1748480728;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JTZR9FbUr8mrkUTrCB2VIMupJ9ez1Awe59eIhAUr/uk=;
 b=BN7ezH0m3UhZuv37EduMos7uUOsOvPhLqDDHakY7FGSsbMlQt0QAiv7K
 sy/PpQagse2tmdwM+gYxpgTfY8rsIrLq+HGuzcNJS7NOl6TeHRaKBLfKv
 09Xvj1sdIbtRYRRksTC/kU9gZa1v9RH0gOdunu8lQ9vs7Jayl0vuNiUao
 EaeJa6x2M4H9qcugtOrP36Myv1Sx91LxaNHmUwIU2YqyUzXnVN7F6soq1
 DdlUBZiqqewG95xBVDKcscwoyo2l2iixx3rK1hVxR+l5D4AfKvDuo1Jvl
 HeOfE9X2VcUHs4xy73LGu46yp7QjykPRgjF9JKAD0swYx8k/K9Oul/ELo g==;
X-CSE-ConnectionGUID: AQWLG3z/RQuOWdBF4JyKrA==
X-CSE-MsgGUID: o8tEtDUZRQWWawE1LBsvjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849790"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849790"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: cBLmsmSyS2Kj1zrZxH6F5A==
X-CSE-MsgGUID: tGOE+q2fStipOs9ei2+TWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700498"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 11/26] drm/svm: introduce hmmptr and helper functions
Date: Tue, 28 May 2024 21:19:09 -0400
Message-Id: <20240529011924.4125173-11-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

Helper functions are introduced to init, release and populate hmmptr.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
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
 drivers/gpu/drm/drm_svm.c | 229 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_svm.h     |  54 +++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_svm.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a04101..c390ff0dc6c1 100644
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
index f9ca4f8fa6c5..1c541468d5b0 100644
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
index 000000000000..66d8f8a69867
--- /dev/null
+++ b/drivers/gpu/drm/drm_svm.c
@@ -0,0 +1,229 @@
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
index 2f8658538b4b..d7b9cf6b96c4 100644
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
@@ -154,3 +158,53 @@ static inline u64 drm_mem_region_pfn_to_dpa(struct drm_mem_region *mr, u64 pfn)
 
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
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner,
+		u64 start, u64 end, bool write);
-- 
2.26.3

