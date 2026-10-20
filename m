Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3F3606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPyxpWx4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77F10E215;
	Tue, 20 Oct 2026 19:07:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68210E215
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792523238; x=1824059238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f4OmuTfxDXoi6K0igy3xS9NhxMrbajnP8XZ9/K3Bg5E=;
 b=ZPyxpWx4qzOAHXAVIIE/+nAquSq6E7Dxh64NfDysW31ARsMIYb9q3iiJ
 IVSAzhr3xCsrgIiu5NGTwG6kybQ1olfnnLnAD563BZEwzdtVEyzYtQcDx
 lJAP1ZxsN8nqyevdvktVbpVyJnSI0ytzu1IS5IX7iezJIlY+sjxBsTUXs
 8OaWVB/ehc5tx8XGFL8E05soFSQkVWO91tSnDcg7Qtc470nPZCtCpFkuc
 uGUoKFPFt5UgawDUekZVICkhpEdLZ8WXK4HuV3zpikQNdG4UtQqYiB8Mr
 QEcctiZUtGPUZ5mUMWAb5BHI2z0/grL26ib0dTtbJn68H8s5sYIJWG0dp Q==;
X-CSE-ConnectionGUID: 6XU07QDQSZO7B3bDhRDBEQ==
X-CSE-MsgGUID: 73BlAAaFQcmKWtgkokyOgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1134775"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1134775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:07:18 -0700
X-CSE-ConnectionGUID: sWGOTk4KStSCURgQkLY8tg==
X-CSE-MsgGUID: FXGzz9yARnyOB0ibT2LSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2836163"
Received: from dut1105bmgfrd.igk.intel.com ([10.211.177.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:07:16 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH v2] drm/xe/guc: Do not attribute a TDR disable to a pending
 suspend
Date: Tue, 20 Oct 2026 19:07:05 +0000
Message-ID: <20261020190705.20127-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915192119.51065-1-jagmeet.randhawa@intel.com>
References: <20260915192119.51065-1-jagmeet.randhawa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

handle_sched_done() treats any SCHED_DONE with runnable_state 0 as the
completion of a suspend whenever q->guc->suspend_pending is set. That is
not sufficient to tell apart the two producers of a scheduling disable.

When a queue is suspended, __guc_exec_queue_suspend() sets
suspend_pending and queues a SUSPEND message. If a job times out before
that message runs, guc_exec_queue_timedout_job() stops submission, which
traps the message, bans the queue and issues a disable of its own via
disable_scheduling(). When the GuC acknowledges that disable,
suspend_pending is still set, so handle_sched_done() misattributes the
reply to the trapped SUSPEND message.

This signals the suspend fence for a queue that was never suspended,
tripping the exec_queue_suspended() assert in suspend_fence_signal(), and
skips the wake_up_all() the TDR is waiting on, so the TDR stalls for its
full 5s timeout and then triggers an unnecessary GT reset.

The suspend path marks the queue suspended before disabling scheduling,
and a trapped SUSPEND message never does, so exec_queue_suspended()
distinguishes the two cases. Use it to qualify the attribution, the same
way the VF migration replay path already does. The trapped message is not
lost: it completes the suspend once submission restarts at the end of the
TDR.

While here, wake guc->ct.wq after clearing pending_disable rather than
before, so a waiter observes the updated state on its first re-check, and
wake unconditionally since the suspend and destroy paths have waiters too.

v2: Rebase onto drm-xe-next. The suspend_pending check moved under
    sched->msg_lock in commit cf4171a20d13 ("drm/xe/guc: Fix race
    around q->guc->suspend_pending access"), so the
    exec_queue_suspended() qualification is folded into that locked
    snapshot rather than reinstating an unlocked check. No functional
    change from v1.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 48 ++++++++++++++++++------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bc39cea08ecc..ab70d0a17701 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3368,8 +3368,17 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
+		/*
+		 * A TDR stops the scheduler, which can trap a queued SUSPEND
+		 * message, and then issues a disable of its own. suspend_pending
+		 * is still set in that case, so only attribute this SCHED_DONE
+		 * to a suspend if the SUSPEND message actually ran, i.e. it
+		 * marked the queue suspended before disabling scheduling. The
+		 * trapped message completes the suspend once submission
+		 * restarts.
+		 */
 		xe_sched_msg_lock(&q->guc->sched);
-		was_pending = q->guc->suspend_pending;
+		was_pending = q->guc->suspend_pending && exec_queue_suspended(q);
 		if (was_pending) {
 			clear_exec_queue_pending_disable(q);
 			suspend_fence_signal(q);
@@ -3377,26 +3386,27 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_sched_msg_unlock(&q->guc->sched);
 
 		if (!was_pending) {
-			if (exec_queue_banned(q)) {
-				smp_wmb();
-				wake_up_all(&guc->ct.wq);
-			}
-			if (exec_queue_destroyed(q)) {
-				/*
-				 * Make sure to clear the pending_disable only
-				 * after sampling the destroyed state. We want
-				 * to ensure we don't trigger the unregister too
-				 * early with something intending to only
-				 * disable scheduling. The caller doing the
-				 * destroy must wait for an ongoing
-				 * pending_disable before marking as destroyed.
-				 */
-				clear_exec_queue_pending_disable(q);
+			/*
+			 * Make sure to clear the pending_disable only after
+			 * sampling the destroyed state. We want to ensure we
+			 * don't trigger the unregister too early with something
+			 * intending to only disable scheduling. The caller
+			 * doing the destroy must wait for an ongoing
+			 * pending_disable before marking as destroyed.
+			 */
+			bool destroyed = exec_queue_destroyed(q);
+
+			clear_exec_queue_pending_disable(q);
+			if (destroyed)
 				deregister_exec_queue(guc, q);
-			} else {
-				clear_exec_queue_pending_disable(q);
-			}
 		}
+
+		/*
+		 * Wake after pending_disable is cleared, not before, so waiters
+		 * such as the TDR see the updated state on the first re-check.
+		 */
+		smp_wmb();
+		wake_up_all(&guc->ct.wq);
 	}
 }
 
-- 
2.43.0

