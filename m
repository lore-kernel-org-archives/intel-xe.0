Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DCFD9E29
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 01:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0410EA1A;
	Fri, 27 Feb 2026 01:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc8eCCEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27A510EA1A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 01:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772156534; x=1803692534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0v8nBn9GnpymOf/b8i0zqZrDGxqWS/Nkbeu3sA8VKds=;
 b=Rc8eCCEgBcxnz3+RpeIjhNUBbZMsslsv7I/RIVRSkSrXDtwRa6FTcrfb
 G7ExbpCkXAQOAq1tjrXYAClHaS0fNPT9ygTLd9FyaF71h3mZwRhEWUqXH
 Cc6ZHXhBX5jzKdx78aMny67+2JK2k9RNZFcjyesJ0XZBT1h9S1B8TQ98c
 MWAo2+OL6Fm+u5SKUwGWFKeA2++bntcD1XrYl5p1fSsSn1ae+JjwfhSqS
 RU908s3GqyozRbazluWFi6Pbhc18mm9VrclJyMDlJzexuQVpTTem1TOak
 NzHki00sVRUGOlo74LkqxLVKt8dMFH4dvXG7Lugcqv+Zaptyyrltk25rs A==;
X-CSE-ConnectionGUID: YXbW1j17Qw+HRA0mkFSrzQ==
X-CSE-MsgGUID: IUucAuOuQ5W6r9niz4cogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90641300"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90641300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 17:42:13 -0800
X-CSE-ConnectionGUID: SwWwKY/FTzGaCFA+8fUarg==
X-CSE-MsgGUID: 05IPGTtVQraGLXke0X51Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="220890786"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 17:42:13 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Skip over non leaf pte for PRL generation
Date: Fri, 27 Feb 2026 01:42:14 +0000
Message-ID: <20260227014212.992363-5-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227014212.992363-4-brian3.nguyen@intel.com>
References: <20260227014212.992363-4-brian3.nguyen@intel.com>
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

The check using xe_child->base.children was insufficient in determining
if a pte was a leaf node. So explicitly skip over every non-leaf pt and
conditionally abort if there is a scenario where a non-leaf pt is
interleaved between leaf pt, which results in the page walker skipping
over some leaf pt.

Note that the behavior being targeted for abort is
PD[0] = 2M PTE
PD[1] = PT -> 512 4K PTEs
PD[2] = 2M PTE

results in abort, page walker won't descend PD[1].

With new abort, ensuring valid PRL before handling a second abort.

v2:
 - Revert to previous assert.
 - Revised non-leaf handling for interleaf child pt and leaf pte.
 - Update comments to specifications. (Stuart)
 - Remove unnecessary XE_PTE_PS64. (Matthew B)

Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 13b355fadd58..6fd5f0c29d44 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1655,14 +1655,35 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	XE_WARN_ON(!level);
 	/* Check for leaf node */
 	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
-	    (!xe_child->base.children || !xe_child->base.children[first])) {
+	    xe_child->level <= MAX_HUGEPTE_LEVEL) {
 		struct iosys_map *leaf_map = &xe_child->bo->vmap;
 		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
 
 		for (pgoff_t i = 0; i < count; i++) {
-			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
+			u64 pte;
 			int ret;
 
+			/*
+			 * If not a leaf pt, skip unless non-leaf pt is interleaved between
+			 * leaf ptes which causes the page walk to skip over the child leaves
+			 */
+			if (xe_child->base.children && xe_child->base.children[first + i]) {
+				u64 pt_size = 1ULL << walk->shifts[xe_child->level];
+				bool edge_pt = (i == 0 && !IS_ALIGNED(addr, pt_size)) ||
+					       (i == count - 1 && !IS_ALIGNED(next, pt_size));
+
+				if (!edge_pt) {
+					xe_page_reclaim_list_abort(xe_walk->tile->primary_gt,
+								   xe_walk->prl,
+								   "PT is skipped by walk at level=%u offset=%lu",
+								   xe_child->level, first + i);
+					break;
+				}
+				continue;
+			}
+
+			pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
+
 			/*
 			 * In rare scenarios, pte may not be written yet due to racy conditions.
 			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
@@ -1674,9 +1695,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 			}
 
 			/* Ensure it is a defined page */
-			xe_tile_assert(xe_walk->tile,
-				       xe_child->level == 0 ||
-				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
+			xe_tile_assert(xe_walk->tile, xe_child->level == 0 ||
+				       (pte & (XE_PDE_PS_2M | XE_PDPE_PS_1G)));
 
 			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
 			if (pte & XE_PTE_PS64)
@@ -1704,8 +1724,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	 * Verify PRL is active and if entry is not a leaf pte (base.children conditions),
 	 * there is a potential need to invalidate the PRL if any PTE (num_live) are dropped.
 	 */
-	if (xe_walk->prl && level > 1 && xe_child->num_live &&
-	    xe_child->base.children && xe_child->base.children[first]) {
+	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) && level > 1 &&
+	    xe_child->num_live && xe_child->base.children && xe_child->base.children[first]) {
 		bool covered = xe_pt_covers(addr, next, xe_child->level, &xe_walk->base);
 
 		/*
-- 
2.43.0

