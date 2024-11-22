Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592DE69173
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76A10EC01;
	Fri, 22 Nov 2024 16:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNEVRO3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5110EC01
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732292380; x=1763828380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXdwZCdbCB9Cb04rG4i8IFxP38HzeQYQ7+7d1J62P5A=;
 b=bNEVRO3iEWwbemqTBerzJcaYOuzAk0+5VaVWhbk4ZfAcE4QsDOG2ZS5m
 zT6LseNxeBmMhUdcQ0tsOlpIGpKdlc/Y+3zVxgES3MO1uWMyXR2/R3sYs
 qTML83Evmjq+JyhuK483wTilTqFOerZ4RZiBsrDyJ246Pm6V4F9PVSCRm
 mjpLfytHudBC5O5aEOFQsEZJvL57QJWf1HL2bZEbG0X3I/9Prmlqq06KK
 HrQ2cK6PShWrT+NADnj2X7UF76xSqQbptaUPKVPwbaPRaWhNhtCduRGVE
 dgrgdzbN/qXF/2v+WdlJl7y/nOsadumTfbt4p0hmx6B63baDnFtpGoGO0 A==;
X-CSE-ConnectionGUID: 2E9yyS+7QW+dvrqWZTRO4w==
X-CSE-MsgGUID: mPetkIheQwy44srwtYSo6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32379420"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32379420"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:19:40 -0800
X-CSE-ConnectionGUID: UWLH1lyFRdKfwTGgt3UAVg==
X-CSE-MsgGUID: j97H/QpoR1CVejHRaiFMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90782850"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.10])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:19:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] drm/xe/guc_submit: fix race around suspend_pending
Date: Fri, 22 Nov 2024 16:19:17 +0000
Message-ID: <20241122161914.321263-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122161914.321263-4-matthew.auld@intel.com>
References: <20241122161914.321263-4-matthew.auld@intel.com>
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

Currently in some testcases we can trigger:

xe 0000:03:00.0: [drm] Assertion `exec_queue_destroyed(q)` failed!
....
WARNING: CPU: 18 PID: 2640 at drivers/gpu/drm/xe/xe_guc_submit.c:1826 xe_guc_sched_done_handler+0xa54/0xef0 [xe]
xe 0000:03:00.0: [drm] *ERROR* GT1: DEREGISTER_DONE: Unexpected engine state 0x00a1, guc_id=57

Looking at a snippet of corresponding ftrace for this GuC id we can see:

162.673311: xe_sched_msg_add:     dev=0000:03:00.0, gt=1 guc_id=57, opcode=3
162.673317: xe_sched_msg_recv:    dev=0000:03:00.0, gt=1 guc_id=57, opcode=3
162.673319: xe_exec_queue_scheduling_disable: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0x29, flags=0x0
162.674089: xe_exec_queue_kill:   dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0x29, flags=0x0
162.674108: xe_exec_queue_close:  dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa9, flags=0x0
162.674488: xe_exec_queue_scheduling_done: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa9, flags=0x0
162.678452: xe_exec_queue_deregister: dev=0000:03:00.0, 1:0x2, gt=1, width=1, guc_id=57, guc_state=0xa1, flags=0x0

It looks like we try to suspend the queue (opcode=3), setting
suspend_pending and triggering a disable_scheduling. The user then
closes the queue. However closing the queue seems to forcefully signal
the fence after killing the queue, however when the G2H response for
disable_scheduling comes back we have now cleared suspend_pending when
signalling the suspend fence, so the disable_scheduling now incorrectly
tries to also deregister the queue, leading to warnings since the queue
has yet to even be marked for destruction. We also seem to trigger
errors later with trying to double unregister the same queue.

To fix this tweak the ordering when handling the response to ensure we
don't race with a disable_scheduling that doesn't actually intend to
actually unregister.  The destruction path should now also correctly
wait for any pending_disable before marking as destroyed.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3371
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3c22b101916..f82f286fd431 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1867,16 +1867,30 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
-		clear_exec_queue_pending_disable(q);
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
+			clear_exec_queue_pending_disable(q);
 		} else {
 			if (exec_queue_banned(q) || check_timeout) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
-			if (!check_timeout)
+			if (!check_timeout && exec_queue_destroyed(q)) {
+				/*
+				 * Make sure we clear the pending_disable only
+				 * after the sampling the destroyed state. We
+				 * want to ensure we don't trigger the
+				 * unregister too early with something only
+				 * intending to only disable scheduling. The
+				 * caller doing the destroy must wait for an
+				 * ongoing pending_destroy before marking as
+				 * destroyed.
+				 */
+				clear_exec_queue_pending_disable(q);
 				deregister_exec_queue(guc, q);
+			} else {
+				clear_exec_queue_pending_disable(q);
+			}
 		}
 	}
 }
-- 
2.47.0

