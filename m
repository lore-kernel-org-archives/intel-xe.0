Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1A3C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AB510EE6F;
	Fri, 14 Jun 2024 21:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScdsZXQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8A10E2BD
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401660; x=1749937660;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KEyvji156vHLYVNXQtnrEQ5g36aRFry/yx72b4ajJlo=;
 b=ScdsZXQw09wXq2qrHsPKi0sofIwFAoqLwsBGtINmiPr1gtGGAf+mazWj
 FebEgyNFKJlFLIzX+Og4CpbS4U01TYfFzykmzUPGz3XP6DipZ5x0LsS2T
 vFvIgh/5q1DoVfwNN3hDoqp79neUHYNVQw6g0jwsHJLQvkQOa4mQvIdPy
 cKQ+aGWT4A+Cnr/9A48k642Y7FJLsaGdngUjZCwf4lRIzbehWvdmiZJ7w
 llAZH0XWyGsWyks6frON/TensWXWj5Mj0DAoj3oTk6ctKFE9UctRWuI3m
 i1IW4z55Nn4n+MM6UCgI3UeDSPS4JWpmAxT60oeR35rPhpRFNE1G9v1fv A==;
X-CSE-ConnectionGUID: VAwJ3o8gTEG6/vix+DqbAg==
X-CSE-MsgGUID: u38Dr6HMR9WUdGpyi8zrXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886604"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: QUxiYD8oST6UB9L9bZcSYA==
X-CSE-MsgGUID: qAS1wuGKSV6uxHJKcnP6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572437"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 43/44] drm/xe/svm: Introduce hmm_pfn array based resource cursor
Date: Fri, 14 Jun 2024 17:58:16 -0400
Message-Id: <20240614215817.1097633-43-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

This type of resource cursor will be used by system allocator or userptr.
With system allocator, all the backing resource are backed by struct page.
The resource could be in system memory or in gpu device memory. For
userptr, the backing resource is always in system memory.

For system memory, the page is already dma-mapped. The dma-mapped
address is in dma_addr array.

For gpu device memory, we will calculate the device physical address
using hmm_pfn.

Note we support a mixture placement of system memory and device memory.
In the resource range, some of the page could be backed by system mem,
and some by device memory.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h | 80 ++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a576d5cb7727..2c550a92af07 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -699,8 +699,9 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
 		u64 offset = start - xe_vma_start(vma);
 		u64 page_idx = offset >> PAGE_SHIFT;
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr + page_idx,
-					 0, xe_vma_size(vma), 0, &curs);
+			xe_res_first_hmmptr(to_userptr_vma(vma)->userptr.hmmptr.dma_addr + page_idx,
+					    to_userptr_vma(vma)->userptr.hmmptr.pfn + page_idx,
+					    &tile->mem.vram.drm_mr, size, &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma) + offset,
 				     size, &curs);
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index b17b3375f6d9..3b071e1796b8 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -25,12 +25,16 @@
 #define _XE_RES_CURSOR_H_
 
 #include <linux/scatterlist.h>
+#include <linux/mm_types.h>
+#include <linux/memremap.h>
+#include <linux/hmm.h>
 
 #include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/drm_svm.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -44,10 +48,11 @@ struct xe_res_cursor {
 	u64 remaining;
 	void *node;
 	u32 mem_type;
-	unsigned int order;
 	struct scatterlist *sgl;
-	const dma_addr_t *dma_addr;
+	dma_addr_t *dma_addr;
 	struct drm_buddy *mm;
+	unsigned long *hmm_pfn;
+	struct drm_mem_region *mr;
 };
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
@@ -80,6 +85,8 @@ static inline void xe_res_first(struct ttm_resource *res,
 	XE_WARN_ON(start + size > res->size);
 
 	cur->mem_type = res->mem_type;
+	cur->hmm_pfn = NULL;
+	cur->mr = NULL;
 
 	switch (cur->mem_type) {
 	case XE_PL_STOLEN:
@@ -160,6 +167,8 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   struct xe_res_cursor *cur)
 {
 	XE_WARN_ON(!sg);
+	cur->hmm_pfn = NULL;
+	cur->mr = NULL;
 	cur->node = NULL;
 	cur->start = start;
 	cur->remaining = size;
@@ -171,34 +180,43 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 }
 
 /**
- * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
+ * xe_res_first_hmmptr - initialize a xe_res_cursor for hmmptr
  *
- * @dma_addr: dma_addr array to walk
- * @start: Start of the range
+ * @dma_addr: dma_addr array to walk, valid when resource is in system mem.
+ * @hmm_pfn: a hmm_pfn array, each item contains hmm_pfn of a 4k page.
+ * @mr: memory region that the resource belongs to
  * @size: Size of the range
- * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
  * @cur: cursor object to initialize
  *
- * Start walking over the range of allocations between @start and @size.
+ * Start walking over the resources used by a hmmptr. For hmmptr,
+ * the backing resource are all backed by struct page. The resource
+ * could be in system memory or in gpu device memory.
+ *
+ * For system memory, the page is already dma-mapped. The dma-mapped
+ * address is in dma_addr array.
+ *
+ * For gpu device memory, we will calculate the device physical address
+ * using hmm_pfn.
+ *
+ * Note we support a mixture placement of system memory and device memory.
+ * In the resource range, some of the page could be backed by system mem,
+ * and some by device memory.
  */
-static inline void xe_res_first_dma(const dma_addr_t *dma_addr,
-				    u64 start, u64 size,
-				    unsigned int order,
-				    struct xe_res_cursor *cur)
+static inline void xe_res_first_hmmptr(dma_addr_t *dma_addr,
+				       unsigned long *hmm_pfn, struct drm_mem_region *mr,
+				       u64 size, struct xe_res_cursor *cur)
 {
-	XE_WARN_ON(start);
 	XE_WARN_ON(!dma_addr);
-	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
-		   !IS_ALIGNED(size, PAGE_SIZE));
+	XE_WARN_ON(!IS_ALIGNED(size, PAGE_SIZE));
 
 	cur->node = NULL;
-	cur->start = start;
 	cur->remaining = size;
-	cur->size = PAGE_SIZE << order;
+	cur->size = 0;
 	cur->dma_addr = dma_addr;
-	cur->order = order;
 	cur->sgl = NULL;
 	cur->mem_type = XE_PL_TT;
+	cur->hmm_pfn = hmm_pfn;
+	cur->mr = mr;
 }
 
 /**
@@ -221,15 +239,19 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 	if (!cur->remaining)
 		return;
 
-	if (cur->size > size) {
-		cur->size -= size;
-		cur->start += size;
+	if (cur->mr) {
+		int npages;
+
+		XE_WARN_ON(!IS_ALIGNED(size, PAGE_SIZE));
+
+		npages = size >> PAGE_SHIFT;
+		cur->hmm_pfn += npages;
+		cur->dma_addr += npages;
 		return;
 	}
 
-	if (cur->dma_addr) {
-		cur->size = (PAGE_SIZE << cur->order) -
-			(size - cur->size);
+	if (cur->size > size) {
+		cur->size -= size;
 		cur->start += size;
 		return;
 	}
@@ -275,9 +297,15 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	if (cur->dma_addr)
-		return cur->dma_addr[cur->start >> (PAGE_SHIFT + cur->order)] +
-			(cur->start & ((PAGE_SIZE << cur->order) - 1));
+	if (cur->mr) {
+		u64 hmm_pfn = *cur->hmm_pfn;
+		struct page *page = hmm_pfn_to_page(hmm_pfn);
+
+		if (is_device_private_page(page))
+			return drm_mem_region_page_to_dpa(cur->mr, page);
+		else
+			return *cur->dma_addr;
+	}
 	else if (cur->sgl)
 		return sg_dma_address(cur->sgl) + cur->start;
 	else
-- 
2.26.3

