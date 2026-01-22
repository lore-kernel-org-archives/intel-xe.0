Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F738C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B2A10E96B;
	Thu, 22 Jan 2026 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmSkR5Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DB110E96B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074560; x=1800610560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3PMGoEsPEvZY2mZ+DBTPNH6bHXPl/Bq35LnBC+jP/Yo=;
 b=JmSkR5Ft7Hp9uBpNUCg27h6mr7If9aZ34uvUdqSQKtD6c1ZDyKS+fsC9
 QXppc2eESaiFADyUozvcugz09ngNCaIJcMGV149pDXrrwru6X04AkfNvN
 gJQC8ZiQPB04bo4Fhp4safXBpHloRmKvo4mlYkeozydRr0XhAeyI8ibna
 ZHk638nysI721xne4YC7c5o7MPavunTL395uzw5gyi57atrEAc9FoELP4
 paCzT7UiYCABqle+vKoWGGqwEU/t6KR2MnhLsgmHdzmjH/v9tpuYzU3AF
 bWK3JYaVOQgKQKPr+FZzUETB5mmeoou2vbffn8d03BVJ5DOTkvC0n2rwY w==;
X-CSE-ConnectionGUID: /tjUSTP4RfCjLYninhdF/w==
X-CSE-MsgGUID: SXU+ejMzTkunCRuqRZFjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937751"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:00 -0800
X-CSE-ConnectionGUID: sVnxVtOURve9ikbf7t7qbg==
X-CSE-MsgGUID: F6MGVPZ6TfiDgJvZuXUleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122785"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:35:57 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 4/8] drm/xe: Skip device access during PCI error recovery
Date: Thu, 22 Jan 2026 15:36:16 +0530
Message-ID: <20260122100613.3631582-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c     | 2 +-
 drivers/gpu/drm/xe/xe_gt.c         | 9 +++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0cf6480b8aad..f418ebf04f0f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1332,7 +1332,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
+	if (!xe_device_is_in_recovery(xe) && xe_device_wedged(xe)) {
 		/* If no wedge recovery method is set, use default */
 		if (!xe->wedged.method)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9d090d0f2438..9a639223e31c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -890,8 +890,13 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
 
+	if (xe_device_is_in_recovery(xe))
+		return;
+
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
 		return;
@@ -899,9 +904,9 @@ void xe_gt_reset_async(struct xe_gt *gt)
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
index 456f549c16f6..967552c39de0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1526,7 +1526,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
+	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
@@ -1548,8 +1548,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_recovery(xe) && !wedged &&
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1617,7 +1617,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-- 
2.47.1

