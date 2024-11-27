Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58E9D609AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99110EA1C;
	Wed, 27 Nov 2024 08:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvuY7apf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7C310EA1C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694999; x=1764230999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kh9KjYXQN8IZsv/J2vcuqgaQr+lUcuNJ3zF90CqB2rk=;
 b=BvuY7apfLx2roE6tZ17hQaEXRkwS3MDKdvGKSr1LYoOfGni9f1FUuVGC
 cWnBPchrI/Kc9XnCvzfI1/cX0HVH7o6khGK+MSStRCC22N5v6zGEGLXbI
 ut8XZqaX0nTrTt857COzwGGx0DLPU7dFG3/KUEiGjx4oWbQ2ydgK8ryKP
 6O6AvHu5eNAiuZ4VPElRPbCTS8UUcpuhKGa8TB5KTeVwhiFrmQl5np4sO
 x+CuNojAJ7+dix9iGqHlJjQMSJVWwJ/aEveWOdPyq4KBlp27oVmhMQ0jj
 tPgWG2sf2GIvADdbM/G2dMtVX5Ad0FrPyBm2bk4Yet6Xc6LhLc+UiUtI+ w==;
X-CSE-ConnectionGUID: qNWcGrypSdaFNDUB5vUYwQ==
X-CSE-MsgGUID: WOXn3PEHTNuNgglQYZmeNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36810252"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36810252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:09:59 -0800
X-CSE-ConnectionGUID: t3E9UFlRSAy0SU3aEy4PDA==
X-CSE-MsgGUID: qCsvAqp8S+aCuri2AVWFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92689715"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 00:09:56 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/3] Revert "drm/xe: Add a reason string to the devcoredump"
Date: Wed, 27 Nov 2024 14:00:42 +0530
Message-Id: <20241127083042.358726-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This reverts commit 06e2cb496396613e583a72a85e0822fb43b2ead5. The commit
was accidentally and unintentionally pushed.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 21 +++------------------
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 ++---
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ----
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++----------
 4 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f4c77f525819..0e5edf14a241 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -99,7 +99,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	p = drm_coredump_printer(&iter);
 
 	drm_puts(&p, "**** Xe Device Coredump ****\n");
-	drm_printf(&p, "Reason: %s\n", ss->reason);
 	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
 	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
 
@@ -107,7 +106,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
-	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
+	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
@@ -139,9 +138,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 {
 	int i;
 
-	kfree(ss->reason);
-	ss->reason = NULL;
-
 	xe_guc_log_snapshot_free(ss->guc.log);
 	ss->guc.log = NULL;
 
@@ -257,11 +253,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
-	if (q->vm && q->vm->xef) {
+	if (q->vm && q->vm->xef)
 		process_name = q->vm->xef->process_name;
-		ss->pid = q->vm->xef->pid;
-	}
-
 	strscpy(ss->process_name, process_name);
 
 	ss->gt = q->gt;
@@ -299,18 +292,15 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
  * xe_devcoredump - Take the required snapshots and initialize coredump device.
  * @q: The faulty xe_exec_queue, where the issue was detected.
  * @job: The faulty xe_sched_job, where the issue was detected.
- * @fmt: Printf format + args to describe the reason for the core dump
  *
  * This function should be called at the crash time within the serialized
  * gt_reset. It is skipped if we still have the core dump device available
  * with the information of the 'first' snapshot.
  */
-__printf(3, 4)
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
-	va_list varg;
 
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
@@ -318,11 +308,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	}
 
 	coredump->captured = true;
-
-	va_start(varg, fmt);
-	coredump->snapshot.reason = kvasprintf(GFP_ATOMIC, fmt, varg);
-	va_end(varg);
-
 	devcoredump_snapshot(coredump, q, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 6a17e6d60102..c04a534e3384 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -14,12 +14,11 @@ struct xe_exec_queue;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
 int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_exec_queue *q,
-				  struct xe_sched_job *job,
-				  const char *fmt, ...)
+				  struct xe_sched_job *job)
 {
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e6234e887102..be4d59ea9ac8 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -28,10 +28,6 @@ struct xe_devcoredump_snapshot {
 	ktime_t boot_time;
 	/** @process_name: Name of process that triggered this gpu hang */
 	char process_name[TASK_COMM_LEN];
-	/** @pid: Process id of process that triggered this gpu hang */
-	pid_t pid;
-	/** @reason: The reason the coredump was triggered */
-	char *reason;
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c36329fe857..d00af8d8acbe 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -901,8 +901,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		if (!ret) {
 			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
 				   q->guc->id);
-			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
-				       q->guc->id);
+			xe_devcoredump(q, NULL);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
@@ -910,7 +909,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	}
 
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
-		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
+		xe_devcoredump(q, NULL);
 
 	xe_sched_submission_start(sched);
 }
@@ -1137,9 +1136,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 				xe_gt_warn(guc_to_gt(guc),
 					   "Schedule disable failed to respond, guc_id=%d",
 					   q->guc->id);
-			xe_devcoredump(q, job,
-				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
-				       q->guc->id, ret, xe_guc_read_stopped(guc));
+			xe_devcoredump(q, job);
 			set_exec_queue_extra_ref(q);
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
@@ -1169,10 +1166,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(q, job,
-			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
-			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-			       q->guc->id, q->flags);
+		xe_devcoredump(q, job);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
-- 
2.34.1

