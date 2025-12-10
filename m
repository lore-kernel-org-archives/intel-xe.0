Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A9BD3C92B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 16:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410B10E77B;
	Wed, 10 Dec 2025 16:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDODUhnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54E10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765385418; x=1796921418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aBoV3w7E/qayKasNtBZ9bOYo30c3VY1Sep9bUsZ4Xn8=;
 b=lDODUhnAhGy/kThyZfEQL59bKpntvJ5pLpRQcw0JBvZ1di+YY+iHLR57
 ax5VRQjQ8jycV1hTWxv7QxfZrUZb7s9jie2h6MJQto+/iif6ZI44TEgMe
 Zs3dBQh+ThtRwYg6r7qYlm3prY5ptkrYLGim8eLpLnky2h9uoiPN0nF+C
 tBvwYRjcB71qCYjVg7C4e57kN4/QwInOA/wsFN7ZpmgdN7+AmjRkv1jvv
 KPw46NCJKcMw81XBQ90mEUvaxzDhIIcRsn1S9cuVO4mz7WWhyVe4wEzw6
 MLiWFbKGby4jmGA93bJp2wKXDWsPDZuSBaYybW74foMzmM8P8GouygSjk g==;
X-CSE-ConnectionGUID: TLRpGHlvS9SZnN9bsZ5hQQ==
X-CSE-MsgGUID: dhtbcvd3SYqSYKq6YjI+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70985119"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="70985119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:50:18 -0800
X-CSE-ConnectionGUID: HuD6zO3iRYqAtIcXhm8VoQ==
X-CSE-MsgGUID: m0FNJqnITLuMS/8HNNvlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="196461386"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.43])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:50:16 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe/hw_engine_group: Add stats for mode switching
Date: Wed, 10 Dec 2025 17:50:00 +0100
Message-ID: <20251210165000.60789-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The GT stats interface is extended to include counters of how many
queues are either interrupted or waited on in the hardware engine
groups. This can help application debugging.

v2: Rename to queue as those operations are queue-based (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c        | 4 ++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h  | 2 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 5f74706bab81..714045ad9354 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -66,6 +66,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_4K_BIND_US, "svm_4K_bind_us"),
 	DEF_STAT_STR(SVM_64K_BIND_US, "svm_64K_bind_us"),
 	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
+		     "hw_engine_group_suspend_lr_queue_count"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
+		     "hw_engine_group_wait_dma_queue_count"),
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index d8348a8de2e1..aada5df421e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -44,6 +44,8 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_4K_BIND_US,
 	XE_GT_STATS_ID_SVM_64K_BIND_US,
 	XE_GT_STATS_ID_SVM_2M_BIND_US,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fa4db5f23342..290205a266b8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_gt_stats.h"
 #include "xe_hw_engine_group.h"
 #include "xe_vm.h"
 
@@ -203,6 +204,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
 		need_resume = true;
 		q->ops->suspend(q);
 	}
@@ -244,6 +246,7 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 		if (xe_vm_in_lr_mode(q->vm))
 			continue;
 
+		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT, 1);
 		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
 		timeout = dma_fence_wait(fence, false);
 		dma_fence_put(fence);
-- 
2.43.0

