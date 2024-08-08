Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224D7C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47BD10E7D0;
	Thu,  8 Aug 2024 18:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZWhIVfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E599810E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142558; x=1754678558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47xgSPfsddkPz3e2MKbw1jGJcxHAhH5Q2s/SUBMGIqs=;
 b=TZWhIVfuoK3xYsprdop8dcyXr8qbCb25Sj115+o/D/6Ail0PxOt77zLC
 yFRG+VZ9V8o4YTaYRF1PZQPKbCNxE7B4reUpXVnATBXRbN9AwZGi/SNuy
 k0EdZrbQqkzLFQpymh7RKwqO3z52ymNRAGjE3ku9IElvv7zHIuh5pu2dT
 pL4pNwtfp9xlPDs5eZaWlI8niDITsKJEvTQyTqSE7eE+GXaYA5BjlyKvQ
 hTN1cRlx+AJPZ6XrefJPpwRGN2tUJpGitNHt4zx4cUl4vK6Fo5YEJ35VL
 AYGBv8vnyPqC2Fh0C61eDZWn3rOOk/Z6JylD7FGUjKcA514N09hFQoN4I w==;
X-CSE-ConnectionGUID: w+f/b7MuRqSd3tRc06uKDg==
X-CSE-MsgGUID: /5RTuKf8QM+1p9l5SG70LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921589"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:37 -0700
X-CSE-ConnectionGUID: zPBZJkERR/ufHxRui2P3Nw==
X-CSE-MsgGUID: BTT7dhT3S+mEzUWBlqs3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975916"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 03/11] 'drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Date: Thu,  8 Aug 2024 20:40:21 +0200
Message-ID: <20240808184220.1715625-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

v3: Delete queue from hw engine group when it is destroyed by the user,
    also clean up at the time of closing the file in case the user did
    not destroy the queue

v4: Use correct list when checking if empty, do not add the queue if VM
    is in xe_vm_in_preempt_fence_mode (Matt Brost)

v5: Remove unrelated newline, add checks and asserts for group, unwind on
    suspend failure (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  3 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c  | 66 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h  |  4 ++
 5 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa19..447e9acbb570 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -37,6 +37,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -165,6 +166,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	 * vm->lock taken during xe_exec_queue_kill().
 	 */
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
+		if (q->vm && q->hwe->hw_engine_group)
+			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 956dc15b432a..0a0a15ee5e2b 100644
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
@@ -73,6 +74,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
+	INIT_LIST_HEAD(&q->hw_engine_group_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -615,6 +617,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, err))
 				goto put_exec_queue;
 		}
+
+		if (q->vm && q->hwe->hw_engine_group) {
+			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
+			if (err)
+				goto put_exec_queue;
+		}
 	}
 
 	mutex_lock(&xef->exec_queue.lock);
@@ -797,6 +805,9 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
+	if (q->vm && q->hwe->hw_engine_group)
+		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
+
 	xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1408b02eea53..315f874426bd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -142,6 +142,8 @@ struct xe_exec_queue {
 	 * Protected by @vm's resv. Unused if @vm == NULL.
 	 */
 	u64 tlb_flush_seqno;
+	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
+	struct list_head hw_engine_group_link;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 1d109c08c7a6..b362af7ffab5 100644
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
@@ -100,3 +103,66 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 
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
+	xe_assert(xe, group);
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
+	xe_assert(xe, q->vm);
+
+	if (xe_vm_in_preempt_fence_mode(q->vm))
+		return 0;
+
+	err = down_write_killable(&group->mode_sem);
+	if (err)
+		return err;
+
+	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
+		q->ops->suspend(q);
+		err = q->ops->suspend_wait(q);
+		if (err)
+			goto err_suspend;
+
+		queue_work(group->resume_wq, &group->resume_work);
+	}
+
+	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
+	up_write(&group->mode_sem);
+
+	return 0;
+
+err_suspend:
+	up_write(&group->mode_sem);
+	return err;
+}
+
+/**
+ * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
+ * @group: The hw engine group
+ * @q: The exec_queue
+ */
+void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+
+	xe_assert(xe, group);
+	xe_assert(xe, q->vm);
+
+	down_write(&group->mode_sem);
+
+	if (!list_empty(&q->hw_engine_group_link))
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

