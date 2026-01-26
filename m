Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F52D19502
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 17:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8910E459;
	Mon, 26 Jan 2026 17:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="an230LTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3831210E459
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769449366; x=1800985366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pwbciUa9fGEEvYR3ZphacvwDNStKoLTOa5ZFsqF5gbA=;
 b=an230LTQs6K087B0MzBgOOHgaFAoT+ASSLCzmCPq2cWtuJiCu5eeYZ5a
 CavSKgMKOrEp7yhJbAYx6dY3OO3eMpkK95LKAdQGr+ebeQ4j1YpCdkPmZ
 bPQHkMd0nhP5s2zr4GiyBQYGUMhwlZFRPZRFLRtOfWmlbwvsTylWB1SeE
 j0B4r1xqiMoIHpqCK9xURjKejSthPoluXKjuOnDeAjQLHfazXrxyDv3b6
 GDVFtpMnrbEnMnsyomZxFjvdPWOiItOwlPVofK8YWIYDNSrUn9jNKeucZ
 4SiKQ7ThgPsRXGNcQESRkhZ39VcEDGXUDC6/g6jvhWAyduDTCHz1fvnhE w==;
X-CSE-ConnectionGUID: dU0Ho/nXQKmss9R5fcZ6rA==
X-CSE-MsgGUID: A7o8MUtTSlS2EkFZNU5Kig==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96094667"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="96094667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 09:42:46 -0800
X-CSE-ConnectionGUID: DJTjdCs1QNilLTQC77Vxbw==
X-CSE-MsgGUID: cu9M3GQKQyKF4wRfZc27VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207619110"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 09:42:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3] drm/xe/multi_queue: Protect priority against concurrent
 access
Date: Mon, 26 Jan 2026 09:42:42 -0800
Message-ID: <20260126174241.3470390-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

