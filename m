Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474BC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F212A10E69E;
	Wed, 30 Jul 2025 14:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bgk1Dzb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6510E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753885454; x=1785421454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIHiv367yK5Z4XpBJet6UR9T+seJtyarF/swYMtyhtA=;
 b=Bgk1Dzb2QIID/NIaZHS9ONgdD4FDFHuoFMayKSRo8J/CHvU+265Z3zB/
 yy3h1QVB7hUOlhnW3D0hesLNlMCGD8P4H7pB6StNW80YeVJK5XIkB/Orx
 cIHs4wKHkGeaQqlWWZWagfWcRUAP42bRtIggIc6pqkhijY7iLR1Srmxy4
 VBeWeY/MD+NsZJGSSYWgQME3bezcOw6cR5ksbolHBa4JiPKtuyls61/Ss
 NSpZm73PqlhWFHLrKzHcbnczXJBuE/WYmpYcAda9enkVInOIhrA6f0Z2m
 Nq9o+LJQtrPho7kdSSqh0jgIwVMTBmLW75Xc5KTAmTD0MZw4zr7MWlpI7 g==;
X-CSE-ConnectionGUID: VpD6bVHiRw+U048afGhdtQ==
X-CSE-MsgGUID: 7vuGRBRWTgWIlL8E32JLMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55392780"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55392780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:14 -0700
X-CSE-ConnectionGUID: g1zZUpOVSQWrJm/ZVpRWHg==
X-CSE-MsgGUID: JdLgVCOTTlSNP/v2Y2bbXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167254525"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 4/6] drm/pagemap: Allocate folios when possible
Date: Wed, 30 Jul 2025 16:22:49 +0200
Message-ID: <20250730142357.3851167-5-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 50 ++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 0312edb8d4a8..e43676e15fe2 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -460,54 +460,80 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
+	for (i = 0; i < npages;) {
 		struct page *page, *src_page;
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
 
 		WARN_ON_ONCE(!trylock_page(page));
-		++*mpages;
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

