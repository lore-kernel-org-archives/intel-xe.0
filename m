Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88265C4707C
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E010E2DB;
	Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972A410E2CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307450; x=1735843450;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DkqIL/6pVbZXCRGamJCcVDBra+L/BiIgmXyfHk53nbo=;
 b=ZAx8v/8dTgjLxFGr24VoLO0ZsLszZh5lUPC3QyI6fApij5fjR6es7tE7
 xLwme7xGxH2y3O3COkZjn+hPB2dr8Qmo7K/mE50Q98BXKbuO5LmykNLGI
 Trr8IlWWD6GwkFR5ajIKWBULUofPMCPdsydchOyPeZY/9DvCAQzQvPsbo
 vbENzyZQ5Uvef8dqo9lloocBJ31eVLEeT7OqXkVU6/1bJH7ZC95dYVPjA
 s64d4UVXaUHlhsxpBMmhLsfbCk0uhPDx9xrfgp7K4mXyC+DS44jGoQrIm
 uBwgI2d77VJ5p0jx3phVGUpyIh/fZKq4GGYy6HwYIfMcjCtSqU0FL89dq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3815687"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3815687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814330136"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="814330136"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
Date: Wed,  3 Jan 2024 10:44:08 -0800
Message-ID: <20240103184408.17844-6-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103184408.17844-1-brian.welty@intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
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
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 --
 drivers/gpu/drm/xe/xe_execlist.c         |  8 --------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6ae4f4e2ddca..aed66295bfc4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -198,8 +198,6 @@ struct xe_exec_queue_ops {
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

