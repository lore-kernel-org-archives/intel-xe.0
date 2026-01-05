Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1AFC2A079
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4758010E340;
	Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uuej2oCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21E10E1FF
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WdfmRb56ss+Me58OjHRkC549BcWWO08LWtLU/pe2z9s=;
 b=Uuej2oCLVzn6TctgnjkuLmKXAX0VKrvE3mKOtZKpiZ1KnlgTo3qukvvh
 0U7oU5nWICFTk+GZPqdvYN1RVjM0a8bNaSqjc32pT/UF5Tq/6O9E/pDGK
 b8By0En5laVOoQqoYk+S1SgdAhI9QNqlQFgXR1TVWZP/Xk8Qrfbx92Wef
 wvF6fvP1qg2Bogv5ko+sLpF8khv6hOD9HRltj/JzTuRZL1kneDROuVtmq
 zQj4OqnJSmDggdAPF9UMUGNSO/bIX69MEx3uZ6sHADt+SZStDgdNqzXep
 56sOsaeHl97ZxRYDDJ7qHE4zybo9iF5/aReNd62q3lUXkG5ZPgyupwodC A==;
X-CSE-ConnectionGUID: x5BShkHuTlCxDwdSmM+NDQ==
X-CSE-MsgGUID: HqgKIhwOSC6YLS96d70fZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856261"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: fbnTUMecRomPhcdhFnnx6w==
X-CSE-MsgGUID: dzjDGNQzSZKy6E6fQQAAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060662"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 07/22] drm/xe: Implement deadline manager
Date: Sun,  4 Jan 2026 20:02:22 -0800
Message-Id: <20260105040237.1307873-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Implement a deadline manager that toggles an exec queue’s deadline state
based on upcoming fence deadlines. The manager tracks deadlines on
hardware fences and uses an hrtimer to enter or exit a boosted state when
a deadline is within a configurable window (default 3 ms).

As the deadline approaches, the manager first applies a frequency boost
and, at a later stage, also boosts priority. The primary use case is to
help compositors avoid missing pageflip deadlines.

v2:
 - Remove extra newlines (CI)
 - Fix xe_deadline_mgr.h ifdef
 - More robust asserts
 - Disallow parallel, multi-q, boosted queues
 - Do not enter deadline on a signaled fence
 - Add freq / prio states
 - Fix potenial deadlock canceling timer

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_deadline_mgr.c       | 356 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.h       |  26 ++
 drivers/gpu/drm/xe/xe_deadline_mgr_types.h |  52 +++
 drivers/gpu/drm/xe/xe_hw_fence.c           |   3 +
 drivers/gpu/drm/xe/xe_hw_fence_types.h     |  13 +
 6 files changed, 451 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 2b20c79d7ec9..54f266ae48ba 100644
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
index 000000000000..061664ed24e3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/dma-fence-chain.h>
+
+#include "xe_deadline_mgr.h"
+#include "xe_deadline_mgr_types.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_hw_fence.h"
+
+#define XE_DEADLINE_WINDOW_US			3000
+#define XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT	60
+#define XE_DEADLINE_EXIT_DELAY_MS		100
+
+static ktime_t __xe_deadline_mgr_freq_boost_window(void)
+{
+	return us_to_ktime(XE_DEADLINE_WINDOW_US);
+}
+
+static ktime_t __xe_deadline_mgr_prio_boost_window(void)
+{
+	u64 usec = DIV_ROUND_UP_ULL(XE_DEADLINE_WINDOW_US *
+				    XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT, 100);
+
+	return us_to_ktime(usec);
+}
+
+static ktime_t __xe_deadline_mgr_prio_boost_restart(void)
+{
+	return ktime_sub(__xe_deadline_mgr_freq_boost_window(),
+			 __xe_deadline_mgr_prio_boost_window());
+}
+
+static bool __xe_deadline_mgr_deadline_signaled(struct xe_deadline_mgr *mgr)
+{
+	struct xe_hw_fence *hw_fence;
+
+	lockdep_assert_held(&mgr->lock);
+
+	hw_fence = list_first_entry_or_null(&mgr->deadlines, typeof(*hw_fence),
+					    deadline.link);
+	if (!hw_fence)
+		return true;
+
+	return xe_hw_fence_signaled(&hw_fence->dma);
+}
+
+static bool __xe_deadline_mgr_enter_deadline(struct xe_deadline_mgr *mgr,
+					     enum xe_deadline_mgr_state state)
+{
+	lockdep_assert_held(&mgr->lock);
+
+	if (XE_DEADLINE_EXIT_DELAY_MS &&
+	    mgr->state != XE_DEADLINE_MGR_STATE_NO_BOOST)
+		cancel_delayed_work(&mgr->exit_delay);
+
+	if (mgr->state != state && !__xe_deadline_mgr_deadline_signaled(mgr)) {
+		mgr->state = state;
+		mgr->q->ops->set_deadline_state(mgr->q, state);
+
+		return true;
+	}
+
+	return false;
+}
+
+static void __xe_deadline_mgr_exit_deadline_work(struct work_struct *work)
+{
+	struct xe_deadline_mgr *mgr = container_of(work, typeof(*mgr),
+						   exit_delay.work);
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	if (mgr->state != XE_DEADLINE_MGR_STATE_NO_BOOST) {
+		mgr->state = XE_DEADLINE_MGR_STATE_NO_BOOST;
+		mgr->q->ops->set_deadline_state(mgr->q, mgr->state);
+	}
+}
+
+static void __xe_deadline_mgr_exit_deadline(struct xe_deadline_mgr *mgr)
+{
+	lockdep_assert_held(&mgr->lock);
+
+	if (mgr->state == XE_DEADLINE_MGR_STATE_NO_BOOST)
+		return;
+
+	if (!XE_DEADLINE_EXIT_DELAY_MS) {
+		mgr->state = XE_DEADLINE_MGR_STATE_NO_BOOST;
+		mgr->q->ops->set_deadline_state(mgr->q, mgr->state);
+		return;
+	}
+
+	if (!delayed_work_pending(&mgr->exit_delay))
+		mod_delayed_work(system_percpu_wq, &mgr->exit_delay,
+				 msecs_to_jiffies(XE_DEADLINE_EXIT_DELAY_MS));
+}
+
+static enum hrtimer_restart __xe_deadline_mgr_timer(struct hrtimer *t)
+{
+	struct xe_deadline_mgr *mgr = container_of(t, typeof(*mgr), timer);
+	enum xe_deadline_mgr_state state;
+	bool boosted;
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	xe_assert(gt_to_xe(mgr->q->gt),
+		  mgr->state != XE_DEADLINE_MGR_STATE_PRIO_BOOST ||
+		  XE_DEADLINE_EXIT_DELAY_MS);
+
+	if (mgr->state == XE_DEADLINE_MGR_STATE_NO_BOOST &&
+	    XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT != 100)
+		state = XE_DEADLINE_MGR_STATE_FREQ_BOOST;
+	else
+		state = XE_DEADLINE_MGR_STATE_PRIO_BOOST;
+
+	boosted = __xe_deadline_mgr_enter_deadline(mgr, state);
+
+	if (boosted && state == XE_DEADLINE_MGR_STATE_FREQ_BOOST &&
+	    XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT != 0) {
+		ktime_t sub = __xe_deadline_mgr_freq_boost_window();
+
+		hrtimer_forward(t, ktime_sub(mgr->deadline, sub),
+				__xe_deadline_mgr_prio_boost_restart());
+		return HRTIMER_RESTART;
+	}
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
+	hrtimer_setup(&mgr->timer, __xe_deadline_mgr_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS);
+	mgr->deadline = XE_DEADLINE_NONE;
+	mgr->state = XE_DEADLINE_MGR_STATE_NO_BOOST;
+	INIT_DELAYED_WORK(&mgr->exit_delay,
+			  __xe_deadline_mgr_exit_deadline_work);
+
+	/*
+	 * Parallel queues are not supported because the job's fence is a
+	 * dma-fence chain, which is memory-unsafe as individual hardware fences
+	 * can be freed at arbitrary points in time while remaining in the
+	 * manager. Multi-queue is also not supported because we need individual
+	 * per-queue control of priority and frequency, which multi-queue does
+	 * not have. In either case, the target use case (compositors) does not
+	 * use these types of queues.
+	 *
+	 * Also disable the deadline logic if the feature is disabled via
+	 * Kconfig or if the queue is created in a boosted state.
+	 */
+	if (xe_exec_queue_is_parallel(q) || xe_exec_queue_is_multi_queue(q) ||
+	    !XE_DEADLINE_WINDOW_US ||
+	    (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_HIGH &&
+	     q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY))
+		mgr->state = XE_DEADLINE_MGR_STATE_UNSUPPORTED;
+}
+
+/**
+ * xe_deadline_mgr_fini() - Deadline manager finalize
+ * @mgr: Deadline manager object
+ */
+void xe_deadline_mgr_fini(struct xe_deadline_mgr *mgr)
+{
+	cancel_delayed_work_sync(&mgr->exit_delay);
+	xe_assert(gt_to_xe(mgr->q->gt),
+		  mgr->state == XE_DEADLINE_MGR_STATE_NO_BOOST ||
+		  mgr->state == XE_DEADLINE_MGR_STATE_UNSUPPORTED);
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
+	hw_fence = list_first_entry_or_null(&mgr->deadlines, typeof(*hw_fence),
+					    deadline.link);
+	if (!hw_fence)
+		return XE_DEADLINE_NONE;
+
+	return hw_fence->deadline.time;
+}
+
+static void __xe_deadline_mgr_update_deadline(struct xe_deadline_mgr *mgr)
+{
+	ktime_t old_deadline = mgr->deadline, sub, deadline, now;
+
+again:
+	lockdep_assert_held(&mgr->lock);
+
+	mgr->deadline = __xe_deadline_mgr_new_deadline(mgr);
+
+	if (!ktime_compare(old_deadline, mgr->deadline))
+		return;
+
+	if (hrtimer_try_to_cancel(&mgr->timer) < 0) {
+		/*
+		 * Corner case where hrtimer is running but waiting on
+		 * &mgr->lock, we need to drop the lock, cancel timer, require
+		 * the lock and retry.
+		 */
+		spin_unlock(&mgr->lock);
+		hrtimer_cancel(&mgr->timer);
+		spin_lock(&mgr->lock);
+		goto again;
+	}
+
+	if (mgr->deadline == XE_DEADLINE_NONE) {
+		__xe_deadline_mgr_exit_deadline(mgr);
+		return;
+	}
+
+	sub = __xe_deadline_mgr_freq_boost_window();
+	deadline = ktime_sub(mgr->deadline, sub);
+	now = ktime_get();
+
+	if (ktime_after(now, deadline)) {
+		enum xe_deadline_mgr_state state =
+			XE_DEADLINE_MGR_STATE_FREQ_BOOST;
+
+		if (mgr->state == XE_DEADLINE_MGR_STATE_PRIO_BOOST) {
+			state = XE_DEADLINE_MGR_STATE_PRIO_BOOST;
+		} else {
+			sub = __xe_deadline_mgr_prio_boost_window();
+			if (sub) {
+				deadline = ktime_sub(mgr->deadline, sub);
+
+				if (ktime_after(now, deadline))
+					state = XE_DEADLINE_MGR_STATE_PRIO_BOOST;
+				else
+					hrtimer_start(&mgr->timer, deadline,
+						      HRTIMER_MODE_ABS);
+			}
+		}
+
+		__xe_deadline_mgr_enter_deadline(mgr, state);
+	} else {
+		__xe_deadline_mgr_exit_deadline(mgr);
+		hrtimer_start(&mgr->timer, deadline,
+			      HRTIMER_MODE_ABS);
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
+		if (ktime_before(hw_fence->deadline.time, pos->deadline.time)) {
+			/*
+			 * A bit confusing, but the below code actually inserts
+			 * 'hw_fence' before 'pos' as list_add_tail effectively
+			 * means insert before head.
+			 */
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
+	if (mgr->state == XE_DEADLINE_MGR_STATE_UNSUPPORTED)
+		return;
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	if (hw_fence->deadline.time == XE_DEADLINE_DONE ||
+	    deadline == XE_DEADLINE_DONE)
+		return;
+
+	xe_assert(gt_to_xe(mgr->q->gt),
+		  hw_fence->deadline.time == XE_DEADLINE_NONE ||
+		  deadline <= hw_fence->deadline.time);
+
+	__xe_deadline_mgr_remove_deadline(mgr, hw_fence);
+	__xe_deadline_mgr_add_deadline(mgr, hw_fence, deadline);
+	__xe_deadline_mgr_update_deadline(mgr);
+}
+
+/**
+ * xe_deadline_mgr_remove_deadline() - Remove deadline
+ * @mgr: Deadline manager object
+ * @fence: Fence with deadline (must be struct xe_hw_fence)
+ *
+ * Remove the deadline for a fence. This should be called exactly once after the
+ * fence is signaled. After this function is called, future
+ * xe_deadline_mgr_add_deadline calls are NOPs.
+ */
+void xe_deadline_mgr_remove_deadline(struct xe_deadline_mgr *mgr,
+				     struct dma_fence *fence)
+{
+	if (mgr->state == XE_DEADLINE_MGR_STATE_UNSUPPORTED)
+		return;
+
+	guard(spinlock_irqsave)(&mgr->lock);
+
+	xe_assert(gt_to_xe(mgr->q->gt), !dma_fence_is_container(fence));
+	xe_assert(gt_to_xe(mgr->q->gt), dma_fence_is_signaled(fence));
+	xe_assert(gt_to_xe(mgr->q->gt),
+		  to_xe_hw_fence(fence)->deadline.time != XE_DEADLINE_DONE);
+
+	__xe_deadline_mgr_remove_deadline(mgr, to_xe_hw_fence(fence));
+}
diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.h b/drivers/gpu/drm/xe/xe_deadline_mgr.h
new file mode 100644
index 000000000000..56f632fce792
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEADLINE_MGR_H_
+#define _XE_DEADLINE_MGR_H_
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
index 000000000000..5a53a79fcfc4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr_types.h
@@ -0,0 +1,52 @@
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
+#include <linux/workqueue.h>
+
+struct xe_exec_queue;
+
+#define XE_DEADLINE_NONE	(-1)
+#define XE_DEADLINE_DONE	(-2)
+
+/** enum xe_deadline_mgr_state - Deadline manager state */
+enum xe_deadline_mgr_state {
+	/** @XE_DEADLINE_MGR_STATE_UNSUPPORTED: Unsupported (disabled) */
+	XE_DEADLINE_MGR_STATE_UNSUPPORTED,
+	/** @XE_DEADLINE_MGR_STATE_NO_BOOST: No boosted state */
+	XE_DEADLINE_MGR_STATE_NO_BOOST,
+	/** @XE_DEADLINE_MGR_STATE_FREQ_BOOST: Frequency boosted state */
+	XE_DEADLINE_MGR_STATE_FREQ_BOOST,
+	/** @XE_DEADLINE_MGR_STATE_PRIO_BOOST: Priority boosted state */
+	XE_DEADLINE_MGR_STATE_PRIO_BOOST,
+};
+
+/** struct xe_deadline_mgr - Xe deadline manager */
+struct xe_deadline_mgr {
+	/** @q: Pointer to queue associated with deadline */
+	struct xe_exec_queue *q;
+	/** @deadlines: List storing deadline fences, protected by @lock */
+	struct list_head deadlines;
+	/** @timer: Timer to enter deadline mode, protected by @lock */
+	struct hrtimer timer;
+	/**
+	 * @exit_delay: Delayed worker to exit deadline mode, protected by
+	 * @lock
+	 */
+	struct delayed_work exit_delay;
+	/** @lock: Lock to protect deadlines */
+	spinlock_t lock;
+	/** @deadline: Current deadline, protected by @lock */
+	ktime_t deadline;
+	/** @state: Deadline state, protected by @lock */
+	enum xe_deadline_mgr_state state;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 265e29e92c48..37ba1d9612ba 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 
 #include "xe_bo.h"
+#include "xe_deadline_mgr_types.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
@@ -267,6 +268,8 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 
 	hw_fence->xe = gt_to_xe(ctx->gt);
 	hw_fence->q = q;
+	hw_fence->deadline.time = XE_DEADLINE_NONE;
+	INIT_LIST_HEAD(&hw_fence->deadline.link);
 	snprintf(hw_fence->name, sizeof(hw_fence->name), "%s", ctx->name);
 	hw_fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&hw_fence->irq_link);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index 052bbab1fad6..687b2f55cd02 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -76,6 +76,19 @@ struct xe_hw_fence {
 	struct iosys_map seqno_map;
 	/** @irq_link: Link in struct xe_hw_fence_irq.pending */
 	struct list_head irq_link;
+	/** @deadline: Deadline info */
+	struct {
+		/**
+		 * @deadline.time: Deadline time, protected by deadline manager
+		 * lock
+		 */
+		ktime_t time;
+		/**
+		 * @deadline.link: Deadline link, protected by deadline manager
+		 * lock
+		 */
+		struct list_head link;
+	} deadline;
 };
 
 #endif
-- 
2.34.1

