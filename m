Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F1FD45EF
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF310E86C;
	Wed, 25 Feb 2026 20:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a64preD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454F10E82D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051269; x=1803587269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0WjH46qAt/gQDi4vpzLuwrdxnh36Epz2S1e2378CEHg=;
 b=a64preD0WMWAE4cJNkEmAuBF32fsP8oBy7ANumwjdFtwM8wXa48tDson
 btPPpOFrjF5JeJ3RYVMgk3Mj+Hp6JIstaB0/QZ+QPoJWr+bY7/8Zz1CW1
 IijAgGIXdKj5+BUnw3/i8fSguW8KXzUxJV04iQ4XeaBWdpeF4RcKUMFT6
 pxqTu1HYDxgBwpH257rkTfyfQ1Qxc76xUiv9gou5+Jl9/UZJWRzdq7MjF
 5NmYr0QlxL1w86yXecFzpptisQwFSRFgXiOHoea//aPw70l1gpyHzTgmx
 bW6fyeOp/bkjb8SIFCwZWTcVzPryt9wSlaT7jAE1E+bD1dcc4gGqErWnA w==;
X-CSE-ConnectionGUID: bJBCRGx5QJOZXiyYbxkwIw==
X-CSE-MsgGUID: KCUffvJ3S0etCQV8yRKN8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90515166"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="90515166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:48 -0800
X-CSE-ConnectionGUID: ObNJt6mjRR2/hVVaICjR8A==
X-CSE-MsgGUID: FfL1+EeQRZWBTK7wdEVuTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220845138"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 07/12] drm/xe: Track pagefault worker runtime
Date: Wed, 25 Feb 2026 12:27:31 -0800
Message-Id: <20260225202736.2723250-8-matthew.brost@intel.com>
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

Add a GT stat measuring total time spent servicing pagefault workqueue
iterations. The counter accumulates the runtime of the pagefault worker
in microseconds, allowing correlation of fault storms and chaining
behavior with CPU time spent in the fault handler.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
 drivers/gpu/drm/xe/xe_pagefault.c      | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 81cec441b449..c1af3ecb429b 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -60,6 +60,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
 	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
 	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
+	DEF_STAT_STR(PAGEFAULT_US, "pagefault_us"),
 	DEF_STAT_STR(INVALID_PREFETCH_PAGEFAULT_COUNT, "invalid_prefetch_pagefault_count"),
 	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
 	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b6081c312474..129260bfdfe6 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -15,6 +15,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_PAGEFAULT_US,
 	XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index a6fa790774c5..030452923ab9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -277,6 +277,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	struct xe_device *xe = pf_work->xe;
 	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
 	struct xe_pagefault pf;
+	ktime_t start = xe_gt_stats_ktime_get();
+	struct xe_gt *gt = NULL;
 	unsigned long threshold;
 
 #define USM_QUEUE_MAX_RUNTIME_MS      20
@@ -288,6 +290,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		if (!pf.gt)	/* Fault squashed during reset */
 			continue;
 
+		gt = pf.gt;
 		err = xe_pagefault_service(&pf);
 
 		if (err == -EAGAIN) {
@@ -314,6 +317,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		}
 	}
 #undef USM_QUEUE_MAX_RUNTIME_MS
+
+	if (gt)
+		xe_gt_stats_incr(xe_root_mmio_gt(gt_to_xe(gt)),
+				 XE_GT_STATS_ID_PAGEFAULT_US,
+				 xe_gt_stats_ktime_us_delta(start));
 }
 
 static int xe_pagefault_queue_init(struct xe_device *xe,
-- 
2.34.1

