Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CF0D597B1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7810E673;
	Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBZUkTOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040B10E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448523; x=1762984523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TW6+fmN7xURnkWnXaUurXvKUGRaNuAD3nfLZ8XxFv6Q=;
 b=WBZUkTOPVy1PnIzdd/pItqkYKZDavmbjeXIwq3s0BKi5wxf82A/RLzpv
 pulR7CI97X+LW0tTrjbJhDia5gNR9dk9ooc1tjD1BJzVU6HuILNjinKIM
 q9ibzjcnwmP4sAokD8figrf9DCXvRnFDl2dguwQAFu7PScCiNn2Kr43oU
 weRfeDhrS0G5NhF1CB63UhoHlDdc98e36n0SCDh/wp2ZJvaiVmTllLDkY
 +P9HvxF4i5r2cZk/Gm7jCF8gLkRNzgXq4VVlMqM70Y369AAmZ9zb0EkzT
 QH2XAtOSEMOmVR9Loe1Rrx9bZKDYTTdyakX3kKnjQ1iaaDPB6CS03hcCG A==;
X-CSE-ConnectionGUID: A+wbkSGzQmu/l7XSPoAsvw==
X-CSE-MsgGUID: mv/tv0IxSdC7TYTXjJ5U7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190113"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190113"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: N5/q1rgYTWqs0uXNphRxZw==
X-CSE-MsgGUID: 4KjaHc2VQnGlpKSlRucpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050237"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/xe: Add exec queue param to devcoredump
Date: Tue, 12 Nov 2024 13:55:52 -0800
Message-Id: <20241112215553.1369146-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112215553.1369146-1-matthew.brost@intel.com>
References: <20241112215553.1369146-1-matthew.brost@intel.com>
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

During capture time, the target job may be unavailable (e.g., if it's in
LR mode). However, the associated exec queue will be available
regardless, so add an exec queue param for such cases.

v2:
 - Reword commit message (Jonathan)

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 15 +++++++++------
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++--
 drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d3570d3d573c..c32cbb46ef8c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -238,10 +238,10 @@ static void xe_devcoredump_free(void *data)
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
+				 struct xe_exec_queue *q,
 				 struct xe_sched_job *job)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
-	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
@@ -278,10 +278,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
-	ss->job = xe_sched_job_snapshot_capture(job);
+	if (job)
+		ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
 
-	xe_engine_snapshot_capture_for_job(job);
+	if (job)
+		xe_engine_snapshot_capture_for_job(job);
 
 	queue_work(system_unbound_wq, &ss->work);
 
@@ -291,15 +293,16 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 /**
  * xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @q: The faulty xe_exec_queue, where the issue was detected.
  * @job: The faulty xe_sched_job, where the issue was detected.
  *
  * This function should be called at the crash time within the serialized
  * gt_reset. It is skipped if we still have the core dump device available
  * with the information of the 'first' snapshot.
  */
-void xe_devcoredump(struct xe_sched_job *job)
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
-	struct xe_device *xe = gt_to_xe(job->q->gt);
+	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 
 	if (coredump->captured) {
@@ -308,7 +311,7 @@ void xe_devcoredump(struct xe_sched_job *job)
 	}
 
 	coredump->captured = true;
-	devcoredump_snapshot(coredump, job);
+	devcoredump_snapshot(coredump, q, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index a4eebc285fc8..c04a534e3384 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -10,13 +10,15 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_exec_queue;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_sched_job *job);
+void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
 int xe_devcoredump_init(struct xe_device *xe);
 #else
-static inline void xe_devcoredump(struct xe_sched_job *job)
+static inline void xe_devcoredump(struct xe_exec_queue *q,
+				  struct xe_sched_job *job)
 {
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3d61c650c0d2..46fd4621bfca 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1157,7 +1157,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(job);
+		xe_devcoredump(q, job);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
-- 
2.34.1

