Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9FDCA1017
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 02:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392310E3E9;
	Thu,  4 Sep 2025 02:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDx0mgkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0210E229
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 02:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756954075; x=1788490075;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WLZI3vCWU2VmhjgPC/5pl5/o+aD9G1q3H8lPXO0qzA0=;
 b=NDx0mgkzXmsnYMClUxYgeQBZ0OpGw3Y4OpYLTHPdiePUtT6mGKg7keYC
 dWROTNFI/vQZkODFa65qO7WAYF1csuVI97zMCENL36gBUlBxeEiTACk/b
 t3yakyGAZSLoTkp/GILlxi0unIqEIpkF3M0QED9dO2y2rknlCuMyY73hT
 0d0BNaDQxD9rfboFBEovxbUzNPRzNG1dsWNV1sLTxS6AYKhKur4BOQs+v
 cpzs5kI3OV4i4tQZgdNNlXoPAem04HLE2X8q/0iyKMr3h2muAT2r3Gj00
 4ciZQ2EoGYDVfTP7sv8xry/zN1kdkmmDP8IAGLqRRIx6+1pgxeObYEqZd Q==;
X-CSE-ConnectionGUID: rDlUzicGTE2L73SGo0ZcIw==
X-CSE-MsgGUID: vDL/3+jnR3+TdGjGULbQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69544456"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="69544456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:47:55 -0700
X-CSE-ConnectionGUID: +8Whn2mzSfK39tTSTXCz3Q==
X-CSE-MsgGUID: q7I6Q93xSN6dA94ufte//A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:47:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 4/4] drm/xe: Don't change LRC ring head on job resubmission
Date: Wed,  3 Sep 2025 19:47:49 -0700
Message-Id: <20250904024749.1849710-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904024749.1849710-1-matthew.brost@intel.com>
References: <20250904024749.1849710-1-matthew.brost@intel.com>
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

v6:
 - Also set LRC tail to head so queue is idle coming out of reset

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 69ed3c159d10..3fb394f65c3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		if (job) {
+			for (i = 0; i < q->width; ++i) {
+				q->lrc[i]->ring.tail = job->ptrs[i].head;
+				xe_lrc_set_ring_tail(q->lrc[i],
+						     xe_lrc_ring_head(q->lrc[i]));
+			}
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
-- 
2.34.1

