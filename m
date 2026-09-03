Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACB8C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DEA10F7F5;
	Thu,  3 Sep 2026 23:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqRvwpkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0626B10F7E8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ic9s6mNoJFXioPYgZCgz5bN7h1kIG//EkMGnKGPeS2U=;
 b=gqRvwpkv3grzA/I/+qWbFLTDI/mpMucUCHP93oQml9q2rXNV2OJWlVfJ
 WYrGlYPFWk+D/83zQSpCcTPlnI0HLK2EzDWJsppAOSDMubdSxE5H3WWa6
 /2rfk7wlnQuxHfwmklIjULGQ6AnNOqopVbFgwtu0yPykBdzGPumlC9gTS
 aoOA3ZrbXIhYLsbmJdWs8477vIGL+bZaVKyEUoSIZQyv2+tkD0vmwcB+O
 ZJ2puVKRZrN+5BlQF/cDlXFhRWjOR/Htnwlfxdf2LrD+S1cUaE5A4QCOx
 Jyj55JP3UGyFnqTIHsHzaXrlfWZ7gVJvXakaThdFNGmO4aAQB4oGxbAq6 w==;
X-CSE-ConnectionGUID: 7kcerZk6Qe68Fv4E3yFhVQ==
X-CSE-MsgGUID: CI9sU/yWTmqc7nVUfb850Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637822"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: hAxUtWBlRnOu5PMSCzuijA==
X-CSE-MsgGUID: 4SUGNaG7Q/OoHm6znrIneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029064"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 22/25] drm/xe: Add ULLS migration job support to GuC
 submission
Date: Thu,  3 Sep 2026 16:58:39 -0700
Message-Id: <20260903235842.3401722-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index dcb4b8a4f3b7..1578d80b01b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1207,6 +1207,11 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (exec_queue_suspended(q))
 		return;
 
+	if (job->is_ulls && !job->is_ulls_first) {
+		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+	}
+
 	if (!exec_queue_enabled(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1220,13 +1225,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
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
@@ -2088,6 +2094,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -2127,8 +2134,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		submit_wq = primary->guc->sched.base.submit_wq;
 	}
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION)
+		max_jobs = min(max_jobs, LRC_MIGRATION_ULLS_SEMAPHORE_COUNT - 1);
+
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    ge->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.34.1

