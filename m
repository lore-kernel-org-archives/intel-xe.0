Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC773CCD18F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384110E405;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icDi4qmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984B010E307
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747494; x=1791283494;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i2xkUna9JH/tDTFs8r8ElzzKu5SYgF7fjPV8VyOmoEc=;
 b=icDi4qmWwlQueGiqv9oNZJSXycBcBKILtccibPcs5vUDib3Zmj34ZsN2
 5COO2EP52+yWlf3rsh7rkioXNlP5g2C8Qtbuz8j//6hkaPzOyKcDHFVSN
 WmP60wVgR7t7biVVSDlWPjwL5YWrT4R88Vvss+HTL0q4xQtFpgrhhKjuF
 2pYuw7OwunDaM35XmcSXd1r+Y/MX6ZBp4wGUcwfQmy/QgeT9ZV2FRozzV
 sPw3r5UueaK78NWM8rKYxn8WUaaMoA1O4Xlxcy6QBKIghzMezCTWTxso0
 Uj43ZfcpSfd18/5aYGNgMUa9Q/E9bLkjKtPUwt+fDnQBf2sRVGiiS4OfK A==;
X-CSE-ConnectionGUID: qbirtHhBT96hrnDvWHQE6w==
X-CSE-MsgGUID: p6iDAR9jTyK83uUCdRs52A==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546342"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:54 -0700
X-CSE-ConnectionGUID: +sEJxzGFQJqEY35Adjj3GA==
X-CSE-MsgGUID: cQtbM/AqQO285U7DpF/wTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589343"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 28/30] drm/xe/vf: Ensure media GT VF recovery runs after
 primary GT on PTL
Date: Mon,  6 Oct 2025 03:44:43 -0700
Message-Id: <20251006104445.2210624-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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
index bf1806e90370..d43e18bb8f01 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1112,8 +1112,22 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
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
@@ -1121,6 +1135,8 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
+
+	return false;
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
@@ -1195,11 +1211,14 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
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
@@ -1227,6 +1246,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
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

