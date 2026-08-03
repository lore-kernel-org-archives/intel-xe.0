Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2C7C55ABA
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 23:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D54110E7F0;
	Mon,  3 Aug 2026 23:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jm6l/NyT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3796210E471
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785798339; x=1817334339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=veVTQ9quVbs+GBGU1zz97MIq4m7koRSre0OStZSy9oc=;
 b=Jm6l/NyTEGmcn3ulXJJhvdGsqPHm2gQ1zM12iqxegsghtC0mw5YovniO
 HLQyfp10rjNIyH9HZ2rsmcTMHseGJ7kZzD5jqTCUZ7vnYQtdzwMjOE7GR
 I/ZIxcZAPe80sP3rKbIYdNlBIoVnIbq/zK9wKqQ71cBdsslOAqraEe9jw
 VpojOpBQ0aEJWbu/u6Q7JtgGRAnZeffkplwRgxJ3Zakh5wK3SGcMN13ra
 KqPU8t6OI6SxtyFIwRL14cG6mkbrszsf7XUKQKR6I6C7AySvuRVQV3/oH
 X6yZt95tGl53oUUcg0AabnUBT9pp258HnZGCcPn9QYKvp2eXzS1hFyrey Q==;
X-CSE-ConnectionGUID: 6nrki2k2Si2c+LteMSpS/A==
X-CSE-MsgGUID: pRuZ71R3Rxm+7eNbhSASGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111899769"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="111899769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:38 -0700
X-CSE-ConnectionGUID: A1LD5PJrT/6f9mYm+nAFNw==
X-CSE-MsgGUID: X9/gJB82TEaEBZBVYdr7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255054437"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 4/4] drm/xe/multi_queue: replay dynamic CGP updates lost
 during VF migration
Date: Mon,  3 Aug 2026 16:05:33 -0700
Message-ID: <20260803230528.3428029-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
References: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
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

When guc_exec_queue_revert_pending_state_change() sets needs_cgp_sync for
a queue, replay that update during unpause by injecting a CGP_SYNC_MSG
static message at the head of the scheduler queue.

The message handler __guc_exec_queue_process_msg_cgp_sync() calls
guc_exec_queue_send_cgp_sync() which re-reads the current priority from
q->multi_queue.priority and re-issues the CGP write + CGP_SYNC H2G, so
the queue's CGP entry is restored to the correct value after migration.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 28 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 573b920edb41..d27826b36649 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	3
+#define MAX_STATIC_MSG_TYPE	4
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c018bc0d8d6f..9036f89dff7d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1960,11 +1960,25 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	kfree(msg);
 }
 
+static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+
+	/*
+	 * Replay a dynamic CGP update lost across VF migration by re-issuing the
+	 * CGP update + CGP_SYNC (re-applies the current priority from
+	 * q->multi_queue.priority).
+	 */
+	if (guc_exec_queue_allowed_to_change_state(q))
+		guc_exec_queue_send_cgp_sync(q, 0);
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
@@ -1991,6 +2005,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case SET_MULTI_QUEUE_PRIORITY:
 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
 		break;
+	case CGP_SYNC_MSG:
+		__guc_exec_queue_process_msg_cgp_sync(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2160,6 +2177,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_CLEANUP	0
 #define STATIC_MSG_SUSPEND	1
 #define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CGP_SYNC	3
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
@@ -3024,6 +3042,16 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg;
 
+	if (q->guc->multi_queue.needs_cgp_sync) {
+		msg = q->guc->static_msgs + STATIC_MSG_CGP_SYNC;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, CGP_SYNC_MSG);
+		xe_sched_msg_unlock(sched);
+
+		q->guc->multi_queue.needs_cgp_sync = false;
+	}
+
 	if (q->guc->needs_cleanup) {
 		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-- 
2.43.0

