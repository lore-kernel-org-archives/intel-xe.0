Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C059CD59D88
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C80F10E930;
	Fri, 12 Dec 2025 18:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbdscGWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F2610E92D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564135; x=1797100135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzdedjF5DWwfSavz7toHTuQbuMURdsIRIgZ40vslWJ0=;
 b=PbdscGWcTxV5Ko4GDs/yodNyUh3YlwIORVXDcooDo7ehEicpl7uHxAHB
 lUL92ab/sUHRIyP0zTon6mZjM221MdlGb/Vb/ATtEkl+ii1ICzah+vtME
 ymg84F/MA7uGqCDGCyB23eNCRI4CrnB9vrX4pGU6yzTvpOJ0kBEABvd5n
 WJfQZaE2ulEsWXKcrXRVdtI7N/OGVjSmdI70wyeKaOqu3YpoXF3QWwyPt
 aEa+rPn9wccPr5R0s7XjdbA/qIal3KNlElBGdm37DEnrltASzHzapBwyw
 8FfaDJzw5PAl8VvR9PLkZ8ddQnwGsQg4NQI0SJ5ltKwexd8gQlPcnGqPE w==;
X-CSE-ConnectionGUID: XHiZpvi1Q4msTra+j8hUQA==
X-CSE-MsgGUID: 5CiYQ/KzQYu4a30KGSZ7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432802"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: OY3ypheGQn+XDcpW5EPrvA==
X-CSE-MsgGUID: 7BhtONkrQ/KEJlMW2iy+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633958"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 7/7] drm/xe: Add more GT stats around pagefault mode switch
 flows
Date: Fri, 12 Dec 2025 10:28:47 -0800
Message-Id: <20251212182847.1683222-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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

Add GT stats to measure the time spent switching between pagefault mode
and dma-fence mode. Also add a GT stat to indicate when pagefault
suspend is skipped because the system is idle. These metrics will help
profile pagefault workloads while 3D and display are enabled.

v2:
 - Use GT stats helper functions (Francois)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c        |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 22 +++++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 714045ad9354..fb2904bd0abd 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -68,8 +68,14 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
 	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
 		     "hw_engine_group_suspend_lr_queue_count"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
+		     "hw_engine_group_skip_lr_queue_count"),
 	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
 		     "hw_engine_group_wait_dma_queue_count"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
+		     "hw_engine_group_suspend_lr_queue_us"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
+		     "hw_engine_group_wait_dma_queue_us"),
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index aada5df421e5..b92d013091d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -45,7 +45,10 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_64K_BIND_US,
 	XE_GT_STATS_ID_SVM_2M_BIND_US,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 022fc0c30d38..9a53021bbfa7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -200,7 +200,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 {
 	int err;
 	struct xe_exec_queue *q;
+	struct xe_gt *gt = NULL;
 	bool need_resume = false;
+	ktime_t start = xe_gt_stats_ktime_get();
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -215,10 +217,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			return -EAGAIN;
 
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
-
+		if (idle_skip_suspend)
+			xe_gt_stats_incr(q->gt,
+					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
 
 		need_resume |= !idle_skip_suspend;
 		q->ops->suspend(q);
+		gt = q->gt;
 	}
 
 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
@@ -230,6 +235,12 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			return err;
 	}
 
+	if (gt) {
+		xe_gt_stats_incr(gt,
+				 XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
+				 xe_gt_stats_ktime_us_delta(start));
+	}
+
 	if (need_resume)
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 
@@ -250,7 +261,9 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 {
 	long timeout;
 	struct xe_exec_queue *q;
+	struct xe_gt *gt = NULL;
 	struct dma_fence *fence;
+	ktime_t start = xe_gt_stats_ktime_get();
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -262,11 +275,18 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
 		timeout = dma_fence_wait(fence, false);
 		dma_fence_put(fence);
+		gt = q->gt;
 
 		if (timeout < 0)
 			return -ETIME;
 	}
 
+	if (gt) {
+		xe_gt_stats_incr(gt,
+				 XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
+				 xe_gt_stats_ktime_us_delta(start));
+	}
+
 	return 0;
 }
 
-- 
2.34.1

