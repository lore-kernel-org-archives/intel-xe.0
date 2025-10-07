Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B572CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCA010E67E;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MukddcG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C610E674
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842316; x=1791378316;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CyjJRfNMe3/WIC0kprPv7WG+Bt+u/QP1RDnVJ9NtFwk=;
 b=MukddcG4IuxsBVxesY88nql/rLP9xBOnz0qw/IKqFy/aqowWbZsAezoe
 //Zxl0UQrZdhUrrfLAFnrrH4HrqVZaPYa0pdcio77SLLgGZiq5FJljHar
 rrjwpo5yhXSV56H9AqnvaPf71KdDjVn+nkMxeFCiEWa8wFt4bNvLWF/Ar
 0BuT9o4LKk4vx17HCvB+pCD0uXA2WdHmtaeoe4xuIFRTXLCVxrw0FsAn+
 C6jbV1vBde/O5pfYlYOwWejdDqle6q7tlfNI35HheBwoZ8vpy8BOo6mKX
 d0aJGX64rcRhptcUhLGuKKUUi5ZNwrvbzDy49vY244jW6d43hgLUVEAa0 w==;
X-CSE-ConnectionGUID: +za8SY5XSeWC/r/UVuT/+Q==
X-CSE-MsgGUID: +v7Fo8PiRWmTDL3CF9lWUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639848"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:15 -0700
X-CSE-ConnectionGUID: 2nxQoTFpQAyTPwOiqdwKtA==
X-CSE-MsgGUID: d4KOUy1SS3WviKyjGuptwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576961"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 27/33] drm/xe/vf: Add debug prints for GuC replaying state
 during VF recovery
Date: Tue,  7 Oct 2025 06:04:59 -0700
Message-Id: <20251007130505.2694829-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

Helpful to manually verify the GuC state machine can correctly replay
the state during a VF post-migration recovery. All replay paths have
been manually verified as triggered and working during testing.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be7aa1e89d13..1321064d4f70 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2037,21 +2037,27 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
-static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
+static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
+						       struct xe_exec_queue *q)
 {
 	bool pending_enable, pending_disable, pending_resume;
 
 	pending_enable = exec_queue_pending_enable(q);
 	pending_resume = exec_queue_pending_resume(q);
 
-	if (pending_enable && pending_resume)
+	if (pending_enable && pending_resume) {
 		q->guc->needs_resume = true;
+		xe_gt_dbg(guc_to_gt(guc), "Replay RESUME - guc_id=%d",
+			  q->guc->id);
+	}
 
 	if (pending_enable && !pending_resume &&
 	    !exec_queue_pending_tdr_exit(q)) {
 		clear_exec_queue_registered(q);
 		if (xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (pending_enable) {
@@ -2059,6 +2065,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		clear_exec_queue_pending_resume(q);
 		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
@@ -2068,6 +2076,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		else
 			q->guc->needs_cleanup = true;
 		clear_exec_queue_extra_ref(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
+			  q->guc->id);
 	}
 
 	pending_disable = exec_queue_pending_disable(q);
@@ -2075,6 +2085,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 	if (pending_disable && exec_queue_suspended(q)) {
 		clear_exec_queue_suspended(q);
 		q->guc->needs_suspend = true;
+		xe_gt_dbg(guc_to_gt(guc), "Replay SUSPEND - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (pending_disable) {
@@ -2082,6 +2094,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
 		clear_exec_queue_check_timeout(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	q->guc->resume_time = 0;
@@ -2107,7 +2121,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	else
 		cancel_delayed_work_sync(&sched->base.work_tdr);
 
-	guc_exec_queue_revert_pending_state_change(q);
+	guc_exec_queue_revert_pending_state_change(guc, q);
 
 	if (xe_exec_queue_is_parallel(q)) {
 		struct xe_device *xe = guc_to_xe(guc);
@@ -2222,6 +2236,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	list_for_each_entry(s_job, &sched->base.pending_list, list) {
 		job = to_xe_sched_job(s_job);
 
+		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
+			  q->guc->id, xe_sched_job_seqno(job));
+
 		q->ring_ops->emit_job(job);
 		job->skip_emit = true;
 	}
-- 
2.34.1

