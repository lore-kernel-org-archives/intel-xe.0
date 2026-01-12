Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B8CCF45DD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A35D10E43C;
	Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XI/Kmrsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3910E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260456; x=1799796456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YCDV+uw3dmBSM2JwmPTSQUN8Tl9YjirnSysgLse3fUg=;
 b=XI/KmrsdFFlPCM709BqGjwOy9az9U5Verykgp1CDWRENiAEORIlbpA3K
 NFdJzDmTtt16+anr4QMyyoedR3Adioa3eYfzl4msFEkLCGfLkjdbpNQZn
 HqtYYgDZgoML2sK2aWZjqffqAj53xb5Q9zxJkca0bOmGgB+zFKBZI+i/R
 QfE7uH57/AUhCP9SyMUUapNb0iV10YU+1Ke3EauUhlzeouDHxhKe8CQzz
 yFqPv3rpV4JPfaW4FoTrupzCram3wAoRj4JijgIbcthI0KNJ/xsqEEU8/
 Ys0hn1GhFPokugt5mQeknK7b5l5dMD8rYcCCJk1yrOewkc9VfAUPqJOlp A==;
X-CSE-ConnectionGUID: vZxF2xCBSDCraxY8m0Vz6g==
X-CSE-MsgGUID: 9p1FESfnTkW+o/cqEB/7HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594768"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
X-CSE-ConnectionGUID: yGScU8aiQbWBVgkV+79MHg==
X-CSE-MsgGUID: 1unR4fc1Qc2o2YOTMjjUJQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 05/11] drm/xe: Taint TLB invalidation seqno lock with
 GFP_KERNEL
Date: Mon, 12 Jan 2026 15:27:24 -0800
Message-Id: <20260112232730.3347414-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Taint TLB invalidation seqno lock with GFP_KERNEL as TLB invalidations
can be in the path of reclaim (e.g., MMU notifiers).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index dec042248164..014a78502fe5 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -114,6 +114,16 @@ static void tlb_inval_fini(struct drm_device *drm, void *arg)
 	xe_tlb_inval_reset(tlb_inval);
 }
 
+static void primelockdep(struct xe_tlb_inval *tlb_inval)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&tlb_inval->seqno_lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_gt_tlb_inval_init - Initialize TLB invalidation state
  * @gt: GT structure
@@ -140,6 +150,8 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	primelockdep(tlb_inval);
+
 	tlb_inval->job_wq = drmm_alloc_ordered_workqueue(&xe->drm,
 							 "gt-tbl-inval-job-wq",
 							 WQ_MEM_RECLAIM);
-- 
2.34.1

