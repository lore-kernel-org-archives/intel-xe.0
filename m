Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A9C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64810E2C9;
	Tue,  5 Aug 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOAt9kGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6910E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iofVbdPPlTOMri9rg1ammhwBuuuoAqySjpzwUevJAvc=;
 b=SOAt9kGy7TdulBN1uRoTD+oF41imYfdxUJvqSb/vDW6/TyQ2jGI+0vEy
 VxUisfj3bRNC1v/wr7FJnMDggVisJpJCMLol9FZ0x+12srmG7Ua4THSl+
 qN63yFiL1DrOtibhMatLrvTVYqodGmXMEzLtxgOW4iTe0aZdG/tVs+kba
 2S1/tET7CzvEfxPfMSYtkWGJlbC/Swyz69fLbqqtyd3Y89CAN/H45mSP/
 HqVGlpJpoXLEeFYMK/60dGi2ORkjoVa7lK+EzK5AXld3Ie7dsbzKDVWrz
 TTPNpkXTfrDQbrVzqWyOS169KrA6ok4ep0SbSGUfnt+Q5hzPfUiQc9ct1 A==;
X-CSE-ConnectionGUID: GOt3HOgRQj68OGDU4m2qoQ==
X-CSE-MsgGUID: q6sTXF/rTYujgfZN6CIZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119065"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: o3VZSFHYRAS34ieCRqc0/A==
X-CSE-MsgGUID: V6RRcXhSQbuumNGE3Auq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641628"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 09/15] drm/xe: Add ULLS migration job support to migration
 layer
Date: Tue,  5 Aug 2025 16:41:54 -0700
Message-Id: <20250805234200.1035609-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

v2:
 - Fix kernel doc
 - Convert static inline functions to static
 - Remove extra whitespace
 - Add xe_migrate_job_set_ulls_flags helper
 - Fix migrate selftest (CI)
 - Use delayed worker to exit ULLS mode (Michal / Thomas)
 - Do not enter ULLS if a VF
 - Allocate job outside mutex

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c         | 181 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |   2 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |   6 +
 3 files changed, 189 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0ec9d407acb7..2da7aafecfa4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -9,6 +9,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_drv.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -22,12 +23,14 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
@@ -64,6 +67,14 @@ struct xe_migrate {
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
@@ -86,6 +97,8 @@ static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
 
+	flush_delayed_work(&m->ulls.exit_work);
+
 	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
 	xe_vm_unlock(m->q->vm);
@@ -377,6 +390,149 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
 	return m;
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
+		fw_ref = xe_force_wake_get(gt_to_fw(m->q->hwe->gt),
+					   m->q->hwe->domain);
+		if (fw_ref) {
+			struct xe_device *xe = tile_to_xe(m->tile);
+			struct dma_fence *fence;
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
+			drm_dbg(&xe->drm, "Migrate ULLS mode enter");
+			m->ulls.enabled = true;
+		}
+	}
+	if (job)
+		xe_sched_job_put(job);
+	if (m->ulls.enabled)
+		mod_delayed_work(system_wq, &m->ulls.exit_work,
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
+	bool pm_ref = false, bound;
+
+	xe_assert(xe, m->ulls.enabled);
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (!bound) {
+		mutex_lock(&m->job_mutex);
+		goto drop_enable;
+	}
+
+	pm_ref = xe_pm_runtime_get_if_active(xe);
+	if (!pm_ref) {
+		mutex_lock(&m->job_mutex);
+		goto drop_enable;
+	}
+
+	/*
+	 * Must be done outside job_mutex as that lock is tainted with
+	 * reclaim and must be done holding a pm ref.
+	 */
+	job = xe_sched_job_create(m->q, batch_addr);
+	if (WARN_ON_ONCE(IS_ERR(job))) {
+		xe_pm_runtime_put(xe);
+		drm_dev_exit(idx);
+		mod_delayed_work(system_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+		return;		/* Not fatal */
+	}
+
+	mutex_lock(&m->job_mutex);
+
+	if (!xe_exec_queue_is_idle(m->q))
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
+drop_enable:
+	m->ulls.enabled = false;
+unlock_exit:
+	if (job)
+		xe_sched_job_put(job);
+	if (!m->ulls.enabled) {
+		drm_dbg(&xe->drm, "Migrate ULLS mode exit");
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
+		cancel_delayed_work(&m->ulls.exit_work);
+	} else {
+		mod_delayed_work(system_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	}
+
+	if (pm_ref)
+		xe_pm_runtime_put(xe);
+	if (bound)
+		drm_dev_exit(idx);
+
+	mutex_unlock(&m->job_mutex);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
@@ -461,6 +617,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
+	INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return err;
@@ -753,6 +911,26 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
+		mod_delayed_work(system_wq, &m->ulls.exit_work,
+				 ULLS_EXIT_JIFFIES);
+	}
+}
+
 /**
  * xe_migrate_copy() - Copy content of TTM resources.
  * @m: The migration context.
@@ -923,6 +1101,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		xe_migrate_job_set_ulls_flags(m, job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1344,6 +1523,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		xe_migrate_job_set_ulls_flags(m, job);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1693,6 +1873,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
+	xe_migrate_job_set_ulls_flags(m, job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index e4f08a58fc56..71bbe1616555 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -153,6 +153,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+void xe_migrate_ulls_enter(struct xe_migrate *m);
+
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 79a459f2a0a8..9beeafb636ba 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -79,6 +79,12 @@ struct xe_sched_job {
 	bool ggtt;
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
-- 
2.34.1

