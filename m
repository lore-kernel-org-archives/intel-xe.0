Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4913C02198
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 00:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87C310E338;
	Thu, 13 Feb 2025 00:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdeORBoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B0E10E9B0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739405161; x=1770941161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=glpNMYnOkXGFSOWoSq45eCl9w6CynMAycD4vBIUrmts=;
 b=TdeORBoqJuwUeSGIHNuB8DCRpTKQNJS/bzPCn0//0KjEvrNwpSU+pG9k
 ZvGmwEpJYQlSTg/wTI302wR5zq3rSoEZhAFykh+D0MZmfBbTjg0uMxaW4
 9DxbPKsXPQ9fI2/fR3+9iUMBW9O37DGZeE8dYzxIkwoqOOB7FMS99hmcV
 37YRkCzsy66F1PatMUpk3tnuVpLoF7/z9vb8nTa8WGLHotGibllZrxzDR
 bZ5kgwBCGPgNMaIn74TBoCpWMw3wxxCU6k94fzRRMdHG+IK3CEhLQXyzM
 02ZQKKm05xqUwOYrxGoH0uKiRXhWdTB7slIhU1VwNhkVNxEfqUT0fAuqk g==;
X-CSE-ConnectionGUID: Jg2cECpdQ0u9MBW84/IWxg==
X-CSE-MsgGUID: nQcziCRsT0+sm1ci9if2kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65445181"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65445181"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:06:00 -0800
X-CSE-ConnectionGUID: eVEdh/rkRWCioeKRewzvcg==
X-CSE-MsgGUID: 8eeQMmG0TdiKaDf0qJW2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113879638"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa008.jf.intel.com with ESMTP; 12 Feb 2025 16:06:00 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/pmu: Add GT frequency events
Date: Wed, 12 Feb 2025 16:02:20 -0800
Message-Id: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
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

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
 2 files changed, 230 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3910a82328ee..ed76756403ea 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -8,6 +8,8 @@
 
 #include "xe_device.h"
 #include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
+#include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
 
@@ -37,6 +39,17 @@
 
 #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
 #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
+#define XE_HRTIMER_INTERVAL_NS		5000000
+
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, typeof(struct xe_pmu), base);
+}
+
+static struct xe_device *event_to_xe(struct perf_event *event)
+{
+	return container_of(event->pmu, typeof(struct xe_device), pmu.base);
+}
 
 static unsigned int config_to_event_id(u64 config)
 {
@@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
 }
 
 #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x03
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 	u64 gt = config_to_gt_id(event->attr.config);
 
 	return xe_device_get_gt(xe, gt);
@@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 
 	drm_WARN_ON(&xe->drm, event->parent);
 	xe_pm_runtime_put(xe);
@@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 static int xe_pmu_event_init(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 	struct xe_pmu *pmu = &xe->pmu;
 	unsigned int id, gt;
 
@@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
 
+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
+
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
 		xe_pm_runtime_get(xe);
@@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct perf_event *event)
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
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
+	struct xe_device *xe = event_to_xe(event);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long id;
 
 	if (!gt)
 		return 0;
 
-	switch (config_to_event_id(event->attr.config)) {
+	id = config_to_event_id(event->attr.config);
+
+	switch (id) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		return xe_gt_idle_residency_msec(&gt->gtidle);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
+			       id),
+			       USEC_PER_SEC /* to MHz */);
 	}
 
 	return 0;
@@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct perf_event *event)
 
 static void xe_pmu_event_read(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 	struct xe_pmu *pmu = &xe->pmu;
 
 	if (!pmu->registered) {
@@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct perf_event *event)
 	xe_pmu_event_update(event);
 }
 
+static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, uint32_t gt_id)
+{
+	return pmu->active_mask[gt_id] & BIT_ULL(id);
+}
+
+static bool pmu_needs_timer(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt;
+	int i;
+
+	for_each_gt(gt, xe, i)
+		if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
+		    gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
+			return true;
+
+	return false;
+}
+
+static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
+{
+	/* Timer is per device */
+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
+		pmu->timer_enabled = true;
+		pmu->timer_last = ktime_get();
+		hrtimer_start_range_ns(&pmu->timer,
+				       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
+				       HRTIMER_MODE_REL_PINNED);
+	}
+}
+
+static void
+xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+	uint32_t act_freq, cur_freq;
+	int ret;
+
+	if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
+
+		/* Actual freq will be 0 when GT is in C6 */
+		act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+		xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
+				 act_freq, period_ns / NSEC_PER_USEC);
+	}
+
+	if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
+		if (!ret)
+			xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+					 cur_freq, period_ns / NSEC_PER_USEC);
+	}
+}
+
+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
+{
+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	u64 time_diff_ns;
+	struct xe_gt *gt;
+	ktime_t now;
+	int i;
+
+	if (!READ_ONCE(pmu->timer_enabled))
+		return HRTIMER_NORESTART;
+
+	now = ktime_get();
+	time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
+	pmu->timer_last = now;
+
+	/*
+	 * The passed in period includes the time needed for grabbing the forcewake.
+	 */
+	for_each_gt(gt, xe, i)
+		xe_sample_gt_frequency(gt, time_diff_ns);
+
+	hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
+
+	return HRTIMER_RESTART;
+}
+
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_pmu *pmu = event_to_pmu(event);
+	struct xe_gt *gt = event_to_gt(event);
+	uint32_t id = config_to_event_id(event->attr.config);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	/* Update event mask */
+	pmu->active_mask[gt->info.id] |= BIT_ULL(id);
+	pmu->n_active[gt->info.id][id]++;
+
+	/* Start a timer, if needed, to collect samples */
+	xe_pmu_start_timer(pmu, gt->info.id);
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event *event)
 
 static void xe_pmu_event_start(struct perf_event *event, int flags)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 	struct xe_pmu *pmu = &xe->pmu;
 
 	if (!pmu->registered)
@@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
 	event->hw.state = 0;
 }
 
+static void xe_pmu_disable(struct perf_event *event)
+{
+	struct xe_device *xe = event_to_xe(event);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long flags;
+	uint32_t id = config_to_event_id(event->attr.config);
+	uint32_t gt_id = config_to_gt_id(event->attr.config);
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	if (--pmu->n_active[gt_id][id] == 0) {
+		pmu->active_mask[gt_id] &= ~BIT_ULL(id);
+		pmu->timer_enabled &= pmu_needs_timer(pmu);
+	}
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static void xe_pmu_event_stop(struct perf_event *event, int flags)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = event_to_xe(event);
 	struct xe_pmu *pmu = &xe->pmu;
+	uint32_t id = config_to_event_id(event->attr.config);
+
+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
 
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
+	struct xe_device *xe = event_to_xe(event);
 	struct xe_pmu *pmu = &xe->pmu;
+	uint32_t id = config_to_event_id(event->attr.config);
 
 	if (!pmu->registered)
 		return -ENODEV;
 
+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
+
 	if (flags & PERF_EF_START)
 		xe_pmu_event_start(event, flags);
 
@@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device *dev,
 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
 
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -283,6 +462,8 @@ static const struct attribute_group pmu_events_attr_group = {
 
 static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -290,8 +471,11 @@ static void set_supported_events(struct xe_pmu *pmu)
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
@@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
 	if (!pmu->registered)
 		return;
 
+	hrtimer_cancel(&pmu->timer);
+
 	pmu->registered = false;
 
 	perf_pmu_unregister(&pmu->base);
@@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
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
index f5ba4d56622c..cd68cba58693 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -10,6 +10,7 @@
 #include <linux/spinlock_types.h>
 
 #define XE_PMU_MAX_GT 2
+#define XE_PMU_MAX_EVENT_TYPES	64
 
 /**
  * struct xe_pmu - PMU related data per Xe device
@@ -34,6 +35,34 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @lock: Lock protecting enable mask and sampling
+	 */
+	raw_spinlock_t lock;
+	/**
+	 * @active_mask: Bit representation of active events
+	 */
+	u64 active_mask[XE_PMU_MAX_GT];
+	/**
+	 * @n_active: Counts for the enabled events
+	 */
+	unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
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

