Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93D6CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B79810E17D;
	Mon, 27 Oct 2025 20:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfOMi+uN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490610E17D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761596608; x=1793132608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3X23RkxBSCa4LQ2hOWzhuoyKdJtFTWjjLD7UIUdp0nc=;
 b=WfOMi+uNg4AyVp3VtUdsw3YLN6X1EVsYOUim6MHMN2rmv7t/PjBwrile
 ue4EHEWGpbZUVGJbI3p6XazJg3QVOwj8vrYtyFJyYNTF2JqTvr2iQE4OH
 rQ+lXrl6m4qVVj0VHvL55WUIf2xSksmU6yZ9fRmpZXBfmvXn1n6b6OZQL
 iKtHHhhafdEK5wpRGyyBZScve5iPOx4p+dJs1VBhW51ETuemflNgXBBY/
 zjEdc65p2kR+wm9Nrzm2maylNP3lY4pXmCFq7uheWBZNrzu73kO6F8dWh
 71qv031wiQudMhJaBK7OwMHAftxb+8dSabpJMhxkTvmACRM3dOC/71fUR A==;
X-CSE-ConnectionGUID: qnlWmECISVCprmymROEtZg==
X-CSE-MsgGUID: 60NHoyJuSTuYCe7OSPMnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62894142"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62894142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:23:27 -0700
X-CSE-ConnectionGUID: qGzIzW65TNipKqPignkdFw==
X-CSE-MsgGUID: LQC9X9DQRFqf/BGMG1mNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184767492"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 13:23:26 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe: Limit number of jobs per exec queue
Date: Mon, 27 Oct 2025 20:21:19 +0000
Message-ID: <20251027202118.3339905-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251022181036.2868787-2-shuicheng.lin@intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
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

Add a limit to the number of jobs that can be queued in a single
exec queue to avoid potential resource exhaustion.

A new field `job_cnt` is introduced in `struct xe_exec_queue` to
track the number of active DRM jobs, along with a maximum limit
`XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 1000.

If the job count exceeds this threshold, `xe_exec_ioctl()` now
returns `-EAGAIN` to signal that the caller should retry later.

A trace event is added to track when the limit is reached:
"xe_exec_queue_reach_max_job_count: dev=0000:03:00.0, job count
exceeded the maximum limit (1000) per exec queue. engine_class=0x3,
logical_mask=0x1, guc_id=2"

v3: add assert in xe_exec_queue_destroy that q->job_cnt is zero. (Matt)
v2 (Matt):
 - add log to trace the limit is hit.
 - Change max count from 0x1000 to 1000.
 - Use atomic_t for job_cnt.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  7 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_sched_job.c        |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            | 23 +++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 521467d976f7..f4d79b4b9396 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -21,6 +21,7 @@
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_svm.h"
+#include "xe_trace.h"
 #include "xe_vm.h"
 
 /**
@@ -154,6 +155,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec_queue;
 	}
 
+	if (atomic_read(&q->job_cnt) >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
+		trace_xe_exec_queue_reach_max_job_count(q, XE_MAX_JOB_COUNT_PER_EXEC_QUEUE);
+		err = -EAGAIN;
+		goto err_exec_queue;
+	}
+
 	if (args->num_syncs) {
 		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..1b57d7c2cc94 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -377,6 +377,8 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
+
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 282505fa1377..c8807268ec6c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -162,6 +162,11 @@ struct xe_exec_queue {
 	const struct xe_ring_ops *ring_ops;
 	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
+
+#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	1000
+	/** @job_cnt: number of drm jobs in this exec queue */
+	atomic_t job_cnt;
+
 	/**
 	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
 	 * Protected by @vm's resv. Unused if @vm == NULL.
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 6ae4cc6a3802..f1ba9c19e218 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->ptrs[i].batch_addr = batch_addr[i];
 
+	atomic_inc(&q->job_cnt);
 	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
@@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	atomic_dec(&q->job_cnt);
 	xe_exec_queue_put(q);
 	xe_pm_runtime_put(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 314f42fcbcbd..79a97b086cb2 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -441,6 +441,29 @@ TRACE_EVENT(xe_eu_stall_data_read,
 		      __entry->read_size, __entry->total_size)
 );
 
+TRACE_EVENT(xe_exec_queue_reach_max_job_count,
+	    TP_PROTO(struct xe_exec_queue *q, int max_cnt),
+	    TP_ARGS(q, max_cnt),
+
+	    TP_STRUCT__entry(__string(dev, __dev_name_eq(q))
+			     __field(enum xe_engine_class, class)
+			     __field(u32, logical_mask)
+			     __field(u16, guc_id)
+			     __field(int, max_cnt)
+			     ),
+
+	    TP_fast_assign(__assign_str(dev);
+			   __entry->class = q->class;
+			   __entry->logical_mask = q->logical_mask;
+			   __entry->guc_id = q->guc->id;
+			   __entry->max_cnt = max_cnt;
+			   ),
+
+	    TP_printk("dev=%s, job count exceeded the maximum limit (%d) per exec queue. engine_class=0x%x, logical_mask=0x%x, guc_id=%d",
+		      __get_str(dev), __entry->max_cnt,
+		      __entry->class, __entry->logical_mask, __entry->guc_id)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.49.0

