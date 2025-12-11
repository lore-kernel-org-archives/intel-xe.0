Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F808D3E786
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E583F10E6D7;
	Thu, 11 Dec 2025 01:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL4kO4qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9212710E6C2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zs4yJoaJ9k2eFzP+fIdrmnBbAMdQ2YEFc5CUb3mJ4kg=;
 b=VL4kO4qmlhywyqjEA/uaCGt9Bc37s6dz07jCajNRUVc8Dqw/MD4uje0c
 j+Tit+qNIxSaPMBhHSf7jeMiK0dj2yPJkYIYWF3c+CVQeeGBNvXfwydkR
 QiL+9N6KjUUM+ewxxUj2dIbYvm/hLoc0XAZeR6TJKlHTpFJ8/VWouYpka
 U85b0f8+ge7MJnxV2m037V5/AQsi4gAJXTcqgmwg72kwlXFwJSVv/k3Zn
 LgrfJisIA2xfxdouLy6phZHqIJZoIV+dL6DWC2bAdqhtjjHXBbhXuRlU6
 8lB7jGREb0cpL0mACaZd8uR7+a6SmRex8CJA4b4MwN+W1GpyHMR+D8Yjg A==;
X-CSE-ConnectionGUID: pCPDR6B/RJ6CkJ5YQX7gIA==
X-CSE-MsgGUID: Nvq53oTIQfeAjjggt/xsMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442861"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
X-CSE-ConnectionGUID: uOIYc3f4QkK4mdbgsvHUZA==
X-CSE-MsgGUID: w43MNsBLSoWhB95ZdJ+Rrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664087"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 03/17] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Date: Wed, 10 Dec 2025 17:02:51 -0800
Message-ID: <20251211010249.1647839-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Implement GuC commands and response along with the Context
Group Page (CGP) interface for multi queue support.

Ensure that only primary queue (q0) of a multi queue group
communicate with GuC. The secondary queues of the group only
need to maintain LRCA and interface with drm scheduler.

Use primary queue's submit_wq for all secondary queues of a multi
queue group. This serialization avoids any locking around CGP
synchronization with GuC.

v2: Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value, add more comments
    (Matt Brost)
v3: Minor code refactro, use xe_gt_assert
v4: Use xe_guc_ct_wake_waiters(), remove vf recovery support
    (Matt Brost)

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 278 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
 6 files changed, 269 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 47756e4674a1..3e9fbed9cda6 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -139,6 +139,9 @@ enum xe_guc_action {
 	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
 	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
+	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
+	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
+	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 29feafb42e0a..06fb518b8533 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -44,6 +44,8 @@ struct xe_exec_queue_group {
 	struct xe_bo *cgp_bo;
 	/** @xa: xarray to store LRCs */
 	struct xarray xa;
+	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
+	bool sync_pending;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 648f0f523abb..4d5b4ed357cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1401,6 +1401,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	lockdep_assert_held(&ct->lock);
 
 	switch (action) {
+	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
 	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
 	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
@@ -1614,6 +1615,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
 		break;
 #endif
+	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
+		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
+		break;
 	default:
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 7d93c2749485..e27f0088f24f 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -16,6 +16,7 @@
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
+#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		3
 
 #define GUC_ID_MAX			65535
 #define GUC_ID_UNKNOWN			0xffffffff
@@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
 	u32 wq_base_lo;
 	u32 wq_base_hi;
 	u32 wq_size;
+	u32 cgp_lo;
+	u32 cgp_hi;
 	u32 hwlrca_lo;
 	u32 hwlrca_hi;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ff6fda84bf0f..bafe42393d22 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -19,6 +19,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	u32 slpc_exec_queue_freq_req = 0;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
+		     !xe_exec_queue_is_multi_queue_secondary(q));
 
 	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
 		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
@@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
 {
 	struct exec_queue_policy policy;
 
+	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
+
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
 
@@ -568,6 +572,11 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
 }
 
+static bool vf_recovery(struct xe_guc *guc)
+{
+	return xe_gt_recovery_pending(guc_to_gt(guc));
+}
+
 #define parallel_read(xe_, map_, field_) \
 	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_)
@@ -575,6 +584,119 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
 	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_, val_)
 
+#define CGP_VERSION_MAJOR_SHIFT	8
+
+static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
+					       struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	u32 guc_id = group->primary->guc->id;
+
+	/* Currently implementing CGP version 1.0 */
+	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
+		  1 << CGP_VERSION_MAJOR_SHIFT);
+
+	xe_map_wr(xe, &group->cgp_bo->vmap,
+		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
+		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
+
+	xe_map_wr(xe, &group->cgp_bo->vmap,
+		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
+		  u32, guc_id);
+
+	if (q->multi_queue.pos / 32) {
+		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
+			  u32, BIT(q->multi_queue.pos % 32));
+		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
+	} else {
+		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
+			  u32, BIT(q->multi_queue.pos));
+		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
+	}
+}
+
+static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
+					     struct xe_exec_queue *q,
+					     const u32 *action, u32 len)
+{
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_device *xe = guc_to_xe(guc);
+	long ret;
+
+	/*
+	 * As all queues of a multi queue group use single drm scheduler
+	 * submit workqueue, CGP synchronization with GuC are serialized.
+	 * Hence, no locking is required here.
+	 * Wait for any pending CGP_SYNC_DONE response before updating the
+	 * CGP page and sending CGP_SYNC message.
+	 *
+	 * FIXME: Support VF migration
+	 */
+	ret = wait_event_timeout(guc->ct.wq,
+				 !READ_ONCE(group->sync_pending) ||
+				 xe_guc_read_stopped(guc), HZ);
+	if (!ret || xe_guc_read_stopped(guc)) {
+		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
+		return;
+	}
+
+	xe_guc_exec_queue_group_cgp_update(xe, q);
+
+	WRITE_ONCE(group->sync_pending, true);
+	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
+}
+
+static void __register_exec_queue_group(struct xe_guc *guc,
+					struct xe_exec_queue *q,
+					struct guc_ctxt_registration_info *info)
+{
+#define MAX_MULTI_QUEUE_REG_SIZE	(8)
+	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
+	int len = 0;
+
+	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
+	action[len++] = info->flags;
+	action[len++] = info->context_idx;
+	action[len++] = info->engine_class;
+	action[len++] = info->engine_submit_mask;
+	action[len++] = 0; /* Reserved */
+	action[len++] = info->cgp_lo;
+	action[len++] = info->cgp_hi;
+
+	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_REG_SIZE);
+#undef MAX_MULTI_QUEUE_REG_SIZE
+
+	/*
+	 * The above XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE do expect a
+	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
+	 * from guc.
+	 */
+	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+}
+
+static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
+					struct xe_exec_queue *q)
+{
+#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
+	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
+	int len = 0;
+
+	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
+
+	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
+	action[len++] = q->multi_queue.group->primary->guc->id;
+
+	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
+#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
+
+	/*
+	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
+	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
+	 * from guc.
+	 */
+	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+}
+
 static void __register_mlrc_exec_queue(struct xe_guc *guc,
 				       struct xe_exec_queue *q,
 				       struct guc_ctxt_registration_info *info)
@@ -670,6 +792,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
 		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
 
+	if (xe_exec_queue_is_multi_queue(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
+		info.cgp_hi = 0;
+	}
+
 	if (xe_exec_queue_is_parallel(q)) {
 		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
@@ -700,11 +829,18 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
-	if (xe_exec_queue_is_parallel(q))
+	if (xe_exec_queue_is_multi_queue_primary(q))
+		__register_exec_queue_group(guc, q, &info);
+	else if (xe_exec_queue_is_parallel(q))
 		__register_mlrc_exec_queue(guc, q, &info);
-	else
+	else if (!xe_exec_queue_is_multi_queue_secondary(q))
 		__register_exec_queue(guc, &info);
-	init_policies(guc, q);
+
+	if (!xe_exec_queue_is_multi_queue_secondary(q))
+		init_policies(guc, q);
+
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		xe_guc_exec_queue_group_add(guc, q);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
@@ -712,11 +848,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
 }
 
-static bool vf_recovery(struct xe_guc *guc)
-{
-	return xe_gt_recovery_pending(guc_to_gt(guc));
-}
-
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -835,6 +966,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
 
+	/*
+	 * All queues in a multi-queue group will use the primary queue
+	 * of the group to interface with GuC.
+	 */
+	q = xe_exec_queue_multi_queue_primary(q);
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -881,6 +1018,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_run(job);
 
 	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
+		if (xe_exec_queue_is_multi_queue_secondary(q)) {
+			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+			if (exec_queue_killed_or_banned_or_wedged(primary)) {
+				killed_or_banned_or_wedged = true;
+				goto run_job_out;
+			}
+
+			if (!exec_queue_registered(primary))
+				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
+		}
+
 		if (!exec_queue_registered(q))
 			register_exec_queue(q, GUC_CONTEXT_NORMAL);
 		if (!job->restore_replay)
@@ -889,6 +1038,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 		job->restore_replay = false;
 	}
 
+run_job_out:
 	/*
 	 * We don't care about job-fence ordering in LR VMs because these fences
 	 * are never exported; they are used solely to keep jobs on the pending
@@ -914,6 +1064,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
 	return atomic_read(&guc->submission_state.stopped);
 }
 
+static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
+						    struct xe_exec_queue *q,
+						    u32 runnable_state);
+static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
+
 #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
 	u32 action[] = {						\
 		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
@@ -927,7 +1082,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
 	int ret;
 
-	set_min_preemption_timeout(guc, q);
+	if (!xe_exec_queue_is_multi_queue_secondary(q))
+		set_min_preemption_timeout(guc, q);
+
 	smp_rmb();
 	ret = wait_event_timeout(guc->ct.wq,
 				 (!exec_queue_pending_enable(q) &&
@@ -955,9 +1112,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
 	 * handler and we are not allowed to reserved G2H space in handlers.
 	 */
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		handle_multi_queue_secondary_sched_done(guc, q, 0);
+	else
+		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
+			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
@@ -1163,8 +1323,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
 	set_exec_queue_enabled(q);
 	trace_xe_exec_queue_scheduling_enable(q);
 
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		handle_multi_queue_secondary_sched_done(guc, q, 1);
+	else
+		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 
 	ret = wait_event_timeout(guc->ct.wq,
 				 !exec_queue_pending_enable(q) ||
@@ -1188,14 +1351,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
 
-	if (immediate)
+	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
 		set_min_preemption_timeout(guc, q);
 	clear_exec_queue_enabled(q);
 	set_exec_queue_pending_disable(q);
 	trace_xe_exec_queue_scheduling_disable(q);
 
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		handle_multi_queue_secondary_sched_done(guc, q, 0);
+	else
+		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
 static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1213,8 +1379,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 	set_exec_queue_destroyed(q);
 	trace_xe_exec_queue_deregister(q);
 
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		handle_deregister_done(guc, q);
+	else
+		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
 }
 
 static enum drm_gpu_sched_stat
@@ -1657,6 +1826,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct workqueue_struct *submit_wq = NULL;
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
@@ -1677,8 +1847,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
+
+	/*
+	 * Use primary queue's submit_wq for all secondary queues of a
+	 * multi queue group. This serialization avoids any locking around
+	 * CGP synchronization with GuC.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+		submit_wq = primary->guc->sched.base.submit_wq;
+	}
+
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
@@ -2463,7 +2645,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	trace_xe_exec_queue_deregister(q);
 
-	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		handle_deregister_done(guc, q);
+	else
+		xe_guc_ct_send_g2h_handler(&guc->ct, action,
+					   ARRAY_SIZE(action));
 }
 
 static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
@@ -2513,6 +2699,16 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 	}
 }
 
+static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
+						    struct xe_exec_queue *q,
+						    u32 runnable_state)
+{
+	/* Take CT lock here as handle_sched_done() do send a h2g message */
+	mutex_lock(&guc->ct.lock);
+	handle_sched_done(guc, q, runnable_state);
+	mutex_unlock(&guc->ct.lock);
+}
+
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_exec_queue *q;
@@ -2717,6 +2913,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	return 0;
 }
 
+/**
+ * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
+ * @guc: guc
+ * @msg: message indicating CGP sync done
+ * @len: length of message
+ *
+ * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
+ * for CGP synchronization to complete.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
+int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id = msg[0];
+
+	if (unlikely(len < 1)) {
+		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
+		return -EPROTO;
+	}
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	if (!xe_exec_queue_is_multi_queue_primary(q)) {
+		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
+		return -EPROTO;
+	}
+
+	/* Wakeup the serialized cgp update wait */
+	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
+	xe_guc_ct_wake_waiters(&guc->ct);
+
+	return 0;
+}
+
 static void
 guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
 				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 100a7891b918..ad8c0e8e0415 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -36,6 +36,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
-- 
2.43.0

