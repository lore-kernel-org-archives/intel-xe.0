Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF4C52D7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05810E076;
	Mon, 12 Aug 2024 02:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhvoI+Pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F6610E064
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7A4UOLIABwa6eUZO3QA4LOydl9+j9hqGGuYzNzwBgLA=;
 b=mhvoI+PrGnLAaynRXo2FpfBCvlKurY0lRvt/TRTTE2ni4iIMd4hFq2Ql
 I7HIjg2NJLq1gvFVzlmSU2eX1qT/imhBTkxwlumWrfDG/kBSi/uEfn9pI
 sxTC6Df7Yu2F1hnTT15Fdp22spychzKANBjVJiojqMn7nU89aSuCXGiBb
 np37wLTQyAPuQtKNBGBVbZYcrpoCulGP9wcv2vmr+QjvKGiGx0xFa3+g5
 nevQBa/Yo5gXa6HtlC44p0hMndUOs/niUYor0+4Vmc/2TksnT2zmAQ1Jd
 FysucNARUDy3LGfFnfPYqfBhtEQjnpxoCSHJAgturPHDhiVfkqKPduD5E Q==;
X-CSE-ConnectionGUID: RbibrSOxQVmPZfMXBqoUlw==
X-CSE-MsgGUID: eIcvYuglS/SBKIDMOVTy8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099520"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: S55vGkMkQlmMHPs/BgV/qw==
X-CSE-MsgGUID: Uwqkk7YwRz+qEMEE8pR/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256302"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 4/8] drm/xe: Add ULLS migration job support to migration
 layer
Date: Sun, 11 Aug 2024 19:47:13 -0700
Message-Id: <20240812024717.3584636-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Add functions to enter / exit ULLS mode for migration jobs when LR VMs
are opened / closed. ULLS mode only support on DGFX and USM platforms
where a hardware engine is reserved for migrations jobs. When in ULLS
mode, set several flags on migration jobs so submission backend / ring
ops can properly submit in ULLS mode. Upon ULLS mode exit, send a job to
trigger that current ULLS semaphore so the ring can be taken off the
hardware.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 130 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h |   4 +
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6f24aaf58252..ea835b035d16 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -22,6 +22,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
@@ -65,6 +66,15 @@ struct xe_migrate {
 	struct drm_suballoc_manager vm_update_sa;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
 	u64 min_chunk_size;
+	/** @ulls: ULLS support */
+	struct {
+		/** @ulls.lock: rw semaphore for entering / exiting ULLS mode */
+		struct rw_semaphore lock;
+		/** @ulls.lr_vm_count: count of LR VMs open */
+		u32 lr_vm_count;
+		/** @ulls: first submit of ULLS */
+		u8 first_submit : 1;
+	} ulls;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
@@ -406,6 +416,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 	m->tile = tile;
 
+	init_rwsem(&m->ulls.lock);
+
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
 			  XE_VM_FLAG_SET_TILE_ID(tile));
@@ -738,6 +750,94 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+/**
+ * xe_migrate_lr_vm_get() - Open a LR VM and possibly enter ULLS mode
+ * @m: The migration context.
+ *
+ * If DGFX and device supprts USM, enter ULLS mode by increasing LR VM count
+ */
+void xe_migrate_lr_vm_get(struct xe_migrate *m)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	if (!IS_DGFX(xe) || !xe->info.has_usm)
+		return;
+
+	down_write(&m->ulls.lock);
+	if (!m->ulls.lr_vm_count++) {
+		drm_dbg(&xe->drm, "Migrate ULLS mode enter");
+		xe_force_wake_get(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
+		m->ulls.first_submit = true;
+	}
+	up_write(&m->ulls.lock);
+}
+
+/**
+ * xe_migrate_lr_vm_put() - Open a LR VM and possinly exit ULLS mode
+ * @m: The migration context.
+ *
+ * If DGFX and device supprts USM, decrease LR VM count, exit if count equal to
+ * zero by submiting a job to trigger last ULLS semaphore.
+ */
+void xe_migrate_lr_vm_put(struct xe_migrate *m)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	if (!IS_DGFX(xe) || !xe->info.has_usm)
+		return;
+
+	down_write(&m->ulls.lock);
+	xe_assert(xe, m->ulls.lr_vm_count);
+	if (!--m->ulls.lr_vm_count && !m->ulls.first_submit) {
+		struct xe_sched_job *job;
+		struct dma_fence *fence;
+		uint64_t batch_addr[2] = { 0, 0 };
+
+		job = xe_sched_job_create(m->q, batch_addr);
+		if (WARN_ON_ONCE(IS_ERR(job)))
+			goto unlock;	/* Not fatal */
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+		set_bit(JOB_FLAG_ULLS, &job->fence->flags);
+		set_bit(JOB_FLAG_ULLS_LAST, &job->fence->flags);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+		mutex_unlock(&m->job_mutex);
+
+		/* Serialize force wake put */
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+unlock:
+	if (!m->ulls.lr_vm_count) {
+		drm_dbg(&xe->drm, "Migrate ULLS mode exit");
+		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
+	}
+	up_write(&m->ulls.lock);
+}
+
+static inline bool xe_migrate_is_ulls(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
+	lockdep_assert_held(&m->ulls.lock);
+
+	return !!m->ulls.lr_vm_count;
+}
+
+static inline bool xe_migrate_is_ulls_first(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
+	lockdep_assert_held(&m->ulls.lock);
+
+	if (xe_migrate_is_ulls(m) && m->ulls.first_submit) {
+		m->ulls.first_submit = false;
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * xe_migrate_copy() - Copy content of TTM resources.
  * @m: The migration context.
@@ -805,6 +905,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
 				&ccs_it);
 
+	down_read(&m->ulls.lock);
 	while (size) {
 		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
 		struct xe_sched_job *job;
@@ -905,6 +1006,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		if (xe_migrate_is_ulls(m))
+			set_bit(JOB_FLAG_ULLS, &job->fence->flags);
+		if (xe_migrate_is_ulls_first(m))
+			set_bit(JOB_FLAG_ULLS_FIRST, &job->fence->flags);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -924,6 +1029,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bb_free(bb, NULL);
 
 err_sync:
+		up_read(&m->ulls.lock);
+
 		/* Sync partial copy if any. FIXME: under job_mutex? */
 		if (fence) {
 			dma_fence_wait(fence, false);
@@ -932,6 +1039,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		return ERR_PTR(err);
 	}
+	up_read(&m->ulls.lock);
 
 	return fence;
 }
@@ -1065,6 +1173,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	else
 		xe_res_first(src, 0, bo->size, &src_it);
 
+	down_read(&m->ulls.lock);
 	while (size) {
 		u64 clear_L0_ofs;
 		u32 clear_L0_pt;
@@ -1146,6 +1255,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		if (xe_migrate_is_ulls(m))
+			set_bit(JOB_FLAG_ULLS, &job->fence->flags);
+		if (xe_migrate_is_ulls_first(m))
+			set_bit(JOB_FLAG_ULLS_FIRST, &job->fence->flags);
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1163,6 +1276,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 err:
 		xe_bb_free(bb, NULL);
 err_sync:
+		up_read(&m->ulls.lock);
+
 		/* Sync partial copies if any. FIXME: job_mutex? */
 		if (fence) {
 			dma_fence_wait(m->fence, false);
@@ -1171,6 +1286,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		return ERR_PTR(err);
 	}
+	up_read(&m->ulls.lock);
 
 	if (clear_system_ccs)
 		bo->ccs_cleared = true;
@@ -1459,15 +1575,25 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 		if (err)
 			goto err_job;
 	}
-	if (is_migrate)
+	if (is_migrate) {
+		up_read(&m->ulls.lock);
 		mutex_lock(&m->job_mutex);
+	}
 
 	xe_sched_job_arm(job);
+	if (is_migrate) {
+		if (xe_migrate_is_ulls(m))
+			set_bit(JOB_FLAG_ULLS, &job->fence->flags);
+		if (xe_migrate_is_ulls_first(m))
+			set_bit(JOB_FLAG_ULLS_FIRST, &job->fence->flags);
+	}
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
-	if (is_migrate)
+	if (is_migrate) {
 		mutex_unlock(&m->job_mutex);
+		down_read(&m->ulls.lock);
+	}
 
 	xe_bb_free(bb, fence);
 	drm_suballoc_free(sa_bo, fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..8e3bda7689fc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -115,4 +115,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
+void xe_migrate_lr_vm_get(struct xe_migrate *m);
+void xe_migrate_lr_vm_put(struct xe_migrate *m);
+
 #endif
-- 
2.34.1

