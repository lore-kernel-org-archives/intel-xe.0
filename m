Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FAC83F22
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DE410E1B5;
	Thu, 17 Jul 2025 13:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAmxLgvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6731410E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759607; x=1784295607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD7YXag3oRIi9Gb54E9Tb6Bt6m/qJKozub9h+jg01XQ=;
 b=HAmxLgvI63JtH1B2/dKvi6nrXtXm3lQrSWFqm3mt7BKX2XpL180qxYx6
 3/qWLgusTPtGZFGYZKVI2wTuxPJv/kOHiLrrpXejpsidjNxmohwncEVae
 3AfE76DcJBl1FfD7u0TmPUa9eScae0OlbtQFblBJO1FmmKfTjEMJVb1kN
 oKQigrBcxH2hbQksiRuA1lEYtNHl208G1XUb4MyGemYiv2iAbMCYk3YwH
 S1+UGJYvfOYoPWFuLvo9yfmrEjjkIop4k2t+jVTzxYKUoY9t+inu3dMk/
 pZCs1MCv9v/nZDeTKL9kULDp3BpleRxo7e17QlXP8DbkR1kvWZR7MUKWo Q==;
X-CSE-ConnectionGUID: hBvZ6LCeRzyd063qk8efYw==
X-CSE-MsgGUID: UHUOb8CRQk27Wv4Zn7APEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251722"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:06 -0700
X-CSE-ConnectionGUID: YzEN86gBRHGzjbVqrJgfBA==
X-CSE-MsgGUID: C7SEmfyTSYuifQENpTv7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328390"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 1/5] drm/pagemap: Use struct drm_pagemap_device_addr in
 mapping and copy functions
Date: Thu, 17 Jul 2025 15:38:23 +0200
Message-ID: <20250717133928.526111-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717133928.526111-1-francois.dugast@intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
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

This struct embeds more information than just the DMA address. This will help
later to support folio orders greater than zero. At this point, there is no
functional change as the only struct member used is addr.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 58 +++++++++++++++++------------------
 include/drm/drm_pagemap.h     |  8 ++---
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 1da55322af12..0ed66aaade14 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -202,7 +202,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
  * @dev: The device for which the pages are being mapped
- * @dma_addr: Array to store DMA addresses corresponding to mapped pages
+ * @device_addr: Array to store DMA information corresponding to mapped pages
  * @migrate_pfn: Array of migrate page frame numbers to map
  * @npages: Number of pages to map
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
@@ -215,7 +215,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
 static int drm_pagemap_migrate_map_pages(struct device *dev,
-					 dma_addr_t *dma_addr,
+					 struct drm_pagemap_device_addr *device_addr,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
 					 enum dma_data_direction dir)
@@ -231,8 +231,8 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		if (WARN_ON_ONCE(is_zone_device_page(page)))
 			return -EFAULT;
 
-		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
-		if (dma_mapping_error(dev, dma_addr[i]))
+		device_addr[i].addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		if (dma_mapping_error(dev, device_addr[i].addr))
 			return -EFAULT;
 	}
 
@@ -242,7 +242,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 /**
  * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
  * @dev: The device for which the pages were mapped
- * @dma_addr: Array of DMA addresses corresponding to mapped pages
+ * @device_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  *
@@ -251,17 +251,17 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
  * if it's valid and not already unmapped, and unmaps the corresponding page.
  */
 static void drm_pagemap_migrate_unmap_pages(struct device *dev,
-					    dma_addr_t *dma_addr,
+					    struct drm_pagemap_device_addr *device_addr,
 					    unsigned long npages,
 					    enum dma_data_direction dir)
 {
 	unsigned long i;
 
 	for (i = 0; i < npages; ++i) {
-		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+		if (!device_addr[i].addr || dma_mapping_error(dev, device_addr[i].addr))
 			continue;
 
-		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE, dir);
 	}
 }
 
@@ -314,7 +314,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_device_addr *device_addr;
 	void *buf;
 	int err;
 
@@ -340,14 +340,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_out;
 	}
 
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*device_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+	device_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*device_addr)) * npages;
 
 	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
 	if (!zdd) {
@@ -377,7 +377,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, device_addr,
 					    migrate.src, npages, DMA_TO_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -390,7 +390,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
 
-	err = ops->copy_to_devmem(pages, dma_addr, npages);
+	err = ops->copy_to_devmem(pages, device_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, device_addr, npages,
 					DMA_TO_DEVICE);
 err_free:
 	if (zdd)
@@ -509,7 +509,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_device_addr *device_addr;
 	void *buf;
 	int i, err = 0;
 	unsigned int retry_count = 2;
@@ -520,7 +520,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (!mmget_not_zero(devmem_allocation->mm))
 		return -EFAULT;
 
-	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*device_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
@@ -528,8 +528,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	}
 	src = buf;
 	dst = buf + (sizeof(*src) * npages);
-	dma_addr = buf + (2 * sizeof(*src) * npages);
-	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
+	device_addr = buf + (2 * sizeof(*src) * npages);
+	pages = buf + (2 * sizeof(*src) + sizeof(*device_addr)) * npages;
 
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
 	if (err)
@@ -544,7 +544,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
+	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, device_addr,
 					    dst, npages, DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -552,7 +552,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(src[i]);
 
-	err = ops->copy_to_ram(pages, dma_addr, npages);
+	err = ops->copy_to_ram(pages, device_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -561,7 +561,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		drm_pagemap_migration_unlock_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
+	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, device_addr, npages,
 					DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
@@ -612,7 +612,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	struct device *dev = NULL;
 	unsigned long npages, mpages = 0;
 	struct page **pages;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_device_addr *device_addr;
 	unsigned long start, end;
 	void *buf;
 	int i, err = 0;
@@ -637,14 +637,14 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate.end = end;
 	npages = npages_in_range(start, end);
 
-	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
+	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*device_addr) +
 		       sizeof(*pages), GFP_KERNEL);
 	if (!buf) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
-	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
+	device_addr = buf + (2 * sizeof(*migrate.src) * npages);
+	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*device_addr)) * npages;
 
 	migrate.vma = vas;
 	migrate.src = buf;
@@ -680,7 +680,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
+	err = drm_pagemap_migrate_map_pages(dev, device_addr, migrate.dst, npages,
 					    DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
@@ -688,7 +688,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	for (i = 0; i < npages; ++i)
 		pages[i] = migrate_pfn_to_page(migrate.src[i]);
 
-	err = ops->copy_to_ram(pages, dma_addr, npages);
+	err = ops->copy_to_ram(pages, device_addr, npages);
 	if (err)
 		goto err_finalize;
 
@@ -698,7 +698,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
 	if (dev)
-		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
+		drm_pagemap_migrate_unmap_pages(dev, device_addr, npages,
 						DMA_FROM_DEVICE);
 err_free:
 	kvfree(buf);
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index e5f20a1235be..a0c0882eeb8e 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -170,7 +170,7 @@ struct drm_pagemap_devmem_ops {
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
 	 * @pages: Pointer to array of device memory pages (destination)
-	 * @dma_addr: Pointer to array of DMA addresses (source)
+	 * @device_addr: Pointer to array of DMA information (source)
 	 * @npages: Number of pages to copy
 	 *
 	 * Copy pages to device memory.
@@ -178,13 +178,13 @@ struct drm_pagemap_devmem_ops {
 	 * Return: 0 on success, a negative error code on failure.
 	 */
 	int (*copy_to_devmem)(struct page **pages,
-			      dma_addr_t *dma_addr,
+			      struct drm_pagemap_device_addr *device_addr,
 			      unsigned long npages);
 
 	/**
 	 * @copy_to_ram: Copy to system RAM (required for migration)
 	 * @pages: Pointer to array of device memory pages (source)
-	 * @dma_addr: Pointer to array of DMA addresses (destination)
+	 * @device_addr: Pointer to array of DMA information (destination)
 	 * @npages: Number of pages to copy
 	 *
 	 * Copy pages to system RAM.
@@ -192,7 +192,7 @@ struct drm_pagemap_devmem_ops {
 	 * Return: 0 on success, a negative error code on failure.
 	 */
 	int (*copy_to_ram)(struct page **pages,
-			   dma_addr_t *dma_addr,
+			   struct drm_pagemap_device_addr *device_addr,
 			   unsigned long npages);
 };
 
-- 
2.43.0

