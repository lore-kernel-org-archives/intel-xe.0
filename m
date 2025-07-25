Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F5EC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8019C10E9E7;
	Fri, 25 Jul 2025 15:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHCzxqaG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909310E9E7
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458037; x=1784994037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swzQYJEI5Dp0Kc3zzIGIGpenUwUx93nQL7NCaXSeG2Y=;
 b=iHCzxqaGW1YCYrNU8nerobqkbs2EQ4zReiBngIpBA98coTB8gSffJyK2
 ZRvdvxOCigN9UVH6kQV8x2cszAHvjlPWdPbzD5dFnNQyOyjOY27Ke94ww
 gxEI1sZS+UOIL55zYdvB7tTa9iLYQnLymdGDpjhvrNYHDZwEZZpgJlZYZ
 5exZjmnAHirA6jfEncEhcCUrjZWTy8/aqu7Fu7al6kqIOelmkdv/mlNzo
 jQ0gagpZHh7UYNEKiwqN69t4HHkItYWhwgcGGD5u/ZNAZ2C0ypWtoR2F1
 pWmos1U2Do+g33uKn4Cr38zl2x/KPV2pYqVoqKV/uaE9s1JVY6H9J3vve w==;
X-CSE-ConnectionGUID: 43RuBKVvRzq8QKwS15GmEA==
X-CSE-MsgGUID: agVh/ZhUQgi43oU3FskjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879416"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879416"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:37 -0700
X-CSE-ConnectionGUID: 4mrFZM6NQd+S41I8zMg7mA==
X-CSE-MsgGUID: ouUK5ikdR+egfGIRLUdw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503672"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 3/6] drm/pagemap: DMA map folios when possible
Date: Fri, 25 Jul 2025 17:39:27 +0200
Message-ID: <20250725154011.2807655-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725154011.2807655-1-francois.dugast@intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
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

v2:
- Initialize order variable (Matthew Brost)
- Set proto and dir for completeness (Matthew Brost)
- Do not populate drm_pagemap_addr, document it (Matthew Brost)
- Add and use macro NR_PAGES(order) (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 25 ++++++++++++++++++-------
 include/drm/drm_pagemap.h     | 10 ++++++++--
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index de320aeed812..b6f5d3a8e445 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -222,22 +222,30 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
 		dma_addr_t dma_addr;
+		struct folio *folio;
+		unsigned int order = 0;
 
 		if (!page)
-			continue;
+			goto next;
 
 		if (WARN_ON_ONCE(is_zone_device_page(page)))
 			return -EFAULT;
 
-		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		folio = page_folio(page);
+		order = folio_order(folio);
+
+		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
 		if (dma_mapping_error(dev, dma_addr))
 			return -EFAULT;
 
 		pagemap_addr[i] = drm_pagemap_addr_encode(
-			dma_addr, DRM_INTERCONNECT_SYSTEM, 0, dir);
+			dma_addr, DRM_INTERCONNECT_SYSTEM, order, dir);
+
+next:
+		i += NR_PAGES(order);
 	}
 
 	return 0;
@@ -261,11 +269,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
-			continue;
+			goto next;
+
+		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
 
-		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE, dir);
+next:
+		i += NR_PAGES(pagemap_addr[i].order);
 	}
 }
 
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 1d5919a99139..ef18d98dbc7e 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -6,6 +6,8 @@
 #include <linux/hmm.h>
 #include <linux/types.h>
 
+#define NR_PAGES(order) (1U << order)
+
 struct drm_pagemap;
 struct drm_pagemap_zdd;
 struct device;
@@ -173,7 +175,9 @@ struct drm_pagemap_devmem_ops {
 	 * @pagemap_addr: Pointer to array of DMA information (source)
 	 * @npages: Number of pages to copy
 	 *
-	 * Copy pages to device memory.
+	 * Copy pages to device memory. If the order of a @pagemap_addr entry
+	 * is greater than 0, the entry is populated but subsequent entries
+	 * within the range of that order are not populated.
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
@@ -187,7 +191,9 @@ struct drm_pagemap_devmem_ops {
 	 * @pagemap_addr: Pointer to array of DMA information (destination)
 	 * @npages: Number of pages to copy
 	 *
-	 * Copy pages to system RAM.
+	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
+	 * is greater than 0, the entry is populated but subsequent entries
+	 * within the range of that order are not populated.
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-- 
2.43.0

