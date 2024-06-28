Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD48C3065A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AE010ED39;
	Fri, 28 Jun 2024 19:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDzmfqx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037C110ED36
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719604427; x=1751140427;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HtVUBkgUvp3WV2KMzg4FrE3KfdlNxhr8bIx1dnxf1Fc=;
 b=cDzmfqx8yMldputMkF796De+AnOtb/OpBLuHfrcSPkzF64eLQwb+2aFh
 oGYl5SV9hFLMqzVTOcL0oOzZEFxUESB2eWOsbHsF8Gm+lrr1Oka/JYaTe
 +RM6MJ47C6ecFms9y2QeLtwqE7BRfu7+JO8bW0beAYa7okz1yUv22EmUu
 IdJa/PXITLyh/MxcgZWyfzC/7IJyvl+zPOKlwVr0uE1EnT0GPOphUfEO7
 MvMAkNjqE98F9O0+CqnfIbCBrUgGQH6lo+K+CBEVkGVEI/B8Zzy48El59
 zuE8dRbZrOcP/mZqaE+UqNWXsGmthNkUS3Kc60IWXhIyAQoOPejOkH8le g==;
X-CSE-ConnectionGUID: vC0WdplMQh2/L+OdBp59rA==
X-CSE-MsgGUID: +1CqzZEqTnmwbVmsCK5HeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16927317"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16927317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:47 -0700
X-CSE-ConnectionGUID: Bf+92VcFSCS76VlnZb2+Yw==
X-CSE-MsgGUID: v/o5wGW0Sc6q7PS1Rnlwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44917100"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/4] drm/ttm: Add a flag to allow drivers to skip clear-on-free
Date: Fri, 28 Jun 2024 21:38:43 +0200
Message-ID: <20240628193846.26326-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
releasing backing stores if they want to skip clear-on-free.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
 include/drm/ttm/ttm_tt.h       |  6 +++++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..b78ee7524bcf 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 }
 
 /* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
+static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p,
+			       bool cleared)
 {
 	unsigned int i, num_pages = 1 << pt->order;
 
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
+	if (!cleared) {
+		for (i = 0; i < num_pages; ++i) {
+			if (PageHighMem(p))
+				clear_highpage(p + i);
+			else
+				clear_page(page_address(p + i));
+		}
 	}
 
 	spin_lock(&pt->lock);
@@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
+	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
 	unsigned int order;
 	pgoff_t i, nr;
 
@@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 
 		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, *pages, cleared);
 		else
 			ttm_pool_free_page(pool, caching, order, *pages);
 	}
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 2b9d856ff388..cfaf49de2419 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -85,6 +85,9 @@ struct ttm_tt {
 	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
 	 * used to assure pgprot always matches.
 	 *
+	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
+	 * clearing backing store
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -94,8 +97,9 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL		BIT(2)
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
+#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
 
-#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
-- 
2.42.0

