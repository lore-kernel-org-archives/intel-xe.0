Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DF7C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1646310EA6D;
	Fri,  5 Apr 2024 21:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFiyxgXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1D10EA70
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712351768; x=1743887768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fD8Dgk91vLQZFGFIzd8GFdWjwic54fJimY4HH9Z1NB0=;
 b=SFiyxgXLvY5OR2yK6FgUV0nDD2kk2whv4TY2D5zDM2msQjm5mIPlwIaz
 hs/tTlrbVIiG3YkioSy0ja07n7n7pYWQdsAcxi2DBHPQ1j2zbPlttpei4
 ssN0+kXbjVwW5znovCaqlW4edy6+tf96bio5gu4dwpiDP3J2LZ5SkbRiY
 o0Etn9xXuFys/3NQeoYKoQu7HwZYwMsPe+j/SUoMlHv5ZfIu1gvO9E+0t
 HqbO02BlsVpdr+Ov66Xb83/Fh/yiRnmvpuKXNRh/iuUfxlN2JbD36TGgt
 FCVab9vWJ4YoRMFrwmMkvXJxt+Pp39O1IOYNzQMt8LtL5rknbiNlaAfdA Q==;
X-CSE-ConnectionGUID: konhsXa4RzW+IYMU8mzj5A==
X-CSE-MsgGUID: KqJkSwp3QmmO2LqliXtgCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19132696"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19132696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:08 -0700
X-CSE-ConnectionGUID: bYvjOxnuQACOsFqjEwMFsw==
X-CSE-MsgGUID: frAhsFzdTrGVkwt4wvDUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="50249176"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Always capture exec queues on snapshot
Date: Fri,  5 Apr 2024 14:16:31 -0700
Message-Id: <20240405211632.223568-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405211632.223568-1-matthew.brost@intel.com>
References: <20240405211632.223568-1-matthew.brost@intel.com>
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

Always capture exec queues on snapshot regardless if exec queue has
pending jobs or not. Having jobs or not does indicate whether the exec
queue capture is useful.

Example bugs that would not be easily detected by skipping capture when
pending job list is empty:
- Jobs pending on exec queue have dependencies
- Leaking exec queue refs
- GuC protocol issues (i.e. losing G2H)

In addition to above bugs, in general it just useful to see every exec
queue registered with the GuC and its state.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 25 +++----------------------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  4 ++--
 3 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a951043b2943..283ca7518aff 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -188,7 +188,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
-	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
+	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
 	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c30bd9ac8c0..cc1890e322cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1777,7 +1777,7 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 
 /**
  * xe_guc_exec_queue_snapshot_capture - Take a quick snapshot of the GuC Engine.
- * @job: faulty Xe scheduled job.
+ * @q: faulty exec queue
  *
  * This can be printed out in a later stage like during dev_coredump
  * analysis.
@@ -1786,9 +1786,8 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
  * caller, using `xe_guc_exec_queue_snapshot_free`.
  */
 struct xe_guc_submit_exec_queue_snapshot *
-xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
+xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
@@ -1944,28 +1943,10 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
 static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 {
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
-	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job;
-	bool found = false;
 
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
-		if (job->q == q) {
-			xe_sched_job_get(job);
-			found = true;
-			break;
-		}
-	}
-	spin_unlock(&sched->base.job_list_lock);
-
-	if (!found)
-		return;
-
-	snapshot = xe_guc_exec_queue_snapshot_capture(job);
+	snapshot = xe_guc_exec_queue_snapshot_capture(q);
 	xe_guc_exec_queue_snapshot_print(snapshot, p);
 	xe_guc_exec_queue_snapshot_free(snapshot);
-
-	xe_sched_job_put(job);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 2f14dfd04722..fad0421ead36 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -9,8 +9,8 @@
 #include <linux/types.h>
 
 struct drm_printer;
+struct xe_exec_queue;
 struct xe_guc;
-struct xe_sched_job;
 
 int xe_guc_submit_init(struct xe_guc *guc);
 
@@ -27,7 +27,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
-xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job);
+xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
 xe_guc_exec_queue_snapshot_capture_delayed(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void
-- 
2.34.1

