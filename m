Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D766CDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 02:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8E10E155;
	Thu, 25 Jun 2026 02:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzN34OYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739310E143
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782356035; x=1813892035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NqBcsO/rUEbfziTt82pQgeK3doWGWGvpJ2aMJP3j4T4=;
 b=kzN34OYFOt3fwllYbcuDeftkzSO2t7Gq0tUQmQ5JhAFM3dAPLnVsc/b7
 sdiLzGzkH3TXibFQNc2YB1qfwXeT7gj4gsyN18eymnNEeB8zaHoy4eHye
 K1iBOtho/Nu+S5IAmtiTkIkGSxp4xuqI5RYPIu2eeQAFD2dxbVJ6Bdr7l
 7ynDLdLZZhID6QV8nbkixpokzcnVjsqoOvACl14NjqcfW7MnX7IOLS+lk
 A/WqE3wosEmLmk2d+KEhTqdQm4S0G+zUecoVGOc6nKiVFiey9nCivjQOJ
 rLifaJhaGvSdvVIByL5sNAo735xLcPq4fr8v8aVABeKckjBDAYck+JOoi g==;
X-CSE-ConnectionGUID: W5GnV/v7RZOPmFGM3Nfnnw==
X-CSE-MsgGUID: MNm3UYfNRx+1pWErBnjrqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93781082"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93781082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
X-CSE-ConnectionGUID: Q1bVbTpPRqyt9PX6pw3nLw==
X-CSE-MsgGUID: CZbxw4F/SDqSvltxF9Cogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254118543"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 4/5] drm/xe/guc: Add suspend refcount to exec queue ops
Date: Wed, 24 Jun 2026 19:53:53 -0700
Message-ID: <20260625025348.1620469-11-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

With the lr.suspended flag a consumer already pairs its own suspend()
and resume() correctly, and no current path issues overlapping suspends
on the same queue.

Add a reference count to the exec queue suspend operations, as a small
self-contained building block for callers that can genuinely overlap.
A queue stays suspended as long as any caller holds a suspend and only
resumes once the last caller releases it, so each caller pairs its own
suspend/resume without needing to know about the others. This is what
the upcoming multi-queue support needs, where queues in a group share
a primary and may be suspended concurrently.

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
index 7363b8d1301b..fa5d85b19df9 100644
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
@@ -2243,14 +2249,20 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
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

