Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD17C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 03:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F5010E533;
	Mon, 13 Jul 2026 03:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMf+lDIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047210E4B9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783911614; x=1815447614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OzaK+eDC2CPeYa3wxwHPI4bXuJpKD2GnhNJwWXoV8Bw=;
 b=TMf+lDIPhGtSbP/r1SNjKfF46WjrCUqhYSmO+/KjrBBKUQ6vw1dFcRsq
 1ro9Tvxkq2NCeX1q7rAjwuICxGVfipMccG2aO3Ytp4DqwK/mN1tEHFNq0
 Nl2ySjzQdLMdh4IjoYNJMZ5FR3MQwNKCxwYw7Bb5ykopF8owNJyPoXbPC
 Z9EpQNXtZe1rGNdeb7Stax2GSm3TNalTdCk7dNjG8vi+PhQ5hapflsCfY
 KOcL/0iWP8z+fv+DusPs5dTrNyr9Nged/dNjLHmTOEv0U/v3RRZRkKZ/K
 FG/estXMnOy8Ny0pORPxRZJ32YZQW17g59tbdBO10FoVpPVxIYAaqRcN4 Q==;
X-CSE-ConnectionGUID: OhCHb0XxSAq1h+NJJQG3Rg==
X-CSE-MsgGUID: +33905QYQlCagzY0TwOwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84372632"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84372632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:00:12 -0700
X-CSE-ConnectionGUID: wHOR+/LCSUiPBn9YEPp8Cg==
X-CSE-MsgGUID: QMSqvRhlT/ul531Tdzqopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256059814"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:00:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 3/6] drm/xe/guc: add uninterruptible suspend wait for
 cross-process cleanup
Date: Sun, 12 Jul 2026 20:00:07 -0700
Message-ID: <20260713030005.2123322-11-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
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

Add a suspend_wait_blocking() exec queue op: an uninterruptible variant
of suspend_wait() for callers that must complete a suspend on behalf of a
queue that may belong to a different process than the calling task (e.g.
cleanup/undo paths). An interruptible suspend_wait() returns -ERESTARTSYS
when the calling task is signalled, which would leave the other process's
queue suspended forever - a cross-process DoS.

The blocking variant waits uninterruptibly and, on a genuine GuC timeout,
bans and tears down the queue like suspend_wait() (shared via
guc_exec_queue_suspend_timeout_ban()). It deliberately does not handle VF
recovery since a blocking caller cannot retry.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
 drivers/gpu/drm/xe/xe_execlist.c         |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index dbb2ee8eb5de..0aa0823cbdaa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -322,6 +322,15 @@ struct xe_exec_queue_ops {
 	 * avoidance mechanism.
 	 */
 	int (*suspend_wait)(struct xe_exec_queue *q);
+	/**
+	 * @suspend_wait_blocking: Like @suspend_wait, but waits uninterruptibly
+	 * (does not abort on the calling task's signals). For cleanup/undo paths
+	 * that must complete a suspend on behalf of a queue that may belong to a
+	 * different process than the caller: a signal to the caller must not
+	 * abandon the wait, which would leave the other process's queue
+	 * suspended forever (cross-process DoS). A timeout bans like suspend_wait.
+	 */
+	int (*suspend_wait_blocking)(struct xe_exec_queue *q);
 	/**
 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
 	 * state and dma fence returned from most recent suspend call must be
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 6b86b4f9cc1c..cc33ae80e8cf 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -468,6 +468,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
+	.suspend_wait_blocking = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3ece51451f86..de9c131fc62d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2290,6 +2290,44 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	return ret < 0 ? ret : 0;
 }
 
+static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	/*
+	 * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers
+	 * that must complete the wait on behalf of a queue possibly owned by a
+	 * different process (e.g. cleanup/undo paths). An interruptible wait
+	 * could return -ERESTARTSYS if the calling task is signalled, leaving
+	 * that queue suspended forever (cross-process DoS).
+	 *
+	 * A timeout is still a real per-queue fault, so it bans and cleans up
+	 * like suspend_wait(). VF recovery is deliberately not handled (no
+	 * -EAGAIN) since a blocking caller cannot retry.
+	 */
+	q = xe_exec_queue_multi_queue_primary(q);
+
+#define WAIT_COND \
+	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
+	 xe_guc_read_stopped(guc))
+
+	if (IS_SRIOV_VF(xe))
+		ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
+	else
+		ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND, HZ * 5);
+
+#undef WAIT_COND
+
+	if (!ret) {
+		guc_exec_queue_suspend_timeout_ban(q);
+		return -ETIME;
+	}
+
+	return 0;
+}
+
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
@@ -2329,6 +2367,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
+	.suspend_wait_blocking = guc_exec_queue_suspend_wait_blocking,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
 };
-- 
2.43.0

