Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C91048928
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412B10E1E7;
	Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adjcZRc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDB410EC52
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242515; x=1803778515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSYbo3bvu8hBUtRLtLhZZTkFKxVPAbmSMW7f9hOwpaM=;
 b=adjcZRc4m+sAY+zFv5NlZsElR/QoE8ioQPF4IiMaf0Tszt8IpfK7ImVG
 d4CJFckZ1vhmAvChFirNBBZK1V+xoysluus2oqX0VQbZ34qus5BmCouDL
 MiY/tiV9rWVc7v9t9BmttbS6OYx4yDAMB2u46chLfb6zj5ZmSaH3ZIssO
 yWlrIGvX2fvHEdKC4qtiq+OFH8qqYBdzF9QvXt5O3s5QsJHc9db7eC7aU
 +c3GIZIP5ouhTtVnK19ByClgytgaI7xPVMJ3e7QNos/Dx6sidNhkEH/Oz
 NmNeXAFQ9vtoAmI2z92RAXJkJdVYXo9RjfOm5IhLSWVWSSEX8/wbZdAJW w==;
X-CSE-ConnectionGUID: A8v/W++ATyuLppxrYRRRtg==
X-CSE-MsgGUID: qbI/ETSeSGiul1sr8HMAYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966362"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
X-CSE-ConnectionGUID: GCh8GmcTTHCz7nVPAeFW0w==
X-CSE-MsgGUID: MB1QKRgITYWiogLUS2690w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854905"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 23/25] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Fri, 27 Feb 2026 17:34:59 -0800
Message-Id: <20260228013501.106680-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f7b56a1eaed4..db096bfb640c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1154,6 +1154,11 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	 */
 	q = xe_exec_queue_multi_queue_primary(q);
 
+	if (job->is_ulls && !job->is_ulls_first) {
+		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+	}
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1167,13 +1172,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -2000,6 +2006,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -2029,8 +2036,15 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		submit_wq = primary->guc->sched.base.submit_wq;
 	}
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION) {
+		xe_assert(guc_to_xe(guc),
+			  LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1 < max_jobs);
+
+		max_jobs = LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1;
+	}
+
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.34.1

