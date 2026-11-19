Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF12D606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QuNldyns
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4EB10F06A;
	Thu, 19 Nov 2026 17:51:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544E610F047
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110679; x=1826646679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZMEXahiPn5ZFTuvUEpj2pVgCfdei5mg1QVH/tEOE8zo=;
 b=QuNldynsM5Z4ioqSa+1yTc/7nefJg7ZTMJsGEOCHlOgrhFcwZLMqOEGz
 1FprbCcGVAwL+9SsErkcqIoRNspZbNvXD3GmplAEEoT1CoN1OCYrwQoM6
 bFgwQZt3Vh60lSlwCGaWtK2VuaAm00jVLbb1FPsYmJLZZamoBFJclw1dU
 KMcwDIPl+McwyGDHfZgDIOazctBZujQa3OxOPL/11tQxANi4eQJyld/oW
 LNzSv4UQUYmgiWjcOIrQPshM+4i7tCGdgxtfNnzM0+ntERD7FgOFowBMt
 BofVRYuui5CH2uezBRZN/MyrRDF5gl5oRmfFWyDPbgai36u9Lz50TApdt w==;
X-CSE-ConnectionGUID: 4FJJ7oyuTMqT7tGzhG9faA==
X-CSE-MsgGUID: Q/LZgcOzTtK/+eE6RMB2DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866159"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:51:13 -0800
X-CSE-ConnectionGUID: Zq5mEXg9SaOV6iTQMUBIlw==
X-CSE-MsgGUID: 7m+t4V4lTjW/8u1pi8PgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10582825"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:51:13 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v6 3/4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Date: Thu, 19 Nov 2026 09:46:20 -0800
Message-ID: <20261119174621.1311154-4-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119174621.1311154-1-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matthew Brost <matthew.brost@intel.com>

When an FD is closed with many exec queues, teardown relies on the TDR
path to clean up scheduling. However, the TDR handling is serialized
(i.e., only one exec queue is processed at a time), which can make it
too slow compared to GuC scheduling activity.

In this window, GuC may continue to schedule contexts backed by invalid
page tables, leading to a cascade of CAT errors and repeated engine
resets. This significantly increases recovery time and can degrade
system stability.

To mitigate this, eagerly disable scheduling by sending a self-message
outside of the TDR path. This prevents further scheduling of invalid
contexts and avoids the CAT error/reset cascade.

Wait for pending enable/disable operations to complete before sending
the early disable. If the queue has no references when the KILL message
is processed, let the following CLEANUP message handle teardown. Assert
that the queue is referenced when kill is entered.

Early KILL waits on the per-queue scheduling-state waitqueue. Only the
primary can issue the early DISABLE for a multi-queue group. Allow
pending disable on killed queues in run_job and have TDR recheck whether
scheduling is still enabled after waiting for a pending transition.

v5: Updated the description for the waitqueue, primary-only group KILL,
and the run_job and TDR fixes.

v6: resolved rebase conflicts

Cc: Wang Xin <x.wang@intel.com>
Cc: Jia Yao <jia.yao@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 87 ++++++++++++++++++--
 2 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 2b1a40e288f1..3f5b1950a248 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	4
+#define MAX_STATIC_MSG_TYPE	5
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4087a38ad3d6..671852b56210 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1327,12 +1327,16 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	unsigned int state = atomic_read(&q->guc->state);
 	bool killed_or_banned_or_wedged_or_error  =
-		exec_queue_killed_or_banned_or_wedged(q) ||
+		(state & (EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_BANNED |
+			  EXEC_QUEUE_STATE_WEDGED)) ||
 		xe_sched_job_is_error(job);
 
-	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
-		     exec_queue_banned(q) || exec_queue_suspended(q));
+	xe_gt_assert(guc_to_gt(guc),
+		     !(state & (EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_PENDING_DISABLE)) ||
+		     (state & (EXEC_QUEUE_STATE_BANNED | EXEC_QUEUE_STATE_SUSPENDED)) ||
+		     ((state & EXEC_QUEUE_STATE_KILLED) && !(state & EXEC_QUEUE_STATE_DESTROYED)));
 
 	trace_xe_sched_job_run(job);
 
@@ -1732,7 +1736,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
-			disable_scheduling(primary, skip_timeout_check);
+			/* KILL may have already disabled scheduling. */
+			if (exec_queue_enabled(primary))
+				disable_scheduling(primary, skip_timeout_check);
 		}
 
 		/*
@@ -2087,12 +2093,44 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
 		guc_exec_queue_send_cgp_sync(q, 0);
 }
 
+static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
+					      bool bound)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	int ret;
+
+	/* At zero references, the queued CLEANUP message handles disabling. */
+	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
+		return;
+
+	ret = wait_event_timeout(q->guc->state_wq,
+				 (!exec_queue_pending_enable(q) &&
+				  !exec_queue_pending_disable(q)) ||
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc), HZ * 5);
+	if (!ret && !vf_recovery(guc)) {
+		xe_gt_warn(q->gt, "Pending enable/disable failed to respond on kill, guc_id=%d\n",
+			   q->guc->id);
+		xe_gt_reset_async(q->gt);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
+		return;
+	}
+
+	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
+		return;
+
+	if (exec_queue_enabled(q))
+		disable_scheduling(q, true);
+}
+
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS			2
 #define SUSPEND				3
 #define RESUME				4
 #define SET_MULTI_QUEUE_PRIORITY	5
 #define CGP_SYNC_MSG			6
+#define KILL				7
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -2127,6 +2165,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case CGP_SYNC_MSG:
 		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg, bound);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2262,8 +2303,21 @@ static void guc_exec_queue_reinit_kernel(struct xe_exec_queue *q)
 	xe_sched_reinit(&q->guc->sched);
 }
 
+static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
+				       struct xe_sched_msg *msg,
+				       u32 opcode);
+
+#define STATIC_MSG_CLEANUP	0
+#define STATIC_MSG_SUSPEND	1
+#define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CGP_SYNC	3
+#define STATIC_MSG_KILL		4
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
+
+	xe_gt_assert(q->gt, kref_read(&q->refcount));
+
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
 	/*
@@ -2273,6 +2327,27 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	 * stays set until the queue is torn down.
 	 */
 	suspend_wait_wake(q);
+
+	/*
+	 * We eagerly send a message to ourselves to disable scheduling, as the
+	 * TDR is serialized (i.e., only one exec queue is processed at a time).
+	 * If an FD is closed with many exec queues, the TDR can be slower than
+	 * the GuC scheduling contexts with invalid page tables, creating a
+	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
+	 * this by immediately disabling scheduling outside of the TDR.
+	 *
+	 * Only the primary's own KILL may do this for a multi-queue group.
+	 * Group jobs share its ordered submit workqueue and the killed primary
+	 * prevents later member jobs from submitting to GuC.
+	 */
+	if (!xe_exec_queue_is_multi_queue_secondary(q) && !exec_queue_wedged(q)) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg(q, msg, KILL);
+		xe_sched_msg_unlock(sched);
+	}
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -2325,10 +2400,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 	return true;
 }
 
-#define STATIC_MSG_CLEANUP	0
-#define STATIC_MSG_SUSPEND	1
-#define STATIC_MSG_RESUME	2
-#define STATIC_MSG_CGP_SYNC	3
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
-- 
2.43.0

