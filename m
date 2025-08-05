Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFCCC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3EF10E478;
	Tue,  5 Aug 2025 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/S1U/8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C8E10E476
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754402477; x=1785938477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CA3X/TGpBiI26TXXh9ypAvzpmpC0WuzQpmnIcf0U4yo=;
 b=j/S1U/8MsPlU/BiJDrMmI+0CZk8snXjzP3Kve2ycQLQQVaWmgjfnleBy
 eLVIqGiRaEi92PftTbJjxl+6+cj6DuYVw8SlszG1Y0VneSa9dO8S4tvCq
 wdrlRmdcoE51IdrnDnBfq1Wf/GA06f85UWdQpAAO5AnhEMVV4My7AbGv7
 qcIpRip9Hmg3YTI7IWMzhE2+PX41cEUDA86FlDJmfeY7H9s118y22A2kP
 zK41br9aUwRGhcgN61f9HVvi1MJ7GSsZ/Mus/TT1fErsJJmXc3+lKGJx2
 wUp2DYyRPvoq7hscTTh7X9Vp1+MIrcOWh3MajPst8T55lgeY0O43tjrLU Q==;
X-CSE-ConnectionGUID: vVS8mpMRRuuMJVUKpgNd/A==
X-CSE-MsgGUID: NAPRJkU1SUKMkLMkYbQXsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82145234"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82145234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:17 -0700
X-CSE-ConnectionGUID: FRqRbWb9SRu0ZKX6ajXkLQ==
X-CSE-MsgGUID: 69vdOwNASVKXywW+TAEoOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201686334"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 4/6] drm/pagemap: Allocate folios when possible
Date: Tue,  5 Aug 2025 15:59:05 +0200
Message-ID: <20250805140028.599361-5-francois.dugast@intel.com>
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

If the order is greater than zero, allocate a folio when populating the
RAM PFNs instead of allocating individual pages one after the other. For
example if 2MB folios are used instead of 4KB pages, this reduces the
number of calls to the allocation API by 512.

v2:
- Use page order instead of extra argument (Matthew Brost)
- Allocate with folio_alloc() (Matthew Brost)
- Loop for mpages and free_pages based on order (Matthew Brost)

v3:
- Fix loops in drm_pagemap_migrate_populate_ram_pfn() (Matthew Brost)

v4:
- Use folio_trylock(), set local variable to NULL (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 54 ++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 0312edb8d4a8..22c44807e3fe 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -460,54 +460,80 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
-		struct page *page, *src_page;
+	for (i = 0; i < npages;) {
+		struct page *page = NULL, *src_page;
+		struct folio *folio;
+		unsigned int order = 0;
 
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
 
+		order = folio_order(page_folio(src_page));
+
+		/* TODO: Support fallback to single pages if THP allocation fails */
 		if (vas)
-			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
+			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
 		else
-			page = alloc_page(GFP_HIGHUSER);
+			folio = folio_alloc(GFP_HIGHUSER, order);
 
-		if (!page)
+		if (!folio)
 			goto free_pages;
 
+		page = folio_page(folio, 0);
 		mpfn[i] = migrate_pfn(page_to_pfn(page));
+
+next:
+		if (page)
+			addr += page_size(page);
+		else
+			addr += PAGE_SIZE;
+
+		i += NR_PAGES(order);
 	}
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(mpfn[i]);
+		unsigned int order = 0;
 
 		if (!page)
-			continue;
+			goto next_lock;
 
-		WARN_ON_ONCE(!trylock_page(page));
-		++*mpages;
+		WARN_ON_ONCE(!folio_trylock(page_folio(page)));
+
+		order = folio_order(page_folio(page));
+		*mpages += NR_PAGES(order);
+
+next_lock:
+		i += NR_PAGES(order);
 	}
 
 	return 0;
 
 free_pages:
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(mpfn[i]);
+		unsigned int order = 0;
 
 		if (!page)
-			continue;
+			goto next_put;
 
 		put_page(page);
 		mpfn[i] = 0;
+
+		order = folio_order(page_folio(page));
+
+next_put:
+		i += NR_PAGES(order);
 	}
 	return -ENOMEM;
 }
-- 
2.43.0

