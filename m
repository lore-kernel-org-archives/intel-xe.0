Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C7C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 23:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD7110E4F4;
	Mon, 24 Mar 2025 23:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3XgPrXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7772010E4F4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 23:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742858888; x=1774394888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gsPZcttfdG82+1W/gBlOb3ILMMs5nXRcVl6oYrjIgE0=;
 b=P3XgPrXHEqDdKIMfe67Cki6SdaZkR06eVIgTdVPqZDl5qqB26oxlr3kB
 VyWKfB96ffEsklCmU0qdr0D0Ujc1nYZKeQUIIJGUChrf/Gl2a3GuivhmT
 dNpAp7KcARaw2a/esQTjY60aGI2fX+jqXjoebr9SnaXMtGm40GT6me+9A
 0KsXXe68MVn8O41cFWSyPjog89Bjs70cKSKwKqq7HvWf2W0qG89fhVdob
 VXk475bBQi39DRjFcHuxx9tU3J4K2QknfudMUe+abhaULvFYLL5RTm8lr
 ShSbyWY061wo7fUg/dWtU/ovODmxgd5gHwSftdIQU+VZFSRPRoarYll2v Q==;
X-CSE-ConnectionGUID: NKHN+d8lTUax+7/kvmb7IQ==
X-CSE-MsgGUID: y9JovdhBRMeSSg6nErtQkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44245157"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="44245157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 16:28:07 -0700
X-CSE-ConnectionGUID: X/wiN8/ARJ+KgFQU1qLZFA==
X-CSE-MsgGUID: Pq8GujfiRy2O8MvvTPq0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="161410889"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Mar 2025 16:28:06 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4] drm/xe/pmu: Add GT frequency events
Date: Mon, 24 Mar 2025 16:24:02 -0700
Message-Id: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
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

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 40 +++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 4f62a6e515d6..4e2e891e7655 100644
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
@@ -76,6 +77,8 @@ static unsigned int config_to_gt_id(u64 config)
 #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
 #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
 #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
@@ -163,6 +166,8 @@ static bool event_param_valid(struct perf_event *event)
 	engine_instance = config_to_engine_instance(config);
 
 	switch (config_to_event_id(config)) {
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		if (engine_class || engine_instance)
 			return false;
@@ -172,6 +177,8 @@ static bool event_param_valid(struct perf_event *event)
 		if (!event_to_hwe(event))
 			return false;
 		break;
+	default:
+		return false;
 	}
 
 	return true;
@@ -256,6 +263,7 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
+	u32 cur_gt_freq;
 
 	if (!gt)
 		return 0;
@@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		return read_engine_events(gt, event);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
+			return cur_gt_freq;
 	}
 
 	return 0;
 }
 
+static bool is_gt_frequency_event(struct perf_event *event)
+{
+	uint32_t id = config_to_event_id(event->attr.config);
+
+	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
+	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
+}
+
 static void xe_pmu_event_update(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -281,7 +302,13 @@ static void xe_pmu_event_update(struct perf_event *event)
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
@@ -419,6 +446,10 @@ static ssize_t event_attr_show(struct device *dev,
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
 XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
 XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -434,6 +465,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
 	&pmu_group_engine_active_ticks,
 	&pmu_group_engine_total_ticks,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -442,8 +475,11 @@ static void set_supported_events(struct xe_pmu *pmu)
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

