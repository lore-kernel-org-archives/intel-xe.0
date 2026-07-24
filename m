Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4466C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 01:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703AA10F277;
	Fri, 24 Jul 2026 01:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLgEjGLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DEB10F275
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 01:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784855393; x=1816391393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6ANvia1pP3zqgCSrKkFvndSoxn0KZpjMS8M2gzvMI0=;
 b=hLgEjGLFuykV0Vq1qxIuGql5Obnu4VLNDfDxc3CbtWFs6Bkir5Ne9LS/
 neaFQkjXuobCF9kPYs74Y4RzquzkF+qqnqro15knQf+Rg1mH28PnkUa88
 y2VH3yLBD82MZYkFb5Yj0U4Idjl/N4/48SG2szCvlaulH+Xi52aIw2pT8
 +0ntzwA8E8Op+7BSMyrItxe19aPx6pBnxYo4PwS7k5CcLto+UuCObcOb9
 7w0h47hdqusMXEusg64Rm1cUv7O5j3B/D73nYCyWW2hiMnFMwKPftBP7h
 WzpppdDQ8sZG5k+CzD1Qa0U1jUWgTrmsgyFHiw68Y9hThsyTSJfuQYTUl w==;
X-CSE-ConnectionGUID: 4HXSYsDkRPuI1k85SSwjXA==
X-CSE-MsgGUID: J1TmLgZ7QCenNjrMP23xmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73064795"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="73064795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:53 -0700
X-CSE-ConnectionGUID: Mpud7ZKBQcKIYD52MGzU3Q==
X-CSE-MsgGUID: BWzXqkEgQC6W2NLtxtvSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="255929099"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v6 07/12] drm/xe: Track pagefault worker runtime
Date: Thu, 23 Jul 2026 18:09:42 -0700
Message-Id: <20260724010947.1573757-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724010947.1573757-1-matthew.brost@intel.com>
References: <20260724010947.1573757-1-matthew.brost@intel.com>
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
index 0ee9b7acef41..7684d986c8f7 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -319,6 +319,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	struct xe_device *xe = pf_work->xe;
 	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
 	struct xe_pagefault pf;
+	ktime_t start = xe_gt_stats_ktime_get();
+	struct xe_gt *gt = NULL;
 	unsigned long threshold;
 
 #define USM_QUEUE_MAX_RUNTIME_MS      20
@@ -330,6 +332,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		if (!pf.gt)	/* Fault squashed during reset */
 			continue;
 
+		gt = pf.gt;
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			if (err == -EAGAIN) {
@@ -356,6 +359,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
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

