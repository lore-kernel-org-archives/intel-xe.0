Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310FEC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9410E374;
	Wed, 30 Jul 2025 14:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw60x1kf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47A10E36F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753885452; x=1785421452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpM4kIy05T5NKJrkSXIZGRSFY9rCrVDphF7Dg5RZcis=;
 b=Sw60x1kfl6osdEunNgbfuJqA5CohrDiCLSFrUUscPWnvQzPFdTg9vjCq
 /UX5GKmDGal2y2wy2PQp9YRrT1JabHce7wbQlgRe7Lulm2mNR4zqCORq1
 mZOE14Sw1o4HmCxNVwIp1DI3qQQYN32Lf7M4HjbYFGUkYFrkFTvLzsY9w
 RlHCXSp9iFad5KySCr6lYQDaRoYehHzWLATexauShekTpPOGoPLXaZT6h
 qKNAzqdMqEnbCSYCBbrCT7ooGcTUxSa8yvfiM54yllM6PSI9sBSecSjgz
 RaSwQym2EsjY/JsdGfty+TANOw5Cc4wXktjPbSGkr7aXLTbb+FwqcFnCz A==;
X-CSE-ConnectionGUID: Ykc8Fk0/T1SNUDaxZFZESw==
X-CSE-MsgGUID: Ykre8j/OQPmcHBl9hEravQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55392775"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55392775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:12 -0700
X-CSE-ConnectionGUID: 5bUKxy1kQ3mIyscaL22eLA==
X-CSE-MsgGUID: 3pFNlxbJT2CFpkkbmnLoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167254514"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 2/6] drm/pagemap: Use struct drm_pagemap_addr in mapping
 and copy functions
Date: Wed, 30 Jul 2025 16:22:47 +0200
Message-ID: <20250730142357.3851167-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730142357.3851167-1-francois.dugast@intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
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

This struct embeds more information than just the DMA address. This will
help later to support folio orders greater than zero. At this point, there
is no functional change as the only struct member used is addr.

In Xe, adapt to the new drm_gpusvm_devmem_ops type signatures using struct
drm_pagemap_addr, as well as the internal xe SVM functions implementing
those operations. The use of this struct is propagated to xe_migrate as it
makes indexed accesses to the next DMA address but they are no longer
contiguous.

v2:
- Rename drm_pagemap_device_addr to drm_pagemap_addr (Matthew Brost)
- Squash with patch for Xe (Matthew Brost)
- Set proto and dir for completeness (Matthew Brost)
- Assess DMA map protocol (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c   | 65 +++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_migrate.c | 69 +++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_migrate.h |  5 ++-
 drivers/gpu/drm/xe/xe_svm.c     | 37 ++++++++++--------
 include/drm/drm_pagemap.h       |  8 ++--
 5 files changed, 104 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 1da55322af12..e5c135d793ed 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -202,7 +202,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
  * @dev: The device for which the pages are being mapped
- * @dma_addr: Array to store DMA addresses corresponding to mapped pages
+ * @pagemap_addr: Array to store DMA information corresponding to mapped pages
  * @migrate_pfn: Array of migrate page frame numbers to map
  * @npages: Number of pages to map
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
@@ -215,7 +215,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
 static int drm_pagemap_migrate_map_pages(struct device *dev,
-					 dma_addr_t *dma_addr,
+					 struct drm_pagemap_addr *pagemap_addr,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
 					 enum dma_data_direction dir)
@@ -224,6 +224,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 
 	for (i = 0; i < npages; ++i) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		dma_addr_t dma_addr;
 
 		if (!page)
 			continue;
@@ -231,9 +232,14 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		if (WARN_ON_ONCE(is_zone_device_page(page)))
 			return -EFAULT;
 
-		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
-		if (dma_mapping_error(dev, dma_addr[i]))
+		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		if (dma_mapping_error(dev, dma_addr))
 			return -EFAULT;
+
+		pagemap_addr[i] =
+			drm_pagemap_addr_encode(dma_addr,
+						DRM_INTERCONNECT_SYSTEM,
+						0, dir);
 	}
 
 	return 0;
@@ -242,7 +248,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 /**
  * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
  * @dev: The device for which the pages were mapped
- * @dma_addr: Array of DMA addresses corresponding to mapped pages
+ * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  *
@@ -251,17 +257,17 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
  * if it's valid and not already unmapped, and unmaps the corresponding page.
  */
 static void drm_pagemap_migrate_unmap_pages(struct device *dev,
-					    dma_addr_t *dma_addr,
+					    struct drm_pagemap_addr *pagemap_addr,
 					    unsigned long npages,
 					    enum dma_data_direction dir)
 {
 	unsigned long i;
 
 	for (i = 0; i < npages; ++i) {
-		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
 			continue;
 
-		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE, dir);
 	}
 }
 
@@ -314,7 +320,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_addr *pagemap_addr;
 	void *buf;
 	int err;
 
@@ -340,14 +346,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_out;
 	}
 
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*pagemap_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
 	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
 	if (!zdd) {
@@ -377,8 +383,9 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
 					    migrate.src, npages, DMA_TO_DEVICE);
+
 	if (err)
 		goto err_finalize;
 
@@ -390,7 +397,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
 
-	err = ops->copy_to_devmem(pages, dma_addr, npages);
+	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -404,7 +411,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
 					DMA_TO_DEVICE);
 err_free:
 	if (zdd)
@@ -509,7 +516,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_addr *pagemap_addr;
 	void *buf;
 	int i, err = 0;
 	unsigned int retry_count = 2;
@@ -520,7 +527,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (!mmget_not_zero(devmem_allocation->mm))
 		return -EFAULT;
 
-	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*pagemap_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
@@ -528,8 +535,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	}
 	src = buf;
 	dst = buf + (sizeof(*src) * npages);
-	dma_addr = buf + (2 * sizeof(*src) * npages);
-	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
+	pagemap_addr = buf + (2 * sizeof(*src) * npages);
+	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
 	if (err)
@@ -544,7 +551,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
 					    dst, npages, DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -552,7 +559,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(src[i]);
 
-	err = ops->copy_to_ram(pages, dma_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -561,7 +568,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		drm_pagemap_migration_unlock_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
 					DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
@@ -612,7 +619,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	struct device *dev = NULL;
 	unsigned long npages, mpages = 0;
 	struct page **pages;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_addr *pagemap_addr;
 	unsigned long start, end;
 	void *buf;
 	int i, err = 0;
@@ -637,14 +644,14 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate.end = end;
 	npages = npages_in_range(start, end);
 
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*pagemap_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
 
 	migrate.vma = vas;
 	migrate.src = buf;
@@ -680,7 +687,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
+	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
 					    DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -688,7 +695,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(migrate.src[i]);
 
-	err = ops->copy_to_ram(pages, dma_addr, npages);
+	err = ops->copy_to_ram(pages, pagemap_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -698,7 +705,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
 	if (dev)
-		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
+		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
 						DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3a276e2348a2..6a0f04411ae0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -9,6 +9,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -1738,7 +1739,8 @@ static u32 pte_update_cmd_size(u64 size)
 
 static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct xe_bb *bb, u32 pt_offset,
-				       dma_addr_t *sram_addr, u32 size)
+				       struct drm_pagemap_addr *sram_addr,
+				       u32 size)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
 	u32 ptes;
@@ -1756,14 +1758,18 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i++] & PAGE_MASK;
+			u64 addr = sram_addr[i].addr & PAGE_MASK;
 
+			xe_tile_assert(m->tile, sram_addr[i].proto ==
+				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
 								 addr, pat_index,
 								 0, false, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
+
+			i++;
 		}
 	}
 }
@@ -1779,7 +1785,8 @@ enum xe_migrate_copy_dir {
 static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long len,
 					 unsigned long sram_offset,
-					 dma_addr_t *sram_addr, u64 vram_addr,
+					 struct drm_pagemap_addr *sram_addr,
+					 u64 vram_addr,
 					 const enum xe_migrate_copy_dir dir)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -1861,7 +1868,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  * xe_migrate_to_vram() - Migrate to VRAM
  * @m: The migration context.
  * @npages: Number of pages to migrate.
- * @src_addr: Array of dma addresses (source of migrate)
+ * @src_addr: Array of DMA information (source of migrate)
  * @dst_addr: Device physical address of VRAM (destination of migrate)
  *
  * Copy from an array dma addresses to a VRAM device physical address
@@ -1871,7 +1878,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  */
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-				     dma_addr_t *src_addr,
+				     struct drm_pagemap_addr *src_addr,
 				     u64 dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
@@ -1883,7 +1890,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
  * @m: The migration context.
  * @npages: Number of pages to migrate.
  * @src_addr: Device physical address of VRAM (source of migrate)
- * @dst_addr: Array of dma addresses (destination of migrate)
+ * @dst_addr: Array of DMA information (destination of migrate)
  *
  * Copy from a VRAM device physical address to an array dma addresses
  *
@@ -1893,61 +1900,65 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       dma_addr_t *dst_addr)
+				       struct drm_pagemap_addr *dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
-static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
+static void xe_migrate_dma_unmap(struct xe_device *xe,
+				 struct drm_pagemap_addr *pagemap_addr,
 				 int len, int write)
 {
 	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
 
 	for (i = 0; i < npages; ++i) {
-		if (!dma_addr[i])
+		if (!pagemap_addr[i].addr)
 			break;
 
-		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
+		dma_unmap_page(xe->drm.dev, pagemap_addr[i].addr, PAGE_SIZE,
 			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
 	}
-	kfree(dma_addr);
+	kfree(pagemap_addr);
 }
 
-static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
-				      void *buf, int len, int write)
+static struct drm_pagemap_addr *xe_migrate_dma_map(struct xe_device *xe,
+						   void *buf, int len,
+						   int write)
 {
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_addr *pagemap_addr;
 	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
 
-	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
-	if (!dma_addr)
+	pagemap_addr = kcalloc(npages, sizeof(*pagemap_addr), GFP_KERNEL);
+	if (!pagemap_addr)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < npages; ++i) {
 		dma_addr_t addr;
 		struct page *page;
+		enum dma_data_direction dir = write ? DMA_TO_DEVICE :
+						      DMA_FROM_DEVICE;
 
 		if (is_vmalloc_addr(buf))
 			page = vmalloc_to_page(buf);
 		else
 			page = virt_to_page(buf);
 
-		addr = dma_map_page(xe->drm.dev,
-				    page, 0, PAGE_SIZE,
-				    write ? DMA_TO_DEVICE :
-				    DMA_FROM_DEVICE);
+		addr = dma_map_page(xe->drm.dev, page, 0, PAGE_SIZE, dir);
 		if (dma_mapping_error(xe->drm.dev, addr))
 			goto err_fault;
 
-		dma_addr[i] = addr;
+		pagemap_addr[i] =
+			drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_SYSTEM,
+						0, dir);
 		buf += PAGE_SIZE;
 	}
 
-	return dma_addr;
+	return pagemap_addr;
 
 err_fault:
-	xe_migrate_dma_unmap(xe, dma_addr, len, write);
+	xe_migrate_dma_unmap(xe, pagemap_addr, len, write);
 	return ERR_PTR(-EFAULT);
 }
 
@@ -1976,7 +1987,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_res_cursor cursor;
 	struct dma_fence *fence = NULL;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_addr *pagemap_addr;
 	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
 	int bytes_left = len, current_page = 0;
 	void *orig_buf = buf;
@@ -2031,9 +2042,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		return 0;
 	}
 
-	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
-	if (IS_ERR(dma_addr))
-		return PTR_ERR(dma_addr);
+	pagemap_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
+	if (IS_ERR(pagemap_addr))
+		return PTR_ERR(pagemap_addr);
 
 	xe_res_first(bo->ttm.resource, offset, xe_bo_size(bo) - offset, &cursor);
 
@@ -2054,7 +2065,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
-					  dma_addr + current_page,
+					  &pagemap_addr[current_page],
 					  vram_addr, write ?
 					  XE_MIGRATE_COPY_TO_VRAM :
 					  XE_MIGRATE_COPY_TO_SRAM);
@@ -2078,7 +2089,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	dma_fence_put(fence);
 
 out_err:
-	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
+	xe_migrate_dma_unmap(xe, pagemap_addr, len + page_offset, write);
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index e81ea6b27fb5..a3f3fa281e04 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct dma_fence;
+struct drm_pagemap_addr;
 struct iosys_map;
 struct ttm_resource;
 
@@ -109,13 +110,13 @@ int xe_migrate_init(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-				     dma_addr_t *src_addr,
+				     struct drm_pagemap_addr *src_addr,
 				     u64 dst_addr);
 
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       dma_addr_t *dst_addr);
+				       struct drm_pagemap_addr *dst_addr);
 
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 3e4f4a8760ee..1d097e76aabc 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -328,7 +328,8 @@ enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_SRAM,
 };
 
-static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy(struct page **pages,
+		       struct drm_pagemap_addr *pagemap_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
 	struct xe_vram_region *vr = NULL;
@@ -360,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		last = (i + 1) == npages;
 
 		/* No CPU page and no device pages queue'd to copy */
-		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
+		if (!pagemap_addr[i].addr && vram_addr == XE_VRAM_ADDR_INVALID)
 			continue;
 
 		if (!vr && spage) {
@@ -374,7 +375,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		 * first device page, check if physical contiguous on subsequent
 		 * device pages.
 		 */
-		if (dma_addr[i] && spage) {
+		if (pagemap_addr[i].addr && spage) {
 			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
 			if (vram_addr == XE_VRAM_ADDR_INVALID) {
 				vram_addr = __vram_addr;
@@ -399,18 +400,20 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
-					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
+					       vram_addr,
+					       (u64)pagemap_addr[pos].addr, i - pos + incr);
 					__fence = xe_migrate_from_vram(vr->migrate,
 								       i - pos + incr,
 								       vram_addr,
-								       dma_addr + pos);
+								       &pagemap_addr[pos]);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
-					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
+					       (u64)pagemap_addr[pos].addr, vram_addr,
+					       i - pos + incr);
 					__fence = xe_migrate_to_vram(vr->migrate,
 								     i - pos + incr,
-								     dma_addr + pos,
+								     &pagemap_addr[pos],
 								     vram_addr);
 				}
 				if (IS_ERR(__fence)) {
@@ -423,7 +426,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			}
 
 			/* Setup physical address of next device page */
-			if (dma_addr[i] && spage) {
+			if (pagemap_addr[i].addr && spage) {
 				vram_addr = __vram_addr;
 				pos = i;
 			} else {
@@ -435,16 +438,16 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
-					       vram_addr, (u64)dma_addr[pos], 1);
+					       vram_addr, (u64)pagemap_addr[pos].addr, 1);
 					__fence = xe_migrate_from_vram(vr->migrate, 1,
 								       vram_addr,
-								       dma_addr + pos);
+								       &pagemap_addr[pos]);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
-					       (u64)dma_addr[pos], vram_addr, 1);
+					       (u64)pagemap_addr[pos].addr, vram_addr, 1);
 					__fence = xe_migrate_to_vram(vr->migrate, 1,
-								     dma_addr + pos,
+								     &pagemap_addr[pos],
 								     vram_addr);
 				}
 				if (IS_ERR(__fence)) {
@@ -470,16 +473,18 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 #undef XE_VRAM_ADDR_INVALID
 }
 
-static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy_to_devmem(struct page **pages,
+				 struct drm_pagemap_addr *pagemap_addr,
 				 unsigned long npages)
 {
-	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
 }
 
-static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy_to_ram(struct page **pages,
+			      struct drm_pagemap_addr *pagemap_addr,
 			      unsigned long npages)
 {
-	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
+	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
 }
 
 static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 69d6ee49a3de..1d5919a99139 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -170,7 +170,7 @@ struct drm_pagemap_devmem_ops {
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
 	 * @pages: Pointer to array of device memory pages (destination)
-	 * @dma_addr: Pointer to array of DMA addresses (source)
+	 * @pagemap_addr: Pointer to array of DMA information (source)
 	 * @npages: Number of pages to copy
 	 *
 	 * Copy pages to device memory.
@@ -178,13 +178,13 @@ struct drm_pagemap_devmem_ops {
 	 * Return: 0 on success, a negative error code on failure.
 	 */
 	int (*copy_to_devmem)(struct page **pages,
-			      dma_addr_t *dma_addr,
+			      struct drm_pagemap_addr *pagemap_addr,
 			      unsigned long npages);
 
 	/**
 	 * @copy_to_ram: Copy to system RAM (required for migration)
 	 * @pages: Pointer to array of device memory pages (source)
-	 * @dma_addr: Pointer to array of DMA addresses (destination)
+	 * @pagemap_addr: Pointer to array of DMA information (destination)
 	 * @npages: Number of pages to copy
 	 *
 	 * Copy pages to system RAM.
@@ -192,7 +192,7 @@ struct drm_pagemap_devmem_ops {
 	 * Return: 0 on success, a negative error code on failure.
 	 */
 	int (*copy_to_ram)(struct page **pages,
-			   dma_addr_t *dma_addr,
+			   struct drm_pagemap_addr *pagemap_addr,
 			   unsigned long npages);
 };
 
-- 
2.43.0

