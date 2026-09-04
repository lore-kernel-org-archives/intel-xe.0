Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E62C79F85
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE85310FB45;
	Fri,  4 Sep 2026 21:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdATTqWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA210E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556582; x=1820092582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=acMpTrlBaqzeuP+7ZtN8GeOvlWQJHPRndgrJCEFM3hg=;
 b=EdATTqWwQ2evp3w/EgXEPXNXqfeBToK2Gd4G2jI7hdpapqnHJyX22+dz
 faVAcwvsYE+W8FNRwgt3J0POoHT0kczFqRmZ7R9uApPQkgihX8KPxDO8T
 xy+S3FMMLQ3qdE4u1+y06bXc+ANpEMJZlKbchomGwC9TS9ptD6RIz+0OH
 RmZ7f5abdRvJ4u6Cu6uF8tkF5T3gj1nKTswULuI02ZAyDEtsV2n0OSduY
 jHcwmaY8J/c0BiaSbeQm/wIij/e88nLYd4egm0sST/TNXKpe1rLb8DJwd
 mJHHdc0JGkQepFjhsVWaWS+MRMH/5R3oZTJQR9BCOJR8YgyCHf3iNEQZ4 A==;
X-CSE-ConnectionGUID: sqELDW0oT6+DIDEE8knc/Q==
X-CSE-MsgGUID: Qk+p6xIWRNCaidszAzQflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096818"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
X-CSE-ConnectionGUID: Jd9CN8cwTI60pe2tr6CeiQ==
X-CSE-MsgGUID: ZFnZvDTyRfKvAToQyd6jSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563441"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Fri,  4 Sep 2026 14:16:10 -0700
Message-Id: <20260904211613.3934307-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5e3e911a397b..a83360fcbbf3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1189,9 +1189,10 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -1208,6 +1209,9 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (exec_queue_suspended(q))
 		return;
 
+	if (xe_sched_job_ulls_is_chained(job))
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+
 	if (!exec_queue_enabled(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1221,13 +1225,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -2098,6 +2103,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -2137,8 +2143,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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

