Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0149C43458
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 02:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9658810E295;
	Sat, 11 Jul 2026 02:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEre9XO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B69610E290
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jul 2026 02:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783735506; x=1815271506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZwW0Y1pydhIPsXZVVH4v9CgBXR+u+htzOjPNROOQPAs=;
 b=cEre9XO8gAmqZb+VnzDcVgU+QeE6pMTgV/P9yVd7+YkQKk7+aByz4SWw
 KocLpR9p6+Wp7IVM6AOPwXO5JD8kxlVOGxZdZ1PQPjjnFR0aVK0UcdXQC
 uG03Osj2tdc95oRQCQomec82aUaVZHqSNu6XlitvHpaUCgpJUNzAcCfVH
 i5QclQ9WzO4ujANtn02nqNwAsqDBo++VhliRac0q4tpqwlvwdWMlmnpxz
 OXpzZddpAw1mE0muSxwR4rOvBdy0j0Ezjqe3ntmR+c078dBIAWISET2pi
 TGCXmP8i6egZDKM8eOWgDPXWnWZbCxny8kTm+0hNz95Dej0FlVz++o6fw A==;
X-CSE-ConnectionGUID: WcbnrUJFQgqXh8WI692FiA==
X-CSE-MsgGUID: FtDc9qfuQ6G6CvK9PXNW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71957064"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71957064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:06 -0700
X-CSE-ConnectionGUID: zOHToSAmRsOdWCz4Li4Q7A==
X-CSE-MsgGUID: jczGCQqmQR6KU2eOeJK0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248654395"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 2/6] drm/xe/guc: ban exec queue on suspend timeout
Date: Fri, 10 Jul 2026 19:04:59 -0700
Message-ID: <20260711020459.2049523-10-niranjana.vishwanathapura@intel.com>
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

Harden guc_exec_queue_suspend_wait():

 - In multi-queue mode the primary owns the group's GuC scheduling
   context, so wait on the primary's suspend to complete.

 - On timeout, ban the queue and trigger cleanup rather than leaving it
   suspended forever. Clearing suspend_pending via __suspend_fence_signal()
   lets a subsequent resume() proceed without tripping the
   !suspend_pending assert. A timeout on the primary wedges the whole
   group, so ban and tear down the entire group in the multi-queue case.
   The ban/cleanup is factored into guc_exec_queue_suspend_timeout_ban().

Add a note that on a signal (-ERESTARTSYS) the queue is not banned and
the suspend is not confirmed complete, so callers must not resume()
without re-confirming.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 53 +++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cec3bbf3a10e..3ece51451f86 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2202,12 +2202,53 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
+static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	xe_gt_warn(guc_to_gt(guc),
+		   "Suspend fence, guc_id=%d, failed to respond, banning queue",
+		   q->guc->id);
+	/*
+	 * The GuC failed to respond to the suspend within the timeout. This is
+	 * not recoverable for this context, so ban it and tear it down via
+	 * cleanup rather than leave it suspended forever. __suspend_fence_signal
+	 * clears suspend_pending and wakes any waiter.
+	 *
+	 * @q is the primary here; it owns the group's GuC context, so a failure
+	 * to suspend it wedges the whole group. Ban and tear down the entire
+	 * group in the multi-queue case.
+	 */
+	if (xe_exec_queue_is_multi_queue(q)) {
+		set_exec_queue_group_banned(q);
+		__suspend_fence_signal(q);
+		xe_guc_exec_queue_group_trigger_cleanup(q);
+	} else {
+		set_exec_queue_banned(q);
+		__suspend_fence_signal(q);
+		xe_guc_exec_queue_trigger_cleanup(q);
+	}
+}
+
 static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	/*
+	 * In multi-queue mode the primary owns the GuC scheduling context for
+	 * the whole group, so wait on the primary's suspend to complete. All
+	 * group members share the same GuC/device, so guc, xe and timeout above
+	 * are computed from @q directly.
+	 *
+	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
+	 * its SUSPEND message precedes the primary's on the shared FIFO
+	 * submit_wq, completes before the primary's. So waiting on the primary
+	 * is sufficient.
+	 */
+	q = xe_exec_queue_multi_queue_primary(q);
+
 	/*
 	 * Likely don't need to check exec_queue_killed() as we clear
 	 * suspend_pending upon kill but to be paranoid but races in which
@@ -2230,10 +2271,7 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 		return -EAGAIN;
 
 	if (!ret) {
-		xe_gt_warn(guc_to_gt(guc),
-			   "Suspend fence, guc_id=%d, failed to respond",
-			   q->guc->id);
-		/* XXX: Trigger GT reset? */
+		guc_exec_queue_suspend_timeout_ban(q);
 		return -ETIME;
 	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
 		/* Corner case on RESFIX DONE where vf_recovery() changes */
@@ -2242,6 +2280,13 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 #undef WAIT_COND
 
+	/*
+	 * ret < 0 (-ERESTARTSYS): the interruptible wait was aborted by a
+	 * signal. The queue is not banned - the failure is in the waiter, not
+	 * the queue. The suspend is not confirmed complete, so suspend_pending
+	 * may still be set; callers must not resume() on this error without
+	 * re-confirming the suspend.
+	 */
 	return ret < 0 ? ret : 0;
 }
 
-- 
2.43.0

