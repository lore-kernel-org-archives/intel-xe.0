Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FFFCD98CC
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90A510EBFA;
	Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhO5Egq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B6B10EC02
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kglvJEYvp3Y9kwUr0A+4eor+clw/asPGF/zzUOQ1O68=;
 b=KhO5Egq/+unXGQ/rRmRbAzzen5bChwVVD198scsIB74K2hkBXOYdjLO7
 HahxMLevI/2JHlxK8lvRTqjCAf4HuW3q84bAG1mLqBcUVbaSSC9ATsD9/
 j+I8b8aphmTtzzXohNPYB68jxghiHcXxOu6pd5A1qw3rXvTO+MdoDax7Z
 v4NJndS4XCBAO3QhNG0VqhmSOANy4LHiQrtl6NXTbwxIeYLbFhuVEAWNr
 rhaI58DYVaOg/TLge5XjyPW9/Kp/0FvY+WTXCbxdFZ8qV8rd0bb1ocLrt
 WPvrUS9mV+RKLuyGVyNUypcG13df5LdrJQiyrAo0pDkOxwPOmMLitWaQ1 w==;
X-CSE-ConnectionGUID: gI+1vwTnTnGUU3mow4pk9Q==
X-CSE-MsgGUID: oaxFza06SyOPdxqcqUJzEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934689"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934689"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: tj7qPuSHRlqZyVfxsC1cmA==
X-CSE-MsgGUID: c00szXGaTSmI1Y2vBRg2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292076"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 10/11] drm/xe: Enable per-queue ufence wake in ioctl and wake
 function
Date: Wed, 10 Jun 2026 21:28:42 +0000
Message-ID: <20260610212833.153366-23-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

Hook up the per-exec-queue user fence wait queue infrastructure
introduced in the previous patches:

- xe_wait_user_fence_wake(): if a specific user exec queue is supplied
  (non-NULL, still alive), wake only that queue's ufence_wq.  If no
  queue is supplied (default MSI-X vector), broadcast to xe->ufence_wq
  and every queue in ufence_list so no waiter is missed.  Kernel queues
  always use the default MSI-X vector and pass NULL, so any non-NULL @q
  here is guaranteed to be a user queue.

- xe_wait_user_fence_ioctl(): add and remove the wait entry on the
  per-queue ufence_wq when a queue is provided, falling back to the
  device-level ufence_wq otherwise.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 44 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 7c9d52b50580..1c14d89dff43 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -57,15 +57,39 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 /**
  * xe_wait_user_fence_wake() - Wake user fence waiters
  * @xe: the xe device
- * @q: exec queue (reserved; per-queue wake-up is enabled in a later patch)
+ * @q: exec queue whose user fence wait queue to wake, or NULL
  *
- * Wakes all user fence waiters on the device-level wait queue.
- * Per-exec-queue and ufence_list broadcast support are introduced in
- * subsequent patches once the full infrastructure is in place.
+ * If @q is non-NULL and still alive (a reference can be taken), wakes
+ * only that queue's per-queue wait queue.  Kernel queues always use the
+ * default MSI-X vector, which passes NULL here, so any non-NULL @q is
+ * always a user queue.
+ *
+ * If @q is NULL (default MSI-X vector or sync path), wakes the device-level
+ * wait queue and every per-exec-queue wait queue in ufence_list to ensure
+ * no waiter is missed.
  */
 void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q)
 {
-	wake_up_all(&xe->ufence_wq);
+	/*
+	 * Take a reference on the queue to guard against it being freed
+	 * concurrently. xe_exec_queue_get_unless_zero() handles a NULL @q,
+	 * so callers that don't specify a queue fall through to the broadcast.
+	 */
+	q = xe_exec_queue_get_unless_zero(q);
+	if (q) {
+		wake_up_all(&q->ufence_wq);
+		xe_exec_queue_put(q);
+	} else {
+		struct xe_exec_queue *iter;
+		unsigned long flags;
+
+		wake_up_all(&xe->ufence_wq);
+
+		spin_lock_irqsave(&xe->ufence_list_lock, flags);
+		list_for_each_entry(iter, &xe->ufence_list, ufence_link)
+			wake_up_all(&iter->ufence_wq);
+		spin_unlock_irqrestore(&xe->ufence_list_lock, flags);
+	}
 }
 
 static long to_jiffies_timeout(struct xe_device *xe,
@@ -122,9 +146,9 @@ static long to_jiffies_timeout(struct xe_device *xe,
  * performed as (@addr & @mask) OP @value, where OP is one of the
  * %DRM_XE_UFENCE_WAIT_OP_* operators.
  *
- * If an exec queue ID is provided, the wait is aborted early if the
- * queue enters a reset state. The device-level wait queue is used for
- * wakeups in all cases.
+ * If an exec queue ID is provided, the wait is scoped to that queue's
+ * per-queue wait queue and the wait is aborted early if the queue enters
+ * a reset state. Otherwise the device-level wait queue is used.
  *
  * On return, @timeout is updated to reflect the remaining time (or zero
  * on expiry), unless %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME is set.
@@ -170,7 +194,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 	start = ktime_get();
 
-	add_wait_queue(&xe->ufence_wq, &w_wait);
+	add_wait_queue(q ? &q->ufence_wq : &xe->ufence_wq, &w_wait);
 	for (;;) {
 		err = do_compare(addr, args->value, args->mask, args->op);
 		if (err <= 0)
@@ -203,7 +227,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
 	}
-	remove_wait_queue(&xe->ufence_wq, &w_wait);
+	remove_wait_queue(q ? &q->ufence_wq : &xe->ufence_wq, &w_wait);
 
 	if (!(args->flags & DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)) {
 		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
-- 
2.43.0

