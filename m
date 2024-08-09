Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED2BC531DD
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124A10E9E6;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmvylBRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87A610E9E2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231120; x=1754767120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HLiXqA3pyAYSgCvv8/SKl6uPc0yaf3gkAd/jxCHO6o=;
 b=cmvylBRGTwti/Ex1161+1dxfPK0vfpyd8ZPtVw6usidvZxkwb1XXATzM
 EnCMIfXCPG1E40FuxaKAuesEZNAB83EANeKt8dx5T/v5KsgV2Fr4wDLXC
 Y6tK+C3KE2uOm+vYxZUUU1U5MqdGr9kksMAwgaXybR5GcBY+f74Rv+TRk
 wyNyFZ5D/ZFBm7iy2OGSfQ+7LfBlKClskt5n6gXQ83bG4wqt7ez5uIFzC
 leDHuRbhaoUEUzvcjJTv4iAgr28UXHi5LqSUWllAW/VkmUlzmbIhc7XP8
 6u/kRYUwuIaQ/ItfIO7qk1MjsWP1+NzaZyKiQnYn+FAgIIYtDfe9/X9+9 Q==;
X-CSE-ConnectionGUID: /3i7lEHMTsCkVKG5DPYsRg==
X-CSE-MsgGUID: 6F36qZhHQHKKNlp+PCMINA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566815"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: NyivS5W/QsimzfasozmQ3g==
X-CSE-MsgGUID: mjDe8YKfSlG3ploj/xQsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294759"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 5/5] drm/xe: Allow suspend / resume to be safely called
 multiple times
Date: Fri,  9 Aug 2024 12:19:29 -0700
Message-Id: <20240809191929.3138956-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Switching modes between LR and dma-fence can result in multiple calls to
suspend / resume. Make these calls safe while still enforcing call
order.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 40 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a9af33ff8aa7..c5a824981362 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1388,6 +1388,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 #define SET_SCHED_PROPS	2
 #define SUSPEND		3
 #define RESUME		4
+#define OPCODE_MASK	0xf
+#define MSG_LOCKED	(1 << 8)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
@@ -1432,7 +1434,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_guc_exec_queue *ge;
 	long timeout;
-	int err;
+	int err, i;
 
 	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1444,6 +1446,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_waitqueue_head(&ge->suspend_wait);
 
+	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
+		INIT_LIST_HEAD(&ge->static_msgs[i].link);
+
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
@@ -1506,11 +1511,26 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
 	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
 
 	INIT_LIST_HEAD(&msg->link);
-	msg->opcode = opcode;
+	msg->opcode = opcode & OPCODE_MASK;
 	msg->private_data = q;
 
 	trace_xe_sched_msg_add(msg);
-	xe_sched_add_msg(&q->guc->sched, msg);
+	if (opcode & MSG_LOCKED)
+		xe_sched_add_msg_locked(&q->guc->sched, msg);
+	else
+		xe_sched_add_msg(&q->guc->sched, msg);
+}
+
+static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
+				       struct xe_sched_msg *msg,
+				       u32 opcode)
+{
+	if (!list_empty(&msg->link))
+		return false;
+
+	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED);
+
+	return true;
 }
 
 #define STATIC_MSG_CLEANUP	0
@@ -1584,13 +1604,16 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
-	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
+	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
-	q->guc->suspend_pending = true;
-	guc_exec_queue_add_msg(q, msg, SUSPEND);
+	xe_sched_msg_lock(sched);
+	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
+		q->guc->suspend_pending = true;
+	xe_sched_msg_unlock(sched);
 
 	return 0;
 }
@@ -1624,13 +1647,16 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
 	xe_assert(xe, !q->guc->suspend_pending);
 
-	guc_exec_queue_add_msg(q, msg, RESUME);
+	xe_sched_msg_lock(sched);
+	guc_exec_queue_try_add_msg(q, msg, RESUME);
+	xe_sched_msg_unlock(sched);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
-- 
2.34.1

