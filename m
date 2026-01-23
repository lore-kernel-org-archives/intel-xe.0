Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7606AD778AE
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 19:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE1B10E2E8;
	Fri, 23 Jan 2026 19:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0x34G4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7724310E2E8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769197893; x=1800733893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGAzivo8R+ng6u8EDqzVduWH2aBWwaNDK0Lkwy4RCEg=;
 b=Q0x34G4wh11JKhPBo0rlCYEILM9Eap5RUmyuh/CORgrb+JX8GQgKsQBS
 skSTz8Wj+8zo75EaAOuksLIpc1EpPZD1CXWzv3ZSm2mKFpyMphAHZwhWj
 uFycHTqR2lW/mfL36z6P/XKUEaWnqJbHZlFknS8WzPoK8hA7DoiDzNRpJ
 WoYRGvXcvf/SUrtUX1CH9JcCrzJzdrUwvUryoiGn1exh7NEuazmBUTl/U
 PYHYoTnj3sM3D2/jo4ebIqceDYTGeagRdRY5jVd53HjW3V3GqW7owgiEV
 TJaO2vCKqV+VSzEEY2xAo/8/4bgHbYvYZEtKCxX5/kuzDt5jz8Wm2K6CL w==;
X-CSE-ConnectionGUID: PyHSYixcSQGXgHFlPTGuxw==
X-CSE-MsgGUID: q8jqREPqTYuyG+8ULNh93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70363468"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70363468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 11:51:32 -0800
X-CSE-ConnectionGUID: kltrwdcUSdG5pjOKlkhkEw==
X-CSE-MsgGUID: sn0G6zWQQSufZow396whNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206911036"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 11:51:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2] drm/xe/multi_queue: Protect priority against concurrent
 access
Date: Fri, 23 Jan 2026 11:51:25 -0800
Message-ID: <20260123195124.3390157-2-niranjana.vishwanathapura@intel.com>
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

From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>

Use a spinlock to protect multi-queue priority being concurrently
updated by multiple set_priority ioctls and to protect against
concurrent read and write to this field.

v2: Update documentation, remove WRITE/READ_LOCK() (Thomas)
    Use scoped_guard, reduced lock scope (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

