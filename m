Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFCCCCFA06
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C410EC18;
	Fri, 31 Oct 2025 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmxBWppU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF6510E2FE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935384; x=1793471384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4SsmM4KX2/Gr/0CKt9rU9Ir2fQQEUI+GcAkd5jDf5og=;
 b=jmxBWppUWwyarcNsWPjThhnqfwzXyILEcjqt6qjtI1WrbeqylmeBjPE0
 +AhKKJoH+gtDNEavcrUsSIDUY1BL7lmKyy2zLI8Q7lvJFNnS+5c0H3wFW
 cUvO6+525uSu/SQ5pllBj9fKyjhcQp2HAnw9dngn00T9ov9wn0U+ChxgF
 Q6UUv4+LYa4GVsTQK3+bidaOkKUk9pH6uu/7h1vIgxijxtmAnZpfnplaK
 ixA0LqHMv4aqx5xeXbY7rMPY567EqByLA7K1SeYpV8ZdmtLZq1sUhRpYk
 XWqNT4j/YzGa/DgvInakBWwCFo9YeQtoJG1WrNl7C1uTOwFcd9IML2WlY g==;
X-CSE-ConnectionGUID: rL5Uyg+NQluMkDcEngaTgw==
X-CSE-MsgGUID: 8cYguSYMR5S/zG5ydUNyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123857"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: 81rJpaZRQ5SggRjC8LXbow==
X-CSE-MsgGUID: hFS8ZqPgTImH53R34p0+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987634"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue dynamic
 priority change
Date: Fri, 31 Oct 2025 11:29:27 -0700
Message-ID: <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0264cab00fd4..98f8f1c7f13b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
 	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
 		return -EINVAL;
 
-	q->multi_queue.priority = value;
+	/* For queue creation time (!q->xef) setting, just store the priority value */
+	if (!q->xef) {
+		q->multi_queue.priority = value;
+		return 0;
+	}
 
-	return 0;
+	return q->ops->set_multi_queue_priority(q, value);
 }
 
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
@@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->property !=
+			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
+		return -EINVAL;
+
 	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 964a0e6654c7..dcb55b069ed8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
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
index 5ec144c1c2dc..426b64ef8d99 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
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
@@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case RESUME:
 		__guc_exec_queue_process_msg_resume(msg);
 		break;
+	case SET_MULTI_QUEUE_PRIORITY:
+		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	return 0;
 }
 
+static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
+						   enum xe_multi_queue_priority priority)
+{
+	struct xe_sched_msg *msg;
+
+	if (!xe_exec_queue_is_multi_queue(q))
+		return -EINVAL;
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
@@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.set_priority = guc_exec_queue_set_priority,
 	.set_timeslice = guc_exec_queue_set_timeslice,
 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
+	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
-- 
2.43.0

