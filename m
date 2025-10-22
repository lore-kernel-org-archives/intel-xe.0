Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26124CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 18:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABDE10E175;
	Wed, 22 Oct 2025 18:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct14FG9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DF510E175
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 18:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761156820; x=1792692820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H6Cf+P8YwCPWTv1uuvDH2agqfGAacdHWTxsVVA1omFs=;
 b=Ct14FG9qmacg67rMrPUJcUMvNJXF1vxeOUuc45aKIh2lj5npaRLqtdCC
 d22X3c0ViFQ1tnDodUBQw5wU5ktiluG4iJg//WKQsgrCrCYwbRlT9G7Rk
 Xqcr6i+HN/3pVSApiqaPLFcRYZYRrfTwD5DClNhzq4ehshZ84pzsJvBN6
 yoZVpnTt18C5R9MHbqLPbx4PYdARz9gOx1NKHZA5G3cwh4zOcCUYOtzE3
 ZP0Int9eDiO0TrCGidaoie90C0nvFjf9IIIRUAOiQgOkNE0NwO8B50pn+
 gWy1yx9CpvY7BDrhkhLO/ECsIHf3x61sYnZzk5bZeeyHW4WukxFt7IiZW g==;
X-CSE-ConnectionGUID: kM8L8IcNTpm9hLhKlW7SOg==
X-CSE-MsgGUID: 0L9pkO29QW6f0ZIGsIe44A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66958827"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="66958827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:13:38 -0700
X-CSE-ConnectionGUID: UbJsM9J1Q2KngButabzmpQ==
X-CSE-MsgGUID: wZVLplReRyKaPzx/ku8BzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183530127"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 11:13:38 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Limit number of jobs per exec queue
Date: Wed, 22 Oct 2025 18:10:37 +0000
Message-ID: <20251022181036.2868787-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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
`XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 0x1000.

If the job count exceeds this threshold, `xe_exec_ioctl()` now
returns `-EAGAIN` to signal that the caller should retry later.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             | 5 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_sched_job.c        | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 0dc27476832b..722a5ac0200a 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -154,6 +154,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec_queue;
 	}
 
+	if (q->job_cnt >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
+		err = -EAGAIN;
+		goto err_exec_queue;
+	}
+
 	if (args->num_syncs) {
 		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 282505fa1377..5f3219acec3c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -162,6 +162,11 @@ struct xe_exec_queue {
 	const struct xe_ring_ops *ring_ops;
 	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
+
+#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	0x1000
+
+	/** @job_cnt: number of drm jobs in this exec queue */
+	u32 job_cnt;
 	/**
 	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
 	 * Protected by @vm's resv. Unused if @vm == NULL.
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index d21bf8f26964..37f58be7cbcc 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->ptrs[i].batch_addr = batch_addr[i];
 
+	q->job_cnt++;
 	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
@@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	q->job_cnt--;
 	xe_exec_queue_put(q);
 	xe_pm_runtime_put(xe);
 }
-- 
2.49.0

