Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D66CC67861
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AFB10E958;
	Thu,  5 Jun 2025 15:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOykbTmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B4C10E8AB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xu4QfgisHSZUTQvfy8/i4QK6ygR1IawZHpfMRLeaQJ0=;
 b=IOykbTmCeXdOvuWw/6sdW8OyV1h+MhzerXiIKOCAT4GlJ5arMyU1HDw8
 N4Lb99k7aFrx6KBBPreRflqtfENC0bxHsBA046+jc49BvEi7/Jm6jGN+m
 VnoWFYcl1J5sU3gl2GmWDj3vhGkrlpp6K5TX7RbpnFxLxbgwwMjBVEtlZ
 17zHT8KXfZnQ7I/cYnEBaiDo+Xj+FfFYVJYkFkpRmAQf5M/4LAKLwZrex
 FUwcQoy2XDncRhzGLe1TC3x3U9U1B1StBmcahFgLoz2VlOQIFr8l5L88v
 lsBQfelwNpExJ20DBAHzHZCihdGmMODmm8HDqR1BwzTXLhEdLP7iozg9K Q==;
X-CSE-ConnectionGUID: yR8MhYUjTj6ZYQJmpOEgqQ==
X-CSE-MsgGUID: m6LHeTHCRlCoK73u1DK6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529493"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: BJ9Y9U8ESB+y74bx3VmwxA==
X-CSE-MsgGUID: XmMtzqAHQ3W92PwwpeDp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502822"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 11/15] drm/xe: Add ULLS migration job support to GuC submission
Date: Thu,  5 Jun 2025 08:32:19 -0700
Message-Id: <20250605153223.2789122-12-matthew.brost@intel.com>
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

Add ULLS migration job support to GuC submission backend.

Changes required:
- On migration queue, reduce max jobs to the number of ULLS semaphores
  minus one
- Directly set the hardware engine tail via a MMIO write for ULLS jobs
  except for first ULLS job
- Set ULLS sempahore for current job releasing last job
- Suppress submit H2G for ULLS except for first ULLS job

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 551cd21a6465..f67dfdb69637 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -697,7 +697,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 }
 
 #define RESUME_PENDING	~0x0ull
-static void submit_exec_queue(struct xe_exec_queue *q)
+static void submit_exec_queue(struct xe_sched_job *job, struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_lrc *lrc = q->lrc[0];
@@ -717,6 +717,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
 
+	if (job->is_ulls) {
+		if (!job->is_ulls_first)
+			xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+	}
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -730,13 +737,14 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 		set_exec_queue_pending_enable(q);
 		set_exec_queue_enabled(q);
 		trace_xe_exec_queue_scheduling_enable(q);
-	} else {
+	} else if (!job->is_ulls || job->is_ulls_first) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT;
 		action[len++] = q->guc->id;
 		trace_xe_exec_queue_submit(q);
 	}
 
-	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
+	if (!job->is_ulls || job->is_ulls_first || num_g2h)
+		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
 
 	if (extra_submit) {
 		len = 0;
@@ -784,7 +792,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 				register_exec_queue(q);
 			if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 				q->ring_ops->emit_job(job);
-			submit_exec_queue(q);
+			submit_exec_queue(job, q);
 		}
 	}
 
@@ -1497,6 +1505,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1511,10 +1520,17 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
 		INIT_LIST_HEAD(&ge->static_msgs[i].link);
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION) {
+		xe_assert(guc_to_xe(guc),
+			  LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1 < max_jobs);
+
+		max_jobs = LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1;
+	}
+
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.34.1

