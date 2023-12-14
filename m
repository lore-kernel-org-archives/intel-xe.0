Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C2C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9B10E904;
	Thu, 14 Dec 2023 11:24:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12810E90D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553089; x=1734089089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2MT/zO4bB4e50RNZaoiVHg5q0tsveKdSJdmrmxT+y0=;
 b=DFo/Sj0ny7c39NBkDtS1RVltDYUVqVS+hJuCrpf+Tvvjfz3aN5y5YXrL
 f2LBLJhLdxjdThk7tvHEFrmIrDAb66b8V+Ti/N9FVJijNMLY1+yYJGJe9
 1z9Jj7xjCXHvfDOzesqTNd6Yn/6gFgXs1aIn8Bmx42H49IQ7t3p/duhQ8
 BD66Uxzuwn7oLNd0sWxE4MJ8zMlYh0XetSrqHPl4nsgtnhZJHbJavkE+K
 REIsu+h3Umhv79Y2GSWbUcdFVuZD0LMGDxzOhsm5uU+QfH+tf8h3MN+9a
 b9aq8kse074ODYv+eOyppuJvaejQW115F0KUVuutOyahP3SsOGQckuqfQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940179"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714185"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 09/10] RFC drm/xe/guc: Dynamically enable/disable engine
 busyness stats
Date: Thu, 14 Dec 2023 17:01:43 +0530
Message-Id: <20231214113144.251726-10-riana.tauro@intel.com>
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

Dynamically enable/disable engine busyness stats using GuC
action when PMU interface is opened and closed to avoid
power penality.

Co-developed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 96 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h           | 14 +++
 drivers/gpu/drm/xe/xe_pmu.c                 | 32 +++++++
 4 files changed, 140 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index c40625f41ae5..56e3378d856d 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -8,6 +8,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 
@@ -102,9 +103,9 @@ static void guc_engine_busyness_get_usage(struct xe_guc *guc,
 		*_ticks_gt = ticks_gt;
 }
 
-static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
+static void guc_engine_busyness_action_usage_stats(struct xe_guc *guc, bool enable)
 {
-	u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
+	u32 ggtt_addr = enable ? xe_bo_ggtt_addr(guc->busy.bo) : 0;
 	u32 action[] = {
 		XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
 		ggtt_addr,
@@ -122,6 +123,45 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
 }
 
+static void guc_engine_busyness_enable_stats(struct xe_guc *guc, bool enable)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	bool skip;
+
+	spin_lock(&guc->busy.enable_lock);
+	skip = enable == guc->busy.enabled;
+	if (!skip)
+		guc->busy.enabled = enable;
+	spin_unlock(&guc->busy.enable_lock);
+
+	if (skip)
+		return;
+
+	xe_device_mem_access_get(xe);
+	guc_engine_busyness_action_usage_stats(guc, enable);
+	xe_device_mem_access_put(xe);
+}
+
+static void guc_engine_busyness_toggle_stats(struct xe_guc *guc)
+{
+	if (!guc->submission_state.enabled)
+		return;
+
+	/* Pmu_ref can increase before the worker thread runs this function */
+	if (guc->busy.pmu_ref >= 1)
+		guc_engine_busyness_enable_stats(guc, true);
+	else if (guc->busy.pmu_ref == 0)
+		guc_engine_busyness_enable_stats(guc, false);
+}
+
+static void guc_engine_buysness_worker_func(struct work_struct *w)
+{
+	struct xe_guc *guc = container_of(w, struct xe_guc,
+					  busy.enable_worker);
+
+	guc_engine_busyness_toggle_stats(guc);
+}
+
 static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -151,6 +191,52 @@ bool xe_guc_engine_busyness_supported(struct xe_guc *guc)
 	return false;
 }
 
+/*
+ * xe_guc_engine_busyness_pin - Dynamically enables engine busyness stats
+ * @guc: The GuC object
+ * @pmu_locked: boolean to indicate pmu event is started, locked by pmu spinlock
+ *
+ * Dynamically enables engine busyness by queueing a worker thread
+ * if guc submission is not yet enabled or if pmu event is started.
+ */
+void xe_guc_engine_busyness_pin(struct xe_guc *guc, bool pmu_locked)
+{
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return;
+
+	if (pmu_locked)
+		guc->busy.pmu_ref++;
+
+	if (!guc->submission_state.enabled || pmu_locked)
+		queue_work(system_unbound_wq, &guc->busy.enable_worker);
+	else
+		guc_engine_busyness_enable_stats(guc, true);
+}
+
+/*
+ * xe_guc_engine_busyness_unpin - Dynamically disables engine busyness stats
+ * @guc: The GuC object
+ * @pmu_locked: boolean to indicate pmu event is stopped, locked by pmu spinlock
+ *
+ * Dynamically disables engine busyness by queueing a worker thread
+ * if guc submission is not yet enabled or if pmu event is stopped.
+ */
+void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked)
+{
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!xe_guc_engine_busyness_supported(guc))
+		return;
+
+	if (pmu_locked)
+		guc->busy.pmu_ref--;
+
+	if (!guc->submission_state.enabled || pmu_locked)
+		queue_work(system_unbound_wq, &guc->busy.enable_worker);
+	else
+		guc_engine_busyness_toggle_stats(guc);
+}
+
 /*
  * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
  * @guc: The GuC object
@@ -227,9 +313,11 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	spin_lock_init(&guc->busy.enable_lock);
+	INIT_WORK(&guc->busy.enable_worker, guc_engine_buysness_worker_func);
 	guc->busy.bo = bo;
-
-	guc_engine_busyness_enable_stats(guc);
+	guc->busy.enabled = false;
+	guc->busy.pmu_ref = 0;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_engine_busyness_fini, guc);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
index e3c74e0236af..008af1c0838a 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -15,4 +15,6 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
+void xe_guc_engine_busyness_pin(struct xe_guc *guc, bool pmu_locked);
+void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 4e9602301aed..cf87fe75490b 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -74,6 +74,20 @@ struct xe_guc {
 	struct {
 		/** @bo: GGTT buffer object of engine busyness that is shared with GuC */
 		struct xe_bo *bo;
+		/** @enabled: state of engine stats */
+		bool enabled;
+		/** @enable_lock: for accessing @enabled */
+		spinlock_t enable_lock;
+		/**
+		 * @enable_worker: Async worker for enabling/disabling
+		 * busyness tracking from PMU
+		 */
+		struct work_struct enable_worker;
+		/**
+		 * @pmu_ref: how many outstanding PMU counters have
+		 * been requested, locked by PMU spinlock
+		 */
+		int pmu_ref;
 	} busy;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 9c8591d59b54..5eeb904acfa2 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -9,6 +9,9 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
+#include "xe_guc_engine_busyness.h"
+#include "xe_mmio.h"
 
 #define XE_ENGINE_SAMPLE_COUNT (DRM_XE_PMU_SAMPLE_BUSY_TICKS + 1)
 
@@ -93,6 +96,8 @@ static int engine_event_init(struct perf_event *event)
 	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(engine_event_class(event)),
 			      engine_event_instance(event), true);
 
+	xe_guc_engine_busyness_pin(&gt->uc.guc, false);
+
 	return engine_event_status(hwe, engine_event_sample(event));
 }
 
@@ -204,6 +209,19 @@ static void xe_pmu_event_read(struct perf_event *event)
 
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	const int gt_id = config_gt_id(event->attr.config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long flags;
+
+	if (is_engine_event(event) ||
+	    config_counter(event->attr.config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0)) {
+		spin_lock_irqsave(&pmu->lock, flags);
+		xe_guc_engine_busyness_pin(&gt->uc.guc, true);
+		spin_unlock_irqrestore(&pmu->lock, flags);
+	}
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -227,9 +245,23 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 
 static void xe_pmu_event_stop(struct perf_event *event, int flags)
 {
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	const int gt_id = config_gt_id(event->attr.config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long irqflags;
+
 	if (flags & PERF_EF_UPDATE)
 		xe_pmu_event_read(event);
 
+	if (is_engine_event(event) ||
+	    config_counter(event->attr.config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0)) {
+		spin_lock_irqsave(&pmu->lock, irqflags);
+		xe_guc_engine_busyness_unpin(&gt->uc.guc, true);
+		spin_unlock_irqrestore(&pmu->lock, irqflags);
+	}
+
 	event->hw.state = PERF_HES_STOPPED;
 }
 
-- 
2.40.0

