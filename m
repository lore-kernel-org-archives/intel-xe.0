Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CEEC87FCC
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 20:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CCE10E719;
	Tue, 22 Jul 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbdPIqnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3CF10E70F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753215734; x=1784751734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iM/lr0GP/F3EiKHsKkctN8jFgi0CGOdg52wXFj6OK20=;
 b=bbdPIqnKFZ2lej3WeBwxauFVkylShbLvt47RzSbzIwL5RUQ54Sig/oAx
 KpNFT5crexUdcTTBnA3/BqieR01r2epBEr+i/NGWjL+d4Uv+oULWeLXFl
 NqUZz7zZLfjforYfiIG6qDAJOUdOH40Qcgk99zPaMCf5Rj3AJydernQUm
 3yg5pVg0y6BW2ghTRhOtrZrsjY5s4BzJvL4gdXXvyUMWpIbFVxeZmv7CX
 zXzGAXwxmaMjvfefwUQMtT/yXB1017R0S/o274fulj46hewMZ5LpkVPMc
 gdWxPwwFBm1Mw8MZEaTvU/DAognCji2AnPjej3cddOxYcYsXwmsthr+UO w==;
X-CSE-ConnectionGUID: fuqYSmMtQ+aqM9RdliPW0w==
X-CSE-MsgGUID: J0Qdsr0bSEuOJtDeXKfkNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58098051"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="58098051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:13 -0700
X-CSE-ConnectionGUID: EgMi1wgyQ8qNVltiFPeWIQ==
X-CSE-MsgGUID: M/EzbcZ3Q1CatbE37ZjLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="182947258"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 3/7] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Date: Tue, 22 Jul 2025 13:23:53 -0700
Message-Id: <20250722202357.3718853-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722202357.3718853-1-matthew.brost@intel.com>
References: <20250722202357.3718853-1-matthew.brost@intel.com>
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
the same GT given these all contend on the same lock, create ordered
workqueue for GT TLB invalidation jobs.

v3:
 - Fix type in commmit message (Stuart)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_types.h            | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 086c12ee3d9d..02f0bb92d6e0 100644
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

