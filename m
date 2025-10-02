Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484F5CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8C10E791;
	Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFVDV2eJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0244210E788
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384448; x=1790920448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ipoIzRH7gt3sPRHj5QeBROa8vy2uJ9eK2Q2ZBAf9jJg=;
 b=AFVDV2eJb0evEQh1onPVsbAJmGhhri9lSgmjHSDmVqd4okJhFeuoEDVI
 CfUTDMfVRw37MC6SNyuVVYJ+yPaSSLHrHmtOIcHJ9/uKynBLUhLWJNAuz
 +FISBbkF/UBB6UUWHdAVAyrRg1ZJX6qp281Xxa12WwEls2Ygg7vXjX5VY
 GCo3laWPDUrL84VeU3M0ZoZtZB2uWeQqit2IVQwQS7T7SsR8PfzWX0jmm
 yCeU9KABGpZYZIQIxXN55+xHC38nEJDqzmnEaQvXDi2KOLlg38/qACmrZ
 2bR1eI4xxoBKp8KZ+6vLrJ4BVCrXBj6lTHGUTgkF051hRVBvoqP0u1h9T w==;
X-CSE-ConnectionGUID: rvucftwZSUaJYs58tHYYew==
X-CSE-MsgGUID: E3lTWNJnQXuSH0z19gv6+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304499"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: 2lU0lH2fQGusQcOwapf7Cg==
X-CSE-MsgGUID: xw7AHA00THevIdmCJBaCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083529"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 06/34] drm/xe/guc: Track pending-enable source in
 submission state
Date: Wed,  1 Oct 2025 22:53:34 -0700
Message-Id: <20251002055402.1865880-7-matthew.brost@intel.com>
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

Add explicit tracking in the GuC submission state to record the source
of a pending enable (TDR vs. queue resume path vs. submission).
Disambiguating the origin lets the GuC submission state machine apply
the correct recovery/replay behavior.

This helps VF restore: when the device comes back, the state machine knows
whether the pending enable stems from timeout recovery, from a queue resume
sequence, or submission and can gate sequencing and fixups accordingly.

v4:
 - Clarify commit message (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 16f78376f196..13746f32b231 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -69,6 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -220,6 +222,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
 }
 
+static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
+}
+
+static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
+}
+
+static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
+}
+
+static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
+}
+
+static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
+}
+
+static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -1334,6 +1366,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_RESET;
 
 sched_enable:
+	set_exec_queue_pending_tdr_exit(q);
 	enable_scheduling(q);
 rearm:
 	/*
@@ -1493,6 +1526,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 		clear_exec_queue_suspended(q);
 		if (!exec_queue_enabled(q)) {
 			q->guc->resume_time = RESUME_PENDING;
+			set_exec_queue_pending_resume(q);
 			enable_scheduling(q);
 		}
 	} else {
@@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
 
 		q->guc->resume_time = ktime_get();
+		clear_exec_queue_pending_resume(q);
+		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
-- 
2.34.1

