Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D8FCCD187
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC03D10E407;
	Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfEh25um";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567A810E366
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749045; x=1791285045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ekkXL6Wbs55iGOcxP1h/JFuLwz+bnx1NCiClS+qsb8o=;
 b=OfEh25umNG7Hb2zpvTN/eh4AVVoyF6AJSjUO+7DoSHqYupQS0ovpeQP3
 Pnt2fyeGuu+8sxJjYogI1uq8A0c/syOUIG3UxjTpkKwWEkzwqfbnjMCRN
 HLC3BBKetTlNtLWjCdG6YBukoxqNXJ6gFpCmnbkfg80JqFtML3GfHcFCU
 8PPDDTzDfu36rWre7XuRmtgEexgwTI2vxn9wlLT8pwbOddh8tsFiILXAk
 LvS83SYwVlqLdYR9I1mABP4XUaZO2oNjLNLbOLrZIAZ0mO/DaGq1DoKLE
 9vq3fNZXl5bXP5Vedd8oZdwQT94rGURjYs8AUIVyvrUtrD6wpXHBLFHUb Q==;
X-CSE-ConnectionGUID: 3jxeLWMRTrKkMKB033QCzA==
X-CSE-MsgGUID: 8B7iPuP6RKaRYgSJYTSdNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020388"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:44 -0700
X-CSE-ConnectionGUID: KnNuDvpcQBmsBo1tVvuxOg==
X-CSE-MsgGUID: NXWNFbfyRkaKvGXrqboOuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655227"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 12/30] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Date: Mon,  6 Oct 2025 04:10:20 -0700
Message-Id: <20251006111038.2234860-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

Be cautious and ensure the VF post-migration worker is not running
during driver unload.

v3:
 - More teardown later in driver init, use devm (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                |  6 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 34 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++-
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b11f57273b8b..2d032eb3bd6d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -653,6 +653,12 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+		err = xe_gt_sriov_vf_init(gt);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d227c8a3ec81..8a36f479df1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -739,7 +739,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued) {
+	if (!gt->sriov.vf.migration.recovery_queued ||
+	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
 
@@ -1211,6 +1212,17 @@ static void migration_worker_func(struct work_struct *w)
 	vf_post_migration_recovery(gt);
 }
 
+static void vf_migration_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	gt->sriov.vf.migration.recovery_teardown = true;
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	cancel_work_sync(&gt->sriov.vf.migration.worker);
+}
+
 /**
  * xe_gt_sriov_vf_init_early() - GT VF init early
  * @gt: the &xe_gt
@@ -1237,6 +1249,26 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_init() - GT VF init
+ * @gt: the &xe_gt
+ *
+ * Return 0 on success, errno on failure
+ */
+int xe_gt_sriov_vf_init(struct xe_gt *gt)
+{
+	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
+		return 0;
+
+	/*
+	 * We want to tear down the VF post-migration early during driver
+	 * unload; therefore, we add this finalization action later during
+	 * driver load.
+	 */
+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev,
+					vf_migration_fini, gt);
+}
+
 /**
  * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 47ed8d513571..8c9679414565 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -24,6 +24,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
+int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 1796d4caf62f..c1bd6fdd9ab1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -48,10 +48,12 @@ struct xe_gt_sriov_vf_runtime {
 struct xe_gt_sriov_vf_migration {
 	/** @migration: VF migration recovery worker */
 	struct work_struct worker;
-	/** @lock: Protects recovery_queued */
+	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @recovery_teardown: VF post migration recovery is being torn down */
+	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
-- 
2.34.1

