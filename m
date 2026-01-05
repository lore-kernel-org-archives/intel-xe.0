Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA712C2A079
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9DC10E3B4;
	Mon,  5 Jan 2026 04:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6rnQDm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE2810E289
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWr/TkGxR1unSRH2XVBhsMjf6hOWCaPCeH9CrG17Gqk=;
 b=B6rnQDm1GpVLyqgwmGgBfk5mFotXGg6EXDNjPJuT5DPTyI49RdBBOm0I
 TOF0q8s1e17BgvKjsKgUYAtbP2f1g/fqrabWzEJkKRY6d9J9/GcNDDNGd
 n+alhEWRWXMiEMCBmS9FMfRN2GET/sDouxnAk9SKOZYYj+Mgz8d7KjZ7G
 f3ECMWhDeoR+Bq0MoZNJEpFFqQ/zlZVUrna1NVnZCVWYHljIBqGnyt3oD
 suRNKENdL5h/9UxSmtS2jcS8Imq7VihbfalUUu6x0awKMiP6ZtNybY/zg
 0bg+mZK1wdupHQK1Kc45YjqKzsM3sfG3b2KXy4n/2m1KwPlZS/FfaNtu5 g==;
X-CSE-ConnectionGUID: UTdwiITMRZCmaAj+iVSnNw==
X-CSE-MsgGUID: EBlte7pLSL+S8uhe6cWBHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856265"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: IKAZTgmuTZ+XrJazm3zUuw==
X-CSE-MsgGUID: o1ucGCkqR7qvrf/sKwWUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060673"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 12/22] drm/xe: Implement GuC submission backend ops for
 deadlines
Date: Sun,  4 Jan 2026 20:02:27 -0800
Message-Id: <20260105040237.1307873-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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
queue frequency upon deadline state change. The idea is that if a fence
on a queue is at risk of missing a deadline, we try to ensure this fence
completes as soon as possible.

v2:
 - Disallow parallel / multi-q
 - Tie removal of deadline to job's refcount
 - Remove exit_deadline, rather use enum for control

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 133 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job.c            |   3 +
 3 files changed, 126 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3b034e4b205..83dfb15aa4bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	3
+#define MAX_STATIC_MSG_TYPE	4
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 26cd9fa6e2b3..1aca444faf8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -20,6 +20,8 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_deadline_mgr.h"
+#include "xe_deadline_mgr_types.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -552,6 +554,35 @@ static const int xe_exec_queue_prio_to_guc[] = {
 	[XE_EXEC_QUEUE_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
 };
 
+static void deadline_policies(struct xe_guc *guc, struct xe_exec_queue *q,
+			      enum xe_deadline_mgr_state state)
+{
+	struct exec_queue_policy policy;
+	enum xe_exec_queue_priority prio = q->sched_props.priority;
+	u32 slpc_exec_queue_freq_req = 0;
+
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
+		     !xe_exec_queue_is_multi_queue_secondary(q));
+	xe_gt_assert(guc_to_gt(guc), state !=
+		     XE_DEADLINE_MGR_STATE_UNSUPPORTED);
+
+	if (state == XE_DEADLINE_MGR_STATE_PRIO_BOOST &&
+	    (q->flags & EXEC_QUEUE_FLAG_CAP_SYS_NICE))
+		prio = XE_EXEC_QUEUE_PRIORITY_HIGH;
+
+	if (state != XE_DEADLINE_MGR_STATE_NO_BOOST ||
+	    (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY))
+		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
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
@@ -1863,6 +1894,18 @@ static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q
 	guc_exec_queue_destroy_async(q);
 }
 
+#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
+#define SET_SCHED_PROPS			2
+#define SUSPEND				3
+#define RESUME				4
+#define SET_MULTI_QUEUE_PRIORITY	5
+#define ENTER_DEADLINE_FREQ		6
+#define ENTER_DEADLINE_PRIO		7
+#define EXIT_DEADLINE			8
+#define OPCODE_MASK	0xf
+#define MSG_LOCKED	BIT(8)
+#define MSG_HEAD	BIT(9)
+
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
@@ -2037,14 +2080,24 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	kfree(msg);
 }
 
-#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
-#define SET_SCHED_PROPS			2
-#define SUSPEND				3
-#define RESUME				4
-#define SET_MULTI_QUEUE_PRIORITY	5
-#define OPCODE_MASK	0xf
-#define MSG_LOCKED	BIT(8)
-#define MSG_HEAD	BIT(9)
+static void
+__guc_exec_queue_process_msg_set_deadline_state(struct xe_sched_msg *msg,
+						unsigned int opcode)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	enum xe_deadline_mgr_state state;
+
+	if (opcode == EXIT_DEADLINE)
+		state = XE_DEADLINE_MGR_STATE_NO_BOOST;
+	else if (opcode == ENTER_DEADLINE_FREQ)
+		state = XE_DEADLINE_MGR_STATE_FREQ_BOOST;
+	else
+		state = XE_DEADLINE_MGR_STATE_PRIO_BOOST;
+
+	if (guc_exec_queue_allowed_to_change_state(q))
+		deadline_policies(guc, q, state);
+}
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 				       unsigned int opcode)
@@ -2069,6 +2122,11 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case SET_MULTI_QUEUE_PRIORITY:
 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
 		break;
+	case ENTER_DEADLINE_FREQ:
+	case ENTER_DEADLINE_PRIO:
+	case EXIT_DEADLINE:
+		__guc_exec_queue_process_msg_set_deadline_state(msg, opcode);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2232,9 +2290,11 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 	return true;
 }
 
-#define STATIC_MSG_CLEANUP	0
-#define STATIC_MSG_SUSPEND	1
-#define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CLEANUP		0
+#define STATIC_MSG_SUSPEND		1
+#define STATIC_MSG_RESUME		2
+#define STATIC_MSG_SET_DEADLINE_STATE	3
+
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
@@ -2402,6 +2462,55 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
+static void guc_exec_queue_set_deadline(struct xe_exec_queue *q,
+					struct dma_fence *fence,
+					ktime_t deadline)
+{
+	xe_deadline_mgr_add_deadline(&q->deadline_mgr, fence, deadline);
+}
+
+static void guc_exec_queue_set_deadline_state(struct xe_exec_queue *q,
+					      enum xe_deadline_mgr_state state)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg = q->guc->static_msgs +
+		STATIC_MSG_SET_DEADLINE_STATE;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	unsigned int opcode;
+
+	xe_gt_assert(guc_to_gt(guc), state !=
+		     XE_DEADLINE_MGR_STATE_UNSUPPORTED);
+
+	switch (state) {
+	case XE_DEADLINE_MGR_STATE_NO_BOOST:
+		opcode = EXIT_DEADLINE;
+		break;
+	case XE_DEADLINE_MGR_STATE_FREQ_BOOST:
+		opcode = ENTER_DEADLINE_FREQ;
+		break;
+	case XE_DEADLINE_MGR_STATE_PRIO_BOOST:
+		opcode = ENTER_DEADLINE_PRIO;
+		break;
+	default:
+		drm_warn(&guc_to_xe(guc)->drm, "NOT POSSIBLE");
+	}
+
+	xe_sched_msg_scoped_guard(sched) {
+		if (!guc_exec_queue_try_add_msg(q, msg, opcode)) {
+			bool added;
+
+			/*
+			 * A deadline state change has yet to be processed,
+			 * removed it.
+			 */
+			list_del_init(&msg->link);
+
+			added = guc_exec_queue_try_add_msg(q, msg, opcode);
+			xe_gt_assert(guc_to_gt(guc), added);
+		}
+	}
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2421,6 +2530,8 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.set_deadline = guc_exec_queue_set_deadline,
+	.set_deadline_state = guc_exec_queue_set_deadline_state,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 6099b4445835..3d02f02ae9bb 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -9,6 +9,7 @@
 #include <linux/dma-fence-chain.h>
 #include <linux/slab.h>
 
+#include "xe_deadline_mgr.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
@@ -174,6 +175,8 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_device *xe = job_to_xe(job);
 	struct xe_exec_queue *q = job->q;
 
+	if (job->fence)
+		xe_deadline_mgr_remove_deadline(&q->deadline_mgr, job->fence);
 	xe_sched_job_free_fences(job);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
-- 
2.34.1

