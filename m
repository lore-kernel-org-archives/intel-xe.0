Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1ADC5AC7C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 18:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901B710F29A;
	Thu,  6 Aug 2026 18:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESP5pAWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45E010E37C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786042333; x=1817578333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uw2ckxu0hLFEvOwU1hMIqUYRgPP9fW/UYL6V4yHL1xA=;
 b=ESP5pAWSehEWdxrGvWz1mxIonfZMPMAIYOvgjme+Q8/GfymtBnJQsbou
 X2Tl4RiVVxfdgfQqr6V6Ib8Kif5vSgEjiV6R+Bh1pHDEDpcgfTJiB8SG3
 +Q+4VZXkb/lKzxeD/hzwGSYw4sCa1R8AilagbXm69SkHMN6P/mhXmm6vR
 De+ZoEptWtSR6Nh8+WE9hdKbwUo283xqIG6Z2qL1d2gbXkILSnI05n26W
 pnafrul1Zb0ZoeFXRGKfaEOsXxilusgMhTemz5gUmTilOok/rHMk3vQBv
 MBeP57qI/HNmG/dltCQVPwQnXw0YWP3ssRdgA2J5PIS73JtfUglnlNeGu A==;
X-CSE-ConnectionGUID: eZ1vo/ZHRVSl8SufiP2WWw==
X-CSE-MsgGUID: GM/vEobITBycltL1fTJ9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86854811"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86854811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
X-CSE-ConnectionGUID: LTC8roluSoOM97JTRDCS5w==
X-CSE-MsgGUID: 6us02bc6SBSWszsrvRy+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="266414615"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v9 07/12] drm/xe: Track pagefault worker runtime
Date: Thu,  6 Aug 2026 11:51:57 -0700
Message-Id: <20260806185202.3922432-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806185202.3922432-1-matthew.brost@intel.com>
References: <20260806185202.3922432-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pagefault.c      | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 789397514f3e..513fe28c0e76 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -101,6 +101,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
 	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
 	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
+	DEF_STAT_STR(PAGEFAULT_US, "pagefault_us"),
 	DEF_STAT_STR(INVALID_PREFETCH_PAGEFAULT_COUNT, "invalid_prefetch_pagefault_count"),
 	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
 	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index 425491bed6c4..a7021a298e3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -22,6 +22,8 @@
  *   handled.
  * @XE_GT_STATS_ID_VMA_PAGEFAULT_KB: Size (KiB) of VMAs involved in
  *   buffer-object page fault handling.
+ * @XE_GT_STATS_ID_PAGEFAULT_US: Cumulative time (µs) handling of all page
+ *   faults.
  * @XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT: GPU prefetch faults for
  *   addresses with no valid backing.
  *
@@ -133,6 +135,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_PAGEFAULT_US,
 	XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2b0fabe29e25..65be8dd09e2f 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -296,6 +296,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	struct xe_device *xe = pf_work->xe;
 	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
 	struct xe_pagefault pf;
+	ktime_t start = xe_gt_stats_ktime_get();
+	struct xe_gt *gt = NULL;
 	unsigned long threshold;
 
 #define USM_QUEUE_MAX_RUNTIME_MS      20
@@ -307,6 +309,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		if (!pf.gt)	/* Fault squashed during reset */
 			continue;
 
+		gt = pf.gt;
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
@@ -329,6 +332,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
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

