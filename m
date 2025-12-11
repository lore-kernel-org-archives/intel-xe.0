Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008D2D3E787
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D9A10E6C8;
	Thu, 11 Dec 2025 01:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJt45NEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1310E6C8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Q5ZU4jHeoZcRVVDUpRHyc8h1ascrLsvbJGp7kmFWv0=;
 b=gJt45NEp1r1vMpQApDVuX6nhl9UD3plRkfe3jGCOaLqBQsaYABegKnSA
 tR1cHD0zdYQz6yitV1Svs0apmgAfdto0SknLZ0RQqdPvuqvlmZ6ctIkw3
 1FfahllbUufaCpDi9rI1Zu8vXAH0ebz18yHfQU4tOui4oUZn296Ph3+H9
 r2wCpVHlHNZJjIaKfO3s7iqTD6T/7GwD5x8VCR3boujj5JdHNVhikHK+s
 cCVagHEEnW4gFqCE34kuxZ6ud9LZI7BW5r8yVYieaml/90lxdHXkexgBa
 8VYbUeZspUPiS2B1mDQ2t4O58x1Ykadm6ia6/KUP0dbxN31uyWWZc9hVZ Q==;
X-CSE-ConnectionGUID: Kpx8CIZ5ToK5VnAzykx/Cg==
X-CSE-MsgGUID: rTnJ9niJRsK+pzcQM9hltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442866"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
X-CSE-ConnectionGUID: N2sWKYvXTtqeqO2AcS+y8A==
X-CSE-MsgGUID: a8rAnCNJQteXDboscZML6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664106"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 07/17] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Date: Wed, 10 Dec 2025 17:02:55 -0800
Message-ID: <20251211010249.1647839-26-niranjana.vishwanathapura@intel.com>
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

Support dynamic priority change for multi queue group queues via
exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
the drm scheduler message interface for priority to take effect.

v2: Move is_multi_queue check to exec_queue layer and assert
    is_multi_queue being set in guc submission layer (Matt Brost)
v3: Assert CGP_SYNC message length is valid (Matt Brost)

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 57 ++++++++++++++++++++++--
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d738a9fea1e1..256e2ce1fe69 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -771,9 +771,16 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
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
index 46e5f4715a0d..1c285ac12868 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -260,6 +260,9 @@ struct xe_exec_queue_ops {
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
index 7cca03d4296c..2f467cc1929f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1779,10 +1779,34 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
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
+#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE        (2)
+		struct xe_guc *guc = exec_queue_to_guc(q);
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
+		int len = 0;
+
+		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
+		action[len++] = group->primary->guc->id;
+
+		xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
+#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
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
@@ -1806,6 +1830,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case RESUME:
 		__guc_exec_queue_process_msg_resume(msg);
 		break;
+	case SET_MULTI_QUEUE_PRIORITY:
+		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2022,6 +2049,27 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
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
@@ -2113,6 +2161,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
+	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.43.0

