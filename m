Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245B9C4450A
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 20:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A9510EAF6;
	Mon, 13 Jul 2026 20:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXjCoxP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78E510EAFC
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783974208; x=1815510208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xb9R9JuDG6UpevO+qAbJReyFQZ4ptZ/g8OseyANpmes=;
 b=QXjCoxP3XFYAojEKaNUEVLu/jAhuHKa+lgW6OhS5IEOwWv0Z4M8eBPGs
 rQfQ5Dwf0yfkVHAUeelZ4Sg5S1IhHLazBRw9g7ykXLNnXGwWDlw3x/j/x
 O3ZvUajJ138JFN187JDthEkZhSsK4DnK5SSitjrA0VEfRyiygeV91WEaq
 CnA4Od9bIyqUYtidIwLjXwAkHbwuj8LE73Nve2RVKJdP3xTLS0+hFrfbQ
 /sbMTpu8ERncpfk9vAup5Jnx/GLJL29No6qrVAtNHDYtlUJH5R+PGYZGU
 BPzlJAV3zzaD5/gOYSIYpsizFJt/gQSgkmGSeayfj7wr9qFi6jwAZ0isK Q==;
X-CSE-ConnectionGUID: 3s5nDNPjSomhaO4NsJVsWQ==
X-CSE-MsgGUID: mi97WqODStmS7MYVdUx82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110136866"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="110136866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:23:27 -0700
X-CSE-ConnectionGUID: BRoIxsTSQXSdBmKAJxrWaA==
X-CSE-MsgGUID: d3ONmVxzTquxq0XVgWDAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253914149"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:23:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 2/6] drm/xe/guc: ban exec queue on suspend timeout
Date: Mon, 13 Jul 2026 13:23:17 -0700
Message-ID: <20260713202317.2187787-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713202317.2187787-8-niranjana.vishwanathapura@intel.com>
References: <20260713202317.2187787-8-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

