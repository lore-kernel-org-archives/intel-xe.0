Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC0C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F8410E02E;
	Thu, 24 Jul 2025 19:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSrXdg84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E9B10E29D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753384232; x=1784920232;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iM/lr0GP/F3EiKHsKkctN8jFgi0CGOdg52wXFj6OK20=;
 b=DSrXdg84aLdvSsIeDzgIWwep3C9hsCa/Tk8BEuq3LwTF1+ej0G1vZcvu
 CVEdThgpHm7JaWg0FPQm50IooFav+HkV8ACU+Xe5Wt0QiDcrT4G6lk56A
 7DFa1/ygEtcaxtw9+I0M6Xkice/vIUmmp3RyQ2kzqv0yHrd4woCuxJP83
 m7ftxgiTs/YkHlCWJBmti/OJPV4omim1kd7PhLlwbora48iqnlL2paWFN
 CR9fa6WnUr9xcDxaSIdk9/9zpMcWybcCwdlXVgMFNNBdNrODiS7h8wBgG
 wtO+RHwJN9PeK48UwcFwGSurRARPdYZm0ZN7ARUV2O4mZUgqiO+G8OWrv g==;
X-CSE-ConnectionGUID: XamnWo2yREujKhboACIpQw==
X-CSE-MsgGUID: NIvA0ciYQ7qHfR5Aue5mzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65976727"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="65976727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:31 -0700
X-CSE-ConnectionGUID: Y0dHyyDOTxOlWOrjqg/lXA==
X-CSE-MsgGUID: yD0txfmHSQ21+P73XHRgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160387667"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/7] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Date: Thu, 24 Jul 2025 12:12:12 -0700
Message-Id: <20250724191216.4076566-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
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

