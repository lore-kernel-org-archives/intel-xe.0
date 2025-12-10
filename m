Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235DD3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3810E63E;
	Wed, 10 Dec 2025 00:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ5QHkXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252910E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327164; x=1796863164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h0dsYRfpQ+TnOW695Lk1Xl82J5Pw9whlz02D3/X8efU=;
 b=MZ5QHkXBJdVLYJKCsjzA7hCDzTVbxBOkBHZBBMvApbbSIohHIN+4IHSi
 1y8Y5ZXlVwjSk2nHeIfUQkjRhxDMUWdHFG+zxovTjXTxYKAWu9+Y10JDY
 ayI99BR58t1kI7KnRo/qrTVK0/P2M+fqu4mNuirTYbNEGbaQrkBlYBwh4
 JjTt/4bFfU84BmF+nqNYAN2GtHUbyS8JGMBm4LhUUWmnHCQOxbIwcMPCv
 ef9kn/3W5rjMQO2QepHsDZQFDEagg2yFS2SkuHCv2d8wQoxPTFYONsp1Y
 lLBKjL+8gr1zgxNbqw9lNXlVKTcr4UknjimC8KunFo6VVEASc87XV1LTN A==;
X-CSE-ConnectionGUID: MoodylzYRRCcIl4nyP8Swg==
X-CSE-MsgGUID: jN69LmB2TDqOQWvxP5haTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180380"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
X-CSE-ConnectionGUID: 9dAYCj0AQcqKccNmmCv0+w==
X-CSE-MsgGUID: /MKMcAsfQJqnSftuaizVBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421540"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 13/17] drm/xe/multi_queue: Teardown group upon job timeout
Date: Tue,  9 Dec 2025 16:39:24 -0800
Message-ID: <20251210003913.1612141-32-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
References: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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

v5: Ban the group while trigerring TDR for the guc
    reported errors
    Add FIXME in TDR to take multi-queue group off HW
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 20 +++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

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
index e8bde976e4c8..64cc2b285714 100644
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
@@ -1639,7 +1657,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
 
-	xe_guc_exec_queue_trigger_cleanup(q);
+	xe_guc_exec_queue_group_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	spin_lock(&sched->base.job_list_lock);
-- 
2.43.0

