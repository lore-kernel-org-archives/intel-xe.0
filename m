Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1544C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD2510E476;
	Tue,  5 Aug 2025 14:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMrwzZ5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099E410E277
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754402476; x=1785938476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z6qKyWqYfpEkUiY/3WNDxeC1NOhPBnl1bsyCCnr8TjY=;
 b=MMrwzZ5JzLIipwok+hFJej81/WOL8T8iPEGJjqhHHyzJesFD8jhAC+OE
 /jdeAkl9iuWT8cYd87eqTmtTBZhUIrrgJIv62wmLS38Kgq0/osrVv+7e1
 8r2szLooM708/BRcRlh9RYLYWzf6sMc02cFMT5UkYOWGnfByRzm7LVhf0
 vAmW7iHxIyeh8QkIikv679pYvingwljr+p1k/UgOdNJP6x/Jmr52gdkUU
 Xy2FXSNb2Ns7pMScF4dA0r9DwptYRcb+gTDN1e3CrLJL1g1cK1BuHcEOt
 XPQWYdVUP/go5vBxoHbL2sPN6VnUNB2CMCvnP+W8r4lrRnVnp2cUEqj+L g==;
X-CSE-ConnectionGUID: SSqyS0bxTgi+FuVFLva2vQ==
X-CSE-MsgGUID: myPP76NlQgq1BBl/4H9R/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82145231"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82145231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:16 -0700
X-CSE-ConnectionGUID: m351IH3/SrGCDPp8jIWsdw==
X-CSE-MsgGUID: ORCKbVDESTGOU5wkwpsvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201686330"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 3/6] drm/pagemap: DMA map folios when possible
Date: Tue,  5 Aug 2025 15:59:04 +0200
Message-ID: <20250805140028.599361-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805140028.599361-1-francois.dugast@intel.com>
References: <20250805140028.599361-1-francois.dugast@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 25 ++++++++++++++++++-------
 include/drm/drm_pagemap.h     | 10 ++++++++--
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index e5c135d793ed..0312edb8d4a8 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -222,24 +222,32 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
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
 
 		pagemap_addr[i] =
 			drm_pagemap_addr_encode(dma_addr,
 						DRM_INTERCONNECT_SYSTEM,
-						0, dir);
+						order, dir);
+
+next:
+		i += NR_PAGES(order);
 	}
 
 	return 0;
@@ -263,11 +271,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
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
index 1d5919a99139..f6e7e234c089 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -6,6 +6,8 @@
 #include <linux/hmm.h>
 #include <linux/types.h>
 
+#define NR_PAGES(order) (1U << (order))
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

