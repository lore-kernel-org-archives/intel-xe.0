Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C8C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FA010E28B;
	Wed, 26 Aug 2026 09:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz9VJtB3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D618110E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787736826; x=1819272826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s2IjMG74ee7D7xXpyPiFLQ2bK+B6qV2rlV8K5vzwlXs=;
 b=Tz9VJtB3VJkWhWAK+B5Qk1riEQ78ZHdMpZxh3JE29QVLUFgYfBZhizIv
 M38xhOVtKMJDaRarouWo5Tp6f2he5d1ZR9d7+DTRIotM9V03lbua8LTa8
 Tq9cDA356/1bSsnqN/TZMzCF9aHi3FfJ3C0vlo+8/7foiLGk9fjGKh5jH
 EyKgP28ccBgERmeXN6oPiPg4G0ld48/qsGWoeNPRQboOPvk5GS8HhrSFB
 NGOwIU80ysoMRCsiO9sgrG9tVG6pKXf/0Z0H5RwvzFQ6XiCtJZHtUq0MO
 rsj/qPAfED+OgHIXYx4Yxs9y0NjRphJERB07t7TM+CM5z9gTmDsCb7O3+ Q==;
X-CSE-ConnectionGUID: wf9Z0XgJQ3O+RAcpSNunIg==
X-CSE-MsgGUID: JXoRGIQlQuuK61lnsXDeCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99560613"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="99560613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:33:45 -0700
X-CSE-ConnectionGUID: e6otDGt2QLuMRlwHUjufCg==
X-CSE-MsgGUID: 90XCP4m6Rby1woPmPVJNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264932369"
Received: from dev-274.igk.intel.com ([10.211.136.198])
 by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2026 02:33:44 -0700
From: Jakub Legowski <jakub.legowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, maciej.patelczyk@intel.com,
 Jakub Legowski <jakub.legowski@intel.com>
Subject: [PATCH v1 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Date: Wed, 26 Aug 2026 11:33:25 +0200
Message-ID: <20260826093325.3233742-1-jakub.legowski@intel.com>
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

Noving the wake_up_all() (along with its smp_wmb())
after all paths that clear pending_disable, ensuring that waiters
always observe the updated state when woken.

Same as for runnable_state == 1 in the beginning of
handle_sched_done().

Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..2b86c2cde802 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3239,10 +3239,6 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 			clear_exec_queue_pending_disable(q);
 			suspend_fence_signal(q);
 		} else {
-			if (exec_queue_banned(q)) {
-				smp_wmb();
-				wake_up_all(&guc->ct.wq);
-			}
 			if (exec_queue_destroyed(q)) {
 				/*
 				 * Make sure to clear the pending_disable only
@@ -3258,6 +3254,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 			} else {
 				clear_exec_queue_pending_disable(q);
 			}
+			if (exec_queue_banned(q)) {
+				/* Pairs with the smp_rmb() in guc_exec_queue_timedout_job() */
+				smp_wmb();
+				wake_up_all(&guc->ct.wq);
+			}
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

