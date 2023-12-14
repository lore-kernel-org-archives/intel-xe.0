Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B86C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AE310E94F;
	Thu, 14 Dec 2023 11:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609BB10E904
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553092; x=1734089092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8PdCNE1ar3z1U8gYYQov7UYvrX6031kNHS0RWYA5K4=;
 b=SleAPwpkfqmV+QozVHfyNYlWeI/CGEFz0PE9Q2tP4p8POhmvmoyKw8ur
 FCycTbBYnYfB3nkYI/O6d+c2l7AMjolYfr/5nH44g2vzsKqO48GMouzTO
 dAN5tauLlgijhKjVagNfM0Y2QDIq8g/BbS3ZG9GvcbjeLzpIXgWmOSeNS
 AKfNl65mJjY52/2HBwDdFotUAcEvWyl70Ncb9wVvTr4VgD0Hqn4Lt6EBI
 AiPIYLwCWNl+DgBLRDLALrvxUjKPDueiZZcNK+UzA+RLxNpkwTWB2Wi0o
 7kakxzReWA4G+bK8ajn6DE0yFowHKaPGtuYsOJjL/IETG65UZ7H1jMO1U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940183"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940183"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714188"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:49 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 10/10] RFC drm/xe/guc: Handle runtime suspend issues for
 engine busyness
Date: Thu, 14 Dec 2023 17:01:44 +0530
Message-Id: <20231214113144.251726-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  |  4 ++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 52 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  5 ++
 drivers/gpu/drm/xe/xe_pmu.c                 | 10 ++++
 drivers/gpu/drm/xe/xe_pmu.h                 |  4 ++
 6 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d946e51a3a06..21eb2ad5cc33 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -714,6 +714,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_pmu_suspend(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
@@ -742,6 +744,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_pmu_resume(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 56e3378d856d..8867f5743ea5 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -96,11 +96,15 @@ static void guc_engine_busyness_get_usage(struct xe_guc *guc,
 #undef read_engine_usage
 #undef read_global_field
 
-	if (_ticks_engine)
+	if (hwe && _ticks_engine) {
 		*_ticks_engine = ticks_engine;
+		guc->busy.prev_busy_ticks[hwe->class][hwe->logical_instance] = ticks_engine;
+	}
 
-	if (_ticks_gt)
+	if (_ticks_gt) {
 		*_ticks_gt = ticks_gt;
+		guc->busy.prev_gt_ticks = ticks_gt;
+	}
 }
 
 static void guc_engine_busyness_action_usage_stats(struct xe_guc *guc, bool enable)
@@ -237,6 +241,36 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
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
@@ -245,13 +279,20 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
  */
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_gt;
 
 	/* Engine busyness supported only on GuC >= 70.11.1 */
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
@@ -266,13 +307,20 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
  */
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_engine;
 
 	/* Engine busyness supported only on GuC >= 70.11.1 */
 	if (!xe_guc_engine_busyness_supported(guc))
 		return 0;
 
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+	if (!device_awake)
+		return guc->busy.prev_busy_ticks[hwe->class][hwe->logical_instance];
+
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
index cf87fe75490b..4596a341f09a 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -15,6 +15,7 @@
 #include "xe_guc_fwif.h"
 #include "xe_guc_log_types.h"
 #include "xe_guc_pc_types.h"
+#include "xe_hw_engine.h"
 #include "xe_uc_fw_types.h"
 
 /**
@@ -88,6 +89,10 @@ struct xe_guc {
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
index 5eeb904acfa2..5aa0fcee175a 100644
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

