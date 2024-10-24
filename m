Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A07D0BB54
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 02:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993310E264;
	Thu, 24 Oct 2024 02:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBnLcncf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C2D10E264
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 02:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729738379; x=1761274379;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YGSOkTjpY2ngqVyHDxcSksMilYvkEFjUV/9hvD3O05I=;
 b=BBnLcncf9PcmJSIgI8ifmN+4jeSr9m+NuikslFY0FIQsH3tiVvmVdGWu
 ktS+/d+ZZpT4JWxiWkB+iEmTrSgi8O/HeZtC7Cmd7nxLO8ALj1bWLHQwx
 x4WfawZvARtWdBDLaA/hpEwdV+TitvnMLSWkIrFswXWBUZRASXqxTWTZE
 94X8L+Q3u9sLw+IErKxYlXeQOwPZrOy76+Rs0dpgO8S/1pYcGMJJQaWAQ
 flSUfG+00OPiGWlna0k+YpnVheoNKs4wlEPXcrteBDg1PzeUFQNpmt9yj
 IkFEKWAkLeYQMBHXrWldbEVEzanv9hQl6E6Oo5vxDXviI7Bn5xw3ZHEoD A==;
X-CSE-ConnectionGUID: wIng0VmzTla8CXnnVe908A==
X-CSE-MsgGUID: fdtLXHiPRhabcrzd/OGqDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29517597"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29517597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:52:58 -0700
X-CSE-ConnectionGUID: yWBcJ0g7Rr+wjrebHr+HJg==
X-CSE-MsgGUID: jaH6ghxwTm+474anoI0LtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80763493"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:52:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Don't short circuit TDR on jobs not started
Date: Wed, 23 Oct 2024 19:53:23 -0700
Message-Id: <20241024025323.1846299-1-matthew.brost@intel.com>
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
v3:
 - Include local change

Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
Cc: stable@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e5d7c767a744..4f545f69301f 100644
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
@@ -1053,10 +1060,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		exec_queue_killed_or_banned_or_wedged(q) ||
 		exec_queue_destroyed(q);
 
-	/* Job hasn't started, can't be timed out */
-	if (!skip_timeout_check && !xe_sched_job_started(job))
-		goto rearm;
-
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
-- 
2.34.1

