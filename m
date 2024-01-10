Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAD6C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6901710E623;
	Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D5110E61A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704907976; x=1736443976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hhWOCyPmHRza6BR7nZxbAPvMpE8QVJqRgCNwVQkVX9U=;
 b=DvgGfJDztWCd4aq7Uq3LsISvExg/QefZn43lHzEyh6vsLvsrvRAXSviE
 qCmcJ9tpO1Ncdqe0aQs49HJDvg7SPXZMYpx3Gz1cBSP7MXeu+UbfwE1Bs
 QmRSB6e+33IFmMJvmwtovlgzxIKGsCQKqFqHWIxsgjSb/t9HtGFOXXvrm
 Y5zPeP4eTD41oIkaFpHReFRAOSIB0Ir170QuYOfxgIKkoHr8aK6ugWfj4
 dOx+3sWBedrDe5a4af+5sGd0/YSAgA2WjN1Ijv4AYh2L0MrtapvkOZtCQ
 R2HlBvH+8EQ1mg6ZWgpt8ZFFqU7FV+h/EOVsiemEsY36iUd+SgN28/FnU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389026827"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389026827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955435681"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955435681"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:53 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
Date: Wed, 10 Jan 2024 09:32:52 -0800
Message-ID: <20240110173252.16707-5-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110173252.16707-1-brian.welty@intel.com>
References: <20240110173252.16707-1-brian.welty@intel.com>
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

This function is no longer used as the job_timeout is now
updated prior to calling queue_ops.init().

Signed-off-by: Brian Welty <brian.welty@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 --
 drivers/gpu/drm/xe/xe_execlist.c         |  8 --------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6041892d894e..e7f84dee5275 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -200,8 +200,6 @@ struct xe_exec_queue_ops {
 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
-	/** @set_job_timeout: Set job timeout for exec queue */
-	int (*set_job_timeout)(struct xe_exec_queue *q, u32 job_timeout_ms);
 	/**
 	 * @suspend: Suspend exec queue from executing, allowed to be called
 	 * multiple times in a row before resume with the caveat that
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 96b5224eb478..58dfe6a78ffe 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -418,13 +418,6 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
-static int execlist_exec_queue_set_job_timeout(struct xe_exec_queue *q,
-					       u32 job_timeout_ms)
-{
-	/* NIY */
-	return 0;
-}
-
 static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	/* NIY */
@@ -455,7 +448,6 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.set_priority = execlist_exec_queue_set_priority,
 	.set_timeslice = execlist_exec_queue_set_timeslice,
 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
-	.set_job_timeout = execlist_exec_queue_set_job_timeout,
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 392cbde62957..7c29b8333c71 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1350,21 +1350,6 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
-static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
-{
-	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-
-	xe_assert(xe, !exec_queue_registered(q));
-	xe_assert(xe, !exec_queue_banned(q));
-	xe_assert(xe, !exec_queue_killed(q));
-
-	sched->base.timeout = job_timeout_ms;
-
-	return 0;
-}
-
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
@@ -1415,7 +1400,6 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
-	.set_job_timeout = guc_exec_queue_set_job_timeout,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.43.0

