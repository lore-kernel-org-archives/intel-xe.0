Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD2C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 02:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0E10E9B4;
	Tue, 19 Mar 2024 02:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxMinGIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F02C10EB95
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710816177; x=1742352177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BdG5nE2/o9R4+ByijjnGU3Vc4y53yNTntT+PsFPbSqk=;
 b=kxMinGIYrxX2G7YetKD6ypvocQ9rrSvstb3q4NPBhAIf2tkQJo/3TQx8
 XuBdXgPgYsKAS2IFUsH+QfRNkKxQZhe5nfZOhHcFOoMQ7M0xmDpDptV47
 11zRizrLMNrrZMqR2pR/QoCirOagJ7zGnPNlLUL2Kac2j+JFWMOj6v+cB
 mzAfX3/omya6JFOV+GzdxmCZJr+Na7dz8KTODaUq3Q3LG6uZWCTXeeMFq
 IKgb/d4QiG7DKROQjJ/KQ1GtXw8W5r0UNbD77DDQOMSLa9VIpZ8Up5DNU
 rdrhTxdoDi450otxksCMT38Gf306kjT/aEmxQc7szLKR5LUsUNZdoAoy2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5540742"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5540742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="14130205"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 6/8] drm/xe: Helper to populate a userptr or hmmptr
Date: Mon, 18 Mar 2024 22:55:09 -0400
Message-Id: <20240319025511.1598354-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240319025511.1598354-1-oak.zeng@intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
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

Add a helper function xe_userptr_populate_range to populate
a a userptr or hmmptr range. This functions calls hmm_range_fault
to read CPU page tables and populate all pfns/pages of this
virtual address range.

If the populated page is system memory page, dma-mapping is performed
to get a dma-address which can be used later for GPU to access pages.

If the populated page is device private page, we calculate the dpa (
device physical address) of the page.

The dma-address or dpa is then saved in userptr's sg table. This is
prepare work to replace the get_user_pages_fast code in userptr code
path. The helper function will also be used to populate hmmptr later.

v1: Address review comments:
    separate a npage_in_range function (Matt)
    reparameterize function xe_userptr_populate_range function (Matt)
    move mmu_interval_read_begin() call into while loop (Thomas)
    s/mark_range_accessed/xe_mark_range_accessed (Thomas)
    use set_page_dirty_lock (vs set_page_dirty) (Thomas)
    move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Makefile |   1 +
 drivers/gpu/drm/xe/xe_hmm.c | 231 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  10 ++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e2ec6d1375c0..52300de1e86f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
 	xe_heci_gsc.o \
+	xe_hmm.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
new file mode 100644
index 000000000000..305e3f2e659b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/mmu_notifier.h>
+#include <linux/dma-mapping.h>
+#include <linux/memremap.h>
+#include <linux/swap.h>
+#include <linux/hmm.h>
+#include <linux/mm.h>
+#include "xe_hmm.h"
+#include "xe_svm.h"
+#include "xe_vm.h"
+
+static inline u64 npages_in_range(unsigned long start, unsigned long end)
+{
+	return ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
+}
+
+/**
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
+	npages = npages_in_range(range->start, range->end);
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(range->hmm_pfns[i]);
+		if (write)
+			set_page_dirty_lock(page);
+
+		mark_page_accessed(page);
+	}
+}
+
+/**
+ * build_sg() - build a scatter gather table for all the physical pages/pfn
+ * in a hmm_range. dma-address is save in sg table and will be used to program
+ * GPU page table later.
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
+ * the scatter gather table. This is for the convenience of
+ * later on operations to bind address range to GPU page table.
+ *
+ * The dma_address in the sg table will later be used by GPU to
+ * access memory. So if the memory is system memory, we need to
+ * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
+ * is GPU local memory (of the GPU who is going to access memory),
+ * we need gpu dpa (device physical address), and there is no need
+ * of dma-mapping.
+ *
+ * FIXME: dma-mapping for peer gpu device to access remote gpu's
+ * memory. Add this when you support p2p
+ *
+ * This function allocates the storage of the sg table. It is
+ * caller's responsibility to free it calling sg_free_table.
+ *
+ * Returns 0 if successful; -ENOMEM if fails to allocate memory
+ */
+static int build_sg(struct xe_device *xe, struct hmm_range *range,
+			     struct sg_table *st, bool write)
+{
+	struct device *dev = xe->drm.dev;
+	struct scatterlist *sg;
+	u64 i, npages;
+
+	sg = NULL;
+	st->nents = 0;
+	npages = npages_in_range(range->start, range->end);
+
+	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page;
+		unsigned long addr;
+		struct xe_mem_region *mr;
+
+		page = hmm_pfn_to_page(range->hmm_pfns[i]);
+		if (is_device_private_page(page)) {
+			mr = xe_page_to_mem_region(page);
+			addr = xe_mem_region_pfn_to_dpa(mr, range->hmm_pfns[i]);
+		} else {
+			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
+					write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
+		}
+
+		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
+			sg->length += PAGE_SIZE;
+			sg_dma_len(sg) += PAGE_SIZE;
+			continue;
+		}
+
+		sg =  sg ? sg_next(sg) : st->sgl;
+		sg_dma_address(sg) = addr;
+		sg_dma_len(sg) = PAGE_SIZE;
+		sg->length = PAGE_SIZE;
+		st->nents++;
+	}
+
+	sg_mark_end(sg);
+	return 0;
+}
+
+/**
+ * xe_userptr_populate_range() - Populate physical pages of a virtual
+ * address range
+ *
+ * @uvma: userptr vma which has information of the range to populate.
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
+int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	struct xe_userptr *userptr;
+	struct xe_vma *vma = &uvma->vma;
+	u64 start = xe_vma_userptr(vma);
+	u64 end = start + xe_vma_size(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct hmm_range hmm_range;
+	bool write = !xe_vma_read_only(vma);
+	bool in_kthread = !current->mm;
+	u64 npages;
+	int ret;
+
+	userptr = &uvma->userptr;
+	mmap_assert_locked(userptr->notifier.mm);
+
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return 0;
+
+	npages = npages_in_range(start, end);
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |= HMM_PFN_REQ_WRITE;
+
+	if (in_kthread) {
+		if (!mmget_not_zero(userptr->notifier.mm)) {
+			ret = -EFAULT;
+			goto free_pfns;
+		}
+		kthread_use_mm(userptr->notifier.mm);
+	}
+
+	memset64((u64 *)pfns, (u64)flags, npages);
+	hmm_range.hmm_pfns = pfns;
+	hmm_range.notifier = &userptr->notifier;
+	hmm_range.start = start;
+	hmm_range.end = end;
+	hmm_range.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+	/**
+	 * FIXME:
+	 * Set the the dev_private_owner can prevent hmm_range_fault to fault
+	 * in the device private pages owned by caller. See function
+	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
+	 * device owner of the best migration destination. e.g., device0/vm0
+	 * has a page fault, but we have determined the best placement of
+	 * the fault address should be on device1, we should set below to
+	 * device1 instead of device0.
+	 */
+	hmm_range.dev_private_owner = vm->xe;
+
+	while (true) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
+		ret = hmm_range_fault(&hmm_range);
+		if (time_after(jiffies, timeout))
+			break;
+
+		if (ret == -EBUSY)
+			continue;
+		break;
+	}
+
+	if (in_kthread) {
+		kthread_unuse_mm(userptr->notifier.mm);
+		mmput(userptr->notifier.mm);
+	}
+
+	if (ret)
+		goto free_pfns;
+
+	ret = build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
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
index 000000000000..fa5ddc11f10b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+struct xe_userptr_vma;
+
+int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
-- 
2.26.3

