Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CDDFAD3F0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 02:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4D310EAE0;
	Thu, 23 Apr 2026 02:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN1orzfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CFF10E2E8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776912604; x=1808448604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWbjccZF6c7CInZg2FBVtnbYHOLsacpIrNUFnxwIfEs=;
 b=eN1orzfpY9HVDUlKwo/EENvAO7DUpuIHVrowMWa0dKDh05KBuR2sK5G+
 ZtgDVtMjvUaKSKPwHwP+MQ9Hsy8AQhaNyYIYXd4ToIEW4poFRseVvzvC8
 64EYGkuYk/YoTINe35PMxiu9j5nD13TX0ze1E/g6U/7qBFk+xXjxNX70Z
 dOglCzpsPV9c4eTnxVljjtiSo7jzGuCU7ofuoICisIyXrkAa582fk7CI6
 xpjUj1Z/P2ZKfPQtifMokXsbpJ6It9Cqs/a7odEFGcTeWx+yiCHMQaGq9
 39x7s/wRRJXnm2JqtFr9CIJiP2RV3MnBvxojSxAuqlyjKAv5jqt10N77O w==;
X-CSE-ConnectionGUID: AqvIjNZ9QdmccasSHXpzFg==
X-CSE-MsgGUID: tLmcZ0mIQzmSjvgjEK9a2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88181153"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="88181153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:03 -0700
X-CSE-ConnectionGUID: KsOe4eAyTnC1q6yLIcLisg==
X-CSE-MsgGUID: +PfvRArxQ/e6PvZdSUNRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="262917979"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RFC 4/4] drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF
 post-migration recovery
Date: Wed, 22 Apr 2026 19:49:56 -0700
Message-ID: <20260423024954.1665095-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
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

Multi-queue groups use CGP_SYNC H2G messages to notify GuC of queue
additions and priority changes. If a CGP_SYNC was in-flight when a VF
migration was detected, the response will never arrive and sync_pending
will be stuck set, causing a timeout on the next attempt.

Introduce a needs_cgp_sync flag in xe_guc_exec_queue (mirroring the
existing needs_resume / needs_suspend / needs_cleanup pattern) to track
this case:

- In guc_exec_queue_revert_pending_state_change(), if sync_pending is
  set on a multi-queue exec_queue, clear it (preventing a timeout on
  recovery) and set needs_cgp_sync, unless the queue is about to be
  re-registered (which will issue its own CGP_SYNC).

- In guc_exec_queue_replay_pending_state_change(), if needs_cgp_sync is
  set, push a STATIC_MSG_CGP_SYNC to the scheduler head so the CGP_SYNC
  is replayed after unpause.

Wire up the new CGP_SYNC_MSG opcode and STATIC_MSG_CGP_SYNC static
message slot, along with __guc_exec_queue_process_msg_cgp_sync() to
handle the message in the scheduler workqueue.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 39 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..f12843b80ca2 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	3
+#define MAX_STATIC_MSG_TYPE  4
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
@@ -64,6 +64,11 @@ struct xe_guc_exec_queue {
 	 * recovery.
 	 */
 	bool needs_resume;
+	/**
+	 * @needs_cgp_sync: Needs a CGP_SYNC message during VF post migration
+	 * recovery.
+	 */
+	bool needs_cgp_sync;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0e857ef06611..9cb72754215d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1886,11 +1886,20 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	kfree(msg);
 }
 
+static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+
+	if (guc_exec_queue_allowed_to_change_state(q))
+		guc_exec_queue_send_cgp_sync(q);
+}
+
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS			2
 #define SUSPEND				3
 #define RESUME				4
 #define SET_MULTI_QUEUE_PRIORITY	5
+#define CGP_SYNC_MSG			6
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -1917,6 +1926,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case SET_MULTI_QUEUE_PRIORITY:
 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
 		break;
+	case CGP_SYNC_MSG:
+		__guc_exec_queue_process_msg_cgp_sync(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2082,6 +2094,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_CLEANUP	0
 #define STATIC_MSG_SUSPEND	1
 #define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CGP_SYNC	3
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
@@ -2452,6 +2465,22 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 			  q->guc->id);
 	}
 
+	/*
+	 * If a CGP_SYNC was in flight when the VF was paused, clear the pending
+	 * flag to prevent a timeout during recovery. Only schedule a replay if
+	 * the queue won't be re-registered (which would include its own
+	 * CGP_SYNC as part of the registration process).
+	 */
+	if (xe_exec_queue_is_multi_queue(q) &&
+	    READ_ONCE(q->multi_queue.group->sync_pending)) {
+		WRITE_ONCE(q->multi_queue.group->sync_pending, false);
+		if (!(pending_enable && !pending_resume)) {
+			q->guc->needs_cgp_sync = true;
+			xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC - guc_id=%d",
+				  q->guc->id);
+		}
+	}
+
 	q->guc->resume_time = 0;
 }
 
@@ -2688,6 +2717,16 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 
 		q->guc->needs_resume = false;
 	}
+
+	if (q->guc->needs_cgp_sync) {
+		msg = q->guc->static_msgs + STATIC_MSG_CGP_SYNC;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, CGP_SYNC_MSG);
+		xe_sched_msg_unlock(sched);
+
+		q->guc->needs_cgp_sync = false;
+	}
 }
 
 static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.43.0

