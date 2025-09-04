Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802CBCA1019
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52A10E0B5;
	Thu,  4 Sep 2025 02:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V90XdW9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9045010E33D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756951814; x=1788487814;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KWaTwMrdfp3wzOy1IPi7il+vOq/TXDbO1VVZPZn0SR4=;
 b=V90XdW9t+NcsnmdJW0pRR5dXn4CSrii+zmFCXFHb8hNEkYuYguh2un//
 OTqG/p+DWSLsEJ2jswEYnleHH205xNKAo8jLbMQcEWWs1NQEundpkLuHS
 0Ad3PkFiTNKio40bJuFl1cgkCtrPIXmA35tVO7PgTzYVq21oIJntTRP1B
 7/1CUIN8nItBFmDXYntjnn4CZ472qQ2v3u0oR01B2W1jABmHvy136IDXY
 PnnkvMWb28Yv04eoNwrJlueGN7r2YeAa0c6E/9V4KCvrA2xha3iF1u8SW
 wRzso2t0kuUQM3URZa0chCm+FFqzjTWS3CkQ5swSuqPWOGWK8WmfENYsW Q==;
X-CSE-ConnectionGUID: kWhVpKx9Swql03puXfrZ4g==
X-CSE-MsgGUID: RJjm3LfaQ9m/cocHTjE1Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76728296"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76728296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:14 -0700
X-CSE-ConnectionGUID: JTwkkTSwSemowBGHXYXGRQ==
X-CSE-MsgGUID: S9MvyajzQZSULwH9SSs1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="176112247"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/xe: Don't change LRC ring head on job resubmission
Date: Wed,  3 Sep 2025 19:10:08 -0700
Message-Id: <20250904021008.1827802-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904021008.1827802-1-matthew.brost@intel.com>
References: <20250904021008.1827802-1-matthew.brost@intel.com>
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

Now that we save the job's head during submission, it's no longer
necessary to adjust the LRC ring head during resubmission. Instead, a
software-based adjustment of the tail will overwrite the old jobs in
place. For some odd reason, adjusting the LRC ring head didn't work on
parallel queues, which was causing issues in our CI.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 69ed3c159d10..f485767ff580 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,11 +2008,14 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		if (job) {
+			for (i = 0; i < q->width; ++i)
+				q->lrc[i]->ring.tail = job->ptrs[i].head;
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
-- 
2.34.1

