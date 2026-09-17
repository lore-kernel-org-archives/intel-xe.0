Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A3C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 19:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4210E794;
	Thu, 17 Sep 2026 19:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReWDxtK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E3310E794
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789673952; x=1821209952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UPaKylNhG8OpLd/ZAOqtPKPFyXNFXsM5l8kNycU/ohg=;
 b=ReWDxtK7Drcz+FIb0CcdsU0hA9hq4BUThGQ9eHTC08AZBf0CaSQ0vjn6
 lK2JVuZ/7MPTSRqUDeqYhVvE7ab+ILmHhEMkowtQc+37F4huojvGo3yFK
 gbuUuyL9AVmJo8i3QuCyK7JxFs0Fiq3lyvQdMSUBd97qEIsbv2SQ+ZDHg
 lYdASK+MAYxgzCVkKbJoTHnHkk2UXwFyRy5yMAxfCSpteCqW7GYM4GdfA
 YW3mGacZzqkPp1eta8LVvbpCTZR8ZIylN8LKht5kiJ/ppoLRTDlmxRwqh
 3s5WJ/lpNBlF08LhHq2IQHBrsjQrDId7HOoQze6lQc/aP9kWgewSr3zd+ w==;
X-CSE-ConnectionGUID: FO74/F8uQIOMiNKTvC6AyQ==
X-CSE-MsgGUID: Ji5CfmSGSqGn/NOcteVE+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89070533"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89070533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:39:12 -0700
X-CSE-ConnectionGUID: xlGJSRXuTNCYEs31El8+fQ==
X-CSE-MsgGUID: MAT0QjFSSIewfHBKTSVsCA==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:39:10 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] drm/xe: Skip schedule disable for an already reset exec queue
Date: Fri, 18 Sep 2026 03:38:39 +0800
Message-ID: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

A memory CAT error causes GuC to reset the offending context and notify
the driver. xe_guc_exec_queue_memory_cat_error_handler() treats this the
same as an engine reset and calls xe_guc_exec_queue_reset_trigger_cleanup(),
which sets EXEC_QUEUE_STATE_RESET.

Roughly 200us later the TDR runs for the same queue. It reads
exec_queue_reset(), uses the result only to set err = -EIO, and then sends
a schedule disable (H2G SCHED_CONTEXT_MODE_SET) anyway. GuC has already
destroyed the context, so no SCHED_DONE is ever returned. The TDR then
waits out its HZ*5 timeout, reports "Schedule disable failed to respond"
and calls xe_gt_reset_async(), escalating a per-context failure into a
full GT reset that kills every context on the tile and reloads GuC.

The failure is intermittent because the enclosing guard is
(exec_queue_enabled || exec_queue_pending_disable): it is a race between
the CAT error cleanup and the TDR. When cleanup wins the block is skipped
and recovery is clean; when the TDR wins the disable is sent and the
timeout fires.

Skip the handshake entirely when the context has already been reset. The
send, the HZ*5 wait and the GT reset escalation all live in the same block,
so a single condition removes all three. err = -EIO is preserved so
userspace still receives the correct error, and execution falls through to
the normal cleanup path, which performs the deregistration.

This matches existing behaviour elsewhere in the driver:
xe_guc_exec_queue_reset_handler() calls the same
xe_guc_exec_queue_reset_trigger_cleanup() and performs no disable
handshake at all. The TDR path was simply inconsistent with it.

Evidence, captured with existing ftrace events only (no instrumentation):

  Healthy acknowledgements take ~350us:
    4806.244755 xe_exec_queue_scheduling_enable  guc_id=2 guc_state=0x7
    4806.245126 xe_exec_queue_scheduling_done    guc_id=2 guc_state=0x7

  The failure:
    4806.245395 xe_exec_queue_memory_cat_error   guc_id=2 guc_state=0x3
    4806.245592 xe_exec_queue_scheduling_disable guc_id=2 guc_state=0x249
                <5.18s, no scheduling_done for any guc_id>
    4811.425872 xe_sched_job_timedout            guc_id=2 guc_state=0x200

  guc_state=0x249 is REGISTERED|PENDING_DISABLE|RESET|BANNED. The RESET bit
  confirms the exec_queue_reset() branch was taken and the disable was sent
  regardless. scheduling_done never fires, so handle_sched_done() never runs
  and the acknowledgement genuinely never arrives.

  With the fix, scheduling_disable is traced at guc_state=0x2d9
  (adds DESTROYED|KILLED), i.e. it now originates from
  disable_scheduling_deregister() on the normal cleanup path, and GuC
  acknowledges it every time.

Testing:
  igt@xe_exec_reset@multi-queue-cancel               0/10 failures
                                                     (baseline 10/10 failures)
  igt@xe_exec_reset@multi-queue-cancel-on-secondary  passing
  Subtest runtime drops from ~5.2s to ~85ms.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..03450590042a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1609,14 +1609,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
 	set_exec_queue_banned(q);
 
+	/*
+	 * GuC already reset this context (the CAT error handler treats a CAT
+	 * error as an engine reset), so there is nothing left to disable and
+	 * SCHED_DONE will never arrive. Skip the handshake rather than waiting
+	 * HZ*5 and escalating to a full GT reset.
+	 */
+	if (exec_queue_reset(primary))
+		err = -EIO;
+
 	/* Kick job / queue off hardware */
-	if (!xe_device_is_in_reset(xe) && !wedged &&
+	if (!xe_device_is_in_reset(xe) && !wedged && !exec_queue_reset(primary) &&
 	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
-		if (exec_queue_reset(primary))
-			err = -EIO;
-
 		if (xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
-- 
2.53.0

