Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F41CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8D10F36A;
	Thu, 21 May 2026 14:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYKUR6KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86B10F353
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374943; x=1810910943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RH2ZXnuN8fZjmzBXz7CJ+Npr4lYr5kE5bWws6xUL6BU=;
 b=JYKUR6KOVKyss2g5i7HpXG5Y+kwCKBuN21u2n7melkQ3g7Ma2iqIgk+7
 H9ZBqCJUkK1KnhuXheU6MWa5kxpm2VPjle8bp8JAdxPfJ/7f/7CmqD0GT
 Te8kDJgxIuSn+e5n6CKxgWLrLJhfVDSTfuOAwrP9he12pPKd/6sCN2LIH
 KlxLazs9UqnT++przV65ThRT+ZTPB+3t8+915279ey0MSdmr0Jpv56gAE
 b6V4V4gQsp+Uoo7bMepy/XpE/3HAbC50eYvPzlr0OL1jpDnBXaMlEtcKJ
 7el09R+tZhjC5oZOP8yIyGmaHG/607vOxccMjDoNsPI6S8dlXZQwfTf04 g==;
X-CSE-ConnectionGUID: ox4u4tpjQCCnZQWBDwsyfw==
X-CSE-MsgGUID: b+60cDzrTf+PhqOxZM6ZDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80194431"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80194431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:03 -0700
X-CSE-ConnectionGUID: GrvPjvRwRleKGOOJlSI4dg==
X-CSE-MsgGUID: 87nCSKVYT1aoOxGRlS/mBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270893331"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/4] drm/xe/guc: Add suspend refcount to exec queue ops
Date: Thu, 21 May 2026 16:48:34 +0200
Message-ID: <20260521144837.7363-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
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

Add suspend_count to xe_guc_exec_queue. The SUSPEND message is only
sent on the 0->1 transition; the RESUME message is only sent on the
1->0 transition. Callers simply pair suspend and resume. The existing
sched.msg_lock spinlock serialises concurrent calls so neither side
needs to know about the other.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 24 ++++++++++++--------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..8ee76f958dc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
 	wait_queue_head_t suspend_wait;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
+	/**
+	 * @suspend_count: number of active suspend requests, protected by
+	 * @sched.msg_lock. The exec_queue is kept suspended as long as this
+	 * is non-zero. Transitions 0->1 send the SUSPEND message; transitions
+	 * 1->0 send the RESUME message.
+	 */
+	int suspend_count;
 	/**
 	 * @needs_cleanup: Needs a cleanup message during VF post migration
 	 * recovery.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4d32b430bc15..50b622cf0c30 100644
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

