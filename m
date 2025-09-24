Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EE8CAC5AC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEB110E697;
	Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzCIdxfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E9310E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676572; x=1790212572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m9r2dzeJCZcTP1IDpJhEKa6uOtSbEyofiA7K2Slvi7Y=;
 b=HzCIdxfFM6AC7UVZ1IOr6Kz7McOYBVKfojNJz/R+XIUC05mN3+jvjskI
 ig6ez2PbKXIkRUKfUSyMFriI4w089GE77GVYGeWYsCcU81F1M1tQeu13K
 lyxBNSZKaXsEdk4W+i8uKZzeUS+M59lH3JZTafznx1oSC2quRZpsRW4Tt
 jPpi/A9vfXHKMul/X7kdbocxB/oZ8E+qUzL/EnJMYJCZENoTqZHzpzf3e
 d5+0v6SfNHQg/00txhBCwrBonE4R1d6VMNZfsX1ZiuO0bTr+s9AI2YYBg
 mrzXXOZHvk7BN6YSFUVMaJACB7bYZIAmSwWUJ62bMbGKqslOKEHURcjjd Q==;
X-CSE-ConnectionGUID: 4LHrOURzS3GDk9Baxy4gnQ==
X-CSE-MsgGUID: Xof2ytAxRAm3BoxgitEANg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908283"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908283"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:11 -0700
X-CSE-ConnectionGUID: t6zrae/bRgiJPNB4xXm6tg==
X-CSE-MsgGUID: cCTTnQrGTaGYLpqSQPjaSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841809"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 28/34] drm/xe/vf: Add debug prints for GuC replaying state
 during VF recovery
Date: Tue, 23 Sep 2025 18:15:55 -0700
Message-Id: <20250924011601.888293-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f01f2d6f97ed..496cd1f2d83f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2316,14 +2316,19 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
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
@@ -2331,6 +2336,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 		clear_exec_queue_pending_resume(q);
 		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
@@ -2340,6 +2347,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 		else
 			q->guc->needs_cleanup = true;
 		clear_exec_queue_extra_ref(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
+			  q->guc->id);
 	}
 
 	pending_disable = exec_queue_pending_disable(q);
@@ -2347,6 +2356,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	if (pending_disable && exec_queue_suspended(q)) {
 		clear_exec_queue_suspended(q);
 		q->guc->needs_suspend = true;
+		xe_gt_dbg(guc_to_gt(guc), "Replay SUSPEND - guc_id=%d",
+			  q->guc->id);
 	}
 
 	if (pending_disable) {
@@ -2354,6 +2365,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
 		clear_exec_queue_check_timeout(q);
+		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
+			  q->guc->id);
 	}
 
 	q->guc->resume_time = 0;
@@ -2452,6 +2465,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
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

