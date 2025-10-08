Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE653CCD187
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D7F10E8EA;
	Wed,  8 Oct 2025 21:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eq68HRDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2498B10E8EE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959943; x=1791495943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=f365S2IOZHH1dw1MKpl2Gac2FLYR/gD9Dq6XbHIKQwQ=;
 b=Eq68HRDGntqf/A/a+hl5YtE2+zFUYCPpAD7X+p27PlDW5+LKD5CFyCY7
 fOm88EsePZWPJH6W7c9GLjcTLlKxmx2nhAyXad4dIpdH5T5cptgw1gGpy
 cQtIWas1P2b/CigNZiaNMu0zlrL7by0NmWXaFijNXl32LK911sDy5VE0u
 rV6AUq45fgtH95nf11Hj3Z87Er7qTYKoMzKj9GCnKxf+pKrzbUFY5ptfK
 ezBe64izHe4PBdo7M5PVpgU9kgw2UIuM1gkJr8Q6X3hbFowFIZ/Hl8jST
 l5Eo8Xs+yk1DNeV1cZoeisFhSWZWOAnCh1akqAQWGTU7vT4jXru8nQSyl g==;
X-CSE-ConnectionGUID: W69YEKqKT8W1eJGBtPNICQ==
X-CSE-MsgGUID: VjBpAqwOR1qU4hKINwv4Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726874"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:43 -0700
X-CSE-ConnectionGUID: YHcB99xfT6ysCFeQyyZ83Q==
X-CSE-MsgGUID: 8J4ZSV+FR9S7JsOkPH48Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635212"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 28/34] drm/xe/vf: Add debug prints for GuC replaying state
 during VF recovery
Date: Wed,  8 Oct 2025 14:45:26 -0700
Message-Id: <20251008214532.3442967-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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
index b4c09604c5ea..e9aa0625ce60 100644
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

