Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA2E784A9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BAB113F6F;
	Thu, 25 Dec 2025 01:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or1iDr1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14613113F6E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9VrQEUKz9HIDPAHyATJ3HzqSOhv/pEEXP9Y97nOCW0=;
 b=Or1iDr1Ng73xNLza/6dILmTocUowg3HPov0y48d2KthXiqJktspEAnDf
 Pnkt7LewPv2NE+QMimTWIAofyJUy/r0r+yI3UBH1dyCcbTCKANIn9KvQV
 Eti2C45daI1WMP+z/lNbtZq2z/I62V6KOoXBxojMRoS6QgApnXhRkw0Gt
 4WNRAXAOsjPfX6Mo8mOeoqMRnCyKIyMk37hep3BE6TBwIa5VZukGnsbp7
 i4fMCYO4ps6BmkwlTIBpzqGWHdEN3Lr4ZLVq+XN1i7LpvX6Q34+Jg90/Q
 XOIbQp32mt9LsWN9P9vOOUxTUfIFSHM+UFP6+6dtRDW9Y76BL5YaByJgn g==;
X-CSE-ConnectionGUID: LYV3G4dKT/q9BduAxybKWw==
X-CSE-MsgGUID: dMZHpwOzRDWsvQJQBp8hEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866360"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: 2oUrnGEVQkKe5aHIjEKOzg==
X-CSE-MsgGUID: 83r1SIP1QbSo19kO5DDS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629134"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 06/13] drm/xe: Add deadline manager
Date: Wed, 24 Dec 2025 17:17:27 -0800
Message-Id: <20251225011734.341683-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Add a deadline manager that toggles the exec queue’s deadline state. It
is implemented using a list of deadlines (hardware fences) and an
hrtimer, which dynamically enters or exits the queue’s deadline state if
a deadline is within 3 ms of being missed. The intended usage is for
compositors to avoid missing page flips.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_deadline_mgr.c       | 213 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.h       |  26 +++
 drivers/gpu/drm/xe/xe_deadline_mgr_types.h |  34 ++++
 drivers/gpu/drm/xe/xe_hw_fence.c           |   3 +
 drivers/gpu/drm/xe/xe_hw_fence_types.h     |   7 +
 6 files changed, 284 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d571cdbd6fa..4fbdf7f83f3a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -35,6 +35,7 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_deadline_mgr.o \
 	xe_dep_scheduler.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
new file mode 100644
index 000000000000..5159ce35fdde
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/dma-fence-chain.h>
+
+#include "xe_deadline_mgr.h"
+#include "xe_deadline_mgr_types.h"
+#include "xe_exec_queue_types.h"
+#include "xe_gt.h"
+#include "xe_hw_fence.h"
+
+static void __xe_deadline_mgr_enter_deadline(struct xe_deadline_mgr *mgr)
+{
+	lockdep_assert_held(&mgr->lock);
+
+	if (!mgr->deadline_entered) {
+		mgr->deadline_entered = true;
+		mgr->q->ops->enter_deadline(mgr->q);
+	}
+}
+
+static void __xe_deadline_mgr_exit_deadline(struct xe_deadline_mgr *mgr)
+{
+	lockdep_assert_held(&mgr->lock);
+
+	if (mgr->deadline_entered) {
+		mgr->deadline_entered = false;
+		mgr->q->ops->exit_deadline(mgr->q);
+	}
+}
+
+static enum hrtimer_restart deadline_timer(struct hrtimer *t)
+{
+	struct xe_deadline_mgr *mgr = container_of(t, typeof(*mgr), timer);
+
+	guard(spinlock_irqsave)(&mgr->lock);
+	__xe_deadline_mgr_enter_deadline(mgr);
+
+	return HRTIMER_NORESTART;
+}
+
+/**
+ * xe_deadline_mgr_init() - Deadline manager initialize
+ * @mgr: Deadline manager object
+ * @q: Exec queue associated with deadline
+ */
+void xe_deadline_mgr_init(struct xe_deadline_mgr *mgr, struct xe_exec_queue *q)
+{
+	mgr->q = q;
+	INIT_LIST_HEAD(&mgr->deadlines);
+	spin_lock_init(&mgr->lock);
+	hrtimer_setup(&mgr->timer, deadline_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS);
+	mgr->deadline = XE_DEADLINE_NONE;
+	mgr->deadline_entered = false;
+}
+
+/**
+ * xe_deadline_mgr_fini() - Deadline manager finalize
+ * @mgr: Deadline manager object
+ */
+void xe_deadline_mgr_fini(struct xe_deadline_mgr *mgr)
+{
+	xe_assert(gt_to_xe(mgr->q->gt), !mgr->deadline_entered);
+	xe_assert(gt_to_xe(mgr->q->gt), !hrtimer_cancel(&mgr->timer));
+	xe_assert(gt_to_xe(mgr->q->gt), list_empty(&mgr->deadlines));
+}
+
+static ktime_t __xe_deadline_mgr_new_deadline(struct xe_deadline_mgr *mgr)
+{
+	struct xe_hw_fence *hw_fence;
+
+	lockdep_assert_held(&mgr->lock);
+
+	hw_fence = list_first_entry_or_null(&mgr->deadlines,
+					    typeof(*hw_fence),
+					    deadline.link);
+	if (!hw_fence)
+		return XE_DEADLINE_NONE;
+	else
+		return hw_fence->deadline.time;
+
+}
+
+static void __xe_deadline_mgr_update_deadline(struct xe_deadline_mgr *mgr)
+{
+	ktime_t old_deadline = mgr->deadline;
+
+	lockdep_assert_held(&mgr->lock);
+
+	mgr->deadline = __xe_deadline_mgr_new_deadline(mgr);
+
+	if (old_deadline != mgr->deadline) {
+		hrtimer_cancel(&mgr->timer);
+
+		if (mgr->deadline != XE_DEADLINE_NONE) {
+			ktime_t deadline = ktime_sub(mgr->deadline,
+						     ms_to_ktime(3));
+			ktime_t now = ktime_get();
+
+			if (ktime_after(now, deadline)) {
+				__xe_deadline_mgr_enter_deadline(mgr);
+			} else {
+				__xe_deadline_mgr_exit_deadline(mgr);
+				hrtimer_start(&mgr->timer, deadline,
+					      HRTIMER_MODE_ABS);
+			}
+		} else {
+			__xe_deadline_mgr_exit_deadline(mgr);
+		}
+	}
+}
+
+static void __xe_deadline_mgr_remove_deadline(struct xe_deadline_mgr *mgr,
+					      struct xe_hw_fence *hw_fence)
+{
+	ktime_t old_deadline = hw_fence->deadline.time;
+
+	lockdep_assert_held(&mgr->lock);
+
+	hw_fence->deadline.time = XE_DEADLINE_DONE;
+	if (old_deadline == XE_DEADLINE_NONE)
+		return;
+
+	list_del_init(&hw_fence->deadline.link);
+	__xe_deadline_mgr_update_deadline(mgr);
+}
+
+
+static void __xe_deadline_mgr_add_deadline(struct xe_deadline_mgr *mgr,
+					   struct xe_hw_fence *hw_fence,
+					   ktime_t deadline)
+{
+	struct xe_hw_fence *pos;
+
+	lockdep_assert_held(&mgr->lock);
+
+	hw_fence->deadline.time = deadline;
+
+	list_for_each_entry(pos, &mgr->deadlines, deadline.link) {
+		if (pos->deadline.time >= hw_fence->deadline.time) {
+			list_add_tail(&hw_fence->deadline.link,
+				      &pos->deadline.link);
+			return;
+		}
+	}
+
+	list_add_tail(&hw_fence->deadline.link, &mgr->deadlines);
+}
+
+/**
+ * xe_deadline_mgr_add_deadline() - Add deadline
+ * @mgr: Deadline manager object
+ * @fence: Fence with deadline (must be struct xe_hw_fence)
+ * @deadline: Deadline for the fence
+ *
+ * Add a deadline for a fence. This may be called multiple times on a given
+ * fence. It assumes upper layers only call this function multiple times if the
+ * deadline is being reduced. If called after xe_deadline_mgr_remove_deadline,
+ * this function is a NOP.
+ */
+void xe_deadline_mgr_add_deadline(struct xe_deadline_mgr *mgr,
+				  struct dma_fence *fence,
+				  ktime_t deadline)
+{
+	struct xe_hw_fence *hw_fence = to_xe_hw_fence(fence);
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	if (hw_fence->deadline.time == XE_DEADLINE_DONE)
+		return;
+
+	xe_assert(gt_to_xe(mgr->q->gt),
+		  hw_fence->deadline.time == XE_DEADLINE_NONE ||
+		  deadline < hw_fence->deadline.time);
+
+	__xe_deadline_mgr_remove_deadline(mgr, hw_fence);
+	__xe_deadline_mgr_add_deadline(mgr, hw_fence, deadline);
+	__xe_deadline_mgr_update_deadline(mgr);
+}
+
+/**
+ * xe_deadline_mgr_remove_deadline() - Remove deadline
+ * @mgr: Deadline manager object
+ * @fence: Fence with deadline (must be struct xe_hw_fence or chain of struct
+ * xe_hw_fence)
+ *
+ * Remove the deadline for a fence. This should be called exactly once after the
+ * fence is signaled. After this function is called, future
+ * xe_deadline_mgr_add_deadline calls are NOPs.
+ */
+void xe_deadline_mgr_remove_deadline(struct xe_deadline_mgr *mgr,
+				     struct dma_fence *fence)
+{
+	struct dma_fence *iter, *__fence;
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	xe_assert(gt_to_xe(mgr->q->gt), dma_fence_is_signaled(fence));
+
+	if (!dma_fence_is_chain(fence)) {
+		__xe_deadline_mgr_remove_deadline(mgr, to_xe_hw_fence(fence));
+		return;
+	}
+
+	dma_fence_chain_for_each(iter, fence) {
+		__fence = dma_fence_chain_contained(iter);
+
+		__xe_deadline_mgr_remove_deadline(mgr, to_xe_hw_fence(__fence));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.h b/drivers/gpu/drm/xe/xe_deadline_mgr.h
new file mode 100644
index 000000000000..80cce5930c4f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_EXEC_QUEUE_DEADLINE_MGR_H_
+#define _XE_EXEC_QUEUE_DEADLINE_MGR_H_
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct xe_deadline_mgr;
+struct xe_exec_queue;
+
+void xe_deadline_mgr_init(struct xe_deadline_mgr *mgr, struct xe_exec_queue *q);
+
+void xe_deadline_mgr_fini(struct xe_deadline_mgr *mgr);
+
+void xe_deadline_mgr_add_deadline(struct xe_deadline_mgr *mgr,
+				  struct dma_fence *fence,
+				  ktime_t deadline);
+
+void xe_deadline_mgr_remove_deadline(struct xe_deadline_mgr *mgr,
+				     struct dma_fence *fence);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr_types.h b/drivers/gpu/drm/xe/xe_deadline_mgr_types.h
new file mode 100644
index 000000000000..e743367647c5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr_types.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEADLINE_MGR_TYPES_H_
+#define _XE_DEADLINE_MGR_TYPES_H_
+
+#include <linux/hrtimer_types.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct xe_exec_queue;
+
+#define XE_DEADLINE_NONE	(-1)
+#define XE_DEADLINE_DONE	(-2)
+
+/** struct xe_deadline_mgr - Xe deadline manager */
+struct xe_deadline_mgr {
+	/** @q: Pointer to queue associated with deadline */
+	struct xe_exec_queue *q;
+	/** @deadlines: List storing deadline fences, protected by @lock */
+	struct list_head deadlines;
+	/** @timer: Timer to enter deadline mode, protected by @lock */
+	struct hrtimer timer;
+	/** @lock: Lock to protect deadlines */
+	spinlock_t lock;
+	/** @deadline: Current deadline, protected by @lock */
+	ktime_t deadline;
+	/** @deadline_entered: In deadline mode, protected by @lock */
+	bool deadline_entered;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index ec06b1eaf004..8b884691718f 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 
 #include "xe_bo.h"
+#include "xe_deadline_mgr_types.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
@@ -260,6 +261,8 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 
 	hw_fence->xe = gt_to_xe(ctx->gt);
 	hw_fence->q = q;
+	hw_fence->deadline.time = XE_DEADLINE_NONE;
+	INIT_LIST_HEAD(&hw_fence->deadline.link);
 	snprintf(hw_fence->name, sizeof(hw_fence->name), "%s", ctx->name);
 	hw_fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&hw_fence->irq_link);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index 052bbab1fad6..8d035c52195c 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -76,6 +76,13 @@ struct xe_hw_fence {
 	struct iosys_map seqno_map;
 	/** @irq_link: Link in struct xe_hw_fence_irq.pending */
 	struct list_head irq_link;
+	/** @deadline: Deadline info, protected by deadline manager lock */
+	struct {
+		/** @deadline.time: Deadline time */
+		ktime_t time;
+		/** @deadline.list: Deadline link */
+		struct list_head link;
+	} deadline;
 };
 
 #endif
-- 
2.34.1

