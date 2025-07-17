Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56D8C83F22
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6789710E812;
	Thu, 17 Jul 2025 13:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY15E7oF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B6310E80F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759612; x=1784295612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HU7M9Wx+zrGwstUtL41KaufMG9Ox+W/ah7WdEBCdjrI=;
 b=BY15E7oFA+DFMvVtGNQpZ5SPDBxDDUkzgZqawwo54qTnxrehakU3q0W9
 IxpNHMv3DMM9mhxI1yb9Lb0oU039LHq2xgTC0mHN42D2FlXvkryioZtWr
 Gzxgkc7FVWOMVyQJX/YQawFaquLz4RuTKcrbIKzO9Ju0kOBp5sLnRBsuD
 n+90C8ZIO5iccKcf8bYOlXEw1oVB5osf1bRfhC8mfGz1Tpd67RGjxfvLN
 04kIk3GokLe8RuKjZJPfFh6q0GJdu6KX9d028ulN7VSIeA83a+DW62F7d
 5aucVx/O4QDKkHrgD7X50GIvpuxiySgkv4RyDJWpmVhsIox1rNd7OqnYS w==;
X-CSE-ConnectionGUID: Xgeh/WE1QbC7bRrDYwtVew==
X-CSE-MsgGUID: cJEe7yttSf+vjx/kuYmBEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251738"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251738"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:12 -0700
X-CSE-ConnectionGUID: 8z90d93DT9ykFM+GBq5sFw==
X-CSE-MsgGUID: kXpLuUhESviDaqpdEjvbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328412"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 5/5] drm/pagemap: Allocate folios when possible
Date: Thu, 17 Jul 2025 15:38:27 +0200
Message-ID: <20250717133928.526111-6-francois.dugast@intel.com>
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

If the order is greater than zero, allocate a folio when populating the
RAM PFNs instead of allocating individual pages one after the other. For
example if 2MB folios are used instead of 4KB pages, this reduces the
number of calls to the allocation API by 512.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index de15d96f6393..4f67c6173ee5 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -438,6 +438,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
  * @src_mpfn: Source array of migrate PFNs
  * @mpfn: Array of migrate PFNs to populate
  * @addr: Start address for PFN allocation
+ * @order: Page order
  *
  * This function populates the RAM migrate page frame numbers (PFNs) for the
  * specified VM area structure. It allocates and locks pages in the VM area for
@@ -452,35 +453,45 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 						unsigned long *mpages,
 						unsigned long *src_mpfn,
 						unsigned long *mpfn,
-						unsigned long addr)
+						unsigned long addr,
+						unsigned int order)
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
+	for (i = 0; i < npages;) {
 		struct page *page, *src_page;
 
 		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		src_page = migrate_pfn_to_page(src_mpfn[i]);
 		if (!src_page)
-			continue;
+			goto next;
 
 		if (fault_page) {
 			if (src_page->zone_device_data !=
 			    fault_page->zone_device_data)
-				continue;
+				goto next;
 		}
 
-		if (vas)
-			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
-		else
-			page = alloc_page(GFP_HIGHUSER);
+		if (order) {
+			page = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+							  order, vas, addr), 0);
+		} else {
+			if (vas)
+				page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
+			else
+				page = alloc_page(GFP_HIGHUSER);
+		}
 
 		if (!page)
 			goto free_pages;
 
 		mpfn[i] = migrate_pfn(page_to_pfn(page));
+
+next:
+		i += 0x1 << order;
+		addr += page_size(page);
 	}
 
 	for (i = 0; i < npages; ++i) {
@@ -554,7 +565,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 		goto err_free;
 
 	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
-						   src, dst, 0);
+						   src, dst, 0, 0);
 	if (err || !mpages)
 		goto err_finalize;
 
@@ -690,7 +701,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 
 	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
 						   migrate.src, migrate.dst,
-						   start);
+						   start, 0);
 	if (err)
 		goto err_finalize;
 
-- 
2.43.0

