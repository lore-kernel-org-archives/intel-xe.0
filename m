Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FFBD49237
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A7110E96D;
	Fri, 12 Dec 2025 21:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsWD+kT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640D610E96D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575159; x=1797111159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60KMZKx5cbGoMPH5UuRAev8/Mr4bQNuNyyPyGAMpHgM=;
 b=DsWD+kT0CtOMODSKWM07LJj+HXaquIaGVRXv4feSQeH8y0WpNJnLzM95
 PEteE5A1iegZG1ko9L8169shHLc6nFXq/tYYQQoCat7QrSj24Pxz4MB2C
 iMdDLZ9vWgXmcnaZk5Qc4aH4An1Hg52le410Fof1i6w477QQ5ONShj5Z6
 MQTgH6pdga1QQoFWlTB4Xuf3A81qR1sAkeHmDmf/xn2Hfr0SgdPgc3xxW
 4CaeP9wUrPGgPO47o651qC5vDDqa27cnctIQLVLwnz41TpA25iAzPFuZq
 Smlx4BWuF0xsJm9L05aKMRtaQgKZqD2WIKtRRMVWWJuA+E3TECYYbOCdP A==;
X-CSE-ConnectionGUID: 2ioc7AUiR+Gvr/KWAUl5yA==
X-CSE-MsgGUID: YcrZYjDHSCS7KeI0gB069g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541897"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:39 -0800
X-CSE-ConnectionGUID: uP0bnfkJSMKalfBaQ7dKRw==
X-CSE-MsgGUID: qf8v9so0QQWRSdA/oymA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244700"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:37 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 07/10] drm/xe: Prep page reclaim in tlb inval job
Date: Sat, 13 Dec 2025 05:32:33 +0800
Message-ID: <20251212213225.3564537-19-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

v3:
 - Add comments for PRL tile handling and flush behavior with media.
   (Matthew Brost)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c            | 11 +++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ac17d5702030..6e01675213c7 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2512,6 +2512,17 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			goto kill_vm_tile1;
 		}
 		update.ijob = ijob;
+		/*
+		 * Only add page reclaim for the primary GT. Media GT does not have
+		 * any PPC to flush, so enabling the PPC flush bit for media is
+		 * effectively a NOP and provides no performance benefit nor
+		 * interfere with primary GT.
+		 */
+		if (xe_page_reclaim_list_valid(&pt_update_ops->prl)) {
+			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
+			/* Release ref from alloc, job will now handle it */
+			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
+		}
 
 		if (tile->media_gt) {
 			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 78e39a4fb264..fc5b4a32a32d 100644
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
+	/* Pair with put in job_destroy */
+	xe_page_reclaim_entries_get(job->prl.entries);
+}
+
 static void xe_tlb_inval_job_destroy(struct kref *ref)
 {
 	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
@@ -159,6 +181,9 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_vm *vm = job->vm;
 
+	/* BO creation retains a copy (if used), so no longer needed */
+	xe_page_reclaim_entries_put(job->prl.entries);
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

