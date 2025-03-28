Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70D0C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 22:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63C10E1EF;
	Fri, 28 Mar 2025 22:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2ABCnV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1C10E1EF
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 22:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743202428; x=1774738428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IrYIYn41igOuHIDpGyr2IIQxyyPifbLkWL6jJE9+k30=;
 b=h2ABCnV7PWEbnzqtxdJjPJuprqOSJtwXgXX+BhomBlLv3UZtHu5B6guV
 9WIOnghPKwHlOExnMQCcnC5R5ljotNISp+vqXnmlUX4y+0xDXraHdRPFq
 b+LBEmUzSHYvBuMX53fzmxEHmpX6OQZuWD1038083/YWHNeE4L3nd6JDq
 tS9/LPM0yJHWQK2XbjZxu11DJFHrlwaMsc2Eo84dhsFcKUvMj2wk2Qx21
 yRDIRhgZ+s+TIm4dZ+j9vkqtuesC7FF9AH+H2fqXeFCbH5/OWjfAXBv1o
 wNfINn7Ty4EOUNAiOn9u9KyWv3pvwrT9d1iUUBuaGBB9y9lrp9ICqvSM/ A==;
X-CSE-ConnectionGUID: zH+a8ArAQnezcsO7LF76cg==
X-CSE-MsgGUID: AZkJGnOHT/atbOBaXOiFyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44678074"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="44678074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 15:53:47 -0700
X-CSE-ConnectionGUID: JURcHodvT7mDkbNvifqHMw==
X-CSE-MsgGUID: 3XauOG2ATpm97zbslCVLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="125800567"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2025 15:53:46 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5] drm/xe/pmu: Add GT frequency events
Date: Fri, 28 Mar 2025 15:53:30 -0700
Message-Id: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Define PMU events for GT frequency (actual and requested). The
instantaneous values for these frequencies will be displayed.

Following PMU events are being added:
  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]

Standard perf commands can be used to monitor GT frequency:
  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000

  1.001229762       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
  2.006175406       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/

v2: Use locks while storing/reading samples, keep track of multiple
clients (Lucas) and other general cleanup.
v3: Review comments (Lucas) and use event counts instead of mask for
active events.
v4: Add freq events to event_param_valid method (Riana)
v5: Use instantaneous values instead of aggregating (Lucas)
v6: Obtain fwake at init for freq events as well and use non fwake
variant method for reading requested freq to avoid lockdep issues (Lucas)

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_pmu.c    | 40 +++++++++++++++++++++++++++++++---
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 85215313976c..f70762917aed 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -461,6 +461,21 @@ static u32 get_cur_freq(struct xe_gt *gt)
 	return decode_freq(freq);
 }
 
+/**
+ * xe_guc_pc_get_cur_freq_fw - With fw held, get requested frequency
+ * @pc: The GuC PC
+ *
+ * Returns: the requested frequency for that GT instance
+ */
+u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+
+	return get_cur_freq(gt);
+}
+
 /**
  * xe_guc_pc_get_cur_freq - Get Current requested frequency
  * @pc: The GuC PC
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 39102b79602f..0a2664d5c811 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -22,6 +22,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
+u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index fde4222675fd..835d21429b58 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -10,6 +10,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
+#include "xe_guc_pc.h"
 #include "xe_hw_engine.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
@@ -84,6 +85,8 @@ static unsigned int config_to_gt_id(u64 config)
 #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
 #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
 #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
@@ -119,6 +122,14 @@ static bool is_engine_event(u64 config)
 		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
 }
 
+static bool is_gt_frequency_event(struct perf_event *event)
+{
+	uint32_t id = config_to_event_id(event->attr.config);
+
+	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
+	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
+}
+
 static bool event_gt_forcewake(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
@@ -126,7 +137,7 @@ static bool event_gt_forcewake(struct perf_event *event)
 	struct xe_gt *gt;
 	unsigned int *fw_ref;
 
-	if (!is_engine_event(config))
+	if (!is_engine_event(config) && !is_gt_frequency_event(event))
 		return true;
 
 	gt = xe_device_get_gt(xe, config_to_gt_id(config));
@@ -173,6 +184,8 @@ static bool event_param_valid(struct perf_event *event)
 
 	switch (config_to_event_id(config)) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
 		if (engine_class || engine_instance || function_id)
 			return false;
 		break;
@@ -190,6 +203,8 @@ static bool event_param_valid(struct perf_event *event)
 		}
 
 		break;
+	default:
+		return false;
 	}
 
 	return true;
@@ -288,6 +303,10 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		return read_engine_events(gt, event);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
 	}
 
 	return 0;
@@ -303,7 +322,13 @@ static void xe_pmu_event_update(struct perf_event *event)
 		new = __xe_pmu_event_read(event);
 	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
 
-	local64_add(new - prev, &event->count);
+	/* GT frequency is not a monotonically increasing counter, so record the
+	 * instantaneous value instead.
+	 */
+	if (is_gt_frequency_event(event))
+		local64_add(new, &event->count);
+	else
+		local64_add(new - prev, &event->count);
 }
 
 static void xe_pmu_event_read(struct perf_event *event)
@@ -443,6 +468,10 @@ static ssize_t event_attr_show(struct device *dev,
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
 XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
 XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -458,6 +487,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
 	&pmu_group_engine_active_ticks,
 	&pmu_group_engine_total_ticks,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -466,8 +497,11 @@ static void set_supported_events(struct xe_pmu *pmu)
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 
-	if (!xe->info.skip_guc_pc)
+	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
+	}
 
 	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
-- 
2.38.1

