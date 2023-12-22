Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0239C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A929210E75E;
	Fri, 22 Dec 2023 07:39:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B49010E75B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230742; x=1734766742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wb9b9t6GOzesd95lW6XdFtrYOLxR6nUlL1vR2RbzkuM=;
 b=UIc5v53j0z03Ohi15E7roepJ56LSoYcuKkd0Ct/Qtl+J6dFtLwArBvAi
 OTFz0One3NjyovBepIqOgSIrOsK2zDi0Z9LVO9QpmDW3450zN/Z9OlbBI
 D3exA3hzSnCNgwjGcKvwjvjjrZuJ+MrOpzquL8dV7QKNlLlRd+SzQfZrj
 MHKtyMb4556SF9drdKsp7894+/G3/FlzzuxAUuK9ba8Wf75eeg7HYaoxH
 WdY5yxX7Mznmxw3gRAWzFt/5h4CMnCDNKYifq7TM78x6BAfr+BQu8qMIL
 e5XyIIE0i30YiCPJSbMNzrhMRgLIof8qu4bDRd9lKl4irKmbqrgLdXz4L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9481101"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9481101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582624"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582624"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:59 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 8/8] drm/xe/guc: Handle runtime suspend issues for engine
 busyness
Date: Fri, 22 Dec 2023 13:16:02 +0530
Message-Id: <20231222074602.817518-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231222074602.817518-1-riana.tauro@intel.com>
References: <20231222074602.817518-1-riana.tauro@intel.com>
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

1) During runtime suspend, when card enters D3hot, values read
    from the shared memory maintained by GuC returns 0xFF.
    Waking up for every perf read when
    device is runtime suspended causes power penality.
    Store the last read busy ticks and total active ticks and return
    these values when suspended

 2) When the device is runtime resumed, guc is loaded again. If pmu
    interface was opened to collect busyness events, the guc stats
    have to be re-enabled to resume collection after suspend.
    Disable/enable guc stats if pmu is opened and is already collecting
    busyness events and device gets runtime suspended/resumed.

v2: rebase
    fix local variable naming (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  |  4 ++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 51 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  5 ++
 drivers/gpu/drm/xe/xe_pmu.c                 | 10 ++++
 drivers/gpu/drm/xe/xe_pmu.h                 |  4 ++
 6 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a48cceaa7750..6d20bf5f4997 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -696,6 +696,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_pmu_suspend(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
@@ -724,6 +726,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_pmu_resume(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 79ae06b71943..c86f9ed2440e 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -96,11 +96,15 @@ static void guc_engine_busyness_get_usage(struct xe_guc *guc,
 #undef read_engine_usage
 #undef read_global_field
 
-	if (ticks_engine)
+	if (hwe && ticks_engine) {
 		*ticks_engine = engine_ticks;
+		guc->busy.prev_busy_ticks[hwe->class][hwe->logical_instance] = engine_ticks;
+	}
 
-	if (ticks_gt)
+	if (ticks_gt) {
 		*ticks_gt = gt_ticks;
+		guc->busy.prev_gt_ticks = gt_ticks;
+	}
 }
 
 static void guc_engine_busyness_action_usage_stats(struct xe_guc *guc, bool enable)
@@ -236,6 +240,36 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
 		guc_engine_busyness_toggle_stats(guc);
 }
 
+/*
+ * xe_guc_engine_busyness_resume - Helper to resume engine busyness
+ * @guc: The GuC object
+ *
+ * Enable engine busyness if there were outstanding pmu events before
+ * suspend and the collection has to be resumed. This is necessary
+ * as there is a common path for both Runtime suspend and system suspend
+ * and it reloads GuC on resume.
+ */
+void xe_guc_engine_busyness_resume(struct xe_guc *guc)
+{
+	if (guc->busy.pmu_ref)
+		guc_engine_busyness_toggle_stats(guc);
+}
+
+/*
+ * xe_guc_engine_busyness_suspend - Helper to suspend engine busyness
+ * @guc: The GuC object
+ *
+ * Disable engine busyness if there are any outstanding pmu events
+ * and if its suspended. This is necessary as there is a common
+ * path for both Runtime suspend and system suspend
+ * and it reloads GuC on resume.
+ */
+void xe_guc_engine_busyness_suspend(struct xe_guc *guc)
+{
+	if (guc->busy.pmu_ref)
+		guc->busy.enabled = false;
+}
+
 /*
  * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
  * @guc: The GuC object
@@ -245,12 +279,19 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
  */
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_gt;
 
 	if (!xe_guc_engine_busyness_supported(guc))
 		return 0;
 
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+	if (!device_awake)
+		return guc->busy.prev_gt_ticks;
+
 	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
+	xe_device_mem_access_put(xe);
 
 	return ticks_gt;
 }
@@ -265,12 +306,18 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
  */
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_engine;
 
 	if (!xe_guc_engine_busyness_supported(guc))
 		return 0;
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+	if (!device_awake)
+		return guc->busy.prev_busy_ticks[hwe->class][hwe->logical_instance];
 
 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
+	xe_device_mem_access_put(xe);
 
 	return ticks_engine;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
index 008af1c0838a..b33692d77f7d 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -17,4 +17,6 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
 void xe_guc_engine_busyness_pin(struct xe_guc *guc, bool pmu_locked);
 void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked);
+void xe_guc_engine_busyness_suspend(struct xe_guc *guc);
+void xe_guc_engine_busyness_resume(struct xe_guc *guc);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 1d4123fec9c0..7790bf41371a 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -15,6 +15,7 @@
 #include "xe_guc_fwif.h"
 #include "xe_guc_log_types.h"
 #include "xe_guc_pc_types.h"
+#include "xe_hw_engine.h"
 #include "xe_uc_fw_types.h"
 
 /**
@@ -103,6 +104,10 @@ struct xe_guc {
 		 * been requested, locked by PMU spinlock
 		 */
 		int pmu_ref;
+		/** @prev_busy_ticks: array containing last stored busy ticks */
+		u64 prev_busy_ticks[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE];
+		/** @prev_gt_ticks: last stored gt ticks */
+		u64 prev_gt_ticks;
 	} busy;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3161ed157bd2..ee505a9afbed 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -548,6 +548,16 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
 	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
 }
 
+void xe_pmu_suspend(struct xe_gt *gt)
+{
+	xe_guc_engine_busyness_suspend(&gt->uc.guc);
+}
+
+void xe_pmu_resume(struct xe_gt *gt)
+{
+	xe_guc_engine_busyness_resume(&gt->uc.guc);
+}
+
 static void xe_pmu_unregister(struct drm_device *device, void *arg)
 {
 	struct xe_pmu *pmu = arg;
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index d6fca18466f4..568bcf250934 100644
--- a/drivers/gpu/drm/xe/xe_pmu.h
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -13,10 +13,14 @@
 int xe_pmu_init(void);
 void xe_pmu_exit(void);
 void xe_pmu_register(struct xe_pmu *pmu);
+void xe_pmu_suspend(struct xe_gt *gt);
+void xe_pmu_resume(struct xe_gt *gt);
 #else
 static inline int xe_pmu_init(void) { return 0; }
 static inline void xe_pmu_exit(void) {}
 static inline void xe_pmu_register(struct xe_pmu *pmu) {}
+static inline void xe_pmu_suspend(struct xe_gt *gt) {}
+static inline void xe_pmu_resume(struct xe_gt *gt) {}
 #endif
 
 #endif
-- 
2.40.0

