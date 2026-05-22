Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DD8CD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2110F68D;
	Fri, 22 May 2026 16:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PidAjzzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B9F10E297
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779468266; x=1811004266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATVZHnZlBZx0B07KevvJDqOpczCJcbkuNfV0S0ZnZ7M=;
 b=PidAjzzHUnTe7BWwoYwgzzhKbwPDfVJUexvbCBJe9d9MzDld2VIsKG2o
 69po9i2FT/hr7AXw4A2TIwxmAzt0+jUY8paK7GJgURiLdeXMDApnpxlyH
 qrljUws+OFrg0tu5vg83rRSp/W9ATwRUSu9GMrt5HzYbfsCukSd5lExRS
 HDeMIaXkH0+IM7FDbWJpMz4cjWCgzJAJHSpLKzdqK4IADISyw2T+qTTIZ
 bXHZMcuezLpr/ww5qkoupZU9QdJad+Wewe9DP4Xr2NBDf2rQ5MisYIZUS
 tDPWk6ODzdd7PTf/2t5fLUM2WjoYUsBKrD+ei8TT/0DRDa2cHw4CL3N18 A==;
X-CSE-ConnectionGUID: sfnReT9QSVicEYl5wc/V5A==
X-CSE-MsgGUID: OuHWTB9ARX2l2mWDOpPq6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80453398"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80453398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:26 -0700
X-CSE-ConnectionGUID: C8ncD3cRROStv3v30AvnYQ==
X-CSE-MsgGUID: hjD6e+OuRsKpCIoxXJOCcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238370118"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.219])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/5] drm/xe/guc: Add suspend refcount to exec queue ops
Date: Fri, 22 May 2026 18:43:53 +0200
Message-ID: <20260522164355.2773-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
References: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
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

Concurrent call sites that suspend exec queues (PM, mode switching,
preempt fences) each need to pair their own suspend/resume without
caring about other callers. Without coordination, a resume from one
path can prematurely re-enable a queue still suspended by another.

Add a reference count to exec queue suspend operations. A queue remains
suspended as long as any caller holds a suspend; it resumes only when
the last caller releases it. Each caller simply pairs its own suspend
with a resume without needing to know about others.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 24 ++++++++++++--------
 2 files changed, 22 insertions(+), 9 deletions(-)

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
index 42bc7425de0d..7da7db2059ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2131,15 +2131,18 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 
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
+		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
+			ge->suspend_pending = true;
+	}
 	xe_sched_msg_unlock(sched);
 
 	return 0;
@@ -2190,14 +2193,17 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
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
+	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
+	if (--ge->suspend_count == 0) {
+		xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
+		guc_exec_queue_try_add_msg(q, msg, RESUME);
+	}
 	xe_sched_msg_unlock(sched);
 }
 
-- 
2.54.0

