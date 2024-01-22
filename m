Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F27C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15E810E653;
	Mon, 22 Jan 2024 17:05:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1373D10ECA3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943102; x=1737479102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uF6WpqUs8gmeZHJ4QG/NXA5FCs7DeILGHFBCShscmHI=;
 b=hjF3/FchKp3VLXtFseyDGREm+9OONCTRG+RRI+OuYRz5rCJBQGxAAKtx
 EewDQ7s9oGklns8bGRs5ln+xjxbUGLmZi4+p/xw67pbvw5YgOBzP8JD4q
 yUyZjGyBiFLrWsYMafKm7NtLC1IvebTRlwEHOtLxwjJ6vYpwyYnD2WcHq
 GArkKf4S5JquAU2H5fBSjUIoyRiACsjnbCLDcbEPfACHt+/mKtX/PPmip
 +BVubGgGVbcCxs1LmCGLK3r6u8Mgx427MzatJ6dTdt+cdnrI2l0tjZaoV
 Cu+knV3fky+jD9aUI9nzK4A11BH7I0SeaU/jYD3gSvIodMV4QRcC6Og3g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020195"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228239"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228239"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:04:58 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/xe: Change devcoredump functions parameters to
 xe_sched_job
Date: Mon, 22 Jan 2024 09:04:38 -0800
Message-ID: <20240122170445.108856-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When devcoredump start to dump the VMs contents it will be necessary
to know the starting addresses of batch buffers of the job that hang.

This information it set in xe_sched_job and xe_sched_job is not easily
acessible from xe_exec_queue, so here changing the parameter, next
patch will append the batch buffer addresses to devcoredump snapshot
capture.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 12 ++++++----
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++---
 drivers/gpu/drm/xe/xe_guc_submit.c  | 36 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  4 ++--
 4 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195beb..0f23ecc74b162 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_sched_job.h"
 
 /**
  * DOC: Xe device coredump
@@ -123,9 +124,10 @@ static void xe_devcoredump_free(void *data)
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
-				 struct xe_exec_queue *q)
+				 struct xe_sched_job *job)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
@@ -150,7 +152,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
-	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
+	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
@@ -173,9 +175,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
  * gt_reset. It is skipped if we still have the core dump device available
  * with the information of the 'first' snapshot.
  */
-void xe_devcoredump(struct xe_exec_queue *q)
+void xe_devcoredump(struct xe_sched_job *job)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_device *xe = gt_to_xe(job->q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 
 	if (coredump->captured) {
@@ -184,7 +186,7 @@ void xe_devcoredump(struct xe_exec_queue *q)
 	}
 
 	coredump->captured = true;
-	devcoredump_snapshot(coredump, q);
+	devcoredump_snapshot(coredump, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 6ac218a5c1945..df8671f0b5eb2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -7,12 +7,12 @@
 #define _XE_DEVCOREDUMP_H_
 
 struct xe_device;
-struct xe_exec_queue;
+struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_exec_queue *q);
+void xe_devcoredump(struct xe_sched_job *job);
 #else
-static inline void xe_devcoredump(struct xe_exec_queue *q)
+static inline void xe_devcoredump(struct xe_sched_job *job)
 {
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7c29b8333c719..dfcc7a0af0a23 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -934,7 +934,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			   xe_sched_job_seqno(job), q->guc->id, q->flags);
 		simple_error_capture(q);
-		xe_devcoredump(q);
+		xe_devcoredump(job);
 	} else {
 		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), q->guc->id, q->flags);
@@ -1789,12 +1789,12 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
  * caller, using `xe_guc_exec_queue_snapshot_free`.
  */
 struct xe_guc_submit_exec_queue_snapshot *
-xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
+xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 {
+	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
 
@@ -1852,14 +1852,16 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (!snapshot->pending_list) {
 		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
 	} else {
+		struct xe_sched_job *job_iter;
+
 		i = 0;
-		list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
 			snapshot->pending_list[i].seqno =
-				xe_sched_job_seqno(job);
+				xe_sched_job_seqno(job_iter);
 			snapshot->pending_list[i].fence =
-				dma_fence_is_signaled(job->fence) ? 1 : 0;
+				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
 			snapshot->pending_list[i].finished =
-				dma_fence_is_signaled(&job->drm.s_fence->finished)
+				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
 				? 1 : 0;
 			i++;
 		}
@@ -1945,10 +1947,28 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
 static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
 {
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_job *job;
+	bool found = false;
+
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		if (job->q == q) {
+			xe_sched_job_get(job);
+			found = true;
+			break;
+		}
+	}
+	spin_unlock(&sched->base.job_list_lock);
 
-	snapshot = xe_guc_exec_queue_snapshot_capture(q);
+	if (!found)
+		return;
+
+	snapshot = xe_guc_exec_queue_snapshot_capture(job);
 	xe_guc_exec_queue_snapshot_print(snapshot, p);
 	xe_guc_exec_queue_snapshot_free(snapshot);
+
+	xe_sched_job_put(job);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fc97869c5b865..723dc2bd8df91 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -9,8 +9,8 @@
 #include <linux/types.h>
 
 struct drm_printer;
-struct xe_exec_queue;
 struct xe_guc;
+struct xe_sched_job;
 
 int xe_guc_submit_init(struct xe_guc *guc);
 
@@ -27,7 +27,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
-xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
+xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job);
 void
 xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snapshot,
 				 struct drm_printer *p);
-- 
2.43.0

