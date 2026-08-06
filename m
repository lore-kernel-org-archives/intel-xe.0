Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90949C5AC9E
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 18:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F1410E37D;
	Thu,  6 Aug 2026 18:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMGVl6QJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE6110E37D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786042333; x=1817578333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZi8HJDTm+crgHQKMLhXfFc0KldMvG3jHphyqP2sO2Q=;
 b=dMGVl6QJPWR0Q9vZJNkEtBYWrygyTVuKErHuwUgHnSg7iaP9vqS70v0+
 OLRsCYObBsDKudJ6mwpsY0em6kflGKMVa6iS2FGgabjbxQOiJ0G2UHDiB
 g2dzn4SFHBTW6WqkeR65aq0mpy8tPOyaPdOO3fhEXi2iGuMhus0+mc4yg
 nYdZl++Qmx9lgJjDz0aaQRw0ZEA4q6oXYsiYaMsZlIfNhd33MTz6Lq/g0
 NnXdBbev58qBd4b8YPfJ4/xtAQtAli2ysEG8PRAoWc9GtcnTLe7Z2MsfJ
 F7rWusQvmGyG8+RRgYV1c6kdUplvEYlWAjxXB3FcsokptEidninjT5rSp g==;
X-CSE-ConnectionGUID: 7Urc7ByYS0q8kqwZKIYsoA==
X-CSE-MsgGUID: C/8UVKo9RGyWkxAFASTr1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86854814"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86854814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
X-CSE-ConnectionGUID: O4uZg12wQiCya8Y6ZfL5jw==
X-CSE-MsgGUID: QqeMFFLaS9CjU405YpGvww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="266414621"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v9 09/12] drm/xe: Add pagefault chaining stats
Date: Thu,  6 Aug 2026 11:51:59 -0700
Message-Id: <20260806185202.3922432-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806185202.3922432-1-matthew.brost@intel.com>
References: <20260806185202.3922432-1-matthew.brost@intel.com>
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

Add GT stats to quantify pagefault chaining behavior during fault storms.

Track total chained faults, faults chained directly from the IRQ
handler, cases where IRQ chaining also drained the queue, chained faults
that had to be requeued due to range mismatch, and cases where the last
serviced range allowed immediate ack.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  5 +++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c      | 19 +++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 513fe28c0e76..f2e77df0f224 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -95,6 +95,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 #define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	DEF_STAT_STR(CHAIN_PAGEFAULT_COUNT, "chain_pagefault_count"),
+	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
+	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
+	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
+	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
 	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
 	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
 	DEF_STAT_STR(SVM_TLB_INVAL_COUNT, "svm_tlb_inval_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index a7021a298e3e..ab5506f915cb 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -10,6 +10,17 @@
 
 /**
  * enum xe_gt_stats_id - GT statistics identifiers
+ * @XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT: Total page faults chained onto an
+ *   in-flight fault instead of being queued separately.
+ * @XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT: Page faults chained directly from
+ *   the IRQ handler.
+ * @XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT: IRQ-handler chained faults
+ *   that also drained the fault queue.
+ * @XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT: Chained faults requeued
+ *   because their fault range did not match the fault they were chained onto.
+ * @XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT: Faults whose range matched the last
+ *   serviced range, allowing an immediate ack.
+ *
  * @XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT: Total SVM page faults handled.
  * @XE_GT_STATS_ID_TLB_INVAL: Total GPU Translation Lookaside Buffer (TLB)
  *   invalidations issued.
@@ -129,6 +140,11 @@
  * See Documentation/gpu/xe/xe_gt_stats.rst.
  */
 enum xe_gt_stats_id {
+	XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
 	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index a8aba4aab9d0..776c4cc8c3e1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -351,6 +351,8 @@ xe_pagefault_queue_unchain_requeue(struct xe_pagefault_queue *pf_queue,
 	xe_assert(xe, pf->consumer.alloc_state ==
 		  XE_PAGEFAULT_ALLOC_STATE_CHAINED);
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT, 1);
+
 	pf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_FREE;
 	lpf = xe_pagefault_queue_add(pf_queue, pf);
 	if (lpf) {
@@ -407,6 +409,10 @@ static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
 			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
 				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 
+			xe_gt_stats_incr(pf->gt,
+					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
+					 1);
+
 			pf->consumer.alloc_state =
 				XE_PAGEFAULT_ALLOC_STATE_CHAINED;
 			pf->consumer.next = pf_work->cache.pf->consumer.next;
@@ -582,8 +588,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		bool invalidated = false;
 
 		/* Last fault same address, ack immediately */
-		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid))
+		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid)) {
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
 			goto ack_fault;
+		}
 
 		err = xe_pagefault_service(pf);
 
@@ -841,8 +849,15 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 			lpf->consumer.next = NULL;
 
 			if (xe_pagefault_try_chain(pf_queue, lpf)) {
-				if (empty)
+				xe_gt_stats_incr(pf->gt,
+						 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
+						 1);
+				if (empty) {
+					xe_gt_stats_incr(pf->gt,
+							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
+							 1);
 					xe_pagefault_queue_advance(pf_queue);
+				}
 			} else {
 				int work_index = xe_pagefault_work_index(xe);
 
-- 
2.34.1

