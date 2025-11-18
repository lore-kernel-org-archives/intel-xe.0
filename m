Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F349CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D593B10E46C;
	Tue, 18 Nov 2025 09:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGvj4peL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A4710E45E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456771; x=1794992771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FuPTcYRnYFeXi8Wxxo/C08QkWwPcv3SqteGU00iB/eE=;
 b=dGvj4peLnTJq97VFIrq/l3ecdgl/bUYhHJ72W4/VUklpDF4ikhwand4J
 RCDmjVXGlYrI/GkpvdqaGR+kmddadqsKJW89ZG0z8HnISorZrRYDozPOp
 A8Stwq1JBrPT24eUDVG3PYZo2DVlu7HRQJN5lX4phFXRMvh3RKZlf0grU
 unfotgSD9M9pqzNxH7J1cWjkxoxAXLHQ5YlGBcZ8fmLv5JtV7L8rBxvTC
 0AuLZ/rnJba6zkTfRdK/c8/ynurZQkZjBQxYLcyWH3kVWmrDYdrRMEHWP
 RP686I3IkBkN7/bGB275NDqMP3JTHdsWAyPXBEio+pUrcRGNWH6yHCFK1 Q==;
X-CSE-ConnectionGUID: jHDWIuawQ0WDNbj3dDQjyQ==
X-CSE-MsgGUID: 2BPgDZ6CQne53nkNn2OcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097786"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:11 -0800
X-CSE-ConnectionGUID: WElAxA4fRZWKbOwc7epCIw==
X-CSE-MsgGUID: clubfDQFQDmeWT5KvddH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500876"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:09 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 08/11] drm/xe: Prep page reclaim in tlb inval job
Date: Tue, 18 Nov 2025 17:05:49 +0800
Message-ID: <20251118090552.246243-9-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Use page reclaim list as indicator if page reclaim action is desired and
pass it to tlb inval fence to handle.

Job will need to maintain its own embedded copy to ensure lifetime of
PRL exist until job has run.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c     | 15 ++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h     |  3 +++
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 532a047676d4..03723c8d2601 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2497,6 +2497,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			goto kill_vm_tile1;
 		}
 		update.ijob = ijob;
+		if (pt_update_ops->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST) {
+			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
+			/* Release ref from alloc, job will now handle it */
+			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
+			pt_update_ops->prl.entries = NULL;
+		}
 
 		if (tile->media_gt) {
 			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 67a047521165..18d49e017828 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -476,3 +476,18 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 	fence->reclaim_entries = NULL;
 	fence->prl_sa = NULL;
 }
+
+/**
+ * xe_tlb_inval_fence_add_page_reclaim() - Attach PRL state to a TLB fence
+ * @fence: Fence issued for the invalidate
+ * @prl: Page reclaim list describing pages to reclaim
+ *
+ * Copies the PRL pointer into the fence and disables PPC flushing so the
+ * reclamation message can be sent instead.
+ */
+void xe_tlb_inval_fence_add_page_reclaim(struct xe_tlb_inval_fence *fence,
+					 struct xe_page_reclaim_list *prl)
+{
+	fence->reclaim_entries = prl->entries;
+	fence->flush_cache = false;
+}
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index b84ce3e6f294..a1cd9afe2ca7 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -13,6 +13,7 @@
 struct xe_gt;
 struct xe_guc;
 struct xe_vm;
+struct xe_page_reclaim_list;
 
 int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
 
@@ -30,6 +31,8 @@ void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
 void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 			     struct xe_tlb_inval_fence *fence,
 			     bool stack);
+void xe_tlb_inval_fence_add_page_reclaim(struct xe_tlb_inval_fence *fence,
+					 struct xe_page_reclaim_list *prl);
 
 /**
  * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 6248f90323a9..5206a751c3d3 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -8,6 +8,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_types.h"
+#include "xe_page_reclaim.h"
 #include "xe_tlb_inval.h"
 #include "xe_tlb_inval_job.h"
 #include "xe_migrate.h"
@@ -39,6 +40,8 @@ struct xe_tlb_inval_job {
 	int type;
 	/** @fence_armed: Fence has been armed */
 	bool fence_armed;
+	/** @prl: Embedded copy of page reclaim list */
+	struct xe_page_reclaim_list prl;
 };
 
 static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
@@ -107,6 +110,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	job->start = start;
 	job->end = end;
 	job->fence_armed = false;
+	xe_page_reclaim_list_invalidate(&job->prl);
 	job->dep.ops = &dep_job_ops;
 	job->type = type;
 	kref_init(&job->refcount);
@@ -140,6 +144,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	return ERR_PTR(err);
 }
 
+/**
+ * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
+ * @job: TLB invalidation job that may trigger reclamation
+ * @prl: Page reclaim list populated during unbind
+ *
+ * Copies @prl into the job and takes an extra reference to the entry page so
+ * ownership can transfer to the TLB fence when the job is pushed.
+ */
+void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
+				       struct xe_page_reclaim_list *prl)
+{
+	struct xe_device *xe = gt_to_xe(job->q->gt);
+
+	WARN_ON(!xe->info.has_page_reclaim_hw_assist);
+	job->prl = *prl;
+	/* Pair with put after bo creation */
+	xe_page_reclaim_entries_get(job->prl.entries);
+}
+
 static void xe_tlb_inval_job_destroy(struct kref *ref)
 {
 	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
@@ -150,6 +173,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_vm *vm = job->vm;
 
+	/* BO creation retains a copy (if used), so no longer needed */
+	if (job->prl.entries)
+		xe_page_reclaim_entries_put(job->prl.entries);
+
 	if (!job->fence_armed)
 		kfree(ifence);
 	else
@@ -234,6 +261,8 @@ struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
 	/* Creation ref pairs with put in xe_tlb_inval_job_destroy */
 	xe_tlb_inval_fence_init(job->tlb_inval, ifence, false);
 	dma_fence_get(job->fence);	/* Pairs with put in DRM scheduler */
+	if (job->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST)
+		xe_tlb_inval_fence_add_page_reclaim(ifence, &job->prl);
 
 	drm_sched_job_arm(&job->dep.drm);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
index 4d6df1a6c6ca..03d6e21cd611 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
@@ -12,6 +12,7 @@ struct dma_fence;
 struct xe_dep_scheduler;
 struct xe_exec_queue;
 struct xe_migrate;
+struct xe_page_reclaim_list;
 struct xe_tlb_inval;
 struct xe_tlb_inval_job;
 struct xe_vm;
@@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 			struct xe_dep_scheduler *dep_scheduler,
 			struct xe_vm *vm, u64 start, u64 end, int type);
 
+void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
+				       struct xe_page_reclaim_list *prl);
+
 int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
 
 struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
-- 
2.51.2

