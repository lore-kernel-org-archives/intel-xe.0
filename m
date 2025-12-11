Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE1CD43358
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E8710E6D0;
	Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzgtDOET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453C310E274
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486838; x=1797022838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PIrMMjFtt+eRIqq5kXE3BtqmpMV/V0C2yDdH2zsn+B4=;
 b=TzgtDOETFBCtU2vviCggddiF9XzPLdyw8uOX8gQxnDY+zeHm/ziakit/
 XgBWVOCNtI2EuSW4DvwdI5D6ur7Hh+GmgzxYfP9gTidgCfU8PClKFtjRo
 jOlSSFxKPUZWbAOep66Qx8MdZX1AOiKsT2UjkGpLcvyZaibR3ID5EE50c
 2cb3UV1MfZK1r9MuKjUBiqSLPgANLp9eUTC9g2qvaf6kKhZveNKzuDNZX
 I/Edkui2GXDibum4Y4/037RYYK0mb5wWXNXx/R6UVcbT8A13YcSpwEAqB
 bJCywPqv+1GlWbdxJIBot9Z6SE/cW/74ZcpKhWEtnUnp2AiYfhjBc7CHF w==;
X-CSE-ConnectionGUID: Q2sxyFZTTUqtn/KE6eZ8tA==
X-CSE-MsgGUID: 1kmlSHBlQjK4Yr7zglZvuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649723"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: dwQRYLC0TJ6X1KJ9m4o1ZQ==
X-CSE-MsgGUID: hwjYeulnTdaoToq2tYK79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297959"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 6/6] drm/xe: Add more GT stats around pagefault mode switch
 flows
Date: Thu, 11 Dec 2025 13:00:32 -0800
Message-Id: <20251211210032.1520113-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211210032.1520113-1-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c        |  6 +++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

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
index 35966889c776..8236fdee0901 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -14,6 +14,17 @@
 #include "xe_sync.h"
 #include "xe_vm.h"
 
+static s64 xe_hw_engine_group_stats_ktime_us_delta(ktime_t start)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ?
+		ktime_us_delta(ktime_get(), start) : 0;
+}
+
+static ktime_t xe_hw_engine_group_stats_ktime_get(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
+}
+
 static void
 hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 {
@@ -200,7 +211,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 {
 	int err, i;
 	struct xe_exec_queue *q;
+	struct xe_gt *gt = NULL;
 	bool need_resume = false;
+	ktime_t start = xe_hw_engine_group_stats_ktime_get();
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -213,6 +226,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
 
 		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
+		if (idle_skip_suspend)
+			xe_gt_stats_incr(q->gt,
+					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
 
 		if (!need_resume && !idle_skip_suspend && num_syncs) {
 			for (i = 0; i < num_syncs; ++i)
@@ -221,6 +237,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 
 		need_resume |= !idle_skip_suspend;
 		q->ops->suspend(q);
+		gt = q->gt;
 	}
 
 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
@@ -232,6 +249,12 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			return err;
 	}
 
+	if (gt) {
+		xe_gt_stats_incr(gt,
+				 XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
+				 xe_hw_engine_group_stats_ktime_us_delta(start));
+	}
+
 	if (need_resume)
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 
@@ -252,7 +275,9 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 {
 	long timeout;
 	struct xe_exec_queue *q;
+	struct xe_gt *gt = NULL;
 	struct dma_fence *fence;
+	ktime_t start = xe_hw_engine_group_stats_ktime_get();
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -264,11 +289,18 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
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
+				 xe_hw_engine_group_stats_ktime_us_delta(start));
+	}
+
 	return 0;
 }
 
-- 
2.34.1

