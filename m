Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CBDCA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283A10E53B;
	Tue, 19 Aug 2025 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njiMAn1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318AD10E53F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585585; x=1787121585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QOoyFyPSAN/XNfdZeRhJKk+DwlpvYpN6dRFpVsJlsT8=;
 b=njiMAn1yxNfkq8c+2w5a/7k4Ro3+OXSk4TA0s9x/w7SF4pTYk28IcEE/
 wdcp7pVXphm3UhNY1UiROJu0eMzkG1tLjjErwu+T4mqRsiie+lYCP8vaX
 IErxnGZ0aalNaiMAtmkvHuezrTKlaK2iWtffymFm4yq3SuRy+MxdJjrhN
 4XMA2tS7D7j+O7wn9xNmgCBJdLPlZuKYUsw0qDnUbVs3ZV7YmIonWA3jq
 gtjwqGRaRyDEBKZq51dLpqEHEd48OhmQXfe2t8HeynqcEIm8KCtUe2uss
 qQ4ZeSfZrKkpxLbdV8RT47+sgNuRJBlNtyxQU92NL5lVPx77bVQwhyJ/N Q==;
X-CSE-ConnectionGUID: aukRp+VUSqul9GH17xrN1g==
X-CSE-MsgGUID: 5cy6KkbRREGY5jklIduVow==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966999"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:42 -0700
X-CSE-ConnectionGUID: eQMakDKVT3ugyz3RJ7UzOA==
X-CSE-MsgGUID: 3bfkYbZTQxCKPQAJdkmN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009521"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:41 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 8/8] drm/xe: Add core GPU frequency monitoring functionality
Date: Tue, 19 Aug 2025 12:04:17 +0530
Message-Id: <20250819063417.918666-9-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Implement the core GPU frequency monitoring and tracing logic:

- Workqueue-based periodic frequency sampling
- Per-GT monitoring control (start/stop)
- Power management integration with runtime PM and forcewake
- Device hotplug protection using drm_dev_enter/exit
- Automatic cleanup using DRM managed resources
- Complete initialization with per-GT work scheduling

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_gpufreqtracer.c | 230 +++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
index 3e4c1375aebd..44105e30fcec 100644
--- a/drivers/gpu/drm/xe/xe_gpufreqtracer.c
+++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
@@ -33,6 +33,11 @@
 #define CREATE_TRACE_POINTS
 #include "xe_gpufreqtracer_trace.h"
 
+/* forward declarations */
+static int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt);
+static void xe_gpufreqtracer_sample_work(struct work_struct *work);
+static void xe_gpufreqtracer_cleanup_action(struct drm_device *drm, void *ptr);
+
 /**
  * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
  * @gt: Reference to the GT
@@ -57,7 +62,6 @@ struct xe_gpufreqtracer_data {
 	struct xe_gpufreqtracer_gt_data *gt_data;
 };
 
-
 /**
  * xe_gpufreqtracer_validate_params - Validate GPU frequency monitoring parameters
  *
@@ -89,6 +93,9 @@ static void xe_gpufreqtracer_validate_params(void)
 int xe_gpufreqtracer_init(struct xe_device *xe)
 {
 	struct xe_gpufreqtracer_data *tracer_data;
+	struct xe_gt *gt;
+	u8 tile_id;
+	int ret = 0;
 
 	/* Validate module parameters first */
 	xe_gpufreqtracer_validate_params();
@@ -103,10 +110,227 @@ int xe_gpufreqtracer_init(struct xe_device *xe)
 	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
 				       sizeof(*tracer_data->gt_data),
 				       GFP_KERNEL);
-	if (!tracer_data->gt_data)
-		return -ENOMEM;
+	if (!tracer_data->gt_data) {
+		ret = -ENOMEM;
+		goto err_free_tracer;
+	}
+
+	/* Initialize per-GT data */
+	for_each_gt(gt, xe, tile_id) {
+		struct xe_gpufreqtracer_gt_data *gt_data =
+			&tracer_data->gt_data[gt->info.id];
+
+		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
+
+		gt_data->gt = gt;
+		atomic_set(&gt_data->monitoring_active, 0);
+		gt_data->last_frequency = 0;
+
+		INIT_DELAYED_WORK(&gt_data->delayed_work, xe_gpufreqtracer_sample_work);
+
+		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
+			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
+	}
 
 	xe->gpufreqtracer_data = tracer_data;
 
+	/* Start periodic monitoring on all GTs using global module parameter */
+	for_each_gt(gt, xe, tile_id) {
+		ret = xe_gpufreqtracer_start_monitoring(gt);
+		if (ret) {
+			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
+				gt->info.id, ret);
+		}
+	}
+
+	/* Register cleanup action for proper work cancellation */
+	ret = drmm_add_action(&xe->drm, xe_gpufreqtracer_cleanup_action, xe);
+	if (ret)
+		return ret;
+
 	return 0;
+
+err_free_tracer:
+	drm_err(&xe->drm, "initialization failed, freeing tracer data");
+	return ret;
+}
+
+/**
+ * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
+ * @work: Pointer to the delayed_work_struct representing the scheduled work.
+ *
+ * This function is executed in a workqueue context to periodically sample
+ * the GPU frequency and perform any necessary tracing or logging operations.
+ * It reschedules itself for the next sampling interval.
+ *
+ * The function includes proper power management and hotplug protection:
+ * - Uses drm_dev_enter/exit to protect against device removal
+ * - Uses xe_pm_runtime_get_if_active to avoid waking suspended devices
+ * - Uses xe_force_wake_get to ensure GT domain is powered for MMIO reads
+ */
+static void xe_gpufreqtracer_sample_work(struct work_struct *work)
+{
+	struct xe_gpufreqtracer_gt_data *gt_data =
+		container_of(work, struct xe_gpufreqtracer_gt_data, delayed_work.work);
+	struct xe_gt *gt = gt_data->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
+	u32 current_freq, last_freq;
+	unsigned int fw_ref;
+	int drm_idx;
+
+	if (!atomic_read(&gt_data->monitoring_active)) {
+		drm_warn(&xe->drm, "monitoring not active for GT%u, exiting",
+			 gt->info.id);
+		return;
+	}
+
+	/* Protect against device hotplug/removal */
+	if (!drm_dev_enter(&xe->drm, &drm_idx)) {
+		drm_err(&xe->drm, "device unplugged, stopping monitoring for GT%u",
+			gt->info.id);
+		atomic_set(&gt_data->monitoring_active, 0);
+		return;
+	}
+
+	/* Get runtime PM reference only if device is already active - don't wake it */
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		drm_warn(&xe->drm, "device not active, skipping frequency read for GT%u",
+			gt->info.id);
+		goto out_drm;
+	}
+
+	/* Get forcewake to ensure GT domain is powered */
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref) {
+		drm_warn(&xe->drm, "failed to get forcewake for GT%u, skipping sample",
+			 gt->info.id);
+		goto out_pm;
+	}
+
+	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */
+	last_freq = gt_data->last_frequency;
+
+	/* Only report if frequency has changed or this is the first sample */
+	if (current_freq != last_freq) {
+		drm_dbg(&xe->drm, "GT%u frequency changed, tracing %u KHz",
+			gt->info.id, current_freq);
+		trace_gpu_frequency(current_freq, gt->info.id);
+		gt_data->last_frequency = current_freq;
+	}
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+out_pm:
+	xe_pm_runtime_put(xe);
+out_drm:
+	drm_dev_exit(drm_idx);
+
+	/* Reschedule for the next sampling interval */
+	schedule_delayed_work(&gt_data->delayed_work,
+			      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
+}
+
+/**
+ * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
+ * @gt: The GT instance
+ *
+ * Starts periodic sampling of GPU frequency for the specified GT using the global
+ * monitoring interval from module parameters.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
+{
+	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
+	struct xe_gpufreqtracer_gt_data *gt_data;
+
+	if (!tracer_data) {
+		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
+		return -EOPNOTSUPP;
+	}
+
+	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
+		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
+			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
+		return -EINVAL;
+	}
+
+	gt_data = &tracer_data->gt_data[gt->info.id];
+
+	if (atomic_read(&gt_data->monitoring_active)) {
+		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
+		return -EALREADY;
+	}
+
+	atomic_set(&gt_data->monitoring_active, 1);
+	gt_data->last_frequency = 0;
+
+	/* Start the delayed work using global interval */
+	schedule_delayed_work(&gt_data->delayed_work,
+			      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
+
+	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
+		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
+
+	return 0;
+}
+
+/**
+ * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
+ * @gt: The GT instance
+ *
+ * Stops periodic sampling of GPU frequency for the specified GT.
+ */
+static void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
+{
+	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
+	struct xe_gpufreqtracer_gt_data *gt_data;
+
+	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
+		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
+			gt->info.id);
+		return;
+	}
+
+	gt_data = &tracer_data->gt_data[gt->info.id];
+
+	if (!atomic_read(&gt_data->monitoring_active)) {
+		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
+			 gt->info.id);
+		return;
+	}
+
+	atomic_set(&gt_data->monitoring_active, 0);
+
+	cancel_delayed_work_sync(&gt_data->delayed_work);
+}
+
+/**
+ * xe_gpufreqtracer_cleanup_action - DRM managed cleanup action
+ * @drm: DRM device
+ * @ptr: Pointer to xe_device
+ *
+ * Cleanup function called automatically by DRM managed resource system.
+ */
+static void xe_gpufreqtracer_cleanup_action(struct drm_device *drm, void *ptr)
+{
+	struct xe_device *xe = ptr;
+	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
+	struct xe_gt *gt;
+	u8 tile_id;
+
+	if (!tracer_data) {
+		drm_warn(drm, "no tracer data found, nothing to cleanup");
+		return;
+	}
+
+	/* Stop all monitoring */
+	for_each_gt(gt, xe, tile_id) {
+		drm_dbg(drm, "stopping monitoring for GT%u", gt->info.id);
+		xe_gpufreqtracer_stop_monitoring(gt);
+	}
+
+	/* Memory is automatically freed by drmm - just clear the pointer */
+	xe->gpufreqtracer_data = NULL;
 }
-- 
2.34.1

