Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3FCC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47510E071;
	Mon, 12 Aug 2024 02:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9dSqTYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB3810E065
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4pjEEuw4aw/ITCMbgSsDOumQkNkYatbpFbyF4+X9H0=;
 b=Y9dSqTYFztv/G0B/q+Dxi6w9HBd+GVjFQW2QgzeU9RAq6PIWVe085Cq6
 Ll72QHmdBwoZbsbOZoq5+6vuiYRBqWP2UZ7RB48LI3lh68YYUQW4EaOj9
 Sz9c1EbYRWmsL+NDFzVGnjlnWopNEoblLUd6iIHPrKDGXrGX07Tygxqbq
 qOlhDm1qNBULLP+EJz76weeTO31x1klLpDIBHRTxbKtcyrzdWRZbtrhBA
 Wv6mptQFnF5p0hco2B22vk3uB3mJ3gkPq8fi2vkiDOkTlgOJ1h5gdHgJi
 AI5TxQhgPmjcCbbg4SYGyV52HzSPI4MzU7QkD1UF1OzGxnL1iNqoRSIG+ g==;
X-CSE-ConnectionGUID: d+X/7/t4SHm/fph27/nSoA==
X-CSE-MsgGUID: 8F7rd5otRIGTWd9cBRgq7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099523"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099523"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: REQeMBy3QlKoKUp4VklOJA==
X-CSE-MsgGUID: 7Qjw4RpwSWy9zM1DX8MVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256305"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 7/8] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Sun, 11 Aug 2024 19:47:16 -0700
Message-Id: <20240812024717.3584636-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Reduce max jobs but 1 to avoid overflow of semaphores, directly set hwe
tail for ULLS, set current job sempahore, and supress submit H2G for
ULLS aside from first ULLS submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da63be550d4d..aa1e8a76bd0c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -706,7 +706,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 }
 
 #define RESUME_PENDING	~0x0ull
-static void submit_exec_queue(struct xe_exec_queue *q)
+static void submit_exec_queue(struct xe_sched_job *job, struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -716,6 +716,8 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	u32 num_g2h = 0;
 	int len = 0;
 	bool extra_submit = false;
+	bool ulls = test_bit(JOB_FLAG_ULLS, &job->fence->flags);
+	bool ulls_first = test_bit(JOB_FLAG_ULLS_FIRST, &job->fence->flags);
 
 	xe_assert(xe, exec_queue_registered(q));
 
@@ -724,6 +726,12 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	else
 		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 
+	if (ulls && !ulls_first)
+		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+
+	if (ulls)
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
 
@@ -740,13 +748,14 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 		set_exec_queue_pending_enable(q);
 		set_exec_queue_enabled(q);
 		trace_xe_exec_queue_scheduling_enable(q);
-	} else {
+	} else if (!ulls || ulls_first) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT;
 		action[len++] = q->guc->id;
 		trace_xe_exec_queue_submit(q);
 	}
 
-	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
+	if (!ulls || ulls_first || num_g2h)
+		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
 
 	if (extra_submit) {
 		len = 0;
@@ -777,7 +786,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 			register_exec_queue(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
-		submit_exec_queue(q);
+		submit_exec_queue(job, q);
 	}
 
 	if (lr) {
@@ -1435,6 +1444,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES);
 
 	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1449,11 +1459,15 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
 		INIT_LIST_HEAD(&ge->static_msgs[i].link);
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION) {
+		xe_assert(xe, LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1 < max_jobs);
+		max_jobs = LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1;
+	}
+
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    get_submit_wq(guc),
-			    q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    get_submit_wq(guc), max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.34.1

