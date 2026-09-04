Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F0C79F89
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F047D10FB62;
	Fri,  4 Sep 2026 21:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vw2DdJJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0010FB36
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ok4A+TPyhxAJ7KYbaJgm9E+QDD/0GiW01S1Z2qt4EzE=;
 b=Vw2DdJJLH3aImi4cEbjUcfGeWmfNRlLtoeURFryNY2gX7EPZXJ6hzdna
 kEe2psNVzbMu8jjbaI9PB2CkcSpHr8dVgWzDHPDEJSV8cHpLAc69HCTEv
 KUaP1kpNsdPjRMHY4KWRDmIAmbv3GgC60B/DcjkLfRS7oNNqxZRVAsi6B
 8pT4idp7cQjY+olQisADUIUnJQnnRPm3TG61uL+IeLeMh2oU+l70i2YOA
 Z9P3z3kqUGPK5Rn1HGgVBWUIfb6o8O1o4cnxUtuNGqVKJhz6go57e7f61
 z3xT/V9V6/ZTGxh3S/rFujKII2elwtLSlPA8MfYiQjSVvi6JYEWcoLjXq Q==;
X-CSE-ConnectionGUID: t+dI1MU4RU6ihMMAzbWRgQ==
X-CSE-MsgGUID: ZANA/+mqQoaRC18GKUGxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096804"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: MhttvtQvQvuZPNjaGaLgCA==
X-CSE-MsgGUID: I6sGGSiBThaPok835UA53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563422"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 07/24] drm/xe: Update scheduler job layer to support PT jobs
Date: Fri,  4 Sep 2026 14:15:56 -0700
Message-Id: <20260904211613.3934307-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Update the scheduler job layer to support PT jobs. PT jobs are executed
entirely on the CPU and do not require LRC fences or a batch address.
Repurpose the LRC fence storage to hold PT‑job arguments and update the
scheduler job layer to distinguish between PT jobs and jobs that require
an LRC.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-8-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_sched_job.c       | 95 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_sched_job_types.h | 31 +++++++-
 drivers/gpu/drm/xe/xe_trace.h           |  2 +-
 3 files changed, 92 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index a4fa00632a30..841d67ebd5b0 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
 
 int __init xe_sched_job_module_init(void)
 {
+	struct xe_sched_job *job;
+	size_t size;
+
+	size = struct_size(job, ptrs, 1);
 	xe_sched_job_slab =
-		kmem_cache_create("xe_sched_job",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs), 0,
+		kmem_cache_create("xe_sched_job", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_slab)
 		return -ENOMEM;
 
+	size = max_t(size_t,
+		     struct_size(job, ptrs,
+				 XE_HW_ENGINE_MAX_INSTANCE),
+		     struct_size(job, pt_update, 1));
 	xe_sched_job_parallel_slab =
-		kmem_cache_create("xe_sched_job_parallel",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs) *
-				  XE_HW_ENGINE_MAX_INSTANCE, 0,
+		kmem_cache_create("xe_sched_job_parallel", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
@@ -84,6 +87,9 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
 {
 	int i;
 
+	if (job->is_pt_job)
+		return;
+
 	for (i = 0; i < job->q->width; ++i) {
 		struct xe_job_ptrs *ptrs = &job->ptrs[i];
 
@@ -93,10 +99,23 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
 	}
 }
 
+/**
+ * xe_sched_job_create() - Create a scheduler job
+ * @q: exec queue to create the scheduler job for
+ * @batch_addr: array of batch addresses for the job; must match the width of
+ * @q, or NULL to indicate a PT job that does not require a batch address
+ *
+ * Create a scheduler job for submission.
+ *
+ * Context: Reclaim
+ *
+ * Return: a &xe_sched_job object on success, or an ERR_PTR on failure.
+ */
 struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 					 u64 *batch_addr)
 {
 	bool is_migration = xe_sched_job_is_migration(q);
+	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_sched_job *job;
 	int err;
 	int i;
@@ -105,6 +124,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	/* only a kernel context can submit a vm-less job */
 	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
 
+	xe_assert(xe, batch_addr ||
+		  q->flags & (EXEC_QUEUE_FLAG_VM | EXEC_QUEUE_FLAG_MIGRATE));
+
 	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
@@ -119,34 +141,39 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (err)
 		goto err_free;
 
-	for (i = 0; i < q->width; ++i) {
-		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
-		struct dma_fence_chain *chain;
-
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_sched_job;
+	if (!batch_addr) {
+		job->fence = dma_fence_get_stub();
+		job->is_pt_job = true;
+	} else {
+		for (i = 0; i < q->width; ++i) {
+			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
+			struct dma_fence_chain *chain;
+
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_sched_job;
+			}
+			job->ptrs[i].lrc_fence = fence;
+
+			if (i + 1 == q->width)
+				continue;
+
+			chain = dma_fence_chain_alloc();
+			if (!chain) {
+				err = -ENOMEM;
+				goto err_sched_job;
+			}
+			job->ptrs[i].chain_fence = chain;
 		}
-		job->ptrs[i].lrc_fence = fence;
 
-		if (i + 1 == q->width)
-			continue;
+		width = q->width;
+		if (is_migration)
+			width = 2;
 
-		chain = dma_fence_chain_alloc();
-		if (!chain) {
-			err = -ENOMEM;
-			goto err_sched_job;
-		}
-		job->ptrs[i].chain_fence = chain;
+		for (i = 0; i < width; ++i)
+			job->ptrs[i].batch_addr = batch_addr[i];
 	}
 
-	width = q->width;
-	if (is_migration)
-		width = 2;
-
-	for (i = 0; i < width; ++i)
-		job->ptrs[i].batch_addr = batch_addr[i];
-
 	atomic_inc(&q->job_cnt);
 	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
@@ -246,7 +273,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 void xe_sched_job_arm(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct dma_fence *fence, *prev;
+	struct dma_fence *fence = job->fence, *prev;
 	struct xe_vm *vm = q->vm;
 	u64 seqno = 0;
 	int i;
@@ -266,6 +293,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		job->ring_ops_flush_tlb = true;
 	}
 
+	if (job->is_pt_job)
+		goto arm;
+
 	/* Arm the pre-allocated fences */
 	for (i = 0; i < q->width; prev = fence, ++i) {
 		struct dma_fence_chain *chain;
@@ -286,6 +316,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		fence = &chain->base;
 	}
 
+arm:
 	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
 	drm_sched_job_arm(&job->drm);
 }
@@ -329,7 +360,7 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
 
 	snapshot->batch_addr_len = q->width;
 	for (i = 0; i < q->width; i++)
-		snapshot->batch_addr[i] =
+		snapshot->batch_addr[i] = job->is_pt_job ? 0 :
 			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
 
 	return snapshot;
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0490b1247a6e..5e1824c36c74 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -10,10 +10,29 @@
 
 #include <drm/gpu_scheduler.h>
 
-struct xe_exec_queue;
 struct dma_fence;
 struct dma_fence_chain;
 
+struct xe_exec_queue;
+struct xe_migrate_pt_update_ops;
+struct xe_pt_job_ops;
+struct xe_tile;
+struct xe_vm;
+
+/**
+ * struct xe_pt_update_args - PT update arguments
+ */
+struct xe_pt_update_args {
+	/** @vm: VM which is being bound */
+	struct xe_vm *vm;
+	/** @tile: Tile which page tables belong to */
+	struct xe_tile *tile;
+	/** @ops: Migrate PT update ops */
+	const struct xe_migrate_pt_update_ops *ops;
+	/** @pt_job_ops: PT job ops state */
+	struct xe_pt_job_ops *pt_job_ops;
+};
+
 /**
  * struct xe_job_ptrs - Per hw engine instance data
  */
@@ -71,8 +90,14 @@ struct xe_sched_job {
 	bool restore_replay;
 	/** @last_replay: last job being replayed */
 	bool last_replay;
-	/** @ptrs: per instance pointers. */
-	struct xe_job_ptrs ptrs[];
+	/** @is_pt_job: is a PT job */
+	bool is_pt_job;
+	union {
+		/** @ptrs: per instance pointers. */
+		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
+		/** @pt_update: PT update arguments */
+		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
+	};
 };
 
 struct xe_sched_job_snapshot {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2fe8f89a1e34..d4e9d91f6f7f 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -261,7 +261,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->flags = job->q->flags;
 			   __entry->error = job->fence ? job->fence->error : 0;
 			   __entry->fence = job->fence;
-			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
+			   __entry->batch_addr = job->is_pt_job ? 0 : (u64)job->ptrs[0].batch_addr;
 			   ),
 
 		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
-- 
2.34.1

