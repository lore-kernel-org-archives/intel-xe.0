Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14714C5DF8F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 07:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6110F265;
	Fri, 21 Aug 2026 07:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YORwoAPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2211210F25E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787298245; x=1818834245;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/b3oqTxZKbD2nLEOvfL3uJ80g9xx5E9I6UunFlinN1M=;
 b=YORwoAPM4gXyKpqtZ2vD9FvtWJcdWpPs9jUNHRNvqGj3BeRxBfLpR+X2
 udbkhGGjmbTWS1BV1mAnGGfjDXPvdYno/bEUAD88fhMoGETsng12xkHPq
 x++fm6Z50wRr/t/uYTa0wEFYqpqm/HixORPBtAodHvWOfEKucfwY9o6SI
 poIurjvJu6HSuwpszG4bDmzCHN4LXxLfQucNE3nAlQRvfWOn1Af6V3w2B
 UkmuvyPXu01I+7vRFZ69pqwoaxpFlhEStNRact32PwoWwxixsyO4eavxm
 c6tQbQunK47lV+EGWfKhgIGBCNkpg5QMLC3gTcJrStsFanw6Jsf3eJdZp A==;
X-CSE-ConnectionGUID: 1kUkNRiIT3qK/wBmF9+KMA==
X-CSE-MsgGUID: vzmKYtH8TMOJN5mwmX82SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87971600"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87971600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 00:44:05 -0700
X-CSE-ConnectionGUID: va5N9WihRWG++UcHCOfD5Q==
X-CSE-MsgGUID: UX0iUDf3SOSA9dwaRn8NGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="296173580"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 00:44:03 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch
Date: Fri, 21 Aug 2026 13:12:36 +0530
Message-ID: <20260821074238.3000501-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 38 ++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..3564345fd740 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -257,23 +257,31 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
 
-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
+/*
+ * @use_scratch: true fills the range with the scratch PTE (init-time clear so
+ * engines walking free holes read zeros safely); false writes PTE=0 so a
+ * stale HW TLB entry faults instead of silently landing on scratch.
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
@@ -459,7 +467,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, true);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -473,12 +481,16 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 static void ggtt_node_remove(struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
-	bool bound;
+	struct xe_gt *primary_gt = ggtt->tile->primary_gt;
+	bool use_scratch, bound;
+
+	use_scratch = !(primary_gt && primary_gt->info.multi_queue_engine_class_mask);
 
 	mutex_lock(&ggtt->lock);
 	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
 	if (bound)
-		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
+			      xe_ggtt_node_size(node), use_scratch);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	if (bound && node->invalidate_on_remove)
-- 
2.46.0

