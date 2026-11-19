Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C97606A33D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3Le0nFL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4859A10F71D;
	Thu, 19 Nov 2026 00:09:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2663A10FB9E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795046992; x=1826582992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4s/mGy9Kl3C/5TlkmfWO76sxP2NVnDADqPXtBbrcg0=;
 b=I3Le0nFLHj+05U+LoJTcepxjE95GCIF2vqUHtY13yreIQEHQ96HzI92A
 ZRCTyvn/aVf0ReAiESEDZbCIo2+hC96vx37ow0Uqt7zGMHKx13B44Se0j
 iF6/YoaEWKbu0VwrF7VJpu+7L2lGMc2uDFoGRNyxNCi7z+GXIbl0CVgf9
 ekuxMx6nKzSSKDMMol1x0Aq0vBxvQFFs4umV2z00LG9/PwjlfuiDqkRwi
 5A0uuhLgW0mzJHq/j6dEKiMtVUOe9h/jJSzsjnltniAVtDA8UE/euXJ38
 c5fVD1HG9SR0NnuN8kAr0mTCWKzff0xDrEedYBGvoVr1ljCUJO9IIu/bS A==;
X-CSE-ConnectionGUID: a6jSyID3R32svfpSwTOwzA==
X-CSE-MsgGUID: fFLzdHNIRSSqaBQJWXe+Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3768597"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3768597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:09:42 -0800
X-CSE-ConnectionGUID: jq0kGJ+DRBewnZBsgKnS8g==
X-CSE-MsgGUID: NF6/kqkSQMmub3PYBYDy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10641169"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 16:09:41 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v5 3/4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Date: Wed, 18 Nov 2026 16:04:45 -0800
Message-ID: <20261119000446.696147-4-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119000446.696147-1-daniel.charles@intel.com>
References: <20261119000446.696147-1-daniel.charles@intel.com>
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

Cc: Wang Xin <x.wang@intel.com>
Cc: Jia Yao <jia.yao@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 87 ++++++++++++++++++--
 2 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 2b1a40e288f17..3f5b1950a248a 100644
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
index a3c2abb9254ff..3010e8ca36b4a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1319,12 +1319,16 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
 
@@ -1718,7 +1722,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
-			disable_scheduling(primary, skip_timeout_check);
+			/* KILL may have already disabled scheduling. */
+			if (exec_queue_enabled(primary))
+				disable_scheduling(primary, skip_timeout_check);
 		}
 
 		/*
@@ -2070,12 +2076,44 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
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
@@ -2110,6 +2148,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case CGP_SYNC_MSG:
 		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg, bound);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2237,8 +2278,21 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
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
@@ -2248,6 +2302,27 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
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
 
@@ -2300,10 +2375,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
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

