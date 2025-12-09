Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E25D3B983
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 16:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D810E145;
	Tue,  9 Dec 2025 16:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvPY1DKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB410E145
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765298834; x=1796834834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KD0wayh1eAjWAehS1WZQc401yMsMBJGS6y6lfbHo6Iw=;
 b=LvPY1DKD9wVe39JNnct4NtlnOQKNYpbuX4IpKR2C3/8hxkx500ASoQKL
 WdgQgaL2LP6TPFXajQIHWajMqHmnm8Hj45PxR2ggKAl3I/o3jP8kwK3ke
 h2Bh+TXpfpEzAXIqeXQb+OSUkbJYRtPYaiWiF99bsO+sWMeKVatx6CCbE
 Q6rLwsOnXcpFlLC3Z4Pd0YGSGjx3dwLx3CsbbUOrCA72v94869xACFtIA
 MXf+207r55R8NQpTCD3l12AbbHBCGSTx56KhXV2yD+Sq5qXTu1LwaEUZC
 GfO56ffLVMUW/PgAvLYUtoQSipd6cfM5okkeIzsZaPCktNlapUxSC3wTe Q==;
X-CSE-ConnectionGUID: e+zTpBbCSnGyUhqb5lvbbg==
X-CSE-MsgGUID: gCw2alK8QqOtKk4mxYupKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84671923"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="84671923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 08:47:14 -0800
X-CSE-ConnectionGUID: j1GALqVcRDW5xGdvQZymkA==
X-CSE-MsgGUID: L67ejmR2TNW5F2Q9VmXC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="200450356"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.162])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 08:47:13 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/hw_engine_group: Add stats for mode switching
Date: Tue,  9 Dec 2025 17:46:25 +0100
Message-ID: <20251209164625.228826-1-francois.dugast@intel.com>
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

The GT stats interface is extended to include counters of how many jobs
are either interrupted or waited on in the hardware engine groups. This
can help application debugging.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c        | 4 ++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h  | 2 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 5f74706bab81..edb18582e0f4 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -66,6 +66,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_4K_BIND_US, "svm_4K_bind_us"),
 	DEF_STAT_STR(SVM_64K_BIND_US, "svm_64K_bind_us"),
 	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT,
+		     "hw_engine_group_suspend_lr_job_count"),
+	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT,
+		     "hw_engine_group_wait_dma_job_count"),
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index d8348a8de2e1..826727eac485 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -44,6 +44,8 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_4K_BIND_US,
 	XE_GT_STATS_ID_SVM_64K_BIND_US,
 	XE_GT_STATS_ID_SVM_2M_BIND_US,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT,
+	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fa4db5f23342..47a9d1af7d81 100644
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
 
+		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT, 1);
 		need_resume = true;
 		q->ops->suspend(q);
 	}
@@ -244,6 +246,7 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 		if (xe_vm_in_lr_mode(q->vm))
 			continue;
 
+		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT, 1);
 		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
 		timeout = dma_fence_wait(fence, false);
 		dma_fence_put(fence);
-- 
2.43.0

