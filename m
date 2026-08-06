Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43B4C5ACAB
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 18:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6A110F299;
	Thu,  6 Aug 2026 18:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJ/AAXIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3476D10E37C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786042333; x=1817578333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5hwYVRiOuUSGzl6meAdOh2E8BwtUx5+S7M4PMio5iXM=;
 b=QJ/AAXIkkpHb87ixG460Mk3EYhlmQQ0LxdQLtCYtivK6WHpPYIN+NYqn
 8PblZtxRR/L3JAme9Hx06DGM/fGXwu7ihAmyFnKDS1jUAt6KC9HQWR476
 JLt57E3TkHKzFiLHY4OxFGLXFVxa7Jk/AT6B8o0rCrPKaZxn9T0lY6Qd0
 F+NxVI/b9hiKaMCCqAiQfwDciKJ+olzyd5bMAUrftTLZCRIFkXd8b++CS
 CxkjXCg0rtufDRJYxNUpLE6d0h9x2WS9EmgZyTfZFxjsKtCqD56fCU80G
 3m7borCTylhk5mVNnr1aWLhOBHfGe0Pgh4xxjwHKwNdYzex+kUshaNIM+ w==;
X-CSE-ConnectionGUID: 2Sy/RX+JSZyPosYht8qbmA==
X-CSE-MsgGUID: ZiNIq6N9TY+QrEl39ICHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86854815"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86854815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
X-CSE-ConnectionGUID: KT4mHcZBQJWdVGHRf+1SiQ==
X-CSE-MsgGUID: F28ONcGUTeiay0AvRiejfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="266414628"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v9 12/12] drm/xe: Track parallel page fault activity in GT
 stats
Date: Thu,  6 Aug 2026 11:52:02 -0700
Message-Id: <20260806185202.3922432-13-matthew.brost@intel.com>
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

Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
multiple page fault workers are active concurrently.

When a worker dequeues a fault, scan peer workers for an active
cache entry and increment the counter if another fault is already
in flight. This provides basic visibility into parallel fault
handling behavior for performance analysis and tuning.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  3 +++
 drivers/gpu/drm/xe/xe_pagefault.c      | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index f2e77df0f224..2a40924660ee 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -99,6 +99,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
 	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
 	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
+	DEF_STAT_STR(PARALLEL_PAGEFAULT_COUNT, "parallel_pagefault_count"),
 	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
 	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
 	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index ab5506f915cb..24abeb9f2137 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -18,6 +18,8 @@
  *   that also drained the fault queue.
  * @XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT: Chained faults requeued
  *   because their fault range did not match the fault they were chained onto.
+ * @XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT: Faults dequeued while another page
+ *   fault worker was already handling a fault concurrently.
  * @XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT: Faults whose range matched the last
  *   serviced range, allowing an immediate ack.
  *
@@ -144,6 +146,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index af19cd82e014..b2d7bca9e407 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -460,9 +460,10 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 {
 	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
 					    usm.pf_queue);
-	struct xe_pagefault_work *pf_work;
+	struct xe_pagefault_work *pf_work, *__pf_work;
 	struct xe_pagefault *lpf;
 	size_t align = SZ_2M;
+	int i;
 
 	guard(spinlock_irq)(&pf_queue->lock);
 
@@ -499,6 +500,21 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 	pf_work->cache.pf = lpf;
 	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
 
+	for (i = 0, __pf_work = xe->usm.pf_workers;
+	     i < xe->info.num_pf_work; ++i, ++__pf_work) {
+		u64 cache_start = __pf_work->cache.start;
+
+		if (__pf_work == pf_work)
+			continue;
+
+		if (cache_start != XE_PAGEFAULT_CACHE_START_INVALID) {
+			xe_gt_stats_incr(xe_root_mmio_gt(xe),
+					 XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
+					 1);
+			break;
+		}
+	}
+
 	/* Drain queue until empty or new fault found */
 	while (1) {
 		if (xe_pagefault_queue_empty(pf_queue))
-- 
2.34.1

