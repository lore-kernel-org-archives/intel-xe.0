Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C6DCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8E410E795;
	Thu,  2 Oct 2025 05:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qf/mmJWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF0410E79A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=quF1elZpUMGcmbFWpeQaE+pBdzf43NJ/TDoY/6BCcXQ=;
 b=Qf/mmJWO1rxwGh6kro7nR64ethSDUSHHEtWf9LNZEjpUcUM/PuLWryAQ
 JAdbBHWjAzJMMVR1SImdH9/2yPXowx4HQGDOInP+gWZ0ymIQ6u0E0x1W3
 +HN6O1Ptu9ghK8jKZB8iTX8CuBJrIG4ARHWvyuS7OpBfYvhpvamRIsQdD
 M5X/eF6jHMYbuXA8MiIapMedxbH5xaidaY8R6HT7CmkaLONjRrzLcJYq6
 NdshW9ng6Y+OlUEQQnf8FX4B5YlvWvqxsb5wMnx58IE+MFyBwotmtaZvi
 qHUsn/toXt4WLbiU8hW89YrBTVzR3Uw+74wBy9Ltt9B2/NsecH4fj7hhE g==;
X-CSE-ConnectionGUID: TQI+DhPYQzK1gBKonUF4ng==
X-CSE-MsgGUID: lBftjxoHRRmwXRHhy+Ryjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304522"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: yHzeXVNDTcKAbLcsmXmYrg==
X-CSE-MsgGUID: 5xPt2gt5QQqXWchfnH6YkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083554"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 28/34] drm/xe/vf: Add debug prints for GuC replaying state
 during VF recovery
Date: Wed,  1 Oct 2025 22:53:56 -0700
Message-Id: <20251002055402.1865880-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7fe3fb07e35e..bc717403740c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2306,21 +2306,27 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
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
@@ -2328,6 +2334,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		clear_exec_queue_pending_resume(q);
 		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
@@ -2337,6 +2345,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		else
 			q->guc->needs_cleanup = true;
 		clear_exec_queue_extra_ref(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
+			  q->guc->id);
 	}
 
 	pending_disable = exec_queue_pending_disable(q);
@@ -2344,6 +2354,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 	if (pending_disable && exec_queue_suspended(q)) {
 		clear_exec_queue_suspended(q);
 		q->guc->needs_suspend = true;
+		xe_gt_dbg(guc_to_gt(guc), "Replay SUSPEND - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (pending_disable) {
@@ -2351,6 +2363,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
 		clear_exec_queue_check_timeout(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	q->guc->resume_time = 0;
@@ -2376,7 +2390,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	else
 		cancel_delayed_work_sync(&sched->base.work_tdr);
 
-	guc_exec_queue_revert_pending_state_change(q);
+	guc_exec_queue_revert_pending_state_change(guc, q);
 
 	if (xe_exec_queue_is_parallel(q)) {
 		struct xe_device *xe = guc_to_xe(guc);
@@ -2478,6 +2492,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
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

