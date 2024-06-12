Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37356C2BA15
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCDC10E755;
	Wed, 12 Jun 2024 02:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOzAlBUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729810E76D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158539; x=1749694539;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IOJRTsIuVvs6inSK3qoyKbtKEC2lofhAEfswTP4pXXo=;
 b=XOzAlBUP7wau1IvmUucNtJ5GaYopVVP1OvMUs+0zVar93+6o2p93cVSW
 FmuLmQ3x8C3KCk1Jp8YLeE+x/+5jA/VVVmqgurUQYWTlIy9oU2FsoTW0L
 fRh7nWDgXOhqCcGkV8VqlUhwZm+vSeCe5Y8Hhavhwn3lhzDSOntY1SkB+
 2tpchrv0birLnQrz3jVrQUjmnPXnraLs19pLfBAdzZHFJ0XhxAxPFiOuS
 hpl/iI90aNq9b/vrnza7kNU117H0QMcvL/QMmJKJ0Hpzw68VI4LbtNeY5
 7srlnFRu+nhMGE1Ta0LTrUJeTxrn49UGQ8eUFnWi6AKIt0c7u7q2k4WIG w==;
X-CSE-ConnectionGUID: t/OeHCR5QhGaf2+tXl4SWQ==
X-CSE-MsgGUID: nPP+feh8Rqmb1DFIWMuZjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427800"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: CecHxprkRFiI29p6sxDk1Q==
X-CSE-MsgGUID: Kts+mYfIRx6rbEcV5RkfiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763620"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 05/43] iommu/dma: Prepare map/unmap page functions to receive IOVA
Date: Tue, 11 Jun 2024 22:25:27 -0400
Message-Id: <20240612022605.385062-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

From: Leon Romanovsky <leonro@nvidia.com>

Extend the existing map_page/unmap_page function implementations to get
preallocated IOVA. In such case, the IOVA allocation needs to be
skipped, but rest of the code stays the same.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 68 ++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9ce8298047f5..dbef2581a98c 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -822,7 +822,7 @@ static void __iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 }
 
 static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
-		size_t size)
+			      size_t size, bool free_iova)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -841,17 +841,19 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 
 	if (!iotlb_gather.queued)
 		iommu_iotlb_sync(domain, &iotlb_gather);
-	__iommu_dma_free_iova(cookie, dma_addr, size, &iotlb_gather);
+	if (free_iova)
+		__iommu_dma_free_iova(cookie, dma_addr, size, &iotlb_gather);
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot, u64 dma_mask)
+				  dma_addr_t iova, size_t size, int prot,
+				  u64 dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, phys);
-	dma_addr_t iova;
+	bool no_iova = !iova;
 
 	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
 	    iommu_deferred_attach(dev, domain))
@@ -864,12 +866,14 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = __iommu_dma_alloc_iova(domain, size, dma_mask, dev);
+	if (no_iova)
+		iova = __iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
 	if (iommu_map(domain, iova, phys - iova_off, size, prot, GFP_ATOMIC)) {
-		__iommu_dma_free_iova(cookie, iova, size, NULL);
+		if (no_iova)
+			__iommu_dma_free_iova(cookie, iova, size, NULL);
 		return DMA_MAPPING_ERROR;
 	}
 	return iova + iova_off;
@@ -1034,7 +1038,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return vaddr;
 
 out_unmap:
-	__iommu_dma_unmap(dev, *dma_handle, size);
+	__iommu_dma_unmap(dev, *dma_handle, size, true);
 	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
 	return NULL;
 }
@@ -1063,7 +1067,7 @@ static void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
 {
 	struct dma_sgt_handle *sh = sgt_handle(sgt);
 
-	__iommu_dma_unmap(dev, sgt->sgl->dma_address, size);
+	__iommu_dma_unmap(dev, sgt->sgl->dma_address, size, true);
 	__iommu_dma_free_pages(sh->pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
 	sg_free_table(&sh->sgt);
 	kfree(sh);
@@ -1134,9 +1138,11 @@ static void iommu_dma_sync_sg_for_device(struct device *dev,
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
 }
 
-static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t __iommu_dma_map_pages(struct device *dev, struct page *page,
+					unsigned long offset, dma_addr_t iova,
+					size_t size,
+					enum dma_data_direction dir,
+					unsigned long attrs)
 {
 	phys_addr_t phys = page_to_phys(page) + offset;
 	bool coherent = dev_is_dma_coherent(dev);
@@ -1144,7 +1150,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
-	dma_addr_t iova, dma_mask = dma_get_mask(dev);
+	dma_addr_t addr, dma_mask = dma_get_mask(dev);
 
 	/*
 	 * If both the physical buffer start address and size are
@@ -1188,14 +1194,23 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		arch_sync_dma_for_device(phys, size, dir);
 
-	iova = __iommu_dma_map(dev, phys, size, prot, dma_mask);
-	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
+	addr = __iommu_dma_map(dev, phys, iova, size, prot, dma_mask);
+	if (addr == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
 		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
-	return iova;
+	return addr;
 }
 
-static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
+				     unsigned long offset, size_t size,
+				     enum dma_data_direction dir,
+				     unsigned long attrs)
+{
+	return __iommu_dma_map_pages(dev, page, offset, 0, size, dir, attrs);
+}
+
+static void __iommu_dma_unmap_pages(struct device *dev, dma_addr_t dma_handle,
+				    size_t size, enum dma_data_direction dir,
+				    unsigned long attrs, bool free_iova)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	phys_addr_t phys;
@@ -1207,12 +1222,19 @@ static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu(phys, size, dir);
 
-	__iommu_dma_unmap(dev, dma_handle, size);
+	__iommu_dma_unmap(dev, dma_handle, size, free_iova);
 
 	if (unlikely(is_swiotlb_buffer(dev, phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 
+static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
+				 size_t size, enum dma_data_direction dir,
+				 unsigned long attrs)
+{
+	__iommu_dma_unmap_pages(dev, dma_handle, size, dir, attrs, true);
+}
+
 /*
  * Prepare a successfully-mapped scatterlist to give back to the caller.
  *
@@ -1515,13 +1537,13 @@ static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 	}
 
 	if (end)
-		__iommu_dma_unmap(dev, start, end - start);
+		__iommu_dma_unmap(dev, start, end - start, true);
 }
 
 static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	return __iommu_dma_map(dev, phys, size,
+	return __iommu_dma_map(dev, phys, 0, size,
 			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
 			dma_get_mask(dev));
 }
@@ -1529,7 +1551,7 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	__iommu_dma_unmap(dev, handle, size);
+	__iommu_dma_unmap(dev, handle, size, true);
 }
 
 static void __iommu_dma_free(struct device *dev, size_t size, void *cpu_addr)
@@ -1566,7 +1588,7 @@ static void __iommu_dma_free(struct device *dev, size_t size, void *cpu_addr)
 static void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t handle, unsigned long attrs)
 {
-	__iommu_dma_unmap(dev, handle, size);
+	__iommu_dma_unmap(dev, handle, size, true);
 	__iommu_dma_free(dev, size, cpu_addr);
 }
 
@@ -1632,7 +1654,7 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
+	*handle = __iommu_dma_map(dev, page_to_phys(page), 0, size, ioprot,
 			dev->coherent_dma_mask);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
-- 
2.26.3

