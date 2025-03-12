Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D5C282EC
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 00:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5180810E037;
	Wed, 12 Mar 2025 00:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBrsuSb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1629A10E037
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741738686; x=1773274686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T4UeJIM4QDnVfDdzUWaju+U2ueDGgkclpGQ+2qWL8Uo=;
 b=fBrsuSb2yFrN3XQIxoG4I87PIj2q1TvOgYBJFKvth4pKV/A/FKlwZKJV
 qqxs+gN3P+RI9jtH/ldToXW0mvuezaqnh7yTd3T6XKv2Qw5aKDKkM4WtW
 cbGKJQ9RGe+DDRVnZ0lOA9lo5coEZEs1qjOjcU6AxPfdGAy2AaSVGm/m0
 Mbb2GdUp9m+4wCz2Hg6lGQUWdN13bEbUxzuysqGPFkCUHaSiYxAHetwvQ
 DQifrFLYpjjKHjRHCIP+2VzlKx8MdIO54tDIN3fNquKjEw+oa6cmMRxjr
 qaLJQS+9SpNpOugctqFNOaY+l6e7A5K3jDwmCaXb3m+Qx4V4BAbYNwy1P g==;
X-CSE-ConnectionGUID: RNmQsq1LTruRxy8RtujYXw==
X-CSE-MsgGUID: TWpSN9DfQkmfjUQpQXPPpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="45582044"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="45582044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 17:18:05 -0700
X-CSE-ConnectionGUID: PzM9NvsSTwaKyb80vPhlPA==
X-CSE-MsgGUID: RIvpNgbZSu6be1+jw8LyvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="120433136"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 11 Mar 2025 17:18:04 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/pmu: Add GT frequency events
Date: Tue, 11 Mar 2025 17:14:08 -0700
Message-Id: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
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

Actual frequencies will be reported as 0 when GT is in C6.

v2: Use locks while storing/reading samples, keep track of multiple
clients (Lucas) and other general cleanup.
v3: Review comments (Lucas) and use event counts instead of mask for
active events.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 178 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  29 +++++
 2 files changed, 197 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 4f62a6e515d6..d4c639369709 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -10,7 +10,9 @@
 #include "xe_force_wake.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
+#include "xe_guc_pc.h"
 #include "xe_hw_engine.h"
+#include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
@@ -52,6 +54,7 @@
 #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
 #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
 #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
+#define XE_HRTIMER_INTERVAL_NS		5000000
 
 static unsigned int config_to_event_id(u64 config)
 {
@@ -76,10 +79,12 @@ static unsigned int config_to_gt_id(u64 config)
 #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
 #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
 #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	u64 gt = config_to_gt_id(event->attr.config);
 
 	return xe_device_get_gt(xe, gt);
@@ -179,7 +184,7 @@ static bool event_param_valid(struct perf_event *event)
 
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	struct xe_gt *gt;
 	unsigned int *fw_ref = event->pmu_private;
 
@@ -197,7 +202,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 static int xe_pmu_event_init(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 	unsigned int id, gt;
 
@@ -219,6 +224,9 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!event_supported(pmu, gt, id))
 		return -ENOENT;
 
+	if (XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES))
+		return -EINVAL;
+
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
 
@@ -239,6 +247,30 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static u64
+xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
+{
+	unsigned long flags;
+	u64 val;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+	val = pmu->event_sample[gt_id][id];
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+
+	return val;
+}
+
+static void
+xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
+		    uint32_t val, uint32_t period)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+	pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 {
 	struct xe_hw_engine *hwe;
@@ -256,16 +288,23 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
+	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
+	unsigned long id;
 
 	if (!gt)
 		return 0;
 
-	switch (config_to_event_id(event->attr.config)) {
+	id = config_to_event_id(event->attr.config);
+
+	switch (id) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		return xe_gt_idle_residency_msec(&gt->gtidle);
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		return read_engine_events(gt, event);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		return div_u64(xe_get_pmu_sample(pmu, gt->info.id, id), NSEC_PER_SEC);
 	}
 
 	return 0;
@@ -286,7 +325,7 @@ static void xe_pmu_event_update(struct perf_event *event)
 
 static void xe_pmu_event_read(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 
 	if (!pmu->registered) {
@@ -297,8 +336,89 @@ static void xe_pmu_event_read(struct perf_event *event)
 	xe_pmu_event_update(event);
 }
 
+static void xe_pmu_start_timer(struct xe_pmu *pmu)
+{
+	/* Timer is per device */
+	if (!pmu->timer_enabled) {
+		pmu->timer_enabled = true;
+		pmu->timer_last = ktime_get();
+		hrtimer_start_range_ns(&pmu->timer,
+				       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
+				       HRTIMER_MODE_REL_PINNED);
+	}
+}
+
+static void
+xe_sample_gt_frequency(struct xe_pmu *pmu, uint32_t period_ns)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt;
+	uint32_t act_freq, cur_freq;
+	int ret;
+	int i;
+
+	/* Sample each event type once */
+	for_each_gt(gt, xe, i) {
+		if (pmu->active_count[i][XE_PMU_EVENT_GT_ACTUAL_FREQUENCY]) {
+			/* Actual freq will be 0 when GT is in C6 */
+			act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+			xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
+					    act_freq, period_ns);
+		}
+
+		if (pmu->active_count[i][XE_PMU_EVENT_GT_REQUESTED_FREQUENCY]) {
+			ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
+			if (!ret)
+				xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+						    cur_freq, period_ns);
+		}
+	}
+}
+
+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
+{
+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	u64 time_diff_ns;
+	ktime_t now;
+
+	if (!READ_ONCE(pmu->timer_enabled))
+		return HRTIMER_NORESTART;
+
+	now = ktime_get();
+	time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
+	pmu->timer_last = now;
+
+	xe_sample_gt_frequency(pmu, time_diff_ns);
+
+	hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
+
+	return HRTIMER_RESTART;
+}
+
+static bool is_gt_frequency_event(uint32_t id)
+{
+	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
+	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
+}
+
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_gt *gt = event_to_gt(event);
+	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
+	uint32_t id = config_to_event_id(event->attr.config);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	if (is_gt_frequency_event(id)) {
+		pmu->active_count[gt->info.id][id]++;
+		/* Start a timer, if needed, to collect samples */
+		if (pmu->n_active++ == 0)
+			xe_pmu_start_timer(pmu);
+	}
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -309,7 +429,7 @@ static void xe_pmu_enable(struct perf_event *event)
 
 static void xe_pmu_event_start(struct perf_event *event, int flags)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 
 	if (!pmu->registered)
@@ -319,21 +439,43 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 	event->hw.state = 0;
 }
 
+static void xe_pmu_disable(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
+	struct xe_gt *gt = event_to_gt(event);
+	struct xe_pmu *pmu = &xe->pmu;
+	uint32_t id = config_to_event_id(event->attr.config);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	if (is_gt_frequency_event(id)) {
+		pmu->active_count[gt->info.id][id]--;
+		if (--pmu->n_active == 0)
+			pmu->timer_enabled = false;
+	}
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static void xe_pmu_event_stop(struct perf_event *event, int flags)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
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
 
 static int xe_pmu_event_add(struct perf_event *event, int flags)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
 	struct xe_pmu *pmu = &xe->pmu;
 
 	if (!pmu->registered)
@@ -419,6 +561,10 @@ static ssize_t event_attr_show(struct device *dev,
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
 XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
 XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -434,6 +580,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
 	&pmu_group_engine_active_ticks,
 	&pmu_group_engine_total_ticks,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -442,8 +590,11 @@ static void set_supported_events(struct xe_pmu *pmu)
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
@@ -463,6 +614,8 @@ static void xe_pmu_unregister(void *arg)
 	if (!pmu->registered)
 		return;
 
+	hrtimer_cancel(&pmu->timer);
+
 	pmu->registered = false;
 
 	perf_pmu_unregister(&pmu->base);
@@ -491,6 +644,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
+	raw_spin_lock_init(&pmu->lock);
+
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
+
 	name = kasprintf(GFP_KERNEL, "xe_%s",
 			 dev_name(xe->drm.dev));
 	if (!name)
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..59ed9d8b4ed8 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -10,6 +10,7 @@
 #include <linux/spinlock_types.h>
 
 #define XE_PMU_MAX_GT 2
+#define XE_PMU_MAX_EVENT_TYPES 64
 
 /**
  * struct xe_pmu - PMU related data per Xe device
@@ -34,6 +35,34 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @lock: Lock protecting enable counts and sampling.
+	 */
+	raw_spinlock_t lock;
+	/**
+	 * @n_active: Total number of active events that need timer.
+	 */
+	unsigned int n_active;
+	/**
+	 * @active_count: Counts per GT/type of event that need timer.
+	 */
+	unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
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
+	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
 };
 
 #endif
-- 
2.38.1

