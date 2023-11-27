Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D20C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A8610E2B8;
	Mon, 27 Nov 2023 14:04:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30710E2B9
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701093875; x=1732629875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kbcr9pAJXmIvIdAv1s72rRUCF3Ap9bzJFn4BBy7xRmY=;
 b=AbuebbV/bkBYoB/mYSx8AFVrett43tcfMprH1QRzFYUQZcIKNZUXsbUk
 L7XacHnrMwSQAOtyPN1bIW3tAKTwSNGObJuClbX2TNuNEfPodjO4hSwKO
 R2zatH5POzhdc7BytKt6/sTdgOSt99OUWEhX3ZtIkuMmvKUHMtIr3+fO3
 MwIiSmWBWBFMpDySTrNpG3Rc7oynqCGcNgjDlb280+0d+Ft8GgcCnd8F6
 n7Vav10mGLVr675djpU26Y8oZEm3z0uXCI5cvlncoEoEL/pesoSXF22Wv
 WRUdJQykRuBuBUbDIi3LfcuvJH8VdepnSYuf8EeEJrQU+gdc2rV1+yPta Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="457039863"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457039863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761604518"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761604518"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:28 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 19:41:24 +0530
Message-Id: <20231127141125.2913415-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] RFC drm/xe/guc: Dynamically enable/disable
 engine busyness stats
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 96 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h           | 14 +++
 drivers/gpu/drm/xe/xe_pmu.c                 | 30 +++++++
 4 files changed, 138 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index dcf468ee30ea..a0b2fa615f46 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 
@@ -115,9 +116,9 @@ static void guc_engine_busyness_get_usage(struct xe_guc *guc,
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
@@ -135,6 +136,45 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
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
@@ -142,6 +182,52 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(guc->busy.bo);
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
+	if (!guc_engine_busyness_supported(guc))
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
+	if (!guc_engine_busyness_supported(guc))
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
@@ -218,9 +304,11 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
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
index 57325910ebc4..7fde63db8a1d 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -14,5 +14,7 @@ struct xe_guc;
 int xe_guc_engine_busyness_init(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
+void xe_guc_engine_busyness_pin(struct xe_guc *guc, bool pmu_locked);
+void xe_guc_engine_busyness_unpin(struct xe_guc *guc, bool pmu_locked);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 044d4a5f74e2..2a01dbcd3144 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -83,6 +83,20 @@ struct xe_guc {
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
index 24c5c7d36833..44ec1f3eea63 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -11,6 +11,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
+#include "xe_guc_engine_busyness.h"
 #include "xe_mmio.h"
 
 #define XE_ENGINE_SAMPLE_COUNT (DRM_XE_PMU_SAMPLE_BUSY_TICKS + 1)
@@ -187,6 +188,8 @@ static int engine_event_init(struct perf_event *event)
 	hwe = xe_gt_hw_engine(gt, xe_user_to_engine_class[engine_event_class(event)],
 			      engine_event_instance(event), true);
 
+	xe_guc_engine_busyness_pin(&gt->uc.guc, false);
+
 	return engine_event_status(hwe, engine_event_sample(event));
 }
 
@@ -297,6 +300,19 @@ static void xe_pmu_event_read(struct perf_event *event)
 
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
@@ -320,9 +336,23 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 
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

