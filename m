Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C0BE7849A
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 23:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA371134CC;
	Wed, 24 Dec 2025 23:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+O2YreG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94351134CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766619402; x=1798155402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIucCZh3vPOEXeFqmdAXJ13G/BQZbZRYy1/aL4cX0rU=;
 b=n+O2YreGHYfhO5zV3ArpEQkZaI09vISNf3BLJcNknd9Ft1XF8rFgDXaH
 jhZ9ubwXwprBmJdS+lilBPqPrAXV2GGO13QfLZvCOitHNrwh56qwKPp99
 PX3qPNRtC5SXGyE5LuCsCphCVowQrB1x3F44FVv7Qe8pYhd40xlJ4yxYO
 3d5YKc3tXzBihjbHS7JMFXvbSp70nc9PLPQCJOJzYPK6g7ulldOCJlzOd
 1thav9GlQ7rN0Z634K+CtWEhRoKWWha9sCH98qFYqPNx3h0r980idK5H9
 1eSPu2Nl0DqWAF5J5p8Q2+dxYw7DKMqetPdZhSid8VqApOTYNhl/VsvDr Q==;
X-CSE-ConnectionGUID: DyQVo4jiRTWcTj2ZahnDWA==
X-CSE-MsgGUID: OHRzBy8nS/611A6R97LASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56007859"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="56007859"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 15:36:42 -0800
X-CSE-ConnectionGUID: +JadopaNQGmAVwwy+H6rqg==
X-CSE-MsgGUID: HH/1dnqfSxWfUN84vBj7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="237502913"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 15:36:41 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large pages
Date: Thu, 25 Dec 2025 07:36:40 +0800
Message-ID: <20251224233638.1535283-5-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224233638.1535283-4-brian3.nguyen@intel.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
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

For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and
are all considered leaf nodes, so existing check was falsely adding
multiple 64KB pages to PRL.

For larger entries such as 2MB PDE, the check for pte->base.children is
insufficient since this array is always  defined for page directory,
level 1 and above, so perform a check on the entry itself pointing to
the correct page.

For unmaps, if the range is properly covered by the page full directory,
page walker may finish without walking to the leaf nodes.

For example, a 1G range can be fully covered by 512 2MB pages if
alignment allows. In this case, the page walker will walk until
it reaches this corresponding directory which can correlate to the 1GB
range. Page walker will simply complete its walk and the individual 2MB
PDE leaves won't get accessed.

In this case, PRL invalidation is also required, so add a check to see if
pt entry cover the entire range since the walker will complete the walk.

One small case is some seemingly racy condition where multiple
invalidation on the same PTE will caused the value read to be zeroed
out. In that case, we could just skip the entry since it only occurs if
a previous page walks invalidates it.

Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 44 ++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6cd78bb2b652..a79734079ef3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 	return false;
 }
 
-/* Huge 2MB leaf lives directly in a level-1 table and has no children */
-static bool is_2m_pte(struct xe_pt *pte)
-{
-	return pte->level == 1 && !pte->base.children;
-}
-
 /* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
 #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
 ({									\
@@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 				  u64 pte, struct xe_pt *xe_child)
 {
 	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
-	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
+	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
+	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
 	int num_entries = prl->num_entries;
 	u32 reclamation_size;
 
@@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 	 */
 	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
+		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
 	} else if (xe_child->level == 0) {
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
-	} else if (is_2m_pte(xe_child)) {
+		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
+	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
+		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
 	} else {
 		xe_page_reclaim_list_invalidate(prl);
 		vm_dbg(&tile_to_xe(tile)->drm,
@@ -1648,20 +1646,33 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	struct xe_pt_stage_unbind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
 	struct xe_device *xe = tile_to_xe(xe_walk->tile);
+	pgoff_t first = xe_pt_offset(addr, xe_child->level, walk);
 
 	XE_WARN_ON(!*child);
 	XE_WARN_ON(!level);
 	/* Check for leaf node */
 	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
-	    !xe_child->base.children) {
+	    (!xe_child->base.children || !xe_child->base.children[first])) {
 		struct iosys_map *leaf_map = &xe_child->bo->vmap;
-		pgoff_t first = xe_pt_offset(addr, 0, walk);
-		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
+		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
 
 		for (pgoff_t i = 0; i < count; i++) {
 			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
 			int ret;
 
+			/* Skip already cleared PTE from past unbinds */
+			if (!pte)
+				continue;
+
+			/* Ensure it is a defined page */
+			xe_tile_assert(xe_walk->tile,
+				       xe_child->level == 0 ||
+				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
+
+			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
+			if (pte & XE_PTE_PS64)
+				i += 15; /* Skip other 15 consecutive 4K pages in the 64K page */
+
 			/* Account for NULL terminated entry on end (-1) */
 			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
 				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
@@ -1679,9 +1690,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 		}
 	}
 
-	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
-	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
-	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
+	/*
+	 * If aborting page walk early or page walk finishes,
+	 * invalidate PRL since PTE may be dropped from this abort
+	 */
+	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) ||
+	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
+	    xe_walk->prl && level > 1 && (xe_child->base.children &&
+	    xe_child->base.children[first]) && xe_child->num_live != 0) {
 		xe_page_reclaim_list_invalidate(xe_walk->prl);
 		vm_dbg(&xe->drm,
 		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
-- 
2.52.0

