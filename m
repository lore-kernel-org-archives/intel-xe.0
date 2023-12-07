Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F773C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668C410E8A5;
	Thu,  7 Dec 2023 12:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65410E8A5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953462; x=1733489462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0sXCZ55WGxibZ2GRNDkjhlK+mxUnI9ajEe1s7M+QQNE=;
 b=dgw2Yur1CwnueEiFW+/nNO4dpVzzl0CCSCzjnI0j8XOLS8/VG9WxBqak
 afj0vaYZgem+IyR8lL1L9/x8eQdo1t/rzRCQNYWemArlO8iLkMZvXKECq
 KNLGTN541+eSVtN2atACHvwSpy/PGonuMcqNGP9/zN0cxFytVW72Zbbbu
 xxtMzq9/eDmODyN8E2enonJhdC5ixy9/DJ1G+HkXX5KGRHAjRGDsgmVCE
 3CmVl3U11ddgzl1uydxagffJ5YJUktYmDP7iqL4mCeXYm93gApJe1c0o5
 P7pQYLiqECrG+jP3AgF88sKCKjFJ21o3aB1MDLT6OMn+h6ikiWhHLg1O2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051392"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692745"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:51:00 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/8] RFC drm/xe/guc: Handle runtime suspend issues for
 engine busyness
Date: Thu,  7 Dec 2023 18:28:02 +0530
Message-Id: <20231207125802.3730165-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231207125802.3730165-1-riana.tauro@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_gt.c                  |  2 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 52 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  3 +-
 drivers/gpu/drm/xe/xe_guc_types.h           |  5 ++
 drivers/gpu/drm/xe/xe_pmu.c                 |  6 +++
 drivers/gpu/drm/xe/xe_pmu.h                 |  2 +
 6 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 07a94d315715..f7e81f66995d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -731,6 +731,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_pmu_resume(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index e31fb131dfb9..91dcb84650ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -110,11 +110,15 @@ static void guc_engine_busyness_get_usage(struct xe_guc *guc,
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
@@ -229,6 +233,36 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
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
@@ -237,13 +271,20 @@ void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
  */
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_gt;
 
 	/* Engine busyness supported only on GuC >= 70.11.1 */
 	if (!guc_engine_busyness_supported(guc))
 		return 0;
 
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+	if (!device_awake)
+		return guc->busy.prev_gt_ticks;
+
 	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
+	xe_device_mem_access_put(xe);
 
 	return ticks_gt;
 }
@@ -258,13 +299,20 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
  */
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+	bool device_awake;
 	u64 ticks_engine;
 
 	/* Engine busyness supported only on GuC >= 70.11.1 */
 	if (!guc_engine_busyness_supported(guc))
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
index 7fde63db8a1d..f59994024059 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -16,5 +16,6 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 void xe_guc_engine_busyness_pin(struct xe_guc *guc, bool pmu_locked);
 void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked);
-
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
index 3b532798610e..436b97cfdcac 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -703,9 +703,15 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
 
 void xe_pmu_suspend(struct xe_gt *gt)
 {
+	xe_guc_engine_busyness_suspend(&gt->uc.guc);
 	engine_group_busyness_store(gt);
 }
 
+void xe_pmu_resume(struct xe_gt *gt)
+{
+	xe_guc_engine_busyness_resume(&gt->uc.guc);
+}
+
 static void xe_pmu_unregister(struct drm_device *device, void *arg)
 {
 	struct xe_pmu *pmu = arg;
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index a99d4ddd023e..568bcf250934 100644
--- a/drivers/gpu/drm/xe/xe_pmu.h
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -14,11 +14,13 @@ int xe_pmu_init(void);
 void xe_pmu_exit(void);
 void xe_pmu_register(struct xe_pmu *pmu);
 void xe_pmu_suspend(struct xe_gt *gt);
+void xe_pmu_resume(struct xe_gt *gt);
 #else
 static inline int xe_pmu_init(void) { return 0; }
 static inline void xe_pmu_exit(void) {}
 static inline void xe_pmu_register(struct xe_pmu *pmu) {}
 static inline void xe_pmu_suspend(struct xe_gt *gt) {}
+static inline void xe_pmu_resume(struct xe_gt *gt) {}
 #endif
 
 #endif
-- 
2.40.0

