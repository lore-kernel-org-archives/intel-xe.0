Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F2C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A728D10E0E3;
	Thu, 13 Jun 2024 04:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myxFzTMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE58310E964
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252031; x=1749788031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZAy4x0JOSG0BS8xIvSgc+q49eUozig0gcbsviCNFkFk=;
 b=myxFzTMAvs2f00+2ljDOuwIN3ntrlPIoSQGcZ8MsWIQ3eJKpO+mISkkD
 qT9Ty5nSRZIA2cDb2bQl7u3Ai/EmKO7lWlrz8n3QwYW0AB6t7J6vCEng9
 tlEDLzbxgrU/DrbddwrItXcDZSdi9p2XmvS1dldnP/2bGLPLqdBosQFgu
 ze+3HZb8HRJBeDaQWYKEGmr6UGFLppHEbPkCTFFTCbfW7irwHVVW0ol7w
 tnDu21LZ3DirIy9xp86FlbO5CstViX4TJyqUzGGOpxq0QPJfzcLtN4EBh
 3J8QOALQOm3igsSaPGYmV3e+iP9+otrsUSYH9aTfeodrWUCeUnXM+FNrS g==;
X-CSE-ConnectionGUID: tQnsrmxsQWCwQR/ZXTVdNQ==
X-CSE-MsgGUID: yxKKuTBBQsGU2pz37zg4LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847984"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: j1bdjH2ISzSbEl+STZ8X9Q==
X-CSE-MsgGUID: eDCRuYR0R0K5VUAEiPSBMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476355"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 32/42] drm/xe/svm: implement functions to allocate and free
 device memory
Date: Thu, 13 Jun 2024 00:24:19 -0400
Message-Id: <20240613042429.637281-32-oak.zeng@intel.com>
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

Function xe_svm_alloc_pages allocate pages from drm buddy and perform
house keeping work for all the pages allocated, such as get a page
refcount, set page's zone_device_data to point to the drm buddy block
that the page belongs to.

Function xe_svm_free_page free one page back to drm buddy allocator.

v1: Drop buddy block meta data (Matt)
    Take vram_mgr->lock during buddy operation (Matt)
    Moving to page granularity memory free (Oak)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_svm.c   |   1 -
 drivers/gpu/drm/xe/Makefile |   1 +
 drivers/gpu/drm/xe/xe_svm.c | 148 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  16 ++++
 4 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index 967e7addae54..a751cc2c9c91 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -3,7 +3,6 @@
  * Copyright Â© 2024 Intel Corporation
  */
 
-
 #include <linux/scatterlist.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 80bfa5741f26..221b7ddd5287 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -108,6 +108,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..a2c52f205ea0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <linux/mm_types.h>
+#include <linux/sched/mm.h>
+#include <linux/gfp.h>
+#include <drm/drm_buddy.h>
+#include "xe_ttm_vram_mgr_types.h"
+#include "xe_device_types.h"
+#include "xe_device.h"
+#include "xe_tile.h"
+#include "xe_svm.h"
+#include "xe_assert.h"
+
+/** This is a placeholder for compilation. Will introduce function to drm buddy */
+static void drm_buddy_block_free_subrange(struct drm_buddy_block *block, u64 start,
+                        u64 end, struct list_head *block_list)
+{
+}
+
+static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
+{
+	/** DRM buddy's block offset is 0-based*/
+	offset += mr->drm_mr.hpa_base;
+
+	return PHYS_PFN(offset);
+}
+
+void xe_svm_free_page(struct page *page)
+{
+	struct drm_buddy_block *block =
+					(struct drm_buddy_block *)page->zone_device_data;
+	struct drm_mem_region *mr = drm_page_to_mem_region(page);
+	struct xe_mem_region *xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	struct xe_tile *tile = xe_mem_region_to_tile(xe_mr);
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	u64 size = drm_buddy_block_size(mm, block);
+	u64 pages_per_block = size >> PAGE_SHIFT;
+	u64 block_pfn_first =
+					block_offset_to_pfn(xe_mr, drm_buddy_block_offset(block));
+	u64 page_pfn = page_to_pfn(page);
+	u64 page_idx = page_pfn - block_pfn_first;
+	struct list_head blocks = LIST_HEAD_INIT(blocks);
+	struct drm_buddy_block *tmp;
+	int i;
+
+	xe_assert(tile->xe, page_idx < pages_per_block);
+	drm_buddy_block_free_subrange(block, page_idx << PAGE_SHIFT,
+            (page_idx << PAGE_SHIFT) + PAGE_SIZE, &blocks);
+
+	/**
+	 * page's buddy_block (record in page's zone_device_data) is changed
+	 * due to above partial free. update zone_device_data.
+	 */
+	list_for_each_entry_safe(block, tmp, &blocks, link) {
+		size = drm_buddy_block_size(mm, block);
+		pages_per_block = size >> PAGE_SHIFT;
+		block_pfn_first =
+					block_offset_to_pfn(xe_mr, drm_buddy_block_offset(block));
+		for(i = 0; i < pages_per_block; i++) {
+			struct page *p;
+
+			p = pfn_to_page(block_pfn_first + i);
+			p->zone_device_data = block;
+		}
+	}
+}
+
+/**
+ * __free_blocks() - free all memory blocks
+ *
+ * @mm: drm_buddy that the blocks belongs to
+ * @blocks: memory blocks list head
+ */
+static void __free_blocks(struct drm_buddy *mm, struct list_head *blocks)
+{
+	struct drm_buddy_block *block, *tmp;
+
+	list_for_each_entry_safe(block, tmp, blocks, link)
+		drm_buddy_free_block(mm, block);
+}
+
+/**
+ * xe_svm_alloc_pages() - allocate device pages from buddy allocator
+ *
+ * @mr: which memory region to allocate device memory from
+ * @npages: how many pages to allocate
+ * @pfn: used to return the pfn of all allocated pages. Must be big enough
+ * to hold at @npages entries.
+ *
+ * This function allocate blocks of memory from drm buddy allocator, and
+ * performs initialization work: set struct page::zone_device_data to point
+ * to the memory block; zone_device_page_init each page allocated; add pages
+ * to lru managers lru list for eviction purpose - this is TBD.
+ *
+ * return: 0 on success
+ * error code otherwise
+ */
+int xe_svm_alloc_pages(struct drm_mem_region *mr,
+            unsigned long npages, unsigned long *pfn)
+{
+	struct xe_mem_region *xe_mr = container_of(mr, struct xe_mem_region, drm_mr);
+	struct xe_tile *tile = xe_mem_region_to_tile(xe_mr);
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	struct drm_buddy_block *block, *tmp;
+	u64 size = npages << PAGE_SHIFT;
+	int ret = 0, i, j = 0;
+	struct list_head blocks;
+
+	mutex_lock(&tile->mem.vram_mgr->lock);
+	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
+						&blocks, DRM_BUDDY_CONTIGUOUS_ALLOCATION);
+
+	if (unlikely(ret)) {
+		mutex_unlock(&tile->mem.vram_mgr->lock);
+		return ret;
+	}
+
+	ret = drm_buddy_block_trim(mm, size, &blocks);
+	if (ret) {
+		__free_blocks(mm, &blocks);
+		mutex_unlock(&tile->mem.vram_mgr->lock);
+		return ret;
+	}
+	mutex_unlock(&tile->mem.vram_mgr->lock);
+
+	list_for_each_entry_safe(block, tmp, &blocks, link) {
+		u64 block_pfn_first, pages_per_block;
+
+		size = drm_buddy_block_size(mm, block);
+		pages_per_block = size >> PAGE_SHIFT;
+		block_pfn_first =
+					block_offset_to_pfn(xe_mr, drm_buddy_block_offset(block));
+		for(i = 0; i < pages_per_block; i++) {
+			struct page *page;
+
+			pfn[j++] = block_pfn_first + i;
+			page = pfn_to_page(block_pfn_first + i);
+			/**Lock page per hmm requirement, see hmm.rst.*/
+			zone_device_page_init(page);
+			page->zone_device_data = block;
+		}
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..09fef8ea97f3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2024 Intel Corporation
+ */
+
+#ifndef _XE_SVM_
+#define _XE_SVM_
+
+struct drm_mem_region;
+struct page;
+
+int xe_svm_alloc_pages(struct drm_mem_region *mr,
+            unsigned long npages, unsigned long *pfn);
+void xe_svm_free_page(struct page *page);
+
+#endif
-- 
2.26.3

