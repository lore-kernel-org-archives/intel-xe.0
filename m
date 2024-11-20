Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C4FD743ED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0410E3F5;
	Wed, 20 Nov 2024 23:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKjg0wkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B669410E3F5
 for <Intel-Xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732144978; x=1763680978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ETFYQNeoXbvJ1z2TaBz9w9DpyTiISXWoMKB+hlZYPk=;
 b=WKjg0wkt8VyPdef71wL734HFrwbOYfrRNAUQweybrHgJBeGrGRNpBfko
 5enSfJTyOzO+DopXDV4+k4+djHZKkXL042ckML2fgyjPWJn0kOBmW/te9
 vvKY6AZmBaEmmMLeIa+ziovJ6PDOJqDZ3poJm3TZ+rI+hwM7qsM4JUp5h
 +eGTnruh8tHpmntUwLHEsa4/dVoH31VmDTDLsb8BJ5g4zB0Tth2a2wOqa
 GWaaRz5CZf4fLhDEP4vebBCwHL5qJlEQ3wd3ytEn3jYGrd7ejPHOzeiSQ
 gnkRs4jmptLdxfSESGGIkmJzEiEUba6k17O+8rsSdA31jdmWAPxnm+mLh w==;
X-CSE-ConnectionGUID: m1XOcuZlRmiqr46VgpOTZw==
X-CSE-MsgGUID: kJHFV1+OSrKz5BgEfDW5aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32481210"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="32481210"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:22:58 -0800
X-CSE-ConnectionGUID: 0bnmSvwNSZ2PaoVqcO6CYg==
X-CSE-MsgGUID: 14pyvo6LRIWM+eFyUio8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90863996"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 15:22:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe: Add a reason string to the devcoredump
Date: Wed, 20 Nov 2024 15:22:56 -0800
Message-ID: <20241120232257.1025282-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are debug level prints giving more information about the cause
of the hang immediately before core dumps are created. However, not
everyone has debug level prints enabled or saves the dmesg log at all.
So include that information in the dump file itself. Also, at least
one of those prints included the pid as well as the process name. So
include that in the capture too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 20 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 +++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++++++----
 4 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0e5edf14a241..b5aebe8fb06d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -99,6 +99,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	p = drm_coredump_printer(&iter);
 
 	drm_puts(&p, "**** Xe Device Coredump ****\n");
+	drm_printf(&p, "Reason: %s\n", ss->reason);
 	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
 	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
 
@@ -106,7 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
-	drm_printf(&p, "Process: %s\n", ss->process_name);
+	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
@@ -138,6 +139,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 {
 	int i;
 
+	kvfree(ss->reason);
+	ss->reason = NULL;
+
 	xe_guc_log_snapshot_free(ss->guc.log);
 	ss->guc.log = NULL;
 
@@ -253,8 +257,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
-	if (q->vm && q->vm->xef)
+	if (q->vm && q->vm->xef) {
 		process_name = q->vm->xef->process_name;
+		ss->pid = q->vm->xef->pid;
+	}
+
 	strscpy(ss->process_name, process_name);
 
 	ss->gt = q->gt;
@@ -297,10 +304,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
  * gt_reset. It is skipped if we still have the core dump device available
  * with the information of the 'first' snapshot.
  */
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
+__printf(3, 4)
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
+	va_list varg;
 
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
@@ -308,6 +317,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
 	}
 
 	coredump->captured = true;
+
+	va_start(varg, fmt);
+	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
+	va_end(varg);
+
 	devcoredump_snapshot(coredump, q, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index c04a534e3384..6a17e6d60102 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -14,11 +14,12 @@ struct xe_exec_queue;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
 int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_exec_queue *q,
-				  struct xe_sched_job *job)
+				  struct xe_sched_job *job,
+				  const char *fmt, ...)
 {
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index be4d59ea9ac8..e6234e887102 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -28,6 +28,10 @@ struct xe_devcoredump_snapshot {
 	ktime_t boot_time;
 	/** @process_name: Name of process that triggered this gpu hang */
 	char process_name[TASK_COMM_LEN];
+	/** @pid: Process id of process that triggered this gpu hang */
+	pid_t pid;
+	/** @reason: The reason the coredump was triggered */
+	char *reason;
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e132294fde51..7d0e7cb977ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -898,7 +898,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		if (!ret) {
 			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
 				   q->guc->id);
-			xe_devcoredump(q, NULL);
+			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
+				       q->guc->id);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
@@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	}
 
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
-		xe_devcoredump(q, NULL);
+		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
 
 	xe_sched_submission_start(sched);
 }
@@ -1132,7 +1133,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 				xe_gt_warn(guc_to_gt(guc),
 					   "Schedule disable failed to respond, guc_id=%d",
 					   q->guc->id);
-			xe_devcoredump(q, job);
+			xe_devcoredump(q, job,
+				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
+				       q->guc->id, ret, xe_guc_read_stopped(guc));
 			set_exec_queue_extra_ref(q);
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
@@ -1162,7 +1165,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(q, job);
+		xe_devcoredump(q, job,
+			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
+			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			       q->guc->id, q->flags);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
-- 
2.47.0

