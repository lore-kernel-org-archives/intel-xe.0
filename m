Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A5CCD18E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBE910E67F;
	Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzs8hV3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8710E5D0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836409; x=1791372409;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ae1GvZ85cFrUHC8pnu3MKJokIHRtcw4+gF0Y6EbAh1k=;
 b=nzs8hV3BEDLZH683KzEyy2tqwM7SkW8LM7L1aTs/CV/uRZhYK8aDU26I
 frYS9BReeO7Llz2LBpmC7w2T1RyJGoWCqjGo4o1vp7ryAvlrUZRDpkMmM
 KYbBE4GrKUcM3Xxmkj0Rju+m1E/yJA0HZvL76Kb1k5WZlqXJb7pr6y+A6
 7p3n+xKHPmD75xiAn7zdCpEAIhi73ERWhGCD/+QtiDJ9UZ91hBrTEbzB2
 T8i4PYpZNobGPIwFSENNs92RWb9CTiSL7px7Hr3pmaLYm4e7oY8HGEe2U
 Bzc196otQr+QIgOTZgHB+68QIc63+xejMLGH2sArrpfShwFXJBZHk+EYr Q==;
X-CSE-ConnectionGUID: hOBsYuWxS+S+EiT/xoOOzQ==
X-CSE-MsgGUID: jMDLW/LNTLmlIODlypUH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660682"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
X-CSE-ConnectionGUID: YxIOm5iaSTyY1mom6tSuww==
X-CSE-MsgGUID: SkN+mccaTXCquu+pWNdhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924000"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 13/32] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Date: Tue,  7 Oct 2025 04:26:22 -0700
Message-Id: <20251007112641.2669655-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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
index 6f0bc6225fd3..db8c6d8e9076 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -728,7 +728,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued) {
+	if (!gt->sriov.vf.migration.recovery_queued ||
+	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
 
@@ -1200,6 +1201,17 @@ static void migration_worker_func(struct work_struct *w)
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
@@ -1226,6 +1238,26 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
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
index 2eb793a2d8ba..1d2eaa52f804 100644
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

