Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E435BC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03610F888;
	Thu, 14 Mar 2024 03:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJq5sG4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659010F888
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386628; x=1741922628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hD4aJoKqiat0ug34aXTaxx6lVKYXSgtZ22YPLrQgl30=;
 b=FJq5sG4UEwSshU4br8LF2a+27ewxKWH5yOaf/LIOWM/tgZ0zj1HCkjaD
 79nR3y+x0fyzAMMV5Tx4n1icQpy4so+uoSC6U0eKvFug1FS4hiVCgHZRR
 RAxVZ/uXYlAArzKvoFF6EsXP8qtbttGV6n/mcCNyaZbAcX9AoLzA9O7cw
 8dD+RJacvMkCHK4Yk/nWFUM/3rcGCgowU6fUVf9yrfk4AKBC+CmA6HPyi
 HPUe8dK1wiRLult681fTLI63acT2CxfNHpai3tEDE8F/OADWYe5H5/t3p
 mVDKhuuQt8aObCRDIOCYXIXjbjZqsiY+Cc4XfEPycSUXNRPRuhtgdmq58 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8966482"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8966482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12084626"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, airlied@gmail.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
Date: Wed, 13 Mar 2024 23:35:52 -0400
Message-Id: <20240314033553.1379444-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240314033553.1379444-1-oak.zeng@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Add a helper function xe_hmm_populate_range to populate
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Makefile |   3 +-
 drivers/gpu/drm/xe/xe_hmm.c | 213 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  12 ++
 3 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 840467080e59..29dcbc938b01 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -143,7 +143,8 @@ xe-y += xe_bb.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o \
-	xe_svm_devmem.o
+	xe_svm_devmem.o \
+	xe_hmm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
new file mode 100644
index 000000000000..c45c2447d386
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/mmu_notifier.h>
+#include <linux/dma-mapping.h>
+#include <linux/memremap.h>
+#include <linux/swap.h>
+#include <linux/mm.h>
+#include "xe_hmm.h"
+#include "xe_vm.h"
+
+/**
+ * mark_range_accessed() - mark a range is accessed, so core mm
+ * have such information for memory eviction or write back to
+ * hard disk
+ *
+ * @range: the range to mark
+ * @write: if write to this range, we mark pages in this range
+ * as dirty
+ */
+static void mark_range_accessed(struct hmm_range *range, bool write)
+{
+	struct page *page;
+	u64 i, npages;
+
+	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
+	for (i = 0; i < npages; i++) {
+		page = hmm_pfn_to_page(range->hmm_pfns[i]);
+		if (write) {
+			lock_page(page);
+			set_page_dirty(page);
+			unlock_page(page);
+		}
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
+	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
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
+			mr = page_to_mem_region(page);
+			addr = vram_pfn_to_dpa(mr, range->hmm_pfns[i]);
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
+ * xe_hmm_populate_range() - Populate physical pages of a virtual
+ * address range
+ *
+ * @vma: vma has information of the range to populate. only vma
+ * of userptr and hmmptr type can be populated.
+ * @hmm_range: pointer to hmm_range struct. hmm_rang->hmm_pfns
+ * will hold the populated pfns.
+ * @write: populate pages with write permission
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
+int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
+						bool write)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	struct xe_userptr_vma *userptr_vma;
+	struct xe_userptr *userptr;
+	u64 start = vma->gpuva.va.addr;
+	u64 end = start + vma->gpuva.va.range;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	u64 npages;
+	int ret;
+
+	userptr_vma = to_userptr_vma(vma);
+	userptr = &userptr_vma->userptr;
+	mmap_assert_locked(userptr->notifier.mm);
+
+	npages = ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |= HMM_PFN_REQ_WRITE;
+
+	memset64((u64 *)pfns, (u64)flags, npages);
+	hmm_range->hmm_pfns = pfns;
+	hmm_range->notifier_seq = mmu_interval_read_begin(&userptr->notifier);
+	hmm_range->notifier = &userptr->notifier;
+	hmm_range->start = start;
+	hmm_range->end = end;
+	hmm_range->pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
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
+	hmm_range->dev_private_owner = vm->xe->drm.dev;
+
+	while (true) {
+		ret = hmm_range_fault(hmm_range);
+		if (time_after(jiffies, timeout))
+			break;
+
+		if (ret == -EBUSY)
+			continue;
+		break;
+	}
+
+	if (ret)
+		goto free_pfns;
+
+	ret = build_sg(vm->xe, hmm_range, &userptr->sgt, write);
+	if (ret)
+		goto free_pfns;
+
+	mark_range_accessed(hmm_range, write);
+	userptr->sg = &userptr->sgt;
+	userptr->notifier_seq = hmm_range->notifier_seq;
+
+free_pfns:
+	kvfree(pfns);
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
new file mode 100644
index 000000000000..960f3f6d36ae
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/types.h>
+#include <linux/hmm.h>
+#include "xe_vm_types.h"
+#include "xe_svm.h"
+
+int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
+						bool write);
-- 
2.26.3

