Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A660FC2A085
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1F910E3B3;
	Mon,  5 Jan 2026 04:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK6Y9Oe6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9EE10E267
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6e6M4kk7T1blMdNzD6Ic4IqzsQbYLyykBRtKLR09MWs=;
 b=cK6Y9Oe69rNdZ5MPnspzXEiVNatItly3jWFrts9bQiMW4n/9KZ3usA2g
 jpG7MtPKkSpeehCgtjLk8x2XuCm2OeVedxzSNnCf2OpVsalYOffnGyl1q
 GpCS4rmFsbFljOFen8HmB8P5trFsJyY8Lz9kZIDAxXq4OwiAUcPGxtMr4
 S2StwdWQvImM9iAfbRZG0T3BPDyQG1bstyCYOtRrBlnXBD9vUhrLTCIDa
 ghlYu8kdHk/DT6Icpag19SO628SNcLyXu4aqfSjbV6uvmiQ9n9XOETInW
 +eB7VF6uI2hmlaforUnT0W6k2e3WM9EgTGUZRJkIU1E2tgCVQLDUWvitT Q==;
X-CSE-ConnectionGUID: UBAFO98DSpOON4ZVKVGnlA==
X-CSE-MsgGUID: J5q0rmjHTJyizpseFrSvBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856262"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: +pHqr7k4Sv2Ee40B4FV2wA==
X-CSE-MsgGUID: 1z1Z9Tf8TD2uC+s5shrlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060669"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 10/22] drm/xe: Make scheduler message lock IRQ-safe
Date: Sun,  4 Jan 2026 20:02:25 -0800
Message-Id: <20260105040237.1307873-11-matthew.brost@intel.com>
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

It is legal to modify deadlines in IRQ contexts (e.g., in a hrtimer),
and deadlines can add messages. Therefore, the scheduler message lock
needs to be IRQ-safe. Change xe_sched_msg_lock to use scoped_guard,
which is IRQ-safe.

v2:
 - Fix macro warnings (CI)
 - Rename macro as 'scoped_guard'

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 28 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 17 ++++++++--------
 drivers/gpu/drm/xe/xe_guc_submit.c    | 23 ++++++++++------------
 3 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f4f23317191f..8ea5480a517d 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -15,11 +15,12 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
 
-	xe_sched_msg_lock(sched);
-	msg = list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, link);
-	if (msg)
-		xe_sched_process_msg_queue(sched);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_scoped_guard(sched) {
+		msg = list_first_entry_or_null(&sched->msgs,
+					       struct xe_sched_msg, link);
+		if (msg)
+			xe_sched_process_msg_queue(sched);
+	}
 }
 
 static struct xe_sched_msg *
@@ -27,12 +28,12 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
 
-	xe_sched_msg_lock(sched);
-	msg = list_first_entry_or_null(&sched->msgs,
-				       struct xe_sched_msg, link);
-	if (msg)
-		list_del_init(&msg->link);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_scoped_guard(sched) {
+		msg = list_first_entry_or_null(&sched->msgs,
+					       struct xe_sched_msg, link);
+		if (msg)
+			list_del_init(&msg->link);
+	}
 
 	return msg;
 }
@@ -110,9 +111,8 @@ void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg)
 {
-	xe_sched_msg_lock(sched);
-	xe_sched_add_msg_locked(sched, msg);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_scoped_guard(sched)
+		xe_sched_add_msg_locked(sched, msg);
 }
 
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index dceb2cd0ee5b..269508c62b8c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -31,15 +31,14 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 			   struct xe_sched_msg *msg);
 
-static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
-{
-	spin_lock(&sched->msg_lock);
-}
-
-static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
-{
-	spin_unlock(&sched->msg_lock);
-}
+/**
+ * xe_sched_msg_scoped_guard() - Scoped guard for scheduler message lock
+ * @__sched: xe_gpu_scheduler object
+ *
+ * IRQ-safe scoped guard for scheduler message lock
+ */
+#define xe_sched_msg_scoped_guard(__sched)	\
+	scoped_guard(spinlock_irqsave, &(__sched)->msg_lock)
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7a4218f76024..07ffab338e4a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2329,10 +2329,10 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
-	xe_sched_msg_lock(sched);
-	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
-		q->guc->suspend_pending = true;
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_scoped_guard(sched) {
+		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
+			q->guc->suspend_pending = true;
+	}
 
 	return 0;
 }
@@ -2388,9 +2388,8 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
 
-	xe_sched_msg_lock(sched);
-	guc_exec_queue_try_add_msg(q, msg, RESUME);
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_scoped_guard(sched)
+		guc_exec_queue_try_add_msg(q, msg, RESUME);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
@@ -2810,9 +2809,8 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 	if (q->guc->needs_suspend) {
 		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
-		xe_sched_msg_lock(sched);
-		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
-		xe_sched_msg_unlock(sched);
+		xe_sched_msg_scoped_guard(sched)
+			guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
 
 		q->guc->needs_suspend = false;
 	}
@@ -2825,9 +2823,8 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 	if (q->guc->needs_resume) {
 		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 
-		xe_sched_msg_lock(sched);
-		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
-		xe_sched_msg_unlock(sched);
+		xe_sched_msg_scoped_guard(sched)
+			guc_exec_queue_try_add_msg_head(q, msg, RESUME);
 
 		q->guc->needs_resume = false;
 	}
-- 
2.34.1

