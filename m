Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF9FCD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A8D10E83D;
	Mon, 11 May 2026 16:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxt3FIZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547E10E849
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518574; x=1810054574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LopCNf3binVOwp+qeE/CnXJfPY00C6BrCYuAtIrOlWs=;
 b=Cxt3FIZLezDcgZTV9jUAcom4FuzUV8XZ0aKothMNa89oI6q3aLOPpQUa
 GNOY3Swh43dCHBpVcCCw8SG02Ylh2YnFh5+ws3F8uRKmJHSobJi3tcCcf
 QYCjDN3fxbizI6CIEMHv/vjRp3WxMTAHAGKyT7cAFCbGECKCXsdBbsOFx
 GhzOHcNX1I1gDagCFNL6RWVqWnPh4OSKKkmmAyPHi+E2LZWaKEc09WvEO
 DBVbHHunalOR9nFREnk8XGnOFCyG/vjOSwhQ4GfUbIozZ7jr3jE1NxEQM
 R7rRuTvGXAnRA0XcDq5xdd+k38WpXAqqmubFcmvSGwCYwfJUCRIJ1Qr2a g==;
X-CSE-ConnectionGUID: 5DCBiNpISs6TH5V2Ydug/g==
X-CSE-MsgGUID: 0D54ncWpRpSxDIRNeqRkkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513541"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:14 -0700
X-CSE-ConnectionGUID: 09zkCj/oRp+4KHMiQADM5g==
X-CSE-MsgGUID: mWaXf+4jQaimuzN1hL0CsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988736"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 05/14] drm/xe: Skip device access during PCI error recovery
Date: Mon, 11 May 2026 22:59:12 +0530
Message-ID: <20260511172908.1122252-21-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
is in reset.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add check in worker (Mallesh)

v3: add in_reset calls (Raag)
    rename in_recovery to in_reset
---
 drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
 drivers/gpu/drm/xe/xe_pci_error.c    |  2 ++
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 355d69dc8f54..765e90f4220f 100644
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
index ff47d233e8e8..65006491c378 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -480,6 +480,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @in_reset: Indicates if device is in reset */
+	atomic_t in_reset;
+
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cdc678d1ae1f..7b547cf7de52 100644
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
@@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
 
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
index b1222b42174c..288ca26f31cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
@@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_reset(xe) && !wedged &&
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	/* Do not access device if in reset */
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index b392014ff1f6..7d8c36bec7ae 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -22,6 +22,7 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
 	 * Wedge the device to prevent userspace access but don't send the event yet.
 	 * Runtime PM ref is taken by PCI core for the duration of error handling.
 	 */
+	xe_device_set_in_reset(xe);
 	atomic_set(&xe->wedged.flag, 1);
 
 	for_each_gt(gt, xe, id)
@@ -84,6 +85,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
+	xe_device_clear_in_reset(xe);
 	pdev->driver->remove(pdev);
 	devres_release_group(&pdev->dev, xe->devres_group_id);
 
-- 
2.47.1

