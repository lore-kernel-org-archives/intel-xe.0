Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E099D3E788
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0242510E6DA;
	Thu, 11 Dec 2025 01:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aL/yy5Ib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF6F10E6D2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414979; x=1796950979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zdsdcw9NJm5GsjZMqDuZvftyhXXTU65Fb2zYafOuS7A=;
 b=aL/yy5IbbIJm4XkYGkpBDdxlBJ/D6kuQfgP7CevlKosI0kUmd9JXKYp6
 WqzagMVpdSQFo9dSNGHO8/f/R0yo0lBOYJwBJfUijV1A7KHiRlqO2Z/fr
 zWMgX67qXeL6bcxhKuRUPjhZcCSOHKL7PGHvJwjmXf3BX8nsuD6hc9qu5
 rwVS7QcVP5ZOzBOJrcxQEGRphnVU3QGhjw3KfKgFRwoDkRPWquggpnm55
 Im7vCfHQRmG3V9yCQMriIN0Lnr9rc8RyX38CoaqH/1A+A2/dquPUXSmJt
 2/HuAZyG2T2y2cwBvHPZJxdIC7EyosQi9kii8CBnbj/C4RlCxQjScZ+ro w==;
X-CSE-ConnectionGUID: lShs85xlQp6ltPOHHUpy3A==
X-CSE-MsgGUID: JqyGTUvnRKmxBqLh/BLaYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442874"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
X-CSE-ConnectionGUID: pH/mvA5HR+iysofkcJaA7Q==
X-CSE-MsgGUID: m3zo5JcnRYK/KoOpKZfJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664131"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 13/17] drm/xe/multi_queue: Teardown group upon job timeout
Date: Wed, 10 Dec 2025 17:03:01 -0800
Message-ID: <20251211010249.1647839-32-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Upon a job timeout, teardown the multi-queue group by
triggering TDR on all queues of the multi-queue group
and by skipping timeout checks in them.

v5: Ban the group while triggering TDR for the guc
    reported errors
    Add FIXME in TDR to take multi-queue group off HW
    (Matt Brost)
v6: Trigger cleanup of group only for multi-queue case

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8a954ee62505..5fc516b0bb77 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -64,6 +64,8 @@ struct xe_exec_queue_group {
 	struct mutex list_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
+	/** @banned: Group banned */
+	bool banned;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e8bde976e4c8..f678b806acaa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -602,6 +602,8 @@ static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
 	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
 		     xe_exec_queue_is_multi_queue(q));
 
+	/* Group banned, skip timeout check in TDR */
+	WRITE_ONCE(group->banned, true);
 	xe_guc_exec_queue_trigger_cleanup(primary);
 
 	mutex_lock(&group->list_lock);
@@ -617,6 +619,9 @@ static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
 		struct xe_exec_queue_group *group = q->multi_queue.group;
 		struct xe_exec_queue *eq;
 
+		/* Group banned, skip timeout check in TDR */
+		WRITE_ONCE(group->banned, true);
+
 		set_exec_queue_reset(primary);
 		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
 			xe_guc_exec_queue_trigger_cleanup(primary);
@@ -1487,6 +1492,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		exec_queue_killed_or_banned_or_wedged(q) ||
 		exec_queue_destroyed(q);
 
+	/* Skip timeout check if multi-queue group is banned */
+	if (xe_exec_queue_is_multi_queue(q) &&
+	    READ_ONCE(q->multi_queue.group->banned))
+		skip_timeout_check = true;
+
+	/*
+	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
+	 * multi-queue group is off the HW before signaling the fences to avoid
+	 * possible memory corruptions. This means disabling scheduling on the
+	 * primary queue before or during the secondary queue's TDR. Need to
+	 * implement this in least obtrusive way.
+	 */
+
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
@@ -1639,7 +1657,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
 
-	xe_guc_exec_queue_trigger_cleanup(q);
+	if (xe_exec_queue_is_multi_queue(q))
+		xe_guc_exec_queue_group_trigger_cleanup(q);
+	else
+		xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	spin_lock(&sched->base.job_list_lock);
-- 
2.43.0

