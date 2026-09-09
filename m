Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D36C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8C10EF7A;
	Wed,  9 Sep 2026 07:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k18GIQTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30D10EF7A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788937731; x=1820473731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XiK+Sz5TY8e2+OKREneK0dNzt2/3xCeyZgpO8cb9LY8=;
 b=k18GIQTLNIzF5WLn1HIUdtK3Mkd54eQP7Qn5LxHr6zQfbwHUk8lL9Q2P
 XV0NyvE59Fmb9+92OwDntf33yJdFHHryrxnMxjLmZkVHXNhygQ70CEvVt
 lWq70s9j4NyOtSl+bTXB409P+p/FIq6nnmquPP+VcF7knJDE0K5LQKb26
 KkrPjhbu9MSCi5zZM20EMtJ1y9NCoSS1XU4PlCof6L5xSoX/6fas3p3Qx
 FE18IDsDWDP93rHgV9WwG+2nGvun4ELgpzdj2l/qksFduzYCCxlT/mC6n
 fdFzEv9SDrTQelSoKuoWfI13iPFPYZgZmgfdobLCtCSwybre3g8T+Q2x3 Q==;
X-CSE-ConnectionGUID: YkFElpeWRkC4iuETmLdeZA==
X-CSE-MsgGUID: am7UugNqSgK2KEyVQuTtkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89277327"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89277327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:08:50 -0700
X-CSE-ConnectionGUID: UT3XcEg7ScaGrPj8pRkEdg==
X-CSE-MsgGUID: b0TyhrXESFKyd25aG5gwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270742371"
Received: from dev-274.igk.intel.com ([10.211.136.198])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 00:08:49 -0700
From: Jakub Legowski <jakub.legowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, maciej.patelczyk@intel.com,
 Jakub Legowski <jakub.legowski@intel.com>
Subject: [PATCH v2 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Date: Wed,  9 Sep 2026 09:08:25 +0200
Message-ID: <20260909070825.228551-1-jakub.legowski@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Move wake_up_all() after clear_exec_queue_pending_disable()

When a SCHED_DONE G2H arrives for a banned exec queue,
handle_sched_done() calls wake_up_all() before
clear_exec_queue_pending_disable(). This creates a race with the
wait_event_timeout() in guc_exec_queue_timedout_job() that waits
for pending_disable to be cleared:

    smp_rmb();
    ret = wait_event_timeout(guc->ct.wq,
                 ...
                 ...);

This was observed as:
[drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job timeout: seqno=4294967169, lrc_seqno=4294967169, guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001

Moving the wake_up_all() (along with its smp_wmb())
after all paths that clear pending_disable, ensuring that waiters
always observe the updated state when woken.

Same as for runnable_state == 1 in the beginning of
handle_sched_done().

Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..a181b5042293 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 			clear_exec_queue_pending_disable(q);
 			suspend_fence_signal(q);
 		} else {
+			bool destroyed = exec_queue_destroyed(q);
+
+			/*
+			 * Make sure to clear the pending_disable only
+			 * after sampling the destroyed state. We want
+			 * to ensure we don't trigger the unregister too
+			 * early with something intending to only
+			 * disable scheduling. The caller doing the
+			 * destroy must wait for an ongoing
+			 * pending_disable before marking as destroyed.
+			 */
+			clear_exec_queue_pending_disable(q);
+
 			if (exec_queue_banned(q)) {
+				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
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
+
+			if (destroyed)
 				deregister_exec_queue(guc, q);
-			} else {
-				clear_exec_queue_pending_disable(q);
-			}
 		}
 	}
 }
-- 
2.48.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

