Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0770D597B1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582F510E675;
	Tue, 12 Nov 2024 22:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRnb6e8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF2010E670
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448857; x=1762984857;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5RnonxeyF9sD4SHv0VyJG/T1HjH9J/XITrekhx1apBs=;
 b=FRnb6e8Z6OO8qfav2uk9LsiIR8OC603OnWrSfjDYYFUKk8BPUhQvtvn1
 wuw+Cz1xIZ0IWqzZ7GT5yOq6b7AGn6tXns6vs1FePevX5dzzfqLzLQ5Ba
 uN27cnLlScHdErU9WJysTxCWh9E1181IP0QAFnvUdbn4h2NVgQ1GydPuY
 8vbPtFSInHqJtCdvsQfxbkXzb8wE4hrPdDwKeJRTmxQROhH/P8iNcrPxX
 4zYI59Iv71Un3sq3TJbbAUWRhoMkuZsT4s3wL/iklmdX7Iwm1vJCx1/vS
 lSe+lsfGx4ACwqtDfN2SSCzUIASk7b1JQgjki5ieRCKIJc43sGj4U8TUV g==;
X-CSE-ConnectionGUID: ieNNfQYRTQmP7n0wQ8Z6vw==
X-CSE-MsgGUID: jW6rtXCgRnGrKSw6D6mZZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403998"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:57 -0800
X-CSE-ConnectionGUID: uug5DRBvQqKWNZYAqqxxdA==
X-CSE-MsgGUID: ntwDKW97SmyAahP6C6L3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605701"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for queue
Date: Tue, 12 Nov 2024 14:01:26 -0800
Message-Id: <20241112220127.1369527-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
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
regardless, change xe_engine_snapshot_capture_for_job to take a queue
argument ann rename to xe_engine_snapshot_capture_for_queue.

v2:
 - Reword commit message (Jonathan)
 - Remove redundant queueu check (Zhanjun)
 - Remove devcoredump job member (Zhanjun)

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |  5 +---
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 --
 drivers/gpu/drm/xe/xe_guc_capture.c       | 29 ++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_capture.h       |  6 ++---
 drivers/gpu/drm/xe/xe_guc_submit.c        |  4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c         |  8 +++----
 drivers/gpu/drm/xe/xe_hw_engine.h         |  4 ++--
 7 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index c32cbb46ef8c..0e5edf14a241 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -232,7 +232,6 @@ static void xe_devcoredump_free(void *data)
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
 	coredump->captured = false;
-	coredump->job = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
 }
@@ -259,7 +258,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	strscpy(ss->process_name, process_name);
 
 	ss->gt = q->gt;
-	coredump->job = job;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
 	cookie = dma_fence_begin_signalling();
@@ -282,8 +280,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
 
-	if (job)
-		xe_engine_snapshot_capture_for_job(job);
+	xe_engine_snapshot_capture_for_queue(q);
 
 	queue_work(system_unbound_wq, &ss->work);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3703ddea1252..be4d59ea9ac8 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -80,8 +80,6 @@ struct xe_devcoredump {
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
 	struct xe_devcoredump_snapshot snapshot;
-	/** @job: Point to the faulting job */
-	struct xe_sched_job *job;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index cc72446a5de1..cd6d80b5b51d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1793,29 +1793,24 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 }
 
 /**
- * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the job.
- * @job: The job object.
+ * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
+ * @q: The exec queue object
  *
- * Search within the capture outlist for the job, could be used for check if
- * GuC capture is ready for the job.
+ * Search within the capture outlist for the queue, could be used for check if
+ * GuC capture is ready for the queue.
  * If found, the locked boolean of the node will be flagged.
  *
  * Returns: found guc-capture node ptr else NULL
  */
 struct __guc_capture_parsed_output *
-xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
+xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-	struct xe_exec_queue *q;
 	struct xe_device *xe;
 	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
 	struct xe_devcoredump_snapshot *ss;
 
-	if (!job)
-		return NULL;
-
-	q = job->q;
 	if (!q || !q->gt)
 		return NULL;
 
@@ -1827,7 +1822,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
 	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
 		return ss->matched_node;
 
-	/* Find hwe for the job */
+	/* Find hwe for the queue */
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe != q->hwe)
 			continue;
@@ -1859,17 +1854,16 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
 }
 
 /**
- * xe_engine_snapshot_capture_for_job - Take snapshot of associated engine
- * @job: The job object
+ * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
+ * @q: The exec queue object
  *
  * Take snapshot of associated HW Engine
  *
  * Returns: None.
  */
 void
-xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
+xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *q = job->q;
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	struct xe_hw_engine *hwe;
@@ -1887,11 +1881,12 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
 		}
 
 		if (!coredump->snapshot.hwe[id]) {
-			coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, job);
+			coredump->snapshot.hwe[id] =
+				xe_hw_engine_snapshot_capture(hwe, q);
 		} else {
 			struct __guc_capture_parsed_output *new;
 
-			new = xe_guc_capture_get_matching_and_lock(job);
+			new = xe_guc_capture_get_matching_and_lock(q);
 			if (new) {
 				struct xe_guc *guc =  &q->gt->uc.guc;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 97a795d13dd1..20a078dc4b85 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -11,10 +11,10 @@
 #include "xe_guc.h"
 #include "xe_guc_fwif.h"
 
+struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 struct xe_hw_engine_snapshot;
-struct xe_sched_job;
 
 static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
 {
@@ -50,10 +50,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
 const struct __guc_mmio_reg_descr_group *
 xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
 				 enum guc_capture_list_class_type capture_class, bool is_ext);
-struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job);
+struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
 void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
 void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
-void xe_engine_snapshot_capture_for_job(struct xe_sched_job *job);
+void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
 void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 46fd4621bfca..985a21a72da4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1061,13 +1061,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * do manual capture first and decide later if we need to use it
 	 */
 	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
-	    !xe_guc_capture_get_matching_and_lock(job)) {
+	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
 
-		xe_engine_snapshot_capture_for_job(job);
+		xe_engine_snapshot_capture_for_queue(q);
 
 		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..0cfa2b9282be 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -829,7 +829,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
- * @job: The job object.
+ * @q: The exec queue object.
  *
  * This can be printed out in a later stage like during dev_coredump
  * analysis.
@@ -838,7 +838,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
  * caller, using `xe_hw_engine_snapshot_free`.
  */
 struct xe_hw_engine_snapshot *
-xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job)
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 	struct __guc_capture_parsed_output *node;
@@ -864,9 +864,9 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
 	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
 		return snapshot;
 
-	if (job) {
+	if (q) {
 		/* If got guc capture, set source to GuC */
-		node = xe_guc_capture_get_matching_and_lock(job);
+		node = xe_guc_capture_get_matching_and_lock(q);
 		if (node) {
 			struct xe_device *xe = gt_to_xe(hwe->gt);
 			struct xe_devcoredump *coredump = &xe->devcoredump;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index da0a6922a26f..6b5f9fa2a594 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -11,7 +11,7 @@
 struct drm_printer;
 struct drm_xe_engine_class_instance;
 struct xe_device;
-struct xe_sched_job;
+struct xe_exec_queue;
 
 #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
@@ -56,7 +56,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
 struct xe_hw_engine_snapshot *
-xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job);
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
 void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
-- 
2.34.1

