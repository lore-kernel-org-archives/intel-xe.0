Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FD2C87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB4F10E6F3;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAJexD2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C085910E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=llUqRCJ75elzodjnSJnUzNC692b/7LyJ/1HjIwYf8mI=;
 b=HAJexD2lY7h2CEiPw8WCa9cSoMH+a1ZdRS4IgWxNUwgXmypnpHEKXtkE
 SXxpjEhXkqrfl3BKY1RP73z7jo+aPI41KP3bgVHpq4wUBdUQLBPhW+uwe
 3avDKtNV7rYxJdXti8gEudM35MUF0yjRSOA9nq+MPNaV2toyeYBFvqlSx
 cN6gJsqLNDI6vtsX+GpoFGIr8LYm+k8rfluGyiZdfHd2MZPX1MAngvvgC
 VNmfk8IEZMvxQvSuZSgKQOAgJbnxDnX4p5IEJ/5GXl4kZfeM9RpCKH61g
 bmFp9fhqcQlHWtFXRmro2pkKEMZdlJz6Tpvz30UP4CnYvh9BiiHOO88KX g==;
X-CSE-ConnectionGUID: 014kzWcHTgCBkQa0wLvlwA==
X-CSE-MsgGUID: Am07VqI6TCWGWsEoGSJbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119068"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: EBXcJPp0QROx8SooWkiASg==
X-CSE-MsgGUID: ANgWpUB7T0SxLhBstTgngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641631"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 12/15] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Tue,  5 Aug 2025 16:41:57 -0700
Message-Id: <20250805234200.1035609-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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
- Set ULLS sempahore for current job releasing last job except for first
  ULLS job
- Suppress submit H2G for ULLS except for first ULLS job

v2:
 - Do not set semaphore on first ULLS job

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99baf6b83bd6..e4da4628b8c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -751,7 +751,7 @@ static int wq_items_rebase(struct xe_exec_queue *q)
 }
 
 #define RESUME_PENDING	~0x0ull
-static void submit_exec_queue(struct xe_exec_queue *q)
+static void submit_exec_queue(struct xe_sched_job *job, struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_lrc *lrc = q->lrc[0];
@@ -771,6 +771,11 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
 
+	if (job->is_ulls && !job->is_ulls_first) {
+		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+	}
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -784,13 +789,14 @@ static void submit_exec_queue(struct xe_exec_queue *q)
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
@@ -838,7 +844,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 				register_exec_queue(q, GUC_CONTEXT_NORMAL);
 			if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 				q->ring_ops->emit_job(job);
-			submit_exec_queue(q);
+			submit_exec_queue(job, q);
 		}
 	}
 
@@ -1575,6 +1581,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1590,10 +1597,17 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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

