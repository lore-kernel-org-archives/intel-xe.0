Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E84CCA46F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF4410E39F;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUDio1wW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D8010E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=46EabzAkeri2Isw7FRbpTkPp4/XmLsq3V1ebwD2s5kY=;
 b=iUDio1wWVMB5IQFI92jMXpqtwU6GTrelrTmp10jxRG/M5Z7s+AUj8UBM
 WyROxmmQiqBUhQbb1+EjKiD3ByFfCtvu/c2IwuNJqMEV0QKtMk+jXu7xH
 BD5Ag3f8WTQWYqmJx29or3sl/BRdQ45OXHYRfH4kXflirHb0osTlFZd8F
 /yUaevFS2xWGymE8pjlFkZj23e17at9PyiDIwJcyl5KpXg9uU4UVwjBj+
 ueDnOmzjEFV59qtR5CE1s/2QToYRcsAvREm/fjPjzxGdEesWHSXygQHR9
 RgkA3yUdipEp8uhUFir3LJc7onMCSlDsF8+LupPUmvjX3+/4K84wP7Mdm g==;
X-CSE-ConnectionGUID: uAFfbnBGQlqeBn4uT0KA+A==
X-CSE-MsgGUID: jHqLT1lfQZmuPNIJPxJ22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398533"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
X-CSE-ConnectionGUID: +YnI3jXYRz6RD2mnWHwnww==
X-CSE-MsgGUID: GNMLXjoXTiyj/I359RBj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529267"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 17/36] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Date: Sun, 28 Sep 2025 19:55:23 -0700
Message-Id: <20250929025542.1486303-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt.c                |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 31 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++-
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5f9ba4caf837..82be38c99205 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -663,6 +663,12 @@ int xe_gt_init(struct xe_gt *gt)
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
index ad1d63b5b8d1..cc5af19c1911 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -811,7 +811,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued) {
+	if (!gt->sriov.vf.migration.recovery_queued ||
+	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
 
@@ -1283,6 +1284,17 @@ static void migration_worker_func(struct work_struct *w)
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
@@ -1314,6 +1326,23 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
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
  * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ff3a0ce608cd..71e1d566da81 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -24,6 +24,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
+int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 6cbf8291a5ab..e135018cba1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
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

