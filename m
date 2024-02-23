Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911EBC54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 20:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97B10EABF;
	Fri, 23 Feb 2024 20:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y36X8F2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B856B10EABF
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708721211; x=1740257211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TemFL3vyvw00vJPHDvbGTGG89GxskR2K9tukPE/A4EI=;
 b=Y36X8F2NY99bmG/H0//XdYrILNeElP1yiLB4X5NpY5B1dD7xHAvK8xKz
 TaOUXJw7ut08yZgZRy3TWZaZqS4HnyPFOr3C0pJKg3/bsnS8PngxJxoyZ
 AW33qLTuOy62HY1mtUgsmiDFVxDvkeV17qZXDRWcxf9afFvctjcdRuD8y
 5wj+qPcNsgXq6FsfjHLRJaaV+zc9qnFXPj3Wo7eUaC57J09/OPdirM/dS
 d9dxfP3FO8J9wpnlvnJ3ga08TJN6Z4q1M4pamyM4VCd5Af+TG6OKmwXk8
 T8SdMIJnEg99QDMkWrZC9+SqPY51eHAgOVSE3ubZg7du+d4h7m/4PB4R/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="28492844"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="28492844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6382725"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:46:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe/guc: Handle timing out of signaled jobs gracefully
Date: Fri, 23 Feb 2024 12:46:59 -0800
Message-Id: <20240223204659.40750-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Timing out of signaled jobs can happen during regular operations (e.g.
an exec queue closed immediately after last fence signaled). The TDR can
pass the worker which free jobs. Rather than running through the TDR if
signaled job is found, simply free it without any debug messages.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reported-by: José Roberto de Souza <jose.souza@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1271
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 32 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ff77bc8da1b2..29748e40555f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -929,20 +929,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	int i = 0;
 
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
-			   xe_sched_job_seqno(job), q->guc->id, q->flags);
-		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
-			   "Kernel-submitted job timed out\n");
-		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-			   "VM job timed out on non-killed execqueue\n");
-
-		simple_error_capture(q);
-		xe_devcoredump(job);
-	} else {
-		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
-			 xe_sched_job_seqno(job), q->guc->id, q->flags);
+	/*
+	 * TDR has fired before free job worker. Common if exec queue
+	 * immediately closed after last fence signaled.
+	 */
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
+		guc_exec_queue_free_job(drm_job);
+
+		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
+
+	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
+		   xe_sched_job_seqno(job), q->guc->id, q->flags);
+	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+		   "Kernel-submitted job timed out\n");
+	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
+		   "VM job timed out on non-killed execqueue\n");
+
+	simple_error_capture(q);
+	xe_devcoredump(job);
+
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
-- 
2.34.1

