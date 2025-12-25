Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8419E784B3
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9A0113F76;
	Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdZ71cwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1ED113F6E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTbu3yE0GrjIICulHY+gMvUJChUMpfrsL3u0+WQmTg0=;
 b=BdZ71cwl4XwU1grekygXkNGvxDw6vD4BwLz/JKDhSQXhHYijbEK/veQe
 Ww+b9SqcwduXTJ5pCm9Wei2iGb4iB+LNuzhcK8KEk4Vkb9+PxQjJKxYzr
 nnRp0pX1474G37ojZM3UGF2k5i+JOiYmemIdc/mvQ8qU0Iy39ebxn8PSn
 +bck4bKJKgm3LIfK0QHyv7aXWcNIMIYalM+FCQkVfkl63GWHkR+6c+bLZ
 v7rlMpFm+6Oc9o26DZuZ5yknOPaIkrv2fFVQo3/DT/ov5q29tpOKVo0iU
 geYiShv/uec00mkGLjAgo0pIaHpLhB9fcWUptlbiqOdUMFOHpcP+kgAyd w==;
X-CSE-ConnectionGUID: V2LROvTjQ+CUsxNZMdVW+A==
X-CSE-MsgGUID: VmkGM7FLQqC8chLI8Tc//g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866363"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: 7MtFkhz6S7uaDgUSR1iVjg==
X-CSE-MsgGUID: 7BdAImHIRSKNQkK63kMvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629143"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 09/13] drm/xe: Make scheduler message lock IRQ-safe
Date: Wed, 24 Dec 2025 17:17:30 -0800
Message-Id: <20251225011734.341683-10-matthew.brost@intel.com>
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

It is legal to modify deadlines in IRQ contexts, and deadlines can add
messages. Therefore, the scheduler message lock needs to be IRQ-safe.
Change xe_sched_msg_lock to use scoped_guard, which is IRQ-safe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 28 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 11 ++---------
 drivers/gpu/drm/xe/xe_guc_submit.c    | 23 ++++++++++------------
 3 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f4f23317191f..d0589cc333ac 100644
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
+	xe_sched_msg_lock(sched) {
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
+	xe_sched_msg_lock(sched) {
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
+	xe_sched_msg_lock(sched)
+		xe_sched_add_msg_locked(sched, msg);
 }
 
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index dceb2cd0ee5b..b0918ea3adbd 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -31,15 +31,8 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
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
+#define xe_sched_msg_lock(sched)	\
+	scoped_guard(spinlock_irqsave, &sched->msg_lock)
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7a4218f76024..76460b8ab407 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2329,10 +2329,10 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
-	xe_sched_msg_lock(sched);
-	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
-		q->guc->suspend_pending = true;
-	xe_sched_msg_unlock(sched);
+	xe_sched_msg_lock(sched) {
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
+	xe_sched_msg_lock(sched)
+		guc_exec_queue_try_add_msg(q, msg, RESUME);
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
@@ -2810,9 +2809,8 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 	if (q->guc->needs_suspend) {
 		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
-		xe_sched_msg_lock(sched);
-		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
-		xe_sched_msg_unlock(sched);
+		xe_sched_msg_lock(sched)
+			guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
 
 		q->guc->needs_suspend = false;
 	}
@@ -2825,9 +2823,8 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
 	if (q->guc->needs_resume) {
 		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 
-		xe_sched_msg_lock(sched);
-		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
-		xe_sched_msg_unlock(sched);
+		xe_sched_msg_lock(sched)
+			guc_exec_queue_try_add_msg_head(q, msg, RESUME);
 
 		q->guc->needs_resume = false;
 	}
-- 
2.34.1

