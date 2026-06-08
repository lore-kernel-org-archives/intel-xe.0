Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164B3CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272310EF83;
	Mon,  8 Jun 2026 08:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd9ioJVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3D10EF89
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908458; x=1812444458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SgyogUG5B5jB9zPAYWP0rbdfHYaMpR739to8jIT+fZI=;
 b=Sd9ioJVDVD8YIhsqTGk/oeizb93gxRYuxOveALisGqDUDNp0t1K2cz4m
 Bvdp/FgrkwDUpWcnVBU6lkgyR4iUjv3qg6N3z2GDAce7q28bNGixuGZ3N
 ZDcZg67jyEWhHhQPVItGYG3aQq3Kvm83CBrQETdzQIOWfuf7ozU/X5foV
 PNjJAHV/cTZt2cz8PamogrXrfBMfegiyh9XhW/6h+lBR246l3as1GWZQC
 yrXjrDqB/iArCM46iFdzwUUiQbKRwhfY6PGLbO60HnMGL+kqv/RmJOfzs
 JSG0JmRE8hvKxQKCvut9LT6pxwdRiu720a1UZXIQGCVUEBto9wF8yKbQW A==;
X-CSE-ConnectionGUID: LpTL+t/NRqSQAPl2wS9Gcw==
X-CSE-MsgGUID: Rkk2lDVDS7mSqFI4l8xKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029079"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:37 -0700
X-CSE-ConnectionGUID: PxFu0h3xT1m0VJOz1CSVkQ==
X-CSE-MsgGUID: DnajDrN2QCWwab3QMXSE5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466082"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 06/15] drm/xe: Skip device access during PCI error recovery
Date: Mon,  8 Jun 2026 14:17:07 +0530
Message-ID: <20260608084700.640376-23-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
index 3e536a49388a..e177c05a7a95 100644
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
index 943e4796bdf1..bf43a3277d1e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -483,6 +483,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @in_reset: Indicates if device is in reset */
+	atomic_t in_reset;
+
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
 		/** @wedged.fini: Needs cleanup on fini */
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
index 4b247a3019d2..b2870d7ab8ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1511,7 +1511,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
 	 */
-	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
 	    !xe_guc_capture_get_matching_and_lock(q)) {
 		/* take force wake before engine register manual capture */
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
@@ -1533,8 +1533,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(primary) ||
-			exec_queue_pending_disable(primary))) {
+	if (!xe_device_is_in_reset(xe) && !wedged &&
+	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
 		int ret;
 
 		if (exec_queue_reset(primary))
@@ -1602,7 +1602,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	/* Do not access device if in reset */
+	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 4bf9ebbb1e96..ab17418aa164 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -17,6 +17,8 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_device_set_in_reset(xe);
+
 	/* Wedge the device to prevent userspace access during reset */
 	xe_device_wedged_get(xe);
 
@@ -82,6 +84,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
+	xe_device_clear_in_reset(xe);
 	pdev->driver->remove(pdev);
 	devres_release_group(&pdev->dev, xe->devres_group_id);
 
-- 
2.47.1

