Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87153CD129C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274B112F13;
	Tue,  9 Apr 2024 20:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+Tpe6KN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A8E112F2B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zXnHodjASpn8y+U5FI7HPh60W3hkYwsl3nnCFCW7RA=;
 b=X+Tpe6KNafuCRQWdwi+035EDMLYBD6FLpQ9mXWD8UykT/2S+6o8J5Hi2
 CiQWhAEI2mZi7lSNQ8O43w8zXrB/Hpn2LBOKrOThze7RzF4zEi8lDKxoN
 1CtbX6fkpAiSQQR7F+i1UwFbn47XHj8aQg7MT3MGt5yLlT88V4oV9IO+4
 ijaW2ULNJnwzf8/bWXviROWvqltnxL4G7xARxbB20sH5Hw9Z+ZPPpuFw1
 SgaSpXtNHkyzBJeEQUjQE/xDJdqXXxKmtM+aahvfLjdyGCKleb6EDkR87
 VjWR+BdsvgPjQNdytZ4f9aWa1PSslIRfLmN/bFQd6nsiC6s56NKqprhc3 Q==;
X-CSE-ConnectionGUID: Tv2tp2WtSmCVRDJjIlPqqg==
X-CSE-MsgGUID: VAo8kg6pTDah+KWHIQzljQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803769"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:54 -0700
X-CSE-ConnectionGUID: sMbSbaaeSPWsXao7HKceKQ==
X-CSE-MsgGUID: eDFfwaMAQ42TKL50IUKK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773794"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 27/31] drm/xe/svm: Handle CPU page fault
Date: Tue,  9 Apr 2024 16:17:38 -0400
Message-Id: <20240409201742.3042626-28-oak.zeng@intel.com>
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

Under the picture of svm, CPU and GPU program share one same
virtual address space. The backing store of this virtual address
space can be either in system memory or device memory. Since GPU
device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
Any CPU access to device memory causes a page fault. Implement
a page fault handler to migrate memory back to system memory and
map it to CPU page table so the CPU program can proceed.

Also unbind this page from GPU side, and free the original GPU
device page

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_svm.h         |   8 +-
 drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
 drivers/gpu/drm/xe/xe_svm_migrate.c | 222 ++++++++++++++++++++++++++++
 4 files changed, 230 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f89d77b6d654..65289acdd563 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -131,6 +131,7 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_svm.o \
 	xe_svm_devmem.o \
+	xe_svm_migrate.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index f601dffe3fc1..c9e4239c44b4 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -7,11 +7,11 @@
 #define __XE_SVM_H
 
 #include <linux/mm_types.h>
+#include <linux/mm.h>
 #include "xe_device_types.h"
 #include "xe_device.h"
 #include "xe_assert.h"
-
-struct xe_vm;
+#include "xe_vm_types.h"
 
 /**
  * struct xe_svm - data structure to represent a shared
@@ -31,6 +31,9 @@ struct xe_svm {
 	struct list_head vm_list;
 };
 
+#define xe_svm_for_each_vm(svm, vm)					\
+		list_for_each_entry(vm, &svm->vm_list, svm_link)
+
 extern struct xe_svm *xe_create_svm(void);
 void xe_destroy_svm(struct xe_svm *svm);
 extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
@@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
 
 void xe_devm_free_blocks(struct list_head *blocks);
 void xe_devm_page_free(struct page *page);
+vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index 088ac209ad80..32ada458f1dd 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -37,11 +37,6 @@ struct xe_svm_block_meta {
 	unsigned long bitmap[];
 };
 
-static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
-{
-	return 0;
-}
-
 static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
 {
 	/** DRM buddy's block offset is 0-based*/
@@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head *blocks)
 
 static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
 	.page_free = xe_devm_page_free,
-	.migrate_to_ram = xe_devm_migrate_to_ram,
+	.migrate_to_ram = xe_svm_migrate_to_sram,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
new file mode 100644
index 000000000000..0db831af098e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/gfp.h>
+#include <linux/migrate.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <drm/drm_buddy.h>
+#include "xe_device_types.h"
+#include "xe_device.h"
+#include "xe_trace.h"
+#include "xe_migrate.h"
+#include "xe_ttm_vram_mgr_types.h"
+#include "xe_assert.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+#include "xe_vm.h"
+
+
+/**
+ * alloc_host_page() - allocate one host page for the fault vma
+ *
+ * @dev: (GPU) device that will access the allocated page
+ * @vma: the fault vma that we need allocate page for
+ * @addr: the fault address. The allocated page is for this address
+ * @dma_addr: used to output the dma address of the allocated page.
+ * This dma address will be used for gpu to access this page. GPU
+ * access host page through a dma mapped address.
+ * @pfn: used to output the pfn of the allocated page.
+ *
+ * This function allocate one host page for the specified vma. It
+ * also does some prepare work for GPU to access this page, such
+ * as map this page to iommu (by calling dma_map_page).
+ *
+ * When this function returns, the page is locked.
+ *
+ * Return struct page pointer when success
+ * NULL otherwise
+ */
+static struct page *alloc_host_page(struct device *dev,
+							 struct vm_area_struct *vma,
+							 unsigned long addr,
+							 dma_addr_t *dma_addr,
+							 unsigned long *pfn)
+{
+	struct page *page;
+
+	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
+	if (unlikely(!page))
+		return NULL;
+
+	/**Lock page per hmm requirement, see hmm.rst*/
+	lock_page(page);
+	*dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, DMA_FROM_DEVICE);
+	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
+		unlock_page(page);
+		__free_page(page);
+		return NULL;
+	}
+
+	*pfn = migrate_pfn(page_to_pfn(page));
+	return page;
+}
+
+static void free_host_page(struct page *page)
+{
+	unlock_page(page);
+	put_page(page);
+}
+
+/**
+ * migrate_page_vram_to_ram() - migrate one page from vram to ram
+ *
+ * @vma: The vma that the page is mapped to
+ * @addr: The virtual address that the page is mapped to
+ * @src_pfn: src page's page frame number
+ * @dst_pfn: used to return dstination page (in system ram)'s pfn
+ *
+ * Allocate one page in system ram and copy memory from device memory
+ * to system ram.
+ *
+ * Return: 0 if this page is already in sram (no need to migrate)
+ * 1: successfully migrated this page from vram to sram.
+ * error code otherwise
+ */
+static int migrate_page_vram_to_ram(struct vm_area_struct *vma, unsigned long addr,
+						unsigned long src_pfn, unsigned long *dst_pfn)
+{
+	struct xe_mem_region *mr;
+	struct xe_tile *tile;
+	struct xe_device *xe;
+	struct device *dev;
+	dma_addr_t dma_addr = 0;
+	struct dma_fence *fence;
+	struct page *host_page;
+	struct page *src_page;
+	u64 src_dpa;
+
+	src_page = migrate_pfn_to_page(src_pfn);
+	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
+		return 0;
+
+	mr = xe_page_to_mem_region(src_page);
+	tile = xe_mem_region_to_tile(mr);
+	xe = tile_to_xe(tile);
+	dev = xe->drm.dev;
+
+	src_dpa = xe_mem_region_pfn_to_dpa(mr, src_pfn);
+	host_page = alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
+	if (!host_page)
+		return -ENOMEM;
+
+	fence = xe_migrate_pa(tile->migrate, src_dpa, true,
+						dma_addr, false, PAGE_SIZE);
+	if (IS_ERR(fence)) {
+		dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
+		free_host_page(host_page);
+		return PTR_ERR(fence);
+	}
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
+	return 1;
+}
+
+/**
+ * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU page fault
+ *
+ * @vmf: cpu vm fault structure, contains fault information such as vma etc.
+ *
+ * Note, this is in CPU's vm fault handler, caller holds the mmap read lock.
+ *
+ * This function migrate one gpu vma which contains the fault address to sram.
+ * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i.e., create one
+ * gpu vma for one cpu vma initially and try not to split it). So this scheme end
+ * up migrate at the vma granularity. This might not be the best performant scheme
+ *
+ * This can be tunned with a migration granularity for  performance, for example,
+ * migration 2M for each CPU page fault, or let user specify how much to migrate.
+ * This is more complex due to vma splitting.
+ *
+ * This function should also update GPU page table, so the fault virtual address
+ * points to the same sram location from GPU side. This is TBD.
+ *
+ * Return:
+ * 0 on success
+ * VM_FAULT_SIGBUS: failed to migrate page to system memory, application
+ * will be signaled a SIGBUG
+ */
+vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
+{
+	struct xe_mem_region *mr = xe_page_to_mem_region(vmf->page);
+	struct xe_tile *tile = xe_mem_region_to_tile(mr);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct vm_area_struct *vma = vmf->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	struct xe_svm *svm = xe_lookup_svm_by_mm(mm);
+	unsigned long addr = vma->vm_start;
+	u64 npages = vma_pages(vma);
+	struct xe_vma *xe_vma;
+	vm_fault_t ret = 0;
+	struct xe_vm *vm;
+	void *buf;
+	int i;
+
+	struct migrate_vma migrate_vma = {
+		.vma		= vmf->vma,
+		.start		= vma->vm_start,
+		.end		= vma->vm_end,
+		.pgmap_owner	= xe,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.fault_page = vmf->page,
+	};
+
+	buf = kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
+	migrate_vma.src = buf;
+	migrate_vma.dst = buf + npages;
+	if (migrate_vma_setup(&migrate_vma) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_buf;
+	}
+
+	if (!migrate_vma.cpages)
+		goto free_buf;
+
+	for (i = 0; i < npages; i++) {
+		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
+							migrate_vma.dst + i);
+		if (ret < 0) {
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
+
+		/** Migration has been successful, free source page */
+		if (ret == 1) {
+			struct page *src_page = migrate_pfn_to_page(migrate_vma.src[i]);
+
+			xe_devm_page_free(src_page);
+		}
+
+		addr += PAGE_SIZE;
+	}
+
+	xe_svm_for_each_vm(svm, vm) {
+		xe_assert(xe, vm->mm == mm);
+		xe_vma = xe_vm_lookup_vma(vm, vmf->address);
+		if (xe_vma)
+			xe_vm_invalidate_vma(xe_vma);
+	}
+	migrate_vma_pages(&migrate_vma);
+	migrate_vma_finalize(&migrate_vma);
+free_buf:
+	kvfree(buf);
+	return 0;
+}
-- 
2.26.3

