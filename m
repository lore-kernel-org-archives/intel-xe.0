Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69632CCD1A4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A1110E8A9;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTkMT/kW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A5110E891
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946710; x=1791482710;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DTpppC1hWYBaezmQlDF1p0yHvH19fttXN6mfbbO3b9A=;
 b=VTkMT/kWdue1j1v3Hj8uzalFku9uzgMSDJ8MqQSi3Jf9FukXjwJSXliA
 MfljoC4OgyqKmTkPh3dAibGTvKL7Pq+suyUPpQA+xTgzgfBsnsHtFg917
 UCBfXrQtplpF++mo9z/R4yqnnu1BnRh9OBWjdt+4G24aG1ewtAcVFn17X
 s29oQYSj1gz7d4wyo1H93hGOoEY5UbgvMgpXRfn2MZLlAw408CGVh6qZB
 P5x7My36atFeV4wKTaMIFrENo+clOj/q3FljKzYPTTHsaWPMyLmASwS4g
 Wpt3i3+JUow6zI5wP7WdnB1uIXK4wIR2h1hfnJ4ucL/cp1yCoukyR5bKn g==;
X-CSE-ConnectionGUID: 9PNoGgcAQjiIGj1A5d+btg==
X-CSE-MsgGUID: SsHkxmHQQh6koD5zvhIIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067542"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067542"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: q+Mn0AJ4QuCsfv+VWgwjKA==
X-CSE-MsgGUID: bK4MGBbhQzmx1Pjvl7BHWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593750"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 32/34] drm/xe/vf: Ensure media GT VF recovery runs after
 primary GT on PTL
Date: Wed,  8 Oct 2025 11:04:58 -0700
Message-Id: <20251008180500.3261209-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

It is possible that the media GT's VF post-migration recovery work item
gets scheduled before the primary GT's work item. Since the media GT
depends on the primary GT's work item to complete CCS restore, if the
media GT's work item is scheduled first, detect this condition and
re-queue the media GT's work item for a later time.

v5:
 - Adjust debug message (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index b9988e227a25..47a87a7126cc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1100,8 +1100,22 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 		   pf_version->major, pf_version->minor);
 }
 
-static void vf_post_migration_shutdown(struct xe_gt *gt)
+static bool vf_post_migration_shutdown(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/*
+	 * On platforms where CCS must be restored by the primary GT, the media
+	 * GT's VF post-migration recovery must run afterward. Detect this case
+	 * and re-queue the media GT's restore work item if necessary.
+	 */
+	if (xe->info.needs_shared_vf_gt_wq && xe_gt_is_media_type(gt)) {
+		struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
+
+		if (xe_gt_sriov_vf_recovery_pending(primary_gt))
+			return true;
+	}
+
 	spin_lock_irq(&gt->sriov.vf.migration.lock);
 	gt->sriov.vf.migration.recovery_queued = false;
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
@@ -1109,6 +1123,8 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
+
+	return false;
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
@@ -1186,11 +1202,14 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
+	bool retry;
 
 	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
 
 	xe_pm_runtime_get(xe);
-	vf_post_migration_shutdown(gt);
+	retry = vf_post_migration_shutdown(gt);
+	if (retry)
+		goto queue;
 
 	if (!xe_sriov_vf_migration_supported(xe)) {
 		xe_gt_sriov_err(gt, "migration is not supported\n");
@@ -1218,6 +1237,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
+	return;
+
+queue:
+	xe_gt_sriov_info(gt, "Re-queuing migration recovery\n");
+	queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
+	xe_pm_runtime_put(xe);
 }
 
 static void migration_worker_func(struct work_struct *w)
-- 
2.34.1

