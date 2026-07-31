Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C8C55173
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D30710F43B;
	Fri, 31 Jul 2026 23:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etkxfVji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C409A10E271
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540393; x=1817076393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsNu70dtUZx1uwOgYNJdrkG5EabuQWedekzty/LlmFM=;
 b=etkxfVjiYUA+pJQFHmxTCdoRXnVAU72TdWEtuF7vzsz2KN8E8LQAMZGM
 ra+o98c0+6Bk9Vw46eREMM1wqwd8EsrVxifS0YMeseK2W1MvmUaDPfUm8
 w+lDSwyAYJmfyZKrhgrtS6ff+bV9mB6nRPQlScQ33wsU4wlOlUzNyfeMo
 THw/h0ee+CHKFiTGMOvyIOvBXFuQnNret6En6Iz+K/3wQbg7PCEaqyjXg
 wS9mWF3cWbj4iya6nL8gOFUNCtT2lSB0SYok0189KLSUlzxbj+2bij6vZ
 qCrTkFq8Sq6Gr8sNXEjbPyA8M0+IeKx7ONjqu2lgYCT4Z7ibE8dzhdWNY g==;
X-CSE-ConnectionGUID: LNTJ2hvyQa6e8mOK1T0odw==
X-CSE-MsgGUID: 9v7fUeXJQ72klgUSU2rvfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86120836"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86120836"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:32 -0700
X-CSE-ConnectionGUID: EEuuU3OmSV6HY1gYXlvcqg==
X-CSE-MsgGUID: U4TXMs+5QyGVyI8zxlA8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="260112417"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 3/4] drm/xe/multi_queue: track and recover lost CGP updates
 across VF migration
Date: Fri, 31 Jul 2026 16:26:26 -0700
Message-ID: <20260731232625.3313657-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When a CGP_SYNC (or REGISTER_CONTEXT_MULTI_QUEUE with CGP) is in flight
during VF migration, GuC loses the message and never sends CGP_SYNC_DONE.
Two failure modes exist:

1. The send was already issued (CGP_SYNC_DONE not received):
   group->sync_pending stays set and cgp_update_q points to the queue
   that owns the outstanding sync.

2. The wait woke early (send not issued):
   The queue returned from xe_guc_exec_queue_group_cgp_sync() without
   sending after vf_recovery() became true.

Track which kind of sync is outstanding (registering_cgp / updating_cgp)
and the owning queue (cgp_update_q) so
guc_exec_queue_revert_pending_state_change()
can recover both cases:
- A registration-time CGP bails or is lost  → clear registered flag so
  run_job re-registers after unpause (re_register / registering_cgp paths).
- A dynamic CGP update bails or is lost → set needs_cgp_sync so replay
  re-issues the update after unpause (re_update / updating_cgp paths).

Tag all registration call sites with CGP_SYNC_REGISTRATION so the bail
path distinguishes them from dynamic updates.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   7 ++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  30 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 112 +++++++++++++++++--
 3 files changed, 141 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 53b6c0bf4849..b2276559c2f6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -70,6 +70,13 @@ struct xe_exec_queue_group {
 	spinlock_t suspend_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
+	/**
+	 * @cgp_update_q: Queue that issued the currently outstanding (sent)
+	 * CGP_SYNC or REGISTER_CONTEXT_MULTI_QUEUE; NULL when none is
+	 * outstanding. Used during VF recovery to identify and replay the
+	 * message whose CGP_SYNC_DONE was not received.
+	 */
+	struct xe_exec_queue *cgp_update_q;
 	/** @banned: Group banned */
 	bool banned;
 	/** @stopped: Group is stopped, protected by list_lock */
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index acdc24d1a6bd..573b920edb41 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -76,6 +76,36 @@ struct xe_guc_exec_queue {
 	 * recovery.
 	 */
 	bool needs_resume;
+	/** @multi_queue: multi-queue group CGP state for VF post migration recovery */
+	struct {
+		/**
+		 * @multi_queue.needs_cgp_sync: Needs a CGP_SYNC (dynamic CGP
+		 * update) message replayed during recovery.
+		 */
+		u8 needs_cgp_sync:1;
+		/**
+		 * @multi_queue.re_register: A registration-time CGP update was
+		 * interrupted by recovery; the queue must be re-registered.
+		 */
+		u8 re_register:1;
+		/**
+		 * @multi_queue.re_update: A dynamic CGP update was interrupted
+		 * by recovery; the CGP update must be replayed.
+		 */
+		u8 re_update:1;
+		/**
+		 * @multi_queue.registering_cgp: This queue's currently
+		 * outstanding CGP_SYNC is a registration (matched against
+		 * group->cgp_update_q in revert).
+		 */
+		u8 registering_cgp:1;
+		/**
+		 * @multi_queue.updating_cgp: This queue's currently outstanding
+		 * CGP_SYNC is a dynamic update (matched against
+		 * group->cgp_update_q in revert).
+		 */
+		u8 updating_cgp:1;
+	} multi_queue;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13d0ab8052e5..c018bc0d8d6f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -800,9 +800,12 @@ static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
 	}
 }
 
+#define CGP_SYNC_REGISTRATION			BIT(0)
+
 static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 					     struct xe_exec_queue *q,
-					     const u32 *action, u32 len)
+					     const u32 *action, u32 len,
+					     unsigned int flags)
 {
 	struct xe_exec_queue_group *group = q->multi_queue.group;
 	struct xe_device *xe = guc_to_xe(guc);
@@ -829,17 +832,45 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 		return;
 	}
 
+	/*
+	 * If woken by VF migration recovery, do not touch the CGP or send: the
+	 * message would be lost and, for a registration, GuC must (re-)register
+	 * the context before its CGP entry may be read. Flag the queue so revert
+	 * replays it - a registration by re-registration, a dynamic update by a
+	 * replayed CGP_SYNC - and bail.
+	 */
+	if (vf_recovery(guc)) {
+		if (flags & CGP_SYNC_REGISTRATION)
+			q->guc->multi_queue.re_register = true;
+		else
+			q->guc->multi_queue.re_update = true;
+		return;
+	}
+
 	scoped_guard(spinlock, &q->multi_queue.lock)
 		priority = q->multi_queue.priority;
 
 	xe_lrc_set_multi_queue_priority(q->lrc[0], priority);
 	xe_guc_exec_queue_group_cgp_update(xe, q);
 
+	/*
+	 * Record the nature of this outstanding sync so revert can replay it if
+	 * its CGP_SYNC_DONE is lost across a migration: a registration is
+	 * recovered by re-registration, a dynamic update by a replayed CGP_SYNC.
+	 */
+	if (flags & CGP_SYNC_REGISTRATION) {
+		q->guc->multi_queue.registering_cgp = true;
+		q->guc->multi_queue.updating_cgp = false;
+	} else {
+		q->guc->multi_queue.updating_cgp = true;
+		q->guc->multi_queue.registering_cgp = false;
+	}
+	WRITE_ONCE(group->cgp_update_q, q);
 	WRITE_ONCE(group->sync_pending, true);
 	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
 }
 
-static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
+static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q, unsigned int flags)
 {
 #define MAX_MULTI_QUEUE_CGP_SYNC_SIZE	(2)
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -853,7 +884,7 @@ static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
 	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
 #undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
 
-	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len, flags);
 }
 
 static void __register_exec_queue_group(struct xe_exec_queue *q,
@@ -881,7 +912,8 @@ static void __register_exec_queue_group(struct xe_exec_queue *q,
 	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
 	 * from guc.
 	 */
-	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len,
+					 CGP_SYNC_REGISTRATION);
 }
 
 static void __register_mlrc_exec_queue(struct xe_guc *guc,
@@ -1041,7 +1073,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 		init_policies(guc, q);
 
 	if (xe_exec_queue_is_multi_queue_secondary(q))
-		guc_exec_queue_send_cgp_sync(q);
+		guc_exec_queue_send_cgp_sync(q, CGP_SYNC_REGISTRATION);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
@@ -1923,7 +1955,7 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 	struct xe_exec_queue *q = msg->private_data;
 
 	if (guc_exec_queue_allowed_to_change_state(q))
-		guc_exec_queue_send_cgp_sync(q);
+		guc_exec_queue_send_cgp_sync(q, 0);
 
 	kfree(msg);
 }
@@ -2716,6 +2748,57 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 			  q->guc->id);
 	}
 
+	/*
+	 * A registration time CGP update that bailed when woken by VF recovery.
+	 * Re-register the queue.
+	 */
+	if (q->guc->multi_queue.re_register) {
+		clear_exec_queue_registered(q);
+		q->guc->multi_queue.re_register = false;
+		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER (cgp) - guc_id=%d",
+			  q->guc->id);
+	}
+
+	/*
+	 * If a CGP update gets dropped during migration, CGP_SYNC_DONE will not
+	 * be received (sync_pending still set and this queue owns it). Recover
+	 * it the same way and clear the stuck sync_pending.
+	 */
+	if (xe_exec_queue_is_multi_queue(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		if (q == READ_ONCE(group->cgp_update_q) &&
+		    READ_ONCE(group->sync_pending)) {
+			if (q->guc->multi_queue.registering_cgp) {
+				clear_exec_queue_registered(q);
+				xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER (cgp sync) - guc_id=%d",
+					  q->guc->id);
+			} else if (q->guc->multi_queue.updating_cgp) {
+				q->guc->multi_queue.needs_cgp_sync = true;
+				xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC - guc_id=%d",
+					  q->guc->id);
+			}
+			q->guc->multi_queue.registering_cgp = false;
+			q->guc->multi_queue.updating_cgp = false;
+			WRITE_ONCE(group->cgp_update_q, NULL);
+			WRITE_ONCE(group->sync_pending, false);
+		}
+	}
+
+	/*
+	 * A dynamic-time CGP update that bailed when woken by VF recovery.
+	 * Replay the dynamic CGP update unless the queue is registered or being
+	 * re-registered, which re-does the CGP anyway.
+	 */
+	if (q->guc->multi_queue.re_update) {
+		q->guc->multi_queue.re_update = false;
+		if (exec_queue_registered(q)) {
+			q->guc->multi_queue.needs_cgp_sync = true;
+			xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC (re-update) - guc_id=%d",
+				  q->guc->id);
+		}
+	}
+
 	q->guc->resume_time = 0;
 }
 
@@ -3424,7 +3507,8 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_exec_queue *q;
+	struct xe_exec_queue_group *group;
+	struct xe_exec_queue *q, *upd_q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
@@ -3441,8 +3525,20 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
 		return -EPROTO;
 	}
 
+	/*
+	 * The outstanding CGP update is now confirmed; clear the owning queue's
+	 * tracking so a later migration does not needlessly replay it.
+	 */
+	group = q->multi_queue.group;
+	upd_q = READ_ONCE(group->cgp_update_q);
+	if (upd_q) {
+		upd_q->guc->multi_queue.registering_cgp = false;
+		upd_q->guc->multi_queue.updating_cgp = false;
+		WRITE_ONCE(group->cgp_update_q, NULL);
+	}
+
 	/* Wakeup the serialized cgp update wait */
-	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
+	WRITE_ONCE(group->sync_pending, false);
 	xe_guc_ct_wake_waiters(&guc->ct);
 
 	return 0;
-- 
2.43.0

