Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D77FD0BB54
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 02:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848310E264;
	Thu, 24 Oct 2024 02:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdRWF3Mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E4210E264
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729738265; x=1761274265;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JEDXRTa/Fgd7SaSKC1dE+tYdrf1/bM3VTBu8VWBxtk4=;
 b=SdRWF3MwnojvUbnc3HSH3787IGdnecaC4X5Js8+SXG/wIkUVhW9KxWqa
 eOKMW7azdm8Qe2nbyvtlfj+Fp1ErMrdBmyKBERfTL2qzvR53U3Pk1BnF6
 N936qu94mxQx/5RGEYxkVUZ2IPX+S68+AlHaws6TMJM68cpaE7WtFG1k5
 AsgC/mphZwA6nC88tCUxyQKissM7sIn1cd4zwSW3ixPLQ9/wj6VXGUUjR
 LyIneTfx2YYDoT5G6l/2OjW5ojpKKS2aoBVqK2jgywb6UDAF/SfWSqmzH
 tzYrDJGu4rE2TGlDyswerechpFIelLmckoHvektg8fm+l+EO9zwd237wp w==;
X-CSE-ConnectionGUID: sPKVLXDtQZWU9yr5uMrKOw==
X-CSE-MsgGUID: Q0//YlBfQzeKHoMUCdGebw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46816141"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46816141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:51:05 -0700
X-CSE-ConnectionGUID: xk2tFEYYQ6GSHzVu8bTzrQ==
X-CSE-MsgGUID: 2u+/pPqaStCdfyGUh/RFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80628997"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:51:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Don't short circuit TDR on jobs not started
Date: Wed, 23 Oct 2024 19:51:26 -0700
Message-Id: <20241024025126.1843968-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Short circuiting TDR on jobs not started is an optimization which is not
required. On LNL we are facing an issue where jobs do not get scheduled
by the GuC if it misses a GGTT page update. When this occurs let the TDR
fire, toggle the scheduling which may get the job unstuck, and print a
warning message. If the TDR fires twice on job that hasn't started,
timeout the job.

v2:
 - Add warning message (Paulo)
 - Add fixes tag (Paulo)
 - Timeout job which hasn't started after TDR firing twice

Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
Cc: stable@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e5d7c767a744..6182d86a234c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -941,12 +941,19 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	running_time_ms =
 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
 
-	xe_gt_dbg(gt,
-		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
-		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		  q->guc->id, running_time_ms, timeout_ms, diff);
-
-	return running_time_ms >= timeout_ms;
+	if (!xe_sched_job_started(job)) {
+		xe_gt_notice(gt,
+			     "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
+			     xe_sched_job_seqno(job),
+			     xe_sched_job_lrc_seqno(job), q->guc->id);
+		return xe_sched_invalidate_job(job, 2);
+	} else {
+		xe_gt_dbg(gt,
+			  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
+			  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			  q->guc->id, running_time_ms, timeout_ms, diff);
+		return running_time_ms >= timeout_ms;
+	}
 }
 
 static void enable_scheduling(struct xe_exec_queue *q)
-- 
2.34.1

