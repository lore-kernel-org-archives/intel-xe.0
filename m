Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED40C02190
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 04:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324EC10E181;
	Fri, 31 Jan 2025 04:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYXYwpkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8ED10E181
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 04:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738299062; x=1769835062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/AxXEp+BR48kzcM/TRv2kv5yzSoTZiXISePwDkOxfFc=;
 b=dYXYwpkqi0+0+Kk2awoFjQa/yrlTnA53NeiN/grXp+UmoDrV+htZedhW
 o2EKOMUjbhOA0dFBKChmuMEqEXhc21a6vtCYiVZ0m5ahI8/ABAgONqR3F
 Gk2qt4PU1TVFPfuHOeL76Nm3y6Z50hpA+vUASQoni9o3GV605o7e2w+8f
 DtkBU19lFQvNUsIiw0928rcsAN+ZscUMYgE61O1Oe8VTwMicRCAPxA5al
 lKbMCM7koIZqTFFa0sJ0M0LTqtr8KR9wP1gL0YsdIhNPx8yqNpSQALEMz
 JwMeCv9DMJplSKfVa5cCCynXYcT3O9Aaxx0HjZenDYrFwlT8/A62DczOZ A==;
X-CSE-ConnectionGUID: vWHe9YheTdKXXbEpMs8VIQ==
X-CSE-MsgGUID: Y/oL6XKhQ4mB1Vvs6QCGnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49129427"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="49129427"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 20:51:01 -0800
X-CSE-ConnectionGUID: O96F70kuQrCY7Vaz2l3xJw==
X-CSE-MsgGUID: qKsdaXNyQ1y3bb4BZIXIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="110105744"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2025 20:51:01 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pmu: Add GT frequency events
Date: Thu, 30 Jan 2025 20:47:28 -0800
Message-Id: <20250131044728.4107618-1-vinay.belgaumkar@intel.com>
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

Define PMU events for GT frequency (actual and requested). This is
a port from the i915 driver implementation, where an internal timer
is used to aggregate GT frequencies over certain fixed interval.
Following PMU events are being added-

  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]

Standard perf commands can be used to monitor GT frequency-
  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000

     1.001175175                700 M    xe/gt-requested-frequency,gt=0/
     2.005891881                703 M    xe/gt-requested-frequency,gt=0/
     3.007318169                700 M    xe/gt-requested-frequency,gt=0/

Actual frequencies will be reported as 0 when GT is suspended.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 157 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++++
 2 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3910a82328ee..31ce575c834f 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -8,6 +8,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
@@ -37,6 +38,12 @@
 
 #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
 #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
+#define SAMPLING_TIMER_FREQUENCY_HZ	200
+
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct xe_pmu, base);
+}
 
 static unsigned int config_to_event_id(u64 config)
 {
@@ -49,6 +56,8 @@ static unsigned int config_to_gt_id(u64 config)
 }
 
 #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x04
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
@@ -113,9 +122,18 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
+{
+	return pmu->event_sample[gt_id][sample];
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	u64 gt_id = gt->info.id;
 
 	if (!gt)
 		return 0;
@@ -123,6 +141,14 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	switch (config_to_event_id(event->attr.config)) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		return xe_gt_idle_residency_msec(&gt->gtidle);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+		return div_u64(read_sample(pmu, gt_id,
+			       __XE_SAMPLE_FREQ_ACT),
+			       USEC_PER_SEC /* to MHz */);
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		return div_u64(read_sample(pmu, gt_id,
+			       __XE_SAMPLE_FREQ_REQ),
+			       USEC_PER_SEC /* to MHz */);
 	}
 
 	return 0;
@@ -154,8 +180,109 @@ static void xe_pmu_event_read(struct perf_event *event)
 	xe_pmu_event_update(event);
 }
 
+#define CONFIG_EVENT_ENABLED(config, event) \
+	(FIELD_GET(XE_PMU_EVENT_ID_MASK, config) & event)
+
+#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
+	(CONFIG_EVENT_ENABLED(config, event) && \
+	(FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))
+
+static bool pmu_needs_timer(struct xe_pmu *pmu)
+{
+	return CONFIG_EVENT_ENABLED(pmu->enable,
+				    (XE_PMU_EVENT_GT_ACTUAL_FREQUENCY |
+				     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY));
+}
+
+static void xe_pmu_start_timer(struct xe_pmu *pmu)
+{
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
+
+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
+		pmu->timer_enabled = true;
+		pmu->timer_last = ktime_get();
+		hrtimer_start_range_ns(&pmu->timer,
+				       ns_to_ktime(period), 0,
+				       HRTIMER_MODE_REL_PINNED);
+	}
+}
+
+static void
+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
+{
+	pmu->event_sample[gt_id][sample] += mul_u32_u32(val, mul);
+}
+
+static void
+frequency_sample(struct xe_gt *gt, unsigned int period_ns)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+	int ret;
+	u32 cur_freq;
+
+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
+		u32 val;
+
+		/* Actual freq will be 0 when GT is in C6 */
+		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+
+		add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_ACT,
+				val, period_ns / 1000);
+	}
+
+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+				    gt->info.id)) {
+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
+		if (!ret)
+			add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_REQ,
+					cur_freq,
+					period_ns / 1000);
+	}
+}
+
+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
+{
+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
+	unsigned int period_ns;
+	struct xe_gt *gt;
+	ktime_t now;
+	unsigned int i;
+
+	if (!READ_ONCE(pmu->timer_enabled))
+		return HRTIMER_NORESTART;
+
+	now = ktime_get();
+	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
+	pmu->timer_last = now;
+
+	/*
+	 * The passed in period includes the time needed for grabbing the forcewake.
+	 * However, the potential error from timer callback delay greatly dominates
+	 * this so we keep it simple.
+	 */
+
+	for_each_gt(gt, xe, i)
+		frequency_sample(gt, period_ns);
+
+	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
+
+	return HRTIMER_RESTART;
+}
+
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_pmu *pmu = event_to_pmu(event);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	/* Save the event config */
+	pmu->enable |= event->attr.config;
+
+	/* Start a timer, if needed, to collect samples */
+	xe_pmu_start_timer(pmu);
+
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -176,15 +303,27 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 	event->hw.state = 0;
 }
 
+static void xe_pmu_disable(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	pmu->enable &=  ~event->attr.config;
+	pmu->timer_enabled &= pmu_needs_timer(pmu);
+}
+
 static void xe_pmu_event_stop(struct perf_event *event, int flags)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 
-	if (pmu->registered)
+	if (pmu->registered) {
 		if (flags & PERF_EF_UPDATE)
 			xe_pmu_event_update(event);
 
+		xe_pmu_disable(event);
+	}
+
 	event->hw.state = PERF_HES_STOPPED;
 }
 
@@ -270,6 +409,10 @@ static ssize_t event_attr_show(struct device *dev,
 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
 
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -283,6 +426,8 @@ static const struct attribute_group pmu_events_attr_group = {
 
 static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -290,8 +435,11 @@ static void set_supported_events(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
 
-	if (!xe->info.skip_guc_pc)
+	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
+	}
 }
 
 /**
@@ -306,6 +454,8 @@ static void xe_pmu_unregister(void *arg)
 	if (!pmu->registered)
 		return;
 
+	hrtimer_cancel(&pmu->timer);
+
 	pmu->registered = false;
 
 	perf_pmu_unregister(&pmu->base);
@@ -334,6 +484,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
+
 	name = kasprintf(GFP_KERNEL, "xe_%s",
 			 dev_name(xe->drm.dev));
 	if (!name)
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..8dc235e1b6d3 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -9,6 +9,12 @@
 #include <linux/perf_event.h>
 #include <linux/spinlock_types.h>
 
+enum {
+	__XE_SAMPLE_FREQ_ACT,
+	__XE_SAMPLE_FREQ_REQ,
+	__XE_NUM_PMU_SAMPLERS
+};
+
 #define XE_PMU_MAX_GT 2
 
 /**
@@ -34,6 +40,26 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @timer: Timer for sampling GT frequency.
+	 */
+	struct hrtimer timer;
+	/**
+	 * @timer_last: Timestmap of the previous timer invocation.
+	 */
+	ktime_t timer_last;
+	/**
+	 * @timer_enabled: Should the internal sampling timer be running.
+	 */
+	bool timer_enabled;
+	/**
+	 * @event_sample: Store freq related counters.
+	 */
+	u64 event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
+	/**
+	 * @enable: Store requested PMU event config.
+	 */
+	u64 enable;
 };
 
 #endif
-- 
2.38.1

