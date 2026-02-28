Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75A41048933
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D7710EC61;
	Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nA65tQMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4883510EC5E
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242513; x=1803778513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LHfID5iOzEtL8T52UYSYFGePjX+wUzUCxqxrP9UqbkM=;
 b=nA65tQMTLC8mZMeqreMoZPo5nUUS34QEtDjgludUJufZfwEOz+I3Simd
 M8dYsaLZhEC7fV0R7YQPmu6f82oNR7iyU9HhKfWr4jjWGZ7PqjmZ/LuqV
 hHfkioZlv4//Nja5X5yq/ei8bMrK6boD09+9L9ihCTOz774nNQV66B1cs
 oVXOSyhmXjwSiKrPTtdiQptSklRoQGCMFQW2n071iS2Z3c3NbPc0EiniR
 qO6glY7kzJB1aKXg6JqJTaObPlM4WZqGLmuSKTmBo0vdrNNJ169Mn49aQ
 GtcBqON32Iz4QzNjsIzynVSBkrVguG8UiFjOJ+6+CgOcTJALO20yluS4R A==;
X-CSE-ConnectionGUID: W4vK18aiSc6358MqXmdaww==
X-CSE-MsgGUID: 2B8J9HXmTfikUd4r8xITbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966359"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
X-CSE-ConnectionGUID: yMFtcglVTB6t/MjkpnmZeA==
X-CSE-MsgGUID: vcw2NPKYRpCgRQudpWRMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854896"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 20/25] drm/xe: Add ULLS migration job support to migration
 layer
Date: Fri, 27 Feb 2026 17:34:56 -0800
Message-Id: <20260228013501.106680-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Add function to enter ULLS mode for migration job and delayed worker to
exit (power saving). ULLS mode expected to entered upon page fault or
SVM prefetch. ULLS mode exit delay is currently set to 5us.

ULLS mode only support on DGFX and USM platforms where a hardware engine
is reserved for migrations jobs. When in ULLS mode, set several flags on
migration jobs so submission backend / ring ops can properly submit in
ULLS mode.

Upon ULLS mode enter, send a job trigger waiting a semphore pipling
initial GuC / HW conetxt switch.

Upon ULLS mode exit, send a job to trigger that current ULLS
semaphore so the ring can be taken off the hardware.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.h      |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 180 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |   2 +
 drivers/gpu/drm/xe/xe_pt.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   6 +
 drivers/gpu/drm/xe/xe_vm.c              |   2 +-
 7 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ee2119cf45c1..4fa99f12c566 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1348,6 +1348,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 /**
  * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
  * @q: The exec_queue
+ * @extra_jobs: Extra jobs on the queue
  *
  * FIXME: Need to determine what to use as the short-lived
  * timeline lock for the exec_queues, so that the return value
@@ -1359,9 +1360,9 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
  *
  * Return: True if the exec_queue is idle, false otherwise.
  */
-bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
+bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs)
 {
-	return !atomic_read(&q->job_cnt);
+	return !(atomic_read(&q->job_cnt) - extra_jobs);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index b5aabab388c1..a11648b62a98 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -116,7 +116,7 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
-bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
+bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
 
@@ -176,7 +176,7 @@ struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
  */
 static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
 {
-	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
+	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q, 0);
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c9ee6325ec9d..62f27868f56b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_tt.h>
@@ -23,6 +24,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
@@ -30,6 +32,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -75,6 +78,14 @@ struct xe_migrate {
 	struct dma_fence *fence;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
 	u64 min_chunk_size;
+	/** @ulls: ULLS support */
+	struct {
+		/** @ulls.enabled: ULLS is enabled */
+		bool enabled;
+#define ULLS_EXIT_JIFFIES	(HZ / 50)
+		/** @ulls.exit_work: ULLS exit worker */
+		struct delayed_work exit_work;
+	} ulls;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
@@ -96,6 +107,16 @@ struct xe_migrate {
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	disable_delayed_work_sync(&m->ulls.exit_work);
+	mutex_lock(&m->job_mutex);
+	if (m->ulls.enabled) {
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
+		xe_pm_runtime_put(xe);
+		m->ulls.enabled = false;
+	}
+	mutex_unlock(&m->job_mutex);
 
 	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
@@ -410,6 +431,140 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 	return err;
 }
 
+/**
+ * xe_migrate_ulls_enter() - Enter ULLS mode
+ * @m: The migration context.
+ *
+ * If DGFX and not a VF, enter ULLS mode bypassing GuC / HW context
+ * switches by utilizing semaphore and continuously running batches.
+ */
+void xe_migrate_ulls_enter(struct xe_migrate *m)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+	struct xe_sched_job *job = NULL;
+	u64 batch_addr[2] = { 0, 0 };
+	bool alloc = false;
+
+	xe_assert(xe, xe->info.has_usm);
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+job_alloc:
+	if (alloc) {
+		/*
+		 * Must be done outside job_mutex as that lock is tainted with
+		 * reclaim.
+		 */
+		job = xe_sched_job_create(m->q, batch_addr);
+		if (WARN_ON_ONCE(IS_ERR(job)))
+			return;		/* Not fatal */
+	}
+
+	mutex_lock(&m->job_mutex);
+	if (!m->ulls.enabled) {
+		unsigned int fw_ref;
+
+		if (!job) {
+			alloc = true;
+			mutex_unlock(&m->job_mutex);
+			goto job_alloc;
+		}
+
+		/* Pairs with FW put on ULLS exit */
+		fw_ref = xe_force_wake_get(gt_to_fw(m->q->hwe->gt),
+					   m->q->hwe->domain);
+		if (fw_ref) {
+			struct xe_device *xe = tile_to_xe(m->tile);
+			struct dma_fence *fence;
+
+			/* Pairs with PM put on ULLS exit */
+			xe_pm_runtime_get_noresume(xe);
+
+			xe_sched_job_get(job);
+			xe_sched_job_arm(job);
+			job->is_ulls = true;
+			job->is_ulls_first = true;
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+
+			dma_fence_put(fence);
+
+			xe_dbg(xe, "Migrate ULLS mode enter");
+			m->ulls.enabled = true;
+		}
+	}
+	if (job)
+		xe_sched_job_put(job);
+	if (m->ulls.enabled)
+		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	mutex_unlock(&m->job_mutex);
+}
+
+static void xe_migrate_ulls_exit(struct work_struct *work)
+{
+	struct xe_migrate *m = container_of(work, struct xe_migrate,
+					    ulls.exit_work.work);
+	struct xe_device *xe = tile_to_xe(m->tile);
+	struct xe_sched_job *job = NULL;
+	struct dma_fence *fence;
+	u64 batch_addr[2] = { 0, 0 };
+	int idx;
+
+	xe_assert(xe, m->ulls.enabled);
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return;
+
+	/*
+	 * Must be done outside job_mutex as that lock is tainted with
+	 * reclaim and must be done holding a pm ref.
+	 */
+	job = xe_sched_job_create(m->q, batch_addr);
+	if (WARN_ON_ONCE(IS_ERR(job))) {
+		drm_dev_exit(idx);
+		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+		return;		/* Not fatal */
+	}
+
+	mutex_lock(&m->job_mutex);
+
+	if (!xe_exec_queue_is_idle(m->q, 1))
+		goto unlock_exit;
+
+	xe_sched_job_get(job);
+	xe_sched_job_arm(job);
+	job->is_ulls = true;
+	job->is_ulls_last = true;
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	/* Serialize force wake put */
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+	m->ulls.enabled = false;
+unlock_exit:
+	if (job)
+		xe_sched_job_put(job);
+	if (!m->ulls.enabled) {
+		/* Pairs with PM gets on enter */
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
+		xe_pm_runtime_put(xe);
+
+		cancel_delayed_work(&m->ulls.exit_work);
+		xe_dbg(xe, "Migrate ULLS mode exit");
+	} else {
+		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	}
+
+	drm_dev_exit(idx);
+	mutex_unlock(&m->job_mutex);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
@@ -473,6 +628,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
+	INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return err;
@@ -818,6 +975,26 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+static bool xe_migrate_is_ulls(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
+
+	return m->ulls.enabled;
+}
+
+static void xe_migrate_job_set_ulls_flags(struct xe_migrate *m,
+					  struct xe_sched_job *job)
+{
+	lockdep_assert_held(&m->job_mutex);
+	xe_tile_assert(m->tile, m->q == job->q);
+
+	if (xe_migrate_is_ulls(m)) {
+		job->is_ulls = true;
+		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	}
+}
+
 /**
  * xe_migrate_copy() - Copy content of TTM resources.
  * @m: The migration context.
@@ -992,6 +1169,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		xe_migrate_job_set_ulls_flags(m, job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1602,6 +1780,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		xe_migrate_job_set_ulls_flags(m, job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1881,6 +2060,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
+	xe_migrate_job_set_ulls_flags(m, job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index f6fa23c6c4fb..71606fb4fad0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -85,4 +85,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+void xe_migrate_ulls_enter(struct xe_migrate *m);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ef34fbfc14f0..2c0f9a99d7a9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1317,7 +1317,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
 		return -ETIME;
 
-	if (!job && !xe_exec_queue_is_idle(vops->q))
+	if (!job && !xe_exec_queue_is_idle(vops->q, 0))
 		return -ETIME;
 
 	if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 3a797de746ad..fe2d2ee12efc 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -89,6 +89,12 @@ struct xe_sched_job {
 	bool last_replay;
 	/** @is_pt_job: is a PT job */
 	bool is_pt_job;
+	/** @is_ulls: is ULLS job */
+	bool is_ulls;
+	/** @is_ulls_first: is first ULLS job */
+	bool is_ulls_first;
+	/** @is_ulls_last: is last ULLS job */
+	bool is_ulls_last;
 	union {
 		/** @ptrs: per instance pointers. */
 		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d4629e953b01..931d46696811 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -146,7 +146,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
-		if (!xe_exec_queue_is_idle(q))
+		if (!xe_exec_queue_is_idle(q, 0))
 			return false;
 	}
 
-- 
2.34.1

