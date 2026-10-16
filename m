Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D30ECCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234921129C1;
	Fri, 16 Oct 2026 20:03:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659621129BE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792181004; x=1823717004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TgbRoU8hsgpJP9GqV4e7xP/bTNvJAbgpoA8U32GR8uA=;
 b=a1PEjXJFnO/X4/m1fUhOngtHe1PIPGZ21S0b4ZpbsOZVI/qkAPAjxOkq
 EoRFu923lhesdJryCYrUFtMmPP8aNvVEp7aEeEl0EjVeCwN32XXpQJj0F
 /pVmabv12dZjPr2jGpTVDbhd0/7CMelqwTBayqgjVCX2wsLMyud7Q2je1
 sTIah+QoHX/H/2g9HUFRRsuglI3WpmOWnLdezamVD2/b2Dx7W2oWlkowJ
 edovBdjoRnYDWM85ccPJrLpmqgndbWYy35dM4qwRSeQsgwVJSjAnrDYPD
 t6K9DpSxwgPABfyZTh/zTNKT4Lw7qBFGq+g0LbKqWaMqtaflH/SKJN/h6 Q==;
X-CSE-ConnectionGUID: SxL3ko4lRiurpJIOj12OXw==
X-CSE-MsgGUID: L+2/M0x0SViz7GOkLJAivg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="962867"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="962867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:03:18 -0700
X-CSE-ConnectionGUID: h35aQwilR5ej6FQ+hiQqFw==
X-CSE-MsgGUID: RosO2uegQUidIuILDGDnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2020088"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa004.jf.intel.com with ESMTP; 16 Oct 2026 13:03:18 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Date: Fri, 16 Oct 2026 12:59:03 -0700
Message-ID: <20261016195904.1377149-3-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016195904.1377149-1-daniel.charles@intel.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
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

Cc: Wang Xin <x.wang@intel.com>
Cc: Jia Yao <jia.yao@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 70 ++++++++++++++++++--
 2 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 74b711abe2572..89397e1e65465 100644
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
index c4ef3e9bf7a18..97369d97ef51f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2045,12 +2045,45 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
 		guc_exec_queue_send_cgp_sync(q, 0);
 }
 
+static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
+					      bool bound)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_guc *guc = exec_queue_to_guc(primary);
+	int ret;
+
+	/* At zero references, the queued CLEANUP message handles disabling. */
+	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
+		return;
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 (!exec_queue_pending_enable(primary) &&
+				  !exec_queue_pending_disable(primary)) ||
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc), HZ * 5);
+	if (!ret && !vf_recovery(guc)) {
+		xe_gt_warn(primary->gt, "Pending enable/disable failed to respond on kill, guc_id=%d\n",
+			   primary->guc->id);
+		xe_gt_reset_async(primary->gt);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
+		return;
+	}
+
+	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
+		return;
+
+	if (exec_queue_enabled(primary))
+		disable_scheduling(primary, true);
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
@@ -2085,6 +2118,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case CGP_SYNC_MSG:
 		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg, bound);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2211,8 +2247,21 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
@@ -2222,6 +2271,23 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
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
+	 */
+	if (!exec_queue_wedged(q)) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg(q, msg, KILL);
+		xe_sched_msg_unlock(sched);
+	}
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -2274,10 +2340,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
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

