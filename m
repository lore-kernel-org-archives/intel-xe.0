Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6524FC54E69
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B624112E29;
	Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXDEw6sv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2FD10F7AB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n3x2Ac/g+w/LcFbRZtcZggbGHsbxlzeCuZ/l5UBXjOQ=;
 b=jXDEw6sv4tdHCSGoiZSDqaRivhxuYVdVzl9MKwsmi1vPdDTcA++UEgnF
 ClxCu9hGQpGk9qeetYWofcBY5kbLsz9oBKrSOXLxLqhsQplVzDuja9Vzf
 vwZnUNBAl+YNBXFahM+6Wm9lWZ5NmhGwolAgAnrHE3O2roLsu0h54yc0a
 0y5O504MVdU90XuIBO3KAcfhnSicnU+iB3jJwwEkZDbv6RVBTpIi5tJG9
 c7Iwa+q7ug+324Qsc9mdaowTsUrMPZoshZ0NZ+n3+V+aMHZW79wzIOGW5
 2OYs/aK2pODA8OnmRWjsRjLq63SL8oBMFfPi0pHly0lYmwIbvSoSD9hyD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761984"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403055"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 29/30] drm/xe/guc: Assert time'd out jobs are not from a VM
 exec queue
Date: Thu,  7 Mar 2024 21:08:05 -0800
Message-Id: <20240308050806.577176-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

With CPU binds jobs cannot timeout, assert this is not happening.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 09775b1044f4..c5a88a039afd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -962,6 +962,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	int i = 0;
 
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled.
@@ -976,8 +978,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		   xe_sched_job_seqno(job), q->guc->id, q->flags);
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
 		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
 
 	simple_error_capture(q);
 	xe_devcoredump(job);
@@ -991,8 +991,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
+	if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
-- 
2.34.1

