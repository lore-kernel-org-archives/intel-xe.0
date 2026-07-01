Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BB3C44500
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445D710ED8E;
	Wed,  1 Jul 2026 05:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNmb+ztO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB510E2EC
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 05:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782882458; x=1814418458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LLJZWQ92AyTjt7420kzqy777SZL1N6ekAqXWJsAYDNY=;
 b=KNmb+ztONN6jr3iYs7dtCeN5m745eJSwQOBbwpLM7tdgqOseU2XSt0cs
 CG5+NEW/k3wWCCHdpCyg+5cj4KATz06HFjdA2p0TSdoptPMbveYDosFVA
 VUjw14GdWmYyEs2RNQ+NO3mYB1bgfRjTukz0vs0fDVvlrgwY76tSwKqzv
 c/7O2V7iHSOY/3vt6dPGaz1ViqPU0ZWzzRNhvuXZgMhV/pibqttwnYDW2
 6qGRvDzHEySZiaY0jSxtb5/Rs3JMmaaKhW8Bn26tl4Bl5OGqd/12oNkME
 6PZVnw64nBs5A5RB7+NHGRGDe/3s/ddq/OAUe6ewInnA827ShHZeyHbKX w==;
X-CSE-ConnectionGUID: rSlDLoRkRqatoQNNh+8VOg==
X-CSE-MsgGUID: o294/y2hTOS1PZdkx3GiOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87516917"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="87516917"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:07:37 -0700
X-CSE-ConnectionGUID: hWzLL3H3TmWV+zuf499UCw==
X-CSE-MsgGUID: 2LpaD4W/SrKAyFexwXijcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="248479931"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:07:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 3/5] drm/xe/guc: wait killably for suspend and ban queue on
 timeout
Date: Tue, 30 Jun 2026 22:07:31 -0700
Message-ID: <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
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

 - Wait killably rather than interruptibly. Once a suspend has been
   issued it must be waited to completion (or timeout); an arbitrary
   non-fatal signal must not abandon an in-flight suspend, otherwise the
   wait reports a spurious failure while the suspend is still pending.
   Only a fatal signal aborts, in which case the dying task tears the
   queue down (clearing suspend_pending), so no stuck state persists.

 - On timeout, ban the queue and trigger cleanup rather than leaving it
   suspended forever. Clearing suspend_pending via __suspend_fence_signal()
   lets a subsequent resume() proceed without tripping the
   !suspend_pending assert.

v2: Add comment about -ERESTARTSYS in suspend_wait

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 39 ++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9458bf477fa6..3d9bdc22c89f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 xe_guc_read_stopped(guc))
 
 retry:
+	/*
+	 * Wait killably rather than interruptibly: once a suspend has been
+	 * issued it must be waited to completion (or timeout), otherwise an
+	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
+	 * the wait would report a spurious failure while suspend_pending is
+	 * still set. Only a fatal signal aborts here; in that case the dying
+	 * task tears the queue down (clearing suspend_pending), so no stuck
+	 * state persists.
+	 */
 	if (IS_SRIOV_VF(xe))
-		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
-						       vf_recovery(guc),
-						       HZ * 5);
+		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
+						  vf_recovery(guc), HZ * 5);
 	else
-		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
-						       WAIT_COND, HZ * 5);
+		ret = wait_event_killable_timeout(q->guc->suspend_wait,
+						  WAIT_COND, HZ * 5);
 
 	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
 		return -EAGAIN;
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
-			   "Suspend fence, guc_id=%d, failed to respond",
+			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
 			   q->guc->id);
-		/* XXX: Trigger GT reset? */
+		/*
+		 * The GuC failed to respond to the suspend within the timeout.
+		 * This is not recoverable for this context, so ban it rather
+		 * than leave it suspended forever (unmarked). Clearing
+		 * suspend_pending lets a subsequent resume() proceed without
+		 * tripping the !suspend_pending assert (the RESUME message is
+		 * dropped for a banned queue), and triggering cleanup tears the
+		 * context down.
+		 */
+		set_exec_queue_banned(q);
+		__suspend_fence_signal(q);
+		xe_guc_exec_queue_trigger_cleanup(q);
 		return -ETIME;
 	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
 		/* Corner case on RESFIX DONE where vf_recovery() changes */
@@ -2219,6 +2238,12 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 #undef WAIT_COND
 
+	/*
+	 * ret < 0 (-ERESTARTSYS): aborted by a fatal signal. The queue is not
+	 * banned - the failure is in the waiter, not the queue. The suspend is
+	 * not confirmed complete, so suspend_pending may still be set; callers
+	 * must not resume() on this error without re-confirming the suspend.
+	 */
 	return ret < 0 ? ret : 0;
 }
 
-- 
2.43.0

