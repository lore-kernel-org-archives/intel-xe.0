Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22B0CCA470
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038FD10E211;
	Mon, 29 Sep 2025 02:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJSCQ6r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1CD10E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114553; x=1790650553;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=quF1elZpUMGcmbFWpeQaE+pBdzf43NJ/TDoY/6BCcXQ=;
 b=LJSCQ6r9A+P5xqXbjXjOG0FyzHHAGjYRDWMFVPGU3XkB1T/4TrDXEd3j
 /JwiAsZR4XxCvLbIyPpQGEx5N8RFGpS22eFovh/E2t6H8pQWkbT77wwsd
 tZADo7LNKan4zSqqn0IoTeSs97GabzaF484XpWuh7MkD99BV4uhyZpJM5
 +/DqawyNqNgM+w8f+2iU1te8PpGg53q+MemefepC52hFDoHoOrfngx+mD
 3Ftc9Akqwemyg2XYr8+u+aZzVc9lzVvfg7EaMUeJ6A/AHAqDkkdHydVyW
 LpEo14akAUOXQDZSWBLuAiVrirwdxxMuAlMvJbSceI2RVA0YgAUiND4VA w==;
X-CSE-ConnectionGUID: 7R0PEmHUTYC5MtdolTog5w==
X-CSE-MsgGUID: P1uzjTMPS6KKDNULoJ3QZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398546"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:52 -0700
X-CSE-ConnectionGUID: RiwiJy3CR2O4FsctD8zEDw==
X-CSE-MsgGUID: R8hY7dT/SHePf+6V3F5CHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529280"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 30/36] drm/xe/vf: Add debug prints for GuC replaying state
 during VF recovery
Date: Sun, 28 Sep 2025 19:55:36 -0700
Message-Id: <20250929025542.1486303-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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

