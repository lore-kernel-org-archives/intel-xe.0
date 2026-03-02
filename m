Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA06E9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E69E10E20B;
	Mon,  2 Mar 2026 09:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNeLHWBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7952910E473
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445031; x=1803981031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+yrNJPkVkI5vNMK9Ks28nzWWMjhzqBuitHv6QI6G4o=;
 b=dNeLHWByuaCVn9MBbVjQ4U47+7hR8twLwx+mT0s9O3/1TR31g+3owSoz
 WT9FwYLekduUhN9wo72xwSEZhHM2jeRwOixX0S+EbOtLVKt5uBzsOEOUh
 AX7+L9QQPDW/I+N2vZnilrJpJanN/UfmP9JmUMPhLb30bsfuJcCvEJo2/
 /wq702DcowMDxCjjeIBCyagWVXr/zDtnCWrOgoTc0MhGYZj76zsX+P4j3
 UrNHMgduHxesnz8Y2VOdBDjMDE1DwJ1a8yDiwQvNw+wrIX/gCsOc/pYxg
 8p9mKRmoTlhw0yGHK0nCSa+fNCOtD72ESQkJFkDhSWE1EfXqg1GXRhlWy g==;
X-CSE-ConnectionGUID: aN1drbzNRPeD1UGcK7X1ew==
X-CSE-MsgGUID: UupLFA4lRUa7UdcGWFUs9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783035"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783035"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:31 -0800
X-CSE-ConnectionGUID: XNB0R3rhRS+2/Tswbt0Shw==
X-CSE-MsgGUID: cCJxNtgTSqmgmhBVuPDQYg==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:28 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 05/11] drm/xe: Skip device access during PCI error recovery
Date: Mon,  2 Mar 2026 15:52:00 +0530
Message-ID: <20260302102155.4074630-18-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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

When a fatal error occurs and the error_detected callback is
invoked the device is inaccessible. The error_detected callback
wedges the device causing the jobs to timeout.

The timedout handler acquires forcewake to dump devcoredump and
triggers a GT reset. Since the device is inacessible this causes
errors. Skip all mmio accesses and gt reset when the device
is in recovery.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 11 ++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.c |  9 +++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..6f41090063bf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -933,18 +933,23 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_device_is_in_recovery(xe))
+		return;
 
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
 		return;
 
+	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
+
 	xe_gt_info(gt, "reset queued\n");
 
 	/* Pair with put in gt_reset_worker() if work is enqueued */
-	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+	xe_pm_runtime_get_noresume(xe);
 	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
-		xe_pm_runtime_put(gt_to_xe(gt));
+		xe_pm_runtime_put(xe);
 }
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ca7aa4f358d0..c25658f1e44b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1508,7 +1508,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
+	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
@@ -1530,8 +1530,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_recovery(xe) && !wedged &&
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1599,7 +1599,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	/* Do not access device if in recovery */
+	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-- 
2.47.1

