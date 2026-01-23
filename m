Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD8D778B2
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 21:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D1310E2EE;
	Fri, 23 Jan 2026 21:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvFxo6nf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70EA10E2EE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 21:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769203639; x=1800739639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0BZ1MwLwdRvcurgGAXZUQ6Tdmi5PJFQRm7pi1fEcvCM=;
 b=IvFxo6nfWAYL6l3D6TBeRdBAkrISI0Mz+si4nR+24PwBY87KhdnR1L7L
 2WXMbNWkGOghSyFrsWAbtOwQiFfqiA0+qErcboZJZp7J/+UiblKPcz97X
 zLtLzrxzJ2W1nwNMYtSyG6aSO9nESKyzz8BXtVPfjSkcp32F2NYwJHsnr
 J6hp2xhzswqOIoE9mzY8QI1DjHYrUVsQHup2gTzbptuOt38lUkcMePm+c
 MxVJ30Dy7wtHWPGaOwASXGbmybjLMDX2O9XmfQSDySZP57uQix83Zi6Pe
 rNItBJoco2EIIkcx3q9u+GAHfj8MLH09y/YQTp7P7FWbtn6kFHwSLJDTf w==;
X-CSE-ConnectionGUID: YflgWo2+S62s9+yerONP8Q==
X-CSE-MsgGUID: BcTz0LpZQgitZQRgA9kNug==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88037013"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="88037013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:27:18 -0800
X-CSE-ConnectionGUID: aEUOePvgQeOWKVaCMFabCQ==
X-CSE-MsgGUID: 7LbVSmnZQq+7sZJm+NzZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207470797"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:27:18 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2] drm/xe/multi_queue: Protect priority against concurrent
 access
Date: Fri, 23 Jan 2026 13:27:11 -0800
Message-ID: <20260123212710.3393405-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use a spinlock to protect multi-queue priority being concurrently
updated by multiple set_priority ioctls and to protect against
concurrent read and write to this field.

v2: Update documentation, remove WRITE/READ_LOCK() (Thomas)
    Use scoped_guard, reduced lock scope (Matt Brost)
v3: Fix author (checkpatch)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 19 +++++++++++++++----
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7e7e663189e4..66d0e10ee2c4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -230,6 +230,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	spin_lock_init(&q->multi_queue.lock);
 	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index e987d431ce27..3791fed34ffa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -161,8 +161,13 @@ struct xe_exec_queue {
 		struct xe_exec_queue_group *group;
 		/** @multi_queue.link: Link into group's secondary queues list */
 		struct list_head link;
-		/** @multi_queue.priority: Queue priority within the multi-queue group */
+		/**
+		 * @multi_queue.priority: Queue priority within the multi-queue group.
+		 * It is protected by @multi_queue.lock.
+		 */
 		enum xe_multi_queue_priority priority;
+		/** @multi_queue.lock: Lock for protecting certain members */
+		spinlock_t lock;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
 		u8 pos;
 		/** @multi_queue.valid: Queue belongs to a multi queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 456f549c16f6..1f4625ddae0e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -804,6 +804,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 {
 	struct xe_exec_queue_group *group = q->multi_queue.group;
 	struct xe_device *xe = guc_to_xe(guc);
+	enum xe_multi_queue_priority priority;
 	long ret;
 
 	/*
@@ -827,7 +828,10 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 		return;
 	}
 
-	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
+	scoped_guard(spinlock, &q->multi_queue.lock)
+		priority = q->multi_queue.priority;
+
+	xe_lrc_set_multi_queue_priority(q->lrc[0], priority);
 	xe_guc_exec_queue_group_cgp_update(xe, q);
 
 	WRITE_ONCE(group->sync_pending, true);
@@ -2181,15 +2185,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 
 	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
 
-	if (q->multi_queue.priority == priority ||
-	    exec_queue_killed_or_banned_or_wedged(q))
+	if (exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	q->multi_queue.priority = priority;
+	scoped_guard(spinlock, &q->multi_queue.lock) {
+		if (q->multi_queue.priority == priority) {
+			kfree(msg);
+			return 0;
+		}
+
+		q->multi_queue.priority = priority;
+	}
+
 	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
 
 	return 0;
-- 
2.43.0

