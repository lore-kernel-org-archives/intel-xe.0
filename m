Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D3C79F84
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28E910F803;
	Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCJ0VdJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9410F70E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zMYGl1BGTvuteaGXs/x9ripEH/try7eFTocqENV0UOc=;
 b=MCJ0VdJ2yyAVFmdd1bTHXVNZTHTHZ7h8IT3/lM5YUor/n7YAI27M3lMx
 9wtLfyrw9sXj+QonJ0cKlTVOCsOJQjQ7uN3OnxmY3++KSX5i1rJJAZy8W
 K5u5/xYUJkVyhpMeYiN6lv/vtmgNkJ/N2Cmg2qFEzDtBkxAf+Z1rzGY3w
 71LJ72qI+ky3PPwh0NxTqiiZMf1j9bFulmCfI3FztUGiU3PT67ArW/3vT
 aj+Lyx1a3yCGcqPbA2sca9vhQEO1Nxgii2BXSYiFjtciWcnedaKTyCdhG
 nLLF1Ke2kKdu9zCBVG/OMlEBc8aO/qdYK6i4TYfi5QsB9/W1E8PYHAVUT A==;
X-CSE-ConnectionGUID: qEEmfBkoS9W1S9GbFMpVGw==
X-CSE-MsgGUID: IxmjTQafRtqmmkmb3yHqsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637820"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: WAz8pYOPQQOdzEw2WEXwlQ==
X-CSE-MsgGUID: SKA7ZyBUQ6KO0M95CYJszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029062"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 20/25] drm/xe: Add ULLS migration job support to migration
 layer
Date: Thu,  3 Sep 2026 16:58:37 -0700
Message-Id: <20260903235842.3401722-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.h      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 180 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |   2 +
 drivers/gpu/drm/xe/xe_pt.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   6 +
 drivers/gpu/drm/xe/xe_vm.c              |   2 +-
 7 files changed, 194 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e89802ff4f0e..98b9b1b88e95 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1482,6 +1482,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 /**
  * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
  * @q: The exec_queue
+ * @extra_jobs: Extra jobs on the queue
  *
  * FIXME: Need to determine what to use as the short-lived
  * timeline lock for the exec_queues, so that the return value
@@ -1493,9 +1494,9 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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
index b02a390ba989..e8963f85cabd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -116,7 +116,7 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
-bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
+bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 471ae5741836..1fa236eb1a26 100644
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
@@ -32,6 +34,7 @@
 #include "xe_mem_pool.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -77,6 +80,14 @@ struct xe_migrate {
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
@@ -98,6 +109,16 @@ struct xe_migrate {
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
@@ -448,6 +469,140 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
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
+	mutex_unlock(&m->job_mutex);
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
@@ -506,6 +661,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
+	INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return err;
@@ -871,6 +1028,26 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
 static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct xe_bo *src_bo,
 					   struct xe_bo *dst_bo,
@@ -1033,6 +1210,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
+		xe_migrate_job_set_ulls_flags(m, job);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -1701,6 +1879,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
+		xe_migrate_job_set_ulls_flags(m, job);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -1980,6 +2159,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	}
 
 	mutex_lock(&m->job_mutex);
+	xe_migrate_job_set_ulls_flags(m, job);
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 67e5ba1f8284..71f11b2f66cd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -98,4 +98,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 bool write_to_ccs);
 #endif
 
+void xe_migrate_ulls_enter(struct xe_migrate *m);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index deb33e85e6eb..a1081349a6d5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1428,7 +1428,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
 		return -ETIME;
 
-	if (!job && !xe_exec_queue_is_idle(vops->q))
+	if (!job && !xe_exec_queue_is_idle(vops->q, 0))
 		return -ETIME;
 
 	if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 9f527ac6df3e..db41f5388dd0 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -91,6 +91,12 @@ struct xe_sched_job {
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
index a6dc010e5e0d..0e6ec05de551 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -148,7 +148,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
-		if (!xe_exec_queue_is_idle(q))
+		if (!xe_exec_queue_is_idle(q, 0))
 			return false;
 	}
 
-- 
2.34.1

