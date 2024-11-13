Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB509D637A2
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517010E1C6;
	Wed, 13 Nov 2024 17:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKKbllOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2210E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731518640; x=1763054640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=03bk/84FIJfR17L4UJB+mV5AUtQJg1iuUrQnGWBM7D0=;
 b=OKKbllOw7vOBxkiOYkt7Be22q/GL0DCJZTT0pUVZv0yB2Ybhcx1ckusD
 AS6XejgU79xJCFOsx8mQIPTaFuAdpNFkWxTcHF2Lt/thRi1YEXqvUy8YC
 WpxfEo5KJpMgWLPFUenMmx5hv2Uwh78RaZxu8vPaZhVxpIHRSOnXuFwNj
 RWbZ4uVq79j1TWBi4UQAYjLSLtxd5xiE88QAMnQ7IjeSH8KPYhWfVxesm
 GGQKWqVD72Qp8hYOcws/+WtcQMlTmq+sxKzPRGdXYOSKzMOGKw+3H7yoA
 Z9/om1g0UF/x5HIGUJ1Kz3h72rHJFFmJ+7OH05EXaJ7rjwbq7f4UsIvan g==;
X-CSE-ConnectionGUID: pdk7iG1FRB2bwZGcoMa16g==
X-CSE-MsgGUID: 8elg1eVfRKmJFxe2t7wEMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31389456"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31389456"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:24:00 -0800
X-CSE-ConnectionGUID: RSqkS7+aQmiDQ6d7+S2cUA==
X-CSE-MsgGUID: A4dKwNR1R2KWtRXiJQogWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87825844"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:23:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vram: drop 2G block restriction
Date: Wed, 13 Nov 2024 17:23:47 +0000
Message-ID: <20241113172346.256165-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

Currently we limit the max block size for all users to ensure each block
can fit within a sg entry (uint). Drop this restriction and tweak the sg
construction to instead handle this itself and break down blocks which
are too big, if needed. Most users don't need an sg list in the first
place.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 51 +++++++---------------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 423b261ea743..1d39a8c53b3a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -52,7 +52,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct drm_buddy *mm = &mgr->mm;
-	u64 size, remaining_size, min_page_size;
+	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
 
@@ -98,17 +98,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_fini;
 	}
 
-	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
-		err = -EINVAL;
-		goto error_fini;
-	}
-
-	if (WARN_ON((size > SZ_2G &&
-		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS)))) {
-		err = -EINVAL;
-		goto error_fini;
-	}
-
 	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
 		err = -EINVAL;
 		goto error_fini;
@@ -116,9 +105,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 	mutex_lock(&mgr->lock);
 	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
-		mutex_unlock(&mgr->lock);
 		err = -ENOSPC;
-		goto error_fini;
+		goto error_unlock;
 	}
 
 	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
@@ -129,25 +117,11 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
 	}
 
-	remaining_size = size;
-	do {
-		/*
-		 * Limit maximum size to 2GiB due to SG table limitations.
-		 * FIXME: Should maybe be handled as part of sg construction.
-		 */
-		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
-
-		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
-					     (u64)lpfn << PAGE_SHIFT,
-					     alloc_size,
-					     min_page_size,
-					     &vres->blocks,
-					     vres->flags);
-		if (err)
-			goto error_free_blocks;
-
-		remaining_size -= alloc_size;
-	} while (remaining_size);
+	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
+				     (u64)lpfn << PAGE_SHIFT, size,
+				     min_page_size, &vres->blocks, vres->flags);
+	if (err)
+		goto error_unlock;
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
@@ -194,9 +168,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 	*res = &vres->base;
 	return 0;
-
-error_free_blocks:
-	drm_buddy_free_list(mm, &vres->blocks, 0);
+error_unlock:
 	mutex_unlock(&mgr->lock);
 error_fini:
 	ttm_resource_fini(man, &vres->base);
@@ -393,7 +365,8 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	xe_res_first(res, offset, length, &cursor);
 	while (cursor.remaining) {
 		num_entries++;
-		xe_res_next(&cursor, cursor.size);
+		/* Limit maximum size to 2GiB due to SG table limitations. */
+		xe_res_next(&cursor, min_t(u64, cursor.size, SZ_2G));
 	}
 
 	r = sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
@@ -413,7 +386,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
 		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
-		size_t size = cursor.size;
+		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
 		addr = dma_map_resource(dev, phys, size, dir,
@@ -426,7 +399,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 		sg_dma_address(sg) = addr;
 		sg_dma_len(sg) = size;
 
-		xe_res_next(&cursor, cursor.size);
+		xe_res_next(&cursor, size);
 	}
 
 	return 0;
-- 
2.47.0

