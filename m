Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9E7C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 08:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9F10E76B;
	Mon, 29 Jun 2026 08:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+MusTkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C01710E76B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782721711; x=1814257711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yF1dQA3VFWbRv6sij0/bXBq4PerUKZOoMwj3Ffjv+c=;
 b=i+MusTkMJPcsVbETVlRzKTf8CzB5bc42vG1ok0XkE3NVJclZvxj69rl/
 lDbvBXmAknexsVXUZ2VF5TncvS5897yohYu2EQcUEueNB/m3m90GaPg5R
 Rq+Xm5HCzlhVBBbkeiIkWoih0kU1/oNTHAm/YEX0V37I8f0uBNCAVfrSm
 yin14xCTCZmd4jYpCtm2lR2McvT+0dCfH+hR7lOXb9FByH2OFoVCmWFdV
 w+/LAc17PHzu2BLtY7T3n5H3GQ0vPDgyZCHaUFn5wK343Qo1XksGio2VU
 Llcc3hnfGjiC59xrswA0iE11vrqkRJFNOyV76kHqkC4xORFoFm4N3mCqX g==;
X-CSE-ConnectionGUID: rzh2Zrc3TuyywCqMGu7jOQ==
X-CSE-MsgGUID: 8TN0xvOxRGSaQi2Yh2ZE7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82398898"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="82398898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:30 -0700
X-CSE-ConnectionGUID: 6hxSTQTfRX2WRR08M153tA==
X-CSE-MsgGUID: MIbRFZ3ERXOzfehSd2ytew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281980297"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v9 3/4] drm/xe: Skip device access during PCI error recovery
Date: Mon, 29 Jun 2026 13:58:05 +0530
Message-ID: <20260629082802.3690896-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260629082802.3690896-6-riana.tauro@intel.com>
References: <20260629082802.3690896-6-riana.tauro@intel.com>
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
triggers a GT reset. Since the device is inaccessible this causes
errors. Skip all mmio accesses and gt reset when the device
is in reset.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: add check in worker (Mallesh)

v3: add in_reset calls (Raag)
    rename in_recovery to in_reset

v4: fix typo
    combine gt reset log (Mallesh)
---
 drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
 drivers/gpu/drm/xe/xe_pci_error.c    |  3 +++
 5 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..913b65f49174 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const struct xe_device *xe)
 	return xe->info.has_mert;
 }
 
+static inline bool xe_device_is_in_reset(struct xe_device *xe)
+{
+	return atomic_read(&xe->in_reset);
+}
+
+static inline void xe_device_set_in_reset(struct xe_device *xe)
+{
+	atomic_set(&xe->in_reset, 1);
+}
+
+static inline void xe_device_clear_in_reset(struct xe_device *xe)
+{
+	atomic_set(&xe->in_reset, 0);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bd94d493dfaf..fde718a3df52 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,6 +485,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @in_reset: Indicates if device is in reset */
+	atomic_t in_reset;
+
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 783eb6d631b5..d904527a8898 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
 	if (xe_device_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
 
+	if (xe_device_is_in_reset(gt_to_xe(gt)))
+		goto err_pm_put;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		goto err_pm_put;
@@ -977,18 +980,21 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_device_is_in_reset(xe))
+		return;
 
 	/* Don't do a reset while one is already in flight */
 	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
 		return;
 
-	xe_gt_info(gt, "reset queued\n");
+	xe_gt_info(gt, "reset queued from %ps\n", __builtin_return_address(0));
 
 	/* Pair with put in gt_reset_worker() if work is enqueued */
-	xe_pm_runtime_get_noresume(gt_to_xe(gt));
+	xe_pm_runtime_get_noresume(xe);
 	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
-		xe_pm_runtime_put(gt_to_xe(gt));
+		xe_pm_runtime_put(xe);
 }
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9458bf477fa6..12416bfa3255 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1532,7 +1532,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
@@ -1554,8 +1554,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_reset(xe) && !wedged &&
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1623,7 +1623,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	/* Do not access device if in reset */
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 41d77ed14d76..79ee3a522cf4 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -26,6 +26,8 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	if (!atomic_xchg(&xe->wedged.flag, 1))
 		xe_pm_runtime_get_noresume(xe);
 
+	xe_device_set_in_reset(xe);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
@@ -88,6 +90,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
+	xe_device_clear_in_reset(xe);
 	pdev->driver->remove(pdev);
 	devres_release_group(&pdev->dev, xe->devres_group);
 
-- 
2.47.1

