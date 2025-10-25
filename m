Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFFBCCD1BF
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 18:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C130B10E0E7;
	Sat, 25 Oct 2025 18:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kag5iL+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BCA10E0E7
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761416022; x=1792952022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oRSYB9GlcoXDJVwkNwcP8u/lcvyckqFofw9SDS27l2E=;
 b=kag5iL+pzv6WLqPXe3ZYe6W7+W2V7tAQrW7w7dCUg31Pz5M2a2E27x8Y
 tM60UBAPTMMbgmbOOpbHSq3xkXJbtz9sK+B7AzlAtFSQG2Wbwk8bfTeLr
 jkmGK5TzF2wb8qO66x8PgN1KeL5OIO735EGMgmQ9Ae3TwrwpsVuZiRzPx
 068tgf8Ds3WFvzPs/aE49DeqY4fJSeqUvewqJT+4ZW8LF2miOezdiq1Dv
 H++iDjmHql0Z4xjUSycYQbn/WF20S3oO/Nx1oBWIAQFz82drCHN+W/4Jp
 H/cZwZa7xd4u8hBHlqZUtGtBgOQmRkcpCnWbJueE7+7dRWm9EBMS96wEs w==;
X-CSE-ConnectionGUID: 7KhG5fd/SNS5FG1DGC8H7Q==
X-CSE-MsgGUID: pdry+BGdRFitpNjFLhEcPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86191385"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; d="scan'208";a="86191385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 11:13:41 -0700
X-CSE-ConnectionGUID: ru9bMhUOQtajUKM34UCctA==
X-CSE-MsgGUID: EsHGl+sHTICPV4hxvvAJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; d="scan'208";a="183904702"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa010.jf.intel.com with ESMTP; 25 Oct 2025 11:13:40 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Limit number of jobs per exec queue
Date: Sat, 25 Oct 2025 18:10:58 +0000
Message-ID: <20251025181057.3081396-2-shuicheng.lin@intel.com>
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

v2 (Matt):
 - add log to trace the limit is hit.
 - Change max count from 0x1000 to 1000.
 - Use atomic_t for job_cnt.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  7 +++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_sched_job.c        |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            | 23 +++++++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 0dc27476832b..05f1b79440c4 100644
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
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 282505fa1377..e26e4a6dd56a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -162,6 +162,11 @@ struct xe_exec_queue {
 	const struct xe_ring_ops *ring_ops;
 	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
+
+#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	1000
+
+	/** @job_cnt: number of drm jobs in this exec queue */
+	atomic_t job_cnt;
 	/**
 	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
 	 * Protected by @vm's resv. Unused if @vm == NULL.
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index d21bf8f26964..f7a68bf4ed8b 100644
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

