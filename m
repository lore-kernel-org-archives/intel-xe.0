Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E784C98327
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AA10F867;
	Fri, 25 Sep 2026 04:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dmogl77A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495910F855
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312013; x=1821848013;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FeNdyOzkZJ9oShe8R1N2kHFxY6RLv3xreNZ5RJRSijE=;
 b=Dmogl77ArsCsxB3NZrWtpO+Rp7qjrTUbN2ziW6zqgg9rEIL4NZi6Wbl4
 PoC7BzDlNT5wbHtsZ4GGWeM02y0tejmly16BJw6Ut2RVTvPejoZY3Uh8r
 9X/RA/KPp3xoFdXeJO00Mbs5WQxKwMtxwXhdCqwqHQggwZTHUp5+vA7Df
 8djIBQeylBItDPQPHow5VolOEF1lchEmzzB1J3k9I4cqdPWuGNa5htrkp
 n6+KP9hK8uS3r++YH136SpaOwzIFgDD1CYpFf9VHPs2CZoJxvVlp2Xy6c
 vo+tYvb0oE69woKXbz/mBmjqoAhCzAvyKiyWG2DzdzZ2VyHUZoXZijdPH Q==;
X-CSE-ConnectionGUID: wLE+4ra2QjCi0zF0MAFOSw==
X-CSE-MsgGUID: vPR7V52uQzireDdT1bK3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156233"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:28 -0700
X-CSE-ConnectionGUID: +jht/GRiRkqrxrDNI+Ez4w==
X-CSE-MsgGUID: XjrLWPhfTpKoUcZfS3+pEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155543"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 19/24] drm/xe: Add ULLS migration job support to migration
 layer
Date: Thu, 24 Sep 2026 21:53:15 -0700
Message-Id: <20260925045320.1325860-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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
SVM prefetch. ULLS mode exit delay is currently set to 5ms.

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
v7:
 - Style cleanups
 - xe_migrate_ulls_exit don't wiat for dma-fence (Sashiko)
---
 drivers/gpu/drm/xe/xe_exec_queue.c      |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.h      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 198 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h         |   2 +
 drivers/gpu/drm/xe/xe_pt.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.h       |  56 +++++++
 drivers/gpu/drm/xe/xe_sched_job_types.h |  19 +++
 drivers/gpu/drm/xe/xe_vm.c              |   2 +-
 8 files changed, 265 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f18229f65ad2..9a8efa2bf2bf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1546,6 +1546,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 /**
  * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
  * @q: The exec_queue
+ * @extra_jobs: Extra jobs on the queue
  *
  * FIXME: Need to determine what to use as the short-lived
  * timeline lock for the exec_queues, so that the return value
@@ -1557,9 +1558,9 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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
index 471ae5741836..d7d13a25cdb9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_tt.h>
@@ -32,6 +33,7 @@
 #include "xe_mem_pool.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -77,6 +79,14 @@ struct xe_migrate {
 	struct dma_fence *fence;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
 	u64 min_chunk_size;
+	/** @ulls: ULLS support */
+	struct {
+		/** @ulls.enabled: ULLS is enabled, protected by job_mutex */
+		bool enabled;
+#define ULLS_EXIT_JIFFIES	msecs_to_jiffies(5)
+		/** @ulls.exit_work: ULLS exit worker */
+		struct delayed_work exit_work;
+	} ulls;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
@@ -95,9 +105,30 @@ struct xe_migrate {
  */
 #define MAX_PTE_PER_SDI 0x1FEU
 
+static bool xe_migrate_ulls_enabled(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
+	return m->ulls.enabled;
+}
+
+static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
+{
+	lockdep_assert_held(&m->job_mutex);
+	m->ulls.enabled = enabled;
+}
+
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	disable_delayed_work_sync(&m->ulls.exit_work);
+	scoped_guard(mutex, &m->job_mutex) {
+		if (xe_migrate_ulls_enabled(m)) {
+			xe_pm_runtime_put(xe);
+			xe_migrate_ulls_toggle_enable(m, false);
+		}
+	}
 
 	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
@@ -448,6 +479,150 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 	return err;
 }
 
+static struct dma_fence *__xe_migrate_job_push(struct xe_migrate *m,
+					       struct xe_sched_job *job,
+					       enum xe_ulls_state ulls)
+{
+	struct dma_fence *fence;
+
+	lockdep_assert_held(&m->job_mutex);
+	xe_tile_assert(m->tile, m->q == job->q);
+
+	job->ulls = ulls;
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	return fence;
+}
+
+/*
+ * Arm and push a migration job, tagging it as a ULLS job and deferring the
+ * ULLS exit while ULLS mode is active.
+ *
+ * Returns a reference to the job's finished fence.
+ */
+static struct dma_fence *xe_migrate_job_push(struct xe_migrate *m,
+					     struct xe_sched_job *job)
+{
+	enum xe_ulls_state ulls = ULLS_NONE;
+
+	lockdep_assert_held(&m->job_mutex);
+
+	if (xe_migrate_ulls_enabled(m)) {
+		ulls = ULLS_ACTIVE;
+		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	}
+
+	return __xe_migrate_job_push(m, job, ulls);
+}
+
+/**
+ * xe_migrate_ulls_enter() - Enter ULLS mode
+ * @m: The migration context.
+ *
+ * If DGFX, enter ULLS mode bypassing GuC / HW context switches by utilizing
+ * semaphore and continuously running batches.
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
+	if (!IS_DGFX(xe))
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
+	if (!xe_migrate_ulls_enabled(m)) {
+		struct dma_fence *fence;
+
+		if (!job) {
+			alloc = true;
+			mutex_unlock(&m->job_mutex);
+			goto job_alloc;
+		}
+
+		/* Pairs with PM put on ULLS exit */
+		xe_pm_runtime_get_noresume(xe);
+
+		xe_sched_job_get(job);
+		fence = __xe_migrate_job_push(m, job, ULLS_ENTER);
+		dma_fence_put(fence);
+
+		xe_dbg(xe, "Migrate ULLS mode enter");
+		xe_migrate_ulls_toggle_enable(m, true);
+	}
+	if (job)
+		xe_sched_job_put(job);
+	if (xe_migrate_ulls_enabled(m))
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
+	struct dma_fence *fence = NULL;
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
+	scoped_guard(mutex, &m->job_mutex) {
+		if (xe_exec_queue_is_idle(m->q, 1)) {
+			fence = __xe_migrate_job_push(m, job, ULLS_EXIT);
+			dma_fence_put(fence);
+
+			xe_pm_runtime_put(xe);	/* Pairs with PM get in enter */
+			xe_migrate_ulls_toggle_enable(m, false);
+			cancel_delayed_work(&m->ulls.exit_work);
+
+			xe_dbg(xe, "Migrate ULLS mode exit");
+		} else {
+			xe_sched_job_put(job);
+			mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
+					 ULLS_EXIT_JIFFIES);
+		}
+	}
+
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
@@ -506,6 +681,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
+	INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return err;
@@ -1033,10 +1210,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
-		xe_sched_job_arm(job);
 		dma_fence_put(fence);
-		fence = dma_fence_get(&job->drm.s_fence->finished);
-		xe_sched_job_push(job);
+		fence = xe_migrate_job_push(m, job);
 
 		dma_fence_put(m->fence);
 		m->fence = dma_fence_get(fence);
@@ -1464,10 +1639,8 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 						     DMA_RESV_USAGE_BOOKKEEP));
 
 		scoped_guard(mutex, &m->job_mutex) {
-			xe_sched_job_arm(job);
 			dma_fence_put(fence);
-			fence = dma_fence_get(&job->drm.s_fence->finished);
-			xe_sched_job_push(job);
+			fence = xe_migrate_job_push(m, job);
 
 			dma_fence_put(m->fence);
 			m->fence = dma_fence_get(fence);
@@ -1701,10 +1874,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		}
 
 		mutex_lock(&m->job_mutex);
-		xe_sched_job_arm(job);
 		dma_fence_put(fence);
-		fence = dma_fence_get(&job->drm.s_fence->finished);
-		xe_sched_job_push(job);
+		fence = xe_migrate_job_push(m, job);
 
 		dma_fence_put(m->fence);
 		m->fence = dma_fence_get(fence);
@@ -1980,9 +2151,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	}
 
 	mutex_lock(&m->job_mutex);
-	xe_sched_job_arm(job);
-	fence = dma_fence_get(&job->drm.s_fence->finished);
-	xe_sched_job_push(job);
+	fence = xe_migrate_job_push(m, job);
 
 	dma_fence_put(m->fence);
 	m->fence = dma_fence_get(fence);
@@ -2299,10 +2468,7 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 		xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
 
 		mutex_lock(&m->job_mutex);
-		xe_sched_job_arm(job);
-
-		fence = dma_fence_get(&job->drm.s_fence->finished);
-		xe_sched_job_push(job);
+		fence = xe_migrate_job_push(m, job);
 		mutex_unlock(&m->job_mutex);
 
 		dma_fence_wait(fence, false);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fa381ec36ef1..2e8be10fdb71 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -97,4 +97,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 bool write_to_ccs);
 #endif
 
+void xe_migrate_ulls_enter(struct xe_migrate *m);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index dcef29b56d63..6ad4bbaa1860 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1426,7 +1426,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
 		return -ETIME;
 
-	if (!job && !xe_exec_queue_is_idle(vops->q))
+	if (!job && !xe_exec_queue_is_idle(vops->q, 0))
 		return -ETIME;
 
 	if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 1c1cb44216c3..bbf5e3864ba3 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -83,6 +83,62 @@ xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
 	job->migrate_flush_flags = flags;
 }
 
+/**
+ * xe_sched_job_is_ulls() - Is a ULLS job
+ * @job: Xe schedule job object
+ *
+ * Return: True if @job is submitted as part of a ULLS sequence, False
+ * otherwise.
+ */
+static inline bool xe_sched_job_is_ulls(struct xe_sched_job *job)
+{
+	return job->ulls != ULLS_NONE;
+}
+
+/**
+ * xe_sched_job_ulls_has_batch() - Does a job carry batch buffers
+ * @job: Xe schedule job object
+ *
+ * The ULLS jobs which enter and exit ULLS mode exist only to move the
+ * migration context on and off the hardware, and carry no batch buffers.
+ *
+ * Return: True if @job carries batch buffers, False otherwise.
+ */
+static inline bool xe_sched_job_ulls_has_batch(struct xe_sched_job *job)
+{
+	return job->ulls == ULLS_NONE || job->ulls == ULLS_ACTIVE;
+}
+
+/**
+ * xe_sched_job_ulls_parks() - Does a job park the engine for its successor
+ * @job: Xe schedule job object
+ *
+ * A ULLS job which is not the last one emits a postamble, parking the engine
+ * on its successor's semaphore and publishing that successor's ring tail.
+ *
+ * Return: True if @job emits a ULLS postamble, False otherwise.
+ */
+static inline bool xe_sched_job_ulls_parks(struct xe_sched_job *job)
+{
+	return job->ulls == ULLS_ENTER || job->ulls == ULLS_ACTIVE;
+}
+
+/**
+ * xe_sched_job_ulls_is_chained() - Has a job's predecessor already published it
+ * @job: Xe schedule job object
+ *
+ * A ULLS job which is not the first one has had its ring tail published by its
+ * predecessor's postamble, which also left the engine parked on this job's
+ * semaphore. Submitting it is a semaphore write alone - no H2G and no ring
+ * tail write.
+ *
+ * Return: True if @job was published by its predecessor, False otherwise.
+ */
+static inline bool xe_sched_job_ulls_is_chained(struct xe_sched_job *job)
+{
+	return job->ulls == ULLS_ACTIVE || job->ulls == ULLS_EXIT;
+}
+
 bool xe_sched_job_is_migration(struct xe_exec_queue *q);
 
 struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job *job);
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 9f527ac6df3e..c8cdbe68843f 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -49,6 +49,23 @@ struct xe_job_ptrs {
 	u32 head;
 };
 
+/**
+ * enum xe_ulls_state - ULLS state of a migration job
+ *
+ * Describes where a job sits in a ULLS (Ultra Low Latency Submission)
+ * sequence. See the ULLS documentation in xe_migrate.c.
+ */
+enum xe_ulls_state {
+	/** @ULLS_NONE: Not a ULLS job */
+	ULLS_NONE = 0,
+	/** @ULLS_ENTER: Job which enters ULLS mode */
+	ULLS_ENTER,
+	/** @ULLS_ACTIVE: Job submitted while in ULLS mode */
+	ULLS_ACTIVE,
+	/** @ULLS_EXIT: Job which exits ULLS mode */
+	ULLS_EXIT,
+};
+
 /**
  * struct xe_sched_job - Xe schedule job (batch buffer tracking)
  */
@@ -79,6 +96,8 @@ struct xe_sched_job {
 	u32 migrate_flush_flags;
 	/** @sample_timestamp: Sampling of job timestamp in TDR */
 	u64 sample_timestamp;
+	/** @ulls: ULLS state of this job */
+	enum xe_ulls_state ulls;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
 	/** @ring_ops_force_reset: The ring ops need to trigger a reset before payload. */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f450e1c6f750..f66bd1de2b70 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -149,7 +149,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
-		if (!xe_exec_queue_is_idle(q))
+		if (!xe_exec_queue_is_idle(q, 0))
 			return false;
 	}
 
-- 
2.34.1

