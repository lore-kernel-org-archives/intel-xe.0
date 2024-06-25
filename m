Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5874C3065A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1348E10E735;
	Tue, 25 Jun 2024 20:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7hDGBuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8F910E302
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719345970; x=1750881970;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h3CSKL4F9jCxMhUC5TO3BdSl3N8UcCULlanY5lERuM8=;
 b=N7hDGBuhNyrmSvubH41Wqa0ByWioocRj3H77Vbdsk3/+/c2qswljcM+b
 yyoXFnYl8J59b7zolHXBJX3I5KRfT5mVY2B9pxWuDMPPkvfkHE36CCEwG
 fhVTx/LzvmaxrZy+9KtO6sBngDkve6gDK/G6NzLP2L5mJSmVSyyRPsEha
 b5hO57Fy5c/4vOelBpgvHtibXp7JsMS/zgBv48QxtvoYdP7coyJmKlZ0F
 jihxX1Tys66DNdlVc9mUT2Sv6MVlVnJnn8zmuCsW0p3KSjBdRK/1j22L4
 kCm7+WFbn1Hs7lW+HEuGx6oF5LrPR6SvPwYgtDSDAp+BrVjJzmQJzQ3Gs w==;
X-CSE-ConnectionGUID: uvdCzLniTcSg5k8H4lhnRg==
X-CSE-MsgGUID: EIlGzSRSTJWJI+fz+AM9Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20165020"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20165020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
X-CSE-ConnectionGUID: jgTZJlI3RSi5qXNtc4gVLA==
X-CSE-MsgGUID: 3jEp+OpuTc+Y+CwSXLNWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48935542"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Introduce no_preempt exec queue op
Date: Tue, 25 Jun 2024 13:05:57 -0700
Message-ID: <20240625200558.763682-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240625200558.763682-1-ashutosh.dixit@intel.com>
References: <20240625200558.763682-1-ashutosh.dixit@intel.com>
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

Introduce no_preempt exec queue op to allow an exec queue to run
uninterrupted (without preemption or timeslicing). The functionality is
used in OA in the next patch.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  7 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 36 ++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..52e281158b15 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -164,6 +164,8 @@ struct xe_exec_queue_ops {
 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
+	/** @no_preempt: Disable preemption and timeslicing for exec queue */
+	int (*no_preempt)(struct xe_exec_queue *q, bool enable);
 	/**
 	 * @suspend: Suspend exec queue from executing, allowed to be called
 	 * multiple times in a row before resume with the caveat that
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..15392c1d7005 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -416,6 +416,12 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int execlist_exec_queue_no_preempt(struct xe_exec_queue *q, bool enable)
+{
+	/* NIY */
+	return 0;
+}
+
 static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	/* NIY */
@@ -446,6 +452,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.set_priority = execlist_exec_queue_set_priority,
 	.set_timeslice = execlist_exec_queue_set_timeslice,
 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
+	.no_preempt = execlist_exec_queue_no_preempt,
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 373447758a60..db424133bc14 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1548,6 +1548,41 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int guc_exec_queue_no_preempt(struct xe_exec_queue *q, bool enable)
+{
+	struct xe_sched_msg *msg;
+
+	if (exec_queue_killed_or_banned_or_wedged(q))
+		return 0;
+
+	if (enable) {
+		if (!q->sched_props.preempt_timeout_us && !q->sched_props.timeslice_us)
+			return 0;
+	} else {
+		if (q->sched_props.preempt_timeout_us ==
+		    q->hwe->eclass->sched_props.preempt_timeout_us &&
+		    q->sched_props.timeslice_us == q->hwe->eclass->sched_props.timeslice_us)
+			return 0;
+	}
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	if (enable) {
+		/* Setting values to 0 will disable preemption and timeslicing */
+		q->sched_props.preempt_timeout_us = 0;
+		q->sched_props.timeslice_us = 0;
+	} else {
+		q->sched_props.preempt_timeout_us = q->hwe->eclass->sched_props.preempt_timeout_us;
+		q->sched_props.timeslice_us = q->hwe->eclass->sched_props.timeslice_us;
+	}
+
+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+
+	return 0;
+}
+
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
@@ -1598,6 +1633,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
+	.no_preempt = guc_exec_queue_no_preempt,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.41.0

