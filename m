Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D85C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACAE10E37B;
	Tue,  4 Feb 2025 18:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nk2z9sa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D48F10E6D8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692769; x=1770228769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1GPURZ0j6KT6q1pbMADWc8BTkGjHkoa6aHhL7vlQqk=;
 b=Nk2z9sa0vj/yg9h7D+glJSG1jlgdPeSmAAXCj4tYdAx5bAEA91fRyFOF
 rGz+kaqavEsymvnWGnWdYyllBpgXdC39TS4PQEfgveeBfv821rwPI/BPT
 +6CULilDgT7ew0I3RFkxRVGvtDGzKNh7N2r/oLgdn4gFWPRKhnv8sKSSj
 H7aXgjdidE+pBW4lnANinSzjNlIoimKEqQFFyKaKx4ibEW0g+uXPDz/Os
 i41TXmPe8FnzwNXXBi+JxM+I4kyOYnc9bXjkaGAuLYEqe90AslziZli46
 IuCMfpOVqt7aow/tmCLqn5mxnVVSbykYLs8vUAdSeieHVAL28+8c/hZhA A==;
X-CSE-ConnectionGUID: Vxfh/N9xSkqy2XrC0QnVcw==
X-CSE-MsgGUID: S76QWtkwRuy3p0E2M5uuig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39374706"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39374706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:49 -0800
X-CSE-ConnectionGUID: bHWyZGSgSqmDgjc6I2EwjA==
X-CSE-MsgGUID: 6JCyG8QMQCG5iac4RGOVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110656174"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 04 Feb 2025 10:12:48 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe/pmu: Add GT frequency events
Date: Tue,  4 Feb 2025 10:09:05 -0800
Message-Id: <20250204180905.1347210-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
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

v2: Use locks while storing samples, keep track of multiple clients (Lucas)

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 140 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h |  16 ++++
 2 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 10603e7c3eff..95ebdbd40930 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -8,6 +8,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
@@ -38,6 +39,7 @@
 
 #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
 #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
+#define SAMPLING_TIMER_FREQUENCY_HZ	200
 
 static struct xe_pmu *event_to_pmu(struct perf_event *event)
 {
@@ -55,6 +57,8 @@ static unsigned int config_to_gt_id(u64 config)
 }
 
 #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x03
 
 static struct xe_gt *event_to_gt(struct perf_event *event)
 {
@@ -119,16 +123,45 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static u64 get_stored_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
+{
+	return pmu->event_sample[gt_id][sample];
+}
+
+static void
+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+	pmu->event_sample[gt_id][sample] += mul_u32_u32(val, mul);
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned long event_id;
+	u64 gt_id;
 
 	if (!gt)
 		return 0;
+	else
+		gt_id = gt->info.id;
+
+	event_id = config_to_event_id(event->attr.config);
 
-	switch (config_to_event_id(event->attr.config)) {
+	switch (event_id) {
 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
 		return xe_gt_idle_residency_msec(&gt->gtidle);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
+		return div_u64(get_stored_sample(pmu, gt_id,
+			       event_id),
+			       USEC_PER_SEC /* to MHz */);
 	}
 
 	return 0;
@@ -160,6 +193,87 @@ static void xe_pmu_event_read(struct perf_event *event)
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
+		add_sample_mult(pmu, gt->info.id, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
+				val, period_ns / 1000);
+	}
+
+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+				    gt->info.id)) {
+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
+		if (!ret)
+			add_sample_mult(pmu, gt->info.id, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
+					cur_freq, period_ns / 1000);
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
+	 */
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
 	struct xe_pmu *pmu = event_to_pmu(event);
@@ -176,6 +290,9 @@ static void xe_pmu_enable(struct perf_event *event)
 	pmu->enable |= event->attr.config;
 	pmu->enable_count[event_bit]++;
 
+	/* Start a timer, if needed, to collect samples */
+	xe_pmu_start_timer(pmu);
+
 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 	/*
 	 * Store the current counter value so we can report the correct delta
@@ -205,10 +322,13 @@ static void xe_pmu_disable(struct perf_event *event)
 	unsigned int event_bit = config_to_event_id(event->attr.config);
 
 	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
+
 	raw_spin_lock_irqsave(&pmu->lock, flags);
 
-	if (--pmu->enable_count[event_bit] == 0)
+	if (--pmu->enable_count[event_bit] == 0) {
 		pmu->enable &=  ~event->attr.config;
+		pmu->timer_enabled &= pmu_needs_timer(pmu);
+	}
 
 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 }
@@ -310,6 +430,10 @@ static ssize_t event_attr_show(struct device *dev,
 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
 
 XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
 
 static struct attribute *pmu_empty_event_attrs[] = {
 	/* Empty - all events are added as groups with .attr_update() */
@@ -323,6 +447,8 @@ static const struct attribute_group pmu_events_attr_group = {
 
 static const struct attribute_group *pmu_events_attr_update[] = {
 	&pmu_group_gt_c6_residency,
+	&pmu_group_gt_actual_frequency,
+	&pmu_group_gt_requested_frequency,
 	NULL,
 };
 
@@ -330,8 +456,11 @@ static void set_supported_events(struct xe_pmu *pmu)
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
@@ -346,6 +475,8 @@ static void xe_pmu_unregister(void *arg)
 	if (!pmu->registered)
 		return;
 
+	hrtimer_cancel(&pmu->timer);
+
 	pmu->registered = false;
 
 	perf_pmu_unregister(&pmu->base);
@@ -376,6 +507,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
 
 	raw_spin_lock_init(&pmu->lock);
 
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
+
 	name = kasprintf(GFP_KERNEL, "xe_%s",
 			 dev_name(xe->drm.dev));
 	if (!name)
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index b15858d4d4a9..808d0e854f75 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -48,6 +48,22 @@ struct xe_pmu {
 	 * @enable_count: Reference counts for the enabled events.
 	 */
 	unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
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

