Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760BDCCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 20:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA2110E0A8;
	Fri, 31 Oct 2025 20:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7qrJbYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CF410E0A8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 20:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761941630; x=1793477630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IIiwxRvKwSNkPUY5bd9K72JAQXT+4lXfGascLFpNuxk=;
 b=h7qrJbYudaaTRrXqQnYL7xtA5o+TQYLI95u1E5h25N87OtwB1oLcTGts
 0U15XG8hzdww+3t7YDnSiAwG2Bi21cmERL4rERK95hvIdXFYSpxlI9PY8
 oer4kLmXUivSgukbXA97/+eKxN6yJnag8aCwifHZcISIrzcJjZ/yNHKDv
 5HYLir4SxSYM7zQDlayYY8Jn5Owq5F6e5YSbAL/Y/y3YhWSzpQZzpjnIi
 cJgPLkYAuAGLyYcGISCAt+kVhXt+9ZFhMr1Cw4HRMI05v6vMar7SV14k+
 np8nEdiKjPp8waeb6KMFgVI+gFkmffdcjxvuVlwesNjEgbVfqnaq4J1rT A==;
X-CSE-ConnectionGUID: G9PaKC5VQjaDD5H0s6N5fw==
X-CSE-MsgGUID: 2k5wq87/QFeZ2x2S3eWbYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="66725628"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="66725628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:13:50 -0700
X-CSE-ConnectionGUID: b97RbPyvQNWoD1tMTH8iiA==
X-CSE-MsgGUID: KThodHwARdqe66t6embyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190667219"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:13:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled job
 during VF migration
Date: Fri, 31 Oct 2025 13:13:45 -0700
Message-Id: <20251031201345.3015516-1-matthew.brost@intel.com>
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

Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
 drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 9955397aaaa9..357afaec68d7 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
+	bool skip_emit = false;
 
 	list_for_each_entry(s_job, &sched->base.pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 		struct dma_fence *hw_fence = s_fence->parent;
 
-		if (to_xe_sched_job(s_job)->skip_emit ||
-		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
+		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
+		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))
 			sched->base.ops->run_job(s_job);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..f25b71aca498 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	job = xe_sched_first_pending_job(sched);
 	if (job) {
+		job->skip_emit = true;
+
 		/*
 		 * Adjust software tail so jobs submitted overwrite previous
 		 * position in ring buffer with new GGTT addresses.
@@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct drm_sched_job *s_job;
 	struct xe_sched_job *job = NULL;
+	bool skip_emit = false;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		job = to_xe_sched_job(s_job);
-
-		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
-			  q->guc->id, xe_sched_job_seqno(job));
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		skip_emit |= job->skip_emit;
+		if (skip_emit) {
+			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
+				  q->guc->id, xe_sched_job_seqno(job));
 
-		q->ring_ops->emit_job(job);
-		job->skip_emit = true;
+			q->ring_ops->emit_job(job);
+			job->skip_emit = true;
+		}
 	}
 
 	if (job)
-- 
2.34.1

