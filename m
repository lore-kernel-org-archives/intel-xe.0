Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2AC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBDC10F49D;
	Fri, 24 Jul 2026 21:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma4Z4z0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84610F4A5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784929175; x=1816465175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uw2ckxu0hLFEvOwU1hMIqUYRgPP9fW/UYL6V4yHL1xA=;
 b=ma4Z4z0cBVu33wa4UQFlptY0qll55Y/gSIQlHEa+J9vh5De0JUxTnIpK
 pQiWRmcd4s7RENyIY+WVt/t4XuqRQnv1hOQl+xYUnjWah7lsX3hoP5KSA
 2gbxYR+5DJEJEtrt/3aAmi8OsiY1CQOckIQlctwERHq2I46pnKWh4kp6Z
 9jben+lFjwCti9xc5+BV336Rt6v4f9zJ8FWvYMlOYC3c37GMorhKCjRdP
 npKs/ahVNRvDpKbiT8Nyh5Ey49IXGBDIunzjvT2PD6yKO8w+o61LA6VUu
 lVA0F7LcPttvQohhC9H89QTMK6YYnyYpTBX4n9FbAa1KSpsI3jmAJPdPu A==;
X-CSE-ConnectionGUID: X4laqP7XTKyMarl/EBv1eQ==
X-CSE-MsgGUID: YCllfKHDQN+FlVLZW3RXwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="111144561"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="111144561"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:39:34 -0700
X-CSE-ConnectionGUID: HKkOow7nRL2WwNdvKgebmQ==
X-CSE-MsgGUID: 3f6/G17VTP+NynpRHd4jxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="263812737"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:39:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v7 07/12] drm/xe: Track pagefault worker runtime
Date: Fri, 24 Jul 2026 14:39:23 -0700
Message-Id: <20260724213928.1670731-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724213928.1670731-1-matthew.brost@intel.com>
References: <20260724213928.1670731-1-matthew.brost@intel.com>
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

