Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE625C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F2110E9EE;
	Fri, 25 Jul 2025 15:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWOgseCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABA10E9EA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458038; x=1784994038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5cd9yq0iJPBliT7F3DWLXBq89LDSCp0KpJSuVlQswo=;
 b=eWOgseCy4ltnEg1TPS+xJRAzaL+bZJ5Wxn7PNoWn27iY3gSb8mbfM4Zn
 JqH6eWwvJ1iZag5xsvn9hBCm34emI52vDwtdchaUdXjpGHS1YcxVkKKjX
 x0ima34ZgJ32+6mLtkQuTnhNFoYsvfHFOyVDD4NfyBolZCPk5yRJ4tYjc
 pjdLcyPnyUctrsmsDtpIIosaCn1mjNJJuy/4xeaZuJpgJ5QwJk1uCbLTC
 H2PvGktfLrYdagnW4KvNE+gjl3zyaztMzYsTJuG4zucrZIkMYWC+e80iC
 CQua9RrdQ1j/1nnWHrjFG4bYnkFoetA6AdESfhibA6EddlF74y5/TEF2U g==;
X-CSE-ConnectionGUID: uJ6JzgjXSqKAyhbwl/ftCA==
X-CSE-MsgGUID: JV4dK8E5TcWNJourbLpq/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879419"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:38 -0700
X-CSE-ConnectionGUID: c5b4iu7pTIGcYUkSWNd9yg==
X-CSE-MsgGUID: u96zZELfQKGOHyFRVmUwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503677"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 4/6] drm/pagemap: Allocate folios when possible
Date: Fri, 25 Jul 2025 17:39:28 +0200
Message-ID: <20250725154011.2807655-5-francois.dugast@intel.com>
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

If the order is greater than zero, allocate a folio when populating the
RAM PFNs instead of allocating individual pages one after the other. For
example if 2MB folios are used instead of 4KB pages, this reduces the
number of calls to the allocation API by 512.

v2:
- Use page order instead of extr argument (Matthew Brost)
- Allocate with folio_alloc() (Matthew Brost)
- Loop for mpages and free_pages based on order (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index b6f5d3a8e445..38753ce2bca7 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -458,54 +458,72 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
+	for (i = 0; i < npages;) {
 		struct page *page, *src_page;
+		unsigned int order;
+		struct folio *folio;
 
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
+		addr += page_size(page);
+		i += NR_PAGES(order);
 	}
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(mpfn[i]);
+		unsigned int order;
 
 		if (!page)
 			continue;
 
 		WARN_ON_ONCE(!trylock_page(page));
-		++*mpages;
+
+		order = folio_order(page_folio(page));
+		*mpages += NR_PAGES(order);
+		i += NR_PAGES(order);
 	}
 
 	return 0;
 
 free_pages:
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(mpfn[i]);
+		unsigned int order;
 
 		if (!page)
 			continue;
 
 		put_page(page);
 		mpfn[i] = 0;
+
+		order = folio_order(page_folio(page));
+		i += NR_PAGES(order);
 	}
 	return -ENOMEM;
 }
-- 
2.43.0

