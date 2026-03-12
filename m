Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865C91067045
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 15:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FE310EA51;
	Thu, 12 Mar 2026 15:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knDVSwx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA97810EA46;
 Thu, 12 Mar 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328666; x=1804864666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/BPtVZqG+5QTTRQtRRb4HUhXTC0CvJo12PParp22Ko=;
 b=knDVSwx9wtll5jS4QZDQ1VstaQiPpM27fZmu6Fb2GqOG9hpCoSgaeDIL
 +T5YqKdoUwFPDCvAqtbb0qlaJRrhOuSzisj2+8ikp7c6xonxyMIB0DS1I
 P4280HgTJmqqJ9n5bq/gVR2p21yOPSGyRN1wNPzLVGKhmCr/sg8KK0oho
 4XWr0WPZeCZde+Ktxrlv8gfA5ku6lFx2cvS/B+w5GkxR2W3ZyiWoG8Wko
 2qwv4Jf89lrEiJIL5d6Y1K9ye3a7dPiCl7+7mkdseHtoGr7YRGbjNJnoJ
 E4doMb3FFYRsrnx6OzLGIZcvBGLC/DdXrwMZra012+KfBH2JzmQyknJoV w==;
X-CSE-ConnectionGUID: 60JdYmvVQxWy/kIJ6x9npA==
X-CSE-MsgGUID: EN3aVO9VRlGuvm3ULE3MoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74316985"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74316985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:17:46 -0700
X-CSE-ConnectionGUID: SVO9yWx1RxqCIbOmkU7pOw==
X-CSE-MsgGUID: x1w6VnOcRlO9nnM18jPjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225830969"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:17:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 3/4] drm/pagemap: Correct cpages calculation for
 migrate_vma_setup
Date: Thu, 12 Mar 2026 16:16:28 +0100
Message-ID: <20260312151726.1779566-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312151726.1779566-1-francois.dugast@intel.com>
References: <20260312151726.1779566-1-francois.dugast@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

cpages returned from migrate_vma_setup represents the total number of
individual pages found, not the number of 4K pages. The math in
drm_pagemap_migrate_to_devmem for npages is based on the number of 4K
pages, so cpages != npages can fail even if the entire memory range is
found in migrate_vma_setup (e.g., when a single 2M page is found).
Add drm_pagemap_cpages, which converts cpages to the number of 4K pages
found.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 733a3857947c..837b881883f9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -452,6 +452,41 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 	return ret;
 }
 
+/**
+ * drm_pagemap_cpages() - Count collected pages
+ * @migrate_pfn: Array of migrate_pfn entries to account
+ * @npages: Number of entries in @migrate_pfn
+ *
+ * Compute the total number of minimum-sized pages represented by the
+ * collected entries in @migrate_pfn. The total is derived from the
+ * order encoded in each entry.
+ *
+ * Return: Total number of minimum-sized pages.
+ */
+static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
+{
+	unsigned long i, cpages = 0;
+
+	for (i = 0; i < npages;) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		struct folio *folio;
+		unsigned int order = 0;
+
+		if (page) {
+			folio = page_folio(page);
+			order = folio_order(folio);
+			cpages += NR_PAGES(order);
+		} else if (migrate_pfn[i] & MIGRATE_PFN_COMPOUND) {
+			order = HPAGE_PMD_ORDER;
+			cpages += NR_PAGES(order);
+		}
+
+		i += NR_PAGES(order);
+	}
+
+	return cpages;
+}
+
 /**
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
@@ -554,7 +589,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 	}
 
-	if (migrate.cpages != npages) {
+	if (migrate.cpages != npages &&
+	    drm_pagemap_cpages(migrate.src, npages) != npages) {
 		/*
 		 * Some pages to migrate. But we want to migrate all or
 		 * nothing. Raced or unknown device pages.
-- 
2.43.0

