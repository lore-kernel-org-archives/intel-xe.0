Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B28C44507
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 03:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B698910E4B9;
	Mon, 13 Jul 2026 03:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0ANzJTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81210E2C1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783911614; x=1815447614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGD9Cd37dL/f/tZh2SyrUyzyY9iGpKENk36wsVPVXsA=;
 b=G0ANzJTUPCTlPLDWj8MQ21NlZSHexOeMSg7LjB+zgc7eKrm7oQTtMJZF
 KoeEW125ZP4+B+zQrQcAcqP1NasUhH9KA5fYZD6ZJ4XFqXFfTUrfScNgC
 s1YxXlaSxczMuEyRRBCNj+vYHozr126tEoFGW+ERNGtlCjgq0f12MgM1B
 /SSVZJViwmjPZbVp9LPM76kCTcwYfjO2154strhf1IdSy4rbkiJOiF/Py
 NBIngp/cgzgud6XjIEZw0nUSlSrIUMtI1j+Ysc6hzg0m2DO2L5ocYacql
 lqykTRdng2ZCLrYyvzuH4tP82/oeBe1BJDlbZGCtgqkhzzw7+uBNS2ksF w==;
X-CSE-ConnectionGUID: +VKT7isiSBuZgWZMXUb8Ug==
X-CSE-MsgGUID: 5XVGQ/0mSxmZSxLQz+2WNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84372636"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84372636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:00:13 -0700
X-CSE-ConnectionGUID: 2RMnMG5NRZOmSuXt9d/1Kg==
X-CSE-MsgGUID: UW2mpXM1QPGV/jeMTtW2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256059820"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:00:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 5/6] drm/xe/guc: Add suspend refcount to exec queue ops
Date: Sun, 12 Jul 2026 20:00:09 -0700
Message-ID: <20260713030005.2123322-13-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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
index de9c131fc62d..5a30f17f5c28 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2188,15 +2188,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 
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
@@ -2330,14 +2336,20 @@ static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
 
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

