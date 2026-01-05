Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D2CD0422
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 23:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A810E44A;
	Mon,  5 Jan 2026 23:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCKniEFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4210E44A
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 23:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767656038; x=1799192038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eTErWtLUswdZEAliSAQ3nbDBa5cdNa8OES9BTTCxssY=;
 b=iCKniEFuV0AR3jijwb/gSwQMC1h0juTxlp15Y0N4sfJgHSqtZdxRpugl
 Ozhdrlo7mTg25O+uci2ZE0pIo3kUIArbwjC6Xdrft6H1ZUzSDtA3jd15C
 jqhhEWQPAYWrzdVBESXUv8YBA+2DSQ2dkwwFGqFP3mc5i01NOBt77lf8+
 8t93NuGUfbOkR2/uRaJrvGNTipAFX2ezKDlDUpgYqLr6ZD7d+j5/eQjVv
 rfNfFUudLBjz45Qcif3Z5lqVxrrM6rC614rS4wglNgWMin/4nvYbewUq8
 yDlk8K/0E+n3ZNgu+eRtmlrKZQ4q18DMz47bFYx0iPQyNK1XhuceBAzlU g==;
X-CSE-ConnectionGUID: KflO7wK7Q66B/W16zza8fw==
X-CSE-MsgGUID: Lzhwno8hRAKRNMXXQzVI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69066962"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69066962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 15:33:58 -0800
X-CSE-ConnectionGUID: 8LQ3BDTYQ8WGBvj/uWBrBw==
X-CSE-MsgGUID: i4JdeddEQNWdQfnmk0pLmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233199131"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa002.jf.intel.com with ESMTP; 05 Jan 2026 15:33:57 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 3/4] drm/xe: Fix page reclaim entry handling for large pages
Date: Tue,  6 Jan 2026 07:33:55 +0800
Message-ID: <20260105233351.3753716-9-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105233351.3753716-6-brian3.nguyen@intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
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

There are possible race conditions that will cause driver to read a pte
that hasn't been written to yet. The 2 scenarios are:
 - Another issued TLB invalidation such as from userptr or MMU notifier.
 - Dependencies on original bind that has yet to be executed with an
   unbind on that job.

The expectation is these race conditions are likely rare cases so simply
perform a fallback to full PPC flush invalidation instead.

v2:
 - Reword commit and updated zero-pte handling. (Matthew B)

Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 50 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2752a5a48a97..668a981696f9 100644
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
 		xe_page_reclaim_list_abort(tile->primary_gt, prl,
 					   "unsupported PTE level=%u pte=%#llx",
@@ -1647,20 +1645,39 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
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
 
+			/*
+			 * In rare scenarios, pte may not be written yet due to racy conditions.
+			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
+			 */
+			if (!pte) {
+				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
+							   "found zero pte at addr=%#llx", addr);
+				break;
+			}
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
@@ -1677,9 +1694,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
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
 		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
 					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
 					   level, addr, next, xe_child->num_live);
-- 
2.52.0

