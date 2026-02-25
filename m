Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EACFD377B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 18:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280A410E807;
	Wed, 25 Feb 2026 18:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmN+jOfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057310E7F5
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772045241; x=1803581241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7IDmRyn1fyay8FhgDxsZYGdGvUZV5uz10jDXwT33tY=;
 b=CmN+jOfc70bmRlyZqK/VZYzo2p06P9V02kkdWWCSp/jVpKG7UiIXwI1f
 eAm5FinL6xBjnU8kxa4lN8gFg+yGUE+DuZNYCNowzDxRYQDBnJY3qIuAx
 bVJJCx3Skp3OR7LtM72b58hqHx8oiFJtVP8aE8Skdhwi3JrGDDrcQ2Zxg
 xHj0Af/TfJss7fGDm5j5uHVQHGS3j98DoJbk8qJfa0ZQpOyxw3suo2x8h
 +JjHracTguBaNK7AJdEQ4J9ikf5zpbQu96BK/AIUQecIH4UKWfsfGUzLR
 3D+csyKDDAIjOtCyO6bf+qkfZfUNeeLiZKwQFV0f0QGrSSQZVy4F1flbl Q==;
X-CSE-ConnectionGUID: rGZ2zeSNS0SYfUFRedFOMA==
X-CSE-MsgGUID: sT9dOre2TTWRDZNnC/gwGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76700330"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="76700330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:47:20 -0800
X-CSE-ConnectionGUID: h8+74/miT4SQ88XKvp9rlg==
X-CSE-MsgGUID: 3kba0KLJSJyqW1uimMNtsw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:47:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v2 09/12] drm/xe: Add pagefault chaining stats
Date: Wed, 25 Feb 2026 10:47:10 -0800
Message-Id: <20260225184713.2606772-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225184713.2606772-1-matthew.brost@intel.com>
References: <20260225184713.2606772-1-matthew.brost@intel.com>
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

