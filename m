Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86E9FD4616
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821AA10E877;
	Thu, 26 Feb 2026 04:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ce4Cfb4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1497610E86F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080120; x=1803616120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XiofcPdnw3nGRf1f25VAkn7s423+iOaaTCah5k2FPo=;
 b=Ce4Cfb4gYkYpKVhJL9bOcw6l7/ioX8TKuJZo3kq/rOJ5CM0gP4dGtJ1O
 oF1FSZ5R+Q4garJUpPd07FsCjvdXO7n7bqy8WIYfjMlwAwXhD8ebnjNmi
 /rtMXZSxlYWaV6PJ4hC/mnl2yiDUbw0tE07d0CeyWDyl7HlF5mpjJ7wu6
 CLn9tr1+0GaV9hXoxCvTeHHBq1fU/eUP6y+QUPLOsfyy+2Z9B71FLT5Tf
 rpO+AScwCyQ34LIcJdh5fTukb9GakcplLib//CIre4U1mIhxfD4DQb35B
 OeuLyUQblGaAzAMzSm6W2j5Mamvq/mKRsbuXaeaBsqGttI/FDuHondG56 A==;
X-CSE-ConnectionGUID: Rq/I0nq5TlWdPAC6h1Z/Yw==
X-CSE-MsgGUID: 4qO5l5g5QleQdp65/3MGuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603139"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:39 -0800
X-CSE-ConnectionGUID: 0tSKYZLjRxm/epWGR7Wc2A==
X-CSE-MsgGUID: /Y9D1oenRxCLH8n0OkW9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334176"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 12/12] drm/xe: Track parallel page fault activity in GT
 stats
Date: Wed, 25 Feb 2026 20:28:34 -0800
Message-Id: <20260226042834.2963245-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c      | 18 +++++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index cdd467dfb46d..621d1a2df067 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -58,6 +58,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
 	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
 	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
+	DEF_STAT_STR(PARALLEL_PAGEFAULT_COUNT, "parallel_pagefault_count"),
 	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
 	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
 	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index 591e614e1cfc..075a12152ae2 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -13,6 +13,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index d252a8c9d88c..2a37a4c97aad 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -458,9 +458,10 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 {
 	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
 					    usm.pf_queue);
-	struct xe_pagefault_work *pf_work;
+	struct xe_pagefault_work *pf_work, *__pf_work;
 	struct xe_pagefault *lpf;
 	size_t align = SZ_2M;
+	int i;
 
 	guard(spinlock_irq)(&pf_queue->lock);
 
@@ -497,6 +498,21 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
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
 		if (pf_queue->tail == pf_queue->head)
-- 
2.34.1

