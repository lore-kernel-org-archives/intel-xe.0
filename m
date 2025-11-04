Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADCACCFA1A
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D0F10E32A;
	Tue,  4 Nov 2025 18:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILoETgmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37E110E31C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282318; x=1793818318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gn2n2D93404rC9QpO1f+AtpX8s5KzhHBBpq/kjb+Ahw=;
 b=ILoETgmSJ8rQzf8R6DWWiKWsNHYqtRX+0sfcmMGuFegKZZaUKwbO4mpD
 Nuf1LL5x5ba5DyXwoO+FgNhuPKWi0OA5JFHcPg/0PYCRplZj66w4xubpV
 R6Dq+Q+GERrYgkMyUojh0CaKoFiNLJrTeQBfzDpepz7HTT2/092KKvgBi
 oiNqeXa17BYJqzYgPMfnhQNXPOWzd3MCGmyt9a9F12boy2dewaUqZTIm9
 zEe/7ebi6MaRVY6BwYHcA8DzzLEU0+GAlm5cPgKYdxIhYdPXBElWVHofA
 kuTH1Liqe0VctIKJK83vc2iSwOQ4DGvT+YUbNnPza5dg43S2b9pZNOvcs w==;
X-CSE-ConnectionGUID: Xj7B5lWgS4i8/IjblEClFw==
X-CSE-MsgGUID: 79Hg2YtKSJKYgHR8ykmD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247748"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
X-CSE-ConnectionGUID: FZQVtRTiSTy8KLUYiRIr9g==
X-CSE-MsgGUID: lYvC+9byTKSyce2q6noZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183085"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Date: Tue,  4 Nov 2025 10:51:41 -0800
Message-ID: <20251104185150.246345-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

Support dynamic priority change for multi queue group queues via
exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
the drm scheduler message interface for priority to take effect.

v2: Move is_multi_queue check to exec_queue layer and assert
    is_multi_queue being set in guc submission layer (Matt Brost)

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 55 ++++++++++++++++++++++--
 3 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c96cc085e8e8..fef48b82b189 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -744,9 +744,16 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
 	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
 		return -EINVAL;
 
-	q->multi_queue.priority = value;
+	/* For queue creation time (!q->xef) setting, just store the priority value */
+	if (!q->xef) {
+		q->multi_queue.priority = value;
+		return 0;
+	}
 
-	return 0;
+	if (!xe_exec_queue_is_multi_queue(q))
+		return -EINVAL;
+
+	return q->ops->set_multi_queue_priority(q, value);
 }
 
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 445ae4979c0c..cafb3ba9a123 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -257,6 +257,9 @@ struct xe_exec_queue_ops {
 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
+	/** @set_multi_queue_priority: Set multi queue priority */
+	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
+					enum xe_multi_queue_priority priority);
 	/**
 	 * @suspend: Suspend exec queue from executing, allowed to be called
 	 * multiple times in a row before resume with the caveat that
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b01d852ae526..27ef83524a34 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1767,10 +1767,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	}
 }
 
-#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
-#define SET_SCHED_PROPS	2
-#define SUSPEND		3
-#define RESUME		4
+static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+
+	if (guc_exec_queue_allowed_to_change_state(q)) {
+#define MAX_MULTI_QUEUE_REG_SIZE        (2)
+		struct xe_guc *guc = exec_queue_to_guc(q);
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
+		int len = 0;
+
+		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
+		action[len++] = group->primary->guc->id;
+#undef MAX_MULTI_QUEUE_REG_SIZE
+
+		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+	}
+
+	kfree(msg);
+}
+
+#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
+#define SET_SCHED_PROPS			2
+#define SUSPEND				3
+#define RESUME				4
+#define SET_MULTI_QUEUE_PRIORITY	5
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -1794,6 +1816,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case RESUME:
 		__guc_exec_queue_process_msg_resume(msg);
 		break;
+	case SET_MULTI_QUEUE_PRIORITY:
+		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2010,6 +2035,27 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
+						   enum xe_multi_queue_priority priority)
+{
+	struct xe_sched_msg *msg;
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
+
+	if (q->multi_queue.priority == priority ||
+	    exec_queue_killed_or_banned_or_wedged(q))
+		return 0;
+
+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	q->multi_queue.priority = priority;
+	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
+
+	return 0;
+}
+
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
@@ -2101,6 +2147,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
+	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.43.0

