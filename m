Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62247C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB342112EFA;
	Tue,  9 Apr 2024 20:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNqcBAMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41337112F28
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693096; x=1744229096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbcIdeknM65ZEO61cxyBgrpcSO9mIk4VKWdiDJW3W0c=;
 b=dNqcBAMZXnHJnh1j4tdz0XP3A67bKJBk9Jst6Xn/9LjBXqZF7q55pmJ2
 8spxM+mqyAevIz8ts9fjd1vp3v0WTG+3xOSgGqIKQJPtoUNMTY7H/gWjh
 QWUBYklNmBwpKdDNarircz6uJBedBA0tDufgaSHRSz84XfgE3PnLtA1CK
 xU73cv0M5lM3idbpjrUVIJMxuAIN8Yy8fRoFwIpqtVcr3d/VPOFLBIb5z
 k5+BwI5DugjiCgGzlJXa6zLeBo1V2OsrKPd4LIj5N6FZii8Pbxjhtkxsk
 EjKZ8pK9LzUG2OKYO24/XcJVjg+i+y1ghIHD8KyFsw/JirdhpwitC1XMK w==;
X-CSE-ConnectionGUID: H+22uLarR1Wx80GbwUX2eQ==
X-CSE-MsgGUID: CTIeV3QsQzKUSDCnBVnC3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803764"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: VtX8GMaTSTqWBtY7/2EQvQ==
X-CSE-MsgGUID: sJadFhyzR8aKfehmmJS1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773779"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Date: Tue,  9 Apr 2024 16:17:33 -0400
Message-Id: <20240409201742.3042626-23-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Function xe_devm_alloc_pages allocate pages from drm buddy and perform
house keeping work for all the pages allocated, such as get a page
refcount, keep a bitmap of all pages to denote whether a page is in
use, put pages to a drm lru list for eviction purpose.

Function xe_devm_free_blocks return list of memory blocks to drm buddy
allocator.

Function xe_devm_free_page is a call back function from hmm layer. It
is called whenever a page's refcount reaches to 1. This function clears
the bit of this page in the bitmap. If all the bits in the bitmap is
cleared, it means all the pages have been freed, we return all the pages
in this memory block back to drm buddy.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h        |   7 ++
 drivers/gpu/drm/xe/xe_svm_devmem.c | 147 ++++++++++++++++++++++++++++-
 2 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 624c1581f8ba..92a3ee90d5a7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -46,4 +46,11 @@ static inline struct xe_mem_region *xe_page_to_mem_region(struct page *page)
 	return container_of(page->pgmap, struct xe_mem_region, pagemap);
 }
 
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,
+						struct list_head *blocks,
+						unsigned long *pfn);
+
+void xe_devm_free_blocks(struct list_head *blocks);
+void xe_devm_page_free(struct page *page);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index 31af56e8285a..5ba0cd9a70b0 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -5,18 +5,161 @@
 
 #include <linux/mm_types.h>
 #include <linux/sched/mm.h>
-
+#include <linux/gfp.h>
+#include <linux/migrate.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <drm/drm_buddy.h>
 #include "xe_device_types.h"
 #include "xe_svm.h"
+#include "xe_migrate.h"
+#include "xe_ttm_vram_mgr_types.h"
+#include "xe_assert.h"
 
+/**
+ * struct xe_svm_block_meta - svm uses this data structure to manage each
+ * block allocated from drm buddy. This will be set to the drm_buddy_block's
+ * private field.
+ *
+ * @lru: used to link this block to drm's lru lists. This will be replace
+ * with struct drm_lru_entity later.
+ * @tile: tile from which we allocated this block
+ * @bitmap: A bitmap of each page in this block. 1 means this page is used,
+ * 0 means this page is idle. When all bits of this block are 0, it is time
+ * to return this block to drm buddy subsystem.
+ */
+struct xe_svm_block_meta {
+	struct list_head lru;
+	struct xe_tile *tile;
+	unsigned long bitmap[];
+};
 
 static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
 {
 	return 0;
 }
 
-static void xe_devm_page_free(struct page *page)
+static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
+{
+	/** DRM buddy's block offset is 0-based*/
+	offset += mr->hpa_base;
+
+	return PHYS_PFN(offset);
+}
+
+/** FIXME: we locked page by calling zone_device_page_init
+ *  in xe_devm_alloc_pages. Should we unlock pages here?
+ */
+static void free_block(struct drm_buddy_block *block)
+{
+	struct xe_svm_block_meta *meta =
+		(struct xe_svm_block_meta *)block->private;
+	struct xe_tile *tile  = meta->tile;
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+
+	kfree(block->private);
+	drm_buddy_free_block(mm, block);
+}
+
+void xe_devm_page_free(struct page *page)
+{
+	struct drm_buddy_block *block =
+					(struct drm_buddy_block *)page->zone_device_data;
+	struct xe_svm_block_meta *meta =
+					(struct xe_svm_block_meta *)block->private;
+	struct xe_tile *tile  = meta->tile;
+	struct xe_mem_region *mr = &tile->mem.vram;
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	u64 size = drm_buddy_block_size(mm, block);
+	u64 pages_per_block = size >> PAGE_SHIFT;
+	u64 block_pfn_first =
+					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+	u64 page_pfn = page_to_pfn(page);
+	u64 i = page_pfn - block_pfn_first;
+
+	xe_assert(tile->xe, i < pages_per_block);
+	clear_bit(i, meta->bitmap);
+	if (bitmap_empty(meta->bitmap, pages_per_block))
+		free_block(block);
+}
+
+/**
+ * xe_devm_alloc_pages() - allocate device pages from buddy allocator
+ *
+ * @xe_tile: which tile to allocate device memory from
+ * @npages: how many pages to allocate
+ * @blocks: used to return the allocated blocks
+ * @pfn: used to return the pfn of all allocated pages. Must be big enough
+ * to hold at @npages entries.
+ *
+ * This function allocate blocks of memory from drm buddy allocator, and
+ * performs initialization work: set struct page::zone_device_data to point
+ * to the memory block; set/initialize drm_buddy_block::private field;
+ * lock_page for each page allocated; add memory block to lru managers lru
+ * list - this is TBD.
+ *
+ * return: 0 on success
+ * error code otherwise
+ */
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,
+						struct list_head *blocks,
+						unsigned long *pfn)
+{
+	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
+	struct drm_buddy_block *block, *tmp;
+	u64 size = npages << PAGE_SHIFT;
+	int ret = 0, i, j = 0;
+
+	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
+						blocks, DRM_BUDDY_TOPDOWN_ALLOCATION);
+
+	if (unlikely(ret))
+		return ret;
+
+	list_for_each_entry_safe(block, tmp, blocks, link) {
+		struct xe_mem_region *mr = &tile->mem.vram;
+		u64 block_pfn_first, pages_per_block;
+		struct xe_svm_block_meta *meta;
+		u32 meta_size;
+
+		size = drm_buddy_block_size(mm, block);
+		pages_per_block = size >> PAGE_SHIFT;
+		meta_size = BITS_TO_BYTES(pages_per_block) +
+					sizeof(struct xe_svm_block_meta);
+		meta = kzalloc(meta_size, GFP_KERNEL);
+		bitmap_fill(meta->bitmap, pages_per_block);
+		meta->tile = tile;
+		block->private = meta;
+		block_pfn_first =
+					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
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
+
+/**
+ * xe_devm_free_blocks() - free all memory blocks
+ *
+ * @blocks: memory blocks list head
+ */
+void xe_devm_free_blocks(struct list_head *blocks)
 {
+	struct drm_buddy_block *block, *tmp;
+
+	list_for_each_entry_safe(block, tmp, blocks, link)
+		free_block(block);
 }
 
 static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
-- 
2.26.3

