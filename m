Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EDEC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 02:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DB410E0A5;
	Tue, 19 Mar 2024 02:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcRknQ64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0510E9B4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710816177; x=1742352177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92GvnRWpEw+psraaf+xTDdzdiUTjCEViBwHB/tJ/1tc=;
 b=KcRknQ64MO+6ZeM5BocEzHO6reGO2i4betiddZMSw3Gd9rQBE/iZbKYa
 WIOxJ1P5XBNHLvtx7hRNpCFumWkMDr7o+F0XABJdZsYN7LpG1O2OrOWEU
 xwPfJU96M0aNjXbj6qrdbG6Q94DlzM4fWWFDUjPKC+kNSaWNTjbKuHBDh
 8TfLPfvrAi7gqb+ZKBnI8eb6cOBvG7lyoQ5ioVZEwcgo+b952v8I6i6+y
 egTXzGOXqwwD/lfUIvVy6vKQXEypnk6aaVlBdzfibd6cH6tvcKrG4Kf1h
 7gPCby6rtA1BOCzKxOwmwxqeb6h7Zar2lna5f8biZxiGzSOfo5wc/UWCr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5540743"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5540743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="14130209"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:42:56 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 7/8] drm/xe: Introduce a helper to free sg table
Date: Mon, 18 Mar 2024 22:55:10 -0400
Message-Id: <20240319025511.1598354-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240319025511.1598354-1-oak.zeng@intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce xe_userptr_free_sg helper to dma-unmap all
addresses in userptr's sg table and free sg table.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Suggested by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 59 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hmm.h | 15 ++++++++++
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 305e3f2e659b..98d85b615b53 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/scatterlist.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
 #include <linux/memremap.h>
@@ -13,6 +14,16 @@
 #include "xe_svm.h"
 #include "xe_vm.h"
 
+static inline unsigned long append_vram_bit_to_addr(unsigned long addr)
+{
+	return (addr | ADDR_VRAM_BIT);
+}
+
+static inline bool address_is_vram(unsigned long addr)
+{
+	return (addr & ADDR_VRAM_BIT);
+}
+
 static inline u64 npages_in_range(unsigned long start, unsigned long end)
 {
 	return ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
@@ -55,9 +66,11 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  * for system pages. If write we map it bi-diretional; otherwise
  * DMA_TO_DEVICE
  *
- * All the contiguous pfns will be collapsed into one entry in
- * the scatter gather table. This is for the convenience of
- * later on operations to bind address range to GPU page table.
+ * If the pfns are backed by vram, all the contiguous pfns will be
+ * collapsed into one entry in the scatter gather table. This is
+ * for the convenience of later on operations to bind address
+ * range to GPU page table. pfns which are backed by system
+ * memory are not collapsed.
  *
  * The dma_address in the sg table will later be used by GPU to
  * access memory. So if the memory is system memory, we need to
@@ -97,12 +110,14 @@ static int build_sg(struct xe_device *xe, struct hmm_range *range,
 		if (is_device_private_page(page)) {
 			mr = xe_page_to_mem_region(page);
 			addr = xe_mem_region_pfn_to_dpa(mr, range->hmm_pfns[i]);
+			addr = append_vram_bit_to_addr(addr);
 		} else {
 			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
 					write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
 		}
 
-		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
+		if (sg && is_device_private_page(page) &&
+				(addr == (sg_dma_address(sg) + sg->length))) {
 			sg->length += PAGE_SIZE;
 			sg_dma_len(sg) += PAGE_SIZE;
 			continue;
@@ -119,6 +134,39 @@ static int build_sg(struct xe_device *xe, struct hmm_range *range,
 	return 0;
 }
 
+/**
+ * xe_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	bool write = !xe_vma_read_only(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	struct device *dev = xe->drm.dev;
+	struct scatterlist *sg;
+	unsigned long addr;
+	int i;
+
+	xe_assert(xe, userptr->sg);
+	for_each_sgtable_sg(userptr->sg, sg, i) {
+		addr = sg_dma_address(sg);
+		if (!address_is_vram(addr))
+			dma_unmap_page(dev, addr, PAGE_SIZE,
+				write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
+	}
+
+	sg_free_table(userptr->sg);
+	userptr->sg = NULL;
+}
+
 /**
  * xe_userptr_populate_range() - Populate physical pages of a virtual
  * address range
@@ -163,6 +211,9 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
 
+	if (userptr->sg)
+		xe_userptr_free_sg(uvma);
+
 	npages = npages_in_range(start, end);
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (unlikely(!pfns))
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
index fa5ddc11f10b..b1e61d48a1cb 100644
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -7,4 +7,19 @@
 
 struct xe_userptr_vma;
 
+/**
+ * This bit is used during generating of userptr
+ * sg table. If a page is in vram, we append this
+ * bit to the dpa address. This information is
+ * used later to tell whether an address is vram
+ * or system memory.
+ */
+#define ADDR_VRAM_BIT (1<<0)
+
 int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
+void xe_userptr_free_sg(struct xe_userptr_vma *uvma);
+
+static inline unsigned long xe_remove_vram_bit_from_addr(unsigned long addr)
+{
+	return (addr & ~ADDR_VRAM_BIT);
+}
-- 
2.26.3

