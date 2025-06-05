Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC6C61CE8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4710E919;
	Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edTQ0JDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1561510E8A8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBMRm1r3CyOOP9WT/vpTB5pzn7afI2eex6JfxeOWzmg=;
 b=edTQ0JDeD6W0JGVr+ETgb/xxRBHrCU0nFaYcoRa2G1nEfMBmRxUa2Ofb
 sH9BJLsqLDKVzgwNwSP2u99xsZwYVbMXJIi0ruMqrvHxL7N8LlQHnrYWB
 4vR9rP3TjltWIkUN1RB1XpoKKeaaPVp6DHaGwl+i+r/RaallQU91d8C6y
 KtM1Rd34n4QAeIJagtL+RCtu5SVQfqQjdVyLoGuKKeJm6upBCZ/GTwN4P
 1eW2Ivoho5gf7eOIpXT3PQOtNwjYsLiqRLto8x7XDPfBH5Jhoi1WHEa91
 eUT2ZFVWSISSmcBvb/UUVJvRwO/4BC882YdUYLZh0EFlZgzrcuKtYlWj3 A==;
X-CSE-ConnectionGUID: Z4W9P/ukS7OT+JCZxTMLrg==
X-CSE-MsgGUID: 4DqECI2TSqucOJmxNda1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529492"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: EbTo7Xr4SD2ytNHua8NVUQ==
X-CSE-MsgGUID: 2E0oPUaeQb6/8l4vfryN5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502813"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 08/15] drm/xe: Add ULLS migration job support to migration
 layer
Date: Thu,  5 Jun 2025 08:32:16 -0700
Message-Id: <20250605153223.2789122-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_migrate.c         | 111 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h         |   4 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |   6 ++
 3 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6b6dff9d4aaa..80344d4f6f10 100644
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
@@ -62,6 +63,13 @@ struct xe_migrate {
 	struct dma_fence *fence;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
 	u64 min_chunk_size;
+	/** @ulls: ULLS support */
+	struct {
+		/** @ulls.lr_vm_count: count of LR VMs open */
+		u32 lr_vm_count;
+		/** @ulls: first submit of ULLS */
+		u8 first_submit : 1;
+	} ulls;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
@@ -734,6 +742,95 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
+	mutex_lock(&m->job_mutex);
+	if (!m->ulls.lr_vm_count++) {
+		unsigned int fw_ref;
+
+		drm_dbg(&xe->drm, "Migrate ULLS mode enter");
+		fw_ref = xe_force_wake_get(gt_to_fw(m->q->hwe->gt),
+					   m->q->hwe->domain);
+
+		XE_WARN_ON(!fw_ref);
+		m->ulls.first_submit = true;
+	}
+	mutex_unlock(&m->job_mutex);
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
+	mutex_lock(&m->job_mutex);
+	xe_assert(xe, m->ulls.lr_vm_count);
+	if (!--m->ulls.lr_vm_count && !m->ulls.first_submit) {
+		struct xe_sched_job *job;
+		struct dma_fence *fence;
+		u64 batch_addr[2] = { 0, 0 };
+
+		job = xe_sched_job_create(m->q, batch_addr);
+		if (WARN_ON_ONCE(IS_ERR(job)))
+			goto unlock;	/* Not fatal */
+
+		xe_sched_job_arm(job);
+		job->is_ulls = true;
+		job->is_ulls_last = true;
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
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
+	mutex_unlock(&m->job_mutex);
+}
+
+static inline bool xe_migrate_is_ulls(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
+
+	return !!m->ulls.lr_vm_count;
+}
+
+static inline bool xe_migrate_is_ulls_first(struct xe_migrate *m)
+{
+	lockdep_assert_held(&m->job_mutex);
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
@@ -904,6 +1001,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		if (xe_migrate_is_ulls(m))
+			job->is_ulls = true;
+		if (xe_migrate_is_ulls_first(m))
+			job->is_ulls_first = true;
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -923,6 +1024,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bb_free(bb, NULL);
 
 err_sync:
+
 		/* Sync partial copy if any. FIXME: under job_mutex? */
 		if (fence) {
 			dma_fence_wait(fence, false);
@@ -1156,6 +1258,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		mutex_lock(&m->job_mutex);
 		xe_sched_job_arm(job);
+		if (xe_migrate_is_ulls(m))
+			job->is_ulls = true;
+		if (xe_migrate_is_ulls_first(m))
+			job->is_ulls_first = true;
 		dma_fence_put(fence);
 		fence = dma_fence_get(&job->drm.s_fence->finished);
 		xe_sched_job_push(job);
@@ -1173,6 +1279,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 err:
 		xe_bb_free(bb, NULL);
 err_sync:
+
 		/* Sync partial copies if any. FIXME: job_mutex? */
 		if (fence) {
 			dma_fence_wait(fence, false);
@@ -1499,6 +1606,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
+	if (xe_migrate_is_ulls(m))
+		job->is_ulls = true;
+	if (xe_migrate_is_ulls_first(m))
+		job->is_ulls_first = true;
 	xe_sched_job_push(job);
 
 	dma_fence_put(m->fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 3131875341c9..3af024284722 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -135,4 +135,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
+
+void xe_migrate_lr_vm_get(struct xe_migrate *m);
+void xe_migrate_lr_vm_put(struct xe_migrate *m);
+
 #endif
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

