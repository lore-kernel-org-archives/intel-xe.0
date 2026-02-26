Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D5AFD461A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300710E876;
	Thu, 26 Feb 2026 04:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpq9MEad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3010E86B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080120; x=1803616120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7IDmRyn1fyay8FhgDxsZYGdGvUZV5uz10jDXwT33tY=;
 b=hpq9MEadhlfpHcsGPivojjnuEyYtiJzeMwSlwkMdo9Pq4Kfl65Jw9I4S
 MlraafiyNtHswh8qO6iaOQtHW+V+rN4v185uvxGFWDLetVOf96Amy95VW
 nQZs6ugnwqFhTcEDWfZjaFur2DRMxrhA1GCBmaZGlbLrtwK8HwdiDbp8J
 5FaChyNuUP/Nb3a2hZ3K6SITL6soH3tJx8IH+8wLsl6vw3vJUu4wsL1/F
 qo9XbhPeuP9r1+5FMdayPF9ZrDQA5jIYevWarud+Ha4KkKxy5aaCTjy1A
 QohL43U9Fwo1E4jgLzuexji+QCTJpOtsqJS2KfkMCzFyS7n02RRiPuDpD Q==;
X-CSE-ConnectionGUID: ksOYrZE7QRKXmkuuAW8rAQ==
X-CSE-MsgGUID: KjklRLFBTJiRyTknRy/IpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603135"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:39 -0800
X-CSE-ConnectionGUID: Fx2Ufe5ISgmA0cDubcLKSQ==
X-CSE-MsgGUID: a9RqXTj6RWOd7QdVKzD9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334168"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 09/12] drm/xe: Add pagefault chaining stats
Date: Wed, 25 Feb 2026 20:28:31 -0800
Message-Id: <20260226042834.2963245-10-matthew.brost@intel.com>
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

Add GT stats to quantify pagefault chaining behavior during fault storms.

Track total chained faults, faults chained directly from the IRQ
handler, cases where IRQ chaining also drained the queue, chained faults
that had to be requeued due to range mismatch, and cases where the last
serviced range allowed immediate ack.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  5 +++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_pagefault.c      | 18 ++++++++++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index c1af3ecb429b..cdd467dfb46d 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -54,6 +54,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
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
index 129260bfdfe6..591e614e1cfc 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -9,6 +9,11 @@
 #include <linux/types.h>
 
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
index 9c14f9505faf..c497dd8d9724 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -364,6 +364,7 @@ xe_pagefault_queue_requeue(struct xe_pagefault_queue *pf_queue,
 					    usm.pf_queue);
 	struct xe_pagefault *next = pf->consumer.next, *lpf;
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT, 1);
 	xe_assert(xe, pf->consumer.alloc_state ==
 		  XE_PAGEFAULT_ALLOC_STATE_CHAINED);
 
@@ -423,6 +424,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
 			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
 				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
 
+			xe_gt_stats_incr(pf->gt,
+					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
+					 1);
+
 			pf->consumer.alloc_state =
 				XE_PAGEFAULT_ALLOC_STATE_CHAINED;
 			pf->consumer.next = pf_work->cache.pf->consumer.next;
@@ -559,8 +564,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		/* Last fault same address, ack immediately */
 		if (xe_pagefault_cache_match(pf, cache_start, cache_end,
-					     cache_asid))
+					     cache_asid)) {
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
 			goto ack_fault;
+		}
 
 		err = xe_pagefault_service(pf);
 
@@ -816,8 +823,15 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 		lpf->consumer.next = NULL;
 
 		if (xe_pagefault_cache_hit(pf_queue, lpf)) {
-			if (empty)
+			xe_gt_stats_incr(pf->gt,
+					 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
+					 1);
+			if (empty) {
 				xe_pagefault_queue_advance(pf_queue);
+				xe_gt_stats_incr(pf->gt,
+						 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
+						 1);
+			}
 		} else {
 			int work_index = xe_pagefault_work_index(xe);
 
-- 
2.34.1

