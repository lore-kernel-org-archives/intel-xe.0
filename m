Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8C2CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448A112F11;
	Tue,  9 Apr 2024 20:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBx4FlJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0AF112F13
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBafI5FXZPLW/DVHPO53FtkelTSdUwUTqSxhVEoIW0k=;
 b=iBx4FlJLoHKfQovY3saXDEbM2GcDzdhxyOYx9YyouFzxJh/LGd9OeEUA
 ULNj3nPvKps2rbvpgewkbayOlQ86wAnJf3rSJMB42DUzV+NgiDQh+Ah4h
 msE7mBIC333WxYitZb1BVCTpCpGyxSq8N1dcPodxGT7eTU9QjhVxcyY2N
 xznNCMNaNob7ICSTmJ5fx1l0GHdFGyb3e7ZSF4TkkgckN1PsCNLtcYOOe
 Xm9rFVDbyZjRHEZXgK5yAmp6x1s/ZyOflxJXhYt28ru6+y30qvN/VLBbt
 SO/9/cCUuWIl5IaR+qFFoA8ZdxwB05UCP6oPfRfwhM64rCuUmh2l2vzyt Q==;
X-CSE-ConnectionGUID: VRSegDUZRUW1dZ4KdxtK6w==
X-CSE-MsgGUID: /WX4dSBjTTezr2NFBrrYEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803759"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: +warGRjDT8+RObNsjABPgw==
X-CSE-MsgGUID: xyA3NG1TQKmKOeDyVdgZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773767"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 18/31] drm/xe/svm: Build userptr sg table for device pages
Date: Tue,  9 Apr 2024 16:17:29 -0400
Message-Id: <20240409201742.3042626-19-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
MIME-Version: 1.0
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

Previously function xe_build_sg only support userptr with system
memory pages. Now this function is extended to support userptr
with device pages backing as well.

For device pages, there is no need of dma-mapping. Instead, we
calculated the device page's dpa (device physical address) and
use dpa to fill sg table.

As of now, we assume each userptr is only backed either by all
system memory pages or all by device pages. There is no support
of mixture backing of device and system memory pages.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c      | 121 +++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm_types.h |   2 +
 2 files changed, 100 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 427c6bc49949..a261c1dd2060 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -11,6 +11,7 @@
 #include <linux/hmm.h>
 #include <linux/mm.h>
 #include "xe_hmm.h"
+#include "xe_svm.h"
 #include "xe_vm.h"
 #include "xe_bo.h"
 
@@ -43,15 +44,90 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
 	}
 }
 
+/**
+ * xe_build_sg_device_pages() - build sg table for userptr when the backing store
+ * is device pages
+ *
+ * @st: sg table to build
+ * @hmm_pfns: pfn array of the userptr
+ * @pages: struct page arrary of this userptr
+ * @npages: how many pages in this userptr
+ */
+static int xe_build_sg_device_pages(struct sg_table *st, unsigned long *hmm_pfns,
+						struct page **pages, uint64_t npages)
+{
+	struct scatterlist *sg;
+	int i;
+
+	sg = NULL;
+	st->nents = 0;
+	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		unsigned long addr;
+		struct xe_mem_region *mr;
+
+		mr = xe_page_to_mem_region(pages[i]);
+		addr = xe_mem_region_pfn_to_dpa(mr, hmm_pfns[i]);
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
+ * xe_validate_hmm_pfns() - validate all pages in a userptr belong to one memory
+ * region, and populate the pages array.
+ *
+ * @userptr: The userptr to validate
+ * @hmm_pfns: an array holding hmm pfns
+ * @npages: number of pages of this userptr
+ * @pages: output parameter to hold the populated pages from pfn.
+ */
+static void xe_validate_hmm_pfns(struct xe_userptr *userptr, unsigned long *hmm_pfns,
+						uint64_t npages, struct page **pages)
+{
+	int i;
+	struct xe_vma *vma = xe_userptr_to_vma(userptr);
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	pages[0] = hmm_pfn_to_page(hmm_pfns[0]);
+	userptr->is_device_pages = is_device_private_page(pages[0]);
+	for (i = 1; i < npages; i++) {
+		pages[i] = hmm_pfn_to_page(hmm_pfns[i]);
+		/**
+		 * We currently assume no mixture of device pages and system memory
+		 * pages in one userptr. If it turns out this is not true, we will
+		 * either split userptr into device pages based and system memory
+		 * based, or support a mixture backing store in one userptr.
+		 */
+		xe_assert(vm->xe,
+			userptr->is_device_pages == is_device_private_page(pages[i]));
+	}
+}
+
+
 /**
  * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
  * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
  * and will be used to program GPU page table later.
  *
  * @xe: the xe device who will access the dma-address in sg table
+ * @userptr: the userptr that we build the sg table for
  * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
  * has the pfn numbers of pages that back up this hmm address range.
- * @st: pointer to the sg table.
  * @write: whether we write to this range. This decides dma map direction
  * for system pages. If write we map it bi-diretional; otherwise
  * DMA_TO_DEVICE
@@ -64,11 +140,6 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  * access memory. So if the memory is system memory, we need to
  * do a dma-mapping so it can be accessed by GPU/DMA.
  *
- * FIXME: This function currently only support pages in system
- * memory. If the memory is GPU local memory (of the GPU who
- * is going to access memory), we need gpu dpa (device physical
- * address), and there is no need of dma-mapping. This is TBD.
- *
  * FIXME: dma-mapping for peer gpu device to access remote gpu's
  * memory. Add this when you support p2p
  *
@@ -77,12 +148,13 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  *
  * Returns 0 if successful; -ENOMEM if fails to allocate memory
  */
-static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
-			     struct sg_table *st, bool write)
+static int xe_build_sg(struct xe_device *xe, struct xe_userptr *userptr,
+					struct hmm_range *range, bool write)
 {
+	struct sg_table *st = &userptr->sgt;
 	struct device *dev = xe->drm.dev;
 	struct page **pages;
-	u64 i, npages;
+	u64 npages;
 	int ret;
 
 	npages = xe_npages_in_range(range->start, range->end);
@@ -90,19 +162,22 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 	if (!pages)
 		return -ENOMEM;
 
-	for (i = 0; i < npages; i++) {
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-		xe_assert(xe, !is_device_private_page(pages[i]));
-	}
-
-	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
-			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);
-	if (ret)
-		goto free_pages;
+	xe_validate_hmm_pfns(userptr, range->hmm_pfns, npages, pages);
+	if (!userptr->is_device_pages) {
+		ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
+				npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);
+		if (ret)
+			goto free_pages;
 
-	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
-			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
+		ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+				DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
+	} else {
+		ret = xe_build_sg_device_pages(st, range->hmm_pfns, pages, npages);
+		if (ret)
+			goto free_pages;
+	}
 
+	userptr->sg = st;
 free_pages:
 	kvfree(pages);
 	return ret;
@@ -127,7 +202,8 @@ void xe_userptr_free_sg(struct xe_userptr_vma *uvma)
 	struct device *dev = xe->drm.dev;
 
 	xe_assert(xe, userptr->sg);
-	dma_unmap_sgtable(dev, userptr->sg,
+	if (!userptr->is_device_pages)
+		dma_unmap_sgtable(dev, userptr->sg,
 			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
 
 	sg_free_table(userptr->sg);
@@ -239,12 +315,11 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	if (ret)
 		goto free_pfns;
 
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
+	ret = xe_build_sg(vm->xe, userptr, &hmm_range, write);
 	if (ret)
 		goto free_pfns;
 
 	xe_mark_range_accessed(&hmm_range, write);
-	userptr->sg = &userptr->sgt;
 	userptr->notifier_seq = hmm_range.notifier_seq;
 
 free_pfns:
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fbf6bfcf59a8..3b4debfecc9b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -64,6 +64,8 @@ struct xe_userptr {
 	struct sg_table *sg;
 	/** @notifier_seq: notifier sequence number */
 	unsigned long notifier_seq;
+	/** @is_device_pages: the backing store is in device memory*/
+	bool is_device_pages;
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-- 
2.26.3

