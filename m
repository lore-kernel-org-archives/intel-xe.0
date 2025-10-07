Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834C7CCD19A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55B10E6A8;
	Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC6Ha7xL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E92B10E197
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842313; x=1791378313;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ae1GvZ85cFrUHC8pnu3MKJokIHRtcw4+gF0Y6EbAh1k=;
 b=aC6Ha7xL3jJwl45wxHoGaE/mZlNHx2Xb+Ties7ckrHZKlXh594JRRDU9
 xAEBXE4HctGOwBQ4fiIOgSTQ8AQm4wgL9pzdimuYGm3uS/IoXrmEffM8H
 sr6XNVMr3I7owHBnuOlhQnG8ux1SipcPFq3JrkDBFYkB1yQ1d1np4t5tC
 We3cBz0VZZPEoIkeV7PpmIVW87O7bEKjlpwkBevB3bUuw1lSACB1RGMBj
 BrzYd+CJQRlyaijBwz9h/oqQRr6cWXvXx2dLB8jFtEmEbZCQxdTRYlWPt
 x/NcdyWkb2Sv5LOCRRI357gbQSZGh3U2zjYUjFK4LeuRz8bxin8BNItyn g==;
X-CSE-ConnectionGUID: gRH2DeRgShC+Y718zUyGJQ==
X-CSE-MsgGUID: dpSibfN4Rh6EQJtB/xJLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639834"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:13 -0700
X-CSE-ConnectionGUID: 0CEejNVZR5645UGnYmxBjQ==
X-CSE-MsgGUID: OghCq6WMQg+XUo4d6Z8h8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576941"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 14/33] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Date: Tue,  7 Oct 2025 06:04:46 -0700
Message-Id: <20251007130505.2694829-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

