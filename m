Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A4CD98C5
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jun 2026 21:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BFE10E128;
	Sun, 14 Jun 2026 21:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hj+w9xkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98510E128
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Jun 2026 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781471996; x=1813007996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IyJ0MJbh3lgcuIJze7vmAgey98KDQyFO8EZauJXHVk=;
 b=hj+w9xkD8FfjoV40ducNYgFDq5YS/OjALfTdkErCIUgGwAeZHq636tFo
 LQw9nUL6QA08dEeiqrUJjapj1l/ufzfBVrDLl6wP0mre5B4MaZ3PjFX0x
 Ok3CbmbVs4ZA6eT5Kzobb/LByQDbrj8CWmdJB+Y8xOn7RFSLsFGYSsZdx
 wwdbTLfbsHpfRyP0HxAU29/M+wBZ7k7fE/pI0rAjGMHVF66kDMb9Aj3Rx
 dCB4kkqPGjywSI7i+kc5haMXg95YSaS10yKE2hGIqKg19cQolEM6RIMwO
 fc47UCWXwenwI/TM6sXQWsxRFgwzsCPUGvyRavhiNhXc2nll9JyxWH1ZC g==;
X-CSE-ConnectionGUID: irD0zWhCS6SkDgmi7gljgw==
X-CSE-MsgGUID: r0qYceQMTgSwnLngD209rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92776313"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="92776313"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:19:55 -0700
X-CSE-ConnectionGUID: XviOGlneR+2mjrusE3JhnQ==
X-CSE-MsgGUID: CP42ui+1Rb61wN2sBvIkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="246412292"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:19:55 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 1/2] drm/xe/guc: Add suspend refcount to exec queue ops
Date: Sun, 14 Jun 2026 14:19:40 -0700
Message-ID: <20260614211944.1268917-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614211944.1268917-4-niranjana.vishwanathapura@intel.com>
References: <20260614211944.1268917-4-niranjana.vishwanathapura@intel.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Concurrent call sites that suspend exec queues (PM, mode switching,
preempt fences) each need to pair their own suspend/resume without
caring about other callers. Without coordination, a resume from one
path can prematurely re-enable a queue still suspended by another.

Add a reference count to exec queue suspend operations. A queue remains
suspended as long as any caller holds a suspend; it resumes only when
the last caller releases it. Each caller simply pairs its own suspend
with a resume without needing to know about others.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Co-authored-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 30 ++++++++++++++------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..1207d51cf770 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
 	wait_queue_head_t suspend_wait;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
+	/**
+	 * @suspend_count: Reference count of active suspend requests. The
+	 * exec_queue remains suspended while this is non-zero, allowing
+	 * multiple concurrent callers to independently hold a suspend without
+	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
+	 */
+	int suspend_count;
 	/**
 	 * @needs_cleanup: Needs a cleanup message during VF post migration
 	 * recovery.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afe5d99cdd8b..8803e70ae4fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2165,15 +2165,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
-	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
+	struct xe_guc_exec_queue *ge = q->guc;
+	struct xe_gpu_scheduler *sched = &ge->sched;
+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
 
 	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
 	xe_sched_msg_lock(sched);
-	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
-		q->guc->suspend_pending = true;
+	if (++ge->suspend_count == 1) {
+		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
+
+		/* slot must be free at 0->1 */
+		xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), added);
+		ge->suspend_pending = true;
+	}
 	xe_sched_msg_unlock(sched);
 
 	return 0;
@@ -2224,14 +2230,20 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
-	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
+	struct xe_guc_exec_queue *ge = q->guc;
+	struct xe_gpu_scheduler *sched = &ge->sched;
+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
-
 	xe_sched_msg_lock(sched);
-	guc_exec_queue_try_add_msg(q, msg, RESUME);
+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
+	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
+	if (--ge->suspend_count == 0) {
+		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
+
+		/* slot must be free at 1->0 */
+		xe_gt_assert(guc_to_gt(guc), added);
+	}
 	xe_sched_msg_unlock(sched);
 }
 
-- 
2.43.0

