Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C35D597B0
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC1010E676;
	Tue, 12 Nov 2024 21:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4l3oxxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF0010E672
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448523; x=1762984523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5RnonxeyF9sD4SHv0VyJG/T1HjH9J/XITrekhx1apBs=;
 b=O4l3oxxjeex9VZiTK8PphqIvo33Z67iycrSyJGB5qZfq9et1gmHh1Nsp
 azBb5EJt5fN0O9kCwcHMaCn4cYAL5wBfwRs3l7x51TktsIpOSyy0obzVS
 6Sr1OabI9PwR1QvcefCU2QR1IhixrNkvUqvT8OqhHjLs4RF8LKu/FO9xS
 7eVlCPbjKkEQIZ4CXaCkPShEo8FeJynosc0GpR9iEalbP9R2bzQLXNm4/
 EB8SbcXUQhhwfh6BBrJSLb+zP3cudljog+HTJHwRiTlUDzKDC0q4Ow6YA
 T7hJ6Y93hqU+GRjsvCtWCPLHVSK6mVOd/hJ20Ltynm7GGoJKuP4pV6rZs A==;
X-CSE-ConnectionGUID: hHIijDY+Qgqd2zpcMjC0Vg==
X-CSE-MsgGUID: fT4fa5b1SvCtA7adpsEiBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190114"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190114"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: M9jkfMm7Slqx2wHEN4Be3A==
X-CSE-MsgGUID: /ym6tEM6RUeDhI632Nz68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050238"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for queue
Date: Tue, 12 Nov 2024 13:55:53 -0800
Message-Id: <20241112215553.1369146-8-matthew.brost@intel.com>
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

