Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C2CC30659
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634C410E277;
	Tue, 25 Jun 2024 20:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nni7antR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9319310E2ED
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719346525; x=1750882525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9j5lrtRdqnhurSgG7g32AHW4n/5j1JOxK9/6Sy0JlLA=;
 b=Nni7antRib+0Na5GPsG9Le4rzejMP7nZ34ItfI1EcjKMnOQOmgqG64ui
 LvsjtQyZS8Tepjgx7vBmF+3CktXT7An5zM5cK+fWeM8jrzl2OvgnOuGHM
 tALQYuCOynYQEhOVjsjDVPtjviYMoPoitg0Q0FmWaJrKXBbSzBbE5kSwc
 AJROOskcE45r0yubwNfQebbzFr8D4aYv+fpqiuaP/CFwMmAAeQD+K0ax4
 JTUPmhV4acjyNYB/C3BemHQLX+xQ+bKttaFpr0GYB4D+cV7X9T+IOF1TE
 znSUy79Y2PVMRsQ+Wwv2AZD7I5sywZNfO6Ypkf8/avJwOKPuq1xutpemV g==;
X-CSE-ConnectionGUID: Xo4ojsRaR2eq7aMuRVmZ9g==
X-CSE-MsgGUID: z2VMsvxpScucmOAk9nMe9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16535016"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16535016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:15:25 -0700
X-CSE-ConnectionGUID: GCzK/6i2SjisTNUTUD0DKw==
X-CSE-MsgGUID: jNmBMEiHRzGzHTkohelKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43855735"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:15:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: [PATCH 2/3] drm/xe: Exec queue op's to enable/disable preemption and
 timeslicing
Date: Tue, 25 Jun 2024 13:15:17 -0700
Message-ID: <20240625201518.766925-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240625201518.766925-1-ashutosh.dixit@intel.com>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
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

Introduce set_no_preempt and clear_no_preempt exec queue ops.
set_no_preempt allows an exec queue to run uninterrupted (without
preemption or timeslicing). clear_no_preempt re-enables preemption and
timeslicing. The functionality is used in OA in the next patch.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +++
 drivers/gpu/drm/xe/xe_execlist.c         | 14 ++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..8d64c2277e96 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -164,6 +164,10 @@ struct xe_exec_queue_ops {
 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
+	/** @set_no_preempt: Disable preemption and timeslicing for exec queue */
+	int (*set_no_preempt)(struct xe_exec_queue *q);
+	/** @clear_no_preempt: Re-enable preemption and timeslicing for exec queue */
+	int (*clear_no_preempt)(struct xe_exec_queue *q);
 	/**
 	 * @suspend: Suspend exec queue from executing, allowed to be called
 	 * multiple times in a row before resume with the caveat that
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..04a2c7e86019 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -416,6 +416,18 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int execlist_exec_queue_set_no_preempt(struct xe_exec_queue *q)
+{
+	/* NIY */
+	return 0;
+}
+
+static int execlist_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
+{
+	/* NIY */
+	return 0;
+}
+
 static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	/* NIY */
@@ -446,6 +458,8 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.set_priority = execlist_exec_queue_set_priority,
 	.set_timeslice = execlist_exec_queue_set_timeslice,
 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
+	.set_no_preempt = execlist_exec_queue_set_no_preempt,
+	.clear_no_preempt = execlist_exec_queue_clear_no_preempt,
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 373447758a60..3fd5523baf0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1548,6 +1548,49 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int guc_exec_queue_set_no_preempt(struct xe_exec_queue *q)
+{
+	struct xe_sched_msg *msg;
+
+	if ((!q->sched_props.preempt_timeout_us && !q->sched_props.timeslice_us) ||
+	    exec_queue_killed_or_banned_or_wedged(q))
+		return 0;
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	/* Setting values to 0 will disable preemption and timeslicing */
+	q->sched_props.preempt_timeout_us = 0;
+	q->sched_props.timeslice_us = 0;
+
+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+
+	return 0;
+}
+
+static int guc_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
+{
+	struct xe_sched_msg *msg;
+
+	if ((q->sched_props.preempt_timeout_us ==
+	    q->hwe->eclass->sched_props.preempt_timeout_us &&
+	    q->sched_props.timeslice_us == q->hwe->eclass->sched_props.timeslice_us) ||
+	    exec_queue_killed_or_banned_or_wedged(q))
+		return 0;
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	q->sched_props.preempt_timeout_us = q->hwe->eclass->sched_props.preempt_timeout_us;
+	q->sched_props.timeslice_us = q->hwe->eclass->sched_props.timeslice_us;
+
+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+
+	return 0;
+}
+
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
@@ -1598,6 +1641,8 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
+	.set_no_preempt = guc_exec_queue_set_no_preempt,
+	.clear_no_preempt = guc_exec_queue_clear_no_preempt,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.41.0

