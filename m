Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0AFCFC28B
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 15:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0739B10E161;
	Fri, 21 Nov 2025 15:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PumpwR2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E310E161
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763738880; x=1795274880;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QOJMawKLfKkoQwijfWwW7CFta/MZA143wTHkN9Kg03A=;
 b=PumpwR2pl0w2E+kvp212c79TJx68qS24eS0ZtmyzkIGYRIUeKfp3SfBu
 Ic2ptJVwgdzLGVnnDLbNQolMYi5Zl9IT2x49qwsxcngIyL5a6ytb3nUoD
 LgKg2yIxMqTNJfZBchfSEQJ+BwbNMeJEosLlILWX/22m6PSRNXpbuyN7T
 gpZyRClL+pwYAnin/tRirGscOOOrJyb+67JIjfbJ+qCbMqm/5kd6nSgnE
 ORG+U/q2uwT/Zt5205RS1Qmd9uIVEO5BWrHGXzyc9QgaNs5rS1v7y0y1H
 iuZn9V2ibjlLt3k2MZA5zH95ppEWapQcdRB5sO2r8/6WnsiMOygSVDrlV Q==;
X-CSE-ConnectionGUID: fTvPxUpiRfSTFZMSzO0m6A==
X-CSE-MsgGUID: 1MqG9a7sQgCWt6AEbn/xqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65532155"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65532155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 07:27:56 -0800
X-CSE-ConnectionGUID: leOWa1X2RymdndvJ/mRRbA==
X-CSE-MsgGUID: gwr9T8iLSNy+macYn01GOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191831437"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 07:27:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/vf: Start re-emission from first unsignaled job during
 VF migration
Date: Fri, 21 Nov 2025 07:27:50 -0800
Message-Id: <20251121152750.240557-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The LRC software ring tail is reset to the first unsignaled pending
job's head.

Fix the re-emission logic to begin submitting from the first unsignaled
job detected, rather than scanning all pending jobs, which can cause
imbalance.

v2:
 - Include missing local changes
v3:
 - s/skip_replay/restore_replay (Tomasz)

Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h   |  5 +++--
 drivers/gpu/drm/xe/xe_guc_submit.c      | 25 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_sched_job_types.h |  4 ++--
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 9955397aaaa9..c7a77a3a9681 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
+	bool restore_replay = false;
 
 	list_for_each_entry(s_job, &sched->base.pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 		struct dma_fence *hw_fence = s_fence->parent;
 
-		if (to_xe_sched_job(s_job)->skip_emit ||
-		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
+		restore_replay |= to_xe_sched_job(s_job)->restore_replay;
+		if (restore_replay || (hw_fence && !dma_fence_is_signaled(hw_fence)))
 			sched->base.ops->run_job(s_job);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e0882074a99..713263497bb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -822,7 +822,7 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
-	if (!job->skip_emit || job->last_replay) {
+	if (!job->restore_replay || job->last_replay) {
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
 		else
@@ -881,10 +881,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		if (!job->skip_emit)
+		if (!job->restore_replay)
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q, job);
-		job->skip_emit = false;
+		job->restore_replay = false;
 	}
 
 	/*
@@ -2147,6 +2147,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	job = xe_sched_first_pending_job(sched);
 	if (job) {
+		job->restore_replay = true;
+
 		/*
 		 * Adjust software tail so jobs submitted overwrite previous
 		 * position in ring buffer with new GGTT addresses.
@@ -2236,17 +2238,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct drm_sched_job *s_job;
 	struct xe_sched_job *job = NULL;
+	bool restore_replay = false;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		job = to_xe_sched_job(s_job);
-
-		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
-			  q->guc->id, xe_sched_job_seqno(job));
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		restore_replay |= job->restore_replay;
+		if (restore_replay) {
+			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
+				  q->guc->id, xe_sched_job_seqno(job));
 
-		q->ring_ops->emit_job(job);
-		job->skip_emit = true;
+			q->ring_ops->emit_job(job);
+			job->restore_replay = true;
+		}
 	}
 
 	if (job)
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index d26612abb4ca..7c4c54fe920a 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -63,8 +63,8 @@ struct xe_sched_job {
 	bool ring_ops_flush_tlb;
 	/** @ggtt: mapped in ggtt. */
 	bool ggtt;
-	/** @skip_emit: skip emitting the job */
-	bool skip_emit;
+	/** @restore_replay: job being replayed for restore */
+	bool restore_replay;
 	/** @last_replay: last job being replayed */
 	bool last_replay;
 	/** @ptrs: per instance pointers. */
-- 
2.34.1

