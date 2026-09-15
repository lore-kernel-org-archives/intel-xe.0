Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD5C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 19:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8610E1BC;
	Tue, 15 Sep 2026 19:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRJ6EFc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF8010E1BC
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 19:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789500094; x=1821036094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lihl6Ve1z8hH7QeeYD3gDUqmfaEO4CesrGdpJKPTVE4=;
 b=CRJ6EFc40/aNd6xzeVJUA1no/GspIsl2+pxrko/DolyWND354KtaH//4
 A1FNYwE2vesYEm24gmrhFqCOUW+EnkEkYgraWA5W3g5qPzQRA4KKxbzRM
 PjgpAzpSjioOPyQGo0m6c+8m97njopzasNYtW5/qNZtzSB9KjxKFdsJ1y
 FHcfxbYeRarpP1t/oM0iRMgaBqde6rMObsxh3xaagb4v5/LpEkSI31zI7
 +qz4i+wgm5/ge2rjTgO3zxwLeUPHSCI+r993ASlsmGa16Vfxpfd85IA0B
 Bc7D9FJ297wB+h4vjF/PpWBnhj1IqiC9XE31qWTkW4zSphq2y3j22mGZf w==;
X-CSE-ConnectionGUID: aiZVQHM4TY6xyx1sd/fkAw==
X-CSE-MsgGUID: TsuATefeRkKjd/G4IpRnuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89635469"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89635469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 12:21:33 -0700
X-CSE-ConnectionGUID: HOYgc6CMQMGAA9OcpshBvg==
X-CSE-MsgGUID: iV0mWsXnQjOTktvJpZ7ypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298161535"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2019NVLP.iind.intel.com) ([10.190.232.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 12:21:31 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] drm/xe/guc: Do not attribute a TDR disable to a pending
 suspend
Date: Tue, 15 Sep 2026 19:21:19 +0000
Message-ID: <20260915192119.51065-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Link: https://patchwork.freedesktop.org/patch/747153/?series=172176&rev=2
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

 drivers/gpu/drm/xe/xe_guc_submit.c | 48 ++++++++++++++++++------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..dbd370eff416 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3262,30 +3262,40 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
-		if (q->guc->suspend_pending) {
+		/*
+		 * A TDR stops the scheduler, which can trap a queued SUSPEND
+		 * message, and then issues a disable of its own. suspend_pending
+		 * is still set in that case, so only attribute this SCHED_DONE
+		 * to a suspend if the SUSPEND message actually ran, i.e. it
+		 * marked the queue suspended before disabling scheduling. The
+		 * trapped message completes the suspend once submission
+		 * restarts.
+		 */
+		if (q->guc->suspend_pending && exec_queue_suspended(q)) {
 			clear_exec_queue_pending_disable(q);
 			suspend_fence_signal(q);
 		} else {
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

