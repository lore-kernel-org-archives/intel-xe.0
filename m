Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD2E784B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EFE113F78;
	Thu, 25 Dec 2025 01:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5xTSNqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C52113F6F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZd1AViY9BasR0teJwl5yClh52UWcwyacjiI8Xs2KcM=;
 b=a5xTSNqcb9w+4xggiGmlZMqvvla4t//0oxqZ0+S4js84lKOVdaDaXvJt
 N41pguSlaY51oDpk8p6s7y7tgLdGIjH6c187SYG6HPCep9cpVqceJx07I
 sBx57Kkp49ImrUVlKyTaQeT0Wi1PHKBGwdWBCpr9Bp+mfgqvwDj1hqi7l
 9rPhLhh6Uw2oodPrLV7/aZUZQ5OLsq0NK8S7CDKSQUwKMPN+1MObgKwM1
 +QzpWEM1fWRWzHBP215UgjD2buvB6sfe6eD+ML8HBC3mylsmaZLfzdZiT
 mN2X4HQ7/LPDPjZ0nLic4QfkqsuLylB6L1duKrw8kE4ayFL7wkNQHqKoa w==;
X-CSE-ConnectionGUID: jfCK/zbmRDa31Ht/Xz3W/g==
X-CSE-MsgGUID: 4vQtP/uhSFuFNSPiR0ucLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866364"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:42 -0800
X-CSE-ConnectionGUID: RzQoxTEgSUqTNdd3lTNRZA==
X-CSE-MsgGUID: gL6MWP07Qeil3cM+oVIsBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629146"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 10/13] drm/xe: Implement GuC submission backend ops for
 deadlines
Date: Wed, 24 Dec 2025 17:17:31 -0800
Message-Id: <20251225011734.341683-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Implement GuC submission backend ops for deadlines, which dynamically
raise or lower the priority of user queues with CAP_SYS_NICE and adjust
queue frequency upon deadline entry or exit. The idea is that if a fence
on a queue is at risk of missing a deadline, we try to ensure this fence
completes as soon as possible.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 110 ++++++++++++++++++-
 2 files changed, 108 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3b034e4b205..fcc7bca2405a 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	3
+#define MAX_STATIC_MSG_TYPE	5
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 76460b8ab407..791c64d6397f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -20,6 +20,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_deadline_mgr.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -552,6 +553,26 @@ static const int xe_exec_queue_prio_to_guc[] = {
 	[XE_EXEC_QUEUE_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
 };
 
+static void deadline_policies(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct exec_queue_policy policy;
+	enum xe_exec_queue_priority prio =
+		q->flags & EXEC_QUEUE_FLAG_CAP_SYS_NICE ?
+		XE_EXEC_QUEUE_PRIORITY_HIGH : q->sched_props.priority;
+	u32 slpc_exec_queue_freq_req = SLPC_CTX_FREQ_REQ_IS_COMPUTE;
+
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
+		     !xe_exec_queue_is_multi_queue_secondary(q));
+
+	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
+	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
+	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
+							     slpc_exec_queue_freq_req);
+
+	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
+		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
+}
+
 static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
@@ -1249,6 +1270,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
 	trace_xe_sched_job_free(job);
+	xe_deadline_mgr_remove_deadline(&job->q->deadline_mgr, job->fence);
 	xe_sched_job_put(job);
 }
 
@@ -2037,11 +2059,39 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	kfree(msg);
 }
 
+static void __guc_exec_queue_process_msg_enter_deadline(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	/* XXX: Rethink multi-q implementation */
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		q = xe_exec_queue_multi_queue_primary(q);
+
+	if (guc_exec_queue_allowed_to_change_state(q))
+		deadline_policies(guc, q);
+}
+
+static void __guc_exec_queue_process_msg_exit_deadline(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	/* XXX: Rethink multi-q implementation */
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		q = xe_exec_queue_multi_queue_primary(q);
+
+	if (guc_exec_queue_allowed_to_change_state(q))
+		init_policies(guc, q);
+}
+
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS			2
 #define SUSPEND				3
 #define RESUME				4
 #define SET_MULTI_QUEUE_PRIORITY	5
+#define ENTER_DEADLINE			6
+#define EXIT_DEADLINE			7
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -2068,6 +2118,12 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case SET_MULTI_QUEUE_PRIORITY:
 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
 		break;
+	case ENTER_DEADLINE:
+		__guc_exec_queue_process_msg_enter_deadline(msg);
+		break;
+	case EXIT_DEADLINE:
+		__guc_exec_queue_process_msg_exit_deadline(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2231,9 +2287,11 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 	return true;
 }
 
-#define STATIC_MSG_CLEANUP	0
-#define STATIC_MSG_SUSPEND	1
-#define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CLEANUP		0
+#define STATIC_MSG_SUSPEND		1
+#define STATIC_MSG_RESUME		2
+#define STATIC_MSG_ENTER_DEADLINE	3
+#define STATIC_MSG_EXIT_DEADLINE	4
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
@@ -2401,6 +2459,49 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
+static void guc_exec_queue_set_deadline(struct xe_exec_queue *q,
+					struct dma_fence *fence,
+					ktime_t deadline)
+{
+	xe_deadline_mgr_add_deadline(&q->deadline_mgr, fence, deadline);
+}
+
+static void guc_exec_queue_enter_deadline(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg = q->guc->static_msgs +
+		STATIC_MSG_ENTER_DEADLINE;
+
+	xe_sched_msg_lock(sched) {
+		if (!guc_exec_queue_try_add_msg(q, msg, ENTER_DEADLINE)) {
+			/*
+			 * Corner case where a deadline enter + exit are in
+			 * message list, delete the exit deadline message.
+			 */
+			msg = q->guc->static_msgs + STATIC_MSG_EXIT_DEADLINE;
+			list_del_init(&msg->link);
+		}
+	}
+}
+
+static void guc_exec_queue_exit_deadline(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg = q->guc->static_msgs +
+		STATIC_MSG_EXIT_DEADLINE;
+
+	xe_sched_msg_lock(sched) {
+		if (!guc_exec_queue_try_add_msg(q, msg, EXIT_DEADLINE)) {
+			/*
+			 * Corner case where a deadline exit + enter are in
+			 * message list, delete the enter deadline message.
+			 */
+			msg = q->guc->static_msgs + STATIC_MSG_ENTER_DEADLINE;
+			list_del_init(&msg->link);
+		}
+	}
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2420,6 +2521,9 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.set_deadline = guc_exec_queue_set_deadline,
+	.enter_deadline = guc_exec_queue_enter_deadline,
+	.exit_deadline = guc_exec_queue_exit_deadline,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.34.1

