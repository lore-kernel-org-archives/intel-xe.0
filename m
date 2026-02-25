Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336FFD45F6
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741EE10E891;
	Wed, 25 Feb 2026 20:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T72KWEww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049A910E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051269; x=1803587269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XiofcPdnw3nGRf1f25VAkn7s423+iOaaTCah5k2FPo=;
 b=T72KWEwwvTFGkn3zpoPzBAQvi1u3Bl1GK1HOEscc2CD0LWBAPC+UYuXc
 wQRx+uXtdWvu+0sQctitiq9kTkiJ1MmMSmgweV3jcX8G8uKxb8seseLkp
 1Inb1ahwD85wX20PSMEyWVEY/vs0j6LbFMetAukhplgu7FhpgMvFHkHyS
 7kwjcx5PW7wppckPkRMahOjqWNPNpFO+Nm9+ypsfHZGmD+e+2/2n7iOf7
 OMeNrSvL6xH8OLDNu63k5UCp7g8pqJ9c0xnl9pIL3d3IuLH4Z+N2MSKvF
 LCR4OJ3ju2NVwVBaiX75HgoL8yzvP7F1JKOvQ3bJm3ukzykfxo1NFdOeb Q==;
X-CSE-ConnectionGUID: oXGviTqoR0G+K+hYhwYvfA==
X-CSE-MsgGUID: Kpm+Ai0YT1WJRkS7ULbCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90515171"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="90515171"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:48 -0800
X-CSE-ConnectionGUID: wxRdKbGgSJmi8SmYpKKXrA==
X-CSE-MsgGUID: jQaToM8wRMuw5uajAcaEXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220845153"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 12/12] drm/xe: Track parallel page fault activity in GT
 stats
Date: Wed, 25 Feb 2026 12:27:36 -0800
Message-Id: <20260225202736.2723250-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225202736.2723250-1-matthew.brost@intel.com>
References: <20260225202736.2723250-1-matthew.brost@intel.com>
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

