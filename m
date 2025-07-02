Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB7EC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B710E7BA;
	Wed,  2 Jul 2025 23:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cubY4D1+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF13110E0D1
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499643; x=1783035643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6AVnW6IXXOEYf6AyB21tKWE6rHM1+RwMlVsBm5Cwx7M=;
 b=cubY4D1+8WNtGkuHfX3cDGUymtcAGp2HCM2FdVtlZtZBcfUF+jx/HEE3
 xwaKtd8dJoHmdNdKYGY188fqHkjtmmzBfq3vWBzneQGoNzQYTMa73xCHP
 ARICbLy637WfG/LkuTc3fNL+9FXtwxlpcgWc9r+3CylIh5Qij/pPqm7QP
 UChPL21S0YgGrae53+rQCg8zw9NC7jZ4t/iEEioLRk9uTehMAnrrlNcPt
 /kLqTqc6/Bjr6ektdYgs5fn1tlGgMYJ8m4u5F5Lh26RJdjhvc581OE4Hh
 uvPjazHWjgJuFMjFf1OS3q8dDa3HhBrlkT44crRHftRsU/UNSd6kKwZHo w==;
X-CSE-ConnectionGUID: 8t7Q2GTYQAaixXv4dGBcDg==
X-CSE-MsgGUID: yL9q5KvWSKuTk53nhOrmJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489473"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: BmcygBJYSW2LfOOGAgAZ7w==
X-CSE-MsgGUID: BG46/jPeSS2Ya6A6AAtW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624532"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 4/9] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Date: Wed,  2 Jul 2025 16:42:17 -0700
Message-Id: <20250702234222.3278264-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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

No sense to schedule GT TLB invalidation jobs in parallel which target
the same given these all contend on the same lock, create ordered
workqueue for GT TLB invalidation jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_types.h            | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 6088df8e159c..f6f32600e8a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "xe_gt_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
@@ -123,6 +125,12 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
+	gt->tlb_invalidation.job_wq =
+		drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-tbl-inval-job-wq",
+					     WQ_MEM_RECLAIM);
+	if (IS_ERR(gt->tlb_invalidation.job_wq))
+		return PTR_ERR(gt->tlb_invalidation.job_wq);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 96344c604726..dfd4a16da5f0 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -210,6 +210,8 @@ struct xe_gt {
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
+		/** @wtlb_invalidation.wq: schedules GT TLB invalidation jobs */
+		struct workqueue_struct *job_wq;
 		/** @tlb_invalidation.lock: protects TLB invalidation fences */
 		spinlock_t lock;
 	} tlb_invalidation;
-- 
2.34.1

