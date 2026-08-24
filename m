Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21764C5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686810E57D;
	Mon, 24 Aug 2026 16:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSzXzRCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2110E579
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589386; x=1819125386;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W2LMNT1m+Bq/fqGY1uCHSOgumbQ6Yh/MCgSh5Ai8yuo=;
 b=nSzXzRCqlv/3mEVDhPwfIHdrWZiOjt82AZ6lS/2t6MG5iNkvi4AkYe8P
 GmCxGv3NpAsoKjFW9CM3NX31C3dFM4azOXTS1BCZ3yZKru/sDFbaxDtrR
 nzK6ZF1xJuCYNOl+xA4pHSk+RrvJK00224beXFfFhusekejAlFeqoycOR
 FuVh2eJdo5jSuMZMsOJoqAQGzn5zVrVnzpBEfLZ4kVmrTditaEz13pzf7
 nVvLYc9aAs5aaBm+DSjDETCIHcOB5dKpN8HdBF1wtHhcam4pKMGDUPt77
 14EWaMzUVFHdj/gqu9pcutGvPjABVrOzFlPQo+4dF0HmZblT5Kf5UBLwz w==;
X-CSE-ConnectionGUID: tCidSBDvSFOH7AzByyxdgw==
X-CSE-MsgGUID: t5dBanpBRFO5buVN8ScK+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99209642"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99209642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:36:26 -0700
X-CSE-ConnectionGUID: DNgWaHS2TQ2t7ytNXP4Hxw==
X-CSE-MsgGUID: gR3RRUZmSzuI7Q9J20VwxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263321829"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 09:36:24 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch
Date: Mon, 24 Aug 2026 22:04:56 +0530
Message-ID: <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

xe_ggtt_clear() wrote a scratch PTE across the range for both
initial_clear() and the node_remove() unmap path.

On unmap the scratch PTE hides stale-TLB gaps: after the range is
invalidated a re-walk lands on the still-valid scratch PTE, so a stale
engine TLB translation for the freed range never faults and the
invalidation gap stays invisible.

Add an explicit use_scratch bool. initial_clear() keeps writing scratch.
On multi-queue platforms, where engines cache GGTT independently,
node_remove() writes PTE=0 so a stale translation to a freed range
faults and the gap becomes observable; other platforms keep scratch.

v2: Add xe_gt_has_multi_queue() helper and other knits-Niranjana

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 47 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..4cddd69f0e99 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_map.h"
@@ -257,23 +258,36 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
 
-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
+/**
+ * xe_ggtt_clear() - Clear a range of GGTT page-table entries
+ * @ggtt: the &xe_ggtt to clear
+ * @start: start of the range (GGTT address)
+ * @size: size of the range in bytes
+ * @use_scratch: true fills the range with the scratch PTE (init-time clear so
+ *		 engines walking free holes read zeros safely); false writes
+ *		 PTE=0 so a stale HW TLB entry faults instead of silently
+ *		 landing on scratch.
+ */
+static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size,
+			  bool use_scratch)
 {
-	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), XE_CACHE_WB);
 	u64 end = start + size - 1;
-	u64 scratch_pte;
+	u64 pte;
 
 	xe_tile_assert(ggtt->tile, start < end);
 
-	if (ggtt->scratch)
-		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
-			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
-							     pat_index);
-	else
-		scratch_pte = 0;
+	if (use_scratch && ggtt->scratch) {
+		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile),
+						 XE_CACHE_WB);
+
+		pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
+		      ggtt->pt_ops->pte_encode_flags(ggtt->scratch, pat_index);
+	} else {
+		pte = 0;
+	}
 
 	while (start < end) {
-		ggtt->pt_ops->ggtt_set_pte(ggtt, start, scratch_pte);
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, pte);
 		start += XE_PAGE_SIZE;
 	}
 }
@@ -459,7 +473,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, true);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -473,12 +487,19 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 static void ggtt_node_remove(struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
-	bool bound;
+	bool use_scratch, bound;
+
+	/*
+	 * Addition of a secondary queue while a multi-queue context is live on
+	 * HW requires proper GGTT TLB clearing, so use faulting PTEs here.
+	 */
+	use_scratch = !xe_gt_has_multi_queue(ggtt->tile->primary_gt);
 
 	mutex_lock(&ggtt->lock);
 	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
 	if (bound)
-		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
+			      xe_ggtt_node_size(node), use_scratch);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	if (bound && node->invalidate_on_remove)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 65a4655b0994..92d934d50244 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
 	return gt->info.multi_queue_engine_class_mask & BIT(class);
 }
 
+/**
+ * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
+ * any engine class.
+ *
+ * @gt: the GT object (may be NULL)
+ *
+ * Return: true if any engine class on @gt supports multi queue, else false
+ */
+static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
+{
+	return gt && gt->info.multi_queue_engine_class_mask;
+}
+
 #endif
-- 
2.46.0

