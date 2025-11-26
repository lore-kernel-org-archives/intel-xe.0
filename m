Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C88D111A7
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665310E71A;
	Wed, 26 Nov 2025 23:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0/h2dGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0EC10E71F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198139; x=1795734139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AW24Uk9LajgrR2bQsITd9w8jg4u9B3AmL+4ZXGNqUsM=;
 b=b0/h2dGwg77seElTabzgKCZvL8aOJXkgwEzElhBsipGeLGhqb5iPYw/g
 d+uucGv5Nm9iwhjR42nm5Hgs6guUOgy1yuIDIVZYp4BPmU4PB/ookC7Wz
 ioPPZ3JZPGe0F7OSC1K8GcTlepZPRjcJiAjvQqctu+R+NOmahc3dGQ/LA
 bOLNH1T+53+iPvojmBWwkOMtX/2j3mez0uPnRLE1UFc7vKyPIESiExm/W
 V2mnh83AO364gnRuny/n/uqIGpryNldfy+ayRL+2Oj/8ZUv593GOQPpQm
 4QHdmklzJKBlFwIAxSf/JbGHL6aVN9i5imrv1I68ZHpikGSDLO+TTbcEP g==;
X-CSE-ConnectionGUID: xJjHxlItTt6not5IOSXwFQ==
X-CSE-MsgGUID: QSey+DymS/yM93XLmlGzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284543"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284543"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:19 -0800
X-CSE-ConnectionGUID: SVukC/43QmiGtmLHQMVejg==
X-CSE-MsgGUID: ql5MqqE0RHeSjXr1bnQ/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028536"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:17 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Date: Thu, 27 Nov 2025 07:02:09 +0800
Message-ID: <20251126230201.3782788-21-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

v2:
 - Use xe variant of WARN_ON (Michal)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 347b111dc097..833d6762dd8d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index dbd3171fff12..2185f42b9644 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -7,7 +7,9 @@
 #include "xe_dep_job_types.h"
 #include "xe_dep_scheduler.h"
 #include "xe_exec_queue.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
+#include "xe_page_reclaim.h"
 #include "xe_tlb_inval.h"
 #include "xe_tlb_inval_job.h"
 #include "xe_migrate.h"
@@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	job->start = start;
 	job->end = end;
 	job->fence_armed = false;
+	xe_page_reclaim_list_init(&job->prl);
 	job->dep.ops = &dep_job_ops;
 	job->type = type;
 	kref_init(&job->refcount);
@@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
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
+	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
+	job->prl = *prl;
+	/* Pair with put after bo creation */
+	xe_page_reclaim_entries_get(job->prl.entries);
+}
+
 static void xe_tlb_inval_job_destroy(struct kref *ref)
 {
 	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
@@ -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_vm *vm = job->vm;
 
+	/* BO creation retains a copy (if used), so no longer needed */
+	if (job->prl.entries)
+		xe_page_reclaim_entries_put(job->prl.entries);
+
 	if (!job->fence_armed)
 		kfree(ifence);
 	else
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
2.52.0

