Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA06C44508
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 02:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD3410E2A6;
	Sat, 11 Jul 2026 02:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr417ssd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E54C10E290
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jul 2026 02:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783735506; x=1815271506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nBVvW9maM9sJdrc+XIIGbz0NOGlP3E0Bu4guaLehUzw=;
 b=fr417ssdPv4DoU41IAOLo+dEyrayEnAhyozpdNYHzH0VE3Qp0ppXI9E5
 d4CwN1MAUp65/FBREPdKgwSYHLlFeTdAB3I8xBnHztaRGS2qTM+Yg+m51
 ln/Yhkz6XgKSJVcHZ8IbkWISI56PKd2yj7o7yopJ8qXLDReqiGvvGDk57
 XGQWuIjzvTZ5qngCB8RX8+Hn83qOC52WHyeCn85GGMi5wg7ViPowSMcJD
 zXDXaB0PSktOCIYL3R8STN88hjWYr3xUUnMmn+QCThZO3/7H4wpSj9/cA
 hZ+ZFSHNWwmcoErA+JdQbLs/HjxJF0YpojX2vEvZR/HbFga7T7RaLJDRs A==;
X-CSE-ConnectionGUID: adkAxqqwRzCoawhd/DRVNg==
X-CSE-MsgGUID: W62kmC3OTYWtu6bkWX67UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71957066"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71957066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:06 -0700
X-CSE-ConnectionGUID: TDa3nhTRQ9WVxmUX+W0Z0A==
X-CSE-MsgGUID: YPBh46AFQa264eMMMXrbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248654403"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 4/6] drm/xe/hw_engine_group: propagate suspend failures
 during mode switch
Date: Fri, 10 Jul 2026 19:05:01 -0700
Message-ID: <20260711020459.2049523-12-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711020459.2049523-8-niranjana.vishwanathapura@intel.com>
References: <20260711020459.2049523-8-niranjana.vishwanathapura@intel.com>
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

The hw engine group fault-mode switch suspends all faulting LR queues
but ignored the suspend()/suspend_wait() return value. A suspend() can
fail (e.g. the queue is killed/banned/wedged), leaving the queue
un-suspended, so silently continuing could later resume a queue that was
never suspended.

Propagate the failure instead: in xe_hw_engine_group_add_exec_queue()
bail out if suspend() fails, and in
xe_hw_engine_group_suspend_faulting_lr_jobs() undo the partial suspend
via a new err_resume path that resumes the sibling queues already
suspended in this call. Record per-queue success with lr.suspended so
only queues that were actually suspended are waited on and resumed, and
skip the cleanup resume() when suspend_wait() failed or the queue was
reset/killed/banned/wedged (its suspend may not have completed, so
resuming would trip the !suspend_pending assert in the resume path;
teardown resolves its state instead).

Gate the group resume worker (hw_engine_group_resume_lr_jobs_func()) on
lr.suspended for the same reason, so it only resumes queues that were
actually suspended.

v2: Don't let a dying queue block the switch (Matt Brost)

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 85 ++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 02cf32ae5aa9..0804b426b6f9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -34,6 +34,15 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		/*
+		 * Only resume queues that were actually suspended. A queue whose
+		 * suspend() failed (e.g. killed/banned/wedged) was never
+		 * suspended, so it must not be resumed.
+		 */
+		if (!READ_ONCE(q->lr.suspended))
+			continue;
+
+		WRITE_ONCE(q->lr.suspended, false);
 		q->ops->resume(q);
 	}
 
@@ -140,7 +149,18 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 		return err;
 
 	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
-		q->ops->suspend(q);
+		/*
+		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
+		 * queue un-suspended. Propagate the failure so the queue is not
+		 * added; on failure nothing was suspended, so there is nothing to
+		 * undo. Only record the queue as suspended (and later resume it)
+		 * once suspend() has succeeded.
+		 */
+		err = q->ops->suspend(q);
+		if (err)
+			goto err_suspend;
+
+		WRITE_ONCE(q->lr.suspended, true);
 		err = q->ops->suspend_wait(q);
 		if (err)
 			goto err_suspend;
@@ -216,8 +236,22 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			return -EAGAIN;
 
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
+		/*
+		 * suspend() only fails when the queue is killed/banned/wedged.
+		 * Such a queue is being torn down (its removal from HW is handled
+		 * by the kill/ban teardown), so it is not a live fault-mode
+		 * context the mode switch must preempt. Skip it rather than
+		 * failing the switch, otherwise one dying sibling would block a
+		 * dma-fence submission on the healthy queues in the group. Only
+		 * queues recorded as suspended below are later waited on and
+		 * resumed.
+		 */
+		err = q->ops->suspend(q);
+		if (err)
+			continue;
+
+		WRITE_ONCE(q->lr.suspended, true);
 		need_resume = true;
-		q->ops->suspend(q);
 		gt = q->gt;
 	}
 
@@ -225,9 +259,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		/* Only wait on queues that were actually suspended above. */
+		if (!READ_ONCE(q->lr.suspended))
+			continue;
+
 		err = q->ops->suspend_wait(q);
 		if (err)
-			return err;
+			goto err_resume;
 	}
 
 	if (gt) {
@@ -240,6 +278,47 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 
 	return 0;
+
+err_resume:
+	/*
+	 * A suspend_wait() failed partway through the mode switch. Resume the
+	 * sibling queues that were already suspended in this call so they are
+	 * not left suspended forever.
+	 *
+	 * resume() requires the suspend to have completed (suspend_pending
+	 * cleared) or it trips the !suspend_pending assert. So skip the resume
+	 * when either:
+	 *  - suspend_wait_blocking() fails: on a GuC timeout it bans the queue
+	 *    and triggers cleanup, so the queue is being torn down; or
+	 *  - reset_status() is true: the queue was reset/killed/banned/wedged.
+	 *    suspend_wait() can return success in this case via its killed/
+	 *    stopped wait condition while suspend_pending is still set, and the
+	 *    queue is being torn down anyway, so its state is resolved by
+	 *    teardown rather than by a resume here.
+	 * In either case leave the queue marked suspended.
+	 *
+	 * Use the *blocking* (uninterruptible) wait here: the queues resumed on
+	 * this path may belong to a different process than the one that
+	 * triggered the mode switch. An interruptible suspend_wait() would
+	 * return -ERESTARTSYS if the triggering task is signalled, skip the
+	 * resume, and leave the other process's queue suspended forever
+	 * (cross-process DoS).
+	 */
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_fault_mode(q->vm))
+			continue;
+
+		if (!READ_ONCE(q->lr.suspended))
+			continue;
+
+		if (q->ops->suspend_wait_blocking(q) || q->ops->reset_status(q))
+			continue;
+
+		WRITE_ONCE(q->lr.suspended, false);
+		q->ops->resume(q);
+	}
+
+	return err;
 }
 
 /**
-- 
2.43.0

