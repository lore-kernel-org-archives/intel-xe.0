Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2333EC83F22
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E110E16E;
	Thu, 17 Jul 2025 13:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KP2tVLk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DACA10E80F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759610; x=1784295610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sC/tbh8y0NuY2ZhcBeCMxcdyqgOfxlAhgvtGfiJt2Yo=;
 b=KP2tVLk9ouLeT8amG8VfQ0XZflfHw7Lv6Ln7uVUMkC92chc9kf+PULhV
 FXjAHhcTnxpnaLfhlhMiK9EIlpOnU99uN2z/s9a6UxbQaE3ox0zZ6AZ0Q
 8IeOgd+PpWWywjuJduRbkcQ2O/gGqnpIbLBMFdW53OSvYSiq3YHKMC9wM
 Zt9zG7jJPM3w0OuxaLeEmFNJ2W5wgqUBeBbq2UgN6xZaZa3rXgPbGPOZa
 MjFMF2GGAsiwtvzgmmnfjCLNSkn8qkwgT6V45U/bsrSU5GasIXgF99vjD
 RlUw9ihBVl1F6C7c4ZNwSyvt0gBw3a6i5OdvbvP6qdWYM8cK/RZqJTEEb w==;
X-CSE-ConnectionGUID: 4tGjPXNwS0OBmeYXBXjiFA==
X-CSE-MsgGUID: GuJkLi/ERE+XLIgPSGhBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251730"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:09 -0700
X-CSE-ConnectionGUID: hqFiIi3pSsa6f3K0EdNvaw==
X-CSE-MsgGUID: 0fsukzfcRUi/iZ1uRX1prQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328401"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 3/5] drm/pagemap: DMA map folios when possible
Date: Thu, 17 Jul 2025 15:38:25 +0200
Message-ID: <20250717133928.526111-4-francois.dugast@intel.com>
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

If the page is part of a folio, DMA map the whole folio at once instead of
mapping individual pages one after the other. For example if 2MB folios
are used instead of 4KB pages, this reduces the number of DMA mappings by
512.

The folio order (and consequently, the size) is persisted in the struct
drm_pagemap_device_addr to be available at the time of unmapping.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 0ed66aaade14..de15d96f6393 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -220,20 +220,31 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 					 unsigned long npages,
 					 enum dma_data_direction dir)
 {
-	unsigned long i;
+	unsigned long i, j;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		struct folio *folio;
+		unsigned int order;
 
 		if (!page)
-			continue;
+			goto next;
 
 		if (WARN_ON_ONCE(is_zone_device_page(page)))
 			return -EFAULT;
 
-		device_addr[i].addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		folio = page_folio(page);
+		order = folio_order(folio);
+		device_addr[i].addr = dma_map_page(dev, page, 0, page_size(page), dir);
+		device_addr[i].order = order;
+
 		if (dma_mapping_error(dev, device_addr[i].addr))
 			return -EFAULT;
+
+		for (j = 0; j < (0x1 << order) && i+j < npages; j++)
+			device_addr[i+j].addr = device_addr[i].addr + j * PAGE_SIZE;
+next:
+		i += 0x1 << order;
 	}
 
 	return 0;
@@ -257,11 +268,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		if (!device_addr[i].addr || dma_mapping_error(dev, device_addr[i].addr))
-			continue;
+			goto next;
+
+		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE << device_addr[i].order, dir);
 
-		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE, dir);
+next:
+		i += 0x1 << device_addr[i].order;
 	}
 }
 
-- 
2.43.0

