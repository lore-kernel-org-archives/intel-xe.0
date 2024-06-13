Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB6CC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EAB10EAC4;
	Thu, 13 Jun 2024 15:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwawT3Yd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A4410EABA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292044; x=1749828044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nFJqYxJS3XDL5z6O2JSYSrN/XOG5NbmObj2Vf7jVrEU=;
 b=fwawT3YdsG3BOrUaTYQfzt4Fm1QuftrJgc6Uv/aXnIesHqeTAplNf4fS
 7RHDCgdZkKZS1cbCWUpokAAB6hBFZpEBKkytoI3Hc909WppWb4B6S9afd
 6f57SO5UZPt6j9bYarUu/RuwOugPeOblH2zDVGmWc8Q9ITFVODgej8J5+
 lJk+S3Uw8nIeA3B2cMHUa2obTWYdKKkohcfk9e9KdPr2iZ8Y0eX00jW3d
 1cSzuV6mCzcJREZ9tyqfxRv4qAafGBI01WK5lqNpJrbwy2t5p5hbfSnLi
 C0urMjM5o4uHJLj5SjzIyffQljwbpT3Ljm5JJzQ6mxYkzG4UUd3UZzVt2 Q==;
X-CSE-ConnectionGUID: zTyYlVtJQROf91r0YfpF9w==
X-CSE-MsgGUID: DdIQZGIlReyrrklf7CZ+Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348644"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
X-CSE-ConnectionGUID: Xb8oGYJcRg2PeYvyQf3a9Q==
X-CSE-MsgGUID: 922gsRO3Tg6YDxEz+ZL9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135088"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 12/42] drm/svm: handle CPU page fault
Date: Thu, 13 Jun 2024 11:30:58 -0400
Message-Id: <20240613153128.681864-12-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

Under the picture of svm, CPU and GPU program share the same
virtual address space. The backing store of this virtual address
space can be either in system memory or device memory. Since GPU
device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
Any CPU access to device memory causes a page fault. Implement
a page fault handler to migrate memory back to system memory and
map it to CPU page table so the CPU program can proceed.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_svm.c | 272 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 271 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_svm.c b/drivers/gpu/drm/drm_svm.c
index 741874689e32..80c5b7146ba6 100644
--- a/drivers/gpu/drm/drm_svm.c
+++ b/drivers/gpu/drm/drm_svm.c
@@ -8,6 +8,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
 #include <linux/memremap.h>
+#include <linux/migrate.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_svm.h>
 #include <linux/swap.h>
@@ -316,7 +317,276 @@ int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u
 }
 EXPORT_SYMBOL_GPL(drm_svm_hmmptr_populate);
 
-static struct dev_pagemap_ops drm_devm_pagemap_ops;
+static void __drm_svm_free_pages(unsigned long *mpfn, unsigned long npages)
+{
+	struct page *page;
+	int j;
+
+	for (j = 0; j < npages; j++) {
+		page = migrate_pfn_to_page(mpfn[j]);
+		mpfn[j] = 0;
+		if (page) {
+			unlock_page(page);
+			put_page(page);
+		}
+	}
+}
+
+/**
+ * __drm_svm_alloc_host_pages() - allocate host pages for the fault vma
+ *
+ * @vma: the fault vma that we need allocate page for
+ * @addr: the virtual address that we allocate pages for
+ * @mpfn: used to output the migration pfns of the allocated pages
+ * @npages: number of pages to allocate
+ *
+ * This function allocate host pages for a specified vma.
+ *
+ * When this function returns, the pages are locked.
+ *
+ * Return 0 on success
+ * error code otherwise
+ */
+static int __drm_svm_alloc_host_pages(struct vm_area_struct *vma,
+					unsigned long addr,
+					u64 npages,
+					unsigned long *mpfn)
+{
+	struct page *page;
+	int i;
+
+	for (i = 0; i < npages; i++) {
+		page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
+		if (unlikely(!page))
+			goto free_allocated;
+
+		/**Lock page per hmm requirement, see hmm.rst*/
+		lock_page(page);
+
+		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		addr += PAGE_SIZE;
+	}
+	return 0;
+
+free_allocated:
+	__drm_svm_free_pages(mpfn, i);
+	return -ENOMEM;
+}
+
+static struct migrate_vec *__generate_migrate_vec_vram(unsigned long *mpfn, bool is_migrate_src, unsigned long npages)
+{
+	struct migrate_vec *vec;
+	int size = sizeof(*vec) + sizeof(vec->addr_vec[1]) * (npages - 1);
+	struct drm_mem_region *mr;
+	struct page *page;
+	u64 dpa;
+	int i, j;
+
+	BUG_ON(is_migrate_src && npages != 1);
+	vec = kzalloc(size, GFP_KERNEL);
+	if (!vec)
+		return NULL;
+
+	mr = drm_page_to_mem_region(page);
+	for(i = 0, j = 0; i < npages; i++) {
+		/**
+		 * We only migrate one page from vram to sram on CPU page fault today.
+		 * If this source page is not marked with _MIGRATE flag, something is
+		 * wrong. We need to report error to core mm.
+		 *
+		 * If we move to multiple pages migration, below logic need a revisit,
+		 * as it is fine to only migrate some pages (but not all) as indicated
+		 * by hmm.
+		 */
+		if (is_migrate_src && !(mpfn[i] & MIGRATE_PFN_MIGRATE)) {
+			pr_err("Migrate from vram to sram: MIGRATE_PFN_MIGRATE flag is not set\n");
+			kfree(vec);
+			return NULL;
+		}
+
+		page = migrate_pfn_to_page(mpfn[i]);
+		if (!page || !is_device_private_page(page)) {
+			pr_err("No page or wrong page zone in %s\n", __func__);
+			kfree(vec);
+			return NULL;
+		}
+
+		dpa = drm_mem_region_page_to_dpa(mr, page);
+		vec->addr_vec[j++].dpa = dpa;
+	}
+	vec->mr = mr;
+	vec->npages = j;
+	return vec;
+}
+
+static struct migrate_vec *__generate_migrate_vec_sram(struct device *dev, unsigned long *mpfn,
+		bool is_migrate_src, unsigned long npages)
+{
+	enum dma_data_direction dir = is_migrate_src ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	struct migrate_vec *vec;
+	int size = sizeof(*vec) + sizeof(vec->addr_vec[1]) * (npages - 1);
+	dma_addr_t dma_addr;
+	struct page *page;
+	int i, j, k;
+
+	page = migrate_pfn_to_page(mpfn[0]);
+	if (unlikely(!page))
+		return NULL;
+
+	vec = kzalloc(size, GFP_KERNEL);
+	if (!vec)
+		return NULL;
+
+	for(i = 0, k =0 ; i < npages; i++) {
+		if (is_migrate_src && !(mpfn[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		page = migrate_pfn_to_page(mpfn[i]);
+		if (!page || is_device_private_page(page)) {
+			pr_err("No page or wrong page zone in %s\n", __func__);
+			goto undo_dma_mapping;
+		}
+
+		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		if (unlikely(dma_mapping_error(dev, dma_addr)))
+			goto undo_dma_mapping;
+
+		vec->addr_vec[k++].dma_addr = dma_addr;
+	}
+
+	vec->mr = NULL;
+	vec->npages = k;
+	return vec;
+
+undo_dma_mapping:
+	for (j = 0; j < k; j++) {
+		if (vec->addr_vec[j].dma_addr)
+			dma_unmap_page(dev, vec->addr_vec[j].dma_addr, PAGE_SIZE, dir);
+	}
+	kfree(vec);
+	return NULL;
+}
+
+static void __free_migrate_vec_sram(struct device *dev, struct migrate_vec *vec, bool is_migrate_src)
+{
+	enum dma_data_direction dir = is_migrate_src ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	int i;
+
+	BUG_ON(vec->mr != NULL);
+
+	for (i = 0; i < vec->npages; i++) {
+		dma_unmap_page(dev, vec->addr_vec[i].dma_addr, PAGE_SIZE, dir);
+		/** No need to free host pages. migrate_vma_finalize take care */
+	}
+	kfree(vec);
+}
+
+static void __free_migrate_vec_vram(struct migrate_vec *vec)
+{
+	BUG_ON(vec->mr == NULL);
+
+	kfree(vec);
+}
+/**
+ * drm_svm_migrate_to_sram() - Migrate memory back to sram on CPU page fault
+ *
+ * @vmf: cpu vm fault structure, contains fault information such as vma etc.
+ *
+ * Note, this is in CPU's vm fault handler, caller holds the mmap read lock.
+ *
+ * This function migrate one page at the fault address. This is the normal
+ * core mm page fault scheme. Linux doesn't aggressively prefault at CPU page
+ * fault time. It only fault-in one page to recover the fault address. Even
+ * if we migrate more than one page, core mm still only program one pte entry
+ * (covers one page).See logic in function handle_pte_fault. do_swap_page
+ * eventually calls to drm_svm_migrate_to_sram in our case.
+ *
+ * We call migrate_vma_setup to set up the migration. During migrate_vma_setup,
+ * device page table is invalidated before migration (by calling the driver registered
+ * mmu notifier)
+ *
+ * We call migrate_vma_finalize to finalize the migration. During migrate_vma_finalize,
+ * device pages of the source buffer is freed (by calling memory region's
+ * drm_mem_region_free_page callback function)
+ *
+ * Return:
+ * 0 on success
+ * VM_FAULT_SIGBUS: failed to migrate page to system memory, application
+ * will be signaled a SIGBUG
+ */
+static vm_fault_t drm_svm_migrate_to_sram(struct vm_fault *vmf)
+{
+	struct drm_mem_region *mr = drm_page_to_mem_region(vmf->page);
+	struct drm_device *drm = mr->mr_ops.drm_mem_region_get_device(mr);
+	unsigned long src_pfn = 0, dst_pfn = 0;
+	struct device *dev = drm->dev;
+	struct vm_area_struct *vma = vmf->vma;
+	struct migrate_vec *src;
+	struct migrate_vec *dst;
+	struct dma_fence *fence;
+	vm_fault_t ret = 0, r;
+
+	struct migrate_vma migrate_vma = {
+		.vma		= vma,
+		.start		= ALIGN_DOWN(vmf->address, PAGE_SIZE),
+		.end		= ALIGN_DOWN(vmf->address, PAGE_SIZE) + PAGE_SIZE,
+		.src		= &src_pfn,
+		.dst		= &dst_pfn,
+		.pgmap_owner	= mr->mr_ops.drm_mem_region_pagemap_owner(mr),
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.fault_page = vmf->page,
+	};
+
+	if (migrate_vma_setup(&migrate_vma) < 0)
+		return VM_FAULT_SIGBUS;
+
+	if (!migrate_vma.cpages)
+		return 0;
+
+	r = __drm_svm_alloc_host_pages(vma, migrate_vma.start, 1, migrate_vma.dst);
+	if (r) {
+		ret = VM_FAULT_OOM;
+		goto migrate_finalize;
+	}
+
+	src = __generate_migrate_vec_vram(migrate_vma.src, true, 1);
+	if (!src) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_host_pages;
+	}
+
+	dst = __generate_migrate_vec_sram(dev, migrate_vma.dst, false, 1);
+	if (!dst) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_migrate_src;
+	}
+
+	fence = mr->mr_ops.drm_mem_region_migrate(src, dst);
+	if (IS_ERR(fence)) {
+		ret = VM_FAULT_SIGBUS;
+		goto free_migrate_dst;
+	}
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+	migrate_vma_pages(&migrate_vma);
+
+free_migrate_dst:
+	__free_migrate_vec_sram(dev, dst, false);
+free_migrate_src:
+	__free_migrate_vec_vram(src);
+free_host_pages:
+	if (ret)
+		__drm_svm_free_pages(migrate_vma.dst, 1);
+migrate_finalize:
+	if (ret)
+		memset(migrate_vma.dst, 0, sizeof(*migrate_vma.dst));
+	migrate_vma_finalize(&migrate_vma);
+	return ret;
+}
+static struct dev_pagemap_ops drm_devm_pagemap_ops = {
+	.migrate_to_ram = drm_svm_migrate_to_sram,
+};
 
 /**
  * drm_svm_register_mem_region: Remap and provide memmap backing for device memory
-- 
2.26.3

