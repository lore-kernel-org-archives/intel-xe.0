Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46703C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2910E7A5;
	Wed, 24 Jul 2024 19:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF54pr5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5454110E7A0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849704; x=1753385704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOeerHc2U71J5svvjg4wQUyAkDuO0Ci6hArHAKLUe3g=;
 b=iF54pr5CNtNUF2OBcJF+f6lPMzFvBBdRVaTB9gHixMXtAxQJdOVT60FT
 0qQOr7Pskkpsq4ZAacbgJ1NAltJfM+gMzjL/Qu5OAh58b6ilYAypcVaIH
 SqDAh8/5ZcFpgvtjDCOjrSa2EyU6TqOyr7Ef+RhEuMP3KlbceTUk0kRxD
 YSJAn1PjtKjeHaKuOV+77nTRn57NuVM5BgpQeyk1ZsBW4kFwGW7eSjERS
 mCSuFyhqJu6uOLDybRNNmRbO7D+VMPaGtXUuEHeki7wwSAVFrnYbBmD7S
 ZkDnOzYrd4HmNRDrSbbRmirCV4cPqkKXcpRD5wvrUQ8E/VpbseCJC8ZZ/ Q==;
X-CSE-ConnectionGUID: g8AuNJOCQmee0sPfD94wSw==
X-CSE-MsgGUID: 6D6Eg012QRa1m1eZ+pDmzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691129"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:04 -0700
X-CSE-ConnectionGUID: scTvbLePQA+Rogz5JScVQA==
X-CSE-MsgGUID: pFlY//hgTqqJM69rvubyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292244"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 03/12] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Date: Wed, 24 Jul 2024 21:32:56 +0200
Message-ID: <20240724193431.2685833-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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

Add helpers to safely add and delete the exec queues attached to a hw
engine group, and make use them at the time of creation and destruction of
the exec queues. Keeping track of them is required to control the
execution mode of the hw engine group.

v2: Improve error handling and robustness, suspend exec queues created in
    fault mode if group in dma-fence mode, init queue link (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  8 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c  | 52 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h  |  4 ++
 4 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..6fc952755cb3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
+#include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -69,6 +70,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
+	INIT_LIST_HEAD(&q->hw_engine_group_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -186,6 +188,8 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *eq, *next;
 
 	xe_exec_queue_last_fence_put_unlocked(q);
+	if (q->vm && q->hwe->hw_engine_group)
+		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
 					 multi_gt_link)
@@ -640,6 +644,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, err))
 				goto put_exec_queue;
 		}
+
+		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
+		if (err)
+			goto put_exec_queue;
 	}
 
 	mutex_lock(&xef->exec_queue.lock);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..7df2b532f340 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,6 +143,8 @@ struct xe_exec_queue {
 	u64 old_run_ticks;
 	/** @run_ticks: hw engine class run time in ticks for this exec queue */
 	u64 run_ticks;
+	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
+	struct list_head hw_engine_group_link;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 7fd10f0780ea..da1515068850 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -5,9 +5,12 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_group.h"
+#include "xe_vm.h"
 
 static void
 hw_engine_group_free(struct drm_device *drm, void *arg)
@@ -97,3 +100,52 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 
 	return err;
 }
+
+/**
+ * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
+ * @group: The hw engine group
+ * @q: The exec_queue
+ *
+ * Return: 0 on success,
+ *	    -EINTR if the lock could not be acquired
+ */
+int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
+{
+	int err;
+	struct xe_device *xe = gt_to_xe(q->gt);
+
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
+	xe_assert(xe, q->vm);
+
+	err = down_write_killable(&group->mode_sem);
+	if (err)
+		return err;
+
+	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
+		q->ops->suspend(q);
+		q->ops->suspend_wait(q);
+		queue_work(group->resume_wq, &group->resume_work);
+	}
+
+	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
+	up_write(&group->mode_sem);
+
+	return 0;
+}
+
+/**
+ * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
+ * @group: The hw engine group
+ * @q: The exec_queue
+ */
+void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
+{
+	xe_assert(gt_to_xe(q->gt), q->vm);
+
+	down_write(&group->mode_sem);
+
+	if (!list_empty(&group->exec_queue_list))
+		list_del(&q->hw_engine_group_link);
+
+	up_write(&group->mode_sem);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index c2648f87f7ef..857a83787504 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -9,8 +9,12 @@
 #include "xe_hw_engine_group_types.h"
 
 struct drm_device;
+struct xe_exec_queue;
 struct xe_gt;
 
 int xe_hw_engine_setup_groups(struct xe_gt *gt);
 
+int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
+void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
+
 #endif
-- 
2.43.0

