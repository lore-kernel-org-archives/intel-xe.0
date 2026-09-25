Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE718C9832F
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5908810F869;
	Fri, 25 Sep 2026 04:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfOqMjjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36C210F85A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312013; x=1821848013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUhSPOY/FgVvJ4pRM0W+XvSXV2j3rCcq34Azb4amuyY=;
 b=HfOqMjjIfFdUuzKUN0ayNz25dKYSU+YzFZhteF9lLSsyvQaq43S4Kb+B
 m6um87IPGxThR03QgD6DHn9K1J1ooofUNXuOoUdUM+j41LS8K+T8FatSg
 5N6Ncdt4tLq/8e5bDGXHmAO28MRUNrtxS+nFen+l9ruZHBsL9ioBosriv
 Kxan1M/SBQFtigj+5LVhUvSYfhdr5PNGDzYcCs6dRvEUpCQknrgHUWA7o
 j1jea7o3QouDCfoihZkjSrFWkHwY1JdNn5h7UiNWaaTC6rLlUSYDZmHDc
 AV26UmG+aemUE2/hitsK+Rx+HUgfzlwVeL+E8iRpZUMAMsEUvWQL4InMx A==;
X-CSE-ConnectionGUID: jKSYKbvVRjeN/VqRjUEbpA==
X-CSE-MsgGUID: fLqBDYrQQYSD30FvJ3J+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156235"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:28 -0700
X-CSE-ConnectionGUID: WN0yC0qMR6KUE4Wxi0aWfQ==
X-CSE-MsgGUID: erctRAr7S+CArlGTvGZCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155549"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v7 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Thu, 24 Sep 2026 21:53:17 -0700
Message-Id: <20260925045320.1325860-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

Add ULLS migration job support to GuC submission backend.

Changes required:
- On migration queue, reduce max jobs to the number of ULLS semaphores
  minus one
- Skip writing the saved ring tail for ULLS jobs except for the first
  ULLS job - the ring updates both the saved tail and the tail register
  itself
- Set ULLS sempahore for current job releasing last job except for first
  ULLS job
- Suppress submit H2G for ULLS except for first ULLS job

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a2784763e72b..cd9bb9f9e28c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1190,9 +1190,10 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
 	if (!job->restore_replay || job->last_replay) {
+		/* A ULLS job past the first publishes its own ring tail */
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
-		else
+		else if (!xe_sched_job_ulls_is_chained(job))
 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 		job->last_replay = false;
 	}
@@ -1209,6 +1210,9 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (exec_queue_suspended(q))
 		return;
 
+	if (xe_sched_job_ulls_is_chained(job))
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+
 	if (!exec_queue_enabled(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1222,13 +1226,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 		set_exec_queue_pending_enable(q);
 		set_exec_queue_enabled(q);
 		trace_xe_exec_queue_scheduling_enable(q);
-	} else {
+	} else if (!xe_sched_job_ulls_is_chained(job)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT;
 		action[len++] = q->guc->id;
 		trace_xe_exec_queue_submit(q);
 	}
 
-	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
+	if (!xe_sched_job_ulls_is_chained(job) || num_g2h)
+		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
 
 	if (extra_submit) {
 		len = 0;
@@ -2100,6 +2105,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -2139,8 +2145,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		submit_wq = primary->guc->sched.base.submit_wq;
 	}
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION)
+		max_jobs = min(max_jobs, LRC_MIGRATION_ULLS_SEMAPHORE_COUNT - 1);
+
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    ge->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.34.1

