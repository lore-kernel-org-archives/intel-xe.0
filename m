Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A17CD6E7D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCFB11A171;
	Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jsq5nS4D";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311A011A166
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589227;
 bh=DPjElxL8dwbFi/Cx7vkP7mieR5xWoKdVawJLck37ph0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jsq5nS4DSHSgOot5D16sEDGwwEr80xstRtjw48cf16TC2vUsTvFZHEekflp48KBkp
 pVclq/RRDpOn4yPmBPxe0ZP70fRdZ7AT02C//Ns6JVkKj8OcoKcw/sBeh4LfpYiORt
 ep8Cw/9cmsNzyBV1rVjQuy5WDh6nEoez6J7BU3iM/thUT34o8t1v2/ZIhwt0Vau/pA
 5WMfNq4KceP2D5uBAXliXcIHlsIx3jP9PLepOCw6QNTorKUSRoGoLGhSevjpuKkT11
 I2FC9RWCLzxL0T3oXbl6N6aXWpTunJEvAoY5ufbo1oYY5Iq8djusuG33pzbovrk6wJ
 DuTzSSaQQrzVg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 20/24] drm/xe: Add ULLS migration job support to migration layer
Date: Thu,  4 Jun 2026 18:06:49 +0200
Message-ID: <20260604160655.50036-21-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

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
 drivers/gpu/drm/xe/xe_exec_queue.h      |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 180 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |   2 +
 drivers/gpu/drm/xe/xe_pt.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   6 +
 drivers/gpu/drm/xe/xe_vm.c              |   2 +-
 7 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8b96f0868fb67..bd5fc33b268da 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1470,6 +1470,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 /**
  * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
  * @q: The exec_queue
+ * @extra_jobs: Extra jobs on the queue
  *
  * FIXME: Need to determine what to use as the short-lived
  * timeline lock for the exec_queues, so that the return value
@@ -1481,9 +1482,9 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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
index b5aabab388c1b..a11648b62a980 100644
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
index 7cccb46699bc2..d572958ef0cf4 100644
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
@@ -431,6 +452,140 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
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
@@ -494,6 +649,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
+	INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return err;
@@ -859,6 +1016,26 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
@@ -1021,6 +1198,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
+		xe_migrate_job_set_ulls_flags(m, job);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -1682,6 +1860,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
+		xe_migrate_job_set_ulls_flags(m, job);
 		xe_sched_job_arm(job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
@@ -1961,6 +2140,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	}
 
 	mutex_lock(&m->job_mutex);
+	xe_migrate_job_set_ulls_flags(m, job);
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4ffd588d243ef..12e1565a3f52d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -89,4 +89,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+void xe_migrate_ulls_enter(struct xe_migrate *m);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8d91ee473c42c..f8fce99228eeb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1344,7 +1344,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
 		return -ETIME;
 
-	if (!job && !xe_exec_queue_is_idle(vops->q))
+	if (!job && !xe_exec_queue_is_idle(vops->q, 0))
 		return -ETIME;
 
 	if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 9f527ac6df3e6..db41f5388dd0d 100644
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
index d1d10946a17c2..6e9400f32b907 100644
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
2.53.0

