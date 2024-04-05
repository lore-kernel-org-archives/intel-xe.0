Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA629C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66E6113CAD;
	Fri,  5 Apr 2024 18:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hONmC+zY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49494113CAD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712343141; x=1743879141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p55DWcUfJ2Nebji+JL1VY4qfCBVC6tkbJgkxt5x/BDQ=;
 b=hONmC+zY96kU+fZRH8fKpVTc2TZo7q8mR4PAQyacRT7ZAA2yMLCWnQSA
 x97e0xxH7SF1s7A8HwKIWuiYarq+GxlDgSjI7ffxTKGLompytMc5VxDxo
 G8oZmeH7ZNWczjUn2LBxWwyDI0DJQTWk1F2y2dBFojlD5VRCjagDDZU+9
 mNKe4f3J2UT9AyzMFwD3+Lc+bQDCxJeJmb/DN3Z3NskFU2I0uc6NZp46E
 bpgeqEbr5/SZ3Wt6wA58742Kb2fAZq1Cea01uTbXi2jbyRuuiluD97zgV
 pzIpiy7HTeB2zXo1zk/TLvy8D0W5/WmgVAATFqoblXdUUfDNabO9v7BIB g==;
X-CSE-ConnectionGUID: R/7Zp0G9QUKfD5ESi1bS8g==
X-CSE-MsgGUID: IC1sBkibSsSAlCqr+GC2Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7546815"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7546815"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:51:34 -0700
X-CSE-ConnectionGUID: BNB9hXWpS4+fGZGzQ4u67Q==
X-CSE-MsgGUID: KIeK16q/SSCniew3p2wI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19794106"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 05 Apr 2024 11:51:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Introduce helper to populate userptr
Date: Sat,  6 Apr 2024 00:35:07 +0530
Message-Id: <20240405190508.244177-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
References: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
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

From: Oak Zeng <oak.zeng@intel.com>

Introduce a helper function xe_userptr_populate_range to populate
a a userptr range. This functions calls hmm_range_fault to read
CPU page tables and populate all pfns/pages of this virtual address
range.

If the populated page is system memory page, dma-mapping is performed
to get a dma-address which can be used later for GPU to access pages.

If the populated page is device private page, we calculate the dpa (
device physical address) of the page. This will be handled in future
patches.

The dma-address or dpa is then saved in userptr's sg table. This is
prepare work to replace the get_user_pages_fast code in userptr code
path.

v1: Address review comments:
    separate a npage_in_range function (Matt)
    reparameterize function xe_userptr_populate_range function (Matt)
    move mmu_interval_read_begin() call into while loop (Thomas)
    s/mark_range_accessed/xe_mark_range_accessed (Thomas)
    use set_page_dirty_lock (vs set_page_dirty) (Thomas)
    move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
v2: Remove device private page support. Only support system
    pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
v3: Address review comments:
    Squash patch "drm/xe: Introduce a helper to free sg table" to current
    patch (Matt)
    start and end addresses are already page aligned (Matt)
    Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
    non system allocator call. (Matt)
    Drop kthread_use_mm and kthread_unuse_mm. (Matt)
    No need of kernel-doc for static functions.(Matt)
    Modify function names. (Matt)
    Free sgtable incase of dma_map_sgtable failure.(Matt)
    Modify loop for hmm_range_fault.(Matt)
v4: Remove the dummy function for xe_hmm_userptr_populate_range
    since CONFIG_HMM_MIRROR is needed. (Matt)
    Change variable names start/end to userptr_start/userptr_end.(Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  11 ++
 4 files changed, 267 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..449a1ecbc92a 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -41,6 +41,7 @@ config DRM_XE
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
+	select HMM_MIRROR
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 21316ee47026..07031b5ba977 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -146,6 +146,8 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
new file mode 100644
index 000000000000..2c32dc46f7d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/scatterlist.h>
+#include <linux/mmu_notifier.h>
+#include <linux/dma-mapping.h>
+#include <linux/memremap.h>
+#include <linux/swap.h>
+#include <linux/hmm.h>
+#include <linux/mm.h>
+#include "xe_hmm.h"
+#include "xe_vm.h"
+#include "xe_bo.h"
+
+static u64 xe_npages_in_range(unsigned long start, unsigned long end)
+{
+	return (end - start) >> PAGE_SHIFT;
+}
+
+/*
+ * xe_mark_range_accessed() - mark a range is accessed, so core mm
+ * have such information for memory eviction or write back to
+ * hard disk
+ *
+ * @range: the range to mark
+ * @write: if write to this range, we mark pages in this range
+ * as dirty
+ */
+static void xe_mark_range_accessed(struct hmm_range *range, bool write)
+{
+	struct page *page;
+	u64 i, npages;
+
+	npages = xe_npages_in_range(range->start, range->end);
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(range->hmm_pfns[i]);
+		if (write)
+			set_page_dirty_lock(page);
+
+		mark_page_accessed(page);
+	}
+}
+
+/*
+ * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
+ * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
+ * and will be used to program GPU page table later.
+ *
+ * @xe: the xe device who will access the dma-address in sg table
+ * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
+ * has the pfn numbers of pages that back up this hmm address range.
+ * @st: pointer to the sg table.
+ * @write: whether we write to this range. This decides dma map direction
+ * for system pages. If write we map it bi-diretional; otherwise
+ * DMA_TO_DEVICE
+ *
+ * All the contiguous pfns will be collapsed into one entry in
+ * the scatter gather table. This is for the purpose of efficiently
+ * programming GPU page table.
+ *
+ * The dma_address in the sg table will later be used by GPU to
+ * access memory. So if the memory is system memory, we need to
+ * do a dma-mapping so it can be accessed by GPU/DMA.
+ *
+ * FIXME: This function currently only support pages in system
+ * memory. If the memory is GPU local memory (of the GPU who
+ * is going to access memory), we need gpu dpa (device physical
+ * address), and there is no need of dma-mapping. This is TBD.
+ *
+ * FIXME: dma-mapping for peer gpu device to access remote gpu's
+ * memory. Add this when you support p2p
+ *
+ * This function allocates the storage of the sg table. It is
+ * caller's responsibility to free it calling sg_free_table.
+ *
+ * Returns 0 if successful; -ENOMEM if fails to allocate memory
+ */
+static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+		       struct sg_table *st, bool write)
+{
+	struct device *dev = xe->drm.dev;
+	struct page **pages;
+	u64 i, npages;
+	int ret;
+
+	npages = xe_npages_in_range(range->start, range->end);
+	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
+		xe_assert(xe, !is_device_private_page(pages[i]));
+	}
+
+	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
+						xe_sg_segment_size(dev), GFP_KERNEL);
+	if (ret)
+		goto free_pages;
+
+	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
+	if (ret) {
+		sg_free_table(st);
+		st = NULL;
+	}
+
+free_pages:
+	kvfree(pages);
+	return ret;
+}
+
+/*
+ * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	bool write = !xe_vma_read_only(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	struct device *dev = xe->drm.dev;
+
+	xe_assert(xe, userptr->sg);
+	dma_unmap_sgtable(dev, userptr->sg,
+			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
+
+	sg_free_table(userptr->sg);
+	userptr->sg = NULL;
+}
+
+/**
+ * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
+ * address range
+ *
+ * @uvma: userptr vma which has information of the range to populate.
+ * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
+ *
+ * This function populate the physical pages of a virtual
+ * address range. The populated physical pages is saved in
+ * userptr's sg table. It is similar to get_user_pages but call
+ * hmm_range_fault.
+ *
+ * This function also read mmu notifier sequence # (
+ * mmu_interval_read_begin), for the purpose of later
+ * comparison (through mmu_interval_read_retry).
+ *
+ * This must be called with mmap read or write lock held.
+ *
+ * This function allocates the storage of the userptr sg table.
+ * It is caller's responsibility to free it calling sg_free_table.
+ *
+ * returns: 0 for succuss; negative error no on failure
+ */
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
+				  bool is_mm_mmap_locked)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	struct xe_userptr *userptr;
+	struct xe_vma *vma = &uvma->vma;
+	u64 userptr_start = xe_vma_userptr(vma);
+	u64 userptr_end = userptr_start + xe_vma_size(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct hmm_range hmm_range;
+	bool write = !xe_vma_read_only(vma);
+	unsigned long notifier_seq;
+	u64 npages;
+	int ret;
+
+	userptr = &uvma->userptr;
+
+	if (is_mm_mmap_locked)
+		mmap_assert_locked(userptr->notifier.mm);
+
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return 0;
+
+	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
+	if (notifier_seq == userptr->notifier_seq)
+		return 0;
+
+	if (userptr->sg)
+		xe_hmm_userptr_free_sg(uvma);
+
+	npages = xe_npages_in_range(userptr_start, userptr_end);
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |= HMM_PFN_REQ_WRITE;
+
+	if (!mmget_not_zero(userptr->notifier.mm)) {
+		ret = -EFAULT;
+		goto free_pfns;
+	}
+
+	hmm_range.default_flags = flags;
+	hmm_range.hmm_pfns = pfns;
+	hmm_range.notifier = &userptr->notifier;
+	hmm_range.start = userptr_start;
+	hmm_range.end = userptr_end;
+	hmm_range.dev_private_owner = vm->xe;
+
+	while (true) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
+
+		if (!is_mm_mmap_locked)
+			mmap_read_lock(userptr->notifier.mm);
+
+		ret = hmm_range_fault(&hmm_range);
+
+		if (!is_mm_mmap_locked)
+			mmap_read_unlock(userptr->notifier.mm);
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
+	mmput(userptr->notifier.mm);
+
+	if (ret)
+		goto free_pfns;
+
+	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
+	if (ret)
+		goto free_pfns;
+
+	xe_mark_range_accessed(&hmm_range, write);
+	userptr->sg = &userptr->sgt;
+	userptr->notifier_seq = hmm_range.notifier_seq;
+
+free_pfns:
+	kvfree(pfns);
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
new file mode 100644
index 000000000000..909dc2bdcd97
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+struct xe_userptr_vma;
+
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
-- 
2.25.1

