Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1304C44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B810E1D4;
	Wed, 21 Jan 2026 21:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPrVz7wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4E10E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769030383; x=1800566383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LNKfVb9O8n9EKTO+vq0PJ1mKzO4okp9UNj3MgQdNz54=;
 b=LPrVz7wldFtmo5YzsKRR/PbYDWyk3pxg7vMQZUppgzYs92MMgdwpnlM3
 cx89PZ2DQKHwk8PjUR2GayAek6ICj8FoYmVdOQCQtf9q6WAy7uUQhFc8y
 jzCqGnIovtFmVLOBPiiTPHTUecBLL1azAAq813LxYSdgEhvkqf03AgpCy
 J2y6xPoCyb5G9ZJLKSXyD4FGGeTayqbtZN81O/mKxALTcVuUzc0/88xSp
 VTfd5nW9jM44xH3ZHRNxuJ6xzKfp7cOAUMWuTJUOHby9aF0rBlPriTgvm
 VAZBPWWvxKV2bZoAoCoQMMX4tyLqHNl+mZAhq2KNIn3JBa8Y4BmqUQDWz A==;
X-CSE-ConnectionGUID: +DQM20zkSMGPpEXESkiBSA==
X-CSE-MsgGUID: 0VQ30foeQxOvzNlottFe+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73892642"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="73892642"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:19:42 -0800
X-CSE-ConnectionGUID: 9BvvSVLTQWm1C5Nbd3yZQQ==
X-CSE-MsgGUID: hUUQS3M6RrSB0tVolydBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="211057782"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:19:43 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe/multi_queue: Protect priority against concurrent access
Date: Wed, 21 Jan 2026 13:19:34 -0800
Message-ID: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
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

Use a spin_lock to protect multi-queue priority being concurrently
updated by multiple set_priority ioctls and protect against
concurrent read and write to this field. Also, guard against
compile optimization by using WRITE_ONCE() and READ_ONCE() macros.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 20 ++++++++++++++------
 3 files changed, 17 insertions(+), 6 deletions(-)

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
index e987d431ce27..ab6980aaa36e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -163,6 +163,8 @@ struct xe_exec_queue {
 		struct list_head link;
 		/** @multi_queue.priority: Queue priority within the multi-queue group */
 		enum xe_multi_queue_priority priority;
+		/** @multi_queue.lock: Lock for @multi_queue.priority access */
+		spinlock_t lock;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
 		u8 pos;
 		/** @multi_queue.valid: Queue belongs to a multi queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 456f549c16f6..76dd3a204811 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -827,7 +827,9 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 		return;
 	}
 
-	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
+	spin_lock(&q->multi_queue.lock);
+	xe_lrc_set_multi_queue_priority(q->lrc[0], READ_ONCE(q->multi_queue.priority));
+	spin_unlock(&q->multi_queue.lock);
 	xe_guc_exec_queue_group_cgp_update(xe, q);
 
 	WRITE_ONCE(group->sync_pending, true);
@@ -2181,15 +2183,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
 
 	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
 
-	if (q->multi_queue.priority == priority ||
-	    exec_queue_killed_or_banned_or_wedged(q))
-		return 0;
-
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	q->multi_queue.priority = priority;
+	spin_lock(&q->multi_queue.lock);
+	if (q->multi_queue.priority == priority ||
+	    exec_queue_killed_or_banned_or_wedged(q)) {
+		spin_unlock(&q->multi_queue.lock);
+		kfree(msg);
+		return 0;
+	}
+
+	WRITE_ONCE(q->multi_queue.priority, priority);
+	spin_unlock(&q->multi_queue.lock);
+
 	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
 
 	return 0;
-- 
2.43.0

