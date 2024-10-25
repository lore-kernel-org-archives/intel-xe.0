Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC05AD149F6
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 21:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2621410EB80;
	Fri, 25 Oct 2024 21:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQsQQKRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7C610EB80
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729892584; x=1761428584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0ijeInHyE153TuMMb3o/LBLR0o9I0WRf9nEYewFjhY=;
 b=BQsQQKReM1uMp7CFD9gK70AuegyNAozBrT1pLJejy+g6TOrRW9eYjcUv
 x8oRSZDicj6stroNXcDiQAl2VkFaLDu/CEXtUeeAqDoil3LkyM3Wlpjff
 TPCtKvMi6PrtSkWelz4tWQAaN+Q2FZm+O+dMWQD8mVNen1yR2KPO0YR7m
 Ox6owrHfwoWNySq0KdIEilB/JdOV8Fj4hR1XjJNmSov5aRs1FZa5nwqRn
 qzuMZp7gR5VT88CMvoEQ3qONuUU4sXkb/I72pMbZvjZkWheemnyyLEMUw
 IqLwfBECmu6YuVMUUcg8gWvT3wwdFCR+W5QcbhchxE4kardWfzLaZozzB g==;
X-CSE-ConnectionGUID: oCtO+rnUSd6tdGanIPaCVQ==
X-CSE-MsgGUID: Mgu6h00lTdqa3QQNcbceiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33377856"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="33377856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:04 -0700
X-CSE-ConnectionGUID: G/exYjMNSJGhawCzJkvWdg==
X-CSE-MsgGUID: y8AF+UqbSv6v1j8OdWxNog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81189348"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH v4 1/2] drm/xe: Don't short circuit TDR on jobs not started
Date: Fri, 25 Oct 2024 14:43:29 -0700
Message-Id: <20241025214330.2010521-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025214330.2010521-1-matthew.brost@intel.com>
References: <20241025214330.2010521-1-matthew.brost@intel.com>
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
v4:
 - Short circuit check_timeout on job not started
 - use warn level rather than notice (Paulo)

Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
Cc: stable@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e5d7c767a744..7afcc243037c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -918,12 +918,22 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
 	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
-	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
-	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
+	u32 ctx_timestamp, ctx_job_timestamp;
 	u32 timeout_ms = q->sched_props.job_timeout_ms;
 	u32 diff;
 	u64 running_time_ms;
 
+	if (!xe_sched_job_started(job)) {
+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			   q->guc->id);
+
+		return xe_sched_invalidate_job(job, 2);
+	}
+
+	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
+	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
+
 	/*
 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
 	 * possible overflows with a high timeout.
@@ -1053,10 +1063,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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

